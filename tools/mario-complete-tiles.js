#!/usr/bin/env node
/**
 * mario-complete-tiles.js
 *
 * Captures ALL tile indices Mario uses across every player state,
 * builds a complete individual-tile grid sheet (v2), and sends to FLUX.
 *
 * Outputs:
 *   experiment-output/mario-flux-input-v2.png     — complete tile grid
 *   experiment-output/mario-flux-tilemap-v2.json  — per-tile positions
 *   experiment-output/mario-flux-output-v2.png    — FLUX result
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
if (!romFile) { console.error("SMB ROM not found"); process.exit(1); }
const romBuf  = fs.readFileSync(path.join(romsDir, romFile));
const romStr  = romBuf.toString("binary");
const prgSize = romBuf[4] * 16384;
const chrOff  = 16 + prgSize;
const CHR_PT0 = romBuf.slice(chrOff, chrOff + 4096);  // sprite pattern table

console.log(`ROM: ${romFile}`);

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

// ── CHR helpers ───────────────────────────────────────────────────────────────
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

function tileIsBlank(idx) {
  const base = idx * 16;
  for (let i = 0; i < 16; i++) if (CHR_PT0[base + i]) return false;
  return true;
}

// ── jsnes helpers ─────────────────────────────────────────────────────────────
function makeNES() {
  return new NES({
    onFrame: () => {}, onAudioSample: null,
    onStatusUpdate: () => {}, emulateSound: false,
  });
}

const R = Controller.BUTTON_RIGHT;
const L = Controller.BUTTON_LEFT;
const A = Controller.BUTTON_A;
const B = Controller.BUTTON_B;
const D = Controller.BUTTON_DOWN;
const U = Controller.BUTTON_UP;
const START = Controller.BUTTON_START;

/** Boot SMB to a stable walking position in W1-1 as Small Mario */
function bootToGameplay() {
  console.log("  Booting SMB...");
  const nes = makeNES();
  nes.loadROM(romStr);
  // Title screen → press Start
  nes.buttonDown(1, START);
  for (let i = 0; i < 120; i++) nes.frame();
  nes.buttonUp(1, START);
  // Mode select → press Start again
  nes.buttonDown(1, START);
  for (let i = 0; i < 60; i++) nes.frame();
  nes.buttonUp(1, START);
  // Level intro animation
  for (let i = 0; i < 160; i++) nes.frame();
  // Walk right past the control-lockout zone, reach open space
  nes.buttonDown(1, R);
  for (let i = 0; i < 150; i++) nes.frame();
  nes.buttonUp(1, R);
  for (let i = 0; i < 10; i++) nes.frame();
  console.log(`    PlayerSize=${ nes.cpu.mem[0x0754] } PlayerStatus=${ nes.cpu.mem[0x0756] }`);
  return nes;
}

/** Sample OAM slots 0–11 (player uses ~slots 0–8), collect non-blank tile indices */
function sampleOAM(nes, tileSet, label) {
  const found = [];
  for (let i = 0; i <= 11; i++) {
    const base = 0x0200 + i * 4;
    const y    = nes.cpu.mem[base];
    const tile = nes.cpu.mem[base + 1];
    if (y >= 0xEF) continue;  // off-screen
    if (tile === 0xFC) continue;  // Big Mario's blank head placeholder
    if (tileIsBlank(tile)) continue;
    tileSet.add(tile);
    found.push(`$${tile.toString(16).padStart(2,"0")}`);
  }
  if (found.length) process.stdout.write(`    [${label}] ${found.join(" ")}\n`);
  return found.length;
}

// ═══════════════════════════════════════════════════════════════════════════════
// TILE CAPTURE — for one Mario size (0=small, 1=big)
// ═══════════════════════════════════════════════════════════════════════════════

