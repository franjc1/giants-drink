/**
 * jsnes validation test — confirms NES emulator works for extraction pipeline.
 *
 * Tests:
 *   1. ROM loads and emulator boots without crash
 *   2. Start button input gets past title screen (Mario appears)
 *   3. Hold Right 30 frames → Mario X increases
 *   4. Hold A 30 frames → Mario Y changes (jump)
 *
 * RAM addresses (SMB1):
 *   0x0086 = Mario world X (pixels)
 *   0x00CE = Mario screen Y (pixels)
 */

import { NES, Controller } from "jsnes";
import { readFileSync } from "fs";
import { homedir } from "os";

const ROM_PATH = `${homedir()}/nes-roms/Super Mario Bros. (World).nes`;

// ─── helpers ────────────────────────────────────────────────────────────────

function makeNES() {
  return new NES({
    onFrame: () => {},
    onAudioSample: null,
    onStatusUpdate: () => {},
    emulateSound: false,
  });
}

/** Step N frames with no input held (clear any previously pressed buttons). */
function stepFrames(nes, n) {
  for (let i = 0; i < n; i++) nes.frame();
}

/** Hold a button for N frames, release, return. */
function holdButton(nes, btn, n) {
  nes.buttonDown(1, btn);
  for (let i = 0; i < n; i++) nes.frame();
  nes.buttonUp(1, btn);
}

/** Tap a button for 1 frame. */
function tap(nes, btn) {
  holdButton(nes, btn, 1);
}

function readRAM(nes, addr) {
  return nes.cpu.mem[addr & 0x7ff];
}

function readRAMFull(nes, addr) {
  // Page 1 ($0100–$01FF) is also internal RAM, accessible at mem[addr]
  return nes.cpu.mem[addr];
}

function dumpOAM(nes) {
  const oam = nes.ppu.spriteMem;
  const sprites = [];
  for (let i = 0; i < 64; i++) {
    const y = oam[i * 4 + 0];
    const tile = oam[i * 4 + 1];
    const attr = oam[i * 4 + 2];
    const x = oam[i * 4 + 3];
    if (y < 0xef) sprites.push({ slot: i, x, y, tile, attr });
  }
  return sprites;
}

// ─── main ───────────────────────────────────────────────────────────────────

console.log("=== jsnes validation test ===\n");

// 1. Load ROM
console.log(`Loading ROM: ${ROM_PATH}`);
const romData = readFileSync(ROM_PATH, { encoding: "binary" });
console.log(`ROM size: ${romData.length} bytes`);

const nes = makeNES();
nes.loadROM(romData);
console.log("ROM loaded OK\n");

// 2. Boot to gameplay
// SMB title screen: wait ~180 frames, press Start, wait for game to begin
console.log("Booting to gameplay (300 frames + Start presses)...");
stepFrames(nes, 60);

// Press Start at frame 60
console.log("  frame 60: pressing Start");
tap(nes, Controller.BUTTON_START);
stepFrames(nes, 59);

// Press Start again at frame 120
console.log("  frame 120: pressing Start");
tap(nes, Controller.BUTTON_START);
stepFrames(nes, 180); // settle to frame 300

let x0 = readRAM(nes, 0x0086);
let y0 = readRAM(nes, 0x00CE);
console.log(`\nFrame ~300 RAM snapshot:`);
console.log(`  Mario X ($0086) = ${x0} (0x${x0.toString(16).padStart(2, "0")})`);
console.log(`  Mario Y ($00CE) = ${y0} (0x${y0.toString(16).padStart(2, "0")})`);

// Check Mario is on screen (non-zero, reasonable values)
const marioOnScreen = x0 > 0 && y0 > 0 && y0 < 240;
console.log(`  Mario on screen: ${marioOnScreen ? "YES ✓" : "NO (may still be on title)"}`);

// Show active OAM sprites
const sprites = dumpOAM(nes);
console.log(`  Active OAM sprites: ${sprites.length}`);
if (sprites.length > 0) {
  console.log(`  First 5:`, sprites.slice(0, 5));
}

// 3. Hold Right for 30 frames → X should increase
console.log("\n--- Test: Hold Right 30 frames ---");
let xBefore = readRAM(nes, 0x0086);
let yBefore = readRAM(nes, 0x00CE);
console.log(`  Before: X=${xBefore} Y=${yBefore}`);

// Print X every 5 frames while walking right
nes.buttonDown(1, Controller.BUTTON_RIGHT);
for (let i = 1; i <= 30; i++) {
  nes.frame();
  if (i % 5 === 0) {
    const xi = readRAM(nes, 0x0086);
    const yi = readRAM(nes, 0x00CE);
    console.log(`  frame ${i}: X=${xi} Y=${yi}`);
  }
}
nes.buttonUp(1, Controller.BUTTON_RIGHT);

