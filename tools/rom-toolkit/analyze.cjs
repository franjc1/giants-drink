/**
 * PRG-ROM Analysis Helper
 * Reads raw bytes and decodes jump tables, data tables, etc.
 */
const fs = require('fs');

const ROM_PATH = `${process.env.HOME}/nes-roms/Super Mario Bros. (World).nes`;
const rom = fs.readFileSync(ROM_PATH);
const prg = rom.slice(16, 16 + 32768); // PRG-ROM after iNES header
const BASE = 0x8000;

function prgByte(addr) { return prg[addr - BASE]; }
function prgWord(addr) { return prgByte(addr) | (prgByte(addr + 1) << 8); }
function hex(n, w = 4) { return '$' + n.toString(16).toUpperCase().padStart(w, '0'); }
function hexb(n) { return hex(n, 2); }

// Read raw bytes at an address
function rawBytes(addr, count) {
  const bytes = [];
  for (let i = 0; i < count; i++) bytes.push(prgByte(addr + i));
  return bytes;
}

// Decode a jump table (array of 16-bit addresses)
function decodeJumpTable(addr, count) {
  const entries = [];
  for (let i = 0; i < count; i++) {
    const target = prgWord(addr + i * 2);
    entries.push(target);
  }
  return entries;
}

// ============================================================
// MAIN GAME ENGINE DISPATCH at $8212
// ============================================================
console.log('=== Main Game Engine Dispatch ($8212) ===');
console.log('Code: LDA $0770 / JSR $8E04');
console.log('Jump table at $8218:');
const mainTable = rawBytes(0x8218, 8);
console.log('  Raw bytes:', mainTable.map(b => hexb(b)).join(' '));

// OperMode dispatch table (4 entries)
for (let i = 0; i < 4; i++) {
  const lo = mainTable[i * 2];
  const hi = mainTable[i * 2 + 1];
  const target = lo | (hi << 8);
  console.log(`  OperMode=${i}: ${hex(target)} (${['Title','Game','Victory','GameOver'][i]})`);
}

// ============================================================
// GAME MODE SUB-DISPATCH at $8231
// Look at what $8231 does — should dispatch on $0772 (OperModeTask)
// ============================================================
console.log('\n=== Title Screen Mode ($8231) ===');
const titleBytes = rawBytes(0x8231, 16);
console.log('Raw bytes:', titleBytes.map(b => hexb(b)).join(' '));

// $8231 probably does: LDA $0772 / JSR $8E04 / <table>
// Check: AD 72 07 20 04 8E
console.log('Decoded: LDA $0772 JSR $8E04 ?',
  titleBytes[0] === 0xAD && titleBytes[1] === 0x72 && titleBytes[2] === 0x07 &&
  titleBytes[3] === 0x20 && titleBytes[4] === 0x04 && titleBytes[5] === 0x8E);

if (titleBytes[0] === 0xAD) {
  const tableStart = 0x8231 + 6; // After the 6-byte LDA+JSR
  console.log('Sub-dispatch table at', hex(tableStart) + ':');
  for (let i = 0; i < 4; i++) {
    const target = prgWord(tableStart + i * 2);
    console.log(`  Task ${i}: ${hex(target)}`);
  }
}

// ============================================================
// Game Mode dispatch (OperMode=1)
// ============================================================
console.log('\n=== Game Mode Dispatch ===');
// From the main table, OperMode=1 target:
const gameModeAddr = mainTable[2] | (mainTable[3] << 8);
console.log('OperMode=1 target:', hex(gameModeAddr));
const gameModeBytes = rawBytes(gameModeAddr, 20);
console.log('Raw bytes:', gameModeBytes.map(b => hexb(b)).join(' '));

// Check if it also dispatches on $0772
if (gameModeBytes[0] === 0xAD && gameModeBytes[1] === 0x72 && gameModeBytes[2] === 0x07) {
  console.log('Dispatches on $0772!');
  const tableStart = gameModeAddr + 6;
  console.log('Sub-dispatch table at', hex(tableStart) + ':');
  for (let i = 0; i < 5; i++) {
    const target = prgWord(tableStart + i * 2);
    console.log(`  Task ${i}: ${hex(target)}`);
  }
}

// ============================================================
// Find key routines by searching for patterns
// ============================================================

// Search for LDA $0086 (player X read) — player physics code
console.log('\n=== Player X ($0086) References ===');
for (let addr = BASE; addr < BASE + 32768 - 2; addr++) {
  if (prgByte(addr) === 0xA5 && prgByte(addr + 1) === 0x86) {
    console.log(`  ${hex(addr)}: LDA $86 (zpg)`);
  }
  if (prgByte(addr) === 0xAD && prgByte(addr + 1) === 0x86 && prgByte(addr + 2) === 0x00) {
    console.log(`  ${hex(addr)}: LDA $0086 (abs)`);
  }
}

// Search for STA $0086 — player X write
console.log('\n=== Player X ($0086) Writes ===');
for (let addr = BASE; addr < BASE + 32768 - 2; addr++) {
  if (prgByte(addr) === 0x85 && prgByte(addr + 1) === 0x86) {
    console.log(`  ${hex(addr)}: STA $86`);
  }
  if (prgByte(addr) === 0x8D && prgByte(addr + 1) === 0x86 && prgByte(addr + 2) === 0x00) {
    console.log(`  ${hex(addr)}: STA $0086`);
  }
}

