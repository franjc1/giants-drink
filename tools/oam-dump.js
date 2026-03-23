#!/usr/bin/env node
/**
 * oam-dump.js
 *
 * Raw OAM dump for Big Mario across 5 states.
 * No analysis — just bytes.
 */

import { NES, Controller } from "jsnes";
import fs   from "fs";
import path from "path";
import { homedir }        from "os";
import { fileURLToPath }  from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const OUT_DIR   = path.join(__dirname, "..", "experiment-output");

// ── ROM ───────────────────────────────────────────────────────────────────────
const romsDir = path.join(homedir(), "nes-roms");
const romFile = fs.readdirSync(romsDir).find(
  f => f.includes("Super Mario Bros") && !f.includes("2") && !f.includes("3")
    && !f.includes("Lost") && !f.includes("+") && f.endsWith(".nes")
);
if (!romFile) { console.error("SMB ROM not found"); process.exit(1); }
const romBuf = fs.readFileSync(path.join(romsDir, romFile));
const romStr = romBuf.toString("binary");
console.log(`ROM: ${romFile}\n`);

// ── jsnes ─────────────────────────────────────────────────────────────────────
function makeNES() {
  return new NES({
    onFrame: () => {}, onAudioSample: null,
    onStatusUpdate: () => {}, emulateSound: false,
  });
}

const R     = Controller.BUTTON_RIGHT;
const L     = Controller.BUTTON_LEFT;
const A     = Controller.BUTTON_A;
const START = Controller.BUTTON_START;

// ── Print OAM ─────────────────────────────────────────────────────────────────
function printOAM(nes, label) {
  const cpu = nes.cpu.mem;
  console.log(`\n=== ${label} ===`);
  console.log(`  $0754 PlayerSize      = ${cpu[0x0754]}   (0=small, 1=big)`);
  console.log(`  $0756 PlayerStatus    = ${cpu[0x0756]}   (0=normal, 1=super, 2=fire)`);
  console.log(`  $070D PlayerAnimCtrl  = ${cpu[0x070D]}   (animation frame counter)`);
  console.log(`  $06D5 PlayerGfxOffset = 0x${cpu[0x06D5].toString(16).padStart(2,"0")}  (sprite tile base offset)`);
  console.log();
  console.log("  OAM entries with Y < 240:");
  console.log("  slot  Y(raw)  tile(hex)  attr(hex)  X");
  let count = 0;
  for (let i = 0; i < 64; i++) {
    const base   = 0x0200 + i * 4;
    const oam_y  = cpu[base];
    const oam_t  = cpu[base + 1];
    const oam_a  = cpu[base + 2];
    const oam_x  = cpu[base + 3];
    const screenY = oam_y + 1;
    if (screenY >= 240) continue;
    console.log(
      `  [${i.toString().padStart(2)}]  ` +
      `${oam_y.toString().padStart(3)} (Y+1=${screenY.toString().padStart(3)})  ` +
      `tile=0x${oam_t.toString(16).padStart(2,"0")}  ` +
      `attr=0x${oam_a.toString(16).padStart(2,"0")}  ` +
      `X=${oam_x.toString().padStart(3)}`
    );
    count++;
  }
  console.log(`  (${count} visible entries)`);
}

// ── Boot to Big Mario in W1-1 ─────────────────────────────────────────────────
function bootToBigMario() {
  console.log("Booting SMB to Big Mario...");
  const nes = makeNES();
  nes.loadROM(romStr);

  // Press Start through title + mode select
  nes.buttonDown(1, START);
  for (let i = 0; i < 120; i++) nes.frame();
  nes.buttonUp(1, START);

  nes.buttonDown(1, START);
  for (let i = 0; i < 60; i++) nes.frame();
  nes.buttonUp(1, START);

  // Level intro
  for (let i = 0; i < 160; i++) nes.frame();

  // Walk right into gameplay
  nes.buttonDown(1, R);
  for (let i = 0; i < 80; i++) nes.frame();
  nes.buttonUp(1, R);
  for (let i = 0; i < 10; i++) nes.frame();

  // Force Big Mario via memory write (same as collecting mushroom)
  nes.cpu.mem[0x0754] = 1;  // 1 = big
  nes.cpu.mem[0x0756] = 0;  // 0 = normal (not fire)

  // Let game react (update sprite layout)
  for (let i = 0; i < 16; i++) nes.frame();

  console.log(`  After boot: PlayerSize=${nes.cpu.mem[0x0754]}  PlayerStatus=${nes.cpu.mem[0x0756]}`);
  console.log(`  Player X=$${nes.cpu.mem[0x0086].toString(16)}  Y=$${nes.cpu.mem[0x00CE].toString(16)}\n`);
  return nes;
}

