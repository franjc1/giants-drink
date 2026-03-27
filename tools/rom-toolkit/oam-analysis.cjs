/**
 * Part 1 Step 1: Analyze Mario's OAM presence across frames.
 * Understand which slots, tile indices, offsets, and how they change.
 */
const fs = require('fs');
const { NES } = require('jsnes');
const { Controller } = require('jsnes');

const ROM_PATH = `${process.env.HOME}/nes-roms/Super Mario Bros. (World).nes`;
const nes = new NES({ onFrame: () => {}, onAudioSample: () => {} });
nes.loadROM(fs.readFileSync(ROM_PATH).toString('binary'));

function step(n) { for (let i = 0; i < n; i++) nes.frame(); }
function ram(a) { return nes.cpu.mem[a]; }

// Boot
step(60);
nes.buttonDown(1, Controller.BUTTON_START); step(1); nes.buttonUp(1, Controller.BUTTON_START);
step(180);

// === Analyze OAM for Small Mario (standing) ===
console.log('=== Small Mario Standing ===');
const marioX = ram(0x0086);
const marioY = ram(0x00CE);
console.log(`Mario RAM pos: X=${marioX}, Y=${marioY}`);
console.log(`Powerup $0756: ${ram(0x0756)}`);

const slotHistory = [];
for (let f = 0; f < 60; f++) {
  nes.frame();
  const mx = ram(0x0086);
  const my = ram(0x00CE);
  const nearSlots = [];
  for (let s = 0; s < 64; s++) {
    const sy = nes.ppu.spriteMem[s * 4];
    const sx = nes.ppu.spriteMem[s * 4 + 3];
    const tile = nes.ppu.spriteMem[s * 4 + 1];
    const attr = nes.ppu.spriteMem[s * 4 + 2];
    if (sy < 0xEF && Math.abs(sx - mx) < 20 && Math.abs(sy - my) < 40) {
      nearSlots.push({ slot: s, x: sx, y: sy, tile, attr, dx: sx - mx, dy: sy - my });
    }
  }
  slotHistory.push({ frame: f, mx, my, slots: nearSlots });
}

// Report the consistent pattern
console.log('\nFrame 0 Mario sprites:');
slotHistory[0].slots.forEach(s => {
  console.log(`  Slot ${s.slot}: dx=${s.dx} dy=${s.dy} tile=$${s.tile.toString(16)} attr=$${s.attr.toString(16)}`);
});
console.log('\nFrame 30 Mario sprites:');
slotHistory[30].slots.forEach(s => {
  console.log(`  Slot ${s.slot}: dx=${s.dx} dy=${s.dy} tile=$${s.tile.toString(16)} attr=$${s.attr.toString(16)}`);
});

// Check slot stability across frames
const slotSets = slotHistory.map(h => h.slots.map(s => s.slot).sort().join(','));
const uniqueSets = [...new Set(slotSets)];
console.log(`\nSlot stability: ${uniqueSets.length} unique slot sets across 60 frames`);
if (uniqueSets.length <= 3) uniqueSets.forEach(s => console.log('  Set: [' + s + ']'));

// Tile stability
const tileSets = slotHistory.map(h => h.slots.map(s => s.tile.toString(16)).join(','));
const uniqueTiles = [...new Set(tileSets)];
console.log(`Tile stability: ${uniqueTiles.length} unique tile sets`);
if (uniqueTiles.length <= 5) uniqueTiles.forEach(s => console.log('  Tiles: [' + s + ']'));

// === Walk right (animation frames) ===
console.log('\n=== Small Mario Walking Right ===');
nes.buttonDown(1, Controller.BUTTON_RIGHT);
for (let f = 0; f < 30; f++) {
  nes.frame();
  const mx = ram(0x0086);
  const my = ram(0x00CE);
  const near = [];
  for (let s = 0; s < 64; s++) {
    const sy = nes.ppu.spriteMem[s * 4];
    const sx = nes.ppu.spriteMem[s * 4 + 3];
    if (sy < 0xEF && Math.abs(sx - mx) < 20 && Math.abs(sy - my) < 40) {
      near.push({ slot: s, tile: nes.ppu.spriteMem[s*4+1], attr: nes.ppu.spriteMem[s*4+2], dx: sx-mx, dy: sy-my });
    }
  }
  if (f % 5 === 0) {
    const tiles = near.map(n => '$' + n.tile.toString(16)).join(',');
    const attrs = near.map(n => '$' + n.attr.toString(16)).join(',');
    console.log(`  F${f}: ${near.length} sprites, tiles=[${tiles}] attrs=[${attrs}]`);
  }
}
nes.buttonUp(1, Controller.BUTTON_RIGHT);

// === Walk left (check H-flip) ===
console.log('\n=== Small Mario Walking Left ===');
nes.buttonDown(1, Controller.BUTTON_LEFT);
for (let f = 0; f < 15; f++) {
  nes.frame();
  const mx = ram(0x0086);
  const my = ram(0x00CE);
  const near = [];
  for (let s = 0; s < 64; s++) {
    const sy = nes.ppu.spriteMem[s * 4];
    const sx = nes.ppu.spriteMem[s * 4 + 3];
    if (sy < 0xEF && Math.abs(sx - mx) < 20 && Math.abs(sy - my) < 40) {
      near.push({ slot: s, attr: nes.ppu.spriteMem[s*4+2], dx: sx-mx, dy: sy-my });
    }
  }
  if (f % 5 === 0) {
    const attrs = near.map(n => '$' + n.attr.toString(16));
    const dxs = near.map(n => n.dx);
    console.log(`  F${f}: attrs=[${attrs}] dxs=[${dxs}] (check for H-flip bit6)`);
  }
}
nes.buttonUp(1, Controller.BUTTON_LEFT);

// === Check which OAM slot range is Mario vs enemies ===
console.log('\n=== Full OAM slot usage ===');
step(30);
for (let s = 0; s < 64; s++) {
  const y = nes.ppu.spriteMem[s * 4];
  if (y < 0xEF) {
    const tile = nes.ppu.spriteMem[s*4+1];
    const x = nes.ppu.spriteMem[s*4+3];
    console.log(`  Slot ${s}: X=${x} Y=${y} tile=$${tile.toString(16)} attr=$${nes.ppu.spriteMem[s*4+2].toString(16)}`);
  }
}

// === Determine safe CHR tile indices ===
console.log('\n=== CHR tiles in use ===');
const usedTiles = new Set();
for (let s = 0; s < 64; s++) {
  const y = nes.ppu.spriteMem[s * 4];
  if (y < 0xEF) usedTiles.add(nes.ppu.spriteMem[s*4+1]);
}
console.log('Tiles currently used by sprites:', [...usedTiles].sort((a,b) => a-b).map(t => '$' + t.toString(16)).join(', '));
console.log('Safe range for injection: $F0-$F7 (240-247)');

// Verify tiles $F0-$F7 are unused
const safe = [0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0xF7];
const conflict = safe.filter(t => usedTiles.has(t));
console.log('Conflicts with $F0-$F7:', conflict.length === 0 ? 'NONE (safe!)' : conflict.map(t => '$'+t.toString(16)).join(', '));
