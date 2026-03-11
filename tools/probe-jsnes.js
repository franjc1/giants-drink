/**
 * jsnes internals probe — answers critical unknowns before building the extractor.
 *
 * Questions:
 *   1. CPU mem size: 64KB address space or just 2KB RAM?
 *   2. PPU register reads via cpu.mem[0x2000-0x2007]: safe or side effects?
 *   3. APU register access: cpu.mem[0x4015] or separate nes.apu object?
 *   4. PPU property names for PPUCTRL flags
 *   5. toJSON/fromJSON survives mutation (write RAM, restore, verify rollback)
 *   6. RAM mirror: are addresses 0x0800/0x1000/0x1800 mirrors of 0x0000?
 */

import { NES, Controller } from "jsnes";
import { readFileSync } from "fs";
import { homedir } from "os";

const ROM_PATH = `${homedir()}/nes-roms/Super Mario Bros. (World).nes`;

function makeNES() {
  return new NES({ onFrame: () => {}, emulateSound: false, onStatusUpdate: () => {} });
}

// Boot to gameplay (same sequence as validation test)
function bootToGameplay(nes) {
  for (let i = 0; i < 60; i++) nes.frame();
  nes.buttonDown(1, Controller.BUTTON_START); nes.frame(); nes.buttonUp(1, Controller.BUTTON_START);
  for (let i = 0; i < 59; i++) nes.frame();
  nes.buttonDown(1, Controller.BUTTON_START); nes.frame(); nes.buttonUp(1, Controller.BUTTON_START);
  for (let i = 0; i < 180; i++) nes.frame();
}

const romData = readFileSync(ROM_PATH, { encoding: "binary" });
const nes = makeNES();
nes.loadROM(romData);
bootToGameplay(nes);

console.log("=== jsnes internals probe ===\n");

// ── 1. CPU mem size ──────────────────────────────────────────────────────────
console.log("── 1. CPU mem size ──");
console.log(`  nes.cpu.mem.length = ${nes.cpu.mem.length}`);
console.log(`  (expect 65536 for full NES address space)\n`);

// ── 2. PPU register reads via cpu.mem ────────────────────────────────────────
console.log("── 2. PPU register reads via cpu.mem[0x2000..0x2007] ──");
// NES PPU regs: reading 0x2002 resets vblank flag — this is a side effect.
// We want to know if jsnes routes cpu.mem[] reads through the bus (side effects)
// or if it's a plain array read (safe).
// Strategy: read PPUSTATUS (0x2002) twice. If vblank flag (bit 7) resets on first
// read (returning 0 on second), that means bus routing is in effect.
const ppuStatus1 = nes.cpu.mem[0x2002];
const ppuStatus2 = nes.cpu.mem[0x2002];
console.log(`  cpu.mem[0x2002] read #1 = 0x${ppuStatus1.toString(16).padStart(2, "0")}`);
console.log(`  cpu.mem[0x2002] read #2 = 0x${ppuStatus2.toString(16).padStart(2, "0")}`);
if (ppuStatus1 !== ppuStatus2) {
  console.log(`  ⚠️  Values differ — bus routing active, reads have side effects!`);
  console.log(`  ⚠️  DO NOT read PPU regs via cpu.mem in extraction code.`);
} else {
  console.log(`  ✓  Values identical — plain array read, no side effects.`);
}
// Also check: does cpu.mem[0x2000-0x2007] return anything meaningful?
console.log(`  cpu.mem[0x2000] (PPUCTRL)  = 0x${nes.cpu.mem[0x2000].toString(16).padStart(2, "0")}`);
console.log(`  cpu.mem[0x2006] (PPUADDR)  = 0x${nes.cpu.mem[0x2006].toString(16).padStart(2, "0")}`);
console.log(`  cpu.mem[0x2007] (PPUDATA)  = 0x${nes.cpu.mem[0x2007].toString(16).padStart(2, "0")}\n`);

// ── 3. APU register access ───────────────────────────────────────────────────
console.log("── 3. APU register access ──");
console.log(`  nes.papu exists: ${typeof nes.papu !== "undefined"}`);
if (nes.papu) {
  const papuKeys = Object.keys(nes.papu).filter(k => !k.startsWith("_") && typeof nes.papu[k] !== "function");
  console.log(`  nes.papu data keys: ${papuKeys.slice(0, 20).join(", ")}`);
}
console.log(`  nes.apu exists: ${typeof nes.apu !== "undefined"}`);
const apuStatus = nes.cpu.mem[0x4015];
console.log(`  cpu.mem[0x4015] (APU STATUS) = 0x${apuStatus.toString(16).padStart(2, "0")}`);
// Check APU via cpu.mem reads - try a few APU regs
for (const addr of [0x4000, 0x4004, 0x400C, 0x4015]) {
  console.log(`  cpu.mem[0x${addr.toString(16)}] = 0x${nes.cpu.mem[addr].toString(16).padStart(2, "0")}`);
}
console.log();

