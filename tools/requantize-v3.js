#!/usr/bin/env node
/**
 * requantize-v3.js
 *
 * Re-quantize mario-flux-output-v3.png using knight-appropriate colors.
 * Replaces mario-flux-quantized-v3.chr with a better quantization that:
 *   - Assigns palette index 0 (transparent) to dark background pixels
 *   - Uses k-means(3) to find 3 dominant knight colors for indices 1-3
 *   - Maps those cluster centers to nearest NES hardware palette entries
 *
 * Also updates mario-flux-tilemap-v3.json to include:
 *   knight_palette_nes_indices: [idx1, idx2, idx3]   ← write to $3F11-$3F13
 *   knight_palette_rgb:         ["rgb(...)×3"]        ← k-means cluster colors
 *   knight_palette_nes_rgb:     ["rgb(...)×3"]        ← nearest NES hw colors
 *
 * Usage: node tools/requantize-v3.js
 */

import sharp   from "sharp";
import fs      from "fs";
import path    from "path";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const OUT_DIR   = path.join(__dirname, "..", "experiment-output");
const PAL_FILE  = path.join(__dirname, "..", "data", "ground-truth", "palettes", "nes-palette.json");

// ── NES hardware palette ──────────────────────────────────────────────────────
const nesPalObj = JSON.parse(fs.readFileSync(PAL_FILE, "utf8"));
const NES_HW = nesPalObj.palette_as_array.map(hex => {
  const r = parseInt(hex.slice(1,3), 16);
  const g = parseInt(hex.slice(3,5), 16);
  const b = parseInt(hex.slice(5,7), 16);
  return [r, g, b];
});

// ── Helpers ───────────────────────────────────────────────────────────────────
const colorSq = (a, b) => (a[0]-b[0])**2 + (a[1]-b[1])**2 + (a[2]-b[2])**2;
const lum     = (r, g, b) => (r + g + b) / 3;
const nearestNesIdx = rgb => {
  let best = 0, bestD = Infinity;
  for (let i = 0; i < NES_HW.length; i++) {
    const d = colorSq(rgb, NES_HW[i]);
    if (d < bestD) { bestD = d; best = i; }
  }
  return best;
};

// K-means (k=3), sorted dark→light
function kmeans3(pixels, maxIter = 30) {
  const step = Math.floor(pixels.length / 4);
  let centers = [pixels[step], pixels[step*2], pixels[step*3]].map(p => [...p]);

  for (let iter = 0; iter < maxIter; iter++) {
    const clusters = [[], [], []];
    for (const px of pixels) {
      let best = 0, bestD = Infinity;
      for (let k = 0; k < 3; k++) {
        const d = colorSq(px, centers[k]);
        if (d < bestD) { bestD = d; best = k; }
      }
      clusters[best].push(px);
    }
    const newCenters = centers.map((c, k) => {
      if (clusters[k].length === 0) return c;
      const sum = clusters[k].reduce((a, b) => [a[0]+b[0], a[1]+b[1], a[2]+b[2]], [0,0,0]);
      return sum.map(x => Math.round(x / clusters[k].length));
    });
    const moved = newCenters.some((nc, k) => colorSq(nc, centers[k]) > 1);
    centers = newCenters;
    if (!moved) break;
  }

  // Sort darkest→lightest so index 1=dark, 2=mid, 3=light
  centers.sort((a, b) => lum(...a) - lum(...b));
  return centers;
}

// ── Load inputs ───────────────────────────────────────────────────────────────
const TILEMAP_PATH = path.join(OUT_DIR, "mario-flux-tilemap-v3.json");
const FLUX_PATH    = path.join(OUT_DIR, "mario-flux-output-v3.png");
const CHR_OUT      = path.join(OUT_DIR, "mario-flux-quantized-v3.chr");
const PNG_OUT      = path.join(OUT_DIR, "mario-flux-quantized-v3.png");

