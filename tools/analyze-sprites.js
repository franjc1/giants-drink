#!/usr/bin/env node
/**
 * analyze-sprites.js
 *
 * Programmatic analysis of sprite sheet PNGs. Extracts visual properties
 * that don't require AI vision — colors, palette, grid spacing, etc.
 * Writes results into asset-catalog.json's programmatic_tags field.
 *
 * Requires: npm install sharp
 *
 * What it extracts per sheet:
 *   - unique_colors: total distinct colors (excluding transparency)
 *   - dominant_colors: top 8 colors by pixel frequency [{hex, count, pct}]
 *   - palette_temperature: warm | cool | neutral (from hue distribution)
 *   - has_transparency: boolean (alpha channel or magenta/green key)
 *   - transparency_type: 'alpha' | 'magenta_key' | 'green_key' | 'none'
 *   - estimated_grid: { cell_w, cell_h } if regular grid detected, else null
 *   - estimated_sprite_count: rough count from grid detection
 *   - is_stage_map: boolean (very wide/tall relative to height/width)
 *   - brightness: avg luminance 0-255
 *   - saturation: avg saturation 0-1
 *
 * Usage:
 *   node tools/analyze-sprites.js                    # all entries
 *   node tools/analyze-sprites.js --platform=nes     # single platform
 *   node tools/analyze-sprites.js --resume           # skip already-analyzed
 *   node tools/analyze-sprites.js --limit=1000       # process N sheets then stop
 *
 * Output:
 *   Updates data/assets/asset-catalog.json in place (programmatic_tags field)
 */

import {
  readFileSync, writeFileSync, existsSync,
} from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname  = dirname(__filename);
const ROOT       = join(__dirname, '..');

let sharp;
try {
  sharp = (await import('sharp')).default;
} catch {
  console.error('ERROR: sharp not installed. Run: npm install sharp');
  process.exit(1);
}

// ---------------------------------------------------------------------------
// Config
// ---------------------------------------------------------------------------

const CATALOG_FILE = join(ROOT, 'data/assets/asset-catalog.json');

const args = Object.fromEntries(
  process.argv.slice(2)
    .filter(a => a.startsWith('--'))
    .map(a => { const [k, v] = a.slice(2).split('='); return [k, v ?? true]; })
);

const PLATFORM_FILTER = args.platform || null;
const RESUME          = !!args.resume;
const LIMIT           = args.limit ? parseInt(args.limit) : Infinity;

// ---------------------------------------------------------------------------
// Utilities
// ---------------------------------------------------------------------------

function log(msg) {
  const ts = new Date().toISOString().slice(11, 19);
  console.log(`[${ts}] ${msg}`);
}

function rgbToHsl(r, g, b) {
  r /= 255; g /= 255; b /= 255;
  const max = Math.max(r, g, b), min = Math.min(r, g, b);
  let h, s, l = (max + min) / 2;

  if (max === min) {
    h = s = 0;
  } else {
    const d = max - min;
    s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
    switch (max) {
      case r: h = ((g - b) / d + (g < b ? 6 : 0)) / 6; break;
      case g: h = ((b - r) / d + 2) / 6; break;
      case b: h = ((r - g) / d + 4) / 6; break;
    }
  }
  return { h: h * 360, s, l };
}

function classifyTemperature(hueWeights) {
  let warmWeight = 0;
  let coolWeight = 0;
  let neutralWeight = 0;

  for (const { hue, weight } of hueWeights) {
    if ((hue >= 0 && hue < 70) || hue > 330) {
      warmWeight += weight;
    } else if (hue >= 160 && hue <= 280) {
      coolWeight += weight;
    } else {
      neutralWeight += weight;
    }
  }

  const total = warmWeight + coolWeight + neutralWeight;
  if (total === 0) return 'neutral';

  const warmPct = warmWeight / total;
  const coolPct = coolWeight / total;

  if (warmPct > 0.5) return 'warm';
  if (coolPct > 0.5) return 'cool';
  return 'neutral';
}

