/**
 * STEP 5: Inject actual knight character tiles in the 2x2 grid.
 * Only the VISIBLE 2x2 tiles (head + body), not the blank top rows.
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

// Knight character: 4 tiles for the visible 2x2 (head-left, head-right, body-left, body-right)
const KNIGHT = {
  headL: [
    0,0,1,1,1,1,1,1,
    0,1,2,2,2,2,2,1,
    0,1,2,3,3,2,2,1,
    0,1,2,3,3,2,2,1,
    0,1,2,2,2,2,2,1,
    0,1,1,2,2,1,1,1,
    0,0,1,1,1,1,0,0,
    0,0,1,2,2,1,0,0,
  ],
  headR: [
    1,1,1,1,1,1,0,0,
    1,2,2,2,2,2,1,0,
    1,2,2,3,3,2,1,0,
    1,2,2,3,3,2,1,0,
    1,2,2,2,2,2,1,0,
    1,1,1,2,2,1,1,0,
    0,0,1,1,1,1,0,0,
    0,0,1,2,2,1,0,0,
  ],
  bodyL: [
    0,1,1,2,2,1,1,0,
    0,1,2,2,2,2,1,0,
    0,1,2,3,3,2,1,0,
    0,1,1,1,1,1,1,0,
    0,0,1,2,0,1,2,0,
    0,0,1,2,0,1,2,0,
    0,0,1,1,0,1,1,0,
    0,0,1,1,0,1,1,0,
  ],
  bodyR: [
    0,1,1,2,2,1,1,0,
    0,1,2,2,2,2,1,0,
    0,1,2,3,3,2,1,0,
    0,1,1,1,1,1,1,0,
    0,2,1,0,2,1,0,0,
    0,2,1,0,2,1,0,0,
    0,1,1,0,1,1,0,0,
    0,1,1,0,1,1,0,0,
  ],
};

// Boot to same state
for (let i = 0; i < 60; i++) nes.frame();
nes.buttonDown(1, Controller.BUTTON_START); nes.frame(); nes.buttonUp(1, Controller.BUTTON_START);
for (let i = 0; i < 180; i++) nes.frame();
nes.buttonDown(1, Controller.BUTTON_RIGHT);
for (let i = 0; i < 60; i++) nes.frame();
nes.buttonUp(1, Controller.BUTTON_RIGHT);
for (let i = 0; i < 10; i++) nes.frame();

// Capture game OAM
nes.frame();
const slotsXY = {};
for (const s of [5,6,7,8]) {
  slotsXY[s] = { x: nes.ppu.spriteMem[s*4+3], y: nes.ppu.spriteMem[s*4] };
}

const saveState = nes.toJSON();
nes.fromJSON(saveState);

// Install knight tiles at $F0-$F3
const tileData = [KNIGHT.headL, KNIGHT.headR, KNIGHT.bodyL, KNIGHT.bodyR];
for (let t = 0; t < 4; t++) {
  const tile = nes.ppu.ptTile[0xF0 + t];
  for (let p = 0; p < 64; p++) tile.pix[p] = tileData[t][p];
}

// Verify readback
for (let t = 0; t < 4; t++) {
  const tile = nes.ppu.ptTile[0xF0 + t];
  const match = tileData[t].every((v, i) => tile.pix[i] === v);
  console.log(`Tile $F${t}: readback ${match ? 'OK' : 'MISMATCH'}`);
}

// Set sprite palette 0: transparent, dark blue, light gray, yellow
nes.ppu.vramMem[0x3F11] = 0x02; // Color 1 = dark blue
nes.ppu.vramMem[0x3F12] = 0x20; // Color 2 = light gray
nes.ppu.vramMem[0x3F13] = 0x28; // Color 3 = yellow

// Suppress Mario + inject knight
for (let s = 1; s <= 8; s++) nes.cpu.mem[0x0200 + s*4] = 0xFF;

// Slot 5 = head-left, 6 = head-right, 7 = body-left, 8 = body-right
const mapping = [
  { slot: 5, tile: 0xF0 },
  { slot: 6, tile: 0xF1 },
  { slot: 7, tile: 0xF2 },
  { slot: 8, tile: 0xF3 },
];
for (const m of mapping) {
  const base = 0x0200 + m.slot * 4;
  nes.cpu.mem[base]     = slotsXY[m.slot].y;
  nes.cpu.mem[base + 1] = m.tile;
  nes.cpu.mem[base + 2] = 0x00; // palette 0, no flip
  nes.cpu.mem[base + 3] = slotsXY[m.slot].x;
}

nes.frame();
savePNG(lastFrame, 'step5-knight.png');

// === Validate: check character region for coherent shape ===
// Visible area: (slot5.x, slot5.y+1) to (slot6.x+7, slot8.y+8)
const x0 = slotsXY[5].x, y0 = slotsXY[5].y + 1;
console.log(`\nCharacter region at (${x0},${y0}), 16x16:`);

let nonTransparent = 0;
const bgSample = pixelRGB(lastFrame, x0 - 5, y0 + 4); // Sample background left of character
for (let dy = 0; dy < 16; dy++) {
  let row = '';
  for (let dx = 0; dx < 16; dx++) {
    const px = pixelRGB(lastFrame, x0 + dx, y0 + dy);
    const isBG = (Math.abs(px.r - bgSample.r) < 15 && Math.abs(px.g - bgSample.g) < 15 && Math.abs(px.b - bgSample.b) < 15);
    row += isBG ? '.' : '#';
    if (!isBG) nonTransparent++;
  }
  console.log(`  ${row}`);
}
console.log(`Non-transparent pixels: ${nonTransparent}/256`);

// Check character has reasonable pixel count (30-200 for a small character)
const shapeOK = nonTransparent >= 30 && nonTransparent <= 200;
// Check that the character uses our palette colors (not Mario's colors)
const charCenter = pixelRGB(lastFrame, x0 + 4, y0 + 4);
const isBlueish = charCenter.b > charCenter.r; // Our palette color 1 is dark blue
console.log(`Center pixel: R=${charCenter.r} G=${charCenter.g} B=${charCenter.b} — ${isBlueish ? 'blue (knight palette)' : 'NOT blue'}`);

const pass = shapeOK && isBlueish;
console.log(`\nStep 5: ${pass ? 'PASSED' : 'FAILED'} — knight character ${pass ? 'visible and correct' : 'has issues'}`);
