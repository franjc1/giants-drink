#!/usr/bin/env node
/**
 * mario-flux-compose.js — FLUX Round-Trip POC (Steps 1-3+5)
 *
 * Step 1: Compose Mario-only sprite sheet from tier1 manifest + CHR-ROM
 *         → experiment-output/mario-flux-input.png
 *         → experiment-output/mario-flux-tilemap.json
 *
 * Step 2: Send to FLUX (fal-ai/flux-pro/kontext) with knight transformation prompt
 *         → experiment-output/mario-flux-output.png
 *
 * Step 3: Decompose FLUX output → NES 2bpp CHR + preview
 *         → experiment-output/mario-flux-quantized.chr  (PT0, 4096 bytes)
 *         → experiment-output/mario-flux-quantized.png
 *
 * Step 5: Report stats
 *
 * Requires: FAL_KEY environment variable
 */

import { fal } from "@fal-ai/client";
import { NES, Controller } from "jsnes";
import sharp from "sharp";
import fs from "fs";
import path from "path";
import { homedir } from "os";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const OUT_DIR   = path.join(__dirname, "..", "experiment-output");
const romsDir   = path.join(homedir(), "nes-roms");

// ── Locate SMB ROM ────────────────────────────────────────────────────────────
const romFile = fs.readdirSync(romsDir).find(
  f => f.includes("Super Mario Bros") && !f.includes("2") && !f.includes("3")
    && !f.includes("Lost") && !f.includes("+") && f.endsWith(".nes")
);
if (!romFile) { console.error("SMB ROM not found"); process.exit(1); }
const romBuf  = fs.readFileSync(path.join(romsDir, romFile));
const romStr  = romBuf.toString("binary");
const prgSize = romBuf[4] * 16384;
const chrOff  = 16 + prgSize;
const CHR_PT0 = romBuf.slice(chrOff, chrOff + 4096);  // sprite tiles

// ── NES hardware palette ──────────────────────────────────────────────────────
const NES_RGB = [
  [84,84,84],[0,30,116],[8,16,144],[48,0,136],[68,0,100],[92,0,48],
  [84,4,0],[60,24,0],[32,42,0],[8,58,0],[0,64,0],[0,60,0],[0,50,60],
  [0,0,0],[0,0,0],[0,0,0],[152,150,152],[8,76,196],[48,50,236],[92,30,228],
  [136,20,176],[160,20,100],[152,34,32],[120,60,0],[84,90,0],[40,114,0],
  [8,124,0],[0,118,40],[0,102,120],[0,0,0],[0,0,0],[0,0,0],[236,238,236],
  [76,154,236],[120,124,236],[176,98,236],[228,84,236],[236,88,180],
  [236,106,100],[212,136,32],[160,170,0],[116,196,0],[76,208,32],[56,204,108],
  [56,180,204],[60,60,60],[0,0,0],[0,0,0],[236,238,236],[168,204,236],
  [188,188,236],[212,178,236],[236,174,236],[236,174,212],[236,180,176],
  [228,196,144],[204,210,120],[180,222,120],[168,226,144],[152,226,180],
  [160,214,228],[160,162,160],[0,0,0],[0,0,0],
];
const nesRGB   = idx => NES_RGB[idx & 0x3f] ?? [0,0,0];
const colorSq  = (a, b) => (a[0]-b[0])**2 + (a[1]-b[1])**2 + (a[2]-b[2])**2;
const nearestNes = (r,g,b) => {
  let best = 0, d = Infinity;
  for (let i = 0; i < 64; i++) { const v = colorSq([r,g,b], NES_RGB[i]); if (v<d){d=v;best=i;} }
  return best;
};

// ── CHR tile decode (2bpp → 8×8 palette indices) ─────────────────────────────
function decodeTile(bank, idx) {
  const base = idx * 16, px = new Uint8Array(64);
  for (let r = 0; r < 8; r++) {
    const lo = bank[base + r], hi = bank[base + 8 + r];
    for (let c = 0; c < 8; c++) {
      const b = 7 - c;
      px[r*8+c] = (((hi>>b)&1)<<1) | ((lo>>b)&1);
    }
  }
  return px;
}

