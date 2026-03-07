#!/usr/bin/env node
/**
 * scrape-music.js
 *
 * Downloads game music in native chiptune formats.
 * Primary source: Zophar's Domain (https://www.zophar.net/music/)
 * Fallback:       SNESMusic.org (SNES SPC), Project2612 (Genesis VGM)
 *
 * Usage:
 *   node tools/scrape-music.js                        # all platforms
 *   node tools/scrape-music.js --platform=nes         # single platform
 *   node tools/scrape-music.js --game=super-mario-bros --platform=nes
 *   node tools/scrape-music.js --resume               # skip completed games
 *   node tools/scrape-music.js --dry-run              # build game list, no download
 *   node tools/scrape-music.js --index-only           # rebuild index from existing files
 *
 * Output:
 *   data/assets/music/{platform}/{game-slug}/archive.zip
 *   data/assets/music/{platform}/{game-slug}/tracks/{track-files}
 *   data/assets/music-index.json       (committed to git)
 *   data/assets/music-scrape-log.txt   (gitignored)
 *   data/assets/music-scrape-state.json (gitignored)
 *
 * Platforms → formats:
 *   nes           → NSF
 *   snes          → SPC
 *   genesis        → VGM
 *   gameboy        → GBS  (covers Game Boy + Game Boy Color)
 *   gba            → GSF
 *   master-system  → VGM
 *   turbografx-16  → HES
 */

import {
  readFileSync, writeFileSync, mkdirSync, existsSync, statSync,
  appendFileSync, readdirSync,
} from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';
import { spawnSync } from 'child_process';

const __filename = fileURLToPath(import.meta.url);
const __dirname  = dirname(__filename);
const ROOT       = join(__dirname, '..');

// ---------------------------------------------------------------------------
// Platform definitions
// ---------------------------------------------------------------------------

const PLATFORMS = [
  { local: 'nes',           zophar: 'nintendo-nes-nsf',        format: 'nsf', name: 'NES' },
  { local: 'snes',          zophar: 'nintendo-snes-spc',        format: 'spc', name: 'SNES' },
  { local: 'genesis',       zophar: 'sega-mega-drive-genesis',  format: 'vgm', name: 'Genesis / Mega Drive' },
  { local: 'gameboy',       zophar: 'gameboy-gbs',              format: 'gbs', name: 'Game Boy / GBC' },
  { local: 'gba',           zophar: 'gameboy-advance-gsf',      format: 'gsf', name: 'GBA' },
  { local: 'master-system', zophar: 'sega-master-system-vgm',   format: 'vgm', name: 'Master System' },
  { local: 'turbografx-16', zophar: 'turbografx-16-hes',        format: 'hes', name: 'TurboGrafx-16' },
];

// ---------------------------------------------------------------------------
// Config
// ---------------------------------------------------------------------------

const ZOPHAR_BASE = 'https://www.zophar.net';
const ASSETS_DIR  = join(ROOT, 'data/assets');
const MUSIC_DIR   = join(ASSETS_DIR, 'music');
const STATE_FILE  = join(ASSETS_DIR, 'music-scrape-state.json');
const LOG_FILE    = join(ASSETS_DIR, 'music-scrape-log.txt');
const INDEX_FILE  = join(ASSETS_DIR, 'music-index.json');

const DELAY_MS    = 2000;   // between requests
const TIMEOUT_MS  = 90000;  // longer for ZIP downloads
const BACKOFF     = [5000, 15000, 45000, 120000];

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

const RESUME          = !!args.resume;
const DRY_RUN         = !!args['dry-run'];
const INDEX_ONLY      = !!args['index-only'];
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
    try { return JSON.parse(readFileSync(STATE_FILE, 'utf8')); } catch { }
  }
  return {};
}

function saveState(st) {
  writeFileSync(STATE_FILE, JSON.stringify(st, null, 2));
}

function isGameComplete(st, platform, slug) {
  return st[platform]?.game_progress?.[slug]?.completed === true;
}

function markGameComplete(st, platform, slug, data) {
  if (!st[platform]) st[platform] = {};
  if (!st[platform].game_progress) st[platform].game_progress = {};
  st[platform].game_progress[slug] = {
    ...data,
    completed: true,
    completed_at: new Date().toISOString(),
  };
  saveState(st);
}

// ---------------------------------------------------------------------------
// HTTP helpers  (same pattern as scrape-sprites.js)
// ---------------------------------------------------------------------------