const tileMap = JSON.parse(fs.readFileSync(TILEMAP_PATH, "utf8"));
const { input_width: inW, input_height: inH, tiles } = tileMap;

const { data: fluxRaw, info } = await sharp(FLUX_PATH)
  .ensureAlpha().raw().toBuffer({ resolveWithObject: true });
const { width: fW, height: fH } = info;
const fx = fW / inW, fy = fH / inH;

console.log(`FLUX output:  ${fW}×${fH}`);
console.log(`Scale:        fx=${fx.toFixed(4)}  fy=${fy.toFixed(4)}`);
console.log(`Unique tiles: ${tiles.length}`);

// ── Collect foreground pixels for k-means ────────────────────────────────────
const LUMA_THRESH = 15;   // below this → transparent (background)
const fgPixels    = [];
const seenFg      = new Set();

for (const tile of tiles) {
  if (seenFg.has(tile.chr_tile_idx)) continue;
  seenFg.add(tile.chr_tile_idx);

  const sx = Math.round(tile.canvas_x * fx);
  const sy = Math.round(tile.canvas_y * fy);
  const sw = Math.max(1, Math.round(tile.canvas_w * fx));
  const sh = Math.max(1, Math.round(tile.canvas_h * fy));

  // Sample every other pixel to speed up k-means
  for (let dy = 0; dy < sh; dy += 2) {
    for (let dx = 0; dx < sw; dx += 2) {
      const px = Math.min(sx + dx, fW - 1);
      const py = Math.min(sy + dy, fH - 1);
      const off = (py * fW + px) * 4;
      const r = fluxRaw[off], g = fluxRaw[off+1], b = fluxRaw[off+2];
      if (lum(r, g, b) > LUMA_THRESH) fgPixels.push([r, g, b]);
    }
  }
}

console.log(`\nForeground pixels sampled: ${fgPixels.length}  (luma > ${LUMA_THRESH})`);

// ── K-means to find 3 dominant knight colors ──────────────────────────────────
const clusters    = kmeans3(fgPixels);
const nesIndices  = clusters.map(c => nearestNesIdx(c));

console.log(`\nK-means clusters (dark→light):`);
clusters.forEach((c, i) => {
  const ni  = nesIndices[i];
  const nrgb = NES_HW[ni];
  console.log(`  idx ${i+1}: rgb(${c.join(",").padEnd(15)}) → NES 0x${ni.toString(16).padStart(2,"0")} rgb(${nrgb.join(",")})`);
});
console.log(`\n  In SMB: write 0x${nesIndices[0].toString(16).padStart(2,"0")} to $3F11`);
console.log(`           write 0x${nesIndices[1].toString(16).padStart(2,"0")} to $3F12`);
console.log(`           write 0x${nesIndices[2].toString(16).padStart(2,"0")} to $3F13`);

// ── Re-quantize all tiles ─────────────────────────────────────────────────────
const newChr    = new Uint8Array(4096);  // start blank
const seen      = new Set();
let nTransparent = 0, nColored = 0, nTiles = 0;