// ---------------------------------------------------------------------------
// Grid detection (estimate sprite cell size from sheet layout)
// ---------------------------------------------------------------------------

function detectGrid(pixelData, width, height, channels) {
  if (width < 16 || height < 16) return null;

  const isTransparent = (x, y) => {
    const idx = (y * width + x) * channels;
    if (channels === 4) return pixelData[idx + 3] < 10;
    const r = pixelData[idx], g = pixelData[idx + 1], b = pixelData[idx + 2];
    if (r > 240 && g < 15 && b > 240) return true;
    if (r < 15 && g > 240 && b < 15) return true;
    return false;
  };

  const findGaps = (scanDim, crossDim, isRow) => {
    const gaps = [];
    for (let i = 0; i < scanDim; i++) {
      let allTransparent = true;
      const step = Math.max(1, Math.floor(crossDim / 40));
      for (let j = 0; j < crossDim; j += step) {
        const x = isRow ? j : i;
        const y = isRow ? i : j;
        if (x < width && y < height && !isTransparent(x, y)) {
          allTransparent = false;
          break;
        }
      }
      if (allTransparent) gaps.push(i);
    }
    return gaps;
  };

  const rowGaps = findGaps(height, width, true);
  const colGaps = findGaps(width, height, false);

  const findSpacing = (gaps) => {
    if (gaps.length < 2) return null;
    const intervals = [];
    let runStart = gaps[0];
    for (let i = 1; i < gaps.length; i++) {
      if (gaps[i] !== gaps[i - 1] + 1) {
        intervals.push(gaps[i] - runStart);
        runStart = gaps[i];
      }
    }
    if (intervals.length < 2) return null;

    const counts = {};
    for (const iv of intervals) {
      const rounded = Math.round(iv / 8) * 8;
      counts[rounded] = (counts[rounded] || 0) + 1;
    }
    const best = Object.entries(counts).sort((a, b) => b[1] - a[1])[0];
    if (best && best[1] >= intervals.length * 0.4) return parseInt(best[0]);
    return null;
  };

  const cellH = findSpacing(rowGaps);
  const cellW = findSpacing(colGaps);

  if (cellW && cellH && cellW >= 8 && cellH >= 8 && cellW <= 128 && cellH <= 128) {
    const cols = Math.floor(width / cellW);
    const rows = Math.floor(height / cellH);
    return {
      cell_w: cellW,
      cell_h: cellH,
      estimated_columns: cols,
      estimated_rows: rows,
      estimated_sprite_count: cols * rows,
    };
  }

  return null;
}

// ---------------------------------------------------------------------------
// Analyze a single sprite sheet
// ---------------------------------------------------------------------------

