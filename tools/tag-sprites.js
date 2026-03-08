#!/usr/bin/env node
/**
 * tag-sprites.js (v2)
 *
 * Vision tagging for sprite sheets via Claude Haiku API.
 * Sends each sheet PNG + all known context to Claude Haiku and gets back
 * structured entity data with bounding boxes.
 *
 * Scope: Essential+Nice categories (player, enemy, boss, npc, item, tileset,
 *        background, character, portrait) for ALL games, plus stage_map
 *        sheets for the top 500 games by sheet count.
 *
 * Features:
 *   - 5 concurrent API requests (configurable)
 *   - Auto-resize oversized images (>4096px) before sending
 *   - Resumable (skips already-tagged sheets)
 *   - Checkpoints every 100 sheets
 *   - Retries on rate limit (429) with backoff
 *   - Retries once on JSON parse failure
 *
 * Usage:
 *   node tools/tag-sprites.js                        # run with smart scope
 *   node tools/tag-sprites.js --resume               # skip already-tagged
 *   node tools/tag-sprites.js --limit=100            # process N sheets then stop
 *   node tools/tag-sprites.js --concurrency=10       # parallel requests
 *   node tools/tag-sprites.js --dry-run              # show what would be tagged
 *   node tools/tag-sprites.js --all                  # tag everything (no scope filter)
 *   node tools/tag-sprites.js --platform=nes         # single platform
 *   node tools/tag-sprites.js --ids=12345,67890      # specific asset IDs only
 *
 * Requires: ANTHROPIC_API_KEY environment variable
 *           npm install sharp
 *
 * Output:
 *   Updates data/assets/asset-catalog.json in place (vision_tags field)
 */

import {
  readFileSync, writeFileSync, existsSync,
} from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

let sharp;
try {
  sharp = (await import('sharp')).default;
} catch {
  console.error('ERROR: sharp not installed. Run: npm install sharp');
  process.exit(1);
}

const __filename = fileURLToPath(import.meta.url);
const __dirname  = dirname(__filename);
const ROOT       = join(__dirname, '..');

// ---------------------------------------------------------------------------
// Config
// ---------------------------------------------------------------------------

const CATALOG_FILE  = join(ROOT, 'data/assets/asset-catalog.json');
const API_URL       = 'https://api.anthropic.com/v1/messages';
const MODEL         = 'claude-haiku-4-5-20251001';
const MAX_TOKENS    = 4000;
const MAX_IMAGE_DIM = 4096;

const API_KEY = process.env.ANTHROPIC_API_KEY;

const args = Object.fromEntries(
  process.argv.slice(2)
    .filter(a => a.startsWith('--'))
    .map(a => { const [k, v] = a.slice(2).split('='); return [k, v ?? true]; })
);

const PLATFORM_FILTER = args.platform || null;
const RESUME          = !!args.resume;
const LIMIT           = args.limit ? parseInt(args.limit) : Infinity;
const CONCURRENCY     = args.concurrency ? parseInt(args.concurrency) : 5;
const DRY_RUN         = !!args['dry-run'];
const TAG_ALL         = !!args.all;
const ID_FILTER       = args.ids ? new Set(args.ids.split(',').map(Number)) : null;

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

// ---------------------------------------------------------------------------
// Scope filtering
// ---------------------------------------------------------------------------

function buildScope(entries) {
  if (TAG_ALL) return new Set(entries.map(e => e.file));
  if (ID_FILTER) return new Set(entries.filter(e => ID_FILTER.has(e.asset_id)).map(e => e.file));

  const essentialNice = ['player', 'enemy', 'boss', 'npc', 'item', 'tileset',
                         'background', 'character', 'portrait'];

  // Find top 500 games by sheet count
  const gameSizes = {};
  for (const e of entries) {
    const key = e.platform + '/' + e.game_slug;
    gameSizes[key] = (gameSizes[key] || 0) + 1;
  }
  const top500 = new Set(
    Object.entries(gameSizes)
      .sort((a, b) => b[1] - a[1])
      .slice(0, 500)
      .map(([k]) => k)
  );

  const scope = new Set();
  for (const e of entries) {
    if (essentialNice.includes(e.category)) {
      scope.add(e.file);
    } else if (e.category === 'stage_map' && top500.has(e.platform + '/' + e.game_slug)) {
      scope.add(e.file);
    }
  }
  return scope;
}

// ---------------------------------------------------------------------------
// Image preparation (resize oversized sheets)
// ---------------------------------------------------------------------------

async function prepareImage(filePath) {
  const buf = readFileSync(filePath);
  const metadata = await sharp(buf).metadata();
  const { width, height } = metadata;

  if (width <= MAX_IMAGE_DIM && height <= MAX_IMAGE_DIM) {
    return { data: buf.toString('base64'), width, height, resized: false };
  }

  const scale = MAX_IMAGE_DIM / Math.max(width, height);
  const newW = Math.round(width * scale);
  const newH = Math.round(height * scale);

  const resized = await sharp(buf)
    .resize(newW, newH, { kernel: 'nearest' })
    .png()
    .toBuffer();

  return { data: resized.toString('base64'), width: newW, height: newH, resized: true, originalWidth: width, originalHeight: height };
}

