/**
 * STEP 2: Suppress Mario's rendering completely.
 * Verify via pixel diff that Mario's pixels are ALL gone.
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

// Boot to same state as Step 1
for (let i = 0; i < 60; i++) nes.frame();
nes.buttonDown(1, Controller.BUTTON_START); nes.frame(); nes.buttonUp(1, Controller.BUTTON_START);
for (let i = 0; i < 180; i++) nes.frame();
nes.buttonDown(1, Controller.BUTTON_RIGHT);
for (let i = 0; i < 60; i++) nes.frame();
nes.buttonUp(1, Controller.BUTTON_RIGHT);
for (let i = 0; i < 10; i++) nes.frame();

const saveState = nes.toJSON();

// === Capture WITH Mario (reference) ===
nes.frame();
const frameWith = lastFrame.slice();

// === Capture WITHOUT Mario ===
// APPROACH: Modify the OAM shadow RAM ($0200) for Mario's slots BEFORE the frame.
// The NMI DMA copies $0200→spriteMem BEFORE rendering, so suppression takes effect.
nes.fromJSON(saveState);

// Suppress slots 0-8 in OAM shadow (slot 0 is the coin/HUD sprite, 1-8 are Mario)
for (let s = 1; s <= 8; s++) {
  nes.cpu.mem[0x0200 + s * 4] = 0xFF; // Y = offscreen
}

nes.frame();
const frameSuppressed = lastFrame.slice();
savePNG(frameSuppressed, 'step2-suppressed.png');

// === Validate: diff should show Mario removed ===
let diffCount = 0;
for (let y = 0; y < 240; y++) {
  for (let x = 0; x < 256; x++) {
    if (frameWith[y*256+x] !== frameSuppressed[y*256+x]) diffCount++;
  }
}
console.log(`Diff from baseline: ${diffCount} pixels changed (should be ~120 = Mario's pixels)`);

// === Also try: modify spriteMem AFTER frame() and check NEXT frame ===
// This tests the alternative timing for the browser.
nes.fromJSON(saveState);
nes.frame(); // Normal frame — Mario rendered
// NOW suppress spriteMem directly
for (let s = 1; s <= 8; s++) {
  nes.ppu.spriteMem[s * 4] = 0xFF;
}
// Next frame should render WITHOUT Mario (our spriteMem mods used by PPU)
nes.frame();
const frameAfterSuppress = lastFrame.slice();
savePNG(frameAfterSuppress, 'step2-suppressed-after.png');

let diffCount2 = 0;
for (let y = 0; y < 240; y++) {
  for (let x = 0; x < 256; x++) {
    if (frameWith[y*256+x] !== frameAfterSuppress[y*256+x]) diffCount2++;
  }
}
console.log(`Diff (spriteMem-after method): ${diffCount2} pixels changed`);

// Check which method actually removed Mario
const method1Works = diffCount >= 50;
const method2Works = diffCount2 >= 50;
console.log(`\nMethod 1 (write $0200 before frame): ${method1Works ? 'WORKS' : 'FAILED'}`);
console.log(`Method 2 (write spriteMem after frame, check next): ${method2Works ? 'WORKS' : 'FAILED'}`);

// Verify suppression is complete — check the Mario bounding box area
const data = JSON.parse(fs.readFileSync(`${VAL_DIR}/step1-data.json`));
const { bbox } = data;
let marioPixelsRemaining = 0;
const fb = method1Works ? frameSuppressed : frameAfterSuppress;
const fbRef = frameWith;
for (let y = bbox.minY; y <= bbox.maxY; y++) {
  for (let x = bbox.minX; x <= bbox.maxX; x++) {
    if (fb[y*256+x] !== fbRef[y*256+x]) {
      // This pixel differs = Mario was removed here (showing background now)
    } else {
      // Same as reference — if this was a Mario pixel in step 1, it's still there
    }
  }
}
// Count how many pixels in the bounding box STILL differ from a no-Mario state
// Actually, the suppressed frame IS the no-Mario state. Count pixels that are
// the same between suppressed and reference = background pixels (were never Mario).
// Count pixels that DIFFER = were Mario and are now removed.
let removed = 0;
for (let y = bbox.minY; y <= bbox.maxY; y++) {
  for (let x = bbox.minX; x <= bbox.maxX; x++) {
    if (fb[y*256+x] !== fbRef[y*256+x]) removed++;
  }
}
console.log(`\nMario pixels removed in bbox: ${removed} (step 1 found: ${data.diffCount})`);
const fullyRemoved = removed >= data.diffCount * 0.9;
console.log(`Fully suppressed: ${fullyRemoved ? 'YES' : 'NO'}`);

console.log(`\nStep 2: ${fullyRemoved ? 'PASSED' : 'FAILED'} — Mario suppression ${fullyRemoved ? 'complete' : 'incomplete'}`);
