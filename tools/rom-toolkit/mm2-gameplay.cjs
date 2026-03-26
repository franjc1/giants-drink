/**
 * MM2 — Get into actual gameplay and verify key addresses
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

// ============================================================
// Careful boot sequence
// ============================================================
console.log('Booting MM2...');

// Wait for title screen
step(300); // Give plenty of time for the title intro
console.log('Frame', 300, 'State:', ram(0x2A));

// Press START for title
nes.buttonDown(1, Controller.BUTTON_START);
step(1);
nes.buttonUp(1, Controller.BUTTON_START);
step(60);
console.log('After START, state:', ram(0x2A));

// May need another START for difficulty select
nes.buttonDown(1, Controller.BUTTON_START);
step(1);
nes.buttonUp(1, Controller.BUTTON_START);
step(120);
console.log('After 2nd START, state:', ram(0x2A));

// Check if we're on stage select
const stageSelectState = nes.toJSON();

// Navigate to a specific boss (try moving cursor and pressing START)
// MM2 stage select is a 3×3 grid (8 bosses)
// Default cursor position varies
// Let's just press START on whatever is highlighted
nes.buttonDown(1, Controller.BUTTON_START);
step(1);
nes.buttonUp(1, Controller.BUTTON_START);

// Wait for stage to load — MM2 has a long intro sequence
for (let i = 0; i < 20; i++) {
  step(60);
  const state = ram(0x2A);
  if (state >= 3 && state <= 8) {
    console.log(`Gameplay detected! State=${state} at frame ${300 + 60 + 120 + 60*i}`);
    break;
  }
  if (i === 19) console.log('Still waiting, state:', state);
}

const state2A = ram(0x2A);
console.log('\nFinal state $2A:', state2A);
console.log('Bank $29:', ram(0x29));

// Now check if we have sprites (player character)
const visibleSprites = [];
for (let s = 0; s < 64; s++) {
  const y = nes.ppu.spriteMem[s * 4];
  if (y < 0xEF && y > 0) {
    visibleSprites.push({
      slot: s, x: nes.ppu.spriteMem[s*4+3], y,
      tile: nes.ppu.spriteMem[s*4+1]
    });
  }
}
console.log('Visible sprites:', visibleSprites.length);
visibleSprites.slice(0, 10).forEach(s =>
  console.log(`  Slot ${s.slot}: X=${s.x} Y=${s.y} tile=$${s.tile.toString(16)}`));

// Save gameplay state
const gameplaySave = nes.toJSON();

// ============================================================
// Player position via OAM tracking during movement
// ============================================================
console.log('\n=== Movement tracking ===');

// Move right and track first cluster of sprites
const beforeSprites = visibleSprites.slice(0, 8).map(s => ({ ...s }));

nes.buttonDown(1, Controller.BUTTON_RIGHT);
step(30);
nes.buttonUp(1, Controller.BUTTON_RIGHT);

const afterSprites = [];
for (let s = 0; s < 64; s++) {
  const y = nes.ppu.spriteMem[s * 4];
  if (y < 0xEF && y > 0) {
    afterSprites.push({
      slot: s, x: nes.ppu.spriteMem[s*4+3], y,
      tile: nes.ppu.spriteMem[s*4+1]
    });
  }
}

// Find sprites that moved
console.log('Sprite movement:');
for (const before of beforeSprites) {
  const after = afterSprites.find(s => s.slot === before.slot);
  if (after && after.x !== before.x) {
    console.log(`  Slot ${before.slot}: X ${before.x}→${after.x} (delta=${after.x - before.x})`);
  }
}

// Now search RAM for the player X value
const playerOamX = afterSprites.length > 0 ? afterSprites[0].x : 0;
console.log('\nSearching RAM for player OAM X value:', playerOamX);
for (let addr = 0; addr < 0x800; addr++) {
  if (ram(addr) === playerOamX || ram(addr) === playerOamX - 1 || ram(addr) === playerOamX + 1) {
    // Verify it's actually player X by checking if it changes with movement
    nes.fromJSON(gameplaySave);
    step(5);
    const val1 = ram(addr);
    nes.buttonDown(1, Controller.BUTTON_RIGHT);
    step(20);
    nes.buttonUp(1, Controller.BUTTON_RIGHT);
    const val2 = ram(addr);
    if (val2 > val1 && val2 - val1 > 5 && val2 - val1 < 50) {
      console.log(`  $${addr.toString(16).padStart(4, '0')}: ${val1} → ${val2} (delta=${val2-val1}) ← PLAYER X CANDIDATE`);
    }
  }
}

// ============================================================
// Jump test — verify variable vs fixed height
// ============================================================
console.log('\n=== Jump height test ===');
nes.fromJSON(gameplaySave);
step(10);

// Find player Y address first
const snapBefore = new Uint8Array(0x800);
for (let i = 0; i < 0x800; i++) snapBefore[i] = ram(i);

nes.buttonDown(1, Controller.BUTTON_A);
step(3);
nes.buttonUp(1, Controller.BUTTON_A);

// Track ALL addresses frame by frame during jump
const jumpTrace = [];
for (let f = 0; f < 40; f++) {
  nes.frame();
  const snapshot = {};
  for (let addr = 0; addr < 0x100; addr++) {
    snapshot[addr] = ram(addr);
  }
  for (let addr = 0x0400; addr < 0x0600; addr++) {
    snapshot[addr] = ram(addr);
  }
  jumpTrace.push(snapshot);
}

// Find addresses that change monotonically then reverse (parabolic = Y position)
console.log('Addresses with parabolic pattern (jump Y candidates):');
for (const addr of Object.keys(jumpTrace[0]).map(Number)) {
  const values = jumpTrace.map(t => t[addr]);
  const initial = snapBefore[addr < 0x100 ? addr : addr]; // rough

  // Check if values first decrease then increase (or vice versa)
  let decreasing = 0, increasing = 0;
  for (let i = 1; i < values.length; i++) {
    if (values[i] < values[i-1]) decreasing++;
    if (values[i] > values[i-1]) increasing++;
  }
  if (decreasing > 5 && increasing > 5 && decreasing + increasing > values.length * 0.6) {
    console.log(`  $${addr.toString(16).padStart(4, '0')}: ${values.slice(0, 15).join(',')}`);
  }
}

// ============================================================
// Verify HP and weapon energy addresses
// ============================================================
console.log('\n=== HP/Energy verification ===');
nes.fromJSON(gameplaySave);
console.log('$06C0:', ram(0x06C0)); // HP display bar
console.log('$0304:', ram(0x0304)); // HP candidate
console.log('$0310:', ram(0x0310)); // HP candidate

// Player HP in MM2 is typically at $06C0 (display) or in the entity table
// Check $03xx area for entity data
console.log('\n$0300-$033F:');
for (let addr = 0x0300; addr < 0x0340; addr += 16) {
  const bytes = [];
  for (let i = 0; i < 16; i++) bytes.push(ram(addr + i).toString(16).padStart(2, '0'));
  console.log(`  $${addr.toString(16)}: ${bytes.join(' ')}`);
}

// Check $06B0-$06D0 (display/status area)
console.log('\n$06B0-$06D0:');
for (let addr = 0x06B0; addr < 0x06D0; addr += 16) {
  const bytes = [];
  for (let i = 0; i < 16; i++) bytes.push(ram(addr + i).toString(16).padStart(2, '0'));
  console.log(`  $${addr.toString(16)}: ${bytes.join(' ')}`);
}

console.log('\n=== Done ===');
