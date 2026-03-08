#!/usr/bin/env node
/**
 * enrich-sheet-names.js
 *
 * Builds asset-catalog.json — the single source of truth for the entire
 * Two Fires asset pipeline. Walks all downloaded sprite folders, fetches
 * each game's TSR page to recover sheet names, and writes a comprehensive
 * catalog entry for every PNG.
 *
 * This file is read by:
 *   - analyze-sprites.js   (adds programmatic_tags)
 *   - tag-sprites.js       (adds vision_tags via Claude Haiku)
 *   - Asset Resolver        (Track A lookups at runtime)
 *   - VME                   (Track B distributional knowledge)
 *
 * Usage:
 *   node tools/enrich-sheet-names.js                    # all platforms
 *   node tools/enrich-sheet-names.js --platform=nes     # single platform
 *   node tools/enrich-sheet-names.js --resume           # skip already-enriched games
 *   node tools/enrich-sheet-names.js --local-only       # skip TSR fetch, use folder names only
 *
 * Output:
 *   data/assets/asset-catalog.json   (committed to git)
 *
 * Safe to run while sprite scraper is downloading PC games — this script
 * only fetches game PAGES (not images) for platforms already downloaded.
 */

import {
  readFileSync, writeFileSync, mkdirSync, existsSync, statSync,
  readdirSync,
} from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname  = dirname(__filename);
const ROOT       = join(__dirname, '..');

// ---------------------------------------------------------------------------
// Platform definitions (must match scrape-sprites.js)
// ---------------------------------------------------------------------------

const PLATFORMS = [
  { tsr: 'nes',              local: 'nes',            name: 'NES' },
  { tsr: 'snes',             local: 'snes',           name: 'SNES' },
  { tsr: 'game_boy_gbc',     local: 'gameboy-gbc',    name: 'Game Boy / GBC' },
  { tsr: 'game_boy_advance', local: 'gba',            name: 'Game Boy Advance' },
  { tsr: 'sega_genesis',     local: 'genesis',        name: 'Genesis / Mega Drive' },
  { tsr: 'master_system',    local: 'master-system',  name: 'Master System' },
  { tsr: 'sega_cd',          local: 'sega-cd',        name: 'Sega CD' },
  { tsr: 'game_gear',        local: 'game-gear',      name: 'Game Gear' },
  { tsr: 'turbografx_16',    local: 'turbografx-16',  name: 'TurboGrafx-16' },
  { tsr: 'neo_geo_ngcd',     local: 'neo-geo',        name: 'Neo Geo / NGCD' },
  { tsr: 'arcade',           local: 'arcade',         name: 'Arcade' },
  { tsr: 'ms_dos',           local: 'dos',            name: 'DOS / PC' },
];

// ---------------------------------------------------------------------------
// Config
// ---------------------------------------------------------------------------

const BASE_URL     = 'https://www.spriters-resource.com';
const ASSETS_DIR   = join(ROOT, 'data/assets');
const SPRITES_DIR  = join(ASSETS_DIR, 'sprites');
const STATE_FILE   = join(ASSETS_DIR, 'scrape-state.json');
const CATALOG_FILE = join(ASSETS_DIR, 'asset-catalog.json');

const RATE_LIMIT_MS = 1500;

// ---------------------------------------------------------------------------
// CLI args
// ---------------------------------------------------------------------------

const args = Object.fromEntries(
  process.argv.slice(2)
    .filter(a => a.startsWith('--'))
    .map(a => {
      const [k, v] = a.slice(2).split('=');
      return [k, v ?? true];
    })
);

const PLATFORM_FILTER = args.platform || null;
const RESUME          = !!args.resume;
const LOCAL_ONLY      = !!args['local-only'];

// ---------------------------------------------------------------------------
// Utilities
// ---------------------------------------------------------------------------

function log(msg) {
  const ts = new Date().toISOString().slice(11, 19);
  console.log(`[${ts}] ${msg}`);
}

function sleep(ms) {
  return new Promise(r => setTimeout(r, ms));
}

