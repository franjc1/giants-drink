#!/usr/bin/env node
/**
 * scrape-sprites.js
 *
 * Comprehensive sprite sheet scraper for The Spriters Resource.
 * Downloads ALL sprite sheets for classic gaming platforms.
 *
 * Usage:
 *   node tools/scrape-sprites.js                      # all platforms
 *   node tools/scrape-sprites.js --platform=nes       # single platform
 *   node tools/scrape-sprites.js --game=supermariobros --platform=nes
 *   node tools/scrape-sprites.js --resume             # skip completed games
 *   node tools/scrape-sprites.js --dry-run            # build game list, no download
 *   node tools/scrape-sprites.js --index-only         # rebuild asset-index.json from existing files
 *
 * Output:
 *   data/assets/sprites/{platform}/{game-slug}/{category}/{asset-id}.png
 *   data/assets/game-list.json     (committed to git)
 *   data/assets/asset-index.json   (committed to git)
 *   data/assets/scrape-log.txt     (gitignored)
 *   data/assets/scrape-state.json  (gitignored)
 *
 * Platforms scraped (TSR slug → local name):
 *   nes, snes, game_boy_gbc, game_boy_advance, sega_genesis,
 *   master_system, sega_cd, game_gear, turbografx_16,
 *   neo_geo_ngcd, arcade, ms_dos
 */

import {
  readFileSync, writeFileSync, mkdirSync, existsSync, statSync,
  appendFileSync, readdirSync,
} from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const ROOT = join(__dirname, '..');

// ---------------------------------------------------------------------------
// Platform definitions
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

const BASE_URL    = 'https://www.spriters-resource.com';
const ASSETS_DIR  = join(ROOT, 'data/assets');
const SPRITES_DIR = join(ASSETS_DIR, 'sprites');
const STATE_FILE  = join(ASSETS_DIR, 'scrape-state.json');
const LOG_FILE    = join(ASSETS_DIR, 'scrape-log.txt');
const GAME_LIST_FILE  = join(ASSETS_DIR, 'game-list.json');
const ASSET_INDEX_FILE = join(ASSETS_DIR, 'asset-index.json');

const DELAY_MS   = 1500;  // minimum between requests
const TIMEOUT_MS = 25000;

// Exponential backoff delays (ms) for 429 / 5xx / network errors
const BACKOFF = [5000, 15000, 45000, 120000];

// ---------------------------------------------------------------------------
// Argument parsing
// ---------------------------------------------------------------------------

const args = Object.fromEntries(
  process.argv.slice(2)
    .filter(a => a.startsWith('--'))
    .map(a => {
      const [key, val] = a.slice(2).split('=');
      return [key, val ?? true];
    })
);

const RESUME     = !!args.resume;
const DRY_RUN    = !!args['dry-run'];
const INDEX_ONLY = !!args['index-only'];
const TARGET_PLATFORM = args.platform || null;
const TARGET_GAME     = args.game     || null;

// ---------------------------------------------------------------------------
// Logging
// ---------------------------------------------------------------------------

function log(msg) {
  const line = `[${new Date().toISOString()}] ${msg}`;
  console.log(msg);
  try { appendFileSync(LOG_FILE, line + '\n'); } catch { /* best effort */ }
}

// ---------------------------------------------------------------------------
// State persistence
// ---------------------------------------------------------------------------

function loadState() {
  if (existsSync(STATE_FILE)) {
    try { return JSON.parse(readFileSync(STATE_FILE, 'utf8')); } catch { /* corrupt, start fresh */ }
  }
  return {};
}

function saveState(state) {
  writeFileSync(STATE_FILE, JSON.stringify(state, null, 2));
}

function isGameComplete(state, tsrPlatform, tsrSlug) {
  return state[tsrPlatform]?.game_progress?.[tsrSlug]?.completed === true;
}

function markGameComplete(state, tsrPlatform, tsrSlug, totalAssets, assetsDone) {
  if (!state[tsrPlatform]) state[tsrPlatform] = {};
  if (!state[tsrPlatform].game_progress) state[tsrPlatform].game_progress = {};
  state[tsrPlatform].game_progress[tsrSlug] = {
    total_assets: totalAssets,
    assets_done: assetsDone,
    completed: true,
    completed_at: new Date().toISOString(),
  };
  saveState(state);
}