function tileIsBlank(bank, idx) {
  const base = idx * 16;
  for (let i = 0; i < 16; i++) if (bank[base+i]) return false;
  return true;
}

// ── Boot jsnes, capture PPU sprite palettes ───────────────────────────────────
function captureGamePalettes() {
  const nes = new NES({ onFrame:()=>{}, onAudioSample:null, onStatusUpdate:()=>{}, emulateSound:false });
  nes.loadROM(romStr);
  nes.buttonDown(1, Controller.BUTTON_START);
  for (let i = 0; i < 120; i++) nes.frame();
  nes.buttonUp(1, Controller.BUTTON_START);
  nes.buttonDown(1, Controller.BUTTON_START);
  for (let i = 0; i < 60; i++) nes.frame();
  nes.buttonUp(1, Controller.BUTTON_START);
  for (let i = 0; i < 160; i++) nes.frame();
  // Sprite palettes: $3F10-$3F1F (indices 16-31 of 32-byte palette area)
  // Each palette: [base=$3F00(shared bg), c1, c2, c3]
  const spritePals = Array.from({length:4}, (_,p) => {
    const base = 0x11 + p*4;
    return [
      nesRGB(nes.ppu.vramMem[0x3F00]),  // index 0: universal BG (transparent in sprites)
      nesRGB(nes.ppu.vramMem[0x3F00 + base]),
      nesRGB(nes.ppu.vramMem[0x3F00 + base + 1]),
      nesRGB(nes.ppu.vramMem[0x3F00 + base + 2]),
    ];
  });
  const rawPal = Array.from({length:32}, (_,i) => nes.ppu.vramMem[0x3F00+i]);
  return { spritePals, rawPal };
}

// ═══════════════════════════════════════════════════════════════════════════════
// STEP 1: Compose Mario-only sprite sheet
// ═══════════════════════════════════════════════════════════════════════════════

