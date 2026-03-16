/**
 * smb-entity-sweep-full.js
 *
 * Comprehensive multi-slot entity sweep for SMB with animation frames.
 *
 * Phase 1: Boot + ALL OAM write tracking (not just $F2xx tile writes)
 *          — reveals all entity groups by X_reg value
 *          — saves two states: earlyState (~frame 344) + lateState (~frame 544)
 * Phase 2: Oracle sweep (lateState) → find entity type byte
 * Phase 3: Type sweep 0-255 → find valid entity types
 * Phase 4: Multi-context sweep (area_type $074E = 0-3)
 * Phase 5: Animation sweep — vary $0046 over probe values per entity type
 * Phase 6: Render PNG (rows = entity types, cols = anim frames)
 *
 * Output:
 *   experiment-output/smb-entity-sweep-full.png
 *   experiment-output/smb-entity-manifest-full.json
 */

import { NES, Controller } from "jsnes";
import fs from "fs";
import path from "path";
import { homedir } from "os";
import sharp from "sharp";

// ── ROM ───────────────────────────────────────────────────────────────────────

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

const romBuf    = fs.readFileSync(path.join(romsDir, romFile));
const prgSize   = romBuf[4] * 16384;
const chrOffset = 16 + prgSize;
const chrPT0    = romBuf.slice(chrOffset, chrOffset + 4096); // sprites always PT0
console.log(`PRG: ${prgSize} bytes, CHR PT0 at offset ${chrOffset}`);

// ── NES palette ───────────────────────────────────────────────────────────────

const nesPalJson   = JSON.parse(
  fs.readFileSync(path.join(process.cwd(), "data/ground-truth/palettes/nes-palette.json"))
);
const nesHexColors = nesPalJson.palette_as_array;

function nesColorToRGB(nesIdx) {
  const h = nesHexColors[nesIdx & 0x3f] || "#000000";
  return [parseInt(h.slice(1,3),16), parseInt(h.slice(3,5),16), parseInt(h.slice(5,7),16)];
}

// ── Output paths ──────────────────────────────────────────────────────────────

const OUT_DIR  = path.join(process.cwd(), "experiment-output");
fs.mkdirSync(OUT_DIR, { recursive: true });
const PNG_PATH  = path.join(OUT_DIR, "smb-entity-sweep-full.png");
const JSON_PATH = path.join(OUT_DIR, "smb-entity-manifest-full.json");

// ── Constants ─────────────────────────────────────────────────────────────────

const OAM_BASE       = 0x0200;
const ANIM_BYTE      = 0x0046; // animation frame counter
const AREA_TYPE_BYTE = 0x074E; // area type: 0=above_ground, 1=underground, 2=water, 3=castle
const ANIM_PROBES    = [0, 2, 4, 6, 8, 12, 16, 20, 24, 32]; // 10 animation probe values
const AREA_TYPES     = [0, 1, 2, 3];

// ── Helpers ───────────────────────────────────────────────────────────────────

const h8  = (v) => "0x" + (v & 0xff).toString(16).toUpperCase().padStart(2, "0");
const h16 = (v) => "0x" + (v & 0xffff).toString(16).toUpperCase().padStart(4, "0");

function makeNES() {
  const nes = new NES({
    onFrame: () => {}, onAudioSample: null, onStatusUpdate: () => {}, emulateSound: false,
  });
  nes.loadROM(romBuf.toString("binary"));
  return nes;
}

function captureOAM(nes) {
  const out = [];
  for (let i = 0; i < 64; i++) {
    const b = OAM_BASE + i * 4;
    out.push({ slot: i, y: nes.cpu.mem[b], tile: nes.cpu.mem[b+1], attr: nes.cpu.mem[b+2], x: nes.cpu.mem[b+3] });
  }
  return out;
}

function isVisible(e) { return e.y < 240; }

