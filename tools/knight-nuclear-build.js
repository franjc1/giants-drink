#!/usr/bin/env node
/**
 * knight-nuclear-build.js
 *
 * Builds a high-quality knight CHR using:
 *   - Area averaging (not nearest-neighbor) for 8×8 downscale
 *   - K-means(3) on ALL tile pixels combined
 *   - Luminance stretching so the 3 NES colors span bright–dark, not all-dark
 *   - Per-tile diagnostic: crop coords + avg RGB so you can see what each tile gets
 *
 * Outputs:
 *   experiment-output/mario-flux-knight-nuclear.chr
 *   experiment-output/mario-flux-knight-nuclear.json  ← palette indices for demo
 *   experiment-output/mario-flux-knight-nuclear.png   ← preview sheet
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
const NES_HW    = nesPalObj.palette_as_array.map(hex => [
  parseInt(hex.slice(1,3), 16),
  parseInt(hex.slice(3,5), 16),
  parseInt(hex.slice(5,7), 16),
]);

// ── Helpers ───────────────────────────────────────────────────────────────────
const colorSq  = (a, b) => (a[0]-b[0])**2 + (a[1]-b[1])**2 + (a[2]-b[2])**2;
const lum      = ([r,g,b]) => (r + g + b) / 3;
const nearestNesIdx = rgb => {
  let best = 0, bestD = Infinity;
  for (let i = 0; i < NES_HW.length; i++) {
    const d = colorSq(rgb, NES_HW[i]);
    if (d < bestD) { bestD = d; best = i; }
  }
  return best;
};

// Find nearest NES color, but only consider "cool" colors (grays, blues, cyans)
// and exclude pure blacks, greens, reds, oranges — so a gray knight looks gray,
// not mint-green or red when the nearest NES gray is far away.
const KNIGHT_NES_CANDIDATES = NES_HW.reduce((acc, rgb, i) => {
  const [r, g, b] = rgb;
  const l = (r + g + b) / 3;
  if (l === 0) return acc;                         // skip blacks
  const isWarm = r > g + 30 || r > b + 30;         // skip reds/oranges/yellows
  const isSatGreen = g > r + 30 && g > b + 20;     // skip greens
  if (!isWarm && !isSatGreen) acc.push(i);
  return acc;
}, []);

const nearestKnightNesIdx = rgb => {
  let best = KNIGHT_NES_CANDIDATES[0], bestD = Infinity;
  for (const i of KNIGHT_NES_CANDIDATES) {
    const d = colorSq(rgb, NES_HW[i]);
    if (d < bestD) { bestD = d; best = i; }
  }
  return best;
};

// ── Area-average a source region to 8×8 ──────────────────────────────────────
// Returns flat array of 64 [r,g,b] values.
function areaAvg8x8(raw, W, H, sx, sy, sw, sh) {
  const out = [];
  for (let oy = 0; oy < 8; oy++) {
    for (let ox = 0; ox < 8; ox++) {
      // Exact source pixel range for this 1/8 slice
      const x0 = sx + ox       * sw / 8;
      const x1 = sx + (ox + 1) * sw / 8;
      const y0 = sy + oy       * sh / 8;
      const y1 = sy + (oy + 1) * sh / 8;

      const ix0 = Math.max(0, Math.floor(x0));
      const ix1 = Math.min(W - 1, Math.ceil(x1) - 1);
      const iy0 = Math.max(0, Math.floor(y0));
      const iy1 = Math.min(H - 1, Math.ceil(y1) - 1);

      let sumR = 0, sumG = 0, sumB = 0, sumW = 0;
      for (let py = iy0; py <= iy1; py++) {
        const yw = Math.min(py + 1, y1) - Math.max(py, y0);
        if (yw <= 0) continue;
        for (let px = ix0; px <= ix1; px++) {
          const xw = Math.min(px + 1, x1) - Math.max(px, x0);
          if (xw <= 0) continue;
          const w   = xw * yw;
          const off = (py * W + px) * 4;
          sumR += raw[off]   * w;
          sumG += raw[off+1] * w;
          sumB += raw[off+2] * w;
          sumW += w;
        }
      }
      out.push(sumW > 0 ? [sumR/sumW, sumG/sumW, sumB/sumW] : [0,0,0]);
    }
  }
  return out;   // 64 entries, each [r,g,b] float
}

// ── K-means (k=3), sorted dark→light ─────────────────────────────────────────
function kmeans3(pixels, maxIter = 40) {
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
      if (!clusters[k].length) return c;
      const s = clusters[k].reduce((a, b) => [a[0]+b[0], a[1]+b[1], a[2]+b[2]], [0,0,0]);
      return s.map(x => x / clusters[k].length);
    });
    if (newCenters.every((nc, k) => colorSq(nc, centers[k]) < 1)) break;
    centers = newCenters;
  }
  centers.sort((a, b) => lum(a) - lum(b));
  return centers;
}

// ── Load inputs ───────────────────────────────────────────────────────────────
const TILEMAP_PATH = path.join(OUT_DIR, "mario-flux-tilemap-v3.json");
const FLUX_PATH    = path.join(OUT_DIR, "mario-flux-output-v3.png");

const tileMap = JSON.parse(fs.readFileSync(TILEMAP_PATH, "utf8"));
const { input_width: inW, input_height: inH, tiles } = tileMap;

const { data: fluxRaw, info } = await sharp(FLUX_PATH)
  .ensureAlpha().raw().toBuffer({ resolveWithObject: true });
const { width: fW, height: fH } = info;
const fx = fW / inW, fy = fH / inH;

console.log(`FLUX output:  ${fW}×${fH}`);
console.log(`Scale:        fx=${fx.toFixed(4)}  fy=${fy.toFixed(4)}`);
console.log(`Tiles:        ${tiles.length}`);
console.log();

// ── Per-tile: area-average to 8×8, collect foreground pixels ─────────────────
const LUMA_BG = 12;   // below this = background (transparent)

const allFgPixels  = [];   // for k-means
const tilePixels   = [];   // [{ tileIdx, pixels64 }] — pixels64 is the 8×8 float array
const seen         = new Set();

console.log("─────────────────────────────────────────────────────────────────────────────────");
console.log("tile   crop_x  crop_y  crop_w  crop_h   avg_rgb               fg/64  diagnosis");
console.log("─────────────────────────────────────────────────────────────────────────────────");

for (const tile of tiles) {
  const { chr_tile_idx, canvas_x, canvas_y, canvas_w, canvas_h } = tile;
  if (seen.has(chr_tile_idx)) continue;
  seen.add(chr_tile_idx);

  const sx = Math.round(canvas_x * fx);
  const sy = Math.round(canvas_y * fy);
  const sw = Math.max(8, Math.round(canvas_w * fx));
  const sh = Math.max(8, Math.round(canvas_h * fy));

  // Area-average to 8×8
  const px64 = areaAvg8x8(fluxRaw, fW, fH, sx, sy, sw, sh);

  // Average RGB of the entire crop
  const avgR = px64.reduce((s,p)=>s+p[0],0) / 64;
  const avgG = px64.reduce((s,p)=>s+p[1],0) / 64;
  const avgB = px64.reduce((s,p)=>s+p[2],0) / 64;
  const avgL = lum([avgR, avgG, avgB]);

  const fgCount = px64.filter(p => lum(p) > LUMA_BG).length;

  // Diagnose
  let diag;
  if (avgL <= LUMA_BG + 5)      diag = "*** BACKGROUND — no knight pixels";
  else if (fgCount < 16)        diag = "sparse — " + fgCount + " fg pixels";
  else                          diag = "OK";

  console.log(
    `0x${chr_tile_idx.toString(16).padStart(2,"0")}   ` +
    `${sx.toString().padStart(5)} ${sy.toString().padStart(6)} ${sw.toString().padStart(6)} ${sh.toString().padStart(6)}   ` +
    `rgb(${Math.round(avgR).toString().padStart(3)},${Math.round(avgG).toString().padStart(3)},${Math.round(avgB).toString().padStart(3)})  luma=${Math.round(avgL).toString().padStart(3)}   ` +
    `${fgCount.toString().padStart(2)}/64   ${diag}`
  );

  // Collect foreground pixels for global k-means
  for (const p of px64) {
    if (lum(p) > LUMA_BG) allFgPixels.push(p);
  }
  tilePixels.push({ chr_tile_idx, pixels: px64 });
}

console.log();
console.log(`Total foreground pixels collected: ${allFgPixels.length}`);

if (allFgPixels.length < 3) {
  console.error("ERROR: Not enough foreground pixels for k-means — all crops landed on background.");
  process.exit(1);
}

// ── Luminance stretching so NES palette spans full brightness range ────────────
// Sort all foreground lumas, take 5th and 95th percentile.
const allLumas = allFgPixels.map(p => lum(p)).sort((a,b) => a-b);
const p05 = allLumas[Math.floor(allLumas.length * 0.05)];
const p95 = allLumas[Math.floor(allLumas.length * 0.95)];

// Map p05 → target_lo (50), p95 → target_hi (220)
const TARGET_LO = 50, TARGET_HI = 220;

function stretchPx([r, g, b]) {
  const l = lum([r, g, b]);
  if (l === 0) return [0,0,0];
  const newL = TARGET_LO + (l - p05) * (TARGET_HI - TARGET_LO) / (p95 - p05);
  const clamped = Math.max(0, Math.min(255, newL));
  const scale   = clamped / l;
  return [
    Math.min(255, r * scale),
    Math.min(255, g * scale),
    Math.min(255, b * scale),
  ];
}

const stretchedPixels = allFgPixels.map(stretchPx);

console.log(`\nLuminance stretch: p05=${Math.round(p05)} p95=${Math.round(p95)} → mapped to [${TARGET_LO}, ${TARGET_HI}]`);

// ── K-means on stretched pixels ───────────────────────────────────────────────
const stretchedCenters = kmeans3(stretchedPixels);
const nesIndices        = stretchedCenters.map(c => nearestKnightNesIdx(c.map(Math.round)));

console.log(`\nK-means clusters (stretched, dark→light):`);
stretchedCenters.forEach((c, i) => {
  const ni   = nesIndices[i];
  const nrgb = NES_HW[ni];
  console.log(
    `  idx ${i+1}: stretched rgb(${c.map(x=>Math.round(x)).join(",").padEnd(15)})` +
    ` → NES 0x${ni.toString(16).padStart(2,"0")} rgb(${nrgb.join(",")})` +
    ` luma=${Math.round(lum(nrgb))}`
  );
});

// ── Quantize all tiles ────────────────────────────────────────────────────────
const newChr = new Uint8Array(4096);

let nTransparent = 0, nColored = 0;

for (const { chr_tile_idx, pixels } of tilePixels) {
  const base = chr_tile_idx * 16;

  for (let row = 0; row < 8; row++) {
    let p0 = 0, p1 = 0;
    for (let col = 0; col < 8; col++) {
      const px = pixels[row * 8 + col];

      let ci;
      if (lum(px) <= LUMA_BG) {
        ci = 0;   // transparent
        nTransparent++;
      } else {
        // Stretch, then find nearest cluster
        const spx = stretchPx(px);
        let best = 0, bestD = Infinity;
        for (let k = 0; k < 3; k++) {
          const d = colorSq(spx, stretchedCenters[k]);
          if (d < bestD) { bestD = d; best = k; }
        }
        ci = best + 1;
        nColored++;
      }

      p0 |= (ci & 1)       << (7 - col);
      p1 |= ((ci >> 1) & 1) << (7 - col);
    }
    newChr[base + row]     = p0;
    newChr[base + 8 + row] = p1;
  }
}

const total = nTransparent + nColored;
console.log(`\nQuantization: ${nTransparent}/${total} transparent (${(nTransparent/total*100).toFixed(1)}%)  ${nColored}/${total} colored`);

// ── Save CHR ──────────────────────────────────────────────────────────────────
const CHR_PATH  = path.join(OUT_DIR, "mario-flux-knight-nuclear.chr");
const JSON_PATH = path.join(OUT_DIR, "mario-flux-knight-nuclear.json");
const PNG_PATH  = path.join(OUT_DIR, "mario-flux-knight-nuclear.png");

fs.writeFileSync(CHR_PATH, newChr);
console.log(`\nSaved: ${path.basename(CHR_PATH)}`);

// ── Save JSON (palette info for demo) ────────────────────────────────────────
const meta = {
  nes_palette_indices: nesIndices,
  nes_palette_rgb:     nesIndices.map(i => `rgb(${NES_HW[i].join(",")})`),
  stretched_centers:   stretchedCenters.map(c => `rgb(${c.map(x=>Math.round(x)).join(",")})`),
  luma_stretch:        { p05: Math.round(p05), p95: Math.round(p95), target_lo: TARGET_LO, target_hi: TARGET_HI },
  transparent_pixels:  nTransparent,
  colored_pixels:      nColored,
};
fs.writeFileSync(JSON_PATH, JSON.stringify(meta, null, 2));
console.log(`Saved: ${path.basename(JSON_PATH)}`);

// ── Save preview PNG ──────────────────────────────────────────────────────────
const SCALE = 8, COLS = 16;
const ROWS  = Math.ceil(256 / COLS);
const pW    = COLS * 8 * SCALE, pH = ROWS * 8 * SCALE;
const pBuf  = Buffer.alloc(pW * pH * 3, 0x22);   // dark background

const previewColors = [
  [20, 20, 20],         // idx 0: transparent → near-black
  NES_HW[nesIndices[0]],
  NES_HW[nesIndices[1]],
  NES_HW[nesIndices[2]],
];

for (let ti = 0; ti < 256; ti++) {
  const base    = ti * 16;
  const tileCol = ti % COLS;
  const tileRow = Math.floor(ti / COLS);
  for (let row = 0; row < 8; row++) {
    for (let col = 0; col < 8; col++) {
      const bit = 7 - col;
      const ci  = ((newChr[base + row] >> bit) & 1) | (((newChr[base + 8 + row] >> bit) & 1) << 1);
      const [pr, pg, pb] = previewColors[ci];
      const px = (tileCol * 8 + col) * SCALE;
      const py = (tileRow * 8 + row) * SCALE;
      for (let sy = 0; sy < SCALE; sy++) {
        for (let sx = 0; sx < SCALE; sx++) {
          const off = ((py + sy) * pW + (px + sx)) * 3;
          pBuf[off] = pr; pBuf[off+1] = pg; pBuf[off+2] = pb;
        }
      }
    }
  }
}

await sharp(pBuf, { raw: { width: pW, height: pH, channels: 3 } }).png().toFile(PNG_PATH);
console.log(`Saved: ${path.basename(PNG_PATH)}`);

console.log(`\nNES palette: $3F11=0x${nesIndices[0].toString(16).padStart(2,"0")} $3F12=0x${nesIndices[1].toString(16).padStart(2,"0")} $3F13=0x${nesIndices[2].toString(16).padStart(2,"0")}`);
console.log("Done.");