function captureForSize(baseState, size, label) {
  const tileSet = new Set();
  const nesRGB_  = (idx) => NES_RGB[idx & 0x3f];

  function restore() {
    const nes = makeNES();
    nes.loadROM(romStr);
    nes.fromJSON(JSON.parse(baseState));
    nes.cpu.mem[0x0754] = size;   // 0=small, 1=big
    nes.cpu.mem[0x0756] = 0;      // normal status (not fire)
    for (let i = 0; i < 8; i++) nes.frame();  // let game react to size change
    return nes;
  }

  console.log(`\n  ── ${label} (size=${size}) ──`);

  // STAND — no input, sample many frames to catch animation cycles
  {
    const nes = restore();
    for (let f = 0; f < 30; f++) {
      nes.frame();
      if (f % 3 === 0) sampleOAM(nes, tileSet, "stand");
    }
  }

  // WALK RIGHT — hold Right for 60 frames, sample every 3f
  {
    const nes = restore();
    nes.buttonDown(1, R);
    for (let f = 0; f < 60; f++) {
      nes.frame();
      if (f % 3 === 0) sampleOAM(nes, tileSet, "walk-R");
    }
    nes.buttonUp(1, R);
  }

  // WALK LEFT — hold Left for 60 frames. Same tile indices as right (just flipped)
  // but capture anyway to confirm and catch any left-specific tiles
  {
    const nes = restore();
    nes.buttonDown(1, L);
    for (let f = 0; f < 60; f++) {
      nes.frame();
      if (f % 3 === 0) sampleOAM(nes, tileSet, "walk-L");
    }
    nes.buttonUp(1, L);
  }

  // RUN RIGHT — hold Right+B (B is the run button in SMB), 60f
  // Running uses a faster walk cycle but may reuse the same tiles.
  // Running also eventually reaches max speed — sample throughout.
  {
    const nes = restore();
    nes.buttonDown(1, R);
    nes.buttonDown(1, B);
    for (let f = 0; f < 60; f++) {
      nes.frame();
      if (f % 3 === 0) sampleOAM(nes, tileSet, "run-R");
    }
    nes.buttonUp(1, R);
    nes.buttonUp(1, B);
  }

  // JUMP — press A for 5f (short hop), then sample the entire trajectory (apex ~20-30f)
  {
    const nes = restore();
    nes.buttonDown(1, A);
    for (let i = 0; i < 5; i++) nes.frame();
    nes.buttonUp(1, A);
    for (let f = 0; f < 45; f++) {
      nes.frame();
      sampleOAM(nes, tileSet, `jump-f${f}`);
    }
  }

  // LONG JUMP — hold A the whole time (max height), different apex arc
  {
    const nes = restore();
    nes.buttonDown(1, A);
    for (let f = 0; f < 40; f++) {
      nes.frame();
      if (f % 3 === 0) sampleOAM(nes, tileSet, "jump-hold");
    }
    nes.buttonUp(1, A);
    for (let f = 0; f < 20; f++) {
      nes.frame();
      if (f % 3 === 0) sampleOAM(nes, tileSet, "jump-fall");
    }
  }

  // RUNNING JUMP — Right+B then A (running jump has same tile as normal jump
  // but worth checking; also catches the running-jump landing frame)
  {
    const nes = restore();
    nes.buttonDown(1, R);
    nes.buttonDown(1, B);
    for (let i = 0; i < 15; i++) nes.frame();
    nes.buttonDown(1, A);
    for (let i = 0; i < 5; i++) nes.frame();
    nes.buttonUp(1, A);
    for (let f = 0; f < 40; f++) {
      nes.frame();
      if (f % 3 === 0) sampleOAM(nes, tileSet, "run-jump");
    }
    nes.buttonUp(1, R);
    nes.buttonUp(1, B);
  }

  // SKID — sprint right then abruptly switch to left
  // The skid/brake tile appears during deceleration (~frames 1-10 after switch)
  {
    const nes = restore();
    nes.buttonDown(1, R);
    nes.buttonDown(1, B);
    for (let i = 0; i < 30; i++) nes.frame();
    nes.buttonUp(1, R);
    nes.buttonUp(1, B);
    nes.buttonDown(1, L);
    for (let f = 0; f < 20; f++) {
      nes.frame();
      sampleOAM(nes, tileSet, `skid-f${f}`);
    }
    nes.buttonUp(1, L);
  }

  // CROUCH — only Big Mario can crouch in SMB (Down button while on ground)
  if (size === 1) {
    const nes = restore();
    nes.buttonDown(1, D);
    for (let f = 0; f < 30; f++) {
      nes.frame();
      if (f % 3 === 0) sampleOAM(nes, tileSet, "crouch");
    }
    nes.buttonUp(1, D);
  }

  // SWIM ATTEMPT — write to $0704 (candidate SwimmingFlag address)
  // Also try $0756 = 1 (Super status) which might affect animation
  {
    const nes = restore();
    nes.cpu.mem[0x0704] = 0x01;  // attempt: force swimming flag
    nes.cpu.mem[0x074A] = 0x01;  // also try adjacent addresses
    nes.buttonDown(1, A);        // in water, A is the swim stroke button
    for (let f = 0; f < 40; f++) {
      nes.frame();
      if (f % 4 === 0) sampleOAM(nes, tileSet, "swim");
    }
    nes.buttonUp(1, A);
  }

  // CLIMB — try to force a vine-grab state
  // $0756 = 3 or 4 might be climbing state in some SMB versions
  // Also try climbing by writing to the player state directly
  {
    const nes = restore();
    // Force a climbing-like state by writing to player action flag
    // SMB action flags: $0756 doesn't handle climbing directly;
    // climbing is triggered by contact with vine tile type $27
    // We'll try a few candidate state addresses:
    for (const addr of [0x000E, 0x001D, 0x0755, 0x0757]) {
      const nes2 = restore();
      nes2.cpu.mem[addr] = 0x03;  // try state=3
      for (let f = 0; f < 20; f++) nes2.frame();
      sampleOAM(nes2, tileSet, `climb-${addr.toString(16)}`);
    }
  }

  // FIRE MARIO — different palette but same tile indices; confirm with status=2
  {
    const nes = restore();
    nes.cpu.mem[0x0756] = 0x02;  // fire status
    for (let f = 0; f < 20; f++) nes.frame();
    sampleOAM(nes, tileSet, "fire-stand");
    nes.buttonDown(1, R);
    for (let f = 0; f < 30; f++) {
      nes.frame();
      if (f % 3 === 0) sampleOAM(nes, tileSet, "fire-walk");
    }
    nes.buttonUp(1, R);
  }

  // Collect and sort
  const sorted = [...tileSet].sort((a, b) => a - b);
  console.log(`  → ${label} unique tiles (${sorted.length}): ${sorted.map(v => "$"+v.toString(16).padStart(2,"0")).join(", ")}`);
  return sorted;
}