// ═══════════════════════════════════════════════════════════════════════════════
// PHASE 1: Boot + ALL-writes tracking
// ═══════════════════════════════════════════════════════════════════════════════

console.log("\n═══ PHASE 1: Boot + All-Writes Tracking ═══");

const nes = makeNES();
let frameNumber = 0;

// Track ALL writes to $0200-$02FF (not filtered by PC)
// xWriteMap: X_reg → { frames: Set, slots: Set, byteOffsets: Set, pcs: Set }
const xWriteMap  = new Map();
// pcWriteMap: PC → { xRegs: Set, slots: Set, byteOffsets: Set, count: number }
const pcWriteMap = new Map();

const origWrite = nes.cpu.write.bind(nes.cpu);
nes.cpu.write = function(addr, val) {
  if (addr >= OAM_BASE && addr < OAM_BASE + 256) {
    const x       = nes.cpu.REG_X;
    const pc      = nes.cpu.REG_PC;
    const slot    = Math.floor((addr - OAM_BASE) / 4);
    const byteOff = (addr - OAM_BASE) % 4;

    if (!xWriteMap.has(x)) xWriteMap.set(x, { frames: new Set(), slots: new Set(), byteOffsets: new Set(), pcs: new Set() });
    const xa = xWriteMap.get(x);
    xa.frames.add(frameNumber);
    xa.slots.add(slot);
    xa.byteOffsets.add(byteOff);
    xa.pcs.add(pc);

    if (!pcWriteMap.has(pc)) pcWriteMap.set(pc, { xRegs: new Set(), slots: new Set(), byteOffsets: new Set(), count: 0 });
    const pa = pcWriteMap.get(pc);
    pa.xRegs.add(x);
    pa.slots.add(slot);
    pa.byteOffsets.add(byteOff);
    pa.count++;
  }
  origWrite(addr, val);
};

