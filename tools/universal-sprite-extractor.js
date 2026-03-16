/**
 * universal-sprite-extractor.js v3
 *
 * Extracts ALL sprites from ANY NES game. No per-game configuration.
 * Input: ROM path. Output: PNG sprite sheet + JSON manifest.
 *
 * Key fix vs v2: Phase 4 now sweeps from the BEST SNAPSHOT for each
 * TILE_CHANGER, not from a single baseline. Entity slots must be
 * naturally populated (game-rendered) for the sweep to produce tiles.
 *
 * Usage: node tools/universal-sprite-extractor.js <rom.nes> [output-dir]
 */

import { NES, Controller } from "jsnes";
import fs from "fs";
import path from "path";
import sharp from "sharp";

// ── CLI ───────────────────────────────────────────────────────────────────────

const romPath = process.argv[2];
if (!romPath) {
  console.error("Usage: node tools/universal-sprite-extractor.js <rom.nes> [output-dir]");
  process.exit(1);
}
const romBuf  = fs.readFileSync(romPath);
const romName = path.basename(romPath, ".nes");
const outDir  = process.argv[3] || path.join(process.cwd(), "experiment-output");
fs.mkdirSync(outDir, { recursive: true });

console.log(`ROM: ${path.basename(romPath)}`);

// ── iNES header ───────────────────────────────────────────────────────────────

const prgBanks  = romBuf[4];
const chrBanks  = romBuf[5];
const prgSize   = prgBanks * 16384;
const chrSize   = chrBanks * 8192;
const isChrRAM  = chrSize === 0;
const chrOffset = 16 + prgSize;
const chrRomData = isChrRAM ? null : romBuf.slice(chrOffset, chrOffset + chrSize);

console.log(`PRG: ${prgSize} bytes | CHR: ${isChrRAM ? "RAM (dynamic)" : `ROM ${chrSize} bytes`}`);

// ── NES master palette ────────────────────────────────────────────────────────

const NES_PAL = [
  [84,84,84],[0,30,116],[8,16,144],[48,0,136],[68,0,100],[92,0,48],[84,4,0],[60,24,0],
  [32,42,0],[8,58,0],[0,64,0],[0,60,0],[0,50,60],[0,0,0],[0,0,0],[0,0,0],
  [152,150,152],[8,76,196],[48,50,236],[92,30,228],[136,20,176],[160,20,100],[152,34,32],[120,60,0],
  [84,90,0],[40,114,0],[8,124,0],[0,118,40],[0,102,120],[0,0,0],[0,0,0],[0,0,0],
  [236,238,236],[76,154,236],[120,124,236],[176,98,236],[228,84,236],[236,88,180],[236,106,100],[212,136,32],
  [160,170,0],[116,196,0],[76,208,32],[56,204,108],[56,180,204],[60,60,60],[0,0,0],[0,0,0],
  [236,238,236],[168,204,236],[188,188,236],[212,178,236],[236,174,236],[236,174,212],[236,180,176],[228,196,144],
  [204,210,120],[180,222,120],[168,226,144],[152,226,180],[160,214,228],[160,162,160],[0,0,0],[0,0,0],
];
const nesRGB = idx => NES_PAL[idx & 0x3F] ?? [0, 0, 0];

// ── Helpers ───────────────────────────────────────────────────────────────────

const h8  = v => "0x" + (v & 0xFF).toString(16).toUpperCase().padStart(2, "0");
const h16 = v => "0x" + (v & 0xFFFF).toString(16).toUpperCase().padStart(4, "0");

// ── NES instance ──────────────────────────────────────────────────────────────

const romBinary = romBuf.toString("binary");
let oamPage          = 0x02;
let maxSeenPPUCTRL   = 0x00; // track max PPUCTRL value seen during gameplay

const nes = new NES({
  onFrame: () => {},
  onAudioSample: null,
  onStatusUpdate: () => {},
  emulateSound: false,
});
const _origWrite = nes.cpu.write.bind(nes.cpu);
nes.cpu.write = function (addr, val) {
  if (addr === 0x4014) oamPage = val;
  if (addr === 0x2000) maxSeenPPUCTRL = Math.max(maxSeenPPUCTRL, val);
  _origWrite(addr, val);
};
nes.loadROM(romBinary);

let frameNum = 0;
function step(n = 1) {
  for (let i = 0; i < n; i++) { nes.frame(); frameNum++; }
}

// ── OAM / VRAM / palette capture ─────────────────────────────────────────────

function captureOAM() {
  const out = [];
  for (let i = 0; i < 64; i++) {
    const b = i * 4;
    out.push({
      slot: i,
      y:    nes.ppu.spriteMem[b],
      tile: nes.ppu.spriteMem[b + 1],
      attr: nes.ppu.spriteMem[b + 2],
      x:    nes.ppu.spriteMem[b + 3],
    });
  }
  return out;
}

const isVisible = e => e.y < 0xEF;

function captureVRAM() {
  const d = new Uint8Array(0x2000);
  for (let i = 0; i < 0x2000; i++) d[i] = nes.ppu.vramMem[i] ?? 0;
  return d;
}

function vramHash(d) {
  let h = 0x811C9DC5 >>> 0;
  for (let i = 0; i < d.length; i++) h = Math.imul(h ^ d[i], 0x01000193) >>> 0;
  return h;
}

function capturePalettes() {
  const sprite = [], bg = [];
  for (let p = 0; p < 4; p++) {
    sprite.push(Array.from({ length: 4 }, (_, c) => nes.ppu.vramMem[0x3F10 + p * 4 + c] ?? 0));
    bg.push(Array.from({ length: 4 }, (_, c) => nes.ppu.vramMem[0x3F00 + p * 4 + c] ?? 0));
  }
  return { sprite, bg };
}

function captureNametableTiles() {
  const tiles = new Set();
  for (let nt = 0; nt < 2; nt++) {
    const base = 0x2000 + nt * 0x400;
    for (let i = 0; i < 960; i++) {
      const t = nes.ppu.vramMem[base + i];
      if (t !== 0) tiles.add(t);
    }
  }
  return tiles;
}

// ── Sprite bank + tile decoding ───────────────────────────────────────────────

function getSpriteBank(ppuCtrl) {
  const ctrl = ppuCtrl ?? (nes.ppu.control1 ?? 0);
  if ((ctrl >> 5) & 1) return null; // 8x16 mode
  return ((ctrl >> 3) & 1) ? 0x1000 : 0x0000;
}

function getSpriteAddrs(tile, spriteBank) {
  if (spriteBank !== null) {
    return [{ vramAddr: spriteBank + tile * 16, romAddr: spriteBank + tile * 16, tileY: 0 }];
  }
  const bank = (tile & 1) ? 0x1000 : 0x0000;
  const t    = tile & 0xFE;
  return [
    { vramAddr: bank + t * 16,       romAddr: bank + t * 16,       tileY: 0 },
    { vramAddr: bank + (t + 1) * 16, romAddr: bank + (t + 1) * 16, tileY: 8 },
  ];
}

