/**
 * MM2 Runtime Analysis — Boot the game, capture state during different phases
 */
const fs = require('fs');
const { NES } = require('jsnes');
const { Controller } = require('jsnes');

const ROM_PATH = `${process.env.HOME}/nes-roms/Mega Man 2 (USA).nes`;
const romData = fs.readFileSync(ROM_PATH);

let lastFrame = null;
const nes = new NES({
  onFrame: fb => { lastFrame = fb; },
  onAudioSample: () => {}
});
nes.loadROM(romData.toString('binary'));

function step(n) { for (let i = 0; i < n; i++) nes.frame(); }
function ram(a) { return nes.cpu.mem[a]; }
function wram(a, v) { nes.cpu.mem[a] = v; }

// Helper: read key game state
function dumpState(label) {
  console.log(`[${label}]`);
  console.log(`  $2A (game state): ${ram(0x2A)}`);
  console.log(`  $29 (current bank): ${ram(0x29)}`);
  console.log(`  $1C (frame counter): ${ram(0x1C)}`);
  console.log(`  $1D (NMI flag): ${ram(0x1D)}`);
  console.log(`  $A8: ${ram(0xA8)}, $A9: ${ram(0xA9)}, $AA: ${ram(0xAA)}`);
  console.log(`  $2B: ${ram(0x2B)}, $2C: ${ram(0x2C)}`);
  console.log(`  $23 (scroll X?): ${ram(0x23)}, $24 (scroll page?): ${ram(0x24)}`);
  // Player position (common MM2 addresses)
  console.log(`  $0460 (player X?): ${ram(0x0460)}, $04A0 (player Y?): ${ram(0x04A0)}`);
  console.log(`  $3D: ${ram(0x3D)}, $3E: ${ram(0x3E)}, $3F: ${ram(0x3F)}`);
  // Enemy data area
  console.log(`  $0400-0406: ${Array.from({length:7}, (_, i) => ram(0x0400+i).toString(16).padStart(2,'0')).join(' ')}`);
}

// ============================================================
// Boot and navigate to different game states
// ============================================================
console.log('=== Booting MM2 ===');
step(60);
dumpState('After 60 frames (title)');

// Title screen — press START to go to Normal/Difficult select
nes.buttonDown(1, Controller.BUTTON_START);
step(1);
nes.buttonUp(1, Controller.BUTTON_START);
step(60);
dumpState('After START (mode select?)');

// Select Normal
nes.buttonDown(1, Controller.BUTTON_START);
step(1);
nes.buttonUp(1, Controller.BUTTON_START);
step(120);
dumpState('After Normal select');

const stageSelectState = nes.toJSON();

// Stage select screen — try to identify which stage is highlighted
// Press START to select the default stage
nes.buttonDown(1, Controller.BUTTON_START);
step(1);
nes.buttonUp(1, Controller.BUTTON_START);
step(180); // Wait for stage to load
dumpState('After stage select (loading)');
step(120);
dumpState('In gameplay');

const gameplayState = nes.toJSON();

// Explore RAM during gameplay
console.log('\n=== Gameplay RAM Analysis ===');

// Find player position by moving right
const beforeMove = nes.toJSON();
const snap1 = new Uint8Array(0x800);
for (let i = 0; i < 0x800; i++) snap1[i] = ram(i);

nes.buttonDown(1, Controller.BUTTON_RIGHT);
step(30);
nes.buttonUp(1, Controller.BUTTON_RIGHT);
const snap2 = new Uint8Array(0x800);
for (let i = 0; i < 0x800; i++) snap2[i] = ram(i);

// Restore and stand still
nes.fromJSON(beforeMove);
step(30);
const snap3 = new Uint8Array(0x800);
for (let i = 0; i < 0x800; i++) snap3[i] = ram(i);

// Find addresses that changed ONLY when moving right
const stillChanged = new Set();
for (let i = 0; i < 0x800; i++) {
  if (snap1[i] !== snap3[i]) stillChanged.add(i);
}
const moveOnly = [];
for (let i = 0; i < 0x800; i++) {
  if (snap1[i] !== snap2[i] && !stillChanged.has(i)) {
    moveOnly.push({ addr: i, old: snap1[i], new: snap2[i] });
  }
}
console.log('Right-movement-only changes:');
moveOnly.forEach(d => {
  console.log(`  $${d.addr.toString(16).padStart(4, '0')}: ${d.old} → ${d.new} (delta=${d.new - d.old})`);
});

// Jump test
console.log('\n=== Jump Analysis ===');
nes.fromJSON(gameplayState);
step(10);
const preJump = new Uint8Array(0x800);
for (let i = 0; i < 0x800; i++) preJump[i] = ram(i);

nes.buttonDown(1, Controller.BUTTON_A);
step(5);
nes.buttonUp(1, Controller.BUTTON_A);
step(25);
const postJump = new Uint8Array(0x800);
for (let i = 0; i < 0x800; i++) postJump[i] = ram(i);

// Compare
nes.fromJSON(gameplayState);
step(10);
step(30);
const noJump = new Uint8Array(0x800);
for (let i = 0; i < 0x800; i++) noJump[i] = ram(i);

const jumpOnly = [];
const noJumpChanged = new Set();
for (let i = 0; i < 0x800; i++) {
  if (preJump[i] !== noJump[i]) noJumpChanged.add(i);
}
for (let i = 0; i < 0x800; i++) {
  if (preJump[i] !== postJump[i] && !noJumpChanged.has(i)) {
    jumpOnly.push({ addr: i, old: preJump[i], new: postJump[i] });
  }
}
console.log('Jump-only changes:');
jumpOnly.slice(0, 30).forEach(d => {
  console.log(`  $${d.addr.toString(16).padStart(4, '0')}: ${d.old} → ${d.new}`);
});

