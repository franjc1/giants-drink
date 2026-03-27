/**
 * STEP 1: Baseline — Find Mario's exact pixels by diff.
 * Capture frame WITH Mario, suppress Mario, capture WITHOUT, diff = Mario's pixels.
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
function pixelRGB(fb, x, y) {
  const v = fb[y * 256 + x];
  return { r: v & 0xFF, g: (v >> 8) & 0xFF, b: (v >> 16) & 0xFF };
}
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

// Boot to gameplay, move right a bit
for (let i = 0; i < 60; i++) nes.frame();
nes.buttonDown(1, Controller.BUTTON_START); nes.frame(); nes.buttonUp(1, Controller.BUTTON_START);
for (let i = 0; i < 180; i++) nes.frame();
nes.buttonDown(1, Controller.BUTTON_RIGHT);
for (let i = 0; i < 60; i++) nes.frame();
nes.buttonUp(1, Controller.BUTTON_RIGHT);
for (let i = 0; i < 10; i++) nes.frame();

const saveState = nes.toJSON();
const marioX = ram(0x86), marioY = ram(0xCE);
console.log(`Mario RAM: X=${marioX} Y=${marioY}`);

// === Frame WITH Mario ===
nes.frame();
const frameWith = lastFrame.slice();
savePNG(frameWith, 'step1-with-mario.png');

// Log ALL visible OAM sprites
console.log('\nALL visible OAM sprites:');
const marioSlots = [];
for (let s = 0; s < 64; s++) {
  const sy = nes.ppu.spriteMem[s*4];
  const sx = nes.ppu.spriteMem[s*4+3];
  const tile = nes.ppu.spriteMem[s*4+1];
  const attr = nes.ppu.spriteMem[s*4+2];
  if (sy < 0xEF && sy > 0) {
    const isMario = Math.abs(sy - marioY) < 40; // roughly near Mario's Y region
    console.log(`  Slot ${s.toString().padStart(2)}: X=${sx.toString().padStart(3)} Y=${sy.toString().padStart(3)} tile=$${tile.toString(16).padStart(2,'0')} attr=$${attr.toString(16).padStart(2,'0')}${isMario ? ' ← MARIO?' : ''}`);
    if (isMario) marioSlots.push(s);
  }
}

// === Frame WITHOUT Mario (suppress all likely Mario slots) ===
nes.fromJSON(saveState);
// Suppress by setting Y=$FF for all Mario-candidate slots
for (const s of marioSlots) {
  // Write to OAM shadow RAM $0200+ BEFORE the frame
  nes.cpu.mem[0x0200 + s*4] = 0xFF;
}
nes.frame();
const frameWithout = lastFrame.slice();
savePNG(frameWithout, 'step1-without-mario.png');

// === Diff frames to find Mario's exact pixels ===
let diffCount = 0;
let minX = 999, maxX = 0, minY = 999, maxY = 0;
const diffPixels = [];
for (let y = 0; y < 240; y++) {
  for (let x = 0; x < 256; x++) {
    if (frameWith[y*256+x] !== frameWithout[y*256+x]) {
      diffCount++;
      if (x < minX) minX = x;
      if (x > maxX) maxX = x;
      if (y < minY) minY = y;
      if (y > maxY) maxY = y;
      diffPixels.push({x, y});
    }
  }
}

console.log(`\nDiff: ${diffCount} pixels changed`);
console.log(`Bounding box: (${minX},${minY}) to (${maxX},${maxY})`);
console.log(`Size: ${maxX-minX+1}w × ${maxY-minY+1}h`);

// Print the diff as a mask
if (diffCount > 0 && diffCount < 2000) {
  console.log(`\nMario pixel mask (${maxX-minX+1}x${maxY-minY+1}):`);
  for (let y = minY; y <= maxY; y++) {
    let row = '';
    for (let x = minX; x <= maxX; x++) {
      row += (frameWith[y*256+x] !== frameWithout[y*256+x]) ? '#' : '.';
    }
    console.log(`  ${y.toString().padStart(3)}: ${row}`);
  }
}

// Record the OAM→screen coordinate offset
// Mario slots are at OAM X positions. Compare to RAM X.
if (marioSlots.length > 0) {
  const oamX = nes.ppu.spriteMem[marioSlots[0]*4+3]; // After restore, but still the same frame
  // Actually we need the OAM from the WITH frame. Let me re-capture.
  nes.fromJSON(saveState);
  nes.frame();
  const firstSlotX = nes.ppu.spriteMem[marioSlots[0]*4+3];
  const firstSlotY = nes.ppu.spriteMem[marioSlots[0]*4];
  console.log(`\nFirst Mario OAM slot ${marioSlots[0]}: screen X=${firstSlotX} Y=${firstSlotY}`);
  console.log(`Mario RAM position: X=${marioX} Y=${marioY}`);
  console.log(`Visible region screen coords: (${minX},${minY}) to (${maxX},${maxY})`);
}

// Save metadata
fs.writeFileSync(`${VAL_DIR}/step1-data.json`, JSON.stringify({
  marioX, marioY, marioSlots, diffCount,
  bbox: { minX, minY, maxX, maxY, w: maxX-minX+1, h: maxY-minY+1 }
}, null, 2));

const pass = diffCount > 20 && diffCount < 1000 && (maxX - minX + 1) <= 20 && (maxY - minY + 1) <= 40;
console.log(`\nStep 1: ${pass ? 'PASSED' : 'FAILED'} — Mario located via frame diff`);