let xAfterRight = readRAM(nes, 0x0086);
let yAfterRight = readRAM(nes, 0x00CE);
const dx = xAfterRight - xBefore;
console.log(`  After:  X=${xAfterRight} Y=${yAfterRight}  dX=${dx}`);
console.log(
  dx > 0
    ? `  RIGHT INPUT: WORKING ✓ (X increased by ${dx})`
    : dx < 0
    ? `  RIGHT INPUT: WORKING ✓ (X wrapped/scroll, delta=${dx})`
    : `  RIGHT INPUT: NOT DETECTED ✗ (X unchanged)`
);

// 4. Hold A for 30 frames → Y should change (jump)
console.log("\n--- Test: Hold A 30 frames (jump) ---");

// Settle 30 frames first so Mario is grounded
stepFrames(nes, 30);
let xBeforeJump = readRAM(nes, 0x0086);
let yBeforeJump = readRAM(nes, 0x00CE);
console.log(`  Before: X=${xBeforeJump} Y=${yBeforeJump}`);

// Hold A (jump), print Y every 5 frames
nes.buttonDown(1, Controller.BUTTON_A);
let minY = yBeforeJump;
for (let i = 1; i <= 30; i++) {
  nes.frame();
  const yi = readRAM(nes, 0x00CE);
  if (yi < minY) minY = yi;
  if (i % 5 === 0) {
    const xi = readRAM(nes, 0x0086);
    console.log(`  frame ${i}: X=${xi} Y=${yi}`);
  }
}
nes.buttonUp(1, Controller.BUTTON_A);

let yAfterJump = readRAM(nes, 0x00CE);
const dy = yAfterJump - yBeforeJump;
console.log(`  After: X=${readRAM(nes, 0x0086)} Y=${yAfterJump}  dY=${dy}`);
console.log(`  Min Y during hold: ${minY} (lower = higher on screen)`);
console.log(
  yBeforeJump - minY > 3
    ? `  JUMP INPUT: WORKING ✓ (Y decreased by ${yBeforeJump - minY} at peak)`
    : `  JUMP INPUT: NOT DETECTED ✗ (Y barely changed)`
);

// 5. PPU sanity check
console.log("\n--- PPU state sanity check ---");
const vram = nes.ppu.vramMem;
const oam = nes.ppu.spriteMem;
console.log(`  vramMem length: ${vram.length} bytes (expect 32768)`);
console.log(`  spriteMem length: ${oam.length} bytes (expect 256)`);
// Count non-zero pattern table tiles
let nonZeroTiles = 0;
for (let i = 0; i < 0x2000; i++) if (vram[i] !== 0) nonZeroTiles++;
console.log(`  Non-zero bytes in pattern tables ($0000-$1FFF): ${nonZeroTiles}`);
// Nametable tile 0 area
let ntNonZero = 0;
for (let i = 0x2000; i < 0x2400; i++) if (vram[i] !== 0) ntNonZero++;
console.log(`  Non-zero bytes in nametable 0 ($2000-$23FF): ${ntNonZero}`);

// 6. Save/restore state test
console.log("\n--- Save/restore state test ---");
const savedState = nes.toJSON();
const xAtSave = readRAM(nes, 0x0086);
console.log(`  X at save: ${xAtSave}`);

// Walk 30 frames
holdButton(nes, Controller.BUTTON_RIGHT, 30);
const xAfterWalk = readRAM(nes, 0x0086);
console.log(`  X after walking: ${xAfterWalk}`);

// Restore
nes.fromJSON(savedState);
const xAfterRestore = readRAM(nes, 0x0086);
console.log(`  X after restore: ${xAfterRestore}`);
console.log(
  xAfterRestore === xAtSave
    ? `  SAVE/RESTORE: WORKING ✓`
    : `  SAVE/RESTORE: MISMATCH ✗ (expected ${xAtSave}, got ${xAfterRestore})`
);

// ─── summary ────────────────────────────────────────────────────────────────
console.log("\n=== SUMMARY ===");
console.log(`  ROM load:      ✓`);
console.log(`  Controller input (Right): ${dx !== 0 ? "✓" : "✗"}`);
console.log(
  `  Controller input (Jump):  ${yBeforeJump - minY > 3 ? "✓" : "✗"}`
);
console.log(`  PPU VRAM access: ✓`);
console.log(`  OAM access:      ✓`);
console.log(`  Save/restore:    ${xAfterRestore === xAtSave ? "✓" : "✗"}`);