for (const tile of tiles) {
  if (seen.has(tile.chr_tile_idx)) continue;
  seen.add(tile.chr_tile_idx);

  const sx = Math.round(tile.canvas_x * fx);
  const sy = Math.round(tile.canvas_y * fy);
  const sw = Math.max(1, Math.round(tile.canvas_w * fx));
  const sh = Math.max(1, Math.round(tile.canvas_h * fy));
  const base = tile.chr_tile_idx * 16;

  for (let row = 0; row < 8; row++) {
    let p0 = 0, p1 = 0;
    for (let col = 0; col < 8; col++) {
      // Nearest-neighbor sample within tile region
      const px  = Math.min(sx + Math.round(col * sw / 8), fW - 1);
      const py  = Math.min(sy + Math.round(row * sh / 8), fH - 1);
      const off = (py * fW + px) * 4;
      const r   = fluxRaw[off], g = fluxRaw[off+1], b = fluxRaw[off+2];

      let ci;
      if (lum(r, g, b) <= LUMA_THRESH) {
        ci = 0;   // transparent
        nTransparent++;
      } else {
        let best = 0, bestD = Infinity;
        for (let k = 0; k < 3; k++) {
          const d = colorSq([r, g, b], clusters[k]);
          if (d < bestD) { bestD = d; best = k; }
        }
        ci = best + 1;   // cluster 0,1,2 → palette index 1,2,3
        nColored++;
      }

      p0 |= (ci & 1)      << (7 - col);
      p1 |= ((ci >> 1) & 1) << (7 - col);
    }
    newChr[base + row]     = p0;
    newChr[base + 8 + row] = p1;
  }
  nTiles++;
}

const total = nTransparent + nColored;
console.log(`\nQuantization:  ${nTiles} tiles  ${nTransparent}/${total} transparent (${(nTransparent/total*100).toFixed(1)}%)  ${nColored}/${total} colored`);

// ── Save CHR ──────────────────────────────────────────────────────────────────
fs.writeFileSync(CHR_OUT, newChr);
console.log(`\nSaved: ${path.basename(CHR_OUT)}`);

// ── Save CHR preview PNG (8 tiles wide) ──────────────────────────────────────
// NES renders palette colors from PPU palette; preview uses knight NES colors
const SCALE = 8;
const COLS  = 16;
const ROWS  = Math.ceil(256 / COLS);
const pngW  = COLS * 8 * SCALE;
const pngH  = ROWS * 8 * SCALE;
const pngBuf = Buffer.alloc(pngW * pngH * 3, 0);  // black

// Knight colors for preview (use NES hw palette values)
const previewColors = [
  [0, 0, 0],          // index 0: transparent → black in preview
  NES_HW[nesIndices[0]],
  NES_HW[nesIndices[1]],
  NES_HW[nesIndices[2]],
];

for (let ti = 0; ti < 256; ti++) {
  const base   = ti * 16;
  const tileCol = ti % COLS;
  const tileRow = Math.floor(ti / COLS);

  for (let row = 0; row < 8; row++) {
    for (let col = 0; col < 8; col++) {
      const bit = 7 - col;
      const ci  = ((newChr[base + row] >> bit) & 1) | (((newChr[base + 8 + row] >> bit) & 1) << 1);
      const [pr, pg, pb] = previewColors[ci];
      const px  = (tileCol * 8 + col) * SCALE;
      const py  = (tileRow * 8 + row) * SCALE;
      for (let sy = 0; sy < SCALE; sy++) {
        for (let sx = 0; sx < SCALE; sx++) {
          const off = ((py + sy) * pngW + (px + sx)) * 3;
          pngBuf[off]     = pr;
          pngBuf[off + 1] = pg;
          pngBuf[off + 2] = pb;
        }
      }
    }
  }
}

await sharp(pngBuf, { raw: { width: pngW, height: pngH, channels: 3 } })
  .png().toFile(PNG_OUT);
console.log(`Saved: ${path.basename(PNG_OUT)}`);

// ── Update tilemap with knight palette info ───────────────────────────────────
const updatedTilemap = {
  ...tileMap,
  knight_palette_nes_indices: nesIndices,
  knight_palette_rgb:         clusters.map(c => `rgb(${c.join(",")})`),
  knight_palette_nes_rgb:     nesIndices.map(i => `rgb(${NES_HW[i].join(",")})`),
};
fs.writeFileSync(TILEMAP_PATH, JSON.stringify(updatedTilemap, null, 2));
console.log(`Saved: ${path.basename(TILEMAP_PATH)}  (+ knight_palette_nes_indices)`);

console.log("\nDone. Update demo to write these to $3F11-$3F13 when Persistent CHR is active.");
