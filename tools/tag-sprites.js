#!/usr/bin/env node
/**
 * tag-sprites.js
 *
 * Vision tagging for sprite sheets via Claude Haiku API.
 * Sends each sheet PNG + all known context (game name, platform, category,
 * sheet name) to Claude Haiku and gets back structured entity data.
 *
 * What it extracts per sheet:
 *   - entities: array of { name, type, bounding_box, animation_states,
 *               visual_descriptors, named_character }
 *   - sheet_description: one-line summary of sheet contents
 *   - sheet_layout: 'grid' | 'packed' | 'single' | 'stage_map'
 *   - game_context: how these sprites are used in the game
 *
 * Usage:
 *   node tools/tag-sprites.js                        # all entries
 *   node tools/tag-sprites.js --platform=nes         # single platform
 *   node tools/tag-sprites.js --resume               # skip already-tagged
 *   node tools/tag-sprites.js --limit=100            # process N sheets then stop
 *   node tools/tag-sprites.js --priority=platformer  # prioritize platformer games
 *   node tools/tag-sprites.js --dry-run              # show what would be tagged, no API calls
 *
 * Requires: ANTHROPIC_API_KEY environment variable
 *
 * Cost estimate: ~$0.0005 per sheet (Haiku vision) → ~$25 for 54K sheets
 *
 * Output:
 *   Updates data/assets/asset-catalog.json in place (vision_tags field)
 */

import {
  readFileSync, writeFileSync, existsSync,
} from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname  = dirname(__filename);
const ROOT       = join(__dirname, '..');

// ---------------------------------------------------------------------------
// Config
// ---------------------------------------------------------------------------

const CATALOG_FILE = join(ROOT, 'data/assets/asset-catalog.json');
const API_URL      = 'https://api.anthropic.com/v1/messages';
const MODEL        = 'claude-haiku-4-5-20251001';
const MAX_TOKENS   = 2000;
const RATE_LIMIT_MS = 200;

const API_KEY = process.env.ANTHROPIC_API_KEY;

const args = Object.fromEntries(
  process.argv.slice(2)
    .filter(a => a.startsWith('--'))
    .map(a => { const [k, v] = a.slice(2).split('='); return [k, v ?? true]; })
);

const PLATFORM_FILTER = args.platform || null;
const RESUME          = !!args.resume;
const LIMIT           = args.limit ? parseInt(args.limit) : Infinity;
const PRIORITY        = args.priority || null;
const DRY_RUN         = !!args['dry-run'];

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
// Priority ordering for platformer-first tagging
// ---------------------------------------------------------------------------

const PLATFORMER_GAMES = new Set([
  'super-mario-bros', 'super-mario-bros-2', 'super-mario-bros-3',
  'super-mario-world', 'super-mario-world-2-yoshis-island',
  'mega-man', 'mega-man-2', 'mega-man-3', 'mega-man-4', 'mega-man-5', 'mega-man-6',
  'mega-man-x', 'mega-man-x2', 'mega-man-x3',
  'sonic-the-hedgehog', 'sonic-the-hedgehog-2', 'sonic-the-hedgehog-3',
  'castlevania', 'castlevania-iii-draculas-curse', 'super-castlevania-iv',
  'metroid', 'super-metroid',
  'contra', 'super-contra', 'contra-iii-the-alien-wars',
  'kirby-s-adventure', 'kirbys-dream-land',
  'donkey-kong-country', 'donkey-kong-country-2-diddys-kong-quest',
  'ghosts-n-goblins', 'super-ghouls-n-ghosts',
  'ninja-gaiden', 'ninja-gaiden-ii', 'ninja-gaiden-iii',
  'duck-tales', 'duck-tales-2',
  'chip-n-dale-rescue-rangers',
  'adventure-island', 'adventure-island-2', 'adventure-island-3',
  'battletoads', 'battletoads-and-double-dragon',
  'bionic-commando', 'strider',
  'shinobi-iii-return-of-the-ninja-master',
  'ristar', 'rocket-knight-adventures', 'sparkster',
  'earthworm-jim', 'earthworm-jim-2',
  'aladdin', 'the-lion-king',
]);

function priorityScore(entry) {
  if (PRIORITY === 'platformer') {
    if (PLATFORMER_GAMES.has(entry.game_slug)) return 0;
    if (entry.category === 'player' || entry.category === 'enemy') return 1;
    return 2;
  }
  return 0;
}

// ---------------------------------------------------------------------------
// Build the vision prompt
// ---------------------------------------------------------------------------

function buildPrompt(entry) {
  const parts = [
    `This is a sprite sheet from the game "${entry.game_name}" (${entry.platform_name || entry.platform}).`,
  ];

  if (entry.category_raw) {
    parts.push(`Category: ${entry.category_raw}.`);
  }
  if (entry.sheet_name) {
    parts.push(`Sheet name: "${entry.sheet_name}".`);
  }
  if (entry.width && entry.height) {
    parts.push(`Sheet dimensions: ${entry.width}×${entry.height} pixels.`);
  }
  if (entry.programmatic_tags?.estimated_grid) {
    const g = entry.programmatic_tags.estimated_grid;
    parts.push(`Detected grid: ${g.cell_w}×${g.cell_h} pixel cells.`);
  }

  parts.push('');
  parts.push('Analyze this sprite sheet and respond with ONLY a JSON object (no markdown, no backticks) with these fields:');
  parts.push('');
  parts.push(JSON.stringify({
    sheet_description: "One-line summary of what this sheet contains",
    sheet_layout: "grid | packed | single | stage_map",
    game_context: "How these sprites are used in the game",
    entities: [
      {
        name: "Entity name (e.g., 'Goomba', 'Mario - Fire Flower', 'Ground Tile')",
        type: "player | enemy | boss | npc | item | tile | background | ui | projectile | effect | decoration | obstacle",
        named_character: "Known character name if recognizable (e.g., 'Mario', 'Mega Man', 'Dr. Wily'), null if generic",
        bounding_box: { x: 0, y: 0, w: 16, h: 16 },
        animation_states: ["idle", "walk_frame1", "walk_frame2"],
        visual_descriptors: ["round", "brown", "small", "2-frame walk cycle"],
        approximate_dimensions: "16x16",
      }
    ],
  }, null, 2));

  parts.push('');
  parts.push('Guidelines:');
  parts.push('- List every distinct entity/sprite group on the sheet');
  parts.push('- Bounding boxes should encompass all frames of each entity');
  parts.push('- For stage maps, describe the overall scene rather than individual tiles');
  parts.push('- Named characters: identify by name if recognizable from the game');
  parts.push('- Be specific about animation states visible (idle, walk, jump, attack, death, etc.)');
  parts.push('- Visual descriptors should be useful for finding similar sprites');

  return parts.join('\n');
}