// ── Save/restore state ────────────────────────────────────────────────────────
function saveState(nes)    { return JSON.stringify(nes.toJSON()); }
function restoreState(str) {
  const nes = makeNES();
  nes.loadROM(romStr);
  nes.fromJSON(JSON.parse(str));
  return nes;
}

// ═══════════════════════════════════════════════════════════════════════════════
// MAIN
// ═══════════════════════════════════════════════════════════════════════════════

const baseNES = bootToBigMario();
const base    = saveState(baseNES);

// STATE 1 — Standing still
{
  const nes = restoreState(base);
  for (let i = 0; i < 30; i++) nes.frame();
  printOAM(nes, "STATE 1 — Standing still (30 frames idle)");
}

// STATE 2 — Walking right
{
  const nes = restoreState(base);
  nes.buttonDown(1, R);
  for (let i = 0; i < 30; i++) nes.frame();
  nes.buttonUp(1, R);
  printOAM(nes, "STATE 2 — Walking right (30 frames hold-R)");
}

// Multiple walk-right animation frames (sample at different points)
{
  const nes = restoreState(base);
  nes.buttonDown(1, R);
  for (let i = 0; i < 30; i++) {
    nes.frame();
    if (i === 8 || i === 16 || i === 24) {
      const cpu = nes.cpu.mem;
      const tiles = [];
      for (let s = 0; s < 64; s++) {
        const b = 0x0200 + s * 4;
        if (cpu[b] + 1 < 240) tiles.push(`0x${cpu[b+1].toString(16).padStart(2,"0")}`);
      }
      console.log(`  [walk-R frame ${i}] tiles: ${tiles.join(" ")}`);
    }
  }
  nes.buttonUp(1, R);
}

// STATE 3 — Jumping (near apex)
{
  const nes = restoreState(base);
  // Run right briefly to have momentum (avoids standing jump quirks)
  nes.buttonDown(1, R);
  for (let i = 0; i < 10; i++) nes.frame();
  // Press A for 5 frames
  nes.buttonDown(1, A);
  for (let i = 0; i < 5; i++) nes.frame();
  nes.buttonUp(1, A);
  // Wait 15 frames (near apex)
  for (let i = 0; i < 15; i++) nes.frame();
  nes.buttonUp(1, R);
  printOAM(nes, "STATE 3 — Jumping near apex (A held 5f, wait 15f)");
}

// More jump frames
{
  const nes = restoreState(base);
  nes.buttonDown(1, R);
  for (let i = 0; i < 10; i++) nes.frame();
  nes.buttonDown(1, A);
  for (let jf = 0; jf < 30; jf++) {
    if (jf === 5) nes.buttonUp(1, A);
    nes.frame();
    if (jf === 5 || jf === 10 || jf === 15 || jf === 20 || jf === 25) {
      const cpu = nes.cpu.mem;
      const tiles = [];
      for (let s = 0; s < 64; s++) {
        const b = 0x0200 + s * 4;
        if (cpu[b] + 1 < 240) tiles.push(`0x${cpu[b+1].toString(16).padStart(2,"0")}`);
      }
      console.log(`  [jump frame ${jf}] $070D=${cpu[0x070D]} $06D5=0x${cpu[0x06D5].toString(16)} tiles: ${tiles.join(" ")}`);
    }
  }
  nes.buttonUp(1, R);
}

// STATE 4 — Walking left
{
  const nes = restoreState(base);
  nes.buttonDown(1, L);
  for (let i = 0; i < 30; i++) nes.frame();
  nes.buttonUp(1, L);
  printOAM(nes, "STATE 4 — Walking left (30 frames hold-L)");
}

// Multiple walk-left frames
{
  const nes = restoreState(base);
  nes.buttonDown(1, L);
  for (let i = 0; i < 30; i++) {
    nes.frame();
    if (i === 8 || i === 16 || i === 24) {
      const cpu = nes.cpu.mem;
      const tiles = [];
      for (let s = 0; s < 64; s++) {
        const b = 0x0200 + s * 4;
        if (cpu[b] + 1 < 240) tiles.push(`0x${cpu[b+1].toString(16).padStart(2,"0")}`);
      }
      console.log(`  [walk-L frame ${i}] tiles: ${tiles.join(" ")}`);
    }
  }
  nes.buttonUp(1, L);
}