async function analyzeSheet(filePath) {
  try {
    const img = sharp(filePath);
    const metadata = await img.metadata();
    const { width, height, channels } = metadata;

    const rawBuf = await img.raw().toBuffer();

    const colorMap = new Map();
    let totalPixels = 0;
    let transparentPixels = 0;
    let hasAlpha = channels === 4;
    let hasMagentaKey = false;
    let hasGreenKey = false;

    const hueWeights = [];
    let brightnessSum = 0;
    let saturationSum = 0;
    let chromaPixels = 0;

    for (let i = 0; i < rawBuf.length; i += channels) {
      const r = rawBuf[i], g = rawBuf[i + 1], b = rawBuf[i + 2];
      const a = channels === 4 ? rawBuf[i + 3] : 255;

      if (a < 10) { transparentPixels++; continue; }
      if (r > 240 && g < 15 && b > 240) { hasMagentaKey = true; transparentPixels++; continue; }
      if (r < 15 && g > 240 && b < 15) { hasGreenKey = true; transparentPixels++; continue; }

      totalPixels++;
      const hex = `#${r.toString(16).padStart(2, '0')}${g.toString(16).padStart(2, '0')}${b.toString(16).padStart(2, '0')}`;
      colorMap.set(hex, (colorMap.get(hex) || 0) + 1);

      const lum = 0.299 * r + 0.587 * g + 0.114 * b;
      brightnessSum += lum;

      const { h, s, l } = rgbToHsl(r, g, b);
      saturationSum += s;
      if (s > 0.15) {
        hueWeights.push({ hue: h, weight: 1 });
        chromaPixels++;
      }
    }

    const sortedColors = [...colorMap.entries()]
      .sort((a, b) => b[1] - a[1]);

    const dominantColors = sortedColors.slice(0, 8).map(([hex, count]) => ({
      hex,
      count,
      pct: Math.round((count / totalPixels) * 1000) / 10,
    }));

    const temperature = classifyTemperature(
      hueWeights.length > 100
        ? hueWeights.filter((_, i) => i % Math.ceil(hueWeights.length / 500) === 0)
        : hueWeights
    );

    let transparencyType = 'none';
    if (hasAlpha && transparentPixels > 0) transparencyType = 'alpha';
    else if (hasMagentaKey) transparencyType = 'magenta_key';
    else if (hasGreenKey) transparencyType = 'green_key';

    const isStageMap = (width > height * 4) || (height > width * 4);

    const grid = detectGrid(rawBuf, width, height, channels);

    return {
      unique_colors: colorMap.size,
      dominant_colors: dominantColors,
      palette_temperature: temperature,
      has_transparency: transparentPixels > 0,
      transparency_type: transparencyType,
      estimated_grid: grid ? {
        cell_w: grid.cell_w,
        cell_h: grid.cell_h,
      } : null,
      estimated_sprite_count: grid?.estimated_sprite_count || null,
      is_stage_map: isStageMap,
      brightness: totalPixels > 0 ? Math.round(brightnessSum / totalPixels) : 0,
      saturation: totalPixels > 0 ? Math.round((saturationSum / totalPixels) * 100) / 100 : 0,
    };
  } catch (err) {
    return { error: err.message };
  }
}

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------

async function main() {
  log('=== Two Fires Sprite Analysis (Programmatic) ===');

  if (!existsSync(CATALOG_FILE)) {
    log('ERROR: asset-catalog.json not found. Run enrich-sheet-names.js first.');
    process.exit(1);
  }

  const catalog = JSON.parse(readFileSync(CATALOG_FILE, 'utf-8'));
  const entries = catalog.entries;
  log(`Catalog has ${entries.length} entries`);

  let processed = 0;
  let skipped = 0;
  let errors = 0;

  for (let i = 0; i < entries.length; i++) {
    if (processed >= LIMIT) break;

    const entry = entries[i];
    if (PLATFORM_FILTER && entry.platform !== PLATFORM_FILTER) continue;
    if (RESUME && entry.programmatic_tags !== null) { skipped++; continue; }

    const fullPath = join(ROOT, entry.file);
    if (!existsSync(fullPath)) {
      errors++;
      continue;
    }

    const tags = await analyzeSheet(fullPath);
    entry.programmatic_tags = tags;
    processed++;

    if (processed % 500 === 0) {
      log(`  Analyzed ${processed} sheets (${skipped} skipped, ${errors} errors)`);
      writeFileSync(CATALOG_FILE, JSON.stringify(catalog, null, 2));
      log(`  [CHECKPOINT] Saved`);
    }
  }

  writeFileSync(CATALOG_FILE, JSON.stringify(catalog, null, 2));

  log('\n======================================================================');
  log('SPRITE ANALYSIS COMPLETE');
  log('======================================================================');
  log(`  Sheets analyzed: ${processed}`);
  log(`  Skipped (resume): ${skipped}`);
  log(`  Errors: ${errors}`);
  log(`  Output: ${CATALOG_FILE}`);
}

main().catch(err => {
  console.error('Fatal error:', err);
  process.exit(1);
});