// ---------------------------------------------------------------------------
// Call Claude Haiku API
// ---------------------------------------------------------------------------

async function tagSheet(entry) {
  const imgPath = join(ROOT, entry.file);
  if (!existsSync(imgPath)) return { error: 'file_not_found' };

  const imgBuf = readFileSync(imgPath);
  const base64 = imgBuf.toString('base64');

  const fileSize = imgBuf.length;
  if (fileSize > 20_000_000) return { error: 'file_too_large', size: fileSize };

  const prompt = buildPrompt(entry);

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
        messages: [{
          role: 'user',
          content: [
            {
              type: 'image',
              source: { type: 'base64', media_type: 'image/png', data: base64 },
            },
            {
              type: 'text',
              text: prompt,
            },
          ],
        }],
      }),
    });

    if (!resp.ok) {
      const errText = await resp.text();
      if (resp.status === 429) {
        log('  [RATE LIMIT] Waiting 30s...');
        await sleep(30000);
        return tagSheet(entry);
      }
      return { error: `api_${resp.status}`, detail: errText.slice(0, 200) };
    }

    const data = await resp.json();
    const text = data.content?.[0]?.text || '';

    const cleaned = text.replace(/```json\s*/g, '').replace(/```\s*/g, '').trim();
    const parsed = JSON.parse(cleaned);
    return parsed;

  } catch (err) {
    if (err instanceof SyntaxError) {
      return { error: 'json_parse_failed', raw_response: (typeof text === 'string' ? text : '').slice(0, 500) };
    }
    return { error: err.message };
  }
}

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------

async function main() {
  log('=== Two Fires Sprite Vision Tagger ===');

  if (!API_KEY && !DRY_RUN) {
    log('ERROR: ANTHROPIC_API_KEY not set. Export it or use --dry-run.');
    log('  export ANTHROPIC_API_KEY=sk-ant-...');
    process.exit(1);
  }

  if (!existsSync(CATALOG_FILE)) {
    log('ERROR: asset-catalog.json not found. Run enrich-sheet-names.js first.');
    process.exit(1);
  }

  const catalog = JSON.parse(readFileSync(CATALOG_FILE, 'utf-8'));
  const entries = catalog.entries;
  log(`Catalog has ${entries.length} entries`);
  log(`Mode: ${DRY_RUN ? 'DRY RUN' : 'LIVE'}${RESUME ? ' + RESUME' : ''}`);
  if (PRIORITY) log(`Priority: ${PRIORITY}`);
  if (LIMIT < Infinity) log(`Limit: ${LIMIT} sheets`);

  // Filter and sort
  let candidates = entries.filter(e => {
    if (PLATFORM_FILTER && e.platform !== PLATFORM_FILTER) return false;
    if (RESUME && e.vision_tags !== null) return false;
    return true;
  });

  candidates.sort((a, b) => priorityScore(a) - priorityScore(b));

  log(`Candidates: ${candidates.length} sheets to tag`);

  if (DRY_RUN) {
    log('\n--- DRY RUN: First 20 candidates ---');
    for (const c of candidates.slice(0, 20)) {
      log(`  ${c.game_name} / ${c.sheet_name || c.category_raw} (${c.platform})`);
    }
    log(`\nEstimated cost: ~$${(candidates.length * 0.0005).toFixed(2)}`);
    return;
  }

  let processed = 0;
  let successes = 0;
  let errors = 0;

  for (const candidate of candidates) {
    if (processed >= LIMIT) break;

    const idx = entries.indexOf(candidate);
    const result = await tagSheet(candidate);

    if (result.error) {
      errors++;
      entries[idx].vision_tags = { error: result.error };
      log(`  [ERROR] ${candidate.game_name} / ${candidate.sheet_name || candidate.asset_id}: ${result.error}`);
    } else {
      successes++;
      entries[idx].vision_tags = result;
    }

    processed++;
    await sleep(RATE_LIMIT_MS);

    if (processed % 100 === 0) {
      log(`  Tagged ${processed} sheets (${successes} ok, ${errors} errors)`);
      writeFileSync(CATALOG_FILE, JSON.stringify(catalog, null, 2));
      log(`  [CHECKPOINT] Saved`);
    }
  }

  writeFileSync(CATALOG_FILE, JSON.stringify(catalog, null, 2));

  log('\n======================================================================');
  log('VISION TAGGING COMPLETE');
  log('======================================================================');
  log(`  Sheets tagged: ${processed}`);
  log(`  Successes:     ${successes}`);
  log(`  Errors:        ${errors}`);
  log(`  Output:        ${CATALOG_FILE}`);
}

main().catch(err => {
  console.error('Fatal error:', err);
  process.exit(1);
});