function decodeTileFromBytes(src, offset, flipH, flipV) {
  const px = new Uint8Array(64);
  for (let row = 0; row < 8; row++) {
    const srcRow = flipV ? 7 - row : row;
    const b0 = src[offset + srcRow]     ?? 0;
    const b1 = src[offset + 8 + srcRow] ?? 0;
    for (let col = 0; col < 8; col++) {
      const srcCol = flipH ? col : 7 - col;
      px[row * 8 + col] = ((b0 >> srcCol) & 1) | (((b1 >> srcCol) & 1) << 1);
    }
  }
  return px;
}

// Multiset of visible tile indices (position-independent)
function tileMset(oam) {
  return oam.filter(isVisible).map(e => e.tile).sort((a, b) => a - b).join(",");
}

// Normalized OAM hash (position-relative, for deduplication)
function oamHash(oam) {
  const vis = oam.filter(isVisible);
  if (vis.length === 0) return null;
  const minX = Math.min(...vis.map(e => e.x));
  const minY = Math.min(...vis.map(e => e.y));
  const norm = vis.map(e => ({
    tile: e.tile,
    attr: e.attr & 0xC3,
    rx:   (e.x - minX + 256) % 256,
    ry:   (e.y - minY + 256) % 256,
  })).sort((a, b) => a.ry !== b.ry ? a.ry - b.ry : a.rx !== b.rx ? a.rx - b.rx : a.tile - b.tile);
  return JSON.stringify(norm);
}

// ═══════════════════════════════════════════════════════════════════════════════
// PHASE 1: Boot to Gameplay
// ═══════════════════════════════════════════════════════════════════════════════

console.log("\n═══ PHASE 1: Boot to Gameplay ═══");

function controlTest(rightFrames = 20) {
  const pre = captureOAM();
  nes.buttonDown(1, Controller.BUTTON_RIGHT);
  step(rightFrames);
  nes.buttonUp(1, Controller.BUTTON_RIGHT);
  const post = captureOAM();
  for (let s = 0; s < 64; s++) {
    if (!isVisible(pre[s])) continue;
    const dx = (post[s].x - pre[s].x + 256) % 256;
    if (dx > 4 && dx < 200) {
      console.log(`  Gameplay at frame ${frameNum} (slot ${s} moved ${dx}px right)`);
      return true;
    }
  }
  return false;
}

function pressStart() {
  nes.buttonDown(1, Controller.BUTTON_START);
  step(2);
  nes.buttonUp(1, Controller.BUTTON_START);
}

// Pattern A: proven SMB sequence
step(120); pressStart();
step(120); pressStart();
step(300);

let inGameplay = controlTest(20);
if (!inGameplay) { step(200); inGameplay = controlTest(20); }

if (!inGameplay) {
  console.log(`  Pattern A failed. Trying B...`);
  for (let i = 0; i < 6 && !inGameplay; i++) {
    pressStart(); step(100);
    inGameplay = controlTest(20);
    if (!inGameplay) { nes.buttonDown(1, Controller.BUTTON_LEFT); step(20); nes.buttonUp(1, Controller.BUTTON_LEFT); }
  }
}

if (!inGameplay) {
  console.log(`  Pattern B failed. Trying C...`);
  for (let f = 0; f < 600; f += 30) { pressStart(); step(28); }
  step(400);
  inGameplay = controlTest(30);
  if (!inGameplay) { step(200); inGameplay = controlTest(30); }
}

if (!inGameplay) {
  console.error(`ERROR: Gameplay not confirmed after ${frameNum} frames.`);
  process.exit(1);
}

// Run 120f Right to bring enemies on screen, then save oracle baseline
nes.buttonDown(1, Controller.BUTTON_RIGHT);
step(120);
nes.buttonUp(1, Controller.BUTTON_RIGHT);

// Capture PPUCTRL seen during gameplay (before oracle modifies things)
const gameplayPPUCTRL = maxSeenPPUCTRL;
console.log(`  Gameplay PPUCTRL seen: ${h8(gameplayPPUCTRL)}`);

console.log(`  Saving oracle baseline at frame ${frameNum}...`);
const baselineState = nes.toJSON();

// ── Snapshot collection starts here (right-hold 600f, snap every 30f) ────────
console.log(`  Collecting gameplay snapshots (600f)...`);

const snapshots = []; // { frame, state, oam, ntTiles, ctxIdx }

nes.fromJSON(baselineState);
nes.buttonDown(1, Controller.BUTTON_RIGHT);
for (let f = 0; f < 600; f += 30) {
  step(30);
  snapshots.push({
    frame:   frameNum,
    state:   nes.toJSON(),
    oam:     captureOAM(),
    ntTiles: captureNametableTiles(),
    ctxIdx:  0,
  });
}
nes.buttonUp(1, Controller.BUTTON_RIGHT);
console.log(`  Collected ${snapshots.length} gameplay snapshots`);

// ── Build OAM DMA page range (will be updated by oracle writes to $4014) ─────
const oamBufLo = oamPage << 8;
const oamBufHi = oamBufLo + 0xFF;

// ═══════════════════════════════════════════════════════════════════════════════
// PHASE 2: Capture Baseline
// ═══════════════════════════════════════════════════════════════════════════════

console.log("\n═══ PHASE 2: Capture Baseline ═══");

nes.fromJSON(baselineState);
step(2);

const baselineOAM      = captureOAM();
const baselineVRAM     = captureVRAM();
const baselinePalettes = capturePalettes();
const baselineSprBank  = getSpriteBank(gameplayPPUCTRL);
// BG bank: opposite of sprite bank for 8KB CHR-ROM games
const baselineBGBank   = (baselineSprBank === 0x0000) ? 0x1000 : 0x0000;

const visCount = baselineOAM.filter(isVisible).length;
console.log(`  Visible sprites:  ${visCount}`);
console.log(`  Sprite bank:      ${baselineSprBank !== null ? h16(baselineSprBank) : "8x16"}`);
console.log(`  BG bank:          ${h16(baselineBGBank)}`);
console.log(`  PPUCTRL (max):    ${h8(gameplayPPUCTRL)}`);
console.log(`  OAM DMA page:     ${h8(oamPage)} → ${h16(oamBufLo)}-${h16(oamBufHi)}`);
console.log(`  Sprite palettes:`);
for (let p = 0; p < 4; p++) console.log(`    [${p}]: ${baselinePalettes.sprite[p].map(h8).join(", ")}`);

// ═══════════════════════════════════════════════════════════════════════════════
// PHASE 3: Global Oracle ($0000–$07FF)
// Scans all bytes (including zero-valued) to find TILE_CHANGERS.
// ═══════════════════════════════════════════════════════════════════════════════

