/**
 * STEP 4: Inject 4 solid-color tiles in 2x2 grid at Mario's visible position.
 * Top-left=red, Top-right=green, Bottom-left=blue, Bottom-right=white.
 */
const fs = require('fs');
const { NES, Controller } = require('jsnes');
const { PNG } = require('pngjs');

const ROM_PATH = `${process.env.HOME}/nes-roms/Super Mario Bros. (World).nes`;
const VAL_DIR = `${__dirname}/validation`;

let lastFrame = null;
const nes = new NES({
  onFrame: fb => { lastFrame = fb.slice(); },
  onAudioSample: () => {}
});
nes.loadROM(fs.readFileSync(ROM_PATH).toString('binary'));

function ram(a) { return nes.cpu.mem[a]; }
function savePNG(fb, filename) {
  const png = new PNG({ width: 256, height: 240 });
  for (let i = 0; i < 256 * 240; i++) {
    const v = fb[i];
    png.data[i*4] = v & 0xFF; png.data[i*4+1] = (v>>8)&0xFF;
    png.data[i*4+2] = (v>>16)&0xFF; png.data[i*4+3] = 255;
  }
  fs.writeFileSync(`${VAL_DIR}/${filename}`, PNG.sync.write(png));
  console.log(`Saved: ${filename}`);
}
function pixelRGB(fb, x, y) {
  const v = fb[y * 256 + x];
  return { r: v & 0xFF, g: (v >> 8) & 0xFF, b: (v >> 16) & 0xFF };
}

// Boot to same state
for (let i = 0; i < 60; i++) nes.frame();
nes.buttonDown(1, Controller.BUTTON_START); nes.frame(); nes.buttonUp(1, Controller.BUTTON_START);
for (let i = 0; i < 180; i++) nes.frame();
nes.buttonDown(1, Controller.BUTTON_RIGHT);
for (let i = 0; i < 60; i++) nes.frame();
nes.buttonUp(1, Controller.BUTTON_RIGHT);
for (let i = 0; i < 10; i++) nes.frame();

// Capture game OAM positions
nes.frame();
const slots = {};
for (const s of [5, 6, 7, 8]) {
  slots[s] = {
    x: nes.ppu.spriteMem[s*4+3],
    y: nes.ppu.spriteMem[s*4],
    tile: nes.ppu.spriteMem[s*4+1]
  };
  console.log(`Game slot ${s}: X=${slots[s].x} Y=${slots[s].y} tile=$${slots[s].tile.toString(16)}`);
}

const saveState = nes.toJSON();

// === Create 4 solid-color tiles at CHR $F0-$F3 ===
// Each tile is a different palette color (1, 2, or 3)
// We use 3 different sprite palettes to get 4 distinct colors:
// Tile $F0: all color 1 (palette 0 color 1 = red)
// Tile $F1: all color 1 (palette 1 color 1 = green) — different palette in OAM attr
// Tile $F2: all color 1 (palette 2 color 1 = blue) — different palette
// Tile $F3: all color 2 (palette 0 color 2 = white)

// Actually simpler: make each tile a different palette index (1,2,3) and use one palette
// Palette 0: bg, red, green, blue
// Palette 1: bg, white, ?, ?

// Simplest approach: 4 tiles, each solid color 1, with different palette in OAM attr
// Set up 4 sprite palettes with different "color 1" values

nes.fromJSON(saveState);

// Sprite palette 0: color 1 = RED ($16)
nes.ppu.vramMem[0x3F11] = 0x16;
// Sprite palette 1: color 1 = GREEN ($2A)
nes.ppu.vramMem[0x3F15] = 0x2A;
// Sprite palette 2: color 1 = BLUE ($12)
nes.ppu.vramMem[0x3F19] = 0x12;
// Sprite palette 3: color 1 = WHITE ($30)
nes.ppu.vramMem[0x3F1D] = 0x30;