let lastRequestTime = 0;

async function rateLimitedFetch(url, options = {}, retryCount = 0) {
  const now  = Date.now();
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
      log(`  [BACKOFF] HTTP ${res.status} — waiting ${delay / 1000}s`);
      await new Promise(r => setTimeout(r, delay));
      return rateLimitedFetch(url, options, retryCount + 1);
    }

    return res;
  } catch (err) {
    clearTimeout(timer);
    if (err.name === 'AbortError') throw new Error(`Timeout fetching ${url}`);
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

async function downloadBinary(url, destPath) {
  if (existsSync(destPath)) {
    try {
      const s = statSync(destPath);
      if (s.size > 0) return { skipped: true, size: s.size };
    } catch { }
  }

  const res = await rateLimitedFetch(url, {
    headers: {
      Accept: 'application/zip,application/octet-stream,*/*',
      Referer: ZOPHAR_BASE,
    },
  });

  if (res.status === 404) return { notFound: true };
  if (!res.ok) throw new Error(`HTTP ${res.status} downloading ${url}`);

  const buf = Buffer.from(await res.arrayBuffer());
  if (buf.length === 0) throw new Error(`Empty response for ${url}`);

  mkdirSync(dirname(destPath), { recursive: true });
  writeFileSync(destPath, buf);
  return { skipped: false, size: buf.length };
}

// ---------------------------------------------------------------------------
// ZIP extraction  (no npm deps — uses system unzip, falls back to ditto)
// ---------------------------------------------------------------------------

function extractZip(zipPath, destDir) {
  mkdirSync(destDir, { recursive: true });

  // unzip: standard on macOS and most Linux
  let r = spawnSync('unzip', ['-o', '-q', zipPath, '-d', destDir]);
  // unzip exit 1 = success with warnings (e.g. "replaced" messages)
  if (r.status === 0 || r.status === 1) return true;

  // ditto: macOS fallback
  r = spawnSync('ditto', ['-xk', zipPath, destDir]);
  if (r.status === 0) return true;

  log(`  [WARN] ZIP extraction failed: ${(r.stderr || '').toString().trim()}`);
  return false;
}

function listExtractedFiles(dir) {
  if (!existsSync(dir)) return [];
  const files = [];
  function walk(d) {
    let entries;
    try { entries = readdirSync(d); } catch { return; }
    for (const entry of entries) {
      const full = join(d, entry);
      try {
        if (statSync(full).isDirectory()) {
          walk(full);
        } else {
          files.push(full.slice(dir.length + 1)); // relative path
        }
      } catch { }
    }
  }
  walk(dir);
  return files.sort();
}

// ---------------------------------------------------------------------------
// HTML utilities
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

// ---------------------------------------------------------------------------
// Zophar's Domain: parse game list page
//
// Table rows: <a href="/music/{platform-zophar}/{game-slug}">{Game Name}</a>
// Pagination: ?page=N
// ---------------------------------------------------------------------------

function parseZopharGameList(html, platform) {
  const games = [];
  const seen  = new Set();

  const re = new RegExp(
    `href="/music/${platform.zophar}/([a-z0-9][a-z0-9-]*)">([^<]{2,})</a>`,
    'g'
  );

  let m;
  while ((m = re.exec(html)) !== null) {
    const zopharSlug = m[1];
    const rawName    = m[2].trim();

    // Skip year/developer/category nav slugs
    if (/^\d{4}$/.test(zopharSlug)) continue;
    if (seen.has(zopharSlug)) continue;
    seen.add(zopharSlug);

    const name = decodeHtmlEntities(rawName);
    if (name.length < 2) continue;

    games.push({
      name,
      zophar_slug: zopharSlug,
      slug: toKebab(name),
      zophar_url: `${ZOPHAR_BASE}/music/${platform.zophar}/${zopharSlug}`,
    });
  }

  return games;
}

// ---------------------------------------------------------------------------
// Zophar's Domain: parse individual game page
//
// EMU download: href containing fi.zophar.net + %28EMU%29 + .zip
// Track list:   <table id="tracklist"> rows with "N. Track Name"
// ---------------------------------------------------------------------------

function parseZopharGamePage(html) {
  // --- EMU (native chiptune) download link ---
  let emuUrl = null;

  // Primary: URL-encoded "(EMU)" in path
  const emuEncoded = html.match(
    /href="(https:\/\/fi\.zophar\.net\/soundfiles\/[^"]+(?:%28EMU%29|%28emu%29)[^"]*\.zip)"/i
  );
  if (emuEncoded) {
    emuUrl = emuEncoded[1];
  }

  // Fallback: any .zophar.zip that is NOT MP3
  if (!emuUrl) {
    const zipRe = /href="(https:\/\/fi\.zophar\.net\/soundfiles\/[^"]+\.zophar\.zip)"/g;
    let zm;
    while ((zm = zipRe.exec(html)) !== null) {
      const u = zm[1];
      if (!/MP3|mp3|%28MP3%29/i.test(u)) {
        emuUrl = u;
        break;
      }
    }
  }

  // --- Track list ---
  const tracks = [];
  const trackTable = html.match(/<table[^>]+id="tracklist"[^>]*>([\s\S]*?)<\/table>/i);
  if (trackTable) {
    const tableHtml = trackTable[1];
    // Match "N. Track Name" in first <td> of each row
    const rowRe = /<td[^>]*>\s*(\d+)\.\s*([^<\n\r]{1,120})/g;
    let rm;
    while ((rm = rowRe.exec(tableHtml)) !== null) {
      const num  = parseInt(rm[1]);
      const name = decodeHtmlEntities(rm[2].trim());
      if (name) tracks.push({ num, name });
    }
  }

  return { emuUrl, tracks };
}

