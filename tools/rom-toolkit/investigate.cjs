/**
 * SMB Investigation Script — Systematic RAM discovery
 * Run: node tools/rom-toolkit/investigate.cjs
 *
 * Discovers game addresses through:
 * 1. RAM diffing (comparative analysis)
 * 2. Active probing (write & observe)
 * 3. OAM correlation (visual tracking)
 */
const fs = require('fs');
const { NES } = require('jsnes');
const { Controller } = require('jsnes');

const ROM_PATH = `${process.env.HOME}/nes-roms/Super Mario Bros. (World).nes`;
const romData = fs.readFileSync(ROM_PATH);

let lastFrame = null;
const nes = new NES({
  onFrame: fb => { lastFrame = fb.slice(); },
  onAudioSample: () => {}
});

nes.loadROM(romData.toString('binary'));

// Helpers
function step(n) { for (let i = 0; i < n; i++) nes.frame(); }
function ram(a) { return nes.cpu.mem[a]; }
function wram(a, v) { nes.cpu.mem[a] = v; }
function readOAM(slot) {
  const b = slot * 4;
  return { y: nes.ppu.spriteMem[b], tile: nes.ppu.spriteMem[b+1],
           attr: nes.ppu.spriteMem[b+2], x: nes.ppu.spriteMem[b+3] };
}

// Snapshot all of RAM ($0000-$07FF)
function snapRAM() {
  const snap = new Uint8Array(0x800);
  for (let i = 0; i < 0x800; i++) snap[i] = ram(i);
  return snap;
}

// Diff two RAM snapshots — returns array of {addr, old, new}
function diffRAM(a, b) {
  const diffs = [];
  for (let i = 0; i < 0x800; i++) {
    if (a[i] !== b[i]) diffs.push({ addr: i, old: a[i], new: b[i] });
  }
  return diffs;
}

// Boot to gameplay
function bootToGameplay() {
  step(60);
  nes.buttonDown(1, Controller.BUTTON_START);
  step(1);
  nes.buttonUp(1, Controller.BUTTON_START);
  step(180); // Extra time to ensure fully in gameplay
}

// ============================================================
// EXPERIMENT 1: RAM diff — standing still vs moving right
// ============================================================
console.log('=== EXPERIMENT 1: Standing still vs Moving right ===');
bootToGameplay();

const saveState = nes.toJSON();

// Branch A: stand still for 60 frames
const ramBefore = snapRAM();
step(60);
const ramStill = snapRAM();

// Branch B: restore and hold right for 60 frames
nes.fromJSON(saveState);
nes.buttonDown(1, Controller.BUTTON_RIGHT);
step(60);
nes.buttonUp(1, Controller.BUTTON_RIGHT);
const ramRight = snapRAM();

// Diff: what changed when moving right vs standing still?
const stillDiff = diffRAM(ramBefore, ramStill);
const rightDiff = diffRAM(ramBefore, ramRight);

// Find addresses that changed ONLY when moving right (not when standing still)
const stillAddrs = new Set(stillDiff.map(d => d.addr));
const rightOnlyDiffs = rightDiff.filter(d => !stillAddrs.has(d.addr));

console.log(`Standing still: ${stillDiff.length} addresses changed`);
console.log(`Moving right: ${rightDiff.length} addresses changed`);
console.log(`Right-only changes: ${rightOnlyDiffs.length}`);
console.log('\nRight-only address changes:');
rightOnlyDiffs.forEach(d => {
  console.log(`  $${d.addr.toString(16).padStart(4,'0')}: ${d.old} → ${d.new}`);
});

// ============================================================
// EXPERIMENT 2: RAM diff — jumping vs not jumping
// ============================================================
console.log('\n=== EXPERIMENT 2: Jumping vs not jumping ===');
nes.fromJSON(saveState);
step(30); // Settle

const saveBeforeJump = nes.toJSON();
const ramPreJump = snapRAM();

// Branch A: no jump, just stand
step(60);
const ramNoJump = snapRAM();

// Branch B: jump
nes.fromJSON(saveBeforeJump);
nes.buttonDown(1, Controller.BUTTON_A);
step(5);
nes.buttonUp(1, Controller.BUTTON_A);
step(55);
const ramJump = snapRAM();

const noJumpDiff = diffRAM(ramPreJump, ramNoJump);
const jumpDiff = diffRAM(ramPreJump, ramJump);
const noJumpAddrs = new Set(noJumpDiff.map(d => d.addr));
const jumpOnlyDiffs = jumpDiff.filter(d => !noJumpAddrs.has(d.addr));

