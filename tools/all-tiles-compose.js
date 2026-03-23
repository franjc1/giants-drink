#!/usr/bin/env node
/**
 * all-tiles-compose.js
 *
 * Renders ALL 256 PT0 sprite tiles as 128 vertical pairs in an 8×16 grid.
 * 8× scale, each pair in a 128×128 cell → canvas 1024×2048.
 * One FLUX call. Every tile Mario or any enemy could ever use is covered.
 *
 * Layout:
 *   128 pairs: tile N (top) + tile N+1 (bottom)
 *   Grid: 8 columns × 16 rows of 128×128 cells
 *   Each tile: 8px native × 8× scale = 64×64 display px, centred in 128×128 cell
 *
 * Outputs:
 *   experiment-output/all-tiles-input.png     — 1024×2048 input for FLUX
 *   experiment-output/all-tiles-tilemap.json  — positions for all 256 tile indices
 *   experiment-output/all-tiles-output.png    — FLUX output (skip if exists)
 */

import { NES, Controller } from "jsnes";
import { fal }             from "@fal-ai/client";
import sharp               from "sharp";
import fs                  from "fs";
import path                from "path";
import { homedir }         from "os";
import { fileURLToPath }   from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const OUT_DIR   = path.join(__dirname, "..", "experiment-output");

// ── ROM + CHR ─────────────────────────────────────────────────────────────────
const romsDir = path.join(homedir(), "nes-roms");
const romFile = fs.readdirSync(romsDir).find(
  f => f.includes("Super Mario Bros") && !f.includes("2") && !f.includes("3")
    && !f.includes("Lost") && !f.includes("+") && f.endsWith(".nes")
);
if (!romFile) { console.error("ROM not found in ~/nes-roms"); process.exit(1); }
const romBuf  = fs.readFileSync(path.join(romsDir, romFile));
const romStr  = romBuf.toString("binary");
const prgSize = romBuf[4] * 16384;
const chrOff  = 16 + prgSize;
const CHR_PT0 = romBuf.slice(chrOff, chrOff + 4096);   // 256 tiles × 16 bytes
console.log(`ROM: ${romFile}  CHR PT0: ${CHR_PT0.length} bytes`);

// ── NES palette ───────────────────────────────────────────────────────────────
const nesPalJson = JSON.parse(fs.readFileSync(
  path.join(__dirname, "..", "data", "ground-truth", "palettes", "nes-palette.json"), "utf8"
));
const NES_RGB = nesPalJson.palette_as_array.map(hex => [
  parseInt(hex.slice(1,3), 16),
  parseInt(hex.slice(3,5), 16),
  parseInt(hex.slice(5,7), 16),
]);
const nesRGB = i => NES_RGB[i & 0x3f];

// ── CHR decode ────────────────────────────────────────────────────────────────
// Returns Uint8Array(64) of palette indices 0-3 for one 8×8 tile.
function decodeTile(idx) {
  const base = idx * 16, px = new Uint8Array(64);
  for (let r = 0; r < 8; r++) {
    const lo = CHR_PT0[base + r], hi = CHR_PT0[base + 8 + r];
    for (let c = 0; c < 8; c++) {
      const b = 7 - c;
      px[r*8+c] = (((hi>>b)&1)<<1) | ((lo>>b)&1);
    }
  }
  return px;
}

// ── Boot SMB, read live sprite palette 0 ─────────────────────────────────────
function bootAndGetPalette() {
  console.log("  Booting SMB...");
  const nes = new NES({ onFrame: ()=>{}, onAudioSample: null, emulateSound: false });
  nes.loadROM(romStr);
  nes.buttonDown(1, Controller.BUTTON_START);
  for (let i = 0; i < 120; i++) nes.frame();
  nes.buttonUp(1, Controller.BUTTON_START);
  nes.buttonDown(1, Controller.BUTTON_START);
  for (let i = 0; i < 60; i++) nes.frame();
  nes.buttonUp(1, Controller.BUTTON_START);
  for (let i = 0; i < 200; i++) nes.frame();   // past title + level intro

  const v = nes.ppu.vramMem;
  return [
    nesRGB(v[0x3F00] & 0x3F),   // bg (= transparent for sprite rendering)
    nesRGB(v[0x3F11] & 0x3F),
    nesRGB(v[0x3F12] & 0x3F),
    nesRGB(v[0x3F13] & 0x3F),
  ];
}

// ── Layout ────────────────────────────────────────────────────────────────────
const SCALE      = 8;      // NES pixels → display pixels
const TILE_PX    = 64;     // one 8×8 tile at 8× = 64×64 display px
const CELL       = 128;    // cell is 128×128; tile is centred (32px pad each side)
const GRID_COLS  = 8;
const GRID_ROWS  = 16;     // 128 pairs
const CANVAS_W   = GRID_COLS * CELL;   // 1024
const CANVAS_H   = GRID_ROWS * CELL;   // 2048