// ---------------------------------------------------------------------------
// Cross-reference maps
// ---------------------------------------------------------------------------

function buildGroundTruthMap() {
  const dir = join(ROOT, 'data/ground-truth/physics');
  if (!existsSync(dir)) return {};
  const map = {};
  try {
    for (const f of readdirSync(dir)) {
      if (!f.endsWith('.json')) continue;
      const stem = f.replace('.json', '');
      map[stem] = `data/ground-truth/physics/${f}`;
    }
  } catch { }
  return map;
}

function buildSpriteMap() {
  const gameListFile = join(ASSETS_DIR, 'game-list.json');
  if (!existsSync(gameListFile)) return {};
  try {
    const data = JSON.parse(readFileSync(gameListFile, 'utf8'));
    const map  = {};
    for (const pdata of Object.values(data.platforms || {})) {
      for (const g of (pdata.games || [])) {
        map[g.slug]     = g.tsr_slug;
        map[g.tsr_slug] = g.tsr_slug;
      }
    }
    return map;
  } catch {
    return {};
  }
}

// ---------------------------------------------------------------------------
// Phase 1: Scrape game list for one platform
// ---------------------------------------------------------------------------

async function scrapeGameList(platform, st) {
  if (RESUME && st[platform.local]?.games_listed) {
    const cached = st[platform.local].games || [];
    log(`[SKIP] Game list for ${platform.name} already scraped (${cached.length} games)`);
    return cached;
  }

  log(`\n[GAMELIST] ${platform.name} — scraping Zophar's Domain...`);

  const allGames = [];
  const seen     = new Set();
  let page       = 1;

  while (true) {
    const url = page === 1
      ? `${ZOPHAR_BASE}/music/${platform.zophar}`
      : `${ZOPHAR_BASE}/music/${platform.zophar}?page=${page}`;

    let html;
    try {
      html = await fetchHTML(url);
    } catch (err) {
      log(`  [ERROR] Page ${page}: ${err.message}`);
      break;
    }

    if (!html) break;

    const games   = parseZopharGameList(html, platform);
    let newCount  = 0;
    for (const g of games) {
      if (!seen.has(g.zophar_slug)) {
        seen.add(g.zophar_slug);
        allGames.push(g);
        newCount++;
      }
    }

    log(`  Page ${page}: ${newCount} new (running total: ${allGames.length})`);

    // Zophar uses ?page=N in pagination links; stop when no next-page link appears
    const hasNext = html.includes(`?page=${page + 1}`) ||
                    html.includes(`page=${page + 1}`);
    if (!hasNext || newCount === 0) break;
    page++;
  }

  log(`[GAMELIST] ${platform.name}: ${allGames.length} games found`);

  if (!st[platform.local]) st[platform.local] = {};
  st[platform.local].games         = allGames;
  st[platform.local].games_listed  = true;
  saveState(st);

  return allGames;
}

// ---------------------------------------------------------------------------
// Phase 2: Download + extract music for one game
// ---------------------------------------------------------------------------