async function stepCompose() {
  console.log("\n═══ STEP 1: Compose Mario Sprite Sheet ═══");

  // Load tier1 manifest player entries
  const tier1 = JSON.parse(fs.readFileSync(path.join(OUT_DIR, "smb-tier1-manifest.json")));
  const playerEntries = tier1.entries.filter(e => e.section === "player");

  // Filter to Small Mario + Big Mario only (skip Fire Mario — same tiles as Big Mario)
  const groups = ["Small Mario", "Big Mario"];
  const rows = groups.map(g => ({
    name: g,
    frames: playerEntries.filter(e => e.entity === g),
  }));

  rows.forEach(r => console.log(`  ${r.name}: ${r.frames.length} frames`));

  // ── Layout constants ──────────────────────────────────────────────────────
  const SCALE  = 4;
  const TILE_S = 8 * SCALE;   // 32px per native 8×8 tile at 4× scale
  const CELL_W = 128;         // 128px cell (fits 16×16 native sprite)
  const CELL_H = 128;
  const GAP    = 16;
  const LABEL_W = 80;
  const TOP_PAD = 8;
  const HDR_H   = 24;
  const L_PAD   = 8;
  const R_PAD   = 8;
  const B_PAD   = 8;

  const nCols  = Math.max(...rows.map(r => r.frames.length));
  const nRows  = rows.length;

  const contentW = nCols * CELL_W + (nCols - 1) * GAP;
  const contentH = nRows * CELL_H + (nRows - 1) * GAP;
  const canvasW  = L_PAD + LABEL_W + GAP + contentW + R_PAD;
  const canvasH  = TOP_PAD + HDR_H + GAP + contentH + B_PAD;
  console.log(`  Canvas: ${canvasW}×${canvasH}`);

  // Magenta background (#FF00FF)
  const RGBA = new Uint8Array(canvasW * canvasH * 4);
  for (let i = 0; i < canvasW * canvasH; i++) {
    RGBA[i*4] = 255; RGBA[i*4+1] = 0; RGBA[i*4+2] = 255; RGBA[i*4+3] = 255;
  }

  const setPixel = (x, y, r, g, b) => {
    if (x < 0 || y < 0 || x >= canvasW || y >= canvasH) return;
    const o = (y * canvasW + x) * 4;
    RGBA[o] = r; RGBA[o+1] = g; RGBA[o+2] = b; RGBA[o+3] = 255;
  };
  const fillRect = (x, y, w, h, col) => {
    for (let dy = 0; dy < h; dy++)
      for (let dx = 0; dx < w; dx++) setPixel(x+dx, y+dy, ...col);
  };
  const DARK  = [20, 20, 20];
  const BORDER = [100, 100, 120];

  // Load the game's palette
  console.log("  Booting jsnes to capture sprite palettes...");
  const { spritePals, rawPal } = captureGamePalettes();
  console.log(`  Sprite pal 0: ${JSON.stringify(rawPal.slice(17,20).map(v=>"0x"+v.toString(16)))}`);

  // ── Render rows ────────────────────────────────────────────────────────────
  const tileMapEntries = [];
  const cellStartX = L_PAD + LABEL_W + GAP;

  for (let ri = 0; ri < rows.length; ri++) {
    const row = rows[ri];
    const cellY = TOP_PAD + HDR_H + GAP + ri * (CELL_H + GAP);

    // Label strip (dark bg, text drawn as dots is too complex — use dark fill only)
    fillRect(L_PAD, cellY, LABEL_W, CELL_H, [30, 30, 60]);

    for (let fi = 0; fi < row.frames.length; fi++) {
      const frame = row.frames[fi];
      const cellX = cellStartX + fi * (CELL_W + GAP);

      // Cell background already magenta (set earlier)
      // Draw cell border
      for (let i = 0; i < CELL_W; i++) {
        setPixel(cellX+i, cellY,        ...BORDER);
        setPixel(cellX+i, cellY+CELL_H-1, ...BORDER);
      }
      for (let i = 0; i < CELL_H; i++) {
        setPixel(cellX,        cellY+i, ...BORDER);
        setPixel(cellX+CELL_W-1, cellY+i, ...BORDER);
      }

      // Render each tile in this frame
      const tilePal = spritePals[0]; // Mario always palette 0
      for (const tile of (frame.tiles || [])) {
        if (tile.tile_idx === 0xFC) continue;
        if (tileIsBlank(CHR_PT0, tile.tile_idx)) continue;

        // tile.pixel_x / pixel_y are absolute in the tier1 canvas.
        // Offset within cell = tile.pixel_x - frame.cell_x, etc.
        const offX = tile.pixel_x - frame.cell_x;
        const offY = tile.pixel_y - frame.cell_y;
        const drawX = cellX + offX;
        const drawY = cellY + offY;

        // Render the 32×32 scaled tile
        const px8 = decodeTile(CHR_PT0, tile.tile_idx);
        for (let r = 0; r < 8; r++) {
          for (let c = 0; c < 8; c++) {
            const sr = tile.flip_v ? 7-r : r;
            const sc = tile.flip_h ? 7-c : c;
            const pidx = px8[sr*8+sc];
            if (pidx === 0) continue;
            const [R, G, B] = tilePal[pidx];
            for (let sy = 0; sy < SCALE; sy++)
              for (let sx = 0; sx < SCALE; sx++)
                setPixel(drawX + c*SCALE + sx, drawY + r*SCALE + sy, R, G, B);
          }
        }

        // Record tile position in the new canvas
        tileMapEntries.push({
          chr_tile_idx: tile.tile_idx,
          chr_tile_hex: "0x" + tile.tile_idx.toString(16).padStart(2,"0"),
          canvas_x: drawX,
          canvas_y: drawY,
          canvas_tile_w: TILE_S,
          canvas_tile_h: TILE_S,
          flip_h: tile.flip_h,
          flip_v: tile.flip_v || false,
          palette: tile.palette,
          entity: frame.entity,
          frame_id: frame.frame_id,
        });
      }
    }
  }

  // ── Write input image ──────────────────────────────────────────────────────
  const inputPath = path.join(OUT_DIR, "mario-flux-input.png");
  await sharp(Buffer.from(RGBA), { raw: { width: canvasW, height: canvasH, channels: 4 } })
    .png().toFile(inputPath);
  console.log(`  Saved: ${inputPath} (${canvasW}×${canvasH})`);

  // ── Write tilemap ──────────────────────────────────────────────────────────
  // Deduplicate: keep first occurrence of each chr_tile_idx
  const seen = new Set();
  const dedupedTiles = [];
  for (const t of tileMapEntries) {
    if (!seen.has(t.chr_tile_idx)) {
      seen.add(t.chr_tile_idx);
      dedupedTiles.push(t);
    }
  }

  const tileMap = {
    scale: SCALE,
    canvas_width:  canvasW,
    canvas_height: canvasH,
    sprite_palettes: rawPal.slice(16).map(v => "0x"+v.toString(16).padStart(2,"0")),
    unique_tile_count: dedupedTiles.length,
    tiles: dedupedTiles,  // first occurrence of each unique CHR tile index
    all_placements: tileMapEntries,  // all placements including duplicates
  };

  const tileMapPath = path.join(OUT_DIR, "mario-flux-tilemap.json");
  fs.writeFileSync(tileMapPath, JSON.stringify(tileMap, null, 2));
  console.log(`  Saved: ${tileMapPath} (${dedupedTiles.length} unique tiles, ${tileMapEntries.length} placements)`);

  return { canvasW, canvasH, tileMap, inputPath, spritePals };
}

