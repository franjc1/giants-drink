/**
 * validator.js
 *
 * Step 4 of the ingestion pipeline: validate extracted ground-truth JSON files
 * against expected schemas and flag missing fields, implausible values, obvious errors.
 *
 * Usage:
 *   node validator.js --platform=nes --dimension=physics
 *   node validator.js --game=super-mario-world-snes --dimension=physics
 *   node validator.js --platform=all --dimension=all   (full audit)
 *   node validator.js --report                         (summary of all validation status)
 */

import { readFileSync, writeFileSync, existsSync, readdirSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));

const GROUND_TRUTH_DIR = join(__dirname, '..', '..', 'data', 'ground-truth');
const GAME_LISTS_DIR = join(__dirname, 'game-lists');

// Maps dimension key → ground-truth subdirectory
const DIMENSION_DIRS = {
  physics: 'physics',
  visual_identity: 'visual-identity',
  audio: 'audio',
  level_sequences: 'level-sequences',
  game_design: 'game-design',
  manifestation: 'manifestation-patterns',
};

const ALL_DIMENSIONS = Object.keys(DIMENSION_DIRS);
const ALL_PLATFORMS = ['nes', 'snes', 'genesis', 'pc'];

// --- Validation Rules ---
// Each dimension has a list of checks. Each check returns null (pass) or an error string.

const VALIDATORS = {
  physics: [
    (d) => d.game_id ? null : 'Missing game_id',
    (d) => d.game_name ? null : 'Missing game_name',
    (d) => d.platform ? null : 'Missing platform',
    (d) => d.player ? null : 'Missing player block',
    (d) => d.player?.jump_velocity !== undefined ? null : 'Missing player.jump_velocity',
    (d) => d.player?.gravity !== undefined ? null : 'Missing player.gravity',
    (d) => d.sub_pixel_system !== undefined ? null : 'Missing sub_pixel_system block',
    (d) => d.feel_descriptors?.length > 0 ? null : 'Missing feel_descriptors',
    (d) => {
      if (d.player?.max_fall_speed?.value && d.player?.jump_velocity?.value) {
        const fall = Math.abs(d.player.max_fall_speed.value);
        const jump = Math.abs(d.player.jump_velocity.value);
        if (jump > fall * 10) return `Suspicious: jump_velocity (${jump}) >> max_fall_speed (${fall})`;
      }
      return null;
    },
    (d) => {
      const speed = d.player?.max_horizontal_speed?.value;
      if (speed !== null && speed !== undefined) {
        if (speed > 50000) return `Suspicious max_horizontal_speed: ${speed} (raw sub-pixel values should have unit specified)`;
      }
      return null;
    },
  ],

  visual_identity: [
    (d) => d.game_id ? null : 'Missing game_id',
    (d) => d.game_name ? null : 'Missing game_name',
    (d) => d.player_sprite ? null : 'Missing player_sprite block',
    (d) => d.palette ? null : 'Missing palette block',
    (d) => d.visual_style ? null : 'Missing visual_style block',
    (d) => d.visual_style?.era ? null : 'Missing visual_style.era',
    (d) => {
      const w = d.player_sprite?.width;
      if (w !== null && w !== undefined && (w < 8 || w > 64)) {
        return `Suspicious player sprite width: ${w}px (expected 8-64px)`;
      }
      return null;
    },
    (d) => {
      const colors = d.player_sprite?.color_count;
      if (colors !== null && colors !== undefined && (colors < 1 || colors > 256)) {
        return `Suspicious color_count: ${colors}`;
      }
      return null;
    },
  ],

  audio: [
    (d) => d.game_id ? null : 'Missing game_id',
    (d) => d.game_name ? null : 'Missing game_name',
    (d) => d.tracks ? null : 'Missing tracks array',
    (d) => d.tracks?.length > 0 ? null : 'tracks array is empty',
    (d) => {
      const badTempos = d.tracks?.filter(t =>
        t.tempo_bpm !== null && t.tempo_bpm !== undefined && (t.tempo_bpm < 40 || t.tempo_bpm > 400)
      );
      if (badTempos?.length > 0) {
        return `Suspicious tempo values: ${badTempos.map(t => `${t.name}=${t.tempo_bpm}`).join(', ')}`;
      }
      return null;
    },
  ],

  level_sequences: [
    (d) => d.game_id ? null : 'Missing game_id',
    (d) => d.game_name ? null : 'Missing game_name',
    (d) => d.paradigm ? null : 'Missing paradigm',
    (d) => d.element_introduction_order ? null : 'Missing element_introduction_order',
    (d) => d.rhythm_pattern ? null : 'Missing rhythm_pattern block',
    (d) => d.spatial_grammar ? null : 'Missing spatial_grammar block',
    (d) => d.difficulty_curve ? null : 'Missing difficulty_curve block',
    (d) => {
      const min = d.rhythm_pattern?.tension_cycle_seconds?.min;
      const max = d.rhythm_pattern?.tension_cycle_seconds?.max;
      if (min !== null && max !== null && min !== undefined && max !== undefined) {
        if (min > max) return `rhythm_pattern min (${min}) > max (${max})`;
        if (max > 600) return `Suspicious tension_cycle_seconds.max: ${max}s`;
      }
      return null;
    },
  ],

  game_design: [
    (d) => d.game_id ? null : 'Missing game_id',
    (d) => d.game_name ? null : 'Missing game_name',
    (d) => d.design_philosophy ? null : 'Missing design_philosophy block',
    (d) => d.difficulty ? null : 'Missing difficulty block',
    (d) => d.progression ? null : 'Missing progression block',
    (d) => d.boss_design ? null : 'Missing boss_design block',
  ],

  manifestation: [
    (d) => d.game_id ? null : 'Missing game_id',
    (d) => d.game_name ? null : 'Missing game_name',
    (d) => d.danger_signals ? null : 'Missing danger_signals array',
    (d) => d.environmental_storytelling ? null : 'Missing environmental_storytelling array',
  ],
};

