#!/usr/bin/env node
/**
 * decompose-debug.js
 *
 * Trace exactly what pixels each tile gets from the FLUX output.
 * No fixes — just print everything.
 */

import sharp  from "sharp";
import fs     from "fs";
import path   from "path";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const OUT_DIR   = path.join(__dirname, "..", "experiment-output");

const tilemapPath    = path.join(OUT_DIR, "mario-flux-tilemap-v2.json");
const fluxOutputPath = path.join(OUT_DIR, "mario-flux-output-v2.png");

// ── Load files ────────────────────────────────────────────────────────────────
const tilemap = JSON.parse(fs.readFileSync(tilemapPath, "utf8"));
const { canvas_width, canvas_height, tiles, scale } = tilemap;
const TILE_S = 8 * scale;  // 32

console.log("═══════════════════════════════════════════════════════════");
console.log("DECOMPOSE DEBUG — mario-flux-tilemap-v2.json vs FLUX output");
console.log("═══════════════════════════════════════════════════════════");
console.log(`\nTilemap:     canvas_width=${canvas_width}  canvas_height=${canvas_height}`);
console.log(`             ${tiles.length} tile entries, scale=${scale}, tile_size_px=${TILE_S}`);

// Get FLUX output native dimensions
const fluxMeta = await sharp(fluxOutputPath).metadata();
console.log(`\nFLUX output: ${fluxMeta.width}×${fluxMeta.height}  format=${fluxMeta.format}`);
console.log(`\nAspect ratio MISMATCH check:`);
console.log(`  Tilemap expects: ${canvas_width}×${canvas_height}  ratio=${(canvas_width/canvas_height).toFixed(2)}:1`);
console.log(`  FLUX output is:  ${fluxMeta.width}×${fluxMeta.height}  ratio=${(fluxMeta.width/fluxMeta.height).toFixed(2)}:1`);
console.log(`  Width scale when resizing FLUX→tilemap:  ${(canvas_width/fluxMeta.width).toFixed(4)}`);
console.log(`  Height scale when resizing FLUX→tilemap: ${(canvas_height/fluxMeta.height).toFixed(4)}`);

// ── Load FLUX image at TWO sizes ──────────────────────────────────────────────
// 1. Resized to tilemap dimensions (what the decomposer actually uses)
const { data: fluxResized } = await sharp(fluxOutputPath)
  .resize(canvas_width, canvas_height, { kernel: "lanczos3", fit: "fill" })
  .ensureAlpha()
  .raw()
  .toBuffer({ resolveWithObject: true });

// 2. Raw native resolution (no resize)
const { data: fluxNative, info: nativeInfo } = await sharp(fluxOutputPath)
  .ensureAlpha()
  .raw()
  .toBuffer({ resolveWithObject: true });

const NW = nativeInfo.width, NH = nativeInfo.height;

// ── Helpers ───────────────────────────────────────────────────────────────────
function sampleCenter(buf, bufW, tileX, tileY, tileW, tileH, sampleN) {
  // Sample a sampleN×sampleN block from the center of the tile region
  const cx   = tileX + Math.floor(tileW / 2) - Math.floor(sampleN / 2);
  const cy   = tileY + Math.floor(tileH / 2) - Math.floor(sampleN / 2);
  const pixels = [];
  for (let dy = 0; dy < sampleN; dy++) {
    for (let dx = 0; dx < sampleN; dx++) {
      const px = cx + dx, py = cy + dy;
      if (px < 0 || py < 0 || px >= bufW) continue;
      const off = (py * bufW + px) * 4;
      pixels.push([buf[off], buf[off+1], buf[off+2]]);
    }
  }
  return pixels;
}

function isMagenta([r, g, b]) { return r > 200 && b > 200 && g < 100; }
function isBlack([r, g, b])   { return r < 20 && g < 20 && b < 20; }

function describePixel([r, g, b]) {
  if (isMagenta([r, g, b]))    return "MAGENTA";
  if (isBlack([r, g, b]))      return "black";
  if (r > 150 && g > 150 && b > 150) return "light";
  if (r > 150 && g < 100 && b < 100) return "red-ish";
  if (r < 100 && g > 150 && b < 100) return "green-ish";
  if (r < 100 && g < 100 && b > 150) return "blue-ish";
  if (r > 150 && g > 100 && b < 80)  return "warm/brown";
  return "mixed";
}

function summarizeSamples(pixels) {
  const magentaCount = pixels.filter(p => isMagenta(p)).length;
  const total        = pixels.length;
  if (magentaCount === total) return "ALL MAGENTA";
  if (magentaCount > total/2) return `MOSTLY MAGENTA (${magentaCount}/${total})`;
  const descs = pixels.map(describePixel);
  const unique = [...new Set(descs)];
  return `[${unique.join(", ")}] (0 magenta)`;
}

// ── STEP 1: Per-tile trace ────────────────────────────────────────────────────
console.log("\n\n═══ STEP 1: Per-tile pixel trace ═══");
console.log("Format: tile_hex | canvas coords | sample@resized | sample@native | isMagenta?");
console.log("─────────────────────────────────────────────────────────────────────────────");