// ---------------------------------------------------------------------------
// HTTP helpers
// ---------------------------------------------------------------------------

let lastRequestTime = 0;

async function rateLimitedFetch(url, options = {}, retryCount = 0) {
  const now = Date.now();
  const wait = DELAY_MS - (now - lastRequestTime);
  if (wait > 0) await new Promise(r => setTimeout(r, wait));
  lastRequestTime = Date.now();

  const controller = new AbortController();
  const timer = setTimeout(() => controller.abort(), TIMEOUT_MS);

  try {
    const res = await fetch(url, {
      ...options,
      signal: controller.signal,
      headers: {
        'User-Agent': 'TwoFiresResearchBot/1.0 (non-commercial game research project)',
        'Accept-Language': 'en-US,en;q=0.9',
        ...(options.headers || {}),
      },
      redirect: 'follow',
    });
    clearTimeout(timer);

    if (res.status === 429 || res.status === 503) {
      const delay = BACKOFF[Math.min(retryCount, BACKOFF.length - 1)];
      log(`  [BACKOFF] HTTP ${res.status} on ${url} — waiting ${delay / 1000}s`);
      await new Promise(r => setTimeout(r, delay));
      return rateLimitedFetch(url, options, retryCount + 1);
    }

    return res;
  } catch (err) {
    clearTimeout(timer);
    if (err.name === 'AbortError') {
      throw new Error(`Timeout fetching ${url}`);
    }
    if (retryCount < BACKOFF.length) {
      const delay = BACKOFF[retryCount];
      log(`  [RETRY] ${err.message} — waiting ${delay / 1000}s`);
      await new Promise(r => setTimeout(r, delay));
      return rateLimitedFetch(url, options, retryCount + 1);
    }
    throw err;
  }
}

async function fetchHTML(url) {
  const res = await rateLimitedFetch(url, { headers: { Accept: 'text/html,*/*' } });
  if (res.status === 404) return null;
  if (!res.ok) throw new Error(`HTTP ${res.status} ${res.statusText} for ${url}`);
  return res.text();
}

async function downloadBinary(url, destPath, retryCount = 0) {
  // Skip if already downloaded with non-zero size
  if (existsSync(destPath)) {
    try {
      const s = statSync(destPath);
      if (s.size > 0) return { skipped: true, size: s.size };
    } catch { /* file may have been deleted between check and stat */ }
  }

  const res = await rateLimitedFetch(url, {
    headers: { Accept: 'image/png,image/*,*/*', Referer: BASE_URL },
  }, retryCount);

  if (res.status === 404) return { notFound: true };
  if (!res.ok) throw new Error(`HTTP ${res.status} downloading ${url}`);

  const buf = Buffer.from(await res.arrayBuffer());
  if (buf.length === 0) throw new Error(`Empty response for ${url}`);

  mkdirSync(dirname(destPath), { recursive: true });
  writeFileSync(destPath, buf);
  return { skipped: false, size: buf.length };
}

// ---------------------------------------------------------------------------
// HTML parsing
// ---------------------------------------------------------------------------

function toKebab(str) {
  return str
    .toLowerCase()
    .replace(/[&]/g, 'and')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '');
}

