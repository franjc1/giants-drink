/**
 * data-extractor.js
 *
 * Step 3 of the ingestion pipeline: take pre-fetched raw data for ONE game and
 * extract ONE data dimension into the ground-truth JSON format.
 *
 * Runs on local data only — no web access. Safe for overnight unattended runs.
 * Each call targets <8000 output tokens to avoid truncation.
 *
 * Usage:
 *   node data-extractor.js --game=super-mario-world-snes --dimension=physics
 *   node data-extractor.js --game=sonic-the-hedgehog-genesis --dimension=visual_identity
 *   node data-extractor.js --platform=nes --dimension=physics   (batch all NES games)
 *   node data-extractor.js --platform=snes --dimension=audio    (batch all SNES games)
 *
 * Available dimensions:
 *   physics           Movement parameters, gravity, sub-pixel systems
 *   visual_identity   Sprite specs, color count, tile vocabulary, animation
 *   audio             Music tempo/key/progression, SFX characteristics
 *   level_sequences   Element introduction order, rhythm patterns, spatial structure
 *   game_design       Difficulty curve, progression systems, boss design philosophy
 *   manifestation     How game visually communicates world-state and danger
 *
 * Output: data/ground-truth/[dimension]/[game-id].json
 */

import { readFileSync, writeFileSync, mkdirSync, existsSync, readdirSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';
import Anthropic from '@anthropic-ai/sdk';

const __dirname = dirname(fileURLToPath(import.meta.url));

// --- Config ---
const RAW_DATA_DIR = join(__dirname, 'raw-data');
const GAME_LISTS_DIR = join(__dirname, 'game-lists');
const GROUND_TRUTH_DIR = join(__dirname, '..', '..', 'data', 'ground-truth');

// Model selection: Haiku is fast/cheap for structured extraction.
// Use --model=sonnet if extraction quality is poor for a given game.
const DEFAULT_MODEL = 'claude-haiku-4-5-20251001';

// Max raw content chars to include per source (to stay within context window)
const MAX_CHARS_PER_SOURCE = 8000;
const MAX_TOTAL_CONTENT_CHARS = 30000;

// --- Dimension Prompts ---
// Each dimension has a system prompt describing what to extract and the output schema.
const DIMENSION_PROMPTS = {

  physics: {
    description: 'Movement parameters, gravity, jump physics, sub-pixel system',
    output_path: 'physics',
    system: `You are extracting precise physics/movement parameters from game documentation.
Extract ONLY what is documented. Use null for unknown values.
Output compact JSON with no comments. Target under 6000 tokens output.

Required JSON structure:
{
  "game_id": string,
  "game_name": string,
  "platform": string,
  "year": number,
  "tier": 1|2|3,
  "sub_pixel_system": {
    "sub_pixels_per_pixel": number|null,
    "format": "8.8_fixed"|"16_sub"|"256_sub"|"other"|null,
    "notes": string|null
  },
  "player": {
    "walk_speed": { "value": number|null, "unit": string|null },
    "run_speed": { "value": number|null, "unit": string|null },
    "max_horizontal_speed": { "value": number|null, "unit": string|null },
    "acceleration": { "value": number|null, "unit": string|null },
    "deceleration": { "value": number|null, "unit": string|null },
    "jump_velocity": { "value": number|null, "unit": string|null },
    "gravity": { "value": number|null, "unit": string|null },
    "max_fall_speed": { "value": number|null, "unit": string|null },
    "air_acceleration": { "value": number|null, "unit": string|null },
    "air_friction": { "value": number|null, "unit": string|null },
    "jump_hold_gravity_modifier": number|null,
    "can_change_direction_mid_air": boolean|null,
    "has_variable_jump_height": boolean|null,
    "coyote_time_frames": number|null
  },
  "special_mechanics": [
    { "name": string, "description": string, "physics_values": object }
  ],
  "feel_descriptors": ["string"],
  "tier_notes": string,
  "sources_used": ["string"]
}

For special_mechanics, include things like: dash, wall-jump, slope physics, swim, fly, etc.
For feel_descriptors, use terms like: "tight", "floaty", "weighty", "momentum-based", "commitment-based", "responsive".
If this is Tier 1, include exact hex/decimal ROM values where documented.`,
  },

  visual_identity: {
    description: 'Sprite dimensions, color palettes, tile vocabulary, animation specs',
    output_path: 'visual-identity',
    system: `You are extracting visual design parameters from game documentation.
Extract ONLY what is documented. Use null for unknown values.
Output compact JSON. Target under 6000 tokens output.

Required JSON structure:
{
  "game_id": string,
  "game_name": string,
  "platform": string,
  "year": number,
  "resolution": { "width": number|null, "height": number|null },
  "tile_size": number|null,
  "player_sprite": {
    "width": number|null, "height": number|null,
    "color_count": number|null,
    "walk_frames": number|null, "run_frames": number|null, "jump_frames": number|null,
    "idle_frames": number|null
  },
  "enemy_sprites": [
    {
      "name": string, "role": string,
      "width": number|null, "height": number|null,
      "color_count": number|null,
      "animation_frames": number|null,
      "behavioral_type": string
    }
  ],
  "palette": {
    "background_colors": number|null,
    "sprite_colors_per_palette": number|null,
    "palette_count": number|null,
    "dominant_hues": ["string"],
    "contrast_level": "low"|"medium"|"high"|null
  },
  "tile_vocabulary": {
    "ground_variants": number|null,
    "decoration_density": "sparse"|"medium"|"dense"|null,
    "background_layers": number|null,
    "parallax_layers": number|null
  },
  "visual_style": {
    "era": "nes_early"|"nes_mid"|"nes_late"|"snes_early"|"snes_mid"|"snes_late"|"genesis_early"|"genesis_mid"|"genesis_late"|null,
    "descriptors": ["string"],
    "distinctive_elements": ["string"]
  },
  "spriters_resource_url": string|null,
  "sources_used": ["string"]
}`,
  },

  audio: {
    description: 'Music tempo, keys, chord progressions, SFX characteristics per area',
    output_path: 'audio',
    system: `You are extracting audio/music parameters from game documentation.
Extract ONLY what is documented. Use null for unknown values.
Output compact JSON. Target under 6000 tokens output.

Required JSON structure:
{
  "game_id": string,
  "game_name": string,
  "platform": string,
  "year": number,
  "composer": string|null,
  "sound_chip": string|null,
  "channel_count": number|null,
  "tracks": [
    {
      "name": string,
      "area": string,
      "tempo_bpm": number|null,
      "key": string|null,
      "time_signature": string|null,
      "mode": "major"|"minor"|"dorian"|"mixolydian"|"other"|null,
      "energy_level": "low"|"medium"|"high"|"frantic"|null,
      "chord_progression": string|null,
      "melodic_character": ["string"],
      "loops_at_bar": number|null
    }
  ],
  "sfx": {
    "jump": { "character": string|null, "pitch": "low"|"mid"|"high"|null },
    "damage": { "character": string|null },
    "death": { "character": string|null },
    "collect_item": { "character": string|null },
    "attack": { "character": string|null },
    "land": { "character": string|null }
  },
  "audio_identity": {
    "overall_style": string|null,
    "distinctive_elements": ["string"],
    "influences": ["string"]
  },
  "sources_used": ["string"]
}`,
  },

  level_sequences: {
    description: 'Element introduction order, tension/relief rhythm, spatial structure patterns',
    output_path: 'level-sequences',
    system: `You are extracting level design sequencing patterns from game documentation.
This feeds the Grammarian and Rhythmist agents in the generation pipeline.
Focus on: what order things are introduced, how tension builds and releases, how space communicates direction.
Output compact JSON. Target under 6000 tokens output.

Required JSON structure:
{
  "game_id": string,
  "game_name": string,
  "platform": string,
  "paradigm": string,
  "level_count": number|null,
  "world_count": number|null,
  "element_introduction_order": [
    {
      "element": string,
      "first_appears": string,
      "introduction_context": "safe"|"moderate"|"dangerous"|null,
      "mastery_context": string|null
    }
  ],
  "rhythm_pattern": {
    "tension_cycle_seconds": { "min": number|null, "max": number|null },
    "typical_relief_triggers": ["string"],
    "typical_tension_triggers": ["string"],
    "pacing_descriptor": string|null
  },
  "spatial_grammar": {
    "primary_axis": "horizontal"|"vertical"|"both"|"omnidirectional"|null,
    "optional_content_signal": string|null,
    "secret_convention": string|null,
    "dead_end_frequency": "none"|"rare"|"occasional"|"frequent"|null,
    "backtracking_required": boolean|null
  },
  "difficulty_curve": {
    "early_game": string|null,
    "mid_game": string|null,
    "late_game": string|null,
    "notable_spikes": ["string"]
  },
  "notable_level_patterns": [
    {
      "pattern_name": string,
      "description": string,
      "example_level": string|null
    }
  ],
  "sources_used": ["string"]
}`,
  },

  game_design: {
    description: 'High-level design philosophy, difficulty, progression, boss design',
    output_path: 'game-design',
    system: `You are extracting high-level game design patterns from game documentation.
This feeds the Design Philosopher and World Architect agents.
Focus on: what makes this game opinionated, its difficulty philosophy, progression design, narrative delivery.
Output compact JSON. Target under 6000 tokens output.

Required JSON structure:
{
  "game_id": string,
  "game_name": string,
  "platform": string,
  "paradigm": string,
  "year": number,
  "design_philosophy": {
    "core_loop": string|null,
    "primary_tension": string|null,
    "player_fantasy": string|null,
    "what_makes_it_opinionated": string|null
  },
  "difficulty": {
    "overall_level": "easy"|"medium"|"hard"|"very_hard"|null,
    "type": "pattern_memorization"|"execution"|"resource_management"|"exploration"|"strategy"|"mixed"|null,
    "lives_system": string|null,
    "continues_system": string|null,
    "checkpointing": string|null,
    "player_agency_in_difficulty": string|null
  },
  "progression": {
    "type": "linear"|"open_world"|"semi_linear"|"hub_based"|null,
    "upgrade_system": string|null,
    "unlock_mechanism": string|null,
    "replayability_hooks": ["string"]
  },
  "narrative_delivery": {
    "method": "cutscene"|"dialogue"|"environmental"|"manual"|"none"|"mixed"|null,
    "story_prominence": "background"|"occasional"|"central"|null,
    "world_building_techniques": ["string"]
  },
  "boss_design": {
    "philosophy": string|null,
    "pattern_type": "fixed"|"adaptive"|"phase_based"|null,
    "notable_bosses": ["string"]
  },
  "social_manifestation_potential": {
    "faction_indicators": ["string"],
    "danger_signals": ["string"],
    "environmental_storytelling": ["string"]
  },
  "sources_used": ["string"]
}`,
  },

  manifestation: {
    description: 'How game visually communicates world-state, danger, factions, and political situations',
    output_path: 'manifestation-patterns',
    system: `You are extracting manifestation patterns — how this game communicates world-state through visuals and behavior.
This feeds the Manifestation Layer in the Two Fires engine.
Focus on: visual cues for danger/safety, faction identity signals, environmental storytelling methods, behavior changes under different world states.
Output compact JSON. Target under 6000 tokens output.

Required JSON structure:
{
  "game_id": string,
  "game_name": string,
  "platform": string,
  "paradigm": string,
  "danger_signals": [
    { "signal": string, "visual_form": string, "meaning": string }
  ],
  "safety_signals": [
    { "signal": string, "visual_form": string, "meaning": string }
  ],
  "faction_indicators": [
    {
      "faction": string,
      "color_identity": string|null,
      "symbol_or_sigil": string|null,
      "enemy_visual_variants": string|null,
      "environmental_markers": string|null
    }
  ],
  "world_state_to_visual": [
    {
      "world_state": string,
      "visual_manifestation": string,
      "behavioral_manifestation": string|null
    }
  ],
  "environmental_storytelling": [
    { "technique": string, "example": string }
  ],
  "entity_behavioral_tells": [
    { "entity": string, "state": string, "behavior": string }
  ],
  "notes": string|null,
  "sources_used": ["string"]
}`,
  },

};

// --- Helpers ---
function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

function loadGameList(platform) {
  const files = readdirSync(GAME_LISTS_DIR)
    .filter(f => f.startsWith(`${platform}-`) && f.endsWith('.json'))
    .sort();
  if (files.length === 0) throw new Error(`No game list files found for platform: ${platform}`);
  const allGames = [];
  for (const file of files) {
    const data = JSON.parse(readFileSync(join(GAME_LISTS_DIR, file), 'utf8'));
    if (Array.isArray(data.games)) allGames.push(...data.games);
  }
  return { platform, games: allGames };
}

function findGame(gameId) {
  for (const platform of ['nes', 'snes', 'genesis', 'pc']) {
    try {
      const list = loadGameList(platform);
      const found = list.games.find(g => g.id === gameId);
      if (found) return found;
    } catch {}
  }
  return null;
}

function loadRawData(gameId) {
  const gameDir = join(RAW_DATA_DIR, gameId);
  if (!existsSync(gameDir)) {
    throw new Error(`No raw data for ${gameId}. Run batch-scraper.js first.`);
  }

  const files = readdirSync(gameDir).filter(f => f.endsWith('.txt'));
  const content = {};
  let totalChars = 0;

  for (const file of files) {
    const key = file.replace('.txt', '');
    const text = readFileSync(join(gameDir, file), 'utf8');
    // Truncate per-source if needed
    const truncated = text.slice(0, MAX_CHARS_PER_SOURCE);
    content[key] = truncated;
    totalChars += truncated.length;
    if (totalChars >= MAX_TOTAL_CONTENT_CHARS) break;
  }

  // Load manifest for source URL info
  const manifestPath = join(gameDir, 'manifest.json');
  const manifest = existsSync(manifestPath)
    ? JSON.parse(readFileSync(manifestPath, 'utf8'))
    : {};

  return { content, manifest };
}

function outputPath(dimensionKey, gameId) {
  const dim = DIMENSION_PROMPTS[dimensionKey];
  const dir = join(GROUND_TRUTH_DIR, dim.output_path);
  mkdirSync(dir, { recursive: true });
  return join(dir, `${gameId}.json`);
}

async function extractDimension(game, dimensionKey, client, model) {
  const dim = DIMENSION_PROMPTS[dimensionKey];
  const outPath = outputPath(dimensionKey, game.id);

  // Skip if already extracted
  if (existsSync(outPath)) {
    console.log(`  [SKIP] ${dimensionKey} already extracted`);
    return { skipped: true };
  }

  // Load raw data
  const { content, manifest } = loadRawData(game.id);
  const sourceKeys = Object.keys(content);

  if (sourceKeys.length === 0) {
    console.log(`  [SKIP] No raw data sources available for ${game.id}`);
    return { skipped: true, reason: 'no_raw_data' };
  }

  // Build user message
  const sourcesText = sourceKeys
    .map(key => `=== SOURCE: ${key} ===\n${content[key]}`)
    .join('\n\n');

  const userMessage = `Extract ${dim.description} data for this game:

GAME INFO:
- ID: ${game.id}
- Name: ${game.name}
- Platform: ${game.platform}
- Year: ${game.year}
- Developer: ${game.developer}
- Paradigm: ${game.paradigm}
- Data Tier: ${game.tier} (${game.tier === 1 ? 'ROM disassembly/exact values' : game.tier === 2 ? 'community-documented' : 'empirical/qualitative'})
- Notes: ${game.notes || 'none'}

AVAILABLE SOURCES (${sourceKeys.length} files):
${sourcesText}

Extract the ${dim.description} data into the required JSON format.
- For Tier ${game.tier} data: ${game.tier === 1 ? 'include exact ROM values where available' : game.tier === 2 ? 'use documented community values' : 'use qualitative descriptors, no exact numbers required'}
- If a value is not documented in any source, use null
- List only sources you actually used in sources_used
- If output would exceed 6000 tokens, stop at a natural break (complete the current array item) and add a "TODO" field listing what remains`;

  console.log(`  [CALL] Claude ${model} — ${dimensionKey} for ${game.id}`);

  const response = await client.messages.create({
    model,
    max_tokens: 8192,
    system: dim.system,
    messages: [{ role: 'user', content: userMessage }],
  });

  const rawOutput = response.content[0]?.text || '';

  // Parse JSON from response
  const jsonMatch = rawOutput.match(/\{[\s\S]+\}/);
  if (!jsonMatch) {
    console.log(`  [WARN] No JSON found in response for ${game.id}/${dimensionKey}`);
    // Save raw output for debugging
    writeFileSync(outPath.replace('.json', '.raw.txt'), rawOutput, 'utf8');
    return { error: 'no_json_in_response' };
  }

  let parsed;
  try {
    parsed = JSON.parse(jsonMatch[0]);
  } catch (err) {
    console.log(`  [WARN] JSON parse error for ${game.id}/${dimensionKey}: ${err.message}`);
    writeFileSync(outPath.replace('.json', '.raw.txt'), rawOutput, 'utf8');
    return { error: 'json_parse_error', message: err.message };
  }

  // Add extraction metadata
  parsed._extraction_metadata = {
    extracted_at: new Date().toISOString(),
    model_used: model,
    input_tokens: response.usage?.input_tokens,
    output_tokens: response.usage?.output_tokens,
    dimension: dimensionKey,
    sources_available: sourceKeys,
  };

  writeFileSync(outPath, JSON.stringify(parsed, null, 2), 'utf8');
  console.log(`  [OK]   Saved to ${outPath.replace(GROUND_TRUTH_DIR, 'data/ground-truth')}`);
  console.log(`         Tokens: ${response.usage?.input_tokens} in / ${response.usage?.output_tokens} out`);

  return { success: true, output_tokens: response.usage?.output_tokens };
}

// --- Main ---
async function main() {
  if (!args.dimension) {
    console.error(`Usage: node data-extractor.js --dimension=<dim> --game=<id>|--platform=<platform>`);
    console.error(`Dimensions: ${Object.keys(DIMENSION_PROMPTS).join(', ')}`);
    process.exit(1);
  }

  if (!args.game && !args.platform) {
    console.error('Must specify --game=<id> or --platform=nes|snes|genesis');
    process.exit(1);
  }

  const dimensionKey = args.dimension;
  if (!DIMENSION_PROMPTS[dimensionKey]) {
    console.error(`Unknown dimension: ${dimensionKey}. Valid: ${Object.keys(DIMENSION_PROMPTS).join(', ')}`);
    process.exit(1);
  }

  const apiKey = process.env.ANTHROPIC_API_KEY;
  if (!apiKey) {
    console.error('ANTHROPIC_API_KEY environment variable not set');
    process.exit(1);
  }

  const client = new Anthropic({ apiKey });
  const model = args.model || DEFAULT_MODEL;
  console.log(`Using model: ${model}`);

  let games = [];
  if (args.game) {
    const game = findGame(args.game);
    if (!game) { console.error(`Game not found: ${args.game}`); process.exit(1); }
    games = [game];
  } else {
    const list = loadGameList(args.platform);
    games = list.games;
    console.log(`Processing ${games.length} games for platform: ${args.platform}`);
  }

  const startTime = Date.now();
  let successCount = 0, skipCount = 0, errorCount = 0;
  let totalInputTokens = 0, totalOutputTokens = 0;

  for (let i = 0; i < games.length; i++) {
    const game = games[i];
    console.log(`\n[${i + 1}/${games.length}] ${game.name} — ${dimensionKey}`);

    try {
      const result = await extractDimension(game, dimensionKey, client, model);
      if (result.skipped) {
        skipCount++;
      } else if (result.success) {
        successCount++;
        totalOutputTokens += result.output_tokens || 0;
      } else {
        errorCount++;
      }
    } catch (err) {
      console.error(`  [ERROR] ${err.message}`);
      errorCount++;
    }

    // Rate limit courtesy pause between games
    if (i < games.length - 1) await sleep(500);
  }

  const elapsed = Math.round((Date.now() - startTime) / 1000);
  console.log(`\n=== DONE ===`);
  console.log(`${successCount} extracted, ${skipCount} skipped, ${errorCount} errors`);
  console.log(`Output tokens used: ~${totalOutputTokens.toLocaleString()}`);
  console.log(`Time: ${elapsed}s`);
}

// Parse args
const args = Object.fromEntries(
  process.argv.slice(2)
    .filter(a => a.startsWith('--'))
    .map(a => {
      const [key, val] = a.slice(2).split('=');
      return [key, val ?? true];
    })
);

main().catch(err => {
  console.error(err);
  process.exit(1);
});
