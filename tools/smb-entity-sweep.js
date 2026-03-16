/**
 * smb-entity-sweep.js
 *
 * 1. Boot SMB, track entity rendering via F2xx CPU write interceptor
 * 2. Oracle sweep: find which RAM byte controls entity type
 * 3. Sweep type byte 0-255, capture OAM for each value
 * 4. Render all valid entity types to PNG + save JSON manifest
 *
 * Output:
 *   experiment-output/smb-entity-sweep.png
 *   experiment-output/smb-entity-manifest.json
 */

import { NES, Controller } from "jsnes";
import fs from "fs";
import path from "path";
import { homedir } from "os";
import sharp from "sharp";

// ── ROM ──────────────────────────────────────────────────────────────────────

const romsDir = path.join(homedir(), "nes-roms");
const romFile = fs.readdirSync(romsDir).find(
  (f) =>
    f.includes("Super Mario Bros") &&
    !f.includes("2") &&
    !f.includes("3") &&
    !f.includes("Lost") &&
    !f.includes("+") &&
    f.endsWith(".nes")
);
if (!romFile) { console.error("SMB ROM not found in ~/nes-roms/"); process.exit(1); }
console.log(`ROM: ${romFile}`);

const romBuf = fs.readFileSync(path.join(romsDir, romFile));
const prgSize = romBuf[4] * 16384;
const chrOffset = 16 + prgSize; // CHR-ROM starts here in the ROM file
const chrPT0 = romBuf.slice(chrOffset, chrOffset + 4096); // pattern table 0 (sprites)
console.log(`PRG: ${prgSize} bytes, CHR PT0 at offset ${chrOffset}`);

// ── NES palette ───────────────────────────────────────────────────────────────

const nesPalJson = JSON.parse(
  fs.readFileSync(path.join(process.cwd(), "data/ground-truth/palettes/nes-palette.json"))
);
const nesHexColors = nesPalJson.palette_as_array; // 64 hex strings like "#585858"

function nesColorToRGB(nesIndex) {
  const h = nesHexColors[nesIndex & 0x3f] || "#000000";
  return [parseInt(h.slice(1, 3), 16), parseInt(h.slice(3, 5), 16), parseInt(h.slice(5, 7), 16)];
}

// ── Output paths ──────────────────────────────────────────────────────────────

const OUT_DIR = path.join(process.cwd(), "experiment-output");
fs.mkdirSync(OUT_DIR, { recursive: true });
const PNG_PATH  = path.join(OUT_DIR, "smb-entity-sweep.png");
const JSON_PATH = path.join(OUT_DIR, "smb-entity-manifest.json");

// ── Constants ─────────────────────────────────────────────────────────────────

const OAM_BASE = 0x0200;

// PC addresses that write entity tile indices (from oam-trace-smb.json analysis)
// F2B3/F2B6 write Y-POSITION bytes (not tiles — confirmed by addr%4==0)
// F293/F298 write TILE bytes for the $54/$56/$58 entity group
// F29F/F2A4 write TILE bytes for the $B0/$B2/$B4/$B6 entity group
const F2XX_ALL_PCS  = new Set([0xF293,0xF298,0xF29F,0xF2A4,0xF2AB,0xF2AE,0xF2B3,0xF2B6,0xF2BB,0xF2C1]);
const TILE_WRITE_PCS = new Set([0xF293, 0xF298, 0xF29F, 0xF2A4]); // write tile bytes

// ── Helpers ───────────────────────────────────────────────────────────────────

const h8  = (v) => "0x" + (v & 0xff).toString(16).toUpperCase().padStart(2,  "0");
const h16 = (v) => "0x" + (v & 0xffff).toString(16).toUpperCase().padStart(4, "0");

function makeNES() {
  const nes = new NES({ onFrame: () => {}, onAudioSample: null, onStatusUpdate: () => {}, emulateSound: false });
  nes.loadROM(romBuf.toString("binary"));
  return nes;
}

/** Read all 64 OAM entries from CPU staging page */
function captureOAM(nes) {
  const out = [];
  for (let i = 0; i < 64; i++) {
    const b = OAM_BASE + i * 4;
    out.push({ slot: i, y: nes.cpu.mem[b], tile: nes.cpu.mem[b+1], attr: nes.cpu.mem[b+2], x: nes.cpu.mem[b+3] });
  }
  return out;
}

function isVisible(entry) { return entry.y < 240; }

