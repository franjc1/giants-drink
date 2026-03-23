#!/usr/bin/env node
/**
 * mario-flux-compose-v3.js  (fixed)
 *
 * Fixes over v2:
 *  1. Black background (no magenta)
 *  2. Assembled sprites at 8× scale, roughly-square canvas (~1:1 ratio)
 *  3. All animation frames captured reliably via fixed frame counts
 *     (frame 8 = walkB tiles, frame 16 = walkA tiles — from oam-dump data)
 *  4. Scale-factor decompose: no whole-image resize, crop each tile
 *     proportionally from native FLUX output
 *
 * Outputs:
 *   experiment-output/mario-flux-input-v3.png
 *   experiment-output/mario-flux-tilemap-v3.json
 *   experiment-output/mario-flux-output-v3.png
 *   experiment-output/mario-flux-quantized-v3.chr
 *   experiment-output/mario-flux-quantized-v3.png
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

// ── ROM ───────────────────────────────────────────────────────────────────────
const romsDir = path.join(homedir(), "nes-roms");
const romFile = fs.readdirSync(romsDir).find(
  f => f.includes("Super Mario Bros") && !f.includes("2") && !f.includes("3")
    && !f.includes("Lost") && !f.includes("+") && f.endsWith(".nes")
);
if (!romFile) { console.error("ROM not found"); process.exit(1); }
const romBuf  = fs.readFileSync(path.join(romsDir, romFile));
const romStr  = romBuf.toString("binary");
const prgSize = romBuf[4] * 16384;
const chrOff  = 16 + prgSize;
const CHR_PT0 = romBuf.slice(chrOff, chrOff + 4096);
console.log(`ROM: ${romFile}`);

// ── NES RGB palette ───────────────────────────────────────────────────────────
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
const nesRGB = i => NES_RGB[i & 0x3f];

// ── CHR helpers ───────────────────────────────────────────────────────────────
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
function hasChrData(idx) {
  const base = idx * 16;
  for (let i = 0; i < 16; i++) if (CHR_PT0[base + i]) return true;
  return false;
}
function colorSq([r1,g1,b1], [r2,g2,b2]) {
  return (r1-r2)**2 + (g1-g2)**2 + (b1-b2)**2;
}

// ── jsnes helpers ─────────────────────────────────────────────────────────────
function makeNES() {
  return new NES({
    onFrame: () => {}, onAudioSample: null,
    onStatusUpdate: () => {}, emulateSound: false,
  });
}
function saveState(nes)    { return JSON.stringify(nes.toJSON()); }
function restoreState(str) {
  const nes = makeNES();
  nes.loadROM(romStr);
  nes.fromJSON(JSON.parse(str));
  return nes;
}

const BTN = Controller;

// ── Boot to Small Mario gameplay state ───────────────────────────────────────
function bootToGameplay() {
  console.log("  Booting SMB...");
  const nes = makeNES();
  nes.loadROM(romStr);
  nes.buttonDown(1, BTN.BUTTON_START);
  for (let i = 0; i < 120; i++) nes.frame();
  nes.buttonUp(1, BTN.BUTTON_START);
  nes.buttonDown(1, BTN.BUTTON_START);
  for (let i = 0; i < 60; i++) nes.frame();
  nes.buttonUp(1, BTN.BUTTON_START);
  for (let i = 0; i < 160; i++) nes.frame();  // level intro
  nes.buttonDown(1, BTN.BUTTON_RIGHT);
  for (let i = 0; i < 80; i++) nes.frame();   // walk into open ground
  nes.buttonUp(1, BTN.BUTTON_RIGHT);
  for (let i = 0; i < 10; i++) nes.frame();
  return nes;
}

// ── Sprite palette ────────────────────────────────────────────────────────────
function getSpritePal0(nes) {
  const v  = nes.ppu.vramMem;
  const bg = nesRGB(v[0x3F00] & 0x3F);
  return [
    bg,
    nesRGB(v[0x3F11] & 0x3F),
    nesRGB(v[0x3F12] & 0x3F),
    nesRGB(v[0x3F13] & 0x3F),
  ];
}

// ── OAM capture ───────────────────────────────────────────────────────────────
function readPlayerOAM(nes) {
  const cpu = nes.cpu.mem;
  const out = [];
  for (let i = 0; i < 12; i++) {
    const base = 0x0200 + i * 4;
    const rawY = cpu[base], tile = cpu[base+1], attr = cpu[base+2], x = cpu[base+3];
    const screenY = rawY + 1;
    if (screenY >= 240) continue;
    if (tile === 0xff)  continue;  // HUD life counter icon
    out.push({ slot: i, tile, x, screenY, attr });
  }
  return out;
}

// captureAtGfxOffset: walk right until the animation controller reaches targetGfxOffset,
// then snapshot OAM. Reliable regardless of starting animation phase.
function captureAtGfxOffset(baseStr, size, targetGfxOffset) {
  const nes = restoreState(baseStr);
  nes.cpu.mem[0x0754] = size;
  nes.cpu.mem[0x0756] = 0;
  for (let i = 0; i < 16; i++) nes.frame();   // settle size change

  // Walk right until we see the target GfxOffset (max 200 frames = ~3 full cycles)
  nes.buttonDown(1, BTN.BUTTON_RIGHT);
  let found = false;
  for (let f = 0; f < 200; f++) {
    nes.frame();
    if (nes.cpu.mem[0x06D5] === targetGfxOffset) { found = true; break; }
  }
  nes.buttonUp(1, BTN.BUTTON_RIGHT);
  if (!found) {
    console.warn(`  WARNING: GfxOffset 0x${targetGfxOffset.toString(16)} not found (size=${size})`);
    return null;
  }
  nes.frame();   // settle one more frame

  const oam = readPlayerOAM(nes);
  if (oam.length === 0) return null;

  const minX = Math.min(...oam.map(s => s.x));
  const minY = Math.min(...oam.map(s => s.screenY));
  const maxX = Math.max(...oam.map(s => s.x + 8));
  const maxY = Math.max(...oam.map(s => s.screenY + 8));

  return {
    sprites:   oam.map(s => ({ ...s, relX: s.x - minX, relY: s.screenY - minY })),
    width:     maxX - minX,
    height:    maxY - minY,
    gfxOffset: nes.cpu.mem[0x06D5],
    tiles:     [...new Set(oam.map(s => s.tile))],
  };
}

// ── Canvas render ─────────────────────────────────────────────────────────────
const SCALE  = 8;
const MARGIN = 40;
const GAP    = 56;

function renderPose(RGBA, canvasW, poseData, palette, destX, destY) {
  const tileRecords = [];
  for (const s of poseData.sprites) {
    if (!hasChrData(s.tile)) continue;  // blank tile ($fc etc) → leave as black

    const tileCanvasX = destX + s.relX * SCALE;
    const tileCanvasY = destY + s.relY * SCALE;
    const px8  = decodeTile(s.tile);
    const flipH = (s.attr & 0x40) !== 0;
    const flipV = (s.attr & 0x80) !== 0;

    for (let py = 0; py < 8; py++) {
      for (let px = 0; px < 8; px++) {
        const srcPx = flipH ? 7 - px : px;
        const srcPy = flipV ? 7 - py : py;
        const palIdx = px8[srcPy * 8 + srcPx];
        if (palIdx === 0) continue;  // transparent

        const [r, g, b] = palette[palIdx];
        for (let sy = 0; sy < SCALE; sy++) {
          for (let sx = 0; sx < SCALE; sx++) {
            const cx = tileCanvasX + px * SCALE + sx;
            const cy = tileCanvasY + py * SCALE + sy;
            if (cx < 0 || cy < 0 || cx >= canvasW) continue;
            const off = (cy * canvasW + cx) * 4;
            RGBA[off] = r; RGBA[off+1] = g; RGBA[off+2] = b; RGBA[off+3] = 255;
          }
        }
      }
    }

    tileRecords.push({
      chr_tile_idx: s.tile,
      chr_tile_hex: "0x" + s.tile.toString(16).padStart(2, "0"),
      canvas_x:     tileCanvasX,
      canvas_y:     tileCanvasY,
      canvas_w:     8 * SCALE,   // 64px
      canvas_h:     8 * SCALE,   // 64px
      palette:      s.attr & 0x03,
      flip_h:       flipH,
      flip_v:       flipV,
    });
  }
  return tileRecords;
}

// ── Decompose FLUX output → NES CHR ──────────────────────────────────────────
//
// CRITICAL FIX: Do NOT resize the whole FLUX image. Instead:
//   fx = flux_width  / input_width
//   fy = flux_height / input_height
//   For each tile: crop at (canvas_x*fx, canvas_y*fy, canvas_w*fx, canvas_h*fy)
//   from the native FLUX output, then resize that crop to 8×8.
//
// No background-color detection needed — crop at exact coordinates.
//
async function decompose(fluxPath, tilemap, spritePal, outChrPath, outPreviewPath) {
  const fluxMeta = await sharp(fluxPath).metadata();
  const { input_width: inW, input_height: inH } = tilemap;
  const fx = fluxMeta.width  / inW;
  const fy = fluxMeta.height / inH;

  console.log(`  FLUX output: ${fluxMeta.width}×${fluxMeta.height}  format=${fluxMeta.format}`);
  console.log(`  Input was:   ${inW}×${inH}`);
  console.log(`  Scale factors: fx=${fx.toFixed(4)}  fy=${fy.toFixed(4)}`);

  const { data: fluxRaw, info } = await sharp(fluxPath)
    .ensureAlpha()
    .raw()
    .toBuffer({ resolveWithObject: true });

  const newChr = Buffer.from(CHR_PT0);  // start from original; overwrite mario tiles
  const seen   = new Set();
  let quantized = 0, skipped = 0;

  for (const entry of tilemap.tiles) {
    const { chr_tile_idx, canvas_x, canvas_y, canvas_w, canvas_h } = entry;

    if (seen.has(chr_tile_idx)) continue;   // first occurrence wins
    seen.add(chr_tile_idx);

    // Scale tile region to FLUX output coordinates
    const fx_x = Math.round(canvas_x * fx);
    const fx_y = Math.round(canvas_y * fy);
    const fx_w = Math.max(4, Math.round(canvas_w * fx));
    const fx_h = Math.max(4, Math.round(canvas_h * fy));

    if (fx_x + fx_w > info.width || fx_y + fx_h > info.height) {
      console.log(`  skip 0x${chr_tile_idx.toString(16)}: bounds ${fx_x}+${fx_w} > ${info.width} or ${fx_y}+${fx_h} > ${info.height}`);
      skipped++;
      continue;
    }

    // Crop tile from native FLUX, downsample to 8×8
    const { data: tile8 } = await sharp(fluxRaw, { raw: { width: info.width, height: info.height, channels: 4 } })
      .extract({ left: fx_x, top: fx_y, width: fx_w, height: fx_h })
      .resize(8, 8, { kernel: "nearest" })
      .raw()
      .toBuffer({ resolveWithObject: true });

    // Quantize to NES palette (indices 1-3; index 0 = transparent, leave as 0)
    const base = chr_tile_idx * 16;
    for (let row = 0; row < 8; row++) {
      let plane0 = 0, plane1 = 0;
      for (let col = 0; col < 8; col++) {
        const off = (row * 8 + col) * 4;
        const r = tile8[off], g = tile8[off+1], b = tile8[off+2];
        let bestCi = 1, bestD = Infinity;
        for (let ci = 1; ci < 4; ci++) {
          const d = colorSq([r, g, b], spritePal[ci]);
          if (d < bestD) { bestD = d; bestCi = ci; }
        }
        plane0 |= (bestCi & 1)        << (7 - col);
        plane1 |= ((bestCi >> 1) & 1) << (7 - col);
      }
      newChr[base + row]     = plane0;
      newChr[base + 8 + row] = plane1;
    }
    quantized++;
  }

  fs.writeFileSync(outChrPath, newChr);
  console.log(`  Quantized ${quantized} tiles, skipped ${skipped}.  → ${path.basename(outChrPath)}`);

  // ── Preview ───────────────────────────────────────────────────────────────
  const W = inW, H = inH;
  const prevBuf = Buffer.alloc(W * H * 4, 0);
  for (const entry of tilemap.tiles) {
    const { chr_tile_idx, canvas_x, canvas_y, canvas_w, canvas_h } = entry;
    const base  = chr_tile_idx * 16;
    const cellS = canvas_w / 8;
    for (let py = 0; py < 8; py++) {
      for (let px = 0; px < 8; px++) {
        const b0 = (newChr[base + py]       >> (7 - px)) & 1;
        const b1 = (newChr[base + 8 + py]   >> (7 - px)) & 1;
        const ci = (b1 << 1) | b0;
        if (ci === 0) continue;
        const [r, g, b_] = spritePal[ci];
        for (let sy = 0; sy < cellS; sy++) {
          for (let sx = 0; sx < cellS; sx++) {
            const cx = canvas_x + px * cellS + sx;
            const cy = canvas_y + py * cellS + sy;
            if (cx >= W || cy >= H) continue;
            const off = (cy * W + cx) * 4;
            prevBuf[off] = r; prevBuf[off+1] = g; prevBuf[off+2] = b_; prevBuf[off+3] = 255;
          }
        }
      }
    }
  }
  await sharp(prevBuf, { raw: { width: W, height: H, channels: 4 } })
    .png().toFile(outPreviewPath);
  console.log(`  Preview → ${path.basename(outPreviewPath)}`);

  return { newChr, quantized };
}

// ═══════════════════════════════════════════════════════════════════════════════
// MAIN
// ═══════════════════════════════════════════════════════════════════════════════

async function main() {
  // ── Step 1: Boot + create base states ─────────────────────────────────────
  console.log("\n═══ STEP 1: Boot + create base states ═══");
  const bootNes  = bootToGameplay();
  const baseStr  = saveState(bootNes);
  const pal0     = getSpritePal0(bootNes);
  console.log(`  Pal0: [bg, ${pal0.slice(1).map(([r,g,b])=>`rgb(${r},${g},${b})`).join(", ")}]`);

  // Create a properly-settled Big Mario base state.
  // Setting $0754=1 then running 60 frames is enough to fully
  // initialize Big Mario's OAM, animation counters, and GfxOffset.
  const bigSetupNes = restoreState(baseStr);
  bigSetupNes.cpu.mem[0x0754] = 1;
  bigSetupNes.cpu.mem[0x0756] = 0;
  for (let i = 0; i < 60; i++) bigSetupNes.frame();
  const bigBaseStr = saveState(bigSetupNes);
  console.log(`  Big Mario base state ready. GfxOffset=$${bigSetupNes.cpu.mem[0x06D5].toString(16)}`);

  // ── Step 2: Capture poses ─────────────────────────────────────────────────
  console.log("\n═══ STEP 2: Capture sprite poses ═══");

  // GfxOffset → tile mapping (confirmed from oam-dump.js):
  //   Big Mario:   0x60 → $32-$35 (walkA)   0x68 → $36-$39 (walkB)   0x70 → $3a,$37,$3b,$3c (walkC/stand)
  //   Small Mario: 0x00 → $00-$07 (walkA)   0x08 → $08-$0f (walkB)   0x10 → $10-$17 (walkC/stand)
  //
  // captureAtGfxOffset walks right until the target GfxOffset is reached — reliable
  // regardless of starting animation phase.

  const bigPoses = {
    stand: captureAtGfxOffset(bigBaseStr, 1, 0x70),  // $3a,$37,$3b,$3c
    walkA: captureAtGfxOffset(bigBaseStr, 1, 0x60),  // $32-$35
    walkB: captureAtGfxOffset(bigBaseStr, 1, 0x68),  // $36-$39
  };

  const smallPoses = {
    stand: captureAtGfxOffset(baseStr, 0, 0x10),   // $10-$17
    walkA: captureAtGfxOffset(baseStr, 0, 0x00),   // $00-$07
    walkB: captureAtGfxOffset(baseStr, 0, 0x08),   // $08-$0f
  };

  // Print what we got
  console.log("\n  Big Mario poses:");
  for (const [name, p] of Object.entries(bigPoses)) {
    if (!p) { console.log(`    ${name}: null`); continue; }
    console.log(`    ${name}: ${p.width}×${p.height} NES px  GfxOffset=0x${p.gfxOffset.toString(16)}  tiles: ${p.tiles.map(t=>"$"+t.toString(16)).join(" ")}`);
  }
  console.log("  Small Mario poses:");
  for (const [name, p] of Object.entries(smallPoses)) {
    if (!p) { console.log(`    ${name}: null`); continue; }
    console.log(`    ${name}: ${p.width}×${p.height} NES px  GfxOffset=0x${p.gfxOffset.toString(16)}  tiles: ${p.tiles.map(t=>"$"+t.toString(16)).join(" ")}`);
  }

  // ── Step 3: Canvas layout ─────────────────────────────────────────────────
  console.log("\n═══ STEP 3: Layout + render canvas ═══");

  const bigRow   = [bigPoses.stand, bigPoses.walkA, bigPoses.walkB].filter(Boolean);
  const smallRow = [smallPoses.stand, smallPoses.walkA, smallPoses.walkB].filter(Boolean);

  const bigSprW   = Math.max(...bigRow.map(p => p.width))   * SCALE;
  const bigSprH   = Math.max(...bigRow.map(p => p.height))  * SCALE;
  const smallSprW = Math.max(...smallRow.map(p => p.width))  * SCALE;
  const smallSprH = Math.max(...smallRow.map(p => p.height)) * SCALE;

  // Each row is centred — widths may differ
  const row1W = bigRow.length   * bigSprW   + (bigRow.length + 1)   * GAP;
  const row2W = smallRow.length * smallSprW + (smallRow.length + 1) * GAP;

  const canvasW = Math.max(row1W, row2W) + 2 * MARGIN;
  const canvasH = MARGIN + GAP + bigSprH + 2*GAP + smallSprH + GAP + MARGIN;

  console.log(`  Big sprites:   ${bigSprW}×${bigSprH} px  row width=${row1W}`);
  console.log(`  Small sprites: ${smallSprW}×${smallSprH} px  row width=${row2W}`);
  console.log(`  Canvas: ${canvasW}×${canvasH}  ratio=${(canvasW/canvasH).toFixed(2)}:1`);

  // Allocate canvas (black background)
  const RGBA = new Uint8Array(canvasW * canvasH * 4);
  for (let i = 0; i < canvasW * canvasH; i++) {
    RGBA[i*4] = 0; RGBA[i*4+1] = 0; RGBA[i*4+2] = 0; RGBA[i*4+3] = 255;
  }

  const allTileRecords = [];
  const seenTiles = new Set();

  function placePoseRow(row, rowY, sprW, sprH, label) {
    for (let i = 0; i < row.length; i++) {
      const pose = row[i];
      const dx   = MARGIN + GAP + i * (sprW + GAP);
      const dy   = rowY;
      const recs = renderPose(RGBA, canvasW, pose, pal0, dx, dy);
      let added  = 0;
      for (const rec of recs) {
        if (!seenTiles.has(rec.chr_tile_idx)) {
          seenTiles.add(rec.chr_tile_idx);
          allTileRecords.push(rec);
          added++;
        }
      }
      console.log(`  ${label}[${i}]: at (${dx},${dy}) — ${recs.length} tiles drawn, ${added} new in tilemap`);
    }
  }

  // Row 1: Big Mario  (top)
  const row1Y = MARGIN + GAP;
  placePoseRow(bigRow, row1Y, bigSprW, bigSprH, "Big");

  // Row 2: Small Mario (bottom, bottom-aligned to match big mario row height)
  const row2Y = row1Y + bigSprH + 2 * GAP + (bigSprH - smallSprH);
  placePoseRow(smallRow, row2Y, smallSprW, smallSprH, "Small");

  console.log(`\n  Total unique tile records: ${allTileRecords.length}`);
  console.log(`  Tile indices: ${allTileRecords.map(t=>t.chr_tile_hex).join(" ")}`);

  // ── Step 4: Save input image + tilemap ────────────────────────────────────
  console.log("\n═══ STEP 4: Save input + tilemap ═══");

  const inputPath = path.join(OUT_DIR, "mario-flux-input-v3.png");
  await sharp(Buffer.from(RGBA), { raw: { width: canvasW, height: canvasH, channels: 4 } })
    .png().toFile(inputPath);
  console.log(`  Saved: ${path.basename(inputPath)}  (${canvasW}×${canvasH})`);

  const tilemap = {
    version:        3,
    input_width:    canvasW,
    input_height:   canvasH,
    scale:          SCALE,
    background_rgb: [0, 0, 0],
    sprite_palette_0: pal0.slice(1).map(([r,g,b]) => `rgb(${r},${g},${b})`),
    tile_count:     allTileRecords.length,
    tiles:          allTileRecords,
  };
  const tilemapPath = path.join(OUT_DIR, "mario-flux-tilemap-v3.json");
  fs.writeFileSync(tilemapPath, JSON.stringify(tilemap, null, 2));
  console.log(`  Saved: ${path.basename(tilemapPath)}`);

  // ── Step 5: FLUX ──────────────────────────────────────────────────────────
  const outputPath = path.join(OUT_DIR, "mario-flux-output-v3.png");

  if (fs.existsSync(outputPath)) {
    console.log(`\n═══ STEP 5: FLUX (SKIPPED — output file exists) ═══`);
    const m = await sharp(outputPath).metadata();
    console.log(`  ${m.width}×${m.height}  format=${m.format}`);
  } else {
    console.log("\n═══ STEP 5: FLUX (fal-ai/flux-pro/kontext) ═══");
    if (!process.env.FAL_KEY) { console.error("FAL_KEY not set"); process.exit(1); }
    fal.config({ credentials: process.env.FAL_KEY });

    const imgBuf   = fs.readFileSync(inputPath);
    const imageUrl = await fal.storage.upload(new Blob([imgBuf], { type: "image/png" }));
    console.log(`  Uploaded: ${imageUrl}`);

    const PROMPT =
      "Transform this pixel art sprite sheet of a video game plumber character into a medieval knight. " +
      "Give him steel plate armor, a great helm with visor, and a short sword. " +
      "Use dark metal tones: silver, dark steel, deep blue-grey. " +
      "The black background should stay black. " +
      "KEEP THE EXACT same poses, positions, and spatial layout — each character sprite must stay in its cell. " +
      "Retro NES pixel art style, high contrast, crisp edges.";

    console.log("  Calling FLUX...");
    let outputUrl;
    const result = await fal.subscribe("fal-ai/flux-pro/kontext", {
      input: {
        prompt:         PROMPT,
        image_url:      imageUrl,
        guidance_scale: 4,
        output_format:  "png",
      },
      logs: true,
      onQueueUpdate: u => {
        const msg = u.logs?.map(l => l.message).filter(Boolean).join(" | ") || "";
        process.stdout.write(`  [FLUX ${u.status}]${msg ? " " + msg : ""}\n`);
      },
    });
    outputUrl = result.data?.images?.[0]?.url;
    if (!outputUrl) throw new Error("No URL in result: " + JSON.stringify(result.data));

    console.log(`  URL: ${outputUrl}`);
    const buf = Buffer.from(await (await fetch(outputUrl)).arrayBuffer());
    fs.writeFileSync(outputPath, buf);
    const m = await sharp(outputPath).metadata();
    console.log(`  Saved: ${path.basename(outputPath)}  (${m.width}×${m.height})`);
  }

  // ── Step 6: Decompose ─────────────────────────────────────────────────────
  console.log("\n═══ STEP 6: Decompose → NES CHR ═══");
  const chrPath     = path.join(OUT_DIR, "mario-flux-quantized-v3.chr");
  const previewPath = path.join(OUT_DIR, "mario-flux-quantized-v3.png");
  await decompose(outputPath, tilemap, pal0, chrPath, previewPath);

  // ── Done ──────────────────────────────────────────────────────────────────
  console.log("\n═══ DONE ═══");
  console.log(`  open experiment-output/mario-flux-input-v3.png`);
  console.log(`  open experiment-output/mario-flux-output-v3.png`);
  console.log(`  open experiment-output/mario-flux-quantized-v3.png`);
}

main().catch(e => { console.error(e); process.exit(1); });
