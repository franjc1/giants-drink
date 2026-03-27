/**
 * STEP 3: Inject ONE solid-color 8x8 tile at Mario's position.
 * Verify: an 8x8 solid square appears exactly where expected.
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

const saveState = nes.toJSON();

// Get Mario's OAM screen position (from the game's own rendering)
nes.frame();
const slot5X = nes.ppu.spriteMem[5 * 4 + 3]; // First visible Mario tile X
const slot5Y = nes.ppu.spriteMem[5 * 4];       // First visible Mario tile Y
console.log(`Mario visible OAM slot 5: X=${slot5X} Y=${slot5Y}`);

// === Write a SOLID RED tile into CHR slot $F0 ===
nes.fromJSON(saveState);
const tile = nes.ppu.ptTile[0xF0];
console.log(`ptTile[0xF0] exists: ${!!tile}, has pix: ${!!(tile && tile.pix)}`);
if (tile && tile.pix) {
  // Fill all 64 pixels with palette color 1 (solid)
  for (let p = 0; p < 64; p++) tile.pix[p] = 1;
  console.log(`CHR tile $F0 filled with solid color 1`);
  console.log(`Readback: ${tile.pix.slice(0, 8).join('')} (should be 11111111)`);
}

// Set sprite palette 0 color 1 to bright red (NES $16 = red)
// Sprite palette 0 is at VRAM $3F10-$3F13
nes.ppu.vramMem[0x3F11] = 0x16; // Color 1 = red

// === Suppress Mario AND inject one tile ===
// Write to OAM shadow $0200
for (let s = 1; s <= 8; s++) {
  nes.cpu.mem[0x0200 + s * 4] = 0xFF; // Suppress all Mario slots
}

// Write ONE replacement sprite in slot 5's position
const targetSlot = 5;
const targetBase = 0x0200 + targetSlot * 4;
nes.cpu.mem[targetBase]     = slot5Y;  // Y = where Mario's head was
nes.cpu.mem[targetBase + 1] = 0xF0;   // Tile = our solid red
nes.cpu.mem[targetBase + 2] = 0x00;   // Attr = palette 0, no flip
nes.cpu.mem[targetBase + 3] = slot5X;  // X = where Mario's head was

console.log(`\nOAM shadow written: slot ${targetSlot} at (${slot5X}, ${slot5Y}), tile $F0, palette 0`);

// Run frame
nes.frame();
const frameWithTile = lastFrame.slice();
savePNG(frameWithTile, 'step3-one-tile.png');

// === Validate: check the 8x8 region at (slot5X, slot5Y) ===
// NES sprite Y in OAM is the top edge. The sprite renders at Y to Y+7.
// NES OAM Y is actually Y-1 on real hardware... but jsnes may differ.
// Let's check a range and find where the solid color actually appears.

const targetColor = pixelRGB(frameWithTile, slot5X + 4, slot5Y + 4); // center of expected tile
console.log(`\nPixel at center of expected tile (${slot5X+4},${slot5Y+4}): R=${targetColor.r} G=${targetColor.g} B=${targetColor.b}`);

// Scan the 8x8 region
let solidCount = 0;
let firstColor = null;
console.log(`\n8x8 region at (${slot5X},${slot5Y}):`);
for (let dy = 0; dy < 8; dy++) {
  let row = '';
  for (let dx = 0; dx < 8; dx++) {
    const px = pixelRGB(frameWithTile, slot5X + dx, slot5Y + dy);
    if (!firstColor) firstColor = px;
    const match = (px.r === firstColor.r && px.g === firstColor.g && px.b === firstColor.b);
    row += match ? '#' : '.';
    if (match) solidCount++;
  }
  console.log(`  ${row}`);
}
console.log(`Solid pixels: ${solidCount}/64`);

// If the tile doesn't appear at slot5Y, try slot5Y+1 (NES Y offset quirk)
if (solidCount < 30) {
  console.log('\nTrying Y+1 offset (NES OAM Y quirk):');
  let solidCount2 = 0;
  let firstColor2 = null;
  for (let dy = 0; dy < 8; dy++) {
    let row = '';
    for (let dx = 0; dx < 8; dx++) {
      const px = pixelRGB(frameWithTile, slot5X + dx, slot5Y + 1 + dy);
      if (!firstColor2) firstColor2 = px;
      const match = (px.r === firstColor2.r && px.g === firstColor2.g && px.b === firstColor2.b);
      row += match ? '#' : '.';
      if (match) solidCount2++;
    }
    console.log(`  ${row}`);
  }
  console.log(`Solid pixels (Y+1): ${solidCount2}/64`);
  if (solidCount2 > solidCount) solidCount = solidCount2;
}

const pass = solidCount >= 50; // At least 50 of 64 pixels should be solid
console.log(`\nStep 3: ${pass ? 'PASSED' : 'FAILED'} — solid tile ${pass ? 'rendered correctly' : 'NOT visible or wrong'}`);