// ---------------------------------------------------------------------------
// Build the vision prompt
// ---------------------------------------------------------------------------

function buildPrompt(entry, imgInfo) {
  const parts = [
    `This is a sprite sheet from "${entry.game_name}" (${entry.platform_name || entry.platform}).`,
  ];

  if (entry.category_raw) parts.push(`Category: ${entry.category_raw}.`);
  if (entry.sheet_name) parts.push(`Sheet name: "${entry.sheet_name}".`);

  const w = imgInfo.originalWidth || entry.width;
  const h = imgInfo.originalHeight || entry.height;
  if (w && h) parts.push(`Original dimensions: ${w}x${h} pixels.`);
  if (imgInfo.resized) parts.push(`(Image was resized for processing; original was ${imgInfo.originalWidth}x${imgInfo.originalHeight}.)`);

  if (entry.programmatic_tags?.estimated_grid) {
    const g = entry.programmatic_tags.estimated_grid;
    parts.push(`Detected grid: ${g.cell_w}x${g.cell_h} pixel cells.`);
  }

  parts.push('');
  parts.push('Analyze this sprite sheet. Respond with ONLY a JSON object (no markdown, no backticks):');
  parts.push('');
  parts.push(JSON.stringify({
    sheet_description: "One-line summary of sheet contents",
    sheet_layout: "grid | packed | single | stage_map",
    game_context: "How these sprites are used in the game",
    entities: [
      {
        name: "Entity name (e.g. 'Goomba', 'Mario - Fire Flower', 'Ground Tile')",
        type: "player | enemy | boss | npc | item | tile | background | ui | projectile | effect | decoration | obstacle",
        named_character: "Known character name if recognizable, else null",
        bounding_box: { x: 0, y: 0, w: 16, h: 16 },
        animation_states: ["idle", "walk_frame1", "walk_frame2"],
        visual_descriptors: ["round", "brown", "small", "2-frame walk cycle"],
        approximate_dimensions: "16x16",
      }
    ],
  }, null, 2));

  parts.push('');
  parts.push('Rules:');
  parts.push('- List up to 20 distinct entities/sprite groups (most important first)');
  parts.push('- Bounding boxes encompass all frames of each entity');
  parts.push('- For stage maps, describe the scene structure rather than individual tiles');
  parts.push('- Identify named characters by name when recognizable');
  parts.push('- Be specific about visible animation states');

  return parts.join('\n');
}

// ---------------------------------------------------------------------------
// Fix common Haiku JSON quirks
// ---------------------------------------------------------------------------

function fixJson(text) {
  let s = text.replace(/```json\s*/g, '').replace(/```\s*/g, '').trim();

  // Most responses are valid JSON after code block removal. Return early to
  // avoid the heuristics below corrupting valid number values (e.g. step 2
  // would strip the closing quote from "16x16" and step 3 would then add a
  // spurious quote after bare numbers like `"h": 16`).
  try {
    JSON.parse(s);
    return s;
  } catch {}

  // Fix stray quote after numbers: "h": 98"  →  "h": 98
  s = s.replace(/(\d)"\s*(\n\s*[},])/g, '$1$2');

  // Fix unclosed string values before newline+closing
  s = s.replace(/"([^"]*)\n(\s*[},])/g, (match, content, closing) => {
    if (content.includes('"')) return match;
    return `"${content}"${closing}`;
  });

  return s;
}

// ---------------------------------------------------------------------------
// Call Claude Haiku API (single sheet)
// ---------------------------------------------------------------------------

async function tagSheet(entry, retryCount = 0) {
  const imgPath = join(ROOT, entry.file);
  if (imgPath === undefined || imgPath === null) return { error: 'no_file_path' };

  let imgInfo;
  try {
    imgInfo = await prepareImage(imgPath);
  } catch (err) {
    return { error: 'image_prep_failed', detail: err.message };
  }

  const prompt = buildPrompt(entry, imgInfo);

  try {
    const resp = await fetch(API_URL, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': API_KEY,
        'anthropic-version': '2023-06-01',
      },
      body: JSON.stringify({
        model: MODEL,
        max_tokens: MAX_TOKENS,
        system: 'You output only raw JSON. Never use markdown, code blocks, or backticks. Start your response with { and end with }.',
        messages: [{
          role: 'user',
          content: [
            { type: 'image', source: { type: 'base64', media_type: 'image/png', data: imgInfo.data } },
            { type: 'text', text: prompt },
          ],
        }],
      }),
    });

    if (resp.status === 429) {
      const wait = 30 + Math.random() * 30;
      log(`  [RATE LIMIT] Waiting ${wait.toFixed(0)}s...`);
      await sleep(wait * 1000);
      return tagSheet(entry, retryCount);
    }

    if (resp.status === 529) {
      log('  [OVERLOADED] API overloaded, waiting 60s...');
      await sleep(60000);
      return tagSheet(entry, retryCount);
    }

    if (resp.ok === false) {
      const errText = await resp.text();
      return { error: `api_${resp.status}`, detail: errText.slice(0, 300) };
    }

    const data = await resp.json();
    const text = data.content?.[0]?.text || '';
    const cleaned = fixJson(text);
    const parsed = JSON.parse(cleaned);
    return parsed;

  } catch (err) {
    if (err instanceof SyntaxError && retryCount < 1) {
      log(`  [JSON RETRY] ${entry.game_name} / ${entry.sheet_name || entry.asset_id}`);
      await sleep(500);
      return tagSheet(entry, retryCount + 1);
    }
    return { error: err instanceof SyntaxError ? 'json_parse_failed' : err.message };
  }
}