// --- Helpers ---
function loadGameList(platform) {
  const files = readdirSync(GAME_LISTS_DIR)
    .filter(f => f.startsWith(`${platform}-`) && f.endsWith('.json'))
    .sort();
  if (files.length === 0) return null;
  const allGames = [];
  for (const file of files) {
    const data = JSON.parse(readFileSync(join(GAME_LISTS_DIR, file), 'utf8'));
    if (Array.isArray(data.games)) allGames.push(...data.games);
  }
  return { platform, games: allGames };
}

function getAllGameIds() {
  const ids = new Set();
  for (const platform of ALL_PLATFORMS) {
    const list = loadGameList(platform);
    if (list) list.games.forEach(g => ids.add(g.id));
  }
  return [...ids];
}

function getAllGameIdsForPlatform(platform) {
  const list = loadGameList(platform);
  return list ? list.games.map(g => g.id) : [];
}

function validateFile(filePath, dimensionKey) {
  const results = { errors: [], warnings: [], pass: true };

  if (!existsSync(filePath)) {
    results.errors.push('File does not exist');
    results.pass = false;
    return results;
  }

  let data;
  try {
    data = JSON.parse(readFileSync(filePath, 'utf8'));
  } catch (err) {
    results.errors.push(`JSON parse error: ${err.message}`);
    results.pass = false;
    return results;
  }

  const checks = VALIDATORS[dimensionKey] || [];
  for (const check of checks) {
    const issue = check(data);
    if (issue) {
      // Treat Suspicious as warning, Missing as error
      if (issue.startsWith('Suspicious') || issue.startsWith('Implausible')) {
        results.warnings.push(issue);
      } else {
        results.errors.push(issue);
        results.pass = false;
      }
    }
  }

  return results;
}