function decodeHtmlEntities(str) {
  return str
    .replace(/&#039;/g, "'")
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&#(\d+);/g, (_, n) => String.fromCharCode(parseInt(n)));
}

function readPngDimensions(filePath) {
  try {
    const buf = readFileSync(filePath);
    if (buf.length < 24) return null;
    if (buf[0] !== 0x89 || buf[1] !== 0x50) return null;
    return {
      width:  buf.readUInt32BE(16),
      height: buf.readUInt32BE(20),
    };
  } catch { return null; }
}

// ---------------------------------------------------------------------------
// TSR page parsing (reused from scrape-sprites.js)
// ---------------------------------------------------------------------------

function parseGamePage(html, platformTsr, tsrSlug) {
  const assets = [];
  const seen = new Set();

  const sectionRe = /<div class="section [^"]*" id="section-\d+"/g;
  const sectionStarts = [];
  let sm;
  while ((sm = sectionRe.exec(html)) !== null) {
    sectionStarts.push(sm.index);
  }

  if (sectionStarts.length > 0) {
    for (let i = 0; i < sectionStarts.length; i++) {
      const chunkStart = sectionStarts[i];
      const chunkEnd = i + 1 < sectionStarts.length ? sectionStarts[i + 1] : html.length;
      const chunk = html.slice(chunkStart, chunkEnd);

      let category = 'Miscellaneous';
      const catMatch = chunk.match(/asset-count[^>]*>\[\d+\]<\/span>\s*\n([^\n<]{2,80})/);
      if (catMatch) {
        category = decodeHtmlEntities(catMatch[1].trim().replace(/\s+/g, ' '));
      }

      extractAssetsFromChunk(chunk, platformTsr, tsrSlug, category, assets, seen);
    }
  } else {
    parseGamePageFallback(html, platformTsr, tsrSlug, assets, seen);
  }

  return assets;
}

function extractAssetsFromChunk(chunk, platformTsr, tsrSlug, category, assets, seen) {
  const assetHrefRe = new RegExp(
    `href="/${platformTsr}/${tsrSlug}/asset/(\\d+)/"[\\s\\S]{0,400}?` +
    `src="/media/asset_icons/(\\d+)/(\\d+)\\.png[^"]*"[\\s\\S]{0,200}?alt="([^"]*)"`,
    'g'
  );

  let am;
  while ((am = assetHrefRe.exec(chunk)) !== null) {
    const assetId  = parseInt(am[1]);
    const prefix   = am[2];
    const altText  = am[4].trim();

    if (seen.has(assetId)) continue;
    seen.add(assetId);

    const dash = altText.lastIndexOf(' - ');
    const sheetName = decodeHtmlEntities(
      dash >= 0 ? altText.slice(0, dash).trim() : altText
    ) || `Sheet ${assetId}`;

    assets.push({ assetId, name: sheetName, category });
  }
}

function parseGamePageFallback(html, platformTsr, tsrSlug, assets, seen) {
  const categories = [];
  const catRe = /asset-count[^>]*>\[\d+\]<\/span>\s*\n([^\n<]{2,80})/g;
  let cm;
  while ((cm = catRe.exec(html)) !== null) {
    categories.push({ name: decodeHtmlEntities(cm[1].trim()), pos: cm.index });
  }

  const assetRe = new RegExp(
    `href="/${platformTsr}/${tsrSlug}/asset/(\\d+)/"[\\s\\S]{0,400}?` +
    `src="/media/asset_icons/(\\d+)/(\\d+)\\.png[^"]*"[\\s\\S]{0,200}?alt="([^"]*)"`,
    'g'
  );
  let am;
  while ((am = assetRe.exec(html)) !== null) {
    const assetId = parseInt(am[1]);
    if (seen.has(assetId)) continue;
    seen.add(assetId);

    const altText = am[4].trim();
    const dash = altText.lastIndexOf(' - ');
    const sheetName = decodeHtmlEntities(
      dash >= 0 ? altText.slice(0, dash).trim() : altText
    ) || `Sheet ${assetId}`;

    let category = 'Miscellaneous';
    for (const cat of categories) {
      if (cat.pos <= am.index) category = cat.name;
    }

    assets.push({ assetId, name: sheetName, category });
  }
}

// ---------------------------------------------------------------------------
// Ground truth cross-reference
// ---------------------------------------------------------------------------

function buildGroundTruthMap() {
  const gtDir = join(ROOT, 'data/ground-truth');
  const map = {};
  if (!existsSync(gtDir)) return map;

  for (const dimension of readdirSync(gtDir)) {
    const dimDir = join(gtDir, dimension);
    if (!statSync(dimDir).isDirectory()) continue;
    for (const file of readdirSync(dimDir)) {
      if (!file.endsWith('.json')) continue;
      const slug = file.replace('.json', '').toLowerCase();
      if (!map[slug]) map[slug] = [];
      map[slug].push(`ground-truth/${dimension}/${file}`);
    }
  }
  return map;
}

// ---------------------------------------------------------------------------
// Load scrape-state.json for game name lookups
// ---------------------------------------------------------------------------

function loadScrapeState() {
  if (!existsSync(STATE_FILE)) return {};
  try {
    return JSON.parse(readFileSync(STATE_FILE, 'utf-8'));
  } catch { return {}; }
}

function findGameInState(state, platformTsr, gameSlug) {
  const platformState = state[platformTsr];
  if (!platformState?.games) return null;
  return platformState.games.find(g => g.slug === gameSlug) || null;
}