// ---------------------------------------------------------------------------
// Concurrent batch processor
// ---------------------------------------------------------------------------

async function processBatch(candidates, entries, catalog) {
  let processed = 0;
  let successes = 0;
  let errors = 0;
  let inFlight = 0;
  let idx = 0;

  const results = [];

  function saveCheckpoint() {
    writeFileSync(CATALOG_FILE, JSON.stringify(catalog, null, 2));
    log(`  [CHECKPOINT] Saved (${successes} ok, ${errors} errors)`);
  }

  return new Promise((resolve) => {
    function launchNext() {
      while (inFlight < CONCURRENCY && idx < candidates.length && processed < LIMIT) {
        const candidate = candidates[idx++];
        const entryIdx = entries.indexOf(candidate);
        inFlight++;
        processed++;

        tagSheet(candidate).then((result) => {
          inFlight--;

          if (result.error) {
            errors++;
            entries[entryIdx].vision_tags = { error: result.error, detail: result.detail || null };
            if (errors <= 20) {
              log(`  [ERROR] ${candidate.game_name} / ${candidate.sheet_name || candidate.asset_id}: ${result.error}`);
            }
          } else {
            successes++;
            entries[entryIdx].vision_tags = result;
          }

          if (processed % 100 === 0) {
            log(`  Tagged ${processed} sheets (${successes} ok, ${errors} errors)`);
            saveCheckpoint();
          }

          if (inFlight === 0 && (idx >= candidates.length || processed >= LIMIT)) {
            saveCheckpoint();
            resolve({ processed, successes, errors });
          } else {
            launchNext();
          }
        });
      }

      if (candidates.length === 0) {
        resolve({ processed: 0, successes: 0, errors: 0 });
      }
    }

    launchNext();
  });
}

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------

async function main() {
  log('=== Two Fires Sprite Vision Tagger v2 ===');

  if (API_KEY === undefined && DRY_RUN === false) {
    log('ERROR: ANTHROPIC_API_KEY not set.');
    log('  export ANTHROPIC_API_KEY=sk-ant-...');
    process.exit(1);
  }

  if (existsSync(CATALOG_FILE) === false) {
    log('ERROR: asset-catalog.json not found. Run enrich-sheet-names.js first.');
    process.exit(1);
  }

  const catalog = JSON.parse(readFileSync(CATALOG_FILE, 'utf-8'));
  const entries = catalog.entries;
  log(`Catalog has ${entries.length} entries`);

  // Build scope
  const scope = buildScope(entries);
  log(`Scope: ${scope.size} sheets in tagging scope`);

  // Filter candidates
  let candidates = entries.filter(e => {
    if (scope.has(e.file) === false) return false;
    if (PLATFORM_FILTER && e.platform !== PLATFORM_FILTER) return false;
    if (RESUME && e.vision_tags !== null && (e.vision_tags.error === undefined)) return false;
    if (ID_FILTER && ID_FILTER.has(e.asset_id) === false) return false;
    return true;
  });

  // Check for missing files upfront
  const missing = candidates.filter(e => existsSync(join(ROOT, e.file)) === false);
  if (missing.length > 0) {
    log(`WARNING: ${missing.length} files not found on disk, will skip`);
    candidates = candidates.filter(e => existsSync(join(ROOT, e.file)));
  }

  log(`Candidates: ${candidates.length} sheets to tag`);
  log(`Concurrency: ${CONCURRENCY}`);
  if (LIMIT < Infinity) log(`Limit: ${LIMIT}`);

  if (DRY_RUN) {
    const byCat = {};
    candidates.forEach(e => { byCat[e.category] = (byCat[e.category] || 0) + 1; });
    log('\n--- DRY RUN ---');
    log('By category:');
    Object.entries(byCat).sort((a, b) => b[1] - a[1]).forEach(([k, v]) => log(`  ${k}: ${v}`));
    log(`\nEstimated cost: ~$${(candidates.length * 0.004).toFixed(0)}`);
    log(`Estimated time (${CONCURRENCY} concurrent): ~${(candidates.length * 10 / CONCURRENCY / 3600).toFixed(1)} hours`);
    return;
  }

  const result = await processBatch(candidates, entries, catalog);

  log('\n======================================================================');
  log('VISION TAGGING COMPLETE');
  log('======================================================================');
  log(`  Sheets tagged: ${result.processed}`);
  log(`  Successes:     ${result.successes}`);
  log(`  Errors:        ${result.errors}`);
  log(`  Output:        ${CATALOG_FILE}`);
}

main().catch(err => {
  console.error('Fatal error:', err);
  process.exit(1);
});