function decodeHtmlEntities(str) {
  return str
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&#39;/g, "'")
    .replace(/&nbsp;/g, ' ')
    .replace(/&#(\d+);/g, (_, n) => String.fromCharCode(parseInt(n)));
}

// Extract game name from alt text: "Game Name - Game Name" → "Game Name"
function nameFromAlt(alt) {
  const dash = alt.lastIndexOf(' - ');
  const name = dash >= 0 ? alt.slice(0, dash).trim() : alt.trim();
  // Sanity check: not a single letter or digit
  return name.length >= 2 ? name : null;
}

/**
 * Parse game list from a platform letter page.
 * Games appear as: <a href="/{platform}/{slug}/">...<img alt="{name} - {name}">...</a>
 */
function parseGameListPage(html, platformTsr) {
  const games = [];
  const seen = new Set();

  // Match href + nearby alt text (within ~300 chars)
  const re = new RegExp(
    `href="/${platformTsr}/([a-z0-9][a-z0-9_-]*)/"[\\s\\S]{0,300}?alt="([^"]{3,})"`,
    'g'
  );

  let m;
  while ((m = re.exec(html)) !== null) {
    const tsrSlug = m[1];
    const altText = m[2];

    // Skip single-char navigation slugs (a, b, c, ...) and page slugs
    if (/^[a-z]$/.test(tsrSlug)) continue;
    if (/^page-\d+$/.test(tsrSlug)) continue;
    if (seen.has(tsrSlug)) continue;
    seen.add(tsrSlug);

    const name = nameFromAlt(altText);
    if (!name) continue;

    games.push({
      tsr_slug: tsrSlug,
      slug: toKebab(name),
      name,
      tsr_url: `${BASE_URL}/${platformTsr}/${tsrSlug}/`,
    });
  }

  return games;
}

/**
 * Parse sprite sheet assets from a game page.
 * Returns array of { assetId, prefix, name, category, downloadUrl, tsrUrl }
 *
 * TSR page structure: the main sheet list is organized into section blocks.
 * Each block: <div class="section ..."> containing a category header,
 * followed by a sibling <div class="icondisplay"> containing asset links.
 *
 * Asset link: <a href="/{platform}/{slug}/asset/{id}/">
 * Thumbnail:  <img src="/media/asset_icons/{prefix}/{id}.png">
 * Alt text:   "{sheet name} - {game name}"
 *
 * We parse section-by-section (not positionally) so duplicate asset references
 * in page headers/sidebars don't cause wrong category assignment.
 */
function parseGamePage(html, platformTsr, tsrSlug) {
  const assets = [];
  const seen = new Set(); // deduplicate asset IDs

  // -----------------------------------------------------------------------
  // Strategy: find all <div class="section ..."> boundaries, then for each
  // section extract (a) the category name from the header, and (b) the assets
  // from the following icondisplay div. Both live between consecutive section
  // start markers.
  // -----------------------------------------------------------------------
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

      // Extract category name: <span class="asset-count">[N]</span>\nCategory Name
      let category = 'Miscellaneous';
      const catMatch = chunk.match(/asset-count[^>]*>\[\d+\]<\/span>\s*\n([^\n<]{2,80})/);
      if (catMatch) {
        category = decodeHtmlEntities(catMatch[1].trim().replace(/\s+/g, ' '));
      }

      // Extract all assets from this chunk
      extractAssetsFromChunk(chunk, platformTsr, tsrSlug, category, assets, seen);
    }
  } else {
    // Fallback: parse the whole page with positional category detection
    // (used if TSR changes their HTML structure)
    parseGamePageFallback(html, platformTsr, tsrSlug, assets, seen);
  }

  return assets;
}

/** Extract asset entries from an HTML chunk belonging to one category section. */
function extractAssetsFromChunk(chunk, platformTsr, tsrSlug, category, assets, seen) {
  // Asset link regex within this chunk
  const assetHrefRe = new RegExp(
    `href="/${platformTsr}/${tsrSlug}/asset/(\\d+)/"[\\s\\S]{0,400}?` +
    `src="/media/asset_icons/(\\d+)/(\\d+)\\.png[^"]*"[\\s\\S]{0,200}?alt="([^"]*)"`,
    'g'
  );

  let am;
  while ((am = assetHrefRe.exec(chunk)) !== null) {
    const assetId  = parseInt(am[1]);
    const prefix   = am[2];
    // am[3] is the asset ID embedded in the image filename (should match assetId)
    const altText  = am[4].trim();

    if (seen.has(assetId)) continue;
    seen.add(assetId);

    // Alt text is "Sheet Name - Game Name"; extract sheet name
    const dash = altText.lastIndexOf(' - ');
    const sheetName = decodeHtmlEntities(
      dash >= 0 ? altText.slice(0, dash).trim() : altText
    ) || `Sheet ${assetId}`;

    assets.push({
      assetId,
      prefix,
      name: sheetName,
      category,
      downloadUrl: `${BASE_URL}/media/assets/${prefix}/${assetId}.png`,
      tsrUrl: `${BASE_URL}/${platformTsr}/${tsrSlug}/asset/${assetId}/`,
    });
  }
}