// Group tiles we care about in order
const focusTiles = new Set([
  0x32, 0x33, 0x34, 0x35, // walk frame A
  0x36, 0x37, 0x38, 0x39, // walk frame B
  0x3a, 0x3b, 0x3c,       // stand/walk frame C
  0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, // small Mario
]);

for (const tile of tiles) {
  const { chr_tile_idx, canvas_x, canvas_y, canvas_tile_w, canvas_tile_h, mario_type } = tile;
  const tw = canvas_tile_w || TILE_S;
  const th = canvas_tile_h || TILE_S;

  // Sample from resized image (what decomposer uses)
  const resizedSamples = sampleCenter(fluxResized, canvas_width, canvas_x, canvas_y, tw, th, 4);
  const resizedSummary = summarizeSamples(resizedSamples);
  const resizedColors  = resizedSamples.slice(0, 4).map(([r,g,b]) => `rgb(${r},${g},${b})`).join("  ");

  // Corresponding coordinates in NATIVE FLUX image (scaled proportionally)
  const nativeX  = Math.round(canvas_x  * NW / canvas_width);
  const nativeY  = Math.round(canvas_y  * NH / canvas_height);
  const nativeW  = Math.round(tw        * NW / canvas_width);
  const nativeH  = Math.round(th        * NH / canvas_height);
  const nativeSamples = sampleCenter(fluxNative, NW, nativeX, nativeY, nativeW, nativeH, 4);
  const nativeSummary = summarizeSamples(nativeSamples);
  const nativeColors  = nativeSamples.slice(0, 4).map(([r,g,b]) => `rgb(${r},${g},${b})`).join("  ");

  const isFocus = focusTiles.has(chr_tile_idx);
  const marker  = isFocus ? " <--" : "";

  console.log(`\n  tile 0x${chr_tile_idx.toString(16).padStart(2,"0")} (${mario_type})${marker}`);
  console.log(`    tilemap coords:    x=${canvas_x} y=${canvas_y} w=${tw} h=${th}`);
  console.log(`    resized sample:    ${resizedSummary}`);
  console.log(`      colors:          ${resizedColors}`);
  console.log(`    native coords:     x=${nativeX} y=${nativeY} w=${nativeW} h=${nativeH}`);
  console.log(`    native sample:     ${nativeSummary}`);
  console.log(`      colors:          ${nativeColors}`);
}

// ── STEP 2: Focus comparison — tiles that work vs don't ──────────────────────
console.log("\n\n═══ STEP 2: Focus comparison (resized → what decomposer sees) ═══");
console.log("─────────────────────────────────────────────────────────────────");

const groups = [
  { label: "walk-A (0x32-0x35) — these show in skid state",  indices: [0x32,0x33,0x34,0x35] },
  { label: "walk-B (0x36-0x39) — these show in walk state",  indices: [0x36,0x37,0x38,0x39] },
  { label: "stand/C (0x3a-0x3c) — these show in stand state",indices: [0x3a,0x3b,0x3c]       },
  { label: "small mario (0x00-0x09) — never seen in Big Mario OAM", indices: [0,1,2,3,4,5,6,7,8,9] },
];

for (const group of groups) {
  console.log(`\n  ── ${group.label} ──`);
  for (const idx of group.indices) {
    const entry = tiles.find(t => t.chr_tile_idx === idx);
    if (!entry) { console.log(`    0x${idx.toString(16).padStart(2,"0")}: NOT IN TILEMAP`); continue; }
    const { canvas_x, canvas_y } = entry;
    const tw = entry.canvas_tile_w || TILE_S;
    const th = entry.canvas_tile_h || TILE_S;

    // Full 8×8 pixel scan on resized image (what quantizer actually processes)
    // Show what the nearest-neighbor 8×8 downscale produces
    const { data: tile8px } = await sharp(
      fluxResized,
      { raw: { width: canvas_width, height: canvas_height, channels: 4 } }
    )
      .extract({ left: canvas_x, top: canvas_y, width: tw, height: th })
      .resize(8, 8, { kernel: "nearest" })
      .raw()
      .toBuffer({ resolveWithObject: true });

    const rowStrings = [];
    let totalMagenta = 0, totalNonMagenta = 0;
    for (let r = 0; r < 8; r++) {
      const row = [];
      for (let c = 0; c < 8; c++) {
        const off = (r * 8 + c) * 4;
        const R = tile8px[off], G = tile8px[off+1], B = tile8px[off+2];
        if (isMagenta([R, G, B])) { row.push("M"); totalMagenta++; }
        else { row.push("+"); totalNonMagenta++; }
      }
      rowStrings.push(row.join(""));
    }
    const allMagenta = totalMagenta === 64;
    console.log(`    0x${idx.toString(16).padStart(2,"0")}  x=${canvas_x.toString().padStart(3)} y=${canvas_y.toString().padStart(2)}  ` +
                `magenta=${totalMagenta}/64  ${allMagenta ? "<<< ALL MAGENTA — BLANK TILE" : "has content"}`);
    if (!allMagenta || true) {
      rowStrings.forEach(r => process.stdout.write(`           ${r}\n`));
    }
  }
}

