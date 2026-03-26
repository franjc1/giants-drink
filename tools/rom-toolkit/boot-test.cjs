/**
 * Boot test: Load SMB, advance to gameplay, verify control.
 * Run: node tools/rom-toolkit/boot-test.js
 */
const fs = require('fs');
const { NES } = require('jsnes');
const { Controller } = require('jsnes');

const ROM_PATH = `${process.env.HOME}/nes-roms/Super Mario Bros. (World).nes`;

// Load ROM
const romData = fs.readFileSync(ROM_PATH);
let lastFrame = null;

const nes = new NES({
  onFrame: function(fb) { lastFrame = fb; },
  onAudioSample: function(l, r) {}
});

nes.loadROM(romData.toString('binary'));
console.log('ROM loaded.');

// Helper: advance N frames
function step(n) { for (let i = 0; i < n; i++) nes.frame(); }

// Helper: read OAM sprite
function readOAM(slot) {
  const base = slot * 4;
  return {
    y: nes.ppu.spriteMem[base],
    tile: nes.ppu.spriteMem[base + 1],
    attr: nes.ppu.spriteMem[base + 2],
    x: nes.ppu.spriteMem[base + 3]
  };
}

// Helper: read RAM
function ram(addr) { return nes.cpu.mem[addr]; }

// Boot through title screen
// SMB: power on → title screen. Press START to begin.
step(60); // Wait for title screen
nes.buttonDown(1, Controller.BUTTON_START);
step(1);
nes.buttonUp(1, Controller.BUTTON_START);
step(120); // Wait for game to start

// Check game mode
console.log('Game mode ($079F):', ram(0x079F));
console.log('World:', ram(0x075F) + 1, 'Level:', ram(0x0760) + 1);
console.log('Lives:', ram(0x075A));
console.log('Player X ($0086):', ram(0x0086));
console.log('Player Y ($00CE):', ram(0x00CE));
console.log('Powerup ($0756):', ram(0x0756));

// Read first few OAM sprites
console.log('\nFirst 8 OAM sprites:');
for (let i = 0; i < 8; i++) {
  const s = readOAM(i);
  if (s.y < 0xEF) {
    console.log(`  Slot ${i}: x=${s.x} y=${s.y} tile=0x${s.tile.toString(16)} attr=0x${s.attr.toString(16)}`);
  }
}

// Save player X, hold RIGHT for 60 frames, check X changed
const xBefore = ram(0x0086);
nes.buttonDown(1, Controller.BUTTON_RIGHT);
step(60);
nes.buttonUp(1, Controller.BUTTON_RIGHT);
const xAfter = ram(0x0086);

console.log(`\nControl test: X before=${xBefore}, X after=${xAfter}, delta=${xAfter - xBefore}`);
if (xAfter > xBefore) {
  console.log('✓ Player moved right. Control confirmed.');
} else {
  console.log('✗ Player did not move. Something is wrong.');
}

// Print some key RAM areas for investigation
console.log('\nRAM $0000-$000F:');
let line = '';
for (let i = 0; i <= 0x0F; i++) {
  line += ram(i).toString(16).padStart(2, '0') + ' ';
}
console.log(' ', line);

console.log('\nRAM $0750-$076F:');
line = '';
for (let i = 0x0750; i <= 0x076F; i++) {
  line += ram(i).toString(16).padStart(2, '0') + ' ';
}
console.log(' ', line);