// ---------------------------------------------------------------------------
// Load existing catalog for resume
// ---------------------------------------------------------------------------

function loadExistingCatalog() {
  if (!existsSync(CATALOG_FILE)) return { entries: [], enrichedGames: new Set() };
  try {
    const data = JSON.parse(readFileSync(CATALOG_FILE, 'utf-8'));
    const entries = data.entries || [];
    const enrichedGames = new Set();
    for (const e of entries) {
      if (e.sheet_name_source === 'tsr') {
        enrichedGames.add(`${e.platform}/${e.game_slug}`);
      }
    }
    return { entries, enrichedGames };
  } catch { return { entries: [], enrichedGames: new Set() }; }
}

// ---------------------------------------------------------------------------
// Normalize category names to semantic roles
// ---------------------------------------------------------------------------

function normalizeCategory(rawCategory) {
  const lower = rawCategory.toLowerCase().replace(/[^a-z0-9\s]/g, '');

  if (/playable.character|player/.test(lower)) return 'player';
  if (/^enemies$|^enemy|enemies.and.bosses|enemies.and.other/.test(lower)) return 'enemy';
  if (/^bosses$|^boss/.test(lower)) return 'boss';
  if (/non.playable|npc|friendly/.test(lower)) return 'npc';
  if (/tileset/.test(lower)) return 'tileset';
  if (/background/.test(lower)) return 'background';
  if (/stage|level|world|map|area|zone|castle|fortress|dungeon|forest|cave|island|plains|dome/.test(lower)) return 'stage_map';
  if (/hud|menu|ui|title|interface|font/.test(lower)) return 'ui';
  if (/item|object|weapon|power.up|collectible/.test(lower)) return 'item';
  if (/cutscene|ending|intro|cinema/.test(lower)) return 'cutscene';
  if (/fighter|racer|car|vehicle/.test(lower)) return 'character';
  if (/portrait|face/.test(lower)) return 'portrait';

  return 'misc';
}

// ---------------------------------------------------------------------------
// Main pipeline
// ---------------------------------------------------------------------------