console.log(`No jump: ${noJumpDiff.length} addresses changed`);
console.log(`Jump: ${jumpDiff.length} addresses changed`);
console.log(`Jump-only changes: ${jumpOnlyDiffs.length}`);
console.log('\nJump-only address changes:');
jumpOnlyDiffs.forEach(d => {
  console.log(`  $${d.addr.toString(16).padStart(4,'0')}: ${d.old} → ${d.new}`);
});

// ============================================================
// EXPERIMENT 3: Active probing — write to known and suspected addresses
// ============================================================
console.log('\n=== EXPERIMENT 3: Active probing ===');
nes.fromJSON(saveState);
step(30);

// Test: write to $075A (known lives address)
const livesBefore = ram(0x075A);
wram(0x075A, 9);
step(1);
const livesAfter = ram(0x075A);
console.log(`Lives ($075A): wrote 9, read back ${livesAfter} (was ${livesBefore})`);

// Test: write to $0756 (powerup state)
const pwrBefore = ram(0x0756);
wram(0x0756, 2); // fire mario
step(30);
const pwrAfter = ram(0x0756);
console.log(`Powerup ($0756): wrote 2, read back ${pwrAfter} (was ${pwrBefore})`);

// Test: write to $075F/$0760 (world/level)
// Careful — this might need a level reload trigger
console.log(`Current world/level: ${ram(0x075F)+1}-${ram(0x0760)+1}`);

// Test: coin count
nes.fromJSON(saveState);
step(30);
const coinBefore = ram(0x075E);
wram(0x075E, 50);
step(1);
console.log(`Coins ($075E): wrote 50, read back ${ram(0x075E)} (was ${coinBefore})`);

// ============================================================
// EXPERIMENT 4: Discover physics addresses — gravity and jump velocity
// ============================================================
console.log('\n=== EXPERIMENT 4: Physics discovery ===');
nes.fromJSON(saveState);
step(30);

// Jump and capture Y velocity changes frame-by-frame
const yPositions = [];
const yRAM = [];
nes.buttonDown(1, Controller.BUTTON_A);
for (let f = 0; f < 5; f++) {
  nes.frame();
  yPositions.push(ram(0x00CE));
}
nes.buttonUp(1, Controller.BUTTON_A);
for (let f = 0; f < 55; f++) {
  nes.frame();
  yPositions.push(ram(0x00CE));
}
console.log('Y positions during jump (first 30 frames):');
console.log(' ', yPositions.slice(0, 30).join(', '));

// Check for Y velocity address — should be near $009F or in zero page
// Scan for addresses that correlate with Y position changes
nes.fromJSON(saveState);
step(30);
const preJumpSnap = snapRAM();
nes.buttonDown(1, Controller.BUTTON_A);
step(1);
const jumpFrame1 = snapRAM();
step(1);
const jumpFrame2 = snapRAM();
nes.buttonUp(1, Controller.BUTTON_A);

const frame1Diff = diffRAM(preJumpSnap, jumpFrame1);
const frame2Diff = diffRAM(jumpFrame1, jumpFrame2);

console.log('\nRAM changes on jump frame 1:');
frame1Diff.slice(0, 30).forEach(d => {
  console.log(`  $${d.addr.toString(16).padStart(4,'0')}: ${d.old} → ${d.new}`);
});

// ============================================================
// EXPERIMENT 5: OAM correlation — find which OAM slots track Mario
// ============================================================
console.log('\n=== EXPERIMENT 5: OAM/Sprite correlation ===');
nes.fromJSON(saveState);
step(30);

// Mario's position
const marioX = ram(0x0086);
const marioY = ram(0x00CE);
console.log(`Mario RAM position: X=${marioX}, Y=${marioY}`);

// Find OAM sprites near Mario's position
console.log('All visible OAM sprites:');
for (let i = 0; i < 64; i++) {
  const s = readOAM(i);
  if (s.y < 0xEF && s.y > 0) {
    const nearMario = (Math.abs(s.x - marioX) < 20 && Math.abs(s.y - marioY) < 30);
    console.log(`  Slot ${i}: x=${s.x} y=${s.y} tile=0x${s.tile.toString(16)} ${nearMario ? '← NEAR MARIO' : ''}`);
  }
}