async function downloadGame(game, platform, st, groundTruthMap, spriteMap) {
  if (RESUME && isGameComplete(st, platform.local, game.zophar_slug)) {
    return { skipped: true };
  }

  const gameDir  = join(MUSIC_DIR, platform.local, game.slug);
  const zipPath  = join(gameDir, 'archive.zip');
  const trackDir = join(gameDir, 'tracks');

  // --- Fetch game page ---
  let html;
  try {
    html = await fetchHTML(game.zophar_url);
  } catch (err) {
    log(`  [ERROR] Fetching game page: ${err.message}`);
    return { error: err.message };
  }

  if (!html) {
    log(`  [404] Game page not found: ${game.zophar_url}`);
    markGameComplete(st, platform.local, game.zophar_slug, { status: 'page_not_found' });
    return { missing: true };
  }

  const { emuUrl, tracks } = parseZopharGamePage(html);

  if (!emuUrl) {
    log(`  [MISSING] No native-format ZIP found — MP3-only or page structure changed`);
    markGameComplete(st, platform.local, game.zophar_slug, {
      status: 'no_emu_zip',
      track_count: tracks.length,
    });
    return { missing: true, track_count: tracks.length };
  }

  if (DRY_RUN) {
    return {
      indexEntry: buildIndexEntry(game, platform, tracks, [], emuUrl, groundTruthMap, spriteMap, true),
    };
  }

  // --- Download ZIP ---
  let zipSize = 0;
  try {
    const dl = await downloadBinary(emuUrl, zipPath);
    if (dl.notFound) {
      log(`  [404] ZIP URL returned 404: ${emuUrl}`);
      markGameComplete(st, platform.local, game.zophar_slug, { status: 'zip_404' });
      return { missing: true };
    }
    zipSize = dl.size;
    if (!dl.skipped) {
      log(`  Downloaded ${(zipSize / 1024).toFixed(1)} KB`);
    }
  } catch (err) {
    log(`  [FAIL] Download: ${err.message}`);
    return { error: err.message };
  }

  // --- Extract ZIP ---
  const extracted = extractZip(zipPath, trackDir);
  if (!extracted) {
    log(`  [WARN] Extraction failed — archive kept, tracks/ empty`);
  }

  const trackFiles = listExtractedFiles(trackDir);
  log(`  Extracted ${trackFiles.length} files`);

  const indexEntry = buildIndexEntry(
    game, platform, tracks, trackFiles, emuUrl, groundTruthMap, spriteMap, false
  );

  markGameComplete(st, platform.local, game.zophar_slug, {
    status: 'ok',
    track_count: indexEntry.track_count,
    zip_size_bytes: zipSize,
  });

  return { indexEntry };
}

function buildIndexEntry(game, platform, tracks, trackFiles, emuUrl, groundTruthMap, spriteMap, dryRun) {
  // Ground truth: try "game-slug-platform", "game-slug", "zophar-slug"
  const gtRef = groundTruthMap[`${game.slug}-${platform.local}`] ||
                groundTruthMap[game.slug] ||
                groundTruthMap[game.zophar_slug] ||
                null;

  const spriteRef = spriteMap[game.slug] || spriteMap[game.zophar_slug] || null;

  const entry = {
    platform:      platform.local,
    game_slug:     game.slug,
    game_name:     game.name,
    zophar_slug:   game.zophar_slug,
    format:        platform.format,
    track_count:   dryRun ? tracks.length : (trackFiles.length || tracks.length),
    tracks:        tracks.map(t => ({ num: t.num, name: t.name })),
    source:        'zophar',
    ground_truth_ref: gtRef,
    sprite_ref:    spriteRef,
  };

  if (!dryRun) {
    entry.zip_file   = `data/assets/music/${platform.local}/${game.slug}/archive.zip`;
    entry.tracks_dir = `data/assets/music/${platform.local}/${game.slug}/tracks/`;
    entry.track_files = trackFiles;
  } else {
    entry.emu_url = emuUrl;
  }

  return entry;
}

// ---------------------------------------------------------------------------
// Phase 3: Build music-index.json
// ---------------------------------------------------------------------------

function buildMusicIndex(entries) {
  const byPlatform = {};
  let totalTracks  = 0;

  for (const e of entries) {
    if (!byPlatform[e.platform]) {
      byPlatform[e.platform] = { game_count: 0, track_count: 0, format: e.format };
    }
    byPlatform[e.platform].game_count++;
    byPlatform[e.platform].track_count += (e.track_count || 0);
    totalTracks += (e.track_count || 0);
  }

  const index = {
    generated_at:  new Date().toISOString(),
    total_games:   entries.length,
    total_tracks:  totalTracks,
    by_platform:   byPlatform,
    entries,
  };

  writeFileSync(INDEX_FILE, JSON.stringify(index, null, 2));
  log(`\n[INDEX] music-index.json written — ${entries.length} games, ${totalTracks} tracks across ${Object.keys(byPlatform).length} platforms`);
  return index;
}