function step(n = 1) {
  for (let i = 0; i < n; i++) { nes.frame(); frameNumber++; }
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

// Hold Right — save early state at frame ~344 (100 frames into the hold)
console.log("Holding Right...");
nes.buttonDown(1, Controller.BUTTON_RIGHT);
step(100);
const earlyState = nes.toJSON();
const earlyFrame = frameNumber;
console.log(`  Early state saved at frame ${earlyFrame}`);
step(200); // remaining 200 of 300 frames
nes.buttonUp(1, Controller.BUTTON_RIGHT);

const lateState = nes.toJSON();
const lateFrame = frameNumber;
console.log(`  Late state saved at frame ${lateFrame}`);

// Report all-writes groups sorted by frame count
console.log("\nAll OAM write groups (by X_reg, sorted by frame count):");
const sortedXRegs = [...xWriteMap.entries()].sort((a, b) => b[1].frames.size - a[1].frames.size);
for (const [x, info] of sortedXRegs) {
  const byteNames = [...info.byteOffsets].sort().map((b) => ["Y","tile","attr","X"][b]);
  const slots = [...info.slots].sort((a, b) => a - b);
  console.log(`  X=${h8(x)}: ${info.frames.size} frames, slots=[${slots}], bytes=[${byteNames}], pcs=[${[...info.pcs].map(h16)}]`);
}

console.log("\nAll OAM write PCs (sorted by address):");
for (const [pc, info] of [...pcWriteMap.entries()].sort((a, b) => a[0] - b[0])) {
  const byteNames = [...info.byteOffsets].sort().map((b) => ["Y","tile","attr","X"][b]);
  const slots = [...info.slots].sort((a, b) => a - b);
  console.log(`  PC=${h16(pc)}: x_regs=[${[...info.xRegs].map(h8)}], slots=[${slots}], bytes=[${byteNames}], count=${info.count}`);
}

// ═══════════════════════════════════════════════════════════════════════════════
// PHASE 2: Oracle sweep (lateState)
// ═══════════════════════════════════════════════════════════════════════════════

console.log("\n═══ PHASE 2: Oracle Sweep ═══");

nes.fromJSON(lateState);
nes.frame();
const baselineFull = captureOAM(nes);
const visSlots = baselineFull.filter((e) => e.slot > 0 && isVisible(e)).map((e) => e.slot);

console.log(`Baseline visible slots (Y<240, slot>0): [${visSlots}]`);
for (const s of visSlots) {
  const e = baselineFull[s];
  console.log(`  slot${s}: Y=${e.y} tile=${h8(e.tile)} attr=${h8(e.attr)} X=${e.x}`);
}

const baselineOAM = visSlots.map((s) => ({
  slot: s, y: baselineFull[s].y, tile: baselineFull[s].tile,
}));

const candidates = [];

for (const [rangeStart, rangeEnd] of [[0x0000, 0x00FF], [0x0400, 0x04FF]]) {
  for (let addr = rangeStart; addr <= rangeEnd; addr++) {
    nes.fromJSON(lateState);
    const origVal = nes.cpu.mem[addr];
    if (origVal === 0) continue;
    nes.cpu.mem[addr] = 0x00;
    nes.frame();

    let tileChanged = false, visChanged = false;
    const changedSlots = [];
    for (const bEntry of baselineOAM) {
      const modY    = nes.cpu.mem[OAM_BASE + bEntry.slot * 4];
      const modTile = nes.cpu.mem[OAM_BASE + bEntry.slot * 4 + 1];
      if (modTile !== bEntry.tile)           { tileChanged = true; changedSlots.push(`slot${bEntry.slot}:tile`); }
      if ((modY < 240) !== (bEntry.y < 240)) { visChanged  = true; changedSlots.push(`slot${bEntry.slot}:vis`);  }
    }
    if (tileChanged || visChanged) {
      candidates.push({ addr, origVal, effect: tileChanged ? "tile_change" : "visibility_change", changedSlots });
    }
    if (addr % 100 === 0) process.stdout.write(`  Scanned ${addr}...\r`);
  }
}

console.log(`\nOracle candidates: ${candidates.length}`);
for (const c of candidates) {
  console.log(`  ${h16(c.addr)} (orig=${h8(c.origVal)}): ${c.effect} → [${c.changedSlots.join(", ")}]`);
}

const typeByteCand = candidates.find((c) => c.effect === "tile_change") || candidates[0];
if (!typeByteCand) { console.error("ERROR: No oracle candidates found!"); process.exit(1); }
const TYPE_BYTE_ADDR = typeByteCand.addr;
console.log(`\nType byte: ${h16(TYPE_BYTE_ADDR)} (orig=${h8(typeByteCand.origVal)})`);

const animCandFound = candidates.some((c) => c.addr === ANIM_BYTE);
console.log(`Animation byte ${h16(ANIM_BYTE)}: ${animCandFound ? "confirmed in oracle" : "not found (will probe anyway)"}`);

// ═══════════════════════════════════════════════════════════════════════════════
// PHASE 3: Type sweep 0-255
// ═══════════════════════════════════════════════════════════════════════════════

console.log("\n═══ PHASE 3: Type Sweep (0-255) ═══");

function runTypeSweep(baseState, typeByte, areaTypeVal = null, tag = "") {
  const results = [];
  for (let v = 0; v < 256; v++) {
    try {
      nes.fromJSON(baseState);
      if (areaTypeVal !== null) nes.cpu.mem[AREA_TYPE_BYTE] = areaTypeVal;
      nes.cpu.mem[typeByte] = v;
      nes.frame();
      nes.frame();
      results.push({ typeValue: v, oam: captureOAM(nes), crashed: false });
    } catch (_e) {
      results.push({ typeValue: v, oam: null, crashed: true });
    }
    if (v % 64 === 0) process.stdout.write(`  ${tag}${v}/256...\r`);
  }
  process.stdout.write(`  ${tag}256/256   \n`);
  return results;
}

const mainSweep    = runTypeSweep(lateState, TYPE_BYTE_ADDR, null, "main ");
const validMain    = mainSweep.filter((r) => !r.crashed && r.oam);

// Identify entity slots: OAM slots whose tile value varies widely across type sweep
const slotVar = [];
for (let s = 0; s < 64; s++) {
  const tiles = validMain.map((r) => r.oam[s].tile);
  slotVar.push({ slot: s, uniqueTiles: new Set(tiles).size });
}
const entitySlots = slotVar
  .filter((sv) => sv.uniqueTiles > 2)
  .map((sv) => sv.slot)
  .sort((a, b) => a - b);

console.log(`Entity slots (>2 unique tiles across sweep): [${entitySlots}]`);
for (const s of entitySlots) {
  console.log(`  slot${s}: ${slotVar[s].uniqueTiles} unique tile values`);
}

function extractValidTypes(sweepResults) {
  const valid = sweepResults.filter((r) => !r.crashed && r.oam);
  const out = [];
  for (const r of valid) {
    const ents = entitySlots.map((s) => r.oam[s]);
    if (ents.some(isVisible)) {
      out.push({
        typeValue: r.typeValue,
        sprites: ents.filter(isVisible).map((e) => ({
          slot: e.slot, y: e.y, tile: e.tile, attr: e.attr, x: e.x,
          palette: e.attr & 0x03, flipH: !!(e.attr & 0x40), flipV: !!(e.attr & 0x80),
        })),
      });
    }
  }
  return out;
}

const validTypes = extractValidTypes(mainSweep);
const crashedTypes = mainSweep.filter((r) => r.crashed).map((r) => r.typeValue);
console.log(`\nValid types: ${validTypes.length} / 256  (${crashedTypes.length} crashed: [${crashedTypes.join(",")}])`);

// ═══════════════════════════════════════════════════════════════════════════════
// PHASE 4: Multi-context sweep (area_type $074E = 0-3)
// ═══════════════════════════════════════════════════════════════════════════════

console.log("\n═══ PHASE 4: Multi-Context Sweep (area types 0-3) ═══");

const contextSweeps = {}; // areaType → { validTypes, crashCount }
for (const at of AREA_TYPES) {
  process.stdout.write(`  Area type ${at}...`);
  const sweep  = runTypeSweep(lateState, TYPE_BYTE_ADDR, at, `at${at} `);
  const validT = extractValidTypes(sweep);
  contextSweeps[at] = { validTypes: validT, crashCount: sweep.filter((r) => r.crashed).length };
  const diffCount = validT.filter((vt) => {
    const def = validTypes.find((v) => v.typeValue === vt.typeValue);
    if (!def) return true;
    const defTiles = def.sprites.map((s) => s.tile).sort().join(",");
    const ctxTiles = vt.sprites.map((s) => s.tile).sort().join(",");
    return defTiles !== ctxTiles;
  }).length;
  console.log(` ${validT.length} valid, ${contextSweeps[at].crashCount} crashed, ${diffCount} differ from default`);
}

// ═══════════════════════════════════════════════════════════════════════════════
// PHASE 5: Animation sweep ($0046 probe values per entity type)
// ═══════════════════════════════════════════════════════════════════════════════

console.log(`\n═══ PHASE 5: Animation Sweep (${ANIM_PROBES.length} probes × ${validTypes.length} types) ═══`);

// animData: typeValue → Map<animVal, OAM[] | null>
const animData = new Map();

for (let i = 0; i < validTypes.length; i++) {
  const vt = validTypes[i];
  const frames = new Map();
  for (const animVal of ANIM_PROBES) {
    try {
      nes.fromJSON(lateState);
      nes.cpu.mem[TYPE_BYTE_ADDR] = vt.typeValue;
      nes.cpu.mem[ANIM_BYTE] = animVal;
      nes.frame();
      nes.frame();
      frames.set(animVal, captureOAM(nes));
    } catch (_e) {
      frames.set(animVal, null);
    }
  }
  animData.set(vt.typeValue, frames);
  if ((i + 1) % 20 === 0) process.stdout.write(`  ${i + 1}/${validTypes.length} types...\r`);
}
console.log(`  Animation sweep complete (${validTypes.length} types).`);

// ═══════════════════════════════════════════════════════════════════════════════
// PHASE 6: Render
// ═══════════════════════════════════════════════════════════════════════════════

console.log("\n═══ PHASE 6: Render ═══");

// Read sprite palettes from PPU VRAM
nes.fromJSON(lateState);
const spritePalettes = [];
for (let p = 0; p < 4; p++) {
  const base = 0x3F10 + p * 4;
  spritePalettes.push([
    nes.ppu.vramMem[base],     nes.ppu.vramMem[base + 1],
    nes.ppu.vramMem[base + 2], nes.ppu.vramMem[base + 3],
  ]);
}
console.log("Sprite palettes:");
for (let p = 0; p < 4; p++) console.log(`  ${p}: [${spritePalettes[p]}]`);

// ── 2bpp tile decoder ─────────────────────────────────────────────────────────

function decodeTile(tileIndex, flipH = false, flipV = false) {
  const off = tileIndex * 16;
  const pixels = [];
  for (let row = 0; row < 8; row++) {
    const srcRow = flipV ? 7 - row : row;
    const p0 = chrPT0[off + srcRow]     ?? 0;
    const p1 = chrPT0[off + 8 + srcRow] ?? 0;
    for (let col = 0; col < 8; col++) {
      const srcCol = flipH ? col : 7 - col;
      pixels.push(((p0 >> srcCol) & 1) | (((p1 >> srcCol) & 1) << 1));
    }
  }
  return pixels;
}

// ── Pixel font (3×5) ──────────────────────────────────────────────────────────

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
  "A": [0,1,0, 1,0,1, 1,1,1, 1,0,1, 1,0,1],
  "B": [1,1,0, 1,0,1, 1,1,0, 1,0,1, 1,1,0],
  "C": [1,1,1, 1,0,0, 1,0,0, 1,0,0, 1,1,1],
  "D": [1,1,0, 1,0,1, 1,0,1, 1,0,1, 1,1,0],
  "E": [1,1,1, 1,0,0, 1,1,0, 1,0,0, 1,1,1],
  "F": [1,1,1, 1,0,0, 1,1,0, 1,0,0, 1,0,0],
  "x": [0,0,0, 1,0,1, 0,1,0, 1,0,1, 0,0,0],
  " ": [0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0],
};