// ═══════════════════════════════════════════════════════════════════════════════
// PHASE 1: Boot + entity tracking
// ═══════════════════════════════════════════════════════════════════════════════

console.log("\n═══ PHASE 1: Boot + Entity Tracking ═══");

const nes = makeNES();
let frameNumber = 0;
let currentFrameF2xxWrites = []; // {addr, tile, x_reg, pc} collected this frame

// Track entity activity across frames
const entityXActivity = new Map(); // x_reg_value → {frames: Set, oamSlots: Set, tiles: Set}

const origWrite = nes.cpu.write.bind(nes.cpu);
nes.cpu.write = function(addr, val) {
  if (TILE_WRITE_PCS.has(nes.cpu.REG_PC) && addr >= OAM_BASE && addr < OAM_BASE + 256) {
    const x = nes.cpu.REG_X;
    currentFrameF2xxWrites.push({ addr, tile: val, x_reg: x });
    if (!entityXActivity.has(x)) {
      entityXActivity.set(x, { frames: new Set(), oamSlots: new Set(), tiles: new Set() });
    }
    const act = entityXActivity.get(x);
    act.frames.add(frameNumber);
    act.oamSlots.add(Math.floor((addr - OAM_BASE) / 4));
    act.tiles.add(val);
  }
  origWrite(addr, val);
};

function step(n = 1) {
  for (let i = 0; i < n; i++) {
    currentFrameF2xxWrites = [];
    nes.frame();
    frameNumber++;
  }
}

function pressStart() {
  nes.buttonDown(1, Controller.BUTTON_START);
  step(2);
  nes.buttonUp(1, Controller.BUTTON_START);
}

// Boot sequence
step(120);
pressStart();
step(120);
pressStart();
console.log("Holding Right for 300 frames...");
nes.buttonDown(1, Controller.BUTTON_RIGHT);
step(300);
nes.buttonUp(1, Controller.BUTTON_RIGHT);

console.log(`\nAt frame ${frameNumber}. Entity X-register activity (tile-write calls):`);
const sortedEntityX = [...entityXActivity.entries()].sort((a, b) => b[1].frames.size - a[1].frames.size);
for (const [x, act] of sortedEntityX) {
  console.log(`  X=${h8(x)}: ${act.frames.size} frames, slots=[${[...act.oamSlots].sort((a,b)=>a-b)}], tiles=[${[...act.tiles].map(h8)}]`);
}

// Identify on-screen entity slots from current OAM state
const oamNow = captureOAM(nes);
console.log(`\nActive OAM slots at frame ${frameNumber}:`);
for (const e of oamNow.filter(isVisible)) {
  console.log(`  slot${e.slot}: Y=${e.y} tile=${h8(e.tile)} attr=${h8(e.attr)} X=${e.x}`);
}

// Save game state before oracle/sweep
console.log("\nSaving game state...");
const savedState = nes.toJSON();

// ═══════════════════════════════════════════════════════════════════════════════
// PHASE 2: Oracle sweep (find entity type byte)
// ═══════════════════════════════════════════════════════════════════════════════

console.log("\n═══ PHASE 2: Oracle Sweep ═══");

// Baseline: run 1 frame from save state, capture ALL OAM
// Entity selection must be based on THIS frame (not the save-state frame),
// since OAM slot assignments change as entities scroll.
nes.fromJSON(savedState);
nes.frame();
const baselineOAMFull = captureOAM(nes);

// Visible slots in the baseline frame (excluding slot 0 = status sprite)
const visibleBaselineSlots = baselineOAMFull
  .filter(e => e.slot > 0 && isVisible(e))
  .map(e => e.slot);

console.log(`Baseline active slots (Y<240, slot>0): [${visibleBaselineSlots}]`);
for (const s of visibleBaselineSlots) {
  const e = baselineOAMFull[s];
  console.log(`  slot${s}: Y=${e.y} tile=${h8(e.tile)} attr=${h8(e.attr)} X=${e.x}`);
}

// Oracle watches ALL visible baseline slots — any that change = entity-affecting byte
const baselineOAM = visibleBaselineSlots.map(s => ({
  slot: s,
  y: baselineOAMFull[s].y,
  tile: baselineOAMFull[s].tile,
}));