// ── STEP 3: CHR address verification ─────────────────────────────────────────
console.log("\n\n═══ STEP 3: CHR write address verification ═══");
console.log("In SMB: sprite PT = $0000 (ppuFlags.spPatternTable=0)");
console.log("Tile N → PPU address range [N*16, N*16+15]");
console.log("─────────────────────────────────────────────────────────────────");

const injectChecks = [0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3a, 0x3b, 0x3c];
for (const idx of injectChecks) {
  const ppuStart = idx * 16;
  const ppuEnd   = ppuStart + 15;
  console.log(`  tile 0x${idx.toString(16).padStart(2,"0")} → ppu.writeMem(0x${ppuStart.toString(16).padStart(4,"0")}) .. ppu.writeMem(0x${ppuEnd.toString(16).padStart(4,"0")})`);
}

console.log("\n  Injector code path (from flux-roundtrip-demo.html / writePT0):");
console.log("    writePT0: for i=0..4095: ppu.writeMem(i, chrBytes[i])");
console.log("    This writes ALL 256 tiles (0x0000..0x0FFF).");
console.log("    Tile N bytes = chrBytes[N*16 .. N*16+15]  ← CORRECT for PT0");

console.log("\n  reinjectPT0 (persistent path):");
console.log("    for t=0..255: ppu.ptTile[t].setScanline(r, knightChr[t*16+r], knightChr[t*16+8+r])");
console.log("    ptTile[t] is the cached Tile object for PT0 tile t  ← CORRECT for PT0");

// ── STEP 4: Key diagnostic — does FLUX output even contain the grid layout? ──
console.log("\n\n═══ STEP 4: FLUX output layout sanity check ═══");
console.log("Sampling horizontal strip at y=0 and y=NH/2 in NATIVE FLUX image");
console.log("(to check if grid structure is preserved after FLUX transform)");

const stripY_top = Math.round(NH * (8 + 16) / canvas_height);  // center of top row
const stripY_bot = Math.round(NH * (48 + 16) / canvas_height); // center of bottom row
console.log(`\n  Input tile row Y centers: top=24px (in ${canvas_height}px), bot=64px`);
console.log(`  Scaled to FLUX native:    top_y=${stripY_top} (in ${NH}px), bot_y=${stripY_bot}`);
console.log(`\n  Sampling top strip (y=${stripY_top}) at x = [0, NW/8, NW/4, NW/2, 3NW/4]:`);
for (const frac of [0, 0.125, 0.25, 0.5, 0.75]) {
  const sx  = Math.round(NW * frac);
  const off = (stripY_top * NW + sx) * 4;
  const [r, g, b] = [fluxNative[off], fluxNative[off+1], fluxNative[off+2]];
  console.log(`    x=${sx.toString().padStart(4)}  rgb(${r.toString().padStart(3)},${g.toString().padStart(3)},${b.toString().padStart(3)})  ${isMagenta([r,g,b]) ? "MAGENTA" : describePixel([r,g,b])}`);
}
console.log(`\n  Sampling bottom strip (y=${stripY_bot}) at x = [0, NW/8, NW/4, NW/2, 3NW/4]:`);
for (const frac of [0, 0.125, 0.25, 0.5, 0.75]) {
  const sx  = Math.round(NW * frac);
  const off = (stripY_bot * NW + sx) * 4;
  const [r, g, b] = [fluxNative[off], fluxNative[off+1], fluxNative[off+2]];
  console.log(`    x=${sx.toString().padStart(4)}  rgb(${r.toString().padStart(3)},${g.toString().padStart(3)},${b.toString().padStart(3)})  ${isMagenta([r,g,b]) ? "MAGENTA" : describePixel([r,g,b])}`);
}

// ── Scan all unique tile positions' CENTER pixels in the resized image ─────────
console.log("\n\n═══ STEP 5: Quick summary — magenta vs content per tile ═══");
let magentaCount = 0, contentCount = 0;
for (const tile of tiles) {
  const { chr_tile_idx, canvas_x, canvas_y } = tile;
  const tw = tile.canvas_tile_w || TILE_S;
  const th = tile.canvas_tile_h || TILE_S;
  const cx = canvas_x + Math.floor(tw/2);
  const cy = canvas_y + Math.floor(th/2);
  const off = (cy * canvas_width + cx) * 4;
  const [r, g, b] = [fluxResized[off], fluxResized[off+1], fluxResized[off+2]];
  const status = isMagenta([r,g,b]) ? "MAGENTA" : `rgb(${r},${g},${b})`;
  console.log(`  0x${chr_tile_idx.toString(16).padStart(2,"0")}  center=(${cx},${cy})  ${status}`);
  if (isMagenta([r,g,b])) magentaCount++; else contentCount++;
}
console.log(`\n  Summary: ${contentCount} tiles with content, ${magentaCount} tiles with magenta at center`);