// ── Layout ────────────────────────────────────────────────────────────────────

const LABEL_W  = 24;  // left label column (type hex "FF")
const CELL_W   = 32;  // width per animation frame column
const CELL_H   = 32;  // sprite area height per row
const LROW_H   = 7;   // label row below sprite area
const ROW_H    = CELL_H + LROW_H; // total row height
const HEADER_H = 18;  // top header row (anim probe values)
const PAD      = 1;   // gap between cells

const nRows  = validTypes.length;
const nCols  = ANIM_PROBES.length;
const IMG_W  = LABEL_W + nCols * (CELL_W + PAD) + PAD;
const IMG_H  = HEADER_H + nRows * (ROW_H + PAD) + PAD;
console.log(`Canvas: ${IMG_W}×${IMG_H} (${nRows} rows × ${nCols} cols)`);

const imgBuf = Buffer.alloc(IMG_W * IMG_H * 3, 0x18); // near-black background

function setPixel(x, y, r, g, b) {
  if (x < 0 || x >= IMG_W || y < 0 || y >= IMG_H) return;
  const i = (y * IMG_W + x) * 3;
  imgBuf[i] = r; imgBuf[i+1] = g; imgBuf[i+2] = b;
}

function fillRect(x, y, w, h, r, g, b) {
  for (let dy = 0; dy < h; dy++)
    for (let dx = 0; dx < w; dx++)
      setPixel(x + dx, y + dy, r, g, b);
}