// For entity selection in sweep phase: use the entity X values that match
// slots visible in the baseline frame
const onScreenEntityX = [];
for (const [x, act] of sortedEntityX) {
  const onScreenSlots = [...act.oamSlots].filter(s => visibleBaselineSlots.includes(s));
  if (onScreenSlots.length > 0) {
    onScreenEntityX.push({ x, slots: [...act.oamSlots], onScreenSlots, frames: act.frames.size });
  }
}
// Also check which entity X values write to the visible slots via ANY F2xx PC
// (since tile-write and Y-write PCs map to different slot groups)
console.log(`\nOn-screen entity X values (matched to visible baseline slots):`);
for (const { x, onScreenSlots } of onScreenEntityX) {
  const tiles = onScreenSlots.map(s => h8(baselineOAMFull[s].tile));
  console.log(`  X=${h8(x)}: on-screen slots=[${onScreenSlots}], tiles=[${tiles}]`);
}

const sweepEntity = onScreenEntityX[0] || { x: null, onScreenSlots: visibleBaselineSlots.slice(0, 2) };
const sweepOAMSlots = sweepEntity.onScreenSlots.length > 0
  ? sweepEntity.onScreenSlots
  : visibleBaselineSlots.slice(0, 4);
console.log(`\nSelected entity for sweep: X=${h8(sweepEntity.x)}, OAM slots: [${sweepOAMSlots}]`);

const ORACLE_RANGES = [[0x0000, 0x00FF], [0x0400, 0x04FF]];
const candidates = [];

let oracleCount = 0;
for (const [rangeStart, rangeEnd] of ORACLE_RANGES) {
  for (let addr = rangeStart; addr <= rangeEnd; addr++) {
    nes.fromJSON(savedState);
    const origVal = nes.cpu.mem[addr];
    // Skip if value is already 0 (no change to make)
    if (origVal === 0) { oracleCount++; continue; }
    nes.cpu.mem[addr] = 0x00;
    nes.frame();

    // Check ALL visible baseline slots for any change
    let tileChanged = false;
    let visChanged  = false;
    const changedSlots = [];
    for (const bEntry of baselineOAM) {
      const modY    = nes.cpu.mem[OAM_BASE + bEntry.slot * 4];
      const modTile = nes.cpu.mem[OAM_BASE + bEntry.slot * 4 + 1];
      const wasVis  = bEntry.y < 240;
      const isVis   = modY < 240;
      if (modTile !== bEntry.tile) { tileChanged = true; changedSlots.push(`slot${bEntry.slot}:tile`); }
      if (isVis !== wasVis)        { visChanged  = true; changedSlots.push(`slot${bEntry.slot}:vis`); }
    }

    if (tileChanged || visChanged) {
      const modTiles = baselineOAM.map(e => nes.cpu.mem[OAM_BASE + e.slot * 4 + 1]);
      candidates.push({
        addr,
        origVal,
        effect: tileChanged ? "tile_change" : "visibility_change",
        changedSlots,
        baselineTiles: baselineOAM.map(e => e.tile),
        modifiedTiles: modTiles,
      });
    }

    oracleCount++;
    if (oracleCount % 100 === 0) process.stdout.write(`  Scanned ${oracleCount} addresses...\r`);
  }
}

console.log(`\nOracle scan complete. Candidates found: ${candidates.length}`);
for (const c of candidates) {
  console.log(`  ${h16(c.addr)} (orig=${h8(c.origVal)}): ${c.effect}  baseline=[${c.baselineTiles.map(h8)}] → mod=[${c.modifiedTiles.map(h8)}]`);
}

if (candidates.length === 0) {
  console.error("ERROR: No type byte candidates found!");
  console.error("The entity may not be responding to zero-page writes.");
  process.exit(1);
}

// Pick best candidate: prefer tile_change over visibility_change; prefer lower address
const bestCandidate = candidates.find(c => c.effect === "tile_change") || candidates[0];
const TYPE_BYTE_ADDR = bestCandidate.addr;
console.log(`\nSelected type byte: ${h16(TYPE_BYTE_ADDR)} (was ${h8(bestCandidate.origVal)})`);

// ═══════════════════════════════════════════════════════════════════════════════
// PHASE 3: Type sweep 0-255
// ═══════════════════════════════════════════════════════════════════════════════

console.log("\n═══ PHASE 3: Type Sweep (256 values) ═══");

const sweepResults = []; // index = type value, value = { typeValue, oam: all 64 entries }