// Check if MM2 has variable jump by holding vs tapping A
console.log('\n=== Variable jump test (hold vs tap) ===');
nes.fromJSON(gameplayState);
step(10);
// Short jump: tap A briefly
nes.buttonDown(1, Controller.BUTTON_A);
step(3);
nes.buttonUp(1, Controller.BUTTON_A);
const yPositionsTap = [];
for (let f = 0; f < 40; f++) {
  nes.frame();
  yPositionsTap.push(ram(0x04A0)); // candidate Y
}

nes.fromJSON(gameplayState);
step(10);
// Full jump: hold A longer
nes.buttonDown(1, Controller.BUTTON_A);
step(20);
nes.buttonUp(1, Controller.BUTTON_A);
const yPositionsHold = [];
for (let f = 0; f < 40; f++) {
  nes.frame();
  yPositionsHold.push(ram(0x04A0));
}

console.log('Tap Y positions:', yPositionsTap.slice(0, 20).join(', '));
console.log('Hold Y positions:', yPositionsHold.slice(0, 20).join(', '));

// Also try with potential Y address from movement detection
const yAddr = moveOnly.find(d => Math.abs(d.new - d.old) < 20 && d.addr > 0x0400);
if (yAddr) {
  console.log('\nUsing detected Y address $' + yAddr.addr.toString(16) + ':');
  nes.fromJSON(gameplayState);
  step(10);
  nes.buttonDown(1, Controller.BUTTON_A);
  step(3);
  nes.buttonUp(1, Controller.BUTTON_A);
  const tapY2 = [];
  for (let f = 0; f < 40; f++) { nes.frame(); tapY2.push(ram(yAddr.addr)); }

  nes.fromJSON(gameplayState);
  step(10);
  nes.buttonDown(1, Controller.BUTTON_A);
  step(20);
  nes.buttonUp(1, Controller.BUTTON_A);
  const holdY2 = [];
  for (let f = 0; f < 40; f++) { nes.frame(); holdY2.push(ram(yAddr.addr)); }

  console.log('Tap:', tapY2.slice(0, 20).join(', '));
  console.log('Hold:', holdY2.slice(0, 20).join(', '));
  const tapMin = Math.min(...tapY2);
  const holdMin = Math.min(...holdY2);
  console.log(`Tap peak Y=${tapMin}, Hold peak Y=${holdMin} (lower=higher jump)`);
  console.log(`Variable jump: ${holdMin < tapMin ? 'YES' : 'NO (fixed height)'}`);
}

// Search for enemy data slots
console.log('\n=== Enemy slot search ===');
// MM2 typically has enemy slots at $0420+ or similar
// Check which bytes in $0400-$04FF range are non-zero and active
for (let base = 0x0400; base < 0x0500; base += 0x20) {
  const nonZero = [];
  for (let i = 0; i < 0x20; i++) {
    if (ram(base + i) !== 0) nonZero.push(i);
  }
  if (nonZero.length > 0 && nonZero.length < 0x18) {
    console.log(`  $${base.toString(16)}-$${(base+0x1F).toString(16)}: ${nonZero.length} non-zero bytes`);
  }
}

// Check bank during gameplay
console.log('\n=== Active bank during gameplay ===');
console.log('$29 (bank):', ram(0x29));
console.log('$2A (state):', ram(0x2A));

// Probe jsnes mapper internals
console.log('\n=== jsnes mapper info ===');
if (nes.mmap) {
  console.log('mmap type:', typeof nes.mmap);
  console.log('mmap keys:', Object.keys(nes.mmap).filter(k => typeof nes.mmap[k] !== 'function').slice(0, 20).join(', '));
}
if (nes.rom) {
  console.log('rom.mapperType:', nes.rom.mapperType);
  console.log('rom.rom banks:', nes.rom.rom.length);
  console.log('rom.rom[0] size:', nes.rom.rom[0] ? nes.rom.rom[0].length : 'N/A');
}

// Find weapon damage table by searching for the known pattern
// MM2 has 8 bosses and each weapon deals specific damage
// The damage table should have 8×8 or similar entries
console.log('\n=== Searching for weapon damage table in PRG ===');
const rom = fs.readFileSync(ROM_PATH);
const prg = rom.slice(16, 16 + 262144);
// Search for a pattern where one byte is much higher than others (weakness)
// Metal Blade deals 4 damage to most but 14 to Metal Man himself
// Quick Boomerang deals 2 to Air Man, etc.
// Known: Atomic Fire fully charged does 28 (0x1C) to Wood Man
for (let addr = 0; addr < prg.length - 16; addr++) {
  // Look for clusters of small values (1-4) with occasional high values (>10)
  const window = [];
  for (let i = 0; i < 11; i++) window.push(prg[addr + i]);
  const hasHigh = window.some(v => v >= 0x0A && v <= 0x1C);
  const hasLow = window.filter(v => v >= 1 && v <= 4).length >= 4;
  const hasZero = window.filter(v => v === 0).length <= 3;
  if (hasHigh && hasLow && hasZero && window.every(v => v <= 0x1C)) {
    // Check if it looks like a damage table (consistent range)
    const bank = Math.floor(addr / 16384);
    const bankOff = addr % 16384;
    const cpuAddr = (bank === 15 ? 0xC000 : 0x8000) + bankOff;
    if (bank < 2) continue; // Skip unlikely banks
    console.log(`  Bank ${bank} $${cpuAddr.toString(16).toUpperCase()}: ${window.map(v => v.toString(16).padStart(2,'0')).join(' ')}`);
  }
}

console.log('\n=== Runtime analysis complete ===');
