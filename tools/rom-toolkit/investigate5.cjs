/**
 * Investigation Round 5: Level warping via OperMode reset, invincibility deep dive
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

// Boot to gameplay
step(60);
nes.buttonDown(1, Controller.BUTTON_START);
step(1);
nes.buttonUp(1, Controller.BUTTON_START);
step(180);
const gameplayState = nes.toJSON();

// ============================================================
// EXPERIMENT 25: Level warp via OperMode_Task reset
// ============================================================
console.log('=== EXPERIMENT 25: Warp via OperMode_Task ($0772) ===');

// In SMB, $0770=OperMode, $0772=OperMode_Task
// GameMode ($0770=1) tasks: 0=InitializeArea, 1=ScreenRoutines, 2=SecondaryGameSetup, 3=GameCoreRoutine
// Currently in gameplay: $0770=1, $0772=3
// Theory: set world/level, reset $0772 to 0 → game re-initializes area

nes.fromJSON(gameplayState);
console.log('Before warp: $0770=' + ram(0x0770) + ' $0772=' + ram(0x0772));
console.log('W' + (ram(0x075F)+1) + '-' + (ram(0x0760)+1));

// Warp to World 4-1
wram(0x075F, 3); // World 4 (0-indexed)
wram(0x0760, 0); // Level 1 (0-indexed)
wram(0x0772, 0); // Reset to InitializeArea

// Also need to reset some area-related state
// $0750 might be AreaNumber or similar — try resetting
wram(0x0750, 0);
wram(0x0751, 0);

step(300); // Give time for initialization

console.log('After warp attempt: $0770=' + ram(0x0770) + ' $0772=' + ram(0x0772));
console.log('W' + (ram(0x075F)+1) + '-' + (ram(0x0760)+1));
console.log('Player pos: X=' + ram(0x0086) + ' Y=' + ram(0x00CE));

// Verify by checking nametable content (different levels have different tile layouts)
const ntSample = [];
for (let col = 0; col < 16; col++) {
  ntSample.push(ram(0x2000 + 25 * 32 + col)); // This is CPU address, need VRAM
}
// Actually nametables are in PPU VRAM
console.log('Nametable row 25 (first 16 tiles):');
let line = '';
for (let col = 0; col < 16; col++) {
  line += nes.ppu.vramMem[0x2000 + 25 * 32 + col].toString(16).padStart(2, '0') + ' ';
}
console.log(' ', line);

// Try moving right to verify we're in a different level
const state1 = nes.toJSON();
nes.buttonDown(1, Controller.BUTTON_RIGHT);
step(60);
nes.buttonUp(1, Controller.BUTTON_RIGHT);
console.log('After moving right: X=' + ram(0x0086));

// ============================================================
// EXPERIMENT 26: Warp via save state from title screen
// ============================================================
console.log('\n=== EXPERIMENT 26: Warp via fresh boot ===');

// Approach: capture the moment just before the game transitions from
// title to gameplay. At that point, modify world/level.
// Reload the ROM fresh
nes.loadROM(romData.toString('binary'));
step(60); // Title screen
const titleState = nes.toJSON();

// Press start — this begins the transition to gameplay
nes.buttonDown(1, Controller.BUTTON_START);
step(1);
nes.buttonUp(1, Controller.BUTTON_START);

// Now immediately set world/level before the game initializes
wram(0x075F, 3); // World 4
wram(0x0760, 0); // Level 1
step(180); // Let it load

console.log('Fresh boot warp: W' + (ram(0x075F)+1) + '-' + (ram(0x0760)+1));
console.log('$0770=' + ram(0x0770) + ' $0772=' + ram(0x0772));
console.log('Player: X=' + ram(0x0086) + ' Y=' + ram(0x00CE) + ' $000E=' + ram(0x000E));

// Check nametable to see if we got a different level
console.log('Nametable rows 24-27:');
for (let row = 24; row <= 27; row++) {
  line = '';
  for (let col = 0; col < 32; col++) {
    line += nes.ppu.vramMem[0x2000 + row * 32 + col].toString(16).padStart(2, '0') + ' ';
  }
  console.log(`  Row ${row}: ${line}`);
}

// ============================================================
// EXPERIMENT 27: Warp approach - set world/level each frame until game reads it
// ============================================================
console.log('\n=== EXPERIMENT 27: Persistent world/level write during boot ===');
nes.loadROM(romData.toString('binary'));
step(60);

nes.buttonDown(1, Controller.BUTTON_START);
step(1);
nes.buttonUp(1, Controller.BUTTON_START);

// Write world/level EVERY frame during the boot sequence
for (let i = 0; i < 180; i++) {
  wram(0x075F, 3); // World 4
  wram(0x0760, 0); // Level 1
  nes.frame();
}

console.log('Persistent write warp: W' + (ram(0x075F)+1) + '-' + (ram(0x0760)+1));
console.log('Player: X=' + ram(0x0086) + ' Y=' + ram(0x00CE));

// Check enemies and terrain to identify the level
// W4-1 is a Lakitu level (has Spinies/Lakitu)
console.log('Enemy types: ' + Array.from({length:5}, (_, i) => ram(0x0016+i)));

// Check if terrain is different by examining the first visible nametable row
console.log('Nametable row 0:');
line = '';
for (let col = 0; col < 32; col++) {
  line += nes.ppu.vramMem[0x2000 + col].toString(16).padStart(2, '0') + ' ';
}
console.log(' ', line);

// Compare with W1-1 nametable
nes.fromJSON(gameplayState);
step(30);
console.log('W1-1 Nametable row 0 (for comparison):');
line = '';
for (let col = 0; col < 32; col++) {
  line += nes.ppu.vramMem[0x2000 + col].toString(16).padStart(2, '0') + ' ';
}
console.log(' ', line);

// ============================================================
// EXPERIMENT 28: Warp via operMode reset to title then immediate start
// ============================================================
console.log('\n=== EXPERIMENT 28: OperMode reset ===');
nes.fromJSON(gameplayState);

// Set to title mode, then set world/level, then go to game mode
wram(0x0770, 0); // Title screen mode
wram(0x0772, 0);
step(30); // Let title initialize

// Now set our desired world/level
wram(0x075F, 3); // World 4
wram(0x0760, 0);

// Go back to game mode
wram(0x0770, 1); // Game mode
wram(0x0772, 0); // InitializeArea task
step(300);

console.log('OperMode reset warp: W' + (ram(0x075F)+1) + '-' + (ram(0x0760)+1));
console.log('$0770=' + ram(0x0770) + ' $0772=' + ram(0x0772));
console.log('Player: X=' + ram(0x0086) + ' Y=' + ram(0x00CE));
console.log('Lives=' + ram(0x075A));

// Test if playable
nes.buttonDown(1, Controller.BUTTON_RIGHT);
step(60);
nes.buttonUp(1, Controller.BUTTON_RIGHT);
console.log('After moving: X=' + ram(0x0086));

// ============================================================
// EXPERIMENT 29: Star invincibility deep test
// ============================================================
console.log('\n=== EXPERIMENT 29: Star invincibility ===');
nes.fromJSON(gameplayState);

// From exp 11: $079E decrements each frame (was 254 after setting 255)
// SMB star invincibility address from disassembly: $0079 or $079E
// Let's check both

// In SMB, the star state might be signaled by:
// $079E = StarInvincibleTimer — when > 0, player is invincible
// The palette cycling happens when this timer > 0

// From experiment: setting $079E=255, it became 254 after one frame → decrements
// But no palette cycling was observed. Maybe I need to also set a flag?

// Let me check: what's the state of the player during star invincibility?
// In SMB, getting a star sets $079E to some initial value (typically ~25-30 decimal)
// and also starts the star music

// Try a more realistic star duration
wram(0x079E, 0x1E); // 30 frames of star power
step(1);
console.log('Star timer after 1 frame:', ram(0x079E));

// Check if enemy collision is prevented
const starState = nes.toJSON();
nes.buttonDown(1, Controller.BUTTON_RIGHT);
step(150); // Run into enemies
nes.buttonUp(1, Controller.BUTTON_RIGHT);
console.log('After star + enemy contact: $000E=' + ram(0x000E) + ' lives=' + ram(0x075A) + ' $079E=' + ram(0x079E));

// Try with longer duration
nes.fromJSON(gameplayState);
wram(0x079E, 0xFF); // Max timer
nes.buttonDown(1, Controller.BUTTON_RIGHT);
// Keep refreshing timer
for (let i = 0; i < 200; i++) {
  wram(0x079E, 0xFF);
  nes.frame();
}
nes.buttonUp(1, Controller.BUTTON_RIGHT);
console.log('After persistent star: $000E=' + ram(0x000E) + ' lives=' + ram(0x075A));

// ============================================================
// EXPERIMENT 30: Death prevention via $000E freeze
// ============================================================
console.log('\n=== EXPERIMENT 30: Death prevention ===');
nes.fromJSON(gameplayState);

// If $000E controls player state, maybe preventing it from going to "dying"
// prevents death. Let's try freezing it at 8 (normal) or 0.

wram(0x0756, 0); // Small Mario (dies on hit)
nes.buttonDown(1, Controller.BUTTON_RIGHT);
for (let i = 0; i < 200; i++) {
  wram(0x000E, 8); // Force normal state
  nes.frame();
}
nes.buttonUp(1, Controller.BUTTON_RIGHT);
console.log('After freezing $000E=8: lives=' + ram(0x075A) + ' $000E=' + ram(0x000E) + ' $0756=' + ram(0x0756));

console.log('\n=== Investigation Round 5 complete ===');