console.log("\n═══ PHASE 3: Global Oracle ($0000–$07FF) ═══");

nes.fromJSON(baselineState);
step(2);
const ro_refOAM   = captureOAM();
const ro_refVHash = vramHash(captureVRAM());
const ro_refTMset = tileMset(ro_refOAM);
const ro_refAMset = ro_refOAM.filter(isVisible).map(e => e.attr & 0xC3).sort((a,b)=>a-b).join(",");

const TILE_CHANGERS     = [];
const POSITION_CHANGERS = [];
const ATTR_CHANGERS     = [];
const VRAM_CHANGERS     = [];
const contextChangers   = [];
const knownChangerSet   = new Set();
const contextBaselines  = [baselineState];

for (let addr = 0x0000; addr <= 0x07FF; addr++) {
  if (addr >= oamBufLo && addr <= oamBufHi) continue;

  try {
    nes.fromJSON(baselineState);
    const origVal  = nes.cpu.mem[addr];
    const probeVal = origVal === 0xFF ? 0x7F : (origVal + 1) & 0xFF;
    nes.cpu.mem[addr] = probeVal;
    step(2);

    const newOAM   = captureOAM();
    const newVHash = vramHash(captureVRAM());
    const newTMset = tileMset(newOAM);
    const newAMset = newOAM.filter(isVisible).map(e => e.attr & 0xC3).sort((a,b)=>a-b).join(",");

    const tileChg = newTMset !== ro_refTMset;
    const attrChg = !tileChg && newAMset !== ro_refAMset;
    const vramChg = newVHash !== ro_refVHash;

    let slotsChg = 0;
    for (let i = 0; i < 64; i++) {
      if (isVisible(ro_refOAM[i]) !== isVisible(newOAM[i])) slotsChg++;
      else if (isVisible(ro_refOAM[i]) && ro_refOAM[i].tile !== newOAM[i].tile) slotsChg++;
    }

    let posChg = false;
    for (let i = 0; i < 64; i++) {
      if (!isVisible(ro_refOAM[i])) continue;
      const dx = Math.abs(((newOAM[i].x - ro_refOAM[i].x) + 256) % 256);
      const dy = Math.abs(((newOAM[i].y - ro_refOAM[i].y) + 256) % 256);
      if ((dx > 5 && dx < 251) || (dy > 5 && dy < 251)) { posChg = true; break; }
    }

    if (tileChg) {
      TILE_CHANGERS.push({ addr, origVal, ctxIdx: 0 });
      knownChangerSet.add(addr);
      if (slotsChg >= 5) contextChangers.push({ addr, origVal, slotsChg });
    }
    if (posChg && !tileChg) POSITION_CHANGERS.push({ addr });
    if (attrChg)            ATTR_CHANGERS.push({ addr });
    if (vramChg)            VRAM_CHANGERS.push({ addr });
  } catch (_) {}

  if ((addr + 1) % 512 === 0) process.stdout.write(`  Scanned ${addr + 1}/2048...\r`);
}

console.log(`\n  TILE_CHANGERS: ${TILE_CHANGERS.length} | POSITION_CHANGERS: ${POSITION_CHANGERS.length} | CONTEXT_CHANGERS: ${contextChangers.length}`);
if (TILE_CHANGERS.length > 0) {
  console.log(`  Addrs: ${TILE_CHANGERS.slice(0, 20).map(c => h16(c.addr)).join(", ")}${TILE_CHANGERS.length > 20 ? ` +${TILE_CHANGERS.length-20}` : ""}`);
}
if (contextChangers.length > 0) {
  const top = [...contextChangers].sort((a,b)=>b.slotsChg-a.slotsChg).slice(0, 5);
  console.log(`  Top context changers: ${top.map(c=>`${h16(c.addr)}(${c.slotsChg})`).join(", ")}`);
}

// ── Post-oracle: record SLOT-LEVEL changes for each TILE_CHANGER ──────────────
// One extra probe per TILE_CHANGER to find which OAM slots actually changed.
// Used in Phase 4B to score snapshots.

const changedSlotsMap = new Map(); // addr → Set<slotIndex>

nes.fromJSON(baselineState);
step(2);
const slotRefOAM = captureOAM();

