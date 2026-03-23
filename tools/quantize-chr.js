// quantize-chr.js
// Standalone quantization step: takes experiment-output/smb-sprites-flux-out.png
// and the tile-map JSON, quantizes each tile to NES 2bpp CHR format.
// Outputs:
//   experiment-output/smb-sprites-quantized.chr      (8192-byte NES CHR)
//   experiment-output/smb-sprites-quantized-preview.png  (visual verification)

import fs from "fs";
import path from "path";
import os from "os";
import sharp from "sharp";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const EXTRACT_DIR = path.join(os.homedir(), "nes-extracted", "super-mario-bros-world");
const OUTPUT_DIR  = path.join(__dirname, "..", "experiment-output");

// ── NES hardware palette (64 RGB entries) ─────────────────────────────────────
const NES_PAL = [
  [84,84,84],    [0,30,116],    [8,16,144],    [48,0,136],
  [68,0,100],    [92,0,48],     [84,4,0],      [60,24,0],
  [32,42,0],     [8,58,0],      [0,64,0],      [0,60,0],
  [0,50,60],     [0,0,0],       [0,0,0],       [0,0,0],
  [152,150,152], [8,76,196],    [48,50,236],   [92,30,228],
  [136,20,176],  [160,20,100],  [152,34,32],   [120,60,0],
  [84,90,0],     [40,114,0],    [8,124,0],     [0,118,40],
  [0,102,120],   [0,0,0],       [0,0,0],       [0,0,0],
  [236,238,236], [76,154,236],  [120,124,236], [176,98,236],
  [228,84,236],  [236,88,180],  [236,106,100], [212,136,32],
  [160,170,0],   [116,196,0],   [76,208,32],   [56,204,108],
  [56,180,204],  [60,60,60],    [0,0,0],       [0,0,0],
  [236,238,236], [168,204,236], [188,188,236], [212,178,236],
  [236,174,236], [236,174,212], [236,180,176], [228,196,144],
  [204,210,120], [180,222,120], [168,226,144], [152,226,180],
  [160,214,228], [160,162,160], [0,0,0],       [0,0,0],
];

function colorDistSq(a, b) {
  return (a[0]-b[0])**2 + (a[1]-b[1])**2 + (a[2]-b[2])**2;
}

// ── Load inputs ───────────────────────────────────────────────────────────────
const fluxPath   = path.join(OUTPUT_DIR, "smb-sprites-flux-out.png");
const tileMapPath = path.join(OUTPUT_DIR, "smb-tile-map.json");
const chrPath    = path.join(EXTRACT_DIR, "state-0x0773-v0.chr.bin");
const statePath  = path.join(EXTRACT_DIR, "states", "state-773-102.json");

for (const p of [fluxPath, tileMapPath, chrPath, statePath]) {
  if (!fs.existsSync(p)) { console.error(`Missing: ${p}`); process.exit(1); }
}

const tileMap  = JSON.parse(fs.readFileSync(tileMapPath));
const chrData  = fs.readFileSync(chrPath);
const stateData = JSON.parse(fs.readFileSync(statePath));

// Sprite palettes from state JSON (bytes 16-31 of 32-byte palette dump)
const palHex = stateData.palette;
const palBytes = [];
for (let i = 0; i < palHex.length; i += 2)
  palBytes.push(parseInt(palHex.slice(i, i+2), 16));
const sprPalettes = Array.from({length:4}, (_,p) =>
  Array.from({length:4}, (_,c) => NES_PAL[palBytes[16 + p*4 + c] & 0x3F] ?? [0,0,0])
);

const { scale: SCALE, canvas_width: scaledW, canvas_height: scaledH, sprites } = tileMap;
console.log(`Tile map: ${sprites.length} entries, canvas ${scaledW}×${scaledH}, scale=${SCALE}`);

// ── Load and resize FLUX output to match canvas ───────────────────────────────
const fluxMeta = await sharp(fluxPath).metadata();
console.log(`FLUX output: ${fluxMeta.width}×${fluxMeta.height} (${fs.statSync(fluxPath).size} bytes)`);

const { data: fluxPixels, info: fluxInfo } = await sharp(fluxPath)
  .resize(scaledW, scaledH, { kernel: "lanczos3", fit: "fill" })
  .ensureAlpha()
  .raw()
  .toBuffer({ resolveWithObject: true });
console.log(`Resized to: ${fluxInfo.width}×${fluxInfo.height}`);

// ── Quantize each unique tile ─────────────────────────────────────────────────
const newChr = Buffer.from(chrData);  // start from original, overwrite changed tiles
const TILE_PX = 8 * SCALE;           // size of one tile in the scaled image

// Use first occurrence of each tile index for pixel extraction
const tileFirst = new Map();
for (const e of sprites) {
  if (!tileFirst.has(e.tile)) tileFirst.set(e.tile, e);
}
console.log(`\nQuantizing ${tileFirst.size} unique tile indices...`);