// ═══════════════════════════════════════════════════════════════════════════════
// STEP 2: Send to FLUX
// ═══════════════════════════════════════════════════════════════════════════════

async function stepFlux(inputPath) {
  console.log("\n═══ STEP 2: Send to FLUX ═══");

  if (!process.env.FAL_KEY) {
    console.error("FAL_KEY not set");
    process.exit(1);
  }
  fal.config({ credentials: process.env.FAL_KEY });

  // Upload input image
  console.log("  Uploading to fal storage...");
  const imgBuf = fs.readFileSync(inputPath);
  const blob = new Blob([imgBuf], { type: "image/png" });
  const imageUrl = await fal.storage.upload(blob);
  console.log(`  Uploaded: ${imageUrl}`);

  // Call FLUX Kontext
  const PROMPT = "Transform this pixel art sprite sheet of a video game plumber into a medieval knight character. Steel armor, helmet with visor, sword instead of fist. Keep the EXACT same poses, positions, and grid layout. Each sprite must stay in its own cell. Retro pixel art style.";
  console.log(`  Prompt: "${PROMPT.slice(0,80)}..."`);
  console.log("  Calling fal-ai/flux-pro/kontext...");

  let outputUrl;
  try {
    const result = await fal.subscribe("fal-ai/flux-pro/kontext", {
      input: { prompt: PROMPT, image_url: imageUrl },
      logs: true,
      onQueueUpdate: (update) => {
        const msg = update.logs?.map(l => l.message).filter(Boolean).join(" | ") || "";
        if (msg) process.stdout.write(`  [FLUX ${update.status}] ${msg}\n`);
        else process.stdout.write(`  [FLUX ${update.status}]\n`);
      },
    });
    outputUrl = result.data?.images?.[0]?.url;
    if (!outputUrl) throw new Error("No image URL in result: " + JSON.stringify(result.data));
    console.log(`  FLUX output URL: ${outputUrl}`);
  } catch (err) {
    console.error("FLUX call failed:", err.message || err);
    process.exit(1);
  }

  // Download output
  const outputPath = path.join(OUT_DIR, "mario-flux-output.png");
  const resp = await fetch(outputUrl);
  if (!resp.ok) throw new Error(`Download failed: ${resp.status}`);
  const buf = Buffer.from(await resp.arrayBuffer());
  fs.writeFileSync(outputPath, buf);

  const meta = await sharp(outputPath).metadata();
  console.log(`  Saved: ${outputPath} (${meta.width}×${meta.height}, ${buf.length} bytes)`);

  return { outputPath, outputWidth: meta.width, outputHeight: meta.height };
}

// ═══════════════════════════════════════════════════════════════════════════════
// STEP 3: Decompose FLUX output → NES CHR
// ═══════════════════════════════════════════════════════════════════════════════