for (let typeVal = 0; typeVal < 256; typeVal++) {
  try {
    nes.fromJSON(savedState);
    nes.cpu.mem[TYPE_BYTE_ADDR] = typeVal;
    nes.frame();
    nes.frame(); // 2 frames for entity to update graphics
    sweepResults.push({ typeValue: typeVal, oam: captureOAM(nes), crashed: false });
  } catch (e) {
    // Some type values cause the game to execute invalid code — skip them
    sweepResults.push({ typeValue: typeVal, oam: null, crashed: true });
    if (typeVal % 32 === 0 || true) process.stdout.write(`  type=${typeVal} crashed\n`);
  }

  if (typeVal % 32 === 0) process.stdout.write(`  Swept ${typeVal}/256...\r`);
}
console.log("  Swept 256/256    ");

// Post-process: find which OAM slots vary across type values
// These are the entity slots (tile changes = entity renders differently)
const validResults = sweepResults.filter(r => !r.crashed && r.oam !== null);
console.log(`\n${sweepResults.filter(r => r.crashed).length} type values crashed. ${validResults.length} valid.`);

const slotVariability = [];
for (let s = 0; s < 64; s++) {
  const tiles = validResults.map(r => r.oam[s].tile);
  const uniqueTiles = new Set(tiles).size;
  const yVals = validResults.map(r => r.oam[s].y);
  const uniqueY = new Set(yVals).size;
  slotVariability.push({ slot: s, uniqueTiles, uniqueY });
}

// Entity slots = high variability in tile AND/OR Y (changes with type byte)
const entitySlots = slotVariability
  .filter(sv => sv.uniqueTiles > 2 || sv.uniqueY > 2)
  .map(sv => sv.slot)
  .sort((a, b) => a - b);

console.log(`\nVariable OAM slots (entity slots): [${entitySlots}]`);
for (const s of entitySlots) {
  const sv = slotVariability[s];
  console.log(`  slot${s}: ${sv.uniqueTiles} unique tile values, ${sv.uniqueY} unique Y values`);
}

// For each type value: is the entity visible and what are its tiles?
const validTypes = [];
for (const result of validResults) {
  const entityEntries = entitySlots.map(s => result.oam[s]);
  const anyVisible = entityEntries.some(isVisible);
  if (anyVisible) {
    validTypes.push({
      typeValue: result.typeValue,
      sprites: entityEntries.filter(isVisible).map(e => ({
        slot: e.slot,
        y: e.y,
        tile: e.tile,
        attr: e.attr,
        x: e.x,
        palette: e.attr & 0x03,
        flipH: !!(e.attr & 0x40),
        flipV: !!(e.attr & 0x80),
      })),
    });
  }
}

console.log(`\nValid entity types (produce visible sprites): ${validTypes.length} / 256`);
for (const vt of validTypes) {
  const tiles = vt.sprites.map(s => h8(s.tile));
  const pals  = vt.sprites.map(s => s.palette);
  console.log(`  type=${h8(vt.typeValue)} (${vt.typeValue}): ${vt.sprites.length} sprites, tiles=[${tiles}], palettes=[${pals}]`);
}

// ═══════════════════════════════════════════════════════════════════════════════
// PHASE 4: Render
// ═══════════════════════════════════════════════════════════════════════════════

console.log("\n═══ PHASE 4: Render ═══");

// Read sprite palettes from PPU VRAM after restoring saved state
nes.fromJSON(savedState);
const spritePalettes = [];
for (let p = 0; p < 4; p++) {
  const base = 0x3F10 + p * 4;
  spritePalettes.push([
    nes.ppu.vramMem[base],
    nes.ppu.vramMem[base + 1],
    nes.ppu.vramMem[base + 2],
    nes.ppu.vramMem[base + 3],
  ]);
}
console.log("Sprite palettes (NES color indices):");
for (let p = 0; p < 4; p++) {
  console.log(`  Palette ${p}: [${spritePalettes[p]}]`);
}

// 2bpp tile decoder: returns 64 color indices (0-3), row-major
function decodeTile(tileIndex, flipH = false, flipV = false) {
  const off = tileIndex * 16;
  const pixels = [];
  for (let row = 0; row < 8; row++) {
    const srcRow = flipV ? 7 - row : row;
    const p0 = chrPT0[off + srcRow];
    const p1 = chrPT0[off + 8 + srcRow];
    for (let col = 0; col < 8; col++) {
      const srcCol = flipH ? col : 7 - col;
      const bit0 = (p0 >> srcCol) & 1;
      const bit1 = (p1 >> srcCol) & 1;
      pixels.push(bit0 | (bit1 << 1));
    }
  }
  return pixels;
}