/** Fallback parser used when section divs aren't found (old TSR HTML). */
function parseGamePageFallback(html, platformTsr, tsrSlug, assets, seen) {
  // Find category headers by position
  const categories = [];
  const catRe = /asset-count[^>]*>\[\d+\]<\/span>\s*\n([^\n<]{2,80})/g;
  let cm;
  while ((cm = catRe.exec(html)) !== null) {
    categories.push({ name: decodeHtmlEntities(cm[1].trim()), pos: cm.index });
  }

  // Find all assets with their positions
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

    const prefix  = am[2];
    const altText = am[4].trim();
    const dash = altText.lastIndexOf(' - ');
    const sheetName = decodeHtmlEntities(
      dash >= 0 ? altText.slice(0, dash).trim() : altText
    ) || `Sheet ${assetId}`;

    let category = 'Miscellaneous';
    for (const cat of categories) {
      if (cat.pos <= am.index) category = cat.name;
    }

    assets.push({
      assetId, prefix, name: sheetName, category,
      downloadUrl: `${BASE_URL}/media/assets/${prefix}/${assetId}.png`,
      tsrUrl: `${BASE_URL}/${platformTsr}/${tsrSlug}/asset/${assetId}/`,
    });
  }
}

// ---------------------------------------------------------------------------
// PNG dimension reader (no external deps)
// PNG spec: bytes 16-23 of file are IHDR width (4 bytes BE) and height (4 bytes BE)
// ---------------------------------------------------------------------------

function readPngDimensions(filePath) {
  try {
    const buf = readFileSync(filePath);
    if (buf.length < 24) return null;
    // Verify PNG signature: 89 50 4E 47
    if (buf[0] !== 0x89 || buf[1] !== 0x50 || buf[2] !== 0x4E || buf[3] !== 0x47) return null;
    return {
      width: buf.readUInt32BE(16),
      height: buf.readUInt32BE(20),
    };
  } catch {
    return null;
  }
}

// ---------------------------------------------------------------------------
// Ground truth cross-reference map
// ---------------------------------------------------------------------------

function buildGroundTruthMap() {
  const gtDir = join(ROOT, 'data/ground-truth/physics');
  if (!existsSync(gtDir)) return {};

  const map = {};
  try {
    for (const file of readdirSync(gtDir)) {
      if (!file.endsWith('.json')) continue;
      const stem = file.replace('.json', '');
      map[stem] = `data/ground-truth/physics/${file}`;
    }
  } catch { /* best effort */ }
  return map;
}

// ---------------------------------------------------------------------------
// Phase 1: Scrape game lists
// ---------------------------------------------------------------------------

async function scrapeGameList(platform, state) {
  const { tsr, local, name } = platform;

  if (RESUME && state[tsr]?.games_listed) {
    log(`[SKIP] Game list for ${name} already scraped (${state[tsr].games?.length || 0} games)`);
    return state[tsr].games || [];
  }

  log(`\n[GAMELIST] ${name} — scraping all letter pages...`);

  const LETTERS = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
                   'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
                   'X', 'Y', 'Z'];

  const allGames = [];
  const seen = new Set();

  for (const letter of LETTERS) {
    let page = 1;

    while (true) {
      const url = page === 1
        ? `${BASE_URL}/${tsr}/${encodeURIComponent(letter)}/`
        : `${BASE_URL}/${tsr}/${encodeURIComponent(letter)}/page-${page}/`;

      let html;
      try {
        html = await fetchHTML(url);
      } catch (err) {
        log(`  [ERROR] ${url}: ${err.message}`);
        break;
      }

      if (!html) break; // 404 — no games for this letter

      const games = parseGameListPage(html, tsr);
      let newCount = 0;
      for (const g of games) {
        if (!seen.has(g.tsr_slug)) {
          seen.add(g.tsr_slug);
          allGames.push(g);
          newCount++;
        }
      }

      // Check if there's a next page
      const hasNextPage = html.includes(`/page-${page + 1}/`);
      if (!hasNextPage || newCount === 0) break;

      log(`    ${letter} page ${page}: ${newCount} new (total so far: ${allGames.length})`);
      page++;
    }
  }

  log(`[GAMELIST] ${name}: ${allGames.length} games found`);

  if (!state[tsr]) state[tsr] = {};
  state[tsr].games = allGames;
  state[tsr].games_listed = true;
  saveState(state);

  return allGames;
}

// ---------------------------------------------------------------------------
// Phase 2: Download all assets for a single game
// ---------------------------------------------------------------------------