// ---------------------------------------------------------------------------
// Index rebuild from disk (--index-only)
// ---------------------------------------------------------------------------

function rebuildIndexFromDisk() {
  log('[INDEX-ONLY] Scanning existing music files on disk...');
  if (!existsSync(MUSIC_DIR)) {
    log('[ERROR] Music directory does not exist: ' + MUSIC_DIR);
    process.exit(1);
  }

  const groundTruthMap = buildGroundTruthMap();
  const spriteMap      = buildSpriteMap();
  const entries        = [];

  for (const platformLocal of readdirSync(MUSIC_DIR)) {
    const platformDir = join(MUSIC_DIR, platformLocal);
    if (!statSync(platformDir).isDirectory()) continue;
    const platform = PLATFORMS.find(p => p.local === platformLocal);

    for (const gameSlug of readdirSync(platformDir)) {
      const gameDir  = join(platformDir, gameSlug);
      if (!statSync(gameDir).isDirectory()) continue;

      const zipPath  = join(gameDir, 'archive.zip');
      const trackDir = join(gameDir, 'tracks');
      const trackFiles = existsSync(trackDir) ? listExtractedFiles(trackDir) : [];

      const gtRef     = groundTruthMap[`${gameSlug}-${platformLocal}`] ||
                        groundTruthMap[gameSlug] || null;
      const spriteRef = spriteMap[gameSlug] || null;

      entries.push({
        platform:      platformLocal,
        game_slug:     gameSlug,
        game_name:     gameSlug,         // name not available from disk alone
        format:        platform?.format || '?',
        track_count:   trackFiles.length,
        track_files:   trackFiles,
        zip_file:      existsSync(zipPath)
          ? `data/assets/music/${platformLocal}/${gameSlug}/archive.zip`
          : null,
        tracks_dir:    existsSync(trackDir)
          ? `data/assets/music/${platformLocal}/${gameSlug}/tracks/`
          : null,
        source:        'zophar',
        ground_truth_ref: gtRef,
        sprite_ref:    spriteRef,
      });
    }
  }

  buildMusicIndex(entries);
  log(`[INDEX-ONLY] Done. ${entries.length} games indexed.`);
}

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------