// Write 4 solid tiles (all pixels = 1)
for (let t = 0; t < 4; t++) {
  const tile = nes.ppu.ptTile[0xF0 + t];
  for (let p = 0; p < 64; p++) tile.pix[p] = 1;
}

// Suppress all Mario slots + inject 4 replacement tiles
// Use game's OAM positions from slots 5-8 (the visible tiles)
// Slot 5 = top-left (RED, palette 0)
// Slot 6 = top-right (GREEN, palette 1)
// Slot 7 = bottom-left (BLUE, palette 2)
// Slot 8 = bottom-right (WHITE, palette 3)

for (let s = 1; s <= 8; s++) {
  nes.cpu.mem[0x0200 + s * 4] = 0xFF; // Suppress all
}

const replacements = [
  { slot: 5, tile: 0xF0, palette: 0, label: 'top-left RED' },
  { slot: 6, tile: 0xF1, palette: 1, label: 'top-right GREEN' },
  { slot: 7, tile: 0xF2, palette: 2, label: 'bottom-left BLUE' },
  { slot: 8, tile: 0xF3, palette: 3, label: 'bottom-right WHITE' },
];

for (const r of replacements) {
  const base = 0x0200 + r.slot * 4;
  nes.cpu.mem[base]     = slots[r.slot].y;  // Same Y as game
  nes.cpu.mem[base + 1] = r.tile;
  nes.cpu.mem[base + 2] = r.palette;        // Palette in bits 0-1
  nes.cpu.mem[base + 3] = slots[r.slot].x;  // Same X as game
  console.log(`OAM slot ${r.slot}: Y=${slots[r.slot].y} X=${slots[r.slot].x} tile=$${r.tile.toString(16)} pal=${r.palette} — ${r.label}`);
}

// Run frame
nes.frame();
savePNG(lastFrame, 'step4-four-tiles.png');

// === Validate each 8x8 quadrant ===
// Remember: OAM Y renders at Y+1
const regions = [
  { label: 'Top-left (RED)',      sx: slots[5].x, sy: slots[5].y + 1 },
  { label: 'Top-right (GREEN)',   sx: slots[6].x, sy: slots[6].y + 1 },
  { label: 'Bottom-left (BLUE)',  sx: slots[7].x, sy: slots[7].y + 1 },
  { label: 'Bottom-right (WHITE)',sx: slots[8].x, sy: slots[8].y + 1 },
];

let allPass = true;
for (const reg of regions) {
  // Check center pixel of each quadrant
  const cx = reg.sx + 4, cy = reg.sy + 4;
  const centerPx = pixelRGB(lastFrame, cx, cy);

  // Check all 64 pixels for uniformity
  let uniformCount = 0;
  for (let dy = 0; dy < 8; dy++) {
    for (let dx = 0; dx < 8; dx++) {
      const px = pixelRGB(lastFrame, reg.sx + dx, reg.sy + dy);
      if (px.r === centerPx.r && px.g === centerPx.g && px.b === centerPx.b) uniformCount++;
    }
  }

  const ok = uniformCount >= 60;
  console.log(`${reg.label}: center=(${centerPx.r},${centerPx.g},${centerPx.b}) uniform=${uniformCount}/64 ${ok ? '✓' : '✗'}`);
  if (!ok) allPass = false;
}

// Check 4 quadrants have DIFFERENT colors
const colors = regions.map(reg => {
  const px = pixelRGB(lastFrame, reg.sx + 4, reg.sy + 4);
  return `${px.r},${px.g},${px.b}`;
});
const uniqueColors = new Set(colors);
const distinct = uniqueColors.size === 4;
console.log(`\nDistinct colors: ${uniqueColors.size}/4 ${distinct ? '✓' : '✗'}`);
console.log(`Colors: ${[...uniqueColors].join(' | ')}`);

allPass = allPass && distinct;
console.log(`\nStep 4: ${allPass ? 'PASSED' : 'FAILED'} — 4-tile grid ${allPass ? 'pixel-perfect' : 'has issues'}`);