async function downloadGame(game, platform, state, groundTruthMap) {
  const { tsr, local } = platform;

  if (RESUME && isGameComplete(state, tsr, game.tsr_slug)) {
    return { skipped: true };
  }

  // Fetch game page
  let html;
  try {
    html = await fetchHTML(game.tsr_url);
  } catch (err) {
    log(`  [ERROR] Fetching ${game.tsr_url}: ${err.message}`);
    return { error: err.message, total: 0 };
  }

  if (!html) {
    log(`  [404] Game page not found: ${game.tsr_url}`);
    markGameComplete(state, tsr, game.tsr_slug, 0, 0);
    return { total: 0, downloaded: 0, skipped: 0, failed: 0, indexEntries: [] };
  }

  const assets = parseGamePage(html, tsr, game.tsr_slug);

  if (assets.length === 0) {
    log(`  [WARN] No assets parsed for ${game.name} — page may use unexpected structure`);
    markGameComplete(state, tsr, game.tsr_slug, 0, 0);
    return { total: 0, downloaded: 0, skipped: 0, failed: 0, indexEntries: [] };
  }

  let downloaded = 0;
  let skippedCount = 0;
  let failed = 0;
  const indexEntries = [];

  for (let i = 0; i < assets.length; i++) {
    const asset = assets[i];
    const categorySlug = toKebab(asset.category);
    const destPath = join(SPRITES_DIR, local, game.slug, categorySlug, `${asset.assetId}.png`);

    if (!DRY_RUN) {
      try {
        const result = await downloadBinary(asset.downloadUrl, destPath);

        if (result.notFound) {
          log(`  [404] Asset ${asset.assetId} (${asset.name})`);
          failed++;
        } else if (result.skipped) {
          skippedCount++;
        } else {
          downloaded++;
        }

        if (!result.notFound) {
          const dims = readPngDimensions(destPath);
          let fileSize = 0;
          try { fileSize = statSync(destPath).size; } catch { }

          // Ground truth cross-reference: try game slug, then tsr_slug
          const gtRef = groundTruthMap[game.slug] ||
                        groundTruthMap[game.tsr_slug] ||
                        null;

          indexEntries.push({
            file: `data/assets/sprites/${local}/${game.slug}/${categorySlug}/${asset.assetId}.png`,
            platform: local,
            game_slug: game.slug,
            game_name: game.name,
            tsr_game_slug: game.tsr_slug,
            category: asset.category,
            sheet_name: asset.name,
            asset_id: asset.assetId,
            width: dims?.width ?? null,
            height: dims?.height ?? null,
            file_size_bytes: fileSize,
            tsr_url: asset.tsrUrl,
            ground_truth_ref: gtRef,
          });
        }
      } catch (err) {
        log(`  [FAIL] Asset ${asset.assetId} (${asset.name}): ${err.message}`);
        failed++;
      }
    } else {
      // Dry run: record without downloading
      indexEntries.push({
        file: `data/assets/sprites/${local}/${game.slug}/${categorySlug}/${asset.assetId}.png`,
        platform: local,
        game_slug: game.slug,
        game_name: game.name,
        tsr_game_slug: game.tsr_slug,
        category: asset.category,
        sheet_name: asset.name,
        asset_id: asset.assetId,
        tsr_url: asset.tsrUrl,
        ground_truth_ref: groundTruthMap[game.slug] || null,
      });
    }

    // Progress log every 10 sheets or on last
    if ((i + 1) % 10 === 0 || i === assets.length - 1) {
      log(`  Downloaded ${downloaded + skippedCount}/${assets.length} sheets for ${game.name} (${local})`);
    }
  }

  markGameComplete(state, tsr, game.tsr_slug, assets.length, downloaded + skippedCount);

  return { total: assets.length, downloaded, skipped: skippedCount, failed, indexEntries };
}

// ---------------------------------------------------------------------------
// Phase 3: Build asset-index.json
// ---------------------------------------------------------------------------

function buildAssetIndex(allEntries) {
  const byPlatform = {};
  for (const entry of allEntries) {
    if (!byPlatform[entry.platform]) {
      byPlatform[entry.platform] = { game_count: 0, sheet_count: 0, _games: new Set() };
    }
    const p = byPlatform[entry.platform];
    p.sheet_count++;
    p._games.add(entry.game_slug);
    p.game_count = p._games.size;
  }
  // Clean up temporary Set
  for (const p of Object.values(byPlatform)) { delete p._games; }

  const index = {
    generated_at: new Date().toISOString(),
    total_files: allEntries.length,
    by_platform: byPlatform,
    entries: allEntries,
  };

  writeFileSync(ASSET_INDEX_FILE, JSON.stringify(index, null, 2));
  log(`\n[INDEX] asset-index.json written — ${allEntries.length} entries across ${Object.keys(byPlatform).length} platforms`);
}

