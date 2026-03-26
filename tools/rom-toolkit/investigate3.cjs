/**
 * Investigation Round 3: CHR-ROM internals, level warping, enemy speed control
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
// EXPERIMENT 16: jsnes CHR-ROM structure
// ============================================================
console.log('=== EXPERIMENT 16: CHR-ROM internals ===');

// rom.vrom is an array of 4KB banks
console.log('rom.vrom type:', typeof nes.rom.vrom);
console.log('rom.vrom length:', nes.rom.vrom.length);
if (nes.rom.vrom[0]) {
  console.log('rom.vrom[0] type:', typeof nes.rom.vrom[0]);
  console.log('rom.vrom[0] length:', nes.rom.vrom[0].length);
  // vrom[0] is probably a 4KB bank containing pattern table data
  console.log('rom.vrom[0] first 32 bytes:', Array.from(nes.rom.vrom[0].slice(0, 32)).map(b => b.toString(16).padStart(2,'0')).join(' '));
}

// vromTile is the decoded tile cache
console.log('\nrom.vromTile type:', typeof nes.rom.vromTile);
console.log('rom.vromTile length:', nes.rom.vromTile.length);
if (nes.rom.vromTile[0]) {
  console.log('rom.vromTile[0] type:', typeof nes.rom.vromTile[0]);
  console.log('rom.vromTile[0] length:', nes.rom.vromTile[0].length);
  // Each tile entry in vromTile should be a decoded 8x8 pixel tile (64 bytes of 2-bit values)
  if (nes.rom.vromTile[0][0]) {
    console.log('rom.vromTile[0][0] type:', typeof nes.rom.vromTile[0][0]);
    if (nes.rom.vromTile[0][0].pix) {
      console.log('Tile 0 has pix array, length:', nes.rom.vromTile[0][0].pix.length);
      console.log('Tile 0 pix data:', Array.from(nes.rom.vromTile[0][0].pix.slice(0, 16)));
    } else {
      console.log('Tile 0 keys:', Object.keys(nes.rom.vromTile[0][0]));
    }
  }
}

// Check PPU ptTile (pattern table tile cache)
console.log('\nppu.ptTile type:', typeof nes.ppu.ptTile);
console.log('ppu.ptTile length:', nes.ppu.ptTile.length);
if (nes.ppu.ptTile[0]) {
  console.log('ppu.ptTile[0] type:', typeof nes.ppu.ptTile[0]);
  if (nes.ppu.ptTile[0].pix) {
    console.log('ppu.ptTile[0] has pix, length:', nes.ppu.ptTile[0].pix.length);
    console.log('ppu.ptTile[0].pix[0..15]:', Array.from(nes.ppu.ptTile[0].pix.slice(0, 16)));
  } else {
    const keys = Object.keys(nes.ppu.ptTile[0]);
    console.log('ppu.ptTile[0] keys:', keys);
    // Print all properties
    for (const k of keys) {
      const v = nes.ppu.ptTile[0][k];
      if (Array.isArray(v) || (v && v.length)) {
        console.log(`  ${k}: array[${v.length}]`, Array.from(v).slice(0, 8));
      } else {
        console.log(`  ${k}:`, v);
      }
    }
  }
}

// Read ground tile ($B4) from the pattern table
const groundTileIdx = 0xB4;
console.log(`\nGround tile $B4 from ptTile[${groundTileIdx}]:`);
const gTile = nes.ppu.ptTile[groundTileIdx];
if (gTile) {
  const keys = Object.keys(gTile);
  console.log('Keys:', keys);
  if (gTile.pix) {
    // Print 8x8 tile
    for (let row = 0; row < 8; row++) {
      const line = Array.from(gTile.pix.slice(row * 8, row * 8 + 8)).join('');
      console.log(`  ${line}`);
    }
  }
}

// Also check tile 0xB4 in BG pattern table (offset by 256 for second table)
console.log(`\nGround tile from ptTile[${256 + groundTileIdx}]:`);
const gTile2 = nes.ppu.ptTile[256 + groundTileIdx];
if (gTile2 && gTile2.pix) {
  for (let row = 0; row < 8; row++) {
    const line = Array.from(gTile2.pix.slice(row * 8, row * 8 + 8)).join('');
    console.log(`  ${line}`);
  }
}

// ============================================================
// EXPERIMENT 17: Can we modify ptTile to change visuals?
// ============================================================
console.log('\n=== EXPERIMENT 17: Tile modification test ===');

// Try writing to ptTile pixels
const testTile = nes.ppu.ptTile[256 + 0xB4]; // BG table ground tile
if (testTile && testTile.pix) {
  console.log('Before modification:');
  for (let row = 0; row < 8; row++) {
    console.log('  ' + Array.from(testTile.pix.slice(row * 8, row * 8 + 8)).join(''));
  }

  // Fill with a simple pattern (checkerboard)
  for (let row = 0; row < 8; row++) {
    for (let col = 0; col < 8; col++) {
      testTile.pix[row * 8 + col] = (row + col) % 2 === 0 ? 3 : 1;
    }
  }

  console.log('After modification:');
  for (let row = 0; row < 8; row++) {
    console.log('  ' + Array.from(testTile.pix.slice(row * 8, row * 8 + 8)).join(''));
  }

  // Advance a frame to see if it takes effect
  step(1);
  console.log('After frame advance, tile still modified:', testTile.pix[0] === 3 ? 'YES' : 'NO');
}

// ============================================================
// EXPERIMENT 18: Level warp via pipe entrance mechanism
// ============================================================
console.log('\n=== EXPERIMENT 18: Level warp mechanism ===');
nes.fromJSON(gameplayState);

// In SMB, the proper way to warp:
// 1. $075F = target world (0-indexed)
// 2. $0760 = target level (0-indexed)
// 3. Set some kind of "transition" or "load new area" trigger
//
// SMB internals:
// $0772 = area type (0=water, 1=ground, 2=underground, 3=castle)
// $074E = some kind of game timer state
// $0712 = player action state
//
// Let's try triggering the "enter pipe" animation/event
// which naturally causes a level transition

// Approach: manipulate the "next area" and trigger a transition
// In SMB disassembly, the relevant addresses are:
// $075C = "WarpZoneControl" or similar
// $0750 = area number/pointer
// $0751 = area pointer offset

// Let's try a different approach: emulate what the game does when you
// enter a warp zone pipe

// First, try the brute force: set world/level and trigger player death,
// which will reload at the new level
console.log('Approach 1: Set world/level + trigger death & respawn');
nes.fromJSON(gameplayState);
wram(0x075F, 3); // World 4
wram(0x0760, 0); // Level 1
wram(0x075A, 5); // Extra lives so we don't game over
wram(0x000E, 0x0B); // Player state = dying
step(300); // Let death animation play
console.log(`  After death: W${ram(0x075F)+1}-${ram(0x0760)+1}, mode=${ram(0x079F)}, lives=${ram(0x075A)}, state=$000E=${ram(0x000E)}`);
step(300); // More time
console.log(`  After more time: W${ram(0x075F)+1}-${ram(0x0760)+1}, mode=${ram(0x079F)}, lives=${ram(0x075A)}`);

// Check if we need to press start on the "level intro" screen
nes.buttonDown(1, Controller.BUTTON_START);
step(1);
nes.buttonUp(1, Controller.BUTTON_START);
step(120);
console.log(`  After START: W${ram(0x075F)+1}-${ram(0x0760)+1}, mode=${ram(0x079F)}`);

// ============================================================
// EXPERIMENT 19: Enemy speed manipulation
// ============================================================
console.log('\n=== EXPERIMENT 19: Enemy speed control ===');
nes.fromJSON(gameplayState);
nes.buttonDown(1, Controller.BUTTON_RIGHT);
step(120);
nes.buttonUp(1, Controller.BUTTON_RIGHT);

// Enemy is near, let's find its speed address
// Enemy 0 is at $0087 (X), moves -0.5 px/frame
// In SMB, enemy horizontal speed is stored as sub-pixel movement
// Let's scan for the enemy speed variable

// The pattern: player X = $0086, sub-pixel = $0400
// So enemy sub-pixel might be at $0401+ or similar

console.log('Checking sub-pixel areas:');
console.log('$0400-$0405:', Array.from({length:6}, (_, i) => ram(0x0400 + i)));
console.log('$0058-$005F:', Array.from({length:8}, (_, i) => ram(0x0058 + i)));
console.log('$00A0-$00A8:', Array.from({length:9}, (_, i) => ram(0x00A0 + i)));
console.log('$004E-$0056:', Array.from({length:9}, (_, i) => ram(0x004E + i)));

// Let's try to find it by probing: save state, write speed values, check if enemy moves differently
const enemySave = nes.toJSON();
const origEnemyX = ram(0x0087);

// Try setting $0058 (parallel to $0057 which was 24 for player)
console.log('\nProbing enemy speed by write-and-observe:');
const candidates = [0x0058, 0x0401, 0x00A0, 0x004F, 0x0050, 0x0057];
for (const addr of candidates) {
  nes.fromJSON(enemySave);
  const before = ram(0x0087);
  wram(addr, 0); // Zero out potential speed
  step(10);
  const after = ram(0x0087);
  const moved = after - before;

  nes.fromJSON(enemySave);
  const before2 = ram(0x0087);
  wram(addr, 200); // High speed
  step(10);
  const after2 = ram(0x0087);
  const moved2 = after2 - before2;

  console.log(`  $${addr.toString(16)}: speed=0 → moved ${moved}, speed=200 → moved ${moved2}`);
}

// Also try: modify the enemy's Y velocity
nes.fromJSON(enemySave);
console.log('\n$009F-$00A8 (velocity area):');
for (let i = 0x009F; i <= 0x00A8; i++) {
  console.log(`  $${i.toString(16)}: ${ram(i)}`);
}

// In SMB, the goomba's horizontal speed is determined by its movement routine
// which reads from a speed table in ROM. The speed value is likely at:
// $006E-$0072 or $0044-$0048 (parallel arrays by enemy slot)
console.log('\n$0044-$004D:');
for (let i = 0x0044; i <= 0x004D; i++) {
  console.log(`  $${i.toString(16)}: ${ram(i)}`);
}
console.log('$006E-$0077:');
for (let i = 0x006E; i <= 0x0077; i++) {
  console.log(`  $${i.toString(16)}: ${ram(i)}`);
}

// ============================================================
// EXPERIMENT 20: OAM sprite injection
// ============================================================
console.log('\n=== EXPERIMENT 20: Sprite injection ===');
nes.fromJSON(gameplayState);
step(30);

// OAM has 64 slots of 4 bytes each. Find an empty slot.
console.log('Finding empty OAM slots...');
let emptySlots = [];
for (let i = 0; i < 64; i++) {
  const y = nes.ppu.spriteMem[i * 4];
  if (y >= 0xEF) emptySlots.push(i);
}
console.log(`Found ${emptySlots.length} empty slots`);
console.log('First 5 empty:', emptySlots.slice(0, 5));

// Inject a sprite at an empty slot
if (emptySlots.length > 0) {
  const slot = emptySlots[0];
  const base = slot * 4;
  nes.ppu.spriteMem[base] = 100;  // Y
  nes.ppu.spriteMem[base + 1] = 0x36; // Tile (mushroom or similar)
  nes.ppu.spriteMem[base + 2] = 0x01; // Attributes (palette 1)
  nes.ppu.spriteMem[base + 3] = 100;  // X
  step(1);
  console.log(`Injected sprite at slot ${slot}: y=${nes.ppu.spriteMem[base]}, tile=0x${nes.ppu.spriteMem[base+1].toString(16)}, x=${nes.ppu.spriteMem[base+3]}`);

  // Check if it persists after a frame (game might overwrite OAM during DMA)
  step(1);
  console.log(`After 1 frame: y=${nes.ppu.spriteMem[base]}, tile=0x${nes.ppu.spriteMem[base+1].toString(16)}`);

  // The issue: NES games do OAM DMA every frame (write all 256 bytes from RAM $0200-$02FF to OAM)
  // So we need to write to the OAM shadow in RAM at $0200-$02FF
  console.log('\nOAM shadow test:');
  const ramSlot = emptySlots[0];
  const ramBase = 0x0200 + ramSlot * 4;
  nes.cpu.mem[ramBase] = 100;     // Y
  nes.cpu.mem[ramBase + 1] = 0x36; // Tile
  nes.cpu.mem[ramBase + 2] = 0x01; // Attr
  nes.cpu.mem[ramBase + 3] = 100;  // X
  step(2); // OAM DMA should transfer this
  console.log(`RAM shadow → OAM: y=${nes.ppu.spriteMem[ramSlot * 4]}, tile=0x${nes.ppu.spriteMem[ramSlot * 4 + 1].toString(16)}`);
}

console.log('\n=== Investigation Round 3 complete ===');
