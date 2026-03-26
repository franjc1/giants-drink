/**
 * Investigation Round 2: Deeper probing
 * - Level warping mechanism
 * - CHR tile data in jsnes
 * - Enemy velocity addresses
 * - Invincibility / star timer
 * - Physics constants (ROM patching?)
 * - Death/pit fall mechanism
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

function step(n) { for (let i = 0; i < n; i++) nes.frame(); }
function ram(a) { return nes.cpu.mem[a]; }
function wram(a, v) { nes.cpu.mem[a] = v; }
function snapRAM() {
  const snap = new Uint8Array(0x800);
  for (let i = 0; i < 0x800; i++) snap[i] = ram(i);
  return snap;
}
function diffRAM(a, b) {
  const diffs = [];
  for (let i = 0; i < 0x800; i++) {
    if (a[i] !== b[i]) diffs.push({ addr: i, old: a[i], new: b[i] });
  }
  return diffs;
}

// Boot to gameplay
step(60);
nes.buttonDown(1, Controller.BUTTON_START);
step(1);
nes.buttonUp(1, Controller.BUTTON_START);
step(180);
const gameplayState = nes.toJSON();

// ============================================================
// EXPERIMENT 9: Level warping — find the trigger mechanism
// ============================================================
console.log('=== EXPERIMENT 9: Level warping ===');

// Method: Write world/level and try to trigger a level load
// SMB has game mode at $079F. Setting it might trigger transitions.
// Also check $0770 (load area flag?) and $0750 (area type?)

// Test 1: Just write world/level and advance
nes.fromJSON(gameplayState);
wram(0x075F, 3); // World 4
wram(0x0760, 0); // Level 1
step(60);
console.log('After writing W4-1: world=' + (ram(0x075F)+1) + ' level=' + (ram(0x0760)+1));
console.log('  Game mode:', ram(0x079F));

// Test 2: Try triggering a level load by manipulating game state
nes.fromJSON(gameplayState);
// In SMB, entering a pipe or reaching flagpole triggers level transition
// The area load flag might be what we need
// $0750 = "AreaNumber" or similar
// Let's try setting the "load new area" flag
console.log('\nLooking for area load mechanism...');
console.log('$0750:', ram(0x0750), '$0751:', ram(0x0751), '$0752:', ram(0x0752));
console.log('$0753:', ram(0x0753), '$0754:', ram(0x0754));
console.log('$0770:', ram(0x0770), '$0771:', ram(0x0771), '$0772:', ram(0x0772));

// Test 3: The pipe/warp mechanism
// In SMB disassembly, the warp zone works by setting:
// $075F = target world, then triggering the "load area" routine
// The key is $0750 = AreaIndex or similar
// Let me try: set world/level, then set $0770 (AreaLoaded flag?) to trigger reload
nes.fromJSON(gameplayState);
wram(0x075F, 3); // World 4 (0-indexed)
wram(0x0760, 0); // Level 1
wram(0x0770, 0); // Clear "area loaded" flag (if that's what this is)

// Also let's check what happens with game mode change
// $079F: 0 = running, 1 = ?, 2 = level intro
// Try setting mode to "level intro" which should reload the level
console.log('\nTrying game mode manipulation...');
const modes = [0, 1, 2, 3];
for (const mode of modes) {
  nes.fromJSON(gameplayState);
  wram(0x075F, 3);
  wram(0x0760, 0);
  wram(0x079F, mode);
  step(300); // Let it process
  console.log(`  Mode ${mode}: ended at W${ram(0x075F)+1}-${ram(0x0760)+1}, mode=${ram(0x079F)}, crashed=${ram(0x075F) > 7 ? 'MAYBE' : 'no'}`);
}

// ============================================================
// EXPERIMENT 10: Enemy velocity
// ============================================================
console.log('\n=== EXPERIMENT 10: Enemy velocity ===');
nes.fromJSON(gameplayState);
// Move right to encounter an enemy
nes.buttonDown(1, Controller.BUTTON_RIGHT);
step(120);
nes.buttonUp(1, Controller.BUTTON_RIGHT);

// Check if enemies are present
for (let slot = 0; slot < 5; slot++) {
  const type = ram(0x0016 + slot);
  const x = ram(0x0087 + slot);
  const y = ram(0x00CF + slot);
  if (type !== 0) {
    console.log(`Enemy slot ${slot}: type=${type}, x=${x}, y=${y}`);
  }
}

// Track enemy X position over frames to find velocity
const enemySave = nes.toJSON();
console.log('\nTracking enemy X positions over 30 frames:');
const enemyXs = [];
for (let f = 0; f < 30; f++) {
  nes.frame();
  const xs = [];
  for (let slot = 0; slot < 5; slot++) {
    if (ram(0x0016 + slot) !== 0) xs.push(ram(0x0087 + slot));
  }
  enemyXs.push(xs);
}
if (enemyXs[0].length > 0) {
  console.log('Enemy 0 X:', enemyXs.map(xs => xs[0] || '-').join(', '));
}

// Look for enemy velocity addresses
// In SMB, enemy horizontal speed might be at $00A0-$00A4 or similar (parallel to player $009F)
nes.fromJSON(enemySave);
const snap1 = snapRAM();
step(1);
const snap2 = snapRAM();

// Find addresses that change by consistent small values between frames when enemies move
const frameDiff = diffRAM(snap1, snap2);
console.log('\nFrame-to-frame changes (with active enemy):');
frameDiff.forEach(d => {
  // Filter to interesting ranges (not OAM, not counters)
  if (d.addr < 0x0200 && d.addr >= 0x0080) {
    const delta = d.new - d.old;
    console.log(`  $${d.addr.toString(16).padStart(4,'0')}: ${d.old} → ${d.new} (delta=${delta})`);
  }
});

// Try scanning for enemy speed addresses
// Typically parallel arrays: if player X=$0086, enemy X=$0087+
// Then player Y vel=$009F, maybe enemy Y vel=$00A0+?
// And horizontal speed might be at $0057/$0058+ or $004E/$004F+
console.log('\n$0057-$005F (possible speed area):');
for (let i = 0x0057; i <= 0x005F; i++) {
  console.log(`  $${i.toString(16)}: ${ram(i)}`);
}
console.log('$004E-$0056 (possible speed area):');
for (let i = 0x004E; i <= 0x0056; i++) {
  console.log(`  $${i.toString(16)}: ${ram(i)}`);
}

// ============================================================
// EXPERIMENT 11: Invincibility / Star power
// ============================================================
console.log('\n=== EXPERIMENT 11: Invincibility ===');
nes.fromJSON(gameplayState);

// Known: $079E might be star timer. Let's try setting it.
wram(0x079E, 0xFF); // Set star timer to max
step(30);
console.log('After setting $079E=255: $079E=' + ram(0x079E));

// Check if palettes are cycling (star power cycles colors)
const pal0 = nes.ppu.vramMem[0x3F00];
step(5);
const pal1 = nes.ppu.vramMem[0x3F00];
console.log('Palette cycling? Frame 0:', pal0, 'Frame 5:', pal1);

// Try other invincibility approaches
// $0754 = player "hurt" flag or similar?
// Let's check what happens when Mario touches an enemy
nes.fromJSON(gameplayState);
// Get position near the goomba
nes.buttonDown(1, Controller.BUTTON_RIGHT);
step(140);
nes.buttonUp(1, Controller.BUTTON_RIGHT);
const preDeathSnap = snapRAM();
const preDeathState = nes.toJSON();

// Walk into the goomba
nes.buttonDown(1, Controller.BUTTON_RIGHT);
step(30);
const postCollisionSnap = snapRAM();
const collision = diffRAM(preDeathSnap, postCollisionSnap);

console.log('\nChanges after walking into enemy area:');
collision.filter(d => d.addr >= 0x0700 && d.addr < 0x0800).forEach(d => {
  console.log(`  $${d.addr.toString(16)}: ${d.old} → ${d.new}`);
});

// ============================================================
// EXPERIMENT 12: CHR tile data in jsnes
// ============================================================
console.log('\n=== EXPERIMENT 12: CHR tile access ===');
nes.fromJSON(gameplayState);

// jsnes PPU tile structure
// In CHR-ROM games, tiles are stored in the ROM's CHR banks
// jsnes maps these into ppu.vramMem or through the tile cache
// Let's explore what's available
console.log('PPU properties:');
console.log('  vramMem length:', nes.ppu.vramMem.length);
console.log('  ptTile length (if exists):', nes.ppu.ptTile ? nes.ppu.ptTile.length : 'N/A');

// Check if we can read pattern table data
// Pattern tables: $0000-$0FFF (sprites), $1000-$1FFF (BG) or vice versa
// In jsnes, the pattern table is typically accessed through VRAM
console.log('\nFirst 16 bytes of VRAM (pattern table 0 start):');
let line = '';
for (let i = 0; i < 16; i++) {
  line += nes.ppu.vramMem[i].toString(16).padStart(2, '0') + ' ';
}
console.log(' ', line);

// Check the ROM's CHR data directly
// SMB is a CHR-ROM game (8KB CHR-ROM)
// In jsnes, chr data might be in rom.chr or similar
if (nes.rom) {
  console.log('\nROM object keys:', Object.keys(nes.rom).filter(k => typeof nes.rom[k] !== 'function').join(', '));
}

// Check if tile modification works via VRAM
// First, read the current ground tile pattern
// In SMB, the ground tile is in the BG pattern table
// Let's find the ground tile index from the nametable

// Read nametable (at VRAM $2000-$23FF)
console.log('\nNametable sample (row 26 = ground level, first 32 tiles):');
line = '';
const ntBase = 0x2000;
const groundRow = 26; // Near bottom of screen
for (let col = 0; col < 32; col++) {
  line += nes.ppu.vramMem[ntBase + groundRow * 32 + col].toString(16).padStart(2, '0') + ' ';
}
console.log(' ', line);

// SMB ground tile is typically tile $B4 or similar
// Let's verify by checking what tiles are at the ground level
console.log('\nNametable rows 24-27 (ground area):');
for (let row = 24; row <= 27; row++) {
  line = '';
  for (let col = 0; col < 32; col++) {
    line += nes.ppu.vramMem[ntBase + row * 32 + col].toString(16).padStart(2, '0') + ' ';
  }
  console.log(`  Row ${row}: ${line}`);
}

// ============================================================
// EXPERIMENT 13: Can we write to VRAM directly?
// ============================================================
console.log('\n=== EXPERIMENT 13: VRAM write test ===');

// Try modifying a palette color
const origPal = nes.ppu.vramMem[0x3F01]; // BG palette 0, color 1
nes.ppu.vramMem[0x3F01] = 0x16; // Change to red
step(1);
const newPal = nes.ppu.vramMem[0x3F01];
console.log(`Palette write: wrote 0x16 (red), read back 0x${newPal.toString(16)} (was 0x${origPal.toString(16)})`);

// Try modifying a CHR tile in VRAM
// The question is: does jsnes store tiles in vramMem for CHR-ROM games?
// For CHR-ROM, the data is loaded from the cartridge ROM, not written to VRAM
// It might be in a different location

// Let's check the tile cache
if (nes.ppu.ptTile) {
  console.log('ptTile array found, length:', nes.ppu.ptTile.length);
  // ptTile is the decoded tile cache
}

// Check ROM structure
if (nes.rom && nes.rom.rom) {
  console.log('rom.rom (PRG-ROM) length:', nes.rom.rom.length);
}
if (nes.rom && nes.rom.vrom) {
  console.log('rom.vrom (CHR-ROM) length:', nes.rom.vrom.length);
}
if (nes.rom && nes.rom.vromTile) {
  console.log('rom.vromTile length:', nes.rom.vromTile.length);
}

// ============================================================
// EXPERIMENT 14: Deeper physics — find where jump height is set
// ============================================================
console.log('\n=== EXPERIMENT 14: Jump height control ===');
nes.fromJSON(gameplayState);

// In SMB, jump velocity is set from a table in ROM at $B430
// But we can control it by modifying the Y velocity each frame
// $009F = Y vertical speed (discovered in exp 4)
// $00A0-$00A4 = enemy Y speeds?

// Let's verify $009F is Y velocity by manipulating it
step(30);
const yBefore = ram(0x00CE);
nes.buttonDown(1, Controller.BUTTON_A);
step(3); // Start the jump
const yVel = ram(0x009F);
console.log(`Y velocity at jump frame 3: $009F = ${yVel} (signed: ${yVel > 127 ? yVel - 256 : yVel})`);

// Now override the velocity to make a super jump
wram(0x009F, 0xF0); // -16 in signed = very fast upward
step(5);
console.log(`After setting velocity to -16: Y=${ram(0x00CE)}, $009F=${ram(0x009F)}`);
nes.buttonUp(1, Controller.BUTTON_A);

// Track for a few more frames to see if the game overwrites our value
for (let i = 0; i < 5; i++) {
  nes.frame();
  console.log(`  Frame +${i+1}: Y=${ram(0x00CE)}, vel=$009F=${ram(0x009F)} (${ram(0x009F) > 127 ? ram(0x009F) - 256 : ram(0x009F)})`);
}

// ============================================================
// EXPERIMENT 15: Death prevention — how does death work?
// ============================================================
console.log('\n=== EXPERIMENT 15: Death mechanism ===');
nes.fromJSON(gameplayState);
step(30);

// Drop Mario into a pit by moving right to the gap in 1-1
// Or just set Y to below screen
console.log('Testing death by Y position...');
wram(0x00CE, 240); // Below screen
step(60);
console.log(`After Y=240: mode=${ram(0x079F)}, lives=${ram(0x075A)}, Y=${ram(0x00CE)}`);

// Death state detection
nes.fromJSON(gameplayState);
step(30);
const preDeathState2 = nes.toJSON();
const preDeathRAM = snapRAM();

// Kill Mario by removing powerup and walking into enemy
wram(0x0756, 0); // Small Mario
nes.buttonDown(1, Controller.BUTTON_RIGHT);
step(200); // Walk into danger
const postDeath = snapRAM();
const deathDiffs = diffRAM(preDeathRAM, postDeath);
console.log('\nChanges after death attempt:');
deathDiffs.filter(d => d.addr >= 0x0700).forEach(d => {
  console.log(`  $${d.addr.toString(16)}: ${d.old} → ${d.new}`);
});
console.log('  Game mode:', ram(0x079F), 'Lives:', ram(0x075A));
console.log('  Player state $000E:', ram(0x000E));

// Check $0712 — this is sometimes the "player dead" flag in SMB
console.log('  $0712:', ram(0x0712), '$0713:', ram(0x0713));

console.log('\n=== Investigation Round 2 complete ===');
