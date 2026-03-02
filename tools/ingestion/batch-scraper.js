/**
 * batch-scraper.js
 *
 * Step 2 of the ingestion pipeline: fetch raw documentation from all source URLs
 * and save locally to raw-data/[game-id]/[source-name].txt
 *
 * Usage:
 *   node batch-scraper.js --platform=nes
 *   node batch-scraper.js --platform=snes
 *   node batch-scraper.js --platform=genesis
 *   node batch-scraper.js --game=super-mario-world-snes   (single game)
 *   node batch-scraper.js --platform=nes --resume          (skip already-fetched)
 *
 * Output:
 *   raw-data/[game-id]/[source-key].txt   (raw page text)
 *   raw-data/[game-id]/manifest.json      (fetch status per source)
 */

import { readFileSync, writeFileSync, mkdirSync, existsSync, readdirSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));

// --- Config ---
const RAW_DATA_DIR = join(__dirname, 'raw-data');
const GAME_LISTS_DIR = join(__dirname, 'game-lists');
const DELAY_BETWEEN_REQUESTS_MS = 1500; // Be polite to servers
const REQUEST_TIMEOUT_MS = 15000;
const MAX_RETRIES = 2;

// Source keys to fetch (in priority order — data_crystal and tasvideos have the most structured data)
const SOURCE_PRIORITY = [
  'data_crystal',
  'tasvideos',
  'sonic_retro',
  'disassembly',
  'wiki',
  'tcrf',
  'spriters_resource',
];

// --- Args ---
const args = Object.fromEntries(
  process.argv.slice(2)
    .filter(a => a.startsWith('--'))
    .map(a => {
      const [key, val] = a.slice(2).split('=');
      return [key, val ?? true];
    })
);

// --- Helpers ---
function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

function loadGameList(platform) {
  // Glob all ${platform}-*.json files and merge their games arrays
  const files = readdirSync(GAME_LISTS_DIR)
    .filter(f => f.startsWith(`${platform}-`) && f.endsWith('.json'))
    .sort();
  if (files.length === 0) {
    throw new Error(`No game list files found for platform: ${platform} in ${GAME_LISTS_DIR}`);
  }
  const allGames = [];
  for (const file of files) {
    const data = JSON.parse(readFileSync(join(GAME_LISTS_DIR, file), 'utf8'));
    if (Array.isArray(data.games)) allGames.push(...data.games);
  }
  return { platform, games: allGames };
}

function getManifest(gameDir) {
  const manifestPath = join(gameDir, 'manifest.json');
  if (existsSync(manifestPath)) {
    return JSON.parse(readFileSync(manifestPath, 'utf8'));
  }
  return { fetched: {}, errors: {}, last_updated: null };
}

function saveManifest(gameDir, manifest) {
  manifest.last_updated = new Date().toISOString();
  writeFileSync(join(gameDir, 'manifest.json'), JSON.stringify(manifest, null, 2));
}

async function fetchWithTimeout(url, timeoutMs) {
  const controller = new AbortController();
  const timer = setTimeout(() => controller.abort(), timeoutMs);
  try {
    const response = await fetch(url, {
      signal: controller.signal,
      headers: {
        'User-Agent': 'TwoFiresIngestionBot/1.0 (research; non-commercial)',
        'Accept': 'text/html,text/plain,*/*',
      },
    });
    clearTimeout(timer);
    return response;
  } catch (err) {
    clearTimeout(timer);
    throw err;
  }
}

// Extract readable text from HTML (strip tags, collapse whitespace)
function htmlToText(html) {
  return html
    .replace(/<script[\s\S]*?<\/script>/gi, '')
    .replace(/<style[\s\S]*?<\/style>/gi, '')
    .replace(/<[^>]+>/g, ' ')
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&#39;/g, "'")
    .replace(/&nbsp;/g, ' ')
    .replace(/\s{3,}/g, '\n\n')
    .trim();
}