// Tiny pixel font for labels (3×5 per digit, 0-9 and 'x')
const FONT3x5 = {
  "0": [1,1,1, 1,0,1, 1,0,1, 1,0,1, 1,1,1],
  "1": [0,1,0, 1,1,0, 0,1,0, 0,1,0, 1,1,1],
  "2": [1,1,1, 0,0,1, 1,1,1, 1,0,0, 1,1,1],
  "3": [1,1,1, 0,0,1, 0,1,1, 0,0,1, 1,1,1],
  "4": [1,0,1, 1,0,1, 1,1,1, 0,0,1, 0,0,1],
  "5": [1,1,1, 1,0,0, 1,1,1, 0,0,1, 1,1,1],
  "6": [1,1,0, 1,0,0, 1,1,1, 1,0,1, 1,1,1],
  "7": [1,1,1, 0,0,1, 0,1,0, 0,1,0, 0,1,0],
  "8": [1,1,1, 1,0,1, 1,1,1, 1,0,1, 1,1,1],
  "9": [1,1,1, 1,0,1, 1,1,1, 0,0,1, 1,1,1],
  "x": [0,0,0, 1,0,1, 0,1,0, 1,0,1, 0,0,0],
};

// Draw label string into pixel buffer
function drawLabel(buf, bufW, x0, y0, text, r, g, b) {
  let cx = x0;
  for (const ch of text) {
    const glyph = FONT3x5[ch] || FONT3x5["x"];
    for (let row = 0; row < 5; row++) {
      for (let col = 0; col < 3; col++) {
        if (glyph[row * 3 + col]) {
          const px = cx + col;
          const py = y0 + row;
          if (px >= 0 && px < bufW && py >= 0) {
            const idx = (py * bufW + px) * 3;
            buf[idx] = r; buf[idx+1] = g; buf[idx+2] = b;
          }
        }
      }
    }
    cx += 4; // 3px glyph + 1px gap
  }
}

// Draw a single 8×8 sprite tile into buffer
function drawTile(buf, bufW, bufH, dstX, dstY, tileIndex, paletteIndex, flipH, flipV) {
  const pixels = decodeTile(tileIndex, flipH, flipV);
  const pal = spritePalettes[paletteIndex];
  for (let row = 0; row < 8; row++) {
    for (let col = 0; col < 8; col++) {
      const ci = pixels[row * 8 + col];
      if (ci === 0) continue; // transparent
      const px = dstX + col;
      const py = dstY + row;
      if (px < 0 || px >= bufW || py < 0 || py >= bufH) continue;
      const [r, g, bl] = nesColorToRGB(pal[ci]);
      const idx = (py * bufW + px) * 3;
      buf[idx] = r; buf[idx+1] = g; buf[idx+2] = bl;
    }
  }
}

// Layout constants
const CELL_W = 40;    // pixels per cell (width)
const CELL_H = 40;    // sprite area height
const LABEL_H = 8;    // label area height (5px digit + 3px margin)
const CELL_TOTAL_H = CELL_H + LABEL_H;
const PAD = 2;        // padding between cells
const N_COLS = 16;

const N_ROWS = Math.ceil(validTypes.length / N_COLS);
const IMG_W = N_COLS * (CELL_W + PAD) + PAD;
const IMG_H = N_ROWS * (CELL_TOTAL_H + PAD) + PAD;

console.log(`Rendering ${validTypes.length} entity types → ${IMG_W}×${IMG_H} image (${N_COLS} per row)`);

const imgBuf = Buffer.alloc(IMG_W * IMG_H * 3);
// Fill with magenta
for (let i = 0; i < IMG_W * IMG_H; i++) {
  imgBuf[i * 3] = 255; imgBuf[i * 3 + 1] = 0; imgBuf[i * 3 + 2] = 255;
}