for (const tc of TILE_CHANGERS) {
  try {
    nes.fromJSON(baselineState);
    const pv = tc.origVal === 0xFF ? 0x7F : (tc.origVal + 1) & 0xFF;
    nes.cpu.mem[tc.addr] = pv;
    step(2);
    const probedOAM = captureOAM();
    const changed = new Set();
    for (let i = 0; i < 64; i++) {
      if (slotRefOAM[i].tile !== probedOAM[i].tile ||
          isVisible(slotRefOAM[i]) !== isVisible(probedOAM[i])) {
        changed.add(i);
      }
    }
    changedSlotsMap.set(tc.addr, changed);
  } catch(_) {
    changedSlotsMap.set(tc.addr, new Set());
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// PHASE 3b: Multi-Baseline Oracle
// ═══════════════════════════════════════════════════════════════════════════════

console.log("\n═══ PHASE 3b: Multi-Baseline Oracle ═══");

const MULTI_BUDGET_MS = 60_000;
const multiStart      = Date.now();
const topCtxChangers  = [...contextChangers].sort((a,b)=>b.slotsChg-a.slotsChg).slice(0, 3);
let   totalMultiNew   = 0;

for (const cc of topCtxChangers) {
  if (Date.now() - multiStart > MULTI_BUDGET_MS) break;
  for (let v = 0; v <= 7; v++) {
    if (v === cc.origVal) continue;
    if (Date.now() - multiStart > MULTI_BUDGET_MS) break;
    try {
      nes.fromJSON(baselineState);
      nes.cpu.mem[cc.addr] = v;
      step(60);
      if (captureOAM().filter(isVisible).length < 2) continue;
      const ctxBase = nes.toJSON();
      contextBaselines.push(ctxBase);
      const ctxIdx = contextBaselines.length - 1;

      step(2);
      const ctxRefTMset = tileMset(captureOAM());
      let ctxNew = 0;

      for (let addr2 = 0x0000; addr2 <= 0x07FF; addr2++) {
        if (knownChangerSet.has(addr2)) continue;
        if (addr2 >= oamBufLo && addr2 <= oamBufHi) continue;
        if (addr2 === cc.addr) continue;
        try {
          nes.fromJSON(ctxBase);
          const ov2 = nes.cpu.mem[addr2];
          const pv2 = ov2 === 0xFF ? 0x7F : (ov2 + 1) & 0xFF;
          nes.cpu.mem[addr2] = pv2;
          step(2);
          if (tileMset(captureOAM()) !== ctxRefTMset) {
            TILE_CHANGERS.push({ addr: addr2, origVal: ov2, ctxIdx });
            knownChangerSet.add(addr2);

            // Also record changedSlots for this new TILE_CHANGER from ctxBase
            try {
              nes.fromJSON(ctxBase);
              step(2);
              const ctxSlotRef = captureOAM();
              nes.fromJSON(ctxBase);
              nes.cpu.mem[addr2] = pv2;
              step(2);
              const ctxSlotProbed = captureOAM();
              const ctxChanged = new Set();
              for (let i = 0; i < 64; i++) {
                if (ctxSlotRef[i].tile !== ctxSlotProbed[i].tile ||
                    isVisible(ctxSlotRef[i]) !== isVisible(ctxSlotProbed[i])) {
                  ctxChanged.add(i);
                }
              }
              changedSlotsMap.set(addr2, ctxChanged);
            } catch(_) {
              changedSlotsMap.set(addr2, new Set());
            }

            ctxNew++;
          }
        } catch(_) {}
      }

      totalMultiNew += ctxNew;
      console.log(`  Context ${h16(cc.addr)}=${v}: +${ctxNew} TILE_CHANGERs`);
      if (ctxNew === 0) break;
    } catch(_) {}
  }
}

console.log(`  Multi-baseline: +${totalMultiNew} new | Total TILE_CHANGERs: ${TILE_CHANGERS.length} | Baselines: ${contextBaselines.length}`);

// ═══════════════════════════════════════════════════════════════════════════════
// PHASE 4A: Context Snapshot Collection
// Extends the snapshot pool with states from each context baseline.
// ═══════════════════════════════════════════════════════════════════════════════

console.log("\n═══ PHASE 4A: Context Snapshot Collection ═══");

// Snapshots from context baselines (values 0-5 for top context changers)
for (const cc of topCtxChangers) {
  if (Date.now() - multiStart > 150_000) break; // 150s total budget for phases 3b+4A

  for (let v = 0; v <= 5; v++) {
    if (v === cc.origVal) continue;
    try {
      nes.fromJSON(baselineState);
      nes.cpu.mem[cc.addr] = v;
      step(60);
      if (captureOAM().filter(isVisible).length < 2) continue;
      const ctxIdx = contextBaselines.findIndex((b, i) => {
        // Find if this context was already created in 3b
        // (approximate: match by checking if ctxIdx > 0)
        return false; // always create fresh snapshot pool entry
      }) >= 0 ? 0 : snapshots.length; // simplified: always push as ctxIdx=snapshot.length

      // Determine ctxIdx: find if this (cc.addr, v) context already has a baseline
      let usedCtxIdx = 0;
      for (let bi = 1; bi < contextBaselines.length; bi++) {
        // We can't easily check what value was used, so just use the base idx
        usedCtxIdx = bi;
      }

      nes.buttonDown(1, Controller.BUTTON_RIGHT);
      for (let f = 0; f < 120; f += 30) {
        step(30);
        snapshots.push({
          frame:   frameNum,
          state:   nes.toJSON(),
          oam:     captureOAM(),
          ntTiles: captureNametableTiles(),
          ctxIdx:  usedCtxIdx > 0 ? usedCtxIdx : 1,
        });
      }
      nes.buttonUp(1, Controller.BUTTON_RIGHT);
    } catch(_) {}
  }
}

console.log(`  Total snapshots: ${snapshots.length} (${snapshots.filter(s=>s.ctxIdx===0).length} gameplay + ${snapshots.filter(s=>s.ctxIdx>0).length} context)`);

// ── BG tile accumulation from all snapshots ───────────────────────────────────
const allBGTiles = new Set(snapshots.flatMap(s => [...s.ntTiles]));
// Also do a dedicated scroll capture for BG tile coverage
nes.fromJSON(baselineState);
nes.buttonDown(1, Controller.BUTTON_RIGHT);
for (let f = 0; f < 600; f += 60) {
  step(60);
  for (const t of captureNametableTiles()) allBGTiles.add(t);
}
nes.buttonUp(1, Controller.BUTTON_RIGHT);

// For CHR-ROM games: include ALL non-blank tiles from the BG bank.
// Nametable capture only sees tiles visible in this gameplay segment;
// CHR-ROM has the full tile set statically available regardless of level.
if (!isChrRAM && chrRomData) {
  for (let tileIdx = 0; tileIdx < 256; tileIdx++) {
    const off = baselineBGBank + tileIdx * 16;
    for (let b = 0; b < 16; b++) {
      if (chrRomData[off + b] !== 0) { allBGTiles.add(tileIdx); break; }
    }
  }
}
console.log(`  BG tiles across all snapshots: ${allBGTiles.size}`);

// ── Build slot→snapshot inverted index for fast best-snapshot search ──────────
const slotToSnaps = new Map(); // slot# → snapshot[]
for (const snap of snapshots) {
  for (let s = 0; s < 64; s++) {
    if (isVisible(snap.oam[s])) {
      if (!slotToSnaps.has(s)) slotToSnaps.set(s, []);
      slotToSnaps.get(s).push(snap);
    }
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// PHASE 4B: Targeted Sweep (Best Snapshot per TILE_CHANGER)
// For each TILE_CHANGER, find the snapshot where its changed OAM slots are
// most likely to be naturally populated (visible), then sweep from there.
// ═══════════════════════════════════════════════════════════════════════════════

console.log("\n═══ PHASE 4B: Targeted Sweep ═══");

// Score: how many of addr's changedSlots are visible in this snapshot?
function scoreSnap(snap, changedSlots) {
  let s = 0;
  for (const slot of changedSlots) if (isVisible(snap.oam[slot])) s++;
  return s;
}

function bestSnapForAddr(addr, ctxIdx) {
  const changedSlots = changedSlotsMap.get(addr) ?? new Set();

  // Gather candidate snapshots via inverted index
  const candidates = new Map(); // snap → score
  for (const slot of changedSlots) {
    for (const snap of (slotToSnaps.get(slot) ?? [])) {
      if (!candidates.has(snap)) {
        candidates.set(snap, scoreSnap(snap, changedSlots));
      }
    }
  }

  // If no candidates from inverted index, fall back to all snapshots
  if (candidates.size === 0) {
    for (const snap of snapshots) candidates.set(snap, scoreSnap(snap, changedSlots));
  }

  // Sort: context-matched snapshots first (tie-break by most center-X among changedSlots)
  let best = null, bestScore = -1;
  for (const [snap, sc] of candidates) {
    const score = sc + (snap.ctxIdx === ctxIdx ? 0.5 : 0); // prefer context match
    if (score > bestScore) { bestScore = score; best = snap; }
  }
  return best ?? snapshots[0];
}

// Find nearby TILE_CHANGER within ±32 bytes (animation byte candidate)
const sweepAddrSet = new Set(TILE_CHANGERS.map(tc => tc.addr));
function nearbyAnimAddr(addr) {
  for (const a of sweepAddrSet) {
    if (a !== addr && Math.abs(a - addr) <= 32) return a;
  }
  return null;
}

// Unique sweep addresses
const seenSweepAddrs = new Set();
const sweepEntries   = [];
for (const tc of TILE_CHANGERS) {
  if (!seenSweepAddrs.has(tc.addr)) {
    seenSweepAddrs.add(tc.addr);
    sweepEntries.push({ addr: tc.addr, ctxIdx: tc.ctxIdx ?? 0 });
  }
}
for (const vc of VRAM_CHANGERS) {
  if (!seenSweepAddrs.has(vc.addr)) {
    seenSweepAddrs.add(vc.addr);
    sweepEntries.push({ addr: vc.addr, ctxIdx: 0 });
  }
}

const discoveredStates = new Map();

for (let ei = 0; ei < sweepEntries.length; ei++) {
  const { addr, ctxIdx } = sweepEntries[ei];
  const changedSlots = changedSlotsMap.get(addr) ?? new Set();
  // Find best snapshot
  let sweepSnap = bestSnapForAddr(addr, ctxIdx);

  // Confirm: probe addr from best snapshot, verify its slots actually respond
  let confirmed = false;
  try {
    nes.fromJSON(sweepSnap.state);
    step(2);
    const confRef = captureOAM();
    const confRefTMset = tileMset(confRef);
    nes.fromJSON(sweepSnap.state);
    const origVal = nes.cpu.mem[addr];
    const pv = origVal === 0xFF ? 0x7F : (origVal + 1) & 0xFF;
    nes.cpu.mem[addr] = pv;
    step(2);
    const confProbed = captureOAM();
    // Accept if any changedSlot tile differs, OR tile multiset changed
    for (const s of changedSlots) {
      if (confRef[s].tile !== confProbed[s].tile ||
          isVisible(confRef[s]) !== isVisible(confProbed[s])) {
        confirmed = true; break;
      }
    }
    if (!confirmed && tileMset(confProbed) !== confRefTMset) confirmed = true;
  } catch(_) {}

  // If not confirmed, try top-scoring alternatives (up to 5 attempts)
  if (!confirmed) {
    const altCandidates = [...snapshots]
      .map(s => ({ snap: s, score: scoreSnap(s, changedSlots) }))
      .sort((a, b) => b.score - a.score)
      .slice(1, 6); // skip best (already tried), try next 5

    for (const { snap: altSnap } of altCandidates) {
      try {
        nes.fromJSON(altSnap.state);
        const origVal = nes.cpu.mem[addr];
        const pv = origVal === 0xFF ? 0x7F : (origVal + 1) & 0xFF;
        nes.cpu.mem[addr] = pv;
        step(2);
        const altRef = captureOAM();
        nes.fromJSON(altSnap.state);
        step(2);
        if (tileMset(altRef) !== tileMset(captureOAM())) {
          sweepSnap = altSnap;
          confirmed = true;
          break;
        }
      } catch(_) {}
    }
  }

  const slotsStr = `[${[...changedSlots].slice(0,4).join(",")}${changedSlots.size>4?"…":""}]`;
  process.stdout.write(`  [${ei+1}/${sweepEntries.length}] ${h16(addr)} slots=${slotsStr} snap=f${sweepSnap.frame} conf=${confirmed} `);

  let newForAddr  = 0;
  const foundVals = []; // type values that produced new states (for anim sweep)

  // Full 0-255 type sweep from best snapshot
  for (let val = 0; val < 256; val++) {
    try {
      nes.fromJSON(sweepSnap.state);
      nes.cpu.mem[addr] = val;
      step(2);

      const oam  = captureOAM();
      const hash = oamHash(oam);
      if (hash !== null && !discoveredStates.has(hash)) {
        discoveredStates.set(hash, {
          address:  addr,
          value:    val,
          oam:      oam.filter(isVisible),
          vram:     isChrRAM ? captureVRAM() : null,
          palettes: capturePalettes(),
        });
        newForAddr++;
        foundVals.push(val);
      }
    } catch(_) {}
  }

  // Animation frame capture: advance time to see natural animation cycles.
  // Instead of probing a "nearby animation byte" (which we can't reliably identify),
  // step forward in 4-frame increments so the game's own animation counter advances
  // and produces different sprite frames naturally. Universal across all NES games.
  let newFromAnim = 0;
  if (foundVals.length > 0) {
    for (const typeVal of foundVals) {
      for (let animOffset = 4; animOffset <= 64; animOffset += 4) {
        try {
          nes.fromJSON(sweepSnap.state);
          nes.cpu.mem[addr] = typeVal;
          step(animOffset);
          const aOAM  = captureOAM();
          const aHash = oamHash(aOAM);
          if (aHash !== null && !discoveredStates.has(aHash)) {
            discoveredStates.set(aHash, {
              address:    addr,
              value:      typeVal,
              animOffset,
              oam:        aOAM.filter(isVisible),
              vram:       isChrRAM ? captureVRAM() : null,
              palettes:   capturePalettes(),
            });
            newFromAnim++;
          }
        } catch(_) {}
      }
    }
  }

  // Combination sweep: also sweep nearby TILE_CHANGER bytes (±32 addr range).
  // These are often other entity-slot type bytes; sweeping them reveals tile
  // combinations that appear when two specific entity types are on screen together.
  const combAddr = nearbyAnimAddr(addr);
  let newFromComb = 0;
  if (combAddr !== null && foundVals.length > 0) {
    for (const typeVal of foundVals.slice(0, 24)) {
      for (let combVal = 0; combVal < 16; combVal++) {
        try {
          nes.fromJSON(sweepSnap.state);
          nes.cpu.mem[addr]     = typeVal;
          nes.cpu.mem[combAddr] = combVal;
          step(2);
          const cOAM  = captureOAM();
          const cHash = oamHash(cOAM);
          if (cHash !== null && !discoveredStates.has(cHash)) {
            discoveredStates.set(cHash, {
              address:  addr, value: typeVal, combAddr, combVal,
              oam:      cOAM.filter(isVisible),
              vram:     isChrRAM ? captureVRAM() : null,
              palettes: capturePalettes(),
            });
            newFromComb++;
          }
        } catch(_) {}
      }
    }
  }

  process.stdout.write(`+${newForAddr}type +${newFromAnim}anim +${newFromComb}comb → total=${discoveredStates.size}\n`);
}

console.log(`\n  Sweep complete: ${discoveredStates.size} unique sprite states`);

if (discoveredStates.size === 0) {
  console.error("ERROR: No sprite states discovered.");
  process.exit(1);
}

// ═══════════════════════════════════════════════════════════════════════════════
// PHASE 5: Deduplication and Grouping
// ═══════════════════════════════════════════════════════════════════════════════

console.log("\n═══ PHASE 5: Deduplication and Grouping ═══");

const allStates = [...discoveredStates.values()];

// Constant tiles: present in >50% of states (always-on-screen player)
const tileCounts = new Map();
for (const s of allStates)
  for (const t of new Set(s.oam.map(e => e.tile)))
    tileCounts.set(t, (tileCounts.get(t) ?? 0) + 1);
const constantTiles = new Set(
  [...tileCounts.entries()].filter(([, c]) => c > allStates.length * 0.5).map(([t]) => t)
);
console.log(`  Constant tiles: ${[...constantTiles].map(h8).join(", ") || "(none)"}`);

function tileSetOf(state) {
  return new Set(state.oam.map(e => e.tile).filter(t => !constantTiles.has(t)));
}

function overlapRatio(a, b) {
  let n = 0;
  for (const t of a) if (b.has(t)) n++;
  const minSz = Math.min(a.size, b.size);
  return minSz === 0 ? 0 : n / minSz;
}

const groups   = [];
const assigned = new Set();

for (let i = 0; i < allStates.length; i++) {
  if (assigned.has(i)) continue;
  const tsI = tileSetOf(allStates[i]);
  const grp = [i];
  assigned.add(i);
  for (let j = i + 1; j < allStates.length; j++) {
    if (assigned.has(j)) continue;
    const tsJ = tileSetOf(allStates[j]);
    if (tsI.size === 0 && tsJ.size === 0) { grp.push(j); assigned.add(j); continue; }
    if (overlapRatio(tsI, tsJ) > 0.5)    { grp.push(j); assigned.add(j); }
  }
  groups.push(grp);
}

console.log(`  ${allStates.length} states → ${groups.length} entity groups`);

// ── Sort groups: player first (empty entity tile set), then by area desc ──────
function groupArea(g) {
  return Math.max(...g.map(si => {
    const vis = allStates[si].oam.filter(isVisible);
    if (vis.length === 0) return 0;
    const xs = vis.map(e => e.x), ys = vis.map(e => e.y);
    const w  = Math.max(...xs) + 8 - Math.min(...xs);
    const h  = Math.max(...ys) + 8 - Math.min(...ys);
    return w * h;
  }), 0);
}

// Player group: majority of states have only constant tiles
function isPlayerGroup(g) {
  const entityCount = g.filter(si => tileSetOf(allStates[si]).size === 0).length;
  return entityCount > g.length * 0.7;
}

const playerGroups = groups.filter(isPlayerGroup);
const entityGroups = groups.filter(g => !isPlayerGroup(g)).sort((a, b) => groupArea(b) - groupArea(a));
const sortedGroups = [...playerGroups, ...entityGroups];

// Deduplicate frames within each group: keep only visually distinct tile sets (up to 48 per group)
function distinctFrames(group, max = 48) {
  if (group.length <= max) return group;
  const seen = new Set();
  const out  = [];
  for (const si of group) {
    const key = [...new Set(allStates[si].oam.map(e => e.tile))].sort().join(",");
    if (!seen.has(key)) { seen.add(key); out.push(si); if (out.length >= max) break; }
  }
  return out;
}

// ═══════════════════════════════════════════════════════════════════════════════
// PHASE 6: Render Sprite Sheet
// Row-per-entity, left labels, black bg inside cells, 2px white border.
// ═══════════════════════════════════════════════════════════════════════════════

console.log("\n═══ PHASE 6: Render Sprite Sheet ═══");

nes.fromJSON(baselineState);
step(2);
const renderVRAM = captureVRAM();
const renderBank = getSpriteBank(gameplayPPUCTRL);

const SCALE         = 4;
const CELL_GAP      = 3;   // between cells in a row
const ROW_GAP       = 4;   // between entity rows
const LABEL_H       = 10;  // label below each group
const MARGIN        = 8;
const BORDER        = 2;   // white border thickness
const LEFT_LABEL_W  = 56;  // left-side row label area
const MIN_CELL_NES  = 16;
const MIN_CELL_PX   = MIN_CELL_NES * SCALE;
const MAX_CELL_PX   = 160;
const MAX_IMG_W     = 2048;

function stateBounds(state) {
  const entitySprs = state.oam.filter(e => !constantTiles.has(e.tile));
  const src        = entitySprs.length > 0 ? entitySprs : state.oam;
  if (src.length === 0) return { w: MIN_CELL_PX, h: MIN_CELL_PX, minX: 0, minY: 0 };
  let minX = Infinity, minY = Infinity, maxX = -Infinity, maxY = -Infinity;
  for (const e of src) {
    const sprH = getSpriteAddrs(e.tile, renderBank).length * 8;
    if (e.x     < minX) minX = e.x;
    if (e.y + 1 < minY) minY = e.y + 1;
    if (e.x + 8 > maxX) maxX = e.x + 8;
    if (e.y + 1 + sprH > maxY) maxY = e.y + 1 + sprH;
  }
  return {
    w:    Math.min(Math.max((maxX - minX) * SCALE, MIN_CELL_PX), MAX_CELL_PX),
    h:    Math.min(Math.max((maxY - minY) * SCALE, MIN_CELL_PX), MAX_CELL_PX),
    minX, minY,
  };
}

// Compute per-entity layout
const entityLayouts = sortedGroups.map(group => {
  const frames   = distinctFrames(group);
  const dims     = frames.map(si => stateBounds(allStates[si]));
  const cellW    = Math.max(...dims.map(d => d.w), MIN_CELL_PX);
  const cellH    = Math.max(...dims.map(d => d.h), MIN_CELL_PX);
  const frameSlotW   = cellW + 2 * BORDER + CELL_GAP;
  const usableW      = MAX_IMG_W - 2 * MARGIN - LEFT_LABEL_W;
  const framesPerRow = Math.max(1, Math.floor(usableW / frameSlotW));
  const nRows        = Math.ceil(frames.length / framesPerRow);
  const rowH         = cellH + 2 * BORDER + LABEL_H;
  return { group, frames, cellW, cellH, frameSlotW, framesPerRow, nRows, rowH };
});

// Compute total image height
const totalH = MARGIN * 2
  + entityLayouts.reduce((acc, l) => acc + l.nRows * (l.rowH + ROW_GAP), 0);

// Add BG tile section: rows of tiles at 4x scale
const bgTileArr    = [...allBGTiles].sort((a, b) => a - b);
const BG_COLS      = 32;
const BG_TILE_PX   = 32; // 8 NES px × 4x
const bgSection    = Math.ceil(bgTileArr.length / BG_COLS) * (BG_TILE_PX + 2) + 32;
const imgW = MAX_IMG_W;
const imgH = totalH + bgSection + 30;

console.log(`  Sprites: ${imgW}×${totalH} | BG section: ${bgSection}px | Entities: ${sortedGroups.length}`);

const imgBuf = Buffer.alloc(imgW * imgH * 3, 0xFF); // white default
// Fill magenta overall
for (let i = 0; i < imgW * imgH; i++) {
  imgBuf[i * 3] = 255; imgBuf[i * 3 + 1] = 0; imgBuf[i * 3 + 2] = 255;
}

function setPixel(x, y, r, g, b) {
  if (x < 0 || x >= imgW || y < 0 || y >= imgH) return;
  const o = (y * imgW + x) * 3;
  imgBuf[o] = r; imgBuf[o + 1] = g; imgBuf[o + 2] = b;
}

function fillRect(x0, y0, w, h, r, g, b) {
  for (let dy = 0; dy < h; dy++) for (let dx = 0; dx < w; dx++) setPixel(x0+dx, y0+dy, r, g, b);
}

function drawTileScaled(src, offset, flipH, flipV, palette, ox, oy) {
  const px = decodeTileFromBytes(src, offset, flipH, flipV);
  for (let row = 0; row < 8; row++) {
    for (let col = 0; col < 8; col++) {
      const ci = px[row * 8 + col];
      if (ci === 0) continue; // transparent → leave black/bg
      const [r, g, b] = nesRGB(palette[ci]);
      for (let sy = 0; sy < SCALE; sy++)
        for (let sx = 0; sx < SCALE; sx++)
          setPixel(ox + col * SCALE + sx, oy + row * SCALE + sy, r, g, b);
    }
  }
}

// 2px white border
function drawBorder(cellX, cellY, cw, ch) {
  for (let bx = cellX - BORDER; bx <= cellX + cw + BORDER - 1; bx++) {
    for (let t = 0; t < BORDER; t++) {
      setPixel(bx, cellY - BORDER + t,       255, 255, 255);
      setPixel(bx, cellY + ch + t,            255, 255, 255);
    }
  }
  for (let by = cellY - BORDER; by <= cellY + ch + BORDER - 1; by++) {
    for (let t = 0; t < BORDER; t++) {
      setPixel(cellX - BORDER + t, by,          255, 255, 255);
      setPixel(cellX + cw + t,     by,          255, 255, 255);
    }
  }
}

// Tiny 3×5 pixel font
const FONT = {
  "0":[1,1,1,1,0,1,1,0,1,1,0,1,1,1,1],"1":[0,1,0,1,1,0,0,1,0,0,1,0,1,1,1],
  "2":[1,1,1,0,0,1,1,1,1,1,0,0,1,1,1],"3":[1,1,1,0,0,1,0,1,1,0,0,1,1,1,1],
  "4":[1,0,1,1,0,1,1,1,1,0,0,1,0,0,1],"5":[1,1,1,1,0,0,1,1,1,0,0,1,1,1,1],
  "6":[1,1,0,1,0,0,1,1,1,1,0,1,1,1,1],"7":[1,1,1,0,0,1,0,1,0,0,1,0,0,1,0],
  "8":[1,1,1,1,0,1,1,1,1,1,0,1,1,1,1],"9":[1,1,1,1,0,1,1,1,1,0,0,1,1,1,1],
  "a":[0,1,0,1,0,1,1,1,1,1,0,1,1,0,1],"b":[1,1,0,1,0,1,1,1,0,1,0,1,1,1,0],
  "c":[0,1,1,1,0,0,1,0,0,1,0,0,0,1,1],"d":[1,1,0,1,0,1,1,0,1,1,0,1,1,1,0],
  "e":[1,1,1,1,0,0,1,1,0,1,0,0,1,1,1],"f":[1,1,1,1,0,0,1,1,0,1,0,0,1,0,0],
  "x":[0,0,0,1,0,1,0,1,0,1,0,1,0,0,0],"/":[0,0,1,0,1,0,0,1,0,1,0,0,1,0,0],
  " ":[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],"-":[0,0,0,0,0,0,1,1,1,0,0,0,0,0,0],
  "t":[1,1,1,0,1,0,0,1,0,0,1,0,0,1,0],"y":[1,0,1,1,0,1,0,1,0,0,1,0,1,1,0],
  "p":[1,1,0,1,0,1,1,1,0,1,0,0,1,0,0],"r":[0,0,0,1,1,0,1,0,0,1,0,0,1,0,0],
};

function drawText(x0, y0, text, r = 255, g = 255, b = 200) {
  let cx = x0;
  for (const ch of text.toLowerCase()) {
    const glyph = FONT[ch];
    if (!glyph) { cx += 4; continue; }
    for (let row = 0; row < 5; row++)
      for (let col = 0; col < 3; col++)
        if (glyph[row * 3 + col]) setPixel(cx + col, y0 + row, r, g, b);
    cx += 4;
  }
}

// ── Render sprites ────────────────────────────────────────────────────────────

const manifestEntities = [];
let curY = MARGIN;

for (let ei = 0; ei < sortedGroups.length; ei++) {
  const { frames, cellW, cellH, frameSlotW, framesPerRow, nRows, rowH } = entityLayouts[ei];
  const entityFrameManifest = [];

  for (let fi = 0; fi < frames.length; fi++) {
    const si    = frames[fi];
    const gridC = fi % framesPerRow;
    const gridR = Math.floor(fi / framesPerRow);

    const cellX = MARGIN + LEFT_LABEL_W + BORDER + gridC * frameSlotW;
    const cellY = curY   + BORDER + gridR * (rowH + ROW_GAP);

    // Black background inside cell
    fillRect(cellX, cellY, cellW, cellH, 0, 0, 0);
    drawBorder(cellX, cellY, cellW, cellH);

    const state    = allStates[si];
    const vram     = isChrRAM ? (state.vram ?? renderVRAM) : renderVRAM;
    const palettes = state.palettes ?? baselinePalettes;

    if (state.oam.length === 0) continue;

    // Anchor to entity (non-constant) sprite bounding box
    const entitySprs = state.oam.filter(e => !constantTiles.has(e.tile));
    const anchorSrc  = entitySprs.length > 0 ? entitySprs : state.oam;
    const minX = Math.min(...anchorSrc.map(e => e.x));
    const minY = Math.min(...anchorSrc.map(e => e.y + 1));

    const frameManifest = {
      source_address: h16(state.address),
      source_value:   state.value,
      oam_entries:    [],
    };

    for (const spr of state.oam) {
      const flipH  = !!(spr.attr & 0x40);
      const flipV  = !!(spr.attr & 0x80);
      const palIdx = spr.attr & 0x03;
      const pal    = palettes.sprite[palIdx] ?? [0, 0, 0, 0];
      const addrs  = getSpriteAddrs(spr.tile, renderBank);
      const rx     = spr.x - minX;
      const ry     = (spr.y + 1) - minY;

      for (const { vramAddr, romAddr, tileY } of addrs) {
        let tileSrc, tileOff;
        if (chrRomData && romAddr >= 0 && romAddr + 16 <= chrRomData.length) {
          tileSrc = chrRomData; tileOff = romAddr;
        } else {
          tileSrc = vram; tileOff = vramAddr;
        }
        drawTileScaled(tileSrc, tileOff, flipH, flipV, pal,
          cellX + rx * SCALE, cellY + (ry + tileY) * SCALE);
      }

      frameManifest.oam_entries.push({
        tile_index: spr.tile,
        rel_x: rx, rel_y: ry,
        flip_h: flipH, flip_v: flipV,
        palette: palIdx,
      });
    }

    entityFrameManifest.push(frameManifest);
  }

  // Left row label: address + frame count
  const addrLabel = allStates[frames[0]]?.address ?? 0;
  const labelText = `${h16(addrLabel)} ${frames.length}f`;
  drawText(MARGIN, curY + BORDER + Math.floor(cellH / 2) - 3, labelText);

  manifestEntities.push({
    id:     ei,
    source_address: h16(addrLabel),
    player: isPlayerGroup(sortedGroups[ei]),
    frames: entityFrameManifest,
  });

  curY += entityLayouts[ei].nRows * (rowH + ROW_GAP);
}

// ── BG tile section ───────────────────────────────────────────────────────────

const bgSectionY = curY + 20;
drawText(MARGIN, bgSectionY - 12, "bg tiles", 200, 200, 255);

const bgPalettes = baselinePalettes.bg;
const bgRenderBank = baselineBGBank;

let bgTileX = MARGIN;
let bgTileY = bgSectionY;
let bgCol   = 0;

for (const tileIdx of bgTileArr) {
  const vramAddr = bgRenderBank + tileIdx * 16;
  const romAddr  = bgRenderBank + tileIdx * 16;
  let tileSrc, tileOff;
  if (chrRomData && romAddr >= 0 && romAddr + 16 <= chrRomData.length) {
    tileSrc = chrRomData; tileOff = romAddr;
  } else {
    tileSrc = renderVRAM; tileOff = vramAddr;
  }

  fillRect(bgTileX, bgTileY, BG_TILE_PX, BG_TILE_PX, 0, 0, 0);
  drawTileScaled(tileSrc, tileOff, false, false, bgPalettes[0] ?? [0,0,0,0], bgTileX, bgTileY);

  bgCol++;
  bgTileX += BG_TILE_PX + 2;
  if (bgCol >= BG_COLS) {
    bgCol = 0;
    bgTileX = MARGIN;
    bgTileY += BG_TILE_PX + 2;
  }
}

// ── Save PNG ──────────────────────────────────────────────────────────────────

const pngPath = path.join(outDir, `${romName}-sprites.png`);
await sharp(imgBuf, { raw: { width: imgW, height: imgH, channels: 3 } }).png().toFile(pngPath);
console.log(`  PNG saved: ${pngPath}`);

// ═══════════════════════════════════════════════════════════════════════════════
// PHASE 7: Manifest + Coverage Report
// ═══════════════════════════════════════════════════════════════════════════════

const manifest = {
  game:           romName,
  rom:            path.basename(romPath),
  chr_type:       isChrRAM ? "CHR-RAM" : "CHR-ROM",
  sprite_bank:    renderBank !== null ? h16(renderBank) : "8x16",
  bg_bank:        h16(baselineBGBank),
  ppuctrl_max:    h8(gameplayPPUCTRL),
  snapshot_count: snapshots.length,
  unique_states:  allStates.length,
  entity_groups:  sortedGroups.length,
  entities:       manifestEntities,
};

const jsonPath = path.join(outDir, `${romName}-sprites.json`);
fs.writeFileSync(jsonPath, JSON.stringify(manifest, null, 2));
console.log(`  JSON saved: ${jsonPath}`);

// ── Coverage ──────────────────────────────────────────────────────────────────

function isTileBlank(bankOffset, tileIdx) {
  const off = bankOffset + tileIdx * 16;
  const src = chrRomData ?? renderVRAM;
  for (let b = 0; b < 16; b++) if (src[off + b]) return false;
  return true;
}

const spriteTilesUsed = new Set(allStates.flatMap(s => s.oam.map(e => e.tile)));

console.log("\n═══ Coverage Report ═══");

if (!isChrRAM) {
  const sprBank = renderBank ?? 0x0000;
  const bgBank  = baselineBGBank;

  let sprBlank = 0, sprFound = 0, sprMissed = 0;
  const sprMissedList = [];
  for (let t = 0; t < 256; t++) {
    if (isTileBlank(sprBank, t)) { sprBlank++; continue; }
    if (spriteTilesUsed.has(t)) sprFound++;
    else { sprMissed++; sprMissedList.push(t); }
  }
  const sprNB  = 256 - sprBlank;
  const sprPct = sprNB > 0 ? ((sprFound / sprNB) * 100).toFixed(1) : "n/a";
  console.log(`\n  Sprite bank ${h16(sprBank)}: ${sprFound}/${sprNB} non-blank (${sprPct}%)`);
  if (sprMissed > 0 && sprMissed <= 100)
    console.log(`    Missed: ${sprMissedList.map(h8).join(", ")}`);

  let bgBlank = 0, bgFound = 0, bgMissed = 0;
  const bgMissedList = [];
  for (let t = 0; t < 256; t++) {
    if (isTileBlank(bgBank, t)) { bgBlank++; continue; }
    if (allBGTiles.has(t)) bgFound++;
    else { bgMissed++; bgMissedList.push(t); }
  }
  const bgNB  = 256 - bgBlank;
  const bgPct = bgNB > 0 ? ((bgFound / bgNB) * 100).toFixed(1) : "n/a";
  console.log(`\n  BG bank ${h16(bgBank)}: ${bgFound}/${bgNB} non-blank (${bgPct}%)`);
  if (bgMissed > 0 && bgMissed <= 100)
    console.log(`    Missed: ${bgMissedList.map(h8).join(", ")}`);

  const totalNB  = sprNB + bgNB;
  const totalFnd = sprFound + bgFound;
  const totPct   = totalNB > 0 ? ((totalFnd / totalNB) * 100).toFixed(1) : "n/a";
  console.log(`\n  TOTAL: ${totalFnd}/${totalNB} non-blank tiles (${totPct}%)`);
}

// ── Final summary ─────────────────────────────────────────────────────────────

console.log("\n═══════════════════════════════════════════════════════════");
console.log("UNIVERSAL SPRITE EXTRACTOR v3 — COMPLETE");
console.log("═══════════════════════════════════════════════════════════");
console.log(`Game:          ${romName}`);
console.log(`Snapshots:     ${snapshots.length}`);
console.log(`Unique states: ${allStates.length}`);
console.log(`Entity groups: ${sortedGroups.length}`);
console.log(`PNG:           ${pngPath}`);
console.log(`JSON:          ${jsonPath}`);
console.log("═══════════════════════════════════════════════════════════");