async function stepQuantize(outputPath, canvasW, canvasH, tileMap, spritePals) {
  console.log("\n═══ STEP 3: Decompose → NES CHR ═══");

  const SCALE = tileMap.scale;  // 4
  const TILE_S = 8 * SCALE;     // 32px

  // Load FLUX output and resize to match our input canvas exactly
  const { data: fluxPixels, info } = await sharp(outputPath)
    .resize(canvasW, canvasH, { kernel: "lanczos3", fit: "fill" })
    .ensureAlpha()
    .raw()
    .toBuffer({ resolveWithObject: true });
  console.log(`  FLUX output resized from native to ${info.width}×${info.height}`);

  // Start from original CHR data, overwrite only the mario tile indices
  const newChr = Buffer.from(CHR_PT0);

  const uniqueTiles = tileMap.tiles;  // first occurrence per chr_tile_idx
  console.log(`  Quantizing ${uniqueTiles.length} unique tile indices...`);

  let quantized = 0, skipped = 0;
  const chrAddr = new Set();

  for (const entry of uniqueTiles) {
    const { chr_tile_idx, canvas_x, canvas_y, palette } = entry;

    if (canvas_x < 0 || canvas_y < 0 ||
        canvas_x + TILE_S > canvasW || canvas_y + TILE_S > canvasH) {
      console.log(`  skip tile $${chr_tile_idx.toString(16).padStart(2,"0")}: out of bounds`);
      skipped++;
      continue;
    }

    // Extract TILE_S×TILE_S block → downscale to 8×8 (nearest-neighbor)
    const raw8 = await sharp(fluxPixels, { raw: { width: canvasW, height: canvasH, channels: 4 } })
      .extract({ left: canvas_x, top: canvas_y, width: TILE_S, height: TILE_S })
      .resize(8, 8, { kernel: "nearest" })
      .raw()
      .toBuffer();

    // Quantize to the game's sprite palette for this tile
    const pal = spritePals[palette] ?? spritePals[0];
    const base = chr_tile_idx * 16;

    for (let row = 0; row < 8; row++) {
      let plane0 = 0, plane1 = 0;
      for (let col = 0; col < 8; col++) {
        const off = (row * 8 + col) * 4;
        const r = raw8[off], g = raw8[off+1], b = raw8[off+2], a = raw8[off+3];

        // Magenta pixels (from background) → transparent (index 0)
        const isMagenta = r > 200 && b > 200 && g < 60;
        if (a < 64 || isMagenta) continue;

        // Find nearest non-transparent palette color (indices 1-3)
        let bestCi = 1, bestD = Infinity;
        for (let ci = 1; ci < 4; ci++) {
          const d = colorSq([r,g,b], pal[ci]);
          if (d < bestD) { bestD = d; bestCi = ci; }
        }
        plane0 |= (bestCi & 1)        << (7 - col);
        plane1 |= ((bestCi >> 1) & 1) << (7 - col);
      }
      newChr[base + row]     = plane0;
      newChr[base + 8 + row] = plane1;
    }

    chrAddr.add(chr_tile_idx);
    quantized++;
  }

  console.log(`  Quantized: ${quantized} tiles, skipped: ${skipped}`);
  console.log(`  CHR addresses written: ${chrAddr.size} (indices ${[...chrAddr].sort((a,b)=>a-b).map(v=>"$"+v.toString(16)).join(", ")})`);

  // ── Save CHR file ────────────────────────────────────────────────────────
  const chrPath = path.join(OUT_DIR, "mario-flux-quantized.chr");
  fs.writeFileSync(chrPath, newChr);
  console.log(`  Saved: ${chrPath} (${newChr.length} bytes, PT0 only)`);

  // ── Render preview: place quantized tiles at their canvas positions ───────
  const previewBuf = Buffer.alloc(canvasW * canvasH * 4);
  // Fill magenta background
  for (let i = 0; i < canvasW * canvasH; i++) {
    previewBuf[i*4]   = 255;
    previewBuf[i*4+1] = 0;
    previewBuf[i*4+2] = 255;
    previewBuf[i*4+3] = 255;
  }

  // Re-decode and render all placements (including duplicates, with correct flip)
  for (const entry of tileMap.all_placements) {
    const { chr_tile_idx, canvas_x, canvas_y, flip_h, flip_v, palette } = entry;
    if (tileIsBlank(newChr, chr_tile_idx)) continue;
    const pal = spritePals[palette] ?? spritePals[0];
    const base = chr_tile_idx * 16;
    const px8 = new Uint8Array(64);
    for (let r = 0; r < 8; r++) {
      const p0 = newChr[base+r], p1 = newChr[base+8+r];
      for (let c = 0; c < 8; c++) {
        const b = 7-c;
        px8[r*8+c] = (((p1>>b)&1)<<1) | ((p0>>b)&1);
      }
    }
    for (let r = 0; r < 8; r++) {
      for (let c = 0; c < 8; c++) {
        const sr = flip_v ? 7-r : r;
        const sc = flip_h ? 7-c : c;
        const pidx = px8[sr*8+sc];
        if (pidx === 0) continue;
        const [R, G, B] = pal[pidx];
        for (let sy = 0; sy < SCALE; sy++) {
          for (let sx = 0; sx < SCALE; sx++) {
            const px = canvas_x + c*SCALE + sx;
            const py = canvas_y + r*SCALE + sy;
            if (px < 0 || py < 0 || px >= canvasW || py >= canvasH) continue;
            const o = (py * canvasW + px) * 4;
            previewBuf[o]   = R;
            previewBuf[o+1] = G;
            previewBuf[o+2] = B;
            previewBuf[o+3] = 255;
          }
        }
      }
    }
  }

  const previewPath = path.join(OUT_DIR, "mario-flux-quantized.png");
  await sharp(previewBuf, { raw: { width: canvasW, height: canvasH, channels: 4 } })
    .png().toFile(previewPath);
  console.log(`  Saved: ${previewPath} (${canvasW}×${canvasH})`);

  return { chrPath, chrAddr, quantized, skipped };
}