function drawLabel(x0, y0, text, r = 255, g = 255, b = 255) {
  let cx = x0;
  for (const ch of text) {
    const glyph = FONT3x5[ch] || FONT3x5[" "];
    for (let row = 0; row < 5; row++)
      for (let col = 0; col < 3; col++)
        if (glyph[row * 3 + col]) setPixel(cx + col, y0 + row, r, g, b);
    cx += 4;
  }
}

function drawTileAt(dstX, dstY, tileIdx, palIdx, flipH, flipV) {
  const pixels = decodeTile(tileIdx, flipH, flipV);
  const pal = spritePalettes[palIdx] || [0, 0x16, 0x26, 0x30];
  for (let row = 0; row < 8; row++) {
    for (let col = 0; col < 8; col++) {
      const ci = pixels[row * 8 + col];
      if (ci === 0) continue;
      const [rv, gv, bv] = nesColorToRGB(pal[ci]);
      setPixel(dstX + col, dstY + row, rv, gv, bv);
    }
  }
}

// Render a list of sprites centered in a cell of size (cellW × cellH) at (cellX, cellY)
function renderEntityInCell(sprites, cellX, cellY, cellW, cellH) {
  if (!sprites || sprites.length === 0) return;
  const xs   = sprites.map((s) => s.x);
  const ys   = sprites.map((s) => s.y);
  const minX = Math.min(...xs), minY = Math.min(...ys);
  const maxX = Math.max(...xs) + 8, maxY = Math.max(...ys) + 8;
  const sprW = maxX - minX, sprH = maxY - minY;
  const ox = cellX + Math.max(0, Math.floor((cellW - sprW) / 2));
  const oy = cellY + Math.max(0, Math.floor((cellH - sprH) / 2));
  for (const spr of sprites) {
    drawTileAt(ox + (spr.x - minX), oy + (spr.y - minY), spr.tile, spr.palette, spr.flipH, spr.flipV);
  }
}

