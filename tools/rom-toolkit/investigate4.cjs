/**
 * Investigation Round 4: Solve level warping, sprite injection, invincibility
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

// Boot
step(60);
nes.buttonDown(1, Controller.BUTTON_START);
step(1);
nes.buttonUp(1, Controller.BUTTON_START);
step(180);
const gameplayState = nes.toJSON();

// ============================================================
// EXPERIMENT 21: Sprite injection timing test
// ============================================================
console.log('=== EXPERIMENT 21: Sprite injection via OAM shadow ===');
nes.fromJSON(gameplayState);
step(30);

// Strategy: Write to $0200 BETWEEN frame() calls
// If NMI DMA runs BEFORE game code, our data will render
// Use a high slot (60-63) that the game might not actively use

// First, check what's at high OAM shadow slots
console.log('OAM shadow slots 56-63 before injection:');
for (let s = 56; s < 64; s++) {
  const base = 0x0200 + s * 4;
  console.log(`  Slot ${s}: Y=${ram(base)} tile=0x${ram(base+1).toString(16)} attr=${ram(base+2)} X=${ram(base+3)}`);
}

// Write our sprite to slot 60
const slot = 60;
const base = 0x0200 + slot * 4;
nes.cpu.mem[base] = 100;      // Y = 100
nes.cpu.mem[base + 1] = 0x36; // Tile = mushroom-ish
nes.cpu.mem[base + 2] = 0x01; // Attr = palette 1, no flip
nes.cpu.mem[base + 3] = 128;  // X = 128 (center-ish)

// Now run ONE frame — if our DMA timing theory is right, the sprite shows
nes.frame();

// Check OAM in PPU after the frame
const pslot = slot * 4;
console.log(`\nAfter 1 frame, PPU OAM slot ${slot}:`);
console.log(`  Y=${nes.ppu.spriteMem[pslot]} tile=0x${nes.ppu.spriteMem[pslot+1].toString(16)} attr=${nes.ppu.spriteMem[pslot+2]} X=${nes.ppu.spriteMem[pslot+3]}`);
console.log(`RAM shadow slot ${slot}:`);
console.log(`  Y=${ram(base)} tile=0x${ram(base+1).toString(16)} attr=${ram(base+2)} X=${ram(base+3)}`);

// Also check: does the game actively clear high OAM slots?
// Write to all 64 slots and see which ones survive
nes.fromJSON(gameplayState);
step(30);
const testState = nes.toJSON();

// Write to all 64 OAM shadow slots
for (let s = 0; s < 64; s++) {
  const b = 0x0200 + s * 4;
  nes.cpu.mem[b] = 100;
  nes.cpu.mem[b+1] = 0xAA;
  nes.cpu.mem[b+2] = 0x00;
  nes.cpu.mem[b+3] = 100;
}
nes.frame(); // Let game process

// Check which slots survived
console.log('\nSlots where Y=100 survived after frame:');
const survived = [];
for (let s = 0; s < 64; s++) {
  const b = 0x0200 + s * 4;
  if (ram(b) === 100) survived.push(s);
}
console.log(`  ${survived.length} slots survived:`, survived);

console.log('\nSlots where tile=0xAA survived:');
const tileSurvived = [];
for (let s = 0; s < 64; s++) {
  const b = 0x0200 + s * 4;
  if (ram(b+1) === 0xAA) tileSurvived.push(s);
}
console.log(`  ${tileSurvived.length} slots survived:`, tileSurvived);

// Check which slots have game-written Y (not 0xFF and not 100)
console.log('\nSlots with game-written Y values:');
for (let s = 0; s < 64; s++) {
  const b = 0x0200 + s * 4;
  const y = ram(b);
  if (y !== 100 && y < 0xEF) {
    console.log(`  Slot ${s}: Y=${y} tile=0x${ram(b+1).toString(16)} X=${ram(b+3)}`);
  }
}

// ============================================================
// EXPERIMENT 22: Level warp — careful state manipulation
// ============================================================
console.log('\n=== EXPERIMENT 22: Level warp approaches ===');

// Approach A: Set world/level, then trigger "pipe entrance" via player state
nes.fromJSON(gameplayState);
console.log('Current state: $0770=' + ram(0x0770) + ' $0772=' + ram(0x0772));
console.log('$000E=' + ram(0x000E) + ' $001D=' + ram(0x001D));
console.log('$0750=' + ram(0x0750) + ' $0751=' + ram(0x0751));

// Let's examine what changes during natural level progression
// Run to the end of 1-1 by moving right... that takes too long
// Instead, let's use the known warp zone in 1-1

// Approach B: Simulate entering the warp zone pipe
// The warp zone sets $075F and triggers pipe entrance
// Pipe entrance sets $000E to some value (entering pipe)

// Let me try ALL player states to see which triggers level transition
console.log('\nTesting player states ($000E) for level transition:');
for (let state = 0; state < 16; state++) {
  nes.fromJSON(gameplayState);
  wram(0x075F, 2); // World 3
  wram(0x0760, 0); // Level 1
  wram(0x000E, state);
  step(120);
  const finalWorld = ram(0x075F);
  const finalLevel = ram(0x0760);
  const finalMode = ram(0x079F);
  const finalState = ram(0x000E);
  const changed = (finalWorld !== 2 || finalLevel !== 0);
  console.log(`  State ${state}: → W${finalWorld+1}-${finalLevel+1}, mode=${finalMode}, $000E=${finalState}${changed ? ' *** CHANGED' : ''}`);
}

// Approach C: Try manipulating $0770 (OperMode) directly
console.log('\nTesting OperMode ($0770):');
for (let mode = 0; mode < 4; mode++) {
  nes.fromJSON(gameplayState);
  wram(0x075F, 2); // World 3
  wram(0x0760, 0); // Level 1
  wram(0x0770, mode);
  step(300);
  console.log(`  $0770=${mode}: → W${ram(0x075F)+1}-${ram(0x0760)+1}, $0770=${ram(0x0770)}, $079F=${ram(0x079F)}`);
}

// Approach D: Try manipulating $0772 (GameEngineSubroutine or AreaType)
console.log('\nTesting $0772:');
for (let val = 0; val < 8; val++) {
  nes.fromJSON(gameplayState);
  wram(0x075F, 2); // World 3
  wram(0x0760, 0); // Level 1
  wram(0x0772, val);
  step(300);
  console.log(`  $0772=${val}: → W${ram(0x075F)+1}-${ram(0x0760)+1}, $0772=${ram(0x0772)}`);
}

// ============================================================
// EXPERIMENT 23: Invincibility — find the right address
// ============================================================
console.log('\n=== EXPERIMENT 23: Invincibility / no-death ===');
nes.fromJSON(gameplayState);

// $079E seems to be a timer (counted down from 255)
// For true invincibility, we might need:
// 1. Star timer ($079E) — prevents collision damage
// 2. Something to prevent pit death

// Let's test: does $079E prevent enemy collision?
nes.fromJSON(gameplayState);
wram(0x079E, 200); // Set star timer
nes.buttonDown(1, Controller.BUTTON_RIGHT);
step(180); // Run into enemies
nes.buttonUp(1, Controller.BUTTON_RIGHT);
console.log('Star timer test: lives=' + ram(0x075A) + ' $000E=' + ram(0x000E) + ' $079E=' + ram(0x079E));

// Also check $0752 (Player_CollisionBits?) and similar
nes.fromJSON(gameplayState);
console.log('$0752 (collision?):', ram(0x0752));
console.log('$0753:', ram(0x0753));
console.log('$0754:', ram(0x0754));

// Try: set $0756 to fire mario (2) and check if collision changes
nes.fromJSON(gameplayState);
wram(0x0756, 2); // Fire Mario
step(1);
console.log('As Fire Mario: $0756=' + ram(0x0756));

// Try running into an enemy as big Mario
nes.fromJSON(gameplayState);
wram(0x0756, 1); // Big Mario
nes.buttonDown(1, Controller.BUTTON_RIGHT);
step(200);
nes.buttonUp(1, Controller.BUTTON_RIGHT);
console.log('Big Mario collision: $0756=' + ram(0x0756) + ' $000E=' + ram(0x000E) + ' lives=' + ram(0x075A));

// ============================================================
// EXPERIMENT 24: Find the area loading mechanism
// ============================================================
console.log('\n=== EXPERIMENT 24: Area loading ===');

// In SMB, there's a distinction between "level" (world-stage) and "area" (sub-level)
// Warp pipes go to different areas within the same or different worlds
// The area pointer system uses:
// $074E = AreaPointer or similar (the index into the area data tables)
// $075C = Secondary hard mode flag

// Let's scan $074E-$0770 for everything non-zero
nes.fromJSON(gameplayState);
step(30);
console.log('$074E-$077F:');
for (let i = 0x074E; i <= 0x077F; i++) {
  const v = ram(i);
  if (v !== 0) console.log(`  $${i.toString(16)}: ${v}`);
}

// The SMB source code reveals:
// $074E = AreaPointerLo... no
// Let's try the "soft reset" approach: trigger the game to go back to
// the "World X-Y" intro screen with new world/level values

// In SMB, the world/level intro is shown when entering a new level
// The game mode sequence: gameplay → death → lives screen → game over OR respawn
// For respawn: game goes to "World X-Y" screen then loads the level

// Maybe $0712 (ScreenLeft_X_Pos?) or $0750 (ScreenRoutineTask?)
// controls the screen transition

// Let me try: set world/level and then trigger the "go to level intro" transition
// by finding what flag the game checks

// Approach: Look at $06D5 or $06D6 or similar - some games use these as "transition in progress"
console.log('\n$06D0-$06FF:');
for (let i = 0x06D0; i <= 0x06FF; i++) {
  const v = ram(i);
  if (v !== 0) console.log(`  $${i.toString(16)}: ${v}`);
}

// Try the nuclear option: set ALL relevant state for a new level
console.log('\nNuclear warp attempt:');
nes.fromJSON(gameplayState);
wram(0x075F, 4); // World 5
wram(0x0760, 0); // Level 1
wram(0x0750, 0); // Reset area stuff
wram(0x074E, 0);
wram(0x0772, 0); // Reset sub-routine state
wram(0x0770, 0); // Try title mode? no...

// What if we need to manipulate $0007/$0008 (the NMI/game loop control)?
// Or $0776 (IntervalTimerControl)?
console.log('$0776:', ram(0x0776));
console.log('$0777:', ram(0x0777));

// Actually, let me try manipulating $0712 which might be ChangeAreaType
console.log('\nTesting area-change related addresses:');
nes.fromJSON(gameplayState);
wram(0x075F, 4); // World 5
wram(0x0760, 0); // Level 1

// Common pattern in SMB: set OperMode to 1 (GameBegin) to trigger level load
wram(0x0770, 1); // Set to "game begin" mode
wram(0x0772, 0); // Reset task counter
step(300);
console.log(`OperMode=1: W${ram(0x075F)+1}-${ram(0x0760)+1}, $0770=${ram(0x0770)}, $0772=${ram(0x0772)}, X=${ram(0x0086)}, Y=${ram(0x00CE)}`);

// Check if we're actually in a new level by looking at the scroll position
console.log('Scroll: $071A=' + ram(0x071A) + ' $071B=' + ram(0x071B) + ' $071C=' + ram(0x071C));

console.log('\n=== Investigation Round 4 complete ===');