// ═══════════════════════════════════════════════════════════════════════════════
// SHEET BUILDER
// ═══════════════════════════════════════════════════════════════════════════════

async function buildSheet(smallTiles, bigTiles, spritePal0) {
  const SCALE    = 4;
  const TILE_PX  = 8 * SCALE;  // 32 — each 8×8 NES tile at 4×
  const GAP      = 4;
  const PITCH    = TILE_PX + GAP;  // 36
  const LABEL_W  = 64;
  const MARGIN   = 8;
  const ROW_GAP  = 8;
  const BORDER   = [100, 100, 100];
  const MAGENTA  = [255, 0, 255];
  const DARK     = [20, 20, 20];

  // One row per Mario type; all tiles on one line (no wrapping — max ~30 tiles)
  const canvasW = MARGIN + LABEL_W + GAP + Math.max(smallTiles.length, bigTiles.length) * PITCH + MARGIN;
  const rowH    = TILE_PX;  // 32
  const canvasH = MARGIN + rowH + ROW_GAP + rowH + MARGIN;

  console.log(`  Canvas: ${canvasW}×${canvasH}  (small: ${smallTiles.length} tiles, big: ${bigTiles.length} tiles)`);

  const RGBA = new Uint8Array(canvasW * canvasH * 4);
  // Fill magenta
  for (let i = 0; i < canvasW * canvasH; i++) {
    RGBA[i*4] = 255; RGBA[i*4+1] = 0; RGBA[i*4+2] = 255; RGBA[i*4+3] = 255;
  }

  const setPixel = (x, y, r, g, b) => {
    if (x < 0 || y < 0 || x >= canvasW || y >= canvasH) return;
    const o = (y * canvasW + x) * 4;
    RGBA[o] = r; RGBA[o+1] = g; RGBA[o+2] = b; RGBA[o+3] = 255;
  };
  const fillRect = (x, y, w, h, [r,g,b]) => {
    for (let dy = 0; dy < h; dy++)
      for (let dx = 0; dx < w; dx++) setPixel(x+dx, y+dy, r, g, b);
  };

  const tileEntries = [];

  function renderRow(tiles, rowY, marioType) {
    const labelColor = marioType === "small" ? [40, 60, 120] : [80, 30, 30];
    fillRect(MARGIN, rowY, LABEL_W, TILE_PX, labelColor);

    for (let i = 0; i < tiles.length; i++) {
      const tileIdx = tiles[i];
      const cellX   = MARGIN + LABEL_W + GAP + i * PITCH;
      const cellY   = rowY;

      // 1px dark border around cell
      fillRect(cellX - 1, cellY - 1, TILE_PX + 2, TILE_PX + 2, BORDER);
      // Magenta cell background
      fillRect(cellX, cellY, TILE_PX, TILE_PX, MAGENTA);

      // Render tile pixels
      const px8 = decodeTile(CHR_PT0, tileIdx);
      for (let r = 0; r < 8; r++) {
        for (let c = 0; c < 8; c++) {
          const pidx = px8[r*8+c];
          if (pidx === 0) continue;  // transparent
          const [R, G, B] = spritePal0[pidx];
          for (let sy = 0; sy < SCALE; sy++)
            for (let sx = 0; sx < SCALE; sx++)
              setPixel(cellX + c*SCALE + sx, cellY + r*SCALE + sy, R, G, B);
        }
      }

      tileEntries.push({
        chr_tile_idx:  tileIdx,
        chr_tile_hex:  "0x" + tileIdx.toString(16).padStart(2, "0"),
        canvas_x:      cellX,
        canvas_y:      cellY,
        canvas_tile_w: TILE_PX,
        canvas_tile_h: TILE_PX,
        palette:       0,
        mario_type:    marioType,
      });
    }
  }

  // Row 1: Small Mario
  const row1Y = MARGIN;
  renderRow(smallTiles, row1Y, "small");

  // Row 2: Big Mario
  const row2Y = MARGIN + rowH + ROW_GAP;
  renderRow(bigTiles, row2Y, "big");

  return { RGBA, canvasW, canvasH, tileEntries };
}

