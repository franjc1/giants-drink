/**
 * MM2 Probe 2 — Get to actual gameplay and find key addresses
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

// Boot to gameplay — give more time
console.log('Booting...');
step(120); // Title screen + intro
nes.buttonDown(1, Controller.BUTTON_START);
step(1);
nes.buttonUp(1, Controller.BUTTON_START);
step(120);
// Normal mode
nes.buttonDown(1, Controller.BUTTON_START);
step(1);
nes.buttonUp(1, Controller.BUTTON_START);
step(180);
// Stage select
nes.buttonDown(1, Controller.BUTTON_START);
step(1);
nes.buttonUp(1, Controller.BUTTON_START);
step(600); // Give LOTS of time for stage to load + intro sequence

console.log('State $2A:', ram(0x2A), 'Bank $29:', ram(0x29));

// Check OAM now
console.log('\nVisible sprites after full load:');
for (let s = 0; s < 64; s++) {
  const y = nes.ppu.spriteMem[s * 4];
  if (y < 0xEF && y > 0) {
    const x = nes.ppu.spriteMem[s * 4 + 3];
    const tile = nes.ppu.spriteMem[s * 4 + 1];
    console.log(`  Slot ${s}: X=${x} Y=${y} tile=$${tile.toString(16)}`);
  }
}

// Take a savestate
const gameplaySave = nes.toJSON();

// ============================================================
// Find player position via comprehensive RAM diff
// ============================================================
console.log('\n=== Comprehensive movement diff ===');
const snap1 = new Uint8Array(0x800);
for (let i = 0; i < 0x800; i++) snap1[i] = ram(i);

// Move right for 60 frames
nes.buttonDown(1, Controller.BUTTON_RIGHT);
step(60);
nes.buttonUp(1, Controller.BUTTON_RIGHT);
const snap2 = new Uint8Array(0x800);
for (let i = 0; i < 0x800; i++) snap2[i] = ram(i);

// Restore and stand still
nes.fromJSON(gameplaySave);
step(60);
const snap3 = new Uint8Array(0x800);
for (let i = 0; i < 0x800; i++) snap3[i] = ram(i);

const still = new Set();
for (let i = 0; i < 0x800; i++) if (snap1[i] !== snap3[i]) still.add(i);

console.log('Movement-only changes:');
for (let i = 0; i < 0x800; i++) {
  if (snap1[i] !== snap2[i] && !still.has(i)) {
    const delta = snap2[i] - snap1[i];
    console.log(`  $${i.toString(16).padStart(4, '0')}: ${snap1[i]} → ${snap2[i]} (delta=${delta})`);
  }
}

// ============================================================
// Variable jump test with comprehensive Y tracking
// ============================================================
console.log('\n=== Variable jump test ===');
nes.fromJSON(gameplaySave);
step(10);

// Track ALL RAM changes during a short jump
const preJump = new Uint8Array(0x800);
for (let i = 0; i < 0x800; i++) preJump[i] = ram(i);

nes.buttonDown(1, Controller.BUTTON_A);
step(3);
nes.buttonUp(1, Controller.BUTTON_A);
step(15);
const tapJump = new Uint8Array(0x800);
for (let i = 0; i < 0x800; i++) tapJump[i] = ram(i);

// Long jump
nes.fromJSON(gameplaySave);
step(10);
nes.buttonDown(1, Controller.BUTTON_A);
step(20);
nes.buttonUp(1, Controller.BUTTON_A);
step(5);
const holdJump = new Uint8Array(0x800);
for (let i = 0; i < 0x800; i++) holdJump[i] = ram(i);

console.log('Addresses that differ between tap and hold jump:');
for (let i = 0; i < 0x800; i++) {
  if (tapJump[i] !== holdJump[i] && tapJump[i] !== preJump[i] && holdJump[i] !== preJump[i]) {
    console.log(`  $${i.toString(16).padStart(4, '0')}: tap=${tapJump[i]} hold=${holdJump[i]} pre=${preJump[i]}`);
  }
}

// ============================================================
// HP verification — check $0304 and $0310
// ============================================================
console.log('\n=== HP probe ===');
nes.fromJSON(gameplaySave);
console.log('$0304:', ram(0x0304), '$0310:', ram(0x0310));

// Try setting $0304 to 1 (low HP)
wram(0x0304, 1);
step(5);
console.log('After $0304=1: $0304=', ram(0x0304));

nes.fromJSON(gameplaySave);
// Try setting $06C0 (HP display area from the analysis)
console.log('$06C0:', ram(0x06C0));
console.log('$06C1:', ram(0x06C1));

// ============================================================
// Search ALL PRG banks for weapon damage table
// ============================================================
console.log('\n=== Broad weapon damage table search ===');
const prgRom = fs.readFileSync(ROM_PATH).slice(16, 16 + 262144);

// Known MM2 boss weaknesses (approximate damage values):
// Buster: 1 to all bosses
// Heat Man weak to: Bubble Lead (deals ~7 damage per hit)
// Air Man weak to: Leaf Shield (?)
// Wood Man weak to: Atomic Fire charged (28 = one hit) or Metal Blade (4)
// Bubble Man weak to: Metal Blade (4)
// Quick Man weak to: Flash Stopper (freezes, ~7 damage) or Crash Bomber
// Crash Man weak to: Air Shooter (4)
// Metal Man weak to: Quick Boomerang (4) or Metal Blade (14, his own weapon)
// Flash Man weak to: Metal Blade (4)

// Search for the value 14 (0x0E) which is Metal Blade damage to Metal Man
// near values of 1-4 (normal damages)
for (let addr = 0; addr < prgRom.length - 10; addr++) {
  if (prgRom[addr] === 0x0E) { // 14 damage (Metal vs Metal)
    // Check surrounding bytes for damage-table-like pattern
    const before = prgRom.slice(Math.max(0, addr - 8), addr);
    const after = prgRom.slice(addr + 1, Math.min(prgRom.length, addr + 9));
    const context = [...before, prgRom[addr], ...after];

    // Most values should be 0-4, with this 14 being the outlier
    const smallCount = context.filter(v => v >= 0 && v <= 4).length;
    const total = context.length;
    if (smallCount >= total * 0.7 && total >= 12) {
      const bank = Math.floor(addr / 16384);
      const cpuAddr = (bank === 15 ? 0xC000 : 0x8000) + (addr % 16384);
      console.log(`  Bank ${bank} $${cpuAddr.toString(16).toUpperCase()}: 0E at offset, context: ${context.map(v => v.toString(16).padStart(2, '0')).join(' ')}`);
    }
  }
}

// ============================================================
// Check the $CB8C dispatch (from main game loop)
// ============================================================
console.log('\n=== $CB8C (game state dispatch) ===');
// This is in the fixed bank
const fixed = prgRom.slice(15 * 16384);
const cbAddr = 0xCB8C - 0xC000;
console.log('$CB8C bytes:', Array.from(fixed.slice(cbAddr, cbAddr + 30)).map(b => b.toString(16).padStart(2, '0')).join(' '));

// ============================================================
// Check jsnes bank switching internals
// ============================================================
console.log('\n=== jsnes mapper internals ===');
nes.fromJSON(gameplaySave);
console.log('mmap.romBankSelect:', nes.mmap.romBankSelect);
console.log('mmap.prgSwitchingArea:', nes.mmap.prgSwitchingArea);
console.log('mmap.prgSwitchingSize:', nes.mmap.prgSwitchingSize);

// Try writing to PRG ROM in a switchable bank
const testAddr = 0x8000;
const origByte = nes.cpu.mem[testAddr];
console.log(`\nPRG write test:`);
console.log(`  cpu.mem[$8000] = $${origByte.toString(16)} (bank ${ram(0x29)} loaded)`);
nes.cpu.mem[testAddr] = 0xEA;
console.log(`  After write: cpu.mem[$8000] = $${nes.cpu.mem[testAddr].toString(16)}`);
// Check if rom.rom reflects the write
const bankNum = ram(0x29);
if (nes.rom.rom[bankNum]) {
  console.log(`  rom.rom[${bankNum}][0] = $${nes.rom.rom[bankNum][0].toString(16)}`);
  nes.rom.rom[bankNum][0] = 0xEA;
  console.log(`  After rom write: cpu.mem[$8000] = $${nes.cpu.mem[testAddr].toString(16)}`);
}

console.log('\n=== Probe 2 complete ===');