// ---------------------------------------------------------------------------
// Index rebuild from existing files (--index-only)
// ---------------------------------------------------------------------------

function rebuildIndexFromDisk() {
  log('[INDEX-ONLY] Scanning existing sprite files on disk...');

  if (!existsSync(SPRITES_DIR)) {
    log('[ERROR] Sprites directory does not exist: ' + SPRITES_DIR);
    process.exit(1);
  }

  const groundTruthMap = buildGroundTruthMap();
  const entries = [];

  for (const platformLocal of readdirSync(SPRITES_DIR)) {
    const platformDir = join(SPRITES_DIR, platformLocal);
    if (!existsSync(platformDir) || !statSync(platformDir).isDirectory()) continue;

    for (const gameSlug of readdirSync(platformDir)) {
      const gameDir = join(platformDir, gameSlug);
      if (!statSync(gameDir).isDirectory()) continue;

      for (const category of readdirSync(gameDir)) {
        const catDir = join(gameDir, category);
        if (!statSync(catDir).isDirectory()) continue;

        for (const file of readdirSync(catDir)) {
          if (!file.endsWith('.png')) continue;
          const assetId = parseInt(file.replace('.png', ''));
          const filePath = join(catDir, file);
          const dims = readPngDimensions(filePath);
          let fileSize = 0;
          try { fileSize = statSync(filePath).size; } catch { }

          entries.push({
            file: `data/assets/sprites/${platformLocal}/${gameSlug}/${category}/${file}`,
            platform: platformLocal,
            game_slug: gameSlug,
            game_name: gameSlug, // best we can do without the original name
            category,
            asset_id: isNaN(assetId) ? file : assetId,
            width: dims?.width ?? null,
            height: dims?.height ?? null,
            file_size_bytes: fileSize,
            ground_truth_ref: groundTruthMap[gameSlug] || null,
          });
        }
      }
    }
  }

  buildAssetIndex(entries);
  log(`[INDEX-ONLY] Done. ${entries.length} files indexed.`);
}

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------