for (let idx = 0; idx < validTypes.length; idx++) {
  const vt = validTypes[idx];
  const col = idx % N_COLS;
  const row = Math.floor(idx / N_COLS);

  const cellX = PAD + col * (CELL_W + PAD);
  const cellY = PAD + row * (CELL_TOTAL_H + PAD);

  // Fill cell background with dark magenta (slightly dimmed)
  for (let cy = 0; cy < CELL_H; cy++) {
    for (let cx = 0; cx < CELL_W; cx++) {
      const pi = ((cellY + cy) * IMG_W + cellX + cx) * 3;
      imgBuf[pi] = 160; imgBuf[pi+1] = 0; imgBuf[pi+2] = 160;
    }
  }

  // Find bounding box of sprites (relative to first sprite)
  if (vt.sprites.length === 0) continue;

  const xs = vt.sprites.map(s => s.x);
  const ys = vt.sprites.map(s => s.y);
  const minX = Math.min(...xs);
  const minY = Math.min(...ys);
  const maxX = Math.max(...xs) + 8;
  const maxY = Math.max(...ys) + 8;
  const sprW = maxX - minX;
  const sprH = maxY - minY;

  // Center in cell
  const offsetX = Math.floor((CELL_W - sprW) / 2) - (minX - xs[0]); // center and adjust so first sprite is at offset
  const offsetY = Math.floor((CELL_H - sprH) / 2) - (minY - ys[0]);

  // Recalculate relative positions from minX/minY and center them
  const centerOffX = cellX + Math.floor((CELL_W - sprW) / 2);
  const centerOffY = cellY + Math.floor((CELL_H - sprH) / 2);

  for (const spr of vt.sprites) {
    const drawX = centerOffX + (spr.x - minX);
    const drawY = centerOffY + (spr.y - minY);
    drawTile(imgBuf, IMG_W, IMG_H, drawX, drawY, spr.tile, spr.palette, spr.flipH, spr.flipV);
  }

  // Label: type value in hex below the sprite (e.g. "0x06")
  const labelStr = vt.typeValue.toString();
  const labelX = cellX + Math.floor((CELL_W - labelStr.length * 4) / 2);
  const labelY = cellY + CELL_H + 2;
  drawLabel(imgBuf, IMG_W, labelX, labelY, labelStr, 255, 255, 255);
}

// Save PNG
await sharp(imgBuf, { raw: { width: IMG_W, height: IMG_H, channels: 3 } })
  .png()
  .toFile(PNG_PATH);
console.log(`PNG saved: ${PNG_PATH}`);

// ── Save JSON manifest ────────────────────────────────────────────────────────

const manifest = {
  game: "Super Mario Bros",
  rom: romFile,
  type_byte_addr: h16(TYPE_BYTE_ADDR),
  oracle_candidates: candidates.map(c => ({ addr: h16(c.addr), orig_val: h8(c.origVal), effect: c.effect })),
  entity_oam_slots: entitySlots,
  sweep_entity_x_reg: sweepEntity.x !== null ? h8(sweepEntity.x) : null,
  valid_type_count: validTypes.length,
  entities: validTypes.map(vt => ({
    type_value: vt.typeValue,
    type_hex: h8(vt.typeValue),
    sprite_count: vt.sprites.length,
    sprites: vt.sprites.map(spr => ({
      oam_slot: spr.slot,
      tile_index: spr.tile,
      tile_hex: h8(spr.tile),
      chr_addr: h16(spr.tile * 16),
      palette: spr.palette,
      flip_h: spr.flipH,
      flip_v: spr.flipV,
      screen_x: spr.x,
      screen_y: spr.y,
    })),
  })),
};

fs.writeFileSync(JSON_PATH, JSON.stringify(manifest, null, 2));
console.log(`Manifest saved: ${JSON_PATH}`);

// ── Summary ───────────────────────────────────────────────────────────────────

console.log("\n═══════════════════════════════════════════════════════════");
console.log("ENTITY SWEEP SUMMARY");
console.log("═══════════════════════════════════════════════════════════");
console.log(`Type byte:        ${h16(TYPE_BYTE_ADDR)}`);
console.log(`Valid types:      ${validTypes.length} / 256`);
console.log(`Entity OAM slots: [${entitySlots}]`);
console.log(`Sweep entity X:   ${h8(sweepEntity.x)}`);
console.log("\nAll valid entity types:");
for (const vt of validTypes) {
  const tiles = vt.sprites.map(s => h8(s.tile));
  const pals  = vt.sprites.map(s => s.palette);
  const flips = vt.sprites.map(s => (s.flipH ? "H" : "") + (s.flipV ? "V" : "") || "-");
  console.log(`  [${String(vt.typeValue).padStart(3)}] ${h8(vt.typeValue)}  tiles=[${tiles}]  pal=[${pals}]  flip=[${flips}]`);
}
console.log("═══════════════════════════════════════════════════════════");