// ═══════════════════════════════════════════════════════════════════════════════
// Main
// ═══════════════════════════════════════════════════════════════════════════════

async function main() {
  console.log(`ROM: ${romFile}`);

  const inputMeta   = await sharp(path.join(OUT_DIR, "mario-flux-input.png")).metadata().catch(() => null);
  const outputMeta  = await sharp(path.join(OUT_DIR, "mario-flux-output.png")).metadata().catch(() => null);
  const hasInput    = !!inputMeta;
  const hasOutput   = !!outputMeta;

  // Check if we can skip re-running expensive steps
  let inputPath, canvasW, canvasH, tileMap, spritePals;

  // Always re-run Step 1 (fast, local only)
  ({ canvasW, canvasH, tileMap, inputPath, spritePals } = await stepCompose());

  let outputPath, outputWidth, outputHeight;
  if (hasOutput) {
    console.log("\n═══ STEP 2: FLUX (SKIPPED — mario-flux-output.png exists) ═══");
    outputPath   = path.join(OUT_DIR, "mario-flux-output.png");
    outputWidth  = outputMeta.width;
    outputHeight = outputMeta.height;
    console.log(`  Using existing: ${outputPath} (${outputWidth}×${outputHeight})`);
  } else {
    ({ outputPath, outputWidth, outputHeight } = await stepFlux(inputPath));
  }

  const { chrAddr, quantized, skipped } = await stepQuantize(outputPath, canvasW, canvasH, tileMap, spritePals);

  // ── Step 5: Report ─────────────────────────────────────────────────────────
  console.log("\n═══ STEP 5: Report ═══");
  const inputStat  = fs.statSync(inputPath);
  const outputStat = fs.statSync(outputPath);
  console.log(`  Input image:       ${canvasW}×${canvasH}  (${inputStat.size} bytes)`);
  console.log(`  FLUX output:       ${outputWidth}×${outputHeight}  (${outputStat.size} bytes)`);
  console.log(`  Tiles decomposed:  ${quantized}`);
  console.log(`  Tiles skipped:     ${skipped}`);
  console.log(`  Unique CHR addrs:  ${chrAddr.size}  (PT0 tile indices overwritten)`);
  console.log(`\n  Outputs:`);
  console.log(`    experiment-output/mario-flux-input.png     ← input to FLUX`);
  console.log(`    experiment-output/mario-flux-output.png    ← FLUX transformed`);
  console.log(`    experiment-output/mario-flux-quantized.png ← NES-quantized preview`);
  console.log(`    experiment-output/mario-flux-quantized.chr ← inject into game`);
  console.log(`\n  Browser demo: http://localhost:8080/public/flux-roundtrip-demo.html`);
}

main().catch(err => { console.error("Fatal:", err); process.exit(1); });