// Search for $009F (Y velocity) references
console.log('\n=== Y Velocity ($009F) References ===');
for (let addr = BASE; addr < BASE + 32768 - 2; addr++) {
  if ((prgByte(addr) === 0xA5 || prgByte(addr) === 0x85 || prgByte(addr) === 0xC5 ||
       prgByte(addr) === 0xE5 || prgByte(addr) === 0x65) && prgByte(addr + 1) === 0x9F) {
    const mnemonic = {0xA5:'LDA',0x85:'STA',0xC5:'CMP',0xE5:'SBC',0x65:'ADC'}[prgByte(addr)];
    console.log(`  ${hex(addr)}: ${mnemonic} $9F`);
  }
}

// Search for references to jump velocity tables
// In SMB, the jump initial velocity table is somewhere in ROM
// Look for the bytes FC FB (= -4, -5 which are walk/run jump velocities)
console.log('\n=== Searching for jump velocity values (FC FB pattern) ===');
for (let addr = BASE; addr < BASE + 32768 - 4; addr++) {
  // Typical pattern: a table of negative velocities
  if (prgByte(addr) === 0xFC && prgByte(addr + 1) === 0xFB) {
    console.log(`  ${hex(addr)}: FC FB found`);
    // Show surrounding bytes
    const ctx = rawBytes(addr - 2, 10);
    console.log(`    Context: ${ctx.map(b => hexb(b)).join(' ')}`);
  }
}

// Search for enemy type check (LDA $0016,X pattern — enemy type loaded with X indexing)
console.log('\n=== Enemy Type ($0016) References ===');
for (let addr = BASE; addr < BASE + 32768 - 2; addr++) {
  if (prgByte(addr) === 0xB5 && prgByte(addr + 1) === 0x16) {
    console.log(`  ${hex(addr)}: LDA $16,X`);
  }
  if (prgByte(addr) === 0x95 && prgByte(addr + 1) === 0x16) {
    console.log(`  ${hex(addr)}: STA $16,X`);
  }
}

// Search for the Goomba AI / enemy movement code
// Enemy horizontal movement likely involves $0058 (enemy X speed)
console.log('\n=== Enemy X Speed ($0058) References ===');
for (let addr = BASE; addr < BASE + 32768 - 2; addr++) {
  if ((prgByte(addr) === 0xB5 || prgByte(addr) === 0x95 || prgByte(addr) === 0xA5) &&
      prgByte(addr + 1) === 0x58) {
    const mnemonic = {0xB5:'LDA',0x95:'STA',0xA5:'LDA'}[prgByte(addr)];
    const mode = prgByte(addr) === 0xA5 ? 'zpg' : 'zpx';
    console.log(`  ${hex(addr)}: ${mnemonic} $58${mode === 'zpx' ? ',X' : ''}`);
  }
}

// Search for STA $4014 (OAM DMA trigger)
console.log('\n=== OAM DMA ($4014) Writes ===');
for (let addr = BASE; addr < BASE + 32768 - 2; addr++) {
  if (prgByte(addr) === 0x8D && prgByte(addr + 1) === 0x14 && prgByte(addr + 2) === 0x40) {
    console.log(`  ${hex(addr)}: STA $4014`);
  }
}

// Search for the level data tables ($9CB4, $9CBC, $9D28 etc.)
console.log('\n=== Area/Level Data Table Pointers ===');
// Area object lo/hi tables at $9D2C/$9D4E
console.log('Area obj ptr lo ($9D2C):');
const areaLo = rawBytes(0x9D2C, 34);
console.log('  ', areaLo.map(b => hexb(b)).join(' '));
console.log('Area obj ptr hi ($9D4E):');
const areaHi = rawBytes(0x9D4E, 34);
console.log('  ', areaHi.map(b => hexb(b)).join(' '));

// Decode full area pointers
console.log('\nFull area data pointers:');
for (let i = 0; i < 34; i++) {
  const ptr = areaLo[i] | (areaHi[i] << 8);
  console.log(`  Area ${i}: ${hex(ptr)}`);
}

// ============================================================
// COLLISION DETECTION — search for bounding box patterns
// ============================================================
console.log('\n=== Collision-related code patterns ===');
// Look for SEC/SBC patterns with player/enemy position comparisons
// Typical: LDA playerX / SEC / SBC enemyX / CMP #width
for (let addr = BASE; addr < BASE + 32768 - 10; addr++) {
  // LDA $86 ; SEC ; SBC $87,X  pattern (player X - enemy X)
  if (prgByte(addr) === 0xA5 && prgByte(addr+1) === 0x86 &&
      prgByte(addr+2) === 0x38 &&
      prgByte(addr+3) === 0xF5 && prgByte(addr+4) === 0x87) {
    console.log(`  ${hex(addr)}: LDA $86 / SEC / SBC $87,X — player X - enemy X!`);
  }
}

console.log('\n=== Analysis complete ===');