// Draw header row: anim probe values
for (let c = 0; c < nCols; c++) {
  const x = LABEL_W + c * (CELL_W + PAD) + 2;
  const valStr = ANIM_PROBES[c].toString();
  drawLabel(x, 5, valStr, 140, 140, 140);
}

// Draw entity rows
for (let rowIdx = 0; rowIdx < validTypes.length; rowIdx++) {
  const vt   = validTypes[rowIdx];
  const rowY = HEADER_H + rowIdx * (ROW_H + PAD);

  // Row stripe background
  const bg = rowIdx % 2 === 0 ? 0x22 : 0x1A;
  fillRect(0, rowY, IMG_W, ROW_H, bg, bg, bg);

  // Left label: 2-digit hex type value
  const hexStr = vt.typeValue.toString(16).toUpperCase().padStart(2, "0");
  drawLabel(2, rowY + Math.floor(CELL_H / 2) - 3, hexStr, 220, 220, 80);

  // Draw each animation frame column
  const frames = animData.get(vt.typeValue);
  for (let c = 0; c < nCols; c++) {
    const cellX  = LABEL_W + c * (CELL_W + PAD);
    const animVal = ANIM_PROBES[c];
    const oam    = frames?.get(animVal);
    if (!oam) continue;

    const sprites = entitySlots
      .map((s) => oam[s])
      .filter(isVisible)
      .map((e) => ({
        x: e.x, y: e.y, tile: e.tile, attr: e.attr,
        palette: e.attr & 0x03, flipH: !!(e.attr & 0x40), flipV: !!(e.attr & 0x80),
      }));

    renderEntityInCell(sprites, cellX, rowY, CELL_W, CELL_H);
  }
}