async function main() {
  mkdirSync(ASSETS_DIR, { recursive: true });
  mkdirSync(SPRITES_DIR, { recursive: true });

  // Ensure log file exists
  if (!existsSync(LOG_FILE)) writeFileSync(LOG_FILE, '');

  log(`\n${'='.repeat(70)}`);
  log(`Two Fires Sprite Scraper`);
  log(`Mode: ${DRY_RUN ? 'DRY RUN' : INDEX_ONLY ? 'INDEX ONLY' : 'DOWNLOAD'}${RESUME ? ' + RESUME' : ''}`);
  log(`Target platform: ${TARGET_PLATFORM || 'all'}`);
  if (TARGET_GAME) log(`Target game: ${TARGET_GAME}`);
  log(`${'='.repeat(70)}`);

  // --index-only: just rebuild the index from files already on disk
  if (INDEX_ONLY) {
    rebuildIndexFromDisk();
    return;
  }

  const state = loadState();
  const groundTruthMap = buildGroundTruthMap();

  // Determine platforms to process
  let platforms = PLATFORMS;
  if (TARGET_PLATFORM) {
    platforms = PLATFORMS.filter(p =>
      p.tsr === TARGET_PLATFORM || p.local === TARGET_PLATFORM
    );
    if (platforms.length === 0) {
      log(`[ERROR] Unknown platform: "${TARGET_PLATFORM}"`);
      log(`Available: ${PLATFORMS.map(p => `${p.local} (tsr: ${p.tsr})`).join(', ')}`);
      process.exit(1);
    }
  }

  // ---------------------------------------------------------------------------
  // PHASE 1 — Build master game list for all target platforms
  // ---------------------------------------------------------------------------
  log('\n[PHASE 1] Building master game list...');

  const masterGameList = { generated_at: new Date().toISOString(), platforms: {} };

  for (const platform of platforms) {
    const games = await scrapeGameList(platform, state);
    masterGameList.platforms[platform.local] = {
      tsr_slug: platform.tsr,
      name: platform.name,
      total_games: games.length,
      games,
    };
  }

  writeFileSync(GAME_LIST_FILE, JSON.stringify(masterGameList, null, 2));
  log('\n[PHASE 1 SUMMARY] Game counts:');
  let totalGames = 0;
  for (const [plocal, pdata] of Object.entries(masterGameList.platforms)) {
    log(`  ${plocal.padEnd(18)} ${pdata.total_games} games`);
    totalGames += pdata.total_games;
  }
  log(`  ${'TOTAL'.padEnd(18)} ${totalGames} games`);
  log(`  game-list.json saved to: ${GAME_LIST_FILE}`);

  if (DRY_RUN) {
    log('\n[DRY RUN] Game list complete. No downloads performed.');
    return;
  }

  // ---------------------------------------------------------------------------
  // PHASE 2 — Download all sprite sheets
  // ---------------------------------------------------------------------------
  log('\n[PHASE 2] Downloading sprite sheets...');

  let grandTotal = 0;
  let grandDownloaded = 0;
  let grandSkipped = 0;
  let grandFailed = 0;
  const allIndexEntries = [];

  for (const platform of platforms) {
    const games = masterGameList.platforms[platform.local].games;
    let gamesToProcess = TARGET_GAME
      ? games.filter(g => g.tsr_slug === TARGET_GAME || g.slug === TARGET_GAME)
      : games;

    if (TARGET_GAME && gamesToProcess.length === 0) {
      log(`[WARN] Game "${TARGET_GAME}" not found in ${platform.name}`);
      continue;
    }

    log(`\n${'—'.repeat(60)}`);
    log(`[PLATFORM] ${platform.name} — ${gamesToProcess.length} games to process`);
    log(`${'—'.repeat(60)}`);

    let platformDownloaded = 0;
    let platformFailed = 0;

    for (let i = 0; i < gamesToProcess.length; i++) {
      const game = gamesToProcess[i];
      const pct = Math.round(((i + 1) / gamesToProcess.length) * 100);
      log(`\n[${i + 1}/${gamesToProcess.length} ${pct}%] ${game.name} (${platform.local}/${game.slug})`);

      try {
        const result = await downloadGame(game, platform, state, groundTruthMap);

        if (result.skipped) {
          log(`  [SKIP] Already completed`);
        } else if (result.error) {
          log(`  [ERROR] ${result.error}`);
          grandFailed++;
        } else {
          grandTotal     += result.total;
          grandDownloaded += result.downloaded;
          grandSkipped   += result.skipped;
          grandFailed    += result.failed;
          platformDownloaded += result.downloaded;
          platformFailed += result.failed;

          if (result.indexEntries) {
            allIndexEntries.push(...result.indexEntries);
          }

          log(`  => ${result.downloaded} new, ${result.skipped} cached, ${result.failed} failed / ${result.total} total`);
        }
      } catch (err) {
        log(`  [FATAL ERROR] ${game.name}: ${err.message}`);
        grandFailed++;
      }
    }

    log(`\n[PLATFORM DONE] ${platform.name}: ${platformDownloaded} downloaded, ${platformFailed} failed`);
  }

  // ---------------------------------------------------------------------------
  // PHASE 3 — Build asset-index.json
  // ---------------------------------------------------------------------------
  log('\n[PHASE 3] Building asset-index.json...');
  buildAssetIndex(allIndexEntries);

  log('\n' + '='.repeat(70));
  log('SCRAPE COMPLETE');
  log('='.repeat(70));
  log(`  Total sheets processed: ${grandTotal}`);
  log(`  Newly downloaded:       ${grandDownloaded}`);
  log(`  Already cached:         ${grandSkipped}`);
  log(`  Failed:                 ${grandFailed}`);
  log(`  Indexed:                ${allIndexEntries.length}`);
  log(`\n  game-list.json:  ${GAME_LIST_FILE}`);
  log(`  asset-index.json: ${ASSET_INDEX_FILE}`);
  log(`  sprites dir:      ${SPRITES_DIR}`);
  log(`  log file:         ${LOG_FILE}`);
}

main().catch(err => {
  log(`[FATAL] ${err.stack || err.message}`);
  process.exit(1);
});