async function main() {
  mkdirSync(ASSETS_DIR, { recursive: true });
  mkdirSync(MUSIC_DIR,  { recursive: true });
  if (!existsSync(LOG_FILE)) writeFileSync(LOG_FILE, '');

  log(`\n${'='.repeat(70)}`);
  log('Two Fires Music Scraper');
  log(`Mode: ${DRY_RUN ? 'DRY RUN' : INDEX_ONLY ? 'INDEX ONLY' : 'DOWNLOAD'}${RESUME ? ' + RESUME' : ''}`);
  log(`Source: Zophar's Domain (primary) | SNESMusic.org | Project2612`);
  log(`Target platform: ${TARGET_PLATFORM || 'all'}`);
  if (TARGET_GAME) log(`Target game: ${TARGET_GAME}`);
  log(`${'='.repeat(70)}`);

  if (INDEX_ONLY) {
    rebuildIndexFromDisk();
    return;
  }

  const st             = loadState();
  const groundTruthMap = buildGroundTruthMap();
  const spriteMap      = buildSpriteMap();

  // Load existing index entries so --resume produces a complete index
  const existingEntries = RESUME && existsSync(INDEX_FILE)
    ? (JSON.parse(readFileSync(INDEX_FILE, 'utf8')).entries || [])
    : [];
  const existingByKey = {};
  for (const e of existingEntries) {
    existingByKey[`${e.platform}:${e.game_slug}`] = e;
  }

  let platforms = PLATFORMS;
  if (TARGET_PLATFORM) {
    platforms = PLATFORMS.filter(p => p.local === TARGET_PLATFORM || p.zophar === TARGET_PLATFORM);
    if (!platforms.length) {
      log(`[ERROR] Unknown platform: "${TARGET_PLATFORM}"`);
      log(`Available: ${PLATFORMS.map(p => p.local).join(', ')}`);
      process.exit(1);
    }
  }

  // -------------------------------------------------------------------------
  // PHASE 1 — Game lists
  // -------------------------------------------------------------------------
  log('\n[PHASE 1] Building master game list...');

  const masterList = {};
  for (const platform of platforms) {
    masterList[platform.local] = await scrapeGameList(platform, st);
  }

  log('\n[PHASE 1 SUMMARY] Game counts:');
  let grandTotalGames = 0;
  for (const [plocal, games] of Object.entries(masterList)) {
    log(`  ${plocal.padEnd(18)} ${games.length} games`);
    grandTotalGames += games.length;
  }
  log(`  ${'TOTAL'.padEnd(18)} ${grandTotalGames} games`);

  if (DRY_RUN) {
    log('\n[DRY RUN] Game list built. No downloads performed.');
    return;
  }

  // -------------------------------------------------------------------------
  // PHASE 2 — Download
  // -------------------------------------------------------------------------
  log('\n[PHASE 2] Downloading music archives...');

  let grandDownloaded = 0;
  let grandSkipped    = 0;
  let grandMissing    = 0;
  let grandFailed     = 0;
  const allEntries    = [...existingEntries]; // seed with existing for --resume
  const processedKeys = new Set(existingEntries.map(e => `${e.platform}:${e.game_slug}`));

  for (const platform of platforms) {
    const games = masterList[platform.local];
    let gamesToProcess = TARGET_GAME
      ? games.filter(g => g.zophar_slug === TARGET_GAME || g.slug === TARGET_GAME)
      : games;

    if (TARGET_GAME && !gamesToProcess.length) {
      log(`[WARN] Game "${TARGET_GAME}" not found in ${platform.name}`);
      continue;
    }

    log(`\n${'—'.repeat(60)}`);
    log(`[PLATFORM] ${platform.name} — ${gamesToProcess.length} games`);
    log(`${'—'.repeat(60)}`);

    let platDownloaded = 0;
    let platMissing    = 0;
    let platFailed     = 0;

    for (let i = 0; i < gamesToProcess.length; i++) {
      const game = gamesToProcess[i];
      const pct  = Math.round(((i + 1) / gamesToProcess.length) * 100);
      log(`\n[${i + 1}/${gamesToProcess.length} ${pct}%] ${game.name} (${platform.local}/${game.slug})`);

      try {
        const result = await downloadGame(game, platform, st, groundTruthMap, spriteMap);

        if (result.skipped) {
          log('  [SKIP] Already completed');
          grandSkipped++;
          // Entry already in allEntries from seed above
        } else if (result.error) {
          log(`  [ERROR] ${result.error}`);
          grandFailed++;
          platFailed++;
        } else if (result.missing) {
          grandMissing++;
          platMissing++;
        } else if (result.indexEntry) {
          const key = `${platform.local}:${game.slug}`;
          if (!processedKeys.has(key)) {
            allEntries.push(result.indexEntry);
            processedKeys.add(key);
          }
          grandDownloaded++;
          platDownloaded++;
          log(`  => ${result.indexEntry.track_count} tracks (${platform.format.toUpperCase()})`);
        }
      } catch (err) {
        log(`  [FATAL] ${game.name}: ${err.stack || err.message}`);
        grandFailed++;
        platFailed++;
      }
    }

    log(`\n[PLATFORM DONE] ${platform.name}: ${platDownloaded} downloaded, ${platMissing} missing, ${platFailed} failed`);
  }

  // -------------------------------------------------------------------------
  // PHASE 3 — Index
  // -------------------------------------------------------------------------
  log('\n[PHASE 3] Building music-index.json...');
  buildMusicIndex(allEntries);

  log('\n' + '='.repeat(70));
  log('SCRAPE COMPLETE');
  log('='.repeat(70));
  log(`  Downloaded:  ${grandDownloaded} games`);
  log(`  Skipped:     ${grandSkipped} (already complete)`);
  log(`  Missing:     ${grandMissing} (no native format on Zophar's)`);
  log(`  Failed:      ${grandFailed}`);
  log(`  Index total: ${allEntries.length} games`);
  log(`\n  music-index.json:  ${INDEX_FILE}`);
  log(`  music dir:         ${MUSIC_DIR}`);
  log(`  log:               ${LOG_FILE}`);
  log('\nTip: run --index-only after a full scrape to ensure a complete index.');
}

main().catch(err => {
  log(`[FATAL] ${err.stack || err.message}`);
  process.exit(1);
});