// --- Report ---
function printSummaryReport() {
  const allIds = getAllGameIds();
  console.log(`\n=== GROUND TRUTH COVERAGE REPORT ===`);
  console.log(`Total games in master lists: ${allIds.length}\n`);

  for (const dimKey of ALL_DIMENSIONS) {
    const dir = join(GROUND_TRUTH_DIR, DIMENSION_DIRS[dimKey]);
    if (!existsSync(dir)) {
      console.log(`${dimKey}: 0 files (directory not yet created)`);
      continue;
    }
    const files = readdirSync(dir).filter(f => f.endsWith('.json'));
    const coverage = Math.round((files.length / allIds.length) * 100);
    console.log(`${dimKey.padEnd(20)} ${files.length.toString().padStart(4)} files  (${coverage}% of ${allIds.length})`);
  }

  console.log('\nPer-platform breakdown:');
  for (const platform of ALL_PLATFORMS) {
    const ids = getAllGameIdsForPlatform(platform);
    console.log(`\n  ${platform.toUpperCase()} (${ids.length} games):`);
    for (const dimKey of ALL_DIMENSIONS) {
      const dir = join(GROUND_TRUTH_DIR, DIMENSION_DIRS[dimKey]);
      const count = ids.filter(id => existsSync(join(dir, `${id}.json`))).length;
      const bar = '█'.repeat(Math.round(count / ids.length * 20)).padEnd(20, '░');
      console.log(`    ${dimKey.padEnd(18)} ${bar} ${count}/${ids.length}`);
    }
  }
}

// --- Main ---
async function main() {
  if (args.report) {
    printSummaryReport();
    return;
  }

  const targetPlatform = args.platform;
  const targetGame = args.game;
  const targetDimension = args.dimension;

  if (!targetDimension) {
    console.error('Usage: node validator.js --dimension=<dim>|all [--platform=<p>|all] [--game=<id>]');
    console.error('       node validator.js --report');
    process.exit(1);
  }

  const dimensions = targetDimension === 'all' ? ALL_DIMENSIONS : [targetDimension];

  let gameIds = [];
  if (targetGame) {
    gameIds = [targetGame];
  } else if (targetPlatform === 'all' || !targetPlatform) {
    gameIds = getAllGameIds();
  } else {
    gameIds = getAllGameIdsForPlatform(targetPlatform);
  }

  console.log(`Validating ${dimensions.length} dimension(s) for ${gameIds.length} game(s)`);

  const allIssues = [];
  let passCount = 0, failCount = 0, missingCount = 0;

  for (const dimKey of dimensions) {
    const dir = join(GROUND_TRUTH_DIR, DIMENSION_DIRS[dimKey]);
    console.log(`\n--- ${dimKey} ---`);

    for (const gameId of gameIds) {
      const filePath = join(dir, `${gameId}.json`);
      if (!existsSync(filePath)) {
        missingCount++;
        continue;
      }

      const result = validateFile(filePath, dimKey);
      if (result.pass && result.warnings.length === 0) {
        passCount++;
      } else {
        if (!result.pass) failCount++;
        for (const err of result.errors) {
          console.log(`  [FAIL] ${gameId}: ${err}`);
          allIssues.push({ gameId, dimension: dimKey, type: 'error', message: err });
        }
        for (const warn of result.warnings) {
          console.log(`  [WARN] ${gameId}: ${warn}`);
          allIssues.push({ gameId, dimension: dimKey, type: 'warning', message: warn });
        }
        if (result.pass) passCount++;
      }
    }
  }

  console.log(`\n=== VALIDATION SUMMARY ===`);
  console.log(`Pass:    ${passCount}`);
  console.log(`Fail:    ${failCount}`);
  console.log(`Missing: ${missingCount} (not yet extracted)`);
  console.log(`Issues:  ${allIssues.filter(i => i.type === 'error').length} errors, ${allIssues.filter(i => i.type === 'warning').length} warnings`);

  // Save issues report
  if (allIssues.length > 0) {
    const reportPath = join(__dirname, 'validation-report.json');
    writeFileSync(reportPath, JSON.stringify({
      generated: new Date().toISOString(),
      summary: { pass: passCount, fail: failCount, missing: missingCount },
      issues: allIssues,
    }, null, 2));
    console.log(`\nFull report saved to: tools/ingestion/validation-report.json`);
  }
}

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