async function main() {
  log('=== Two Fires Asset Catalog Builder ===');
  log(`Mode: ${LOCAL_ONLY ? 'LOCAL ONLY (no TSR fetch)' : 'FULL ENRICHMENT'}${RESUME ? ' + RESUME' : ''}`);

  const state = loadScrapeState();
  const groundTruthMap = buildGroundTruthMap();
  const { entries: existingEntries, enrichedGames } = RESUME ? loadExistingCatalog() : { entries: [], enrichedGames: new Set() };

  if (!existsSync(SPRITES_DIR)) {
    log('ERROR: Sprites directory not found: ' + SPRITES_DIR);
    process.exit(1);
  }

  const allEntries = RESUME ? [...existingEntries] : [];
  const existingKeys = new Set(allEntries.map(e => e.file));

  let totalGames = 0;
  let fetchedGames = 0;
  let skippedGames = 0;
  let totalSheets = 0;
  let enrichedSheets = 0;

  const platformDirs = readdirSync(SPRITES_DIR).filter(d =>
    statSync(join(SPRITES_DIR, d)).isDirectory()
  );

  for (const platformLocal of platformDirs) {
    const platformDef = PLATFORMS.find(p => p.local === platformLocal);
    if (!platformDef) {
      log(`  Skipping unknown platform folder: ${platformLocal}`);
      continue;
    }
    if (PLATFORM_FILTER && platformLocal !== PLATFORM_FILTER && platformDef.tsr !== PLATFORM_FILTER) {
      continue;
    }

    const platformDir = join(SPRITES_DIR, platformLocal);
    const gameDirs = readdirSync(platformDir).filter(d =>
      statSync(join(platformDir, d)).isDirectory()
    );

    log(`\n[${platformDef.name}] ${gameDirs.length} games on disk`);

    for (const gameSlug of gameDirs) {
      totalGames++;
      const gameKey = `${platformLocal}/${gameSlug}`;

      if (RESUME && enrichedGames.has(gameKey)) {
        skippedGames++;
        continue;
      }

      const gameDir = join(platformDir, gameSlug);
      const gameInfo = findGameInState(state, platformDef.tsr, gameSlug);
      const gameName = gameInfo ? decodeHtmlEntities(gameInfo.name) : gameSlug;
      const tsrSlug  = gameInfo?.tsr_slug || gameSlug.replace(/-/g, '');
      const tsrUrl   = gameInfo?.tsr_url || `${BASE_URL}/${platformDef.tsr}/${tsrSlug}/`;

      // Collect all PNGs on disk for this game
      const pngsOnDisk = [];
      for (const category of readdirSync(gameDir)) {
        const catDir = join(gameDir, category);
        if (!statSync(catDir).isDirectory()) continue;
        for (const file of readdirSync(catDir)) {
          if (!file.endsWith('.png')) continue;
          pngsOnDisk.push({
            file: `data/assets/sprites/${platformLocal}/${gameSlug}/${category}/${file}`,
            fullPath: join(catDir, file),
            category,
            assetId: parseInt(file.replace('.png', '')),
          });
        }
      }

      if (pngsOnDisk.length === 0) continue;

      // Try to fetch sheet names from TSR
      let tsrAssets = null;
      if (!LOCAL_ONLY) {
        try {
          const resp = await fetch(tsrUrl);
          if (resp.ok) {
            const html = await resp.text();
            tsrAssets = parseGamePage(html, platformDef.tsr, tsrSlug);
            fetchedGames++;
          } else {
            log(`  [WARN] HTTP ${resp.status} for ${gameName} — using folder names`);
          }
        } catch (err) {
          log(`  [WARN] Fetch failed for ${gameName}: ${err.message} — using folder names`);
        }
        await sleep(RATE_LIMIT_MS);
      }

      // Build asset ID → TSR metadata map
      const tsrMap = new Map();
      if (tsrAssets) {
        for (const a of tsrAssets) {
          tsrMap.set(a.assetId, a);
        }
      }

      // Build catalog entries for this game
      const gtRef = groundTruthMap[gameSlug] || groundTruthMap[gameName.toLowerCase().replace(/[^a-z0-9]+/g, '-')] || null;

      for (const png of pngsOnDisk) {
        if (existingKeys.has(png.file)) continue;

        const tsrData = tsrMap.get(png.assetId);
        const rawCategory = tsrData?.category || png.category.replace(/-/g, ' ');
        const sheetName = tsrData?.name || null;
        const dims = readPngDimensions(png.fullPath);
        let fileSize = 0;
        try { fileSize = statSync(png.fullPath).size; } catch {}

        const entry = {
          file: png.file,
          platform: platformLocal,
          platform_name: platformDef.name,
          game_slug: gameSlug,
          game_name: gameName,
          tsr_game_slug: tsrSlug,
          category_raw: rawCategory,
          category: normalizeCategory(rawCategory),
          sheet_name: sheetName,
          sheet_name_source: sheetName ? 'tsr' : 'none',
          asset_id: png.assetId,
          width: dims?.width ?? null,
          height: dims?.height ?? null,
          file_size_bytes: fileSize,
          tsr_url: `${BASE_URL}/${platformDef.tsr}/${tsrSlug}/asset/${png.assetId}/`,
          ground_truth_ref: gtRef,

          programmatic_tags: null,
          vision_tags: null,
        };

        allEntries.push(entry);
        existingKeys.add(png.file);
        totalSheets++;
        if (sheetName) enrichedSheets++;
      }

      if ((totalGames % 50) === 0) {
        log(`  Progress: ${totalGames} games scanned, ${totalSheets} sheets cataloged, ${enrichedSheets} with TSR names`);
      }

      // Periodic save every 100 games
      if ((totalGames % 100) === 0) {
        writeCatalog(allEntries);
        log(`  [CHECKPOINT] Saved ${allEntries.length} entries`);
      }
    }
  }

  // Final write
  writeCatalog(allEntries);

  log('\n======================================================================');
  log('ASSET CATALOG COMPLETE');
  log('======================================================================');
  log(`  Total games scanned:    ${totalGames}`);
  log(`  Games fetched from TSR: ${fetchedGames}`);
  log(`  Games skipped (resume): ${skippedGames}`);
  log(`  Total sheets cataloged: ${allEntries.length}`);
  log(`  Sheets with TSR names:  ${enrichedSheets}`);
  log(`  Sheets without names:   ${allEntries.length - enrichedSheets}`);
  log(`  Output: ${CATALOG_FILE}`);
}

function writeCatalog(entries) {
  const byPlatform = {};
  for (const e of entries) {
    if (!byPlatform[e.platform]) {
      byPlatform[e.platform] = { game_count: 0, sheet_count: 0, _games: new Set() };
    }
    byPlatform[e.platform].sheet_count++;
    byPlatform[e.platform]._games.add(e.game_slug);
  }
  for (const p of Object.values(byPlatform)) {
    p.game_count = p._games.size;
    delete p._games;
  }

  const catalog = {
    generated_at: new Date().toISOString(),
    total_sheets: entries.length,
    by_platform: byPlatform,
    entries,
  };

  writeFileSync(CATALOG_FILE, JSON.stringify(catalog, null, 2));
}

main().catch(err => {
  console.error('Fatal error:', err);
  process.exit(1);
});