// STATE 5 — Skidding (hold Right 30f, then Left 5f)
{
  const nes = restoreState(base);
  nes.buttonDown(1, R);
  for (let i = 0; i < 30; i++) nes.frame();
  nes.buttonUp(1, R);
  nes.buttonDown(1, L);
  for (let i = 0; i < 5; i++) nes.frame();
  printOAM(nes, "STATE 5 — Skidding (R×30 then L×5)");
  nes.buttonUp(1, L);
}

// ── Tilemap comparison ────────────────────────────────────────────────────────
console.log("\n\n=== TILEMAP-V2 CONTENTS ===");
const tilemapPath = path.join(OUT_DIR, "mario-flux-tilemap-v2.json");
const tilemap = JSON.parse(fs.readFileSync(tilemapPath, "utf8"));
const tilemapIndices = new Set(tilemap.tiles.map(t => t.chr_tile_idx));
const sortedIndices  = [...tilemapIndices].sort((a,b) => a - b);
console.log(`\nTotal tiles in tilemap: ${tilemap.tiles.length} entries, ${tilemapIndices.size} unique indices`);
console.log(`\nAll indices in tilemap-v2.json:`);
sortedIndices.forEach(i => {
  const entries = tilemap.tiles.filter(t => t.chr_tile_idx === i);
  const types   = [...new Set(entries.map(t => t.mario_type))].join("+");
  console.log(`  0x${i.toString(16).padStart(2,"0")} (${i}) — ${types}`);
});

// ── Collect ALL tiles seen across all 5 states ────────────────────────────────
console.log("\n\n=== CROSS-STATE TILE COLLECTION ===");
const allStates = [
  { label: "stand",   run: nes => { for(let i=0;i<30;i++) nes.frame(); } },
  { label: "walk-R",  run: nes => { nes.buttonDown(1,R); for(let i=0;i<30;i++) nes.frame(); nes.buttonUp(1,R); } },
  { label: "jump",    run: nes => {
    nes.buttonDown(1,R); for(let i=0;i<10;i++) nes.frame();
    nes.buttonDown(1,A); for(let i=0;i<5;i++) nes.frame(); nes.buttonUp(1,A);
    for(let i=0;i<15;i++) nes.frame(); nes.buttonUp(1,R);
  }},
  { label: "walk-L",  run: nes => { nes.buttonDown(1,L); for(let i=0;i<30;i++) nes.frame(); nes.buttonUp(1,L); } },
  { label: "skid",    run: nes => {
    nes.buttonDown(1,R); for(let i=0;i<30;i++) nes.frame(); nes.buttonUp(1,R);
    nes.buttonDown(1,L); for(let i=0;i<5;i++) nes.frame(); nes.buttonUp(1,L);
  }},
];

const seenByState = {};
for (const s of allStates) {
  const nes = restoreState(base);
  s.run(nes);
  const seen = new Set();
  const cpu  = nes.cpu.mem;
  for (let i = 0; i < 64; i++) {
    const b = 0x0200 + i * 4;
    if (cpu[b] + 1 < 240) seen.add(cpu[b+1]);
  }
  seenByState[s.label] = seen;
}

const allSeen = new Set([...Object.values(seenByState)].flatMap(s => [...s]));
console.log(`\nAll tile indices seen across all 5 states: ${[...allSeen].sort((a,b)=>a-b).map(i=>"0x"+i.toString(16).padStart(2,"0")).join(", ")}`);

for (const [label, seen] of Object.entries(seenByState)) {
  const arr = [...seen].sort((a,b)=>a-b).map(i=>"0x"+i.toString(16).padStart(2,"0"));
  console.log(`  ${label.padEnd(8)}: ${arr.join(" ")}`);
}

console.log("\n── In tilemap? ──────────────────────────────────────────");
for (const tile of [...allSeen].sort((a,b)=>a-b)) {
  const inMap = tilemapIndices.has(tile);
  console.log(`  0x${tile.toString(16).padStart(2,"0")}  ${inMap ? "YES — in tilemap" : "NO  — MISSING from tilemap"}`);
}

const missing = [...allSeen].filter(t => !tilemapIndices.has(t));
const extra   = [...tilemapIndices].filter(t => !allSeen.has(t));
console.log(`\nMissing from tilemap (in OAM but NOT in tilemap): ${missing.length}`);
missing.forEach(t => console.log(`  0x${t.toString(16).padStart(2,"0")} (${t})`));
console.log(`\nExtra in tilemap (in tilemap but NOT seen in OAM): ${extra.length}`);
extra.forEach(t => console.log(`  0x${t.toString(16).padStart(2,"0")} (${t})`));