// ── 4. PPU property names for PPUCTRL flags ──────────────────────────────────
console.log("── 4. PPU property names (PPUCTRL / PPUMASK flags) ──");
const ppuKeys = Object.keys(nes.ppu).filter(k => {
  const v = nes.ppu[k];
  return typeof v === "number" || typeof v === "boolean";
});
console.log(`  Numeric/bool PPU properties:`);
// Look for pattern table flags specifically
const patternKeys = ppuKeys.filter(k =>
  k.toLowerCase().includes("pattern") ||
  k.toLowerCase().includes("ctrl") ||
  k.toLowerCase().includes("mask") ||
  k.toLowerCase().includes("bg") ||
  k.toLowerCase().includes("sp") ||
  k.toLowerCase().includes("table") ||
  k.toLowerCase().includes("f_")
);
if (patternKeys.length > 0) {
  for (const k of patternKeys) {
    console.log(`    ${k} = ${nes.ppu[k]}`);
  }
} else {
  // Print all numeric properties, limited to first 40
  for (const k of ppuKeys.slice(0, 40)) {
    console.log(`    ${k} = ${nes.ppu[k]}`);
  }
}
console.log();

// ── 5. toJSON/fromJSON mutation test ─────────────────────────────────────────
console.log("── 5. toJSON/fromJSON mutation test ──");
const xBefore = nes.cpu.mem[0x0086]; // Mario X
console.log(`  X before save: ${xBefore}`);
const savedState = nes.toJSON();
// Mutate RAM
nes.cpu.mem[0x0000] = 0x42;
nes.cpu.mem[0x0086] = 0xFF;
console.log(`  After mutation: mem[0x0000]=${nes.cpu.mem[0x0000]}, mem[0x0086]=${nes.cpu.mem[0x0086]}`);
// Restore
nes.fromJSON(savedState);
const mem0000After = nes.cpu.mem[0x0000];
const xAfter = nes.cpu.mem[0x0086];
console.log(`  After restore:  mem[0x0000]=${mem0000After} (expect ≠ 0x42), mem[0x0086]=${xAfter} (expect ${xBefore})`);
console.log(
  xAfter === xBefore && mem0000After !== 0x42
    ? `  ✓  Restore works correctly`
    : `  ✗  Restore failed`
);
console.log();

// ── 6. RAM mirror check ───────────────────────────────────────────────────────
console.log("── 6. NES RAM mirror check ──");
// NES mirrors 0x0000-0x07FF at 0x0800, 0x1000, 0x1800
// Does jsnes cpu.mem[] implement those mirrors?
nes.cpu.mem[0x0000] = 0xAB;
const m0000 = nes.cpu.mem[0x0000];
const m0800 = nes.cpu.mem[0x0800];
const m1000 = nes.cpu.mem[0x1000];
const m1800 = nes.cpu.mem[0x1800];
console.log(`  mem[0x0000] = 0x${m0000.toString(16)} (written 0xAB)`);
console.log(`  mem[0x0800] = 0x${m0800.toString(16)} (mirror of 0x0000? ${m0800 === 0xAB ? "YES" : "NO"})`);
console.log(`  mem[0x1000] = 0x${m1000.toString(16)} (mirror of 0x0000? ${m1000 === 0xAB ? "YES" : "NO"})`);
console.log(`  mem[0x1800] = 0x${m1800.toString(16)} (mirror of 0x0000? ${m1800 === 0xAB ? "YES" : "NO"})`);
const mirrorsActive = m0800 === 0xAB;
console.log(`  → RAM mirrors in cpu.mem[]: ${mirrorsActive ? "ACTIVE (iterate 0-0x7FF for unique bytes)" : "NOT active (iterate 0-0x1FFF or check separately)"}`);
console.log();

// ── 7. Full PPU object key dump ───────────────────────────────────────────────
console.log("── 7. All PPU scalar properties (full dump) ──");
for (const k of ppuKeys) {
  console.log(`  ppu.${k} = ${nes.ppu[k]}`);
}
console.log();

// ── 8. RAM content at known addresses ─────────────────────────────────────────
console.log("── 8. RAM snapshot at known SMB addresses ──");
// Restore state first (we wrote 0xAB to 0x0000 above)
nes.fromJSON(savedState);
for (const [label, addr] of [
  ["Mario X ($0086)", 0x0086],
  ["Mario Y ($00CE)", 0x00CE],
  ["World  ($075C)", 0x075C],
  ["Level  ($075F)", 0x075F],
  ["Lives  ($075A)", 0x075A],
]) {
  const v = nes.cpu.mem[addr];
  console.log(`  ${label} = ${v} (0x${v.toString(16).padStart(2, "0")})`);
}

console.log("\n=== probe complete ===");