// ============================================================
// EXPERIMENT 6: PPU exploration — palettes and nametables
// ============================================================
console.log('\n=== EXPERIMENT 6: PPU / Palette exploration ===');
nes.fromJSON(saveState);
step(60); // In gameplay

// PPU palettes are at VRAM $3F00-$3F1F (mirrored to $3F20-$3FFF)
// In jsnes, palette data might be stored differently
// Let's check nes.ppu for palette storage
console.log('PPU palette check:');

// jsnes stores palettes in ppu.vramMem at $3F00
// But VRAM addressing might be different. Let's check.
const paletteStart = 0x3F00;
console.log('VRAM $3F00-$3F1F (palette data):');
let palLine = '';
for (let i = 0; i < 32; i++) {
  palLine += nes.ppu.vramMem[paletteStart + i].toString(16).padStart(2, '0') + ' ';
  if (i === 15) palLine += '\n  ';
}
console.log(' ', palLine);

// Background palettes: $3F00-$3F0F (4 palettes × 4 colors)
// Sprite palettes: $3F10-$3F1F (4 palettes × 4 colors)
console.log('\nBackground palettes:');
for (let p = 0; p < 4; p++) {
  const base = paletteStart + p * 4;
  console.log(`  Palette ${p}: ${nes.ppu.vramMem[base].toString(16)}, ${nes.ppu.vramMem[base+1].toString(16)}, ${nes.ppu.vramMem[base+2].toString(16)}, ${nes.ppu.vramMem[base+3].toString(16)}`);
}
console.log('Sprite palettes:');
for (let p = 0; p < 4; p++) {
  const base = paletteStart + 16 + p * 4;
  console.log(`  Palette ${p}: ${nes.ppu.vramMem[base].toString(16)}, ${nes.ppu.vramMem[base+1].toString(16)}, ${nes.ppu.vramMem[base+2].toString(16)}, ${nes.ppu.vramMem[base+3].toString(16)}`);
}

// ============================================================
// EXPERIMENT 7: Discover enemy addresses
// ============================================================
console.log('\n=== EXPERIMENT 7: Enemy discovery ===');
nes.fromJSON(saveState);
// Move right to encounter a goomba
nes.buttonDown(1, Controller.BUTTON_RIGHT);
step(120); // Run right for 2 seconds
nes.buttonUp(1, Controller.BUTTON_RIGHT);

const saveNearEnemy = nes.toJSON();
const ramNearEnemy = snapRAM();

// Look at known enemy area $07F8+
console.log('Enemy area ($07F8-$0800):');
for (let i = 0x07F8; i <= 0x07FF; i++) {
  console.log(`  $${i.toString(16)}: ${ram(i)}`);
}

// Enemy positions are typically at $0087-$008B (X) and $00CF-$00D3 (Y)
// and enemy types at $0016-$001A or similar
console.log('\nPossible enemy X positions ($0087-$008F):');
for (let i = 0x0087; i <= 0x008F; i++) {
  console.log(`  $${i.toString(16)}: ${ram(i)}`);
}
console.log('Possible enemy Y positions ($00CF-$00D7):');
for (let i = 0x00CF; i <= 0x00D7; i++) {
  console.log(`  $${i.toString(16)}: ${ram(i)}`);
}

// Enemy types $0016-$001F
console.log('Possible enemy types ($0016-$001F):');
for (let i = 0x0016; i <= 0x001F; i++) {
  console.log(`  $${i.toString(16)}: ${ram(i)}`);
}

// Check $001D-$001F area (enemy active flags in many NES games)
console.log('\n$000E-$0020 area:');
for (let i = 0x000E; i <= 0x0020; i++) {
  console.log(`  $${i.toString(16)}: ${ram(i)}`);
}

// ============================================================
// EXPERIMENT 8: Invincibility / player state probing
// ============================================================
console.log('\n=== EXPERIMENT 8: Player state & invincibility ===');
nes.fromJSON(saveState);
step(30);

// Star invincibility timer is typically at $079E
console.log('$079E (star timer?):', ram(0x079E));
// Player state addresses
console.log('$000E (player state?):', ram(0x000E));

// Scan $0700-$07FF for interesting non-zero values
console.log('\nNon-zero values in $0700-$07FF:');
for (let i = 0x0700; i < 0x0800; i++) {
  if (ram(i) !== 0) {
    console.log(`  $${i.toString(16)}: ${ram(i)}`);
  }
}

console.log('\n=== Investigation complete ===');