// ═══════════════════════════════════════════════════════════════════════════════
// MAIN
// ═══════════════════════════════════════════════════════════════════════════════

async function main() {
  // ── Step 1A: Boot and capture all tile indices ─────────────────────────────
  console.log("\n═══ STEP 1A: Capture all Mario tile indices ═══");

  const bootNes   = bootToGameplay();
  const baseState = JSON.stringify(bootNes.toJSON());

  // Capture sprite palette 0 from the booted game
  // $3F11/$3F12/$3F13 are sprite palette 0 colors (color indices 1-3)
  const pv = (i) => bootNes.ppu.vramMem[i];
  const BG = NES_RGB[pv(0x3F00) & 0x3F];  // universal background (transparent in sprites)
  const spritePal0 = [
    BG,                                        // palette index 0 = transparent
    NES_RGB[pv(0x3F11) & 0x3F],
    NES_RGB[pv(0x3F12) & 0x3F],
    NES_RGB[pv(0x3F13) & 0x3F],
  ];
  console.log(`  Sprite pal 0: ${[0x3F11,0x3F12,0x3F13].map(a => "0x"+pv(a).toString(16)).join(", ")}`);

  const smallTiles = captureForSize(baseState, 0, "Small Mario");
  const bigTiles   = captureForSize(baseState, 1, "Big Mario");

  console.log(`\n  TOTAL UNIQUE: Small=${smallTiles.length}  Big=${bigTiles.length}`);

  // ── Step 1B: Build the sheet ───────────────────────────────────────────────
  console.log("\n═══ STEP 1B: Build tile sheet ═══");

  const { RGBA, canvasW, canvasH, tileEntries } = await buildSheet(smallTiles, bigTiles, spritePal0);

  const inputPath = path.join(OUT_DIR, "mario-flux-input-v2.png");
  await sharp(Buffer.from(RGBA), { raw: { width: canvasW, height: canvasH, channels: 4 } })
    .png().toFile(inputPath);
  console.log(`  Saved: ${inputPath}  (${canvasW}×${canvasH})`);

  const tileMap = {
    version:       2,
    scale:         4,
    canvas_width:  canvasW,
    canvas_height: canvasH,
    small_tile_indices: smallTiles,
    big_tile_indices:   bigTiles,
    sprite_palette_0: [0x3F11,0x3F12,0x3F13].map(a => "0x"+pv(a).toString(16)),
    unique_tile_count: tileEntries.length,
    tiles: tileEntries,
  };

  const tileMapPath = path.join(OUT_DIR, "mario-flux-tilemap-v2.json");
  fs.writeFileSync(tileMapPath, JSON.stringify(tileMap, null, 2));
  console.log(`  Saved: ${tileMapPath}  (${tileEntries.length} tiles)`);

  // ── Step 1C: Send to FLUX ──────────────────────────────────────────────────
  const outputPath = path.join(OUT_DIR, "mario-flux-output-v2.png");
  if (fs.existsSync(outputPath)) {
    console.log(`\n═══ STEP 1C: FLUX (SKIPPED — mario-flux-output-v2.png exists) ═══`);
    const meta = await sharp(outputPath).metadata();
    console.log(`  Using existing: ${outputPath}  (${meta.width}×${meta.height})`);
  } else {
    console.log("\n═══ STEP 1C: Send to FLUX ═══");

    if (!process.env.FAL_KEY) { console.error("FAL_KEY not set"); process.exit(1); }
    fal.config({ credentials: process.env.FAL_KEY });

    console.log("  Uploading to fal storage...");
    const imgBuf = fs.readFileSync(inputPath);
    const imageUrl = await fal.storage.upload(new Blob([imgBuf], { type: "image/png" }));
    console.log(`  Uploaded: ${imageUrl}`);

    const PROMPT = "Transform this pixel art sprite sheet of a video game plumber into a medieval knight character. Steel armor, helmet with visor, sword instead of fist. Keep the EXACT same poses, positions, and grid layout. Each sprite must stay in its own cell. Retro pixel art style.";
    console.log(`  Calling fal-ai/flux-pro/kontext...`);

    let outputUrl;
    try {
      const result = await fal.subscribe("fal-ai/flux-pro/kontext", {
        input: { prompt: PROMPT, image_url: imageUrl },
        logs: true,
        onQueueUpdate: (u) => {
          const msg = u.logs?.map(l => l.message).filter(Boolean).join(" | ") || "";
          process.stdout.write(`  [FLUX ${u.status}]${msg ? " " + msg : ""}\n`);
        },
      });
      outputUrl = result.data?.images?.[0]?.url;
      if (!outputUrl) throw new Error("No image URL in result");
      console.log(`  FLUX URL: ${outputUrl}`);
    } catch (err) {
      console.error("FLUX failed:", err.message);
      process.exit(1);
    }

    const resp = await fetch(outputUrl);
    if (!resp.ok) throw new Error(`Download failed: ${resp.status}`);
    const buf = Buffer.from(await resp.arrayBuffer());
    fs.writeFileSync(outputPath, buf);
    const meta = await sharp(outputPath).metadata();
    console.log(`  Saved: ${outputPath}  (${meta.width}×${meta.height}, ${buf.length} bytes)`);
  }

  // ── Summary ────────────────────────────────────────────────────────────────
  console.log("\n═══ Summary ═══");
  console.log(`  Small Mario tiles: ${smallTiles.length}  →  ${smallTiles.map(v=>"$"+v.toString(16)).join(" ")}`);
  console.log(`  Big Mario tiles:   ${bigTiles.length}  →  ${bigTiles.map(v=>"$"+v.toString(16)).join(" ")}`);
  console.log(`  vs previous:       small was 24, big was 11`);
  console.log(`\n  mario-flux-input-v2.png   ← input to FLUX`);
  console.log(`  mario-flux-tilemap-v2.json ← tile map`);
  console.log(`  mario-flux-output-v2.png  ← FLUX result`);
}

main().catch(err => { console.error("Fatal:", err); process.exit(1); });