// ═══════════════════════════════════════════════════════════════════════════════
async function main() {

  console.log("\n═══ Step 1: Boot + sprite palette ═══");
  const pal0 = bootAndGetPalette();
  console.log(`  pal0: ${pal0.map(([r,g,b]) => `rgb(${r},${g},${b})`).join("  ")}`);

  // ── Step 2: Render all 256 tiles ────────────────────────────────────────────
  console.log("\n═══ Step 2: Render 256 tiles into 1024×2048 grid ═══");

  const RGBA = new Uint8Array(CANVAS_W * CANVAS_H * 4);
  for (let i = 3; i < RGBA.length; i += 4) RGBA[i] = 255;   // solid black bg

  const tileRecords = [];

  for (let tileIdx = 0; tileIdx < 256; tileIdx++) {
    const pairIdx = tileIdx >> 1;                              // 0-127
    const isBot   = tileIdx & 1;                               // 0 = top, 1 = bottom
    const cellCol = pairIdx % GRID_COLS;
    const cellRow = Math.floor(pairIdx / GRID_COLS);
    const cellX   = cellCol * CELL;
    const cellY   = cellRow * CELL;
    const tileX   = cellX + (CELL - TILE_PX) / 2;             // centred: +32
    const tileY   = cellY + isBot * TILE_PX;

    const px8 = decodeTile(tileIdx);

    for (let py = 0; py < 8; py++) {
      for (let px = 0; px < 8; px++) {
        const ci = px8[py * 8 + px];
        if (ci === 0) continue;    // transparent → keep black bg
        const [r, g, b] = pal0[ci];
        for (let sy = 0; sy < SCALE; sy++) {
          for (let sx = 0; sx < SCALE; sx++) {
            const off = ((tileY + py*SCALE + sy) * CANVAS_W + (tileX + px*SCALE + sx)) * 4;
            RGBA[off] = r; RGBA[off+1] = g; RGBA[off+2] = b;
          }
        }
      }
    }

    tileRecords.push({
      chr_tile_idx: tileIdx,
      chr_tile_hex: "0x" + tileIdx.toString(16).padStart(2, "0"),
      canvas_x:     tileX,
      canvas_y:     tileY,
      canvas_w:     TILE_PX,
      canvas_h:     TILE_PX,
    });
  }

  console.log(`  256 tiles rendered.  Canvas: ${CANVAS_W}×${CANVAS_H}`);

  // ── Save input PNG + tilemap ─────────────────────────────────────────────────
  console.log("\n═══ Step 3: Save input image + tilemap ═══");

  const inputPath   = path.join(OUT_DIR, "all-tiles-input.png");
  const tilemapPath = path.join(OUT_DIR, "all-tiles-tilemap.json");

  await sharp(Buffer.from(RGBA), { raw: { width: CANVAS_W, height: CANVAS_H, channels: 4 } })
    .png().toFile(inputPath);
  console.log(`  Saved: ${path.basename(inputPath)}`);

  const tilemap = {
    version:          4,
    input_width:      CANVAS_W,
    input_height:     CANVAS_H,
    scale:            SCALE,
    grid_cols:        GRID_COLS,
    grid_rows:        GRID_ROWS,
    cell_size:        CELL,
    sprite_palette_0: pal0.slice(1).map(([r,g,b]) => `rgb(${r},${g},${b})`),
    tile_count:       256,
    tiles:            tileRecords,
  };
  fs.writeFileSync(tilemapPath, JSON.stringify(tilemap, null, 2));
  console.log(`  Saved: ${path.basename(tilemapPath)}`);

  // ── FLUX ─────────────────────────────────────────────────────────────────────
  const outputPath = path.join(OUT_DIR, "all-tiles-output.png");

  if (fs.existsSync(outputPath)) {
    console.log(`\n═══ FLUX skipped — ${path.basename(outputPath)} already exists ═══`);
    const m = await sharp(outputPath).metadata();
    console.log(`  Existing output: ${m.width}×${m.height}`);
  } else {
    console.log("\n═══ Step 4: FLUX transformation ═══");
    if (!process.env.FAL_KEY) { console.error("FAL_KEY not set"); process.exit(1); }
    fal.config({ credentials: process.env.FAL_KEY });

    const imgBuf   = fs.readFileSync(inputPath);
    const imageUrl = await fal.storage.upload(new Blob([imgBuf], { type: "image/png" }));
    console.log(`  Uploaded input: ${imageUrl}`);

    const PROMPT =
      "Transform this NES pixel art sprite reference sheet into a medieval fantasy style. " +
      "The grid contains every sprite tile from Super Mario Bros — " +
      "the plumber character tiles become a steel-armored knight with great helm and sword. " +
      "Mushroom enemy tiles become goblin footsoldiers. " +
      "Turtle shell tiles become lizardman warriors. " +
      "Coin and item tiles become gold coins and treasure. " +
      "Keep the black background solid black. " +
      "CRITICAL: preserve the exact grid layout — every tile must stay within its cell boundaries. " +
      "Retro pixel art style, crisp edges, 4-color palette per sprite, high contrast.";

    console.log("  Calling FLUX Kontext...");
    const result = await fal.subscribe("fal-ai/flux-pro/kontext", {
      input: { prompt: PROMPT, image_url: imageUrl, guidance_scale: 4, output_format: "png" },
      logs: true,
      onQueueUpdate: u => {
        const msg = u.logs?.map(l => l.message).filter(Boolean).join(" | ") || "";
        process.stdout.write(`  [${u.status}]${msg ? " " + msg : ""}\n`);
      },
    });

    const outputUrl = result.data?.images?.[0]?.url;
    if (!outputUrl) throw new Error("No output URL: " + JSON.stringify(result.data));
    console.log(`  Output URL: ${outputUrl}`);

    const buf = Buffer.from(await (await fetch(outputUrl)).arrayBuffer());
    fs.writeFileSync(outputPath, buf);
    const m = await sharp(outputPath).metadata();
    console.log(`  Saved: ${path.basename(outputPath)}  (${m.width}×${m.height})`);
  }

  console.log("\n═══ Done ═══");
  console.log(`  open ${inputPath}`);
  console.log(`  open ${outputPath}`);
  console.log(`  → hd-overlay-clean.html already updated to use all-tiles-* files`);
}

main().catch(e => { console.error(e); process.exit(1); });