let quantized = 0, skipped = 0;
for (const [tileIdx, entry] of tileFirst) {
  const tx = entry.canvas_x;
  const ty = entry.canvas_y;

  if (tx < 0 || ty < 0 || tx + TILE_PX > scaledW || ty + TILE_PX > scaledH) {
    console.log(`  skip tile $${tileIdx.toString(16).padStart(2,"0")}: out of bounds (${tx},${ty})`);
    skipped++;
    continue;
  }

  // Extract TILE_PX×TILE_PX block → downscale to 8×8
  const raw8 = await sharp(fluxPixels, { raw: { width: scaledW, height: scaledH, channels: 4 } })
    .extract({ left: tx, top: ty, width: TILE_PX, height: TILE_PX })
    .resize(8, 8, { kernel: "lanczos3" })
    .raw()
    .toBuffer();

  const pal = sprPalettes[entry.palette];
  const base = tileIdx * 16;

  for (let row = 0; row < 8; row++) {
    let plane0 = 0, plane1 = 0;
    for (let col = 0; col < 8; col++) {
      const off = (row * 8 + col) * 4;
      const r = raw8[off], g = raw8[off+1], b = raw8[off+2], a = raw8[off+3];
      if (a < 64) continue;  // transparent → index 0

      // Find nearest of 4 palette colors
      let bestCi = 0, bestD = Infinity;
      for (let ci = 0; ci < 4; ci++) {
        const d = colorDistSq([r,g,b], pal[ci]);
        if (d < bestD) { bestD = d; bestCi = ci; }
      }
      plane0 |= (bestCi & 1)       << (7 - col);
      plane1 |= ((bestCi >> 1) & 1) << (7 - col);
    }
    newChr[base + row]     = plane0;
    newChr[base + 8 + row] = plane1;
  }
  quantized++;
}

console.log(`  Quantized: ${quantized} tiles, skipped: ${skipped}`);

// ── Save CHR ──────────────────────────────────────────────────────────────────
const chrOutPath = path.join(OUTPUT_DIR, "smb-sprites-quantized.chr");
fs.writeFileSync(chrOutPath, newChr);
console.log(`\nSaved: ${chrOutPath}  (${newChr.length} bytes)`);

// ── Render preview: all unique tiles as an 8×8 grid at 4× scale ──────────────
// Show each unique tile rendered with its palette, in a grid layout
const PREVIEW_SCALE = 4;
const TILE_DISPLAY  = 8 * PREVIEW_SCALE;  // 32px per tile
const COLS = 16;
const ROWS = Math.ceil(tileFirst.size / COLS);
const PW   = COLS * TILE_DISPLAY;
const PH   = ROWS * TILE_DISPLAY;
const previewBuf = Buffer.alloc(PW * PH * 4, 200);  // light gray background

function decodeChrTile(idx) {
  const base = idx * 16, px = new Uint8Array(64);
  for (let r = 0; r < 8; r++) {
    const p0 = newChr[base+r], p1 = newChr[base+8+r];
    for (let c = 0; c < 8; c++)
      px[r*8+c] = (((p1>>(7-c))&1)<<1) | ((p0>>(7-c))&1);
  }
  return px;
}

let col = 0, row = 0;
for (const [tileIdx, entry] of tileFirst) {
  const px = decodeChrTile(tileIdx);
  const pal = sprPalettes[entry.palette];
  const ox = col * TILE_DISPLAY, oy = row * TILE_DISPLAY;
  for (let r = 0; r < 8; r++) {
    for (let c = 0; c < 8; c++) {
      const ci = px[r*8+c];
      if (ci === 0) continue;  // transparent
      const [rv,gv,bv] = pal[ci];
      for (let sy = 0; sy < PREVIEW_SCALE; sy++) {
        for (let sx = 0; sx < PREVIEW_SCALE; sx++) {
          const px2 = ox + c*PREVIEW_SCALE + sx;
          const py2 = oy + r*PREVIEW_SCALE + sy;
          const o = (py2 * PW + px2) * 4;
          previewBuf[o]=rv; previewBuf[o+1]=gv; previewBuf[o+2]=bv; previewBuf[o+3]=255;
        }
      }
    }
  }
  col++;
  if (col >= COLS) { col = 0; row++; }
}

const previewPath = path.join(OUTPUT_DIR, "smb-sprites-quantized-preview.png");
await sharp(previewBuf, { raw: { width: PW, height: PH, channels: 4 } })
  .png()
  .toFile(previewPath);
console.log(`Saved: ${previewPath}  (${PW}×${PH}, ${tileFirst.size} tiles)`);

// ── Timestamp verification ────────────────────────────────────────────────────
const fluxStat  = fs.statSync(fluxPath);
const chrStat   = fs.statSync(chrOutPath);
const prevStat  = fs.statSync(previewPath);
console.log(`\nTimestamp check:`);
console.log(`  FLUX input:   ${fluxStat.mtime.toISOString()}  ${fluxPath}`);
console.log(`  CHR output:   ${chrStat.mtime.toISOString()}  ${chrOutPath}`);
console.log(`  Preview PNG:  ${prevStat.mtime.toISOString()}  ${previewPath}`);
console.log(`\nReady for injection at http://localhost:8080/public/flux-sprite-test.html`);