// Save PNG
await sharp(imgBuf, { raw: { width: IMG_W, height: IMG_H, channels: 3 } })
  .png()
  .toFile(PNG_PATH);
console.log(`PNG saved: ${PNG_PATH}`);

// ═══════════════════════════════════════════════════════════════════════════════
// Save JSON manifest
// ═══════════════════════════════════════════════════════════════════════════════

// Build per-type animation data for manifest
const entityManifest = validTypes.map((vt) => {
  const frames = animData.get(vt.typeValue);
  const animFrameData = ANIM_PROBES.map((animVal) => {
    const oam = frames?.get(animVal);
    if (!oam) return { anim_val: animVal, crashed: true, sprites: [] };
    const sprites = entitySlots
      .map((s) => oam[s])
      .filter(isVisible)
      .map((e) => ({
        slot: e.slot,
        tile: e.tile, tile_hex: h8(e.tile),
        palette: e.attr & 0x03,
        flip_h: !!(e.attr & 0x40), flip_v: !!(e.attr & 0x80),
        x: e.x, y: e.y,
      }));
    return { anim_val: animVal, sprite_count: sprites.length, sprites };
  });
  return {
    type_value: vt.typeValue,
    type_hex: h8(vt.typeValue),
    default_sprite_count: vt.sprites.length,
    anim_frames: animFrameData,
  };
});

// Context sweep summary
const contextSummary = {};
for (const [at, ctx] of Object.entries(contextSweeps)) {
  const diffTypes = ctx.validTypes
    .filter((vt) => {
      const def = validTypes.find((v) => v.typeValue === vt.typeValue);
      if (!def) return true;
      return vt.sprites.map((s) => s.tile).sort().join(",") !== def.sprites.map((s) => s.tile).sort().join(",");
    })
    .map((vt) => vt.typeValue);
  contextSummary[`area_type_${at}`] = {
    valid_type_count: ctx.validTypes.length,
    crash_count: ctx.crashCount,
    types_differing_from_default: diffTypes,
  };
}

// OAM write groups for manifest
const oamWriteGroups = sortedXRegs.map(([x, info]) => ({
  x_reg: h8(x),
  frame_count: info.frames.size,
  oam_slots: [...info.slots].sort((a, b) => a - b),
  byte_types: [...info.byteOffsets].sort().map((b) => ["Y","tile","attr","X"][b]),
  pcs: [...info.pcs].map(h16),
}));

const manifest = {
  game: "Super Mario Bros",
  rom: romFile,
  early_state_frame: earlyFrame,
  late_state_frame: lateFrame,
  type_byte_addr: h16(TYPE_BYTE_ADDR),
  anim_byte_addr: h16(ANIM_BYTE),
  area_type_byte_addr: h16(AREA_TYPE_BYTE),
  anim_probe_values: ANIM_PROBES,
  oracle_candidates: candidates.map((c) => ({
    addr: h16(c.addr), orig_val: h8(c.origVal), effect: c.effect, changed_slots: c.changedSlots,
  })),
  entity_oam_slots: entitySlots,
  crashed_type_values: crashedTypes,
  valid_type_count: validTypes.length,
  context_sweep_summary: contextSummary,
  oam_write_groups: oamWriteGroups,
  entities: entityManifest,
};

fs.writeFileSync(JSON_PATH, JSON.stringify(manifest, null, 2));
console.log(`JSON saved: ${JSON_PATH}`);

console.log("\n═══ DONE ═══");
console.log(`Entity types:        ${validTypes.length}`);
console.log(`Animation probes:    ${ANIM_PROBES.length} (values: ${ANIM_PROBES.join(", ")})`);
console.log(`Context sweeps:      4 area types`);
console.log(`OAM write groups:    ${sortedXRegs.length} X_reg values tracked`);
console.log(`Output PNG:          ${PNG_PATH}`);
console.log(`Output JSON:         ${JSON_PATH}`);