async function fetchSource(gameId, sourceKey, url, gameDir, manifest, resume) {
  // Skip if already fetched and resume mode is on
  if (resume && manifest.fetched[sourceKey]) {
    console.log(`  [SKIP] ${sourceKey} (already fetched)`);
    return;
  }

  // Spriters Resource has images, not text — just save the URL reference
  if (sourceKey === 'spriters_resource') {
    manifest.fetched[sourceKey] = { url, note: 'image-only site, URL recorded for Track A reference', skipped: true };
    saveManifest(gameDir, manifest);
    console.log(`  [REF]  ${sourceKey}: ${url} (image site, URL saved)`);
    return;
  }

  let lastError = null;
  for (let attempt = 1; attempt <= MAX_RETRIES + 1; attempt++) {
    try {
      console.log(`  [FETCH] ${sourceKey}: ${url}${attempt > 1 ? ` (attempt ${attempt})` : ''}`);
      const response = await fetchWithTimeout(url, REQUEST_TIMEOUT_MS);

      if (!response.ok) {
        throw new Error(`HTTP ${response.status} ${response.statusText}`);
      }

      const contentType = response.headers.get('content-type') || '';
      const raw = await response.text();
      const text = contentType.includes('html') ? htmlToText(raw) : raw;

      const outputPath = join(gameDir, `${sourceKey}.txt`);
      writeFileSync(outputPath, text, 'utf8');

      manifest.fetched[sourceKey] = {
        url,
        fetched_at: new Date().toISOString(),
        size_bytes: text.length,
        content_type: contentType,
      };
      saveManifest(gameDir, manifest);
      console.log(`  [OK]   ${sourceKey}: ${text.length} chars`);
      return;

    } catch (err) {
      lastError = err;
      if (attempt <= MAX_RETRIES) {
        await sleep(DELAY_BETWEEN_REQUESTS_MS * attempt);
      }
    }
  }

  // All attempts failed
  manifest.errors[sourceKey] = {
    url,
    error: lastError?.message || 'unknown error',
    attempted_at: new Date().toISOString(),
  };
  saveManifest(gameDir, manifest);
  console.log(`  [FAIL] ${sourceKey}: ${lastError?.message}`);
}

async function scrapeGame(game, resume) {
  const gameDir = join(RAW_DATA_DIR, game.id);
  mkdirSync(gameDir, { recursive: true });

  const manifest = getManifest(gameDir);

  // Save game metadata
  writeFileSync(join(gameDir, 'game-info.json'), JSON.stringify({
    id: game.id,
    name: game.name,
    platform: game.platform,
    year: game.year,
    developer: game.developer,
    paradigm: game.paradigm,
    tier: game.tier,
    notes: game.notes,
  }, null, 2));

  console.log(`\n[${game.id}] ${game.name} (${game.year}, tier ${game.tier})`);

  const sources = game.sources || {};
  for (const sourceKey of SOURCE_PRIORITY) {
    if (sources[sourceKey]) {
      await fetchSource(game.id, sourceKey, sources[sourceKey], gameDir, manifest, resume);
      await sleep(DELAY_BETWEEN_REQUESTS_MS);
    }
  }

  // Fetch any sources not in the priority list (skip non-URL values like the "other" notes field)
  for (const [key, url] of Object.entries(sources)) {
    if (!SOURCE_PRIORITY.includes(key) && typeof url === 'string' && url.startsWith('http')) {
      await fetchSource(game.id, key, url, gameDir, manifest, resume);
      await sleep(DELAY_BETWEEN_REQUESTS_MS);
    }
  }

  const fetchCount = Object.keys(manifest.fetched).length;
  const errorCount = Object.keys(manifest.errors).length;
  console.log(`  => ${fetchCount} fetched, ${errorCount} errors`);
}

// --- Main ---
async function main() {
  if (!args.platform && !args.game) {
    console.error('Usage: node batch-scraper.js --platform=nes|snes|genesis [--resume]');
    console.error('       node batch-scraper.js --game=super-mario-world-snes [--resume]');
    process.exit(1);
  }

  const resume = !!args.resume;
  mkdirSync(RAW_DATA_DIR, { recursive: true });

  let games = [];

  if (args.game) {
    // Single-game mode: try to find in all lists
    for (const platform of ['nes', 'snes', 'genesis']) {
      try {
        const list = loadGameList(platform);
        const found = list.games.find(g => g.id === args.game);
        if (found) { games = [found]; break; }
      } catch {}
    }
    if (!games.length) {
      console.error(`Game not found: ${args.game}`);
      process.exit(1);
    }
  } else {
    const list = loadGameList(args.platform);
    games = list.games;
    console.log(`Loaded ${games.length} games for platform: ${args.platform}`);
  }

  const startTime = Date.now();
  let successCount = 0;
  let failCount = 0;

  for (let i = 0; i < games.length; i++) {
    const game = games[i];
    console.log(`\n[${i + 1}/${games.length}]`);
    try {
      await scrapeGame(game, resume);
      successCount++;
    } catch (err) {
      console.error(`  [ERROR] Failed to scrape ${game.id}: ${err.message}`);
      failCount++;
    }
  }

  const elapsed = Math.round((Date.now() - startTime) / 1000);
  console.log(`\n=== DONE ===`);
  console.log(`${successCount} games scraped, ${failCount} failed`);
  console.log(`Time: ${elapsed}s`);
  console.log(`Raw data saved to: ${RAW_DATA_DIR}`);
}

main().catch(err => {
  console.error(err);
  process.exit(1);
});
