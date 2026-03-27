/**
 * Validate Mega Man sprites render correctly in SMB.
 * Test standing pose first, then walk animation, then jump.
 */
const fs = require('fs');
const { NES, Controller } = require('jsnes');
const { PNG } = require('pngjs');

const SMB_ROM = `${process.env.HOME}/nes-roms/Super Mario Bros. (World).nes`;
const VAL_DIR = `${__dirname}/validation`;
const SPRITES = JSON.parse(fs.readFileSync(`${__dirname}/megaman-sprites.json`));

let lastFrame;
const nes = new NES({ onFrame: fb => { lastFrame = fb.slice(); }, onAudioSample: () => {} });
nes.loadROM(fs.readFileSync(SMB_ROM).toString('binary'));

function step(n) { for (let i = 0; i < n; i++) nes.frame(); }
function savePNG(fb, name) {
  const png = new PNG({width:256,height:240});
  for(let i=0;i<256*240;i++){const v=fb[i];png.data[i*4]=v&0xFF;png.data[i*4+1]=(v>>8)&0xFF;png.data[i*4+2]=(v>>16)&0xFF;png.data[i*4+3]=255;}
  fs.writeFileSync(`${VAL_DIR}/${name}`, PNG.sync.write(png));
  console.log(`Saved: ${name}`);
}

// Boot SMB
for (let i = 0; i < 60; i++) nes.frame();
nes.buttonDown(1, Controller.BUTTON_START); nes.frame(); nes.buttonUp(1, Controller.BUTTON_START);
for (let i = 0; i < 180; i++) nes.frame();
nes.buttonDown(1, Controller.BUTTON_RIGHT);
for (let i = 0; i < 60; i++) nes.frame();
nes.buttonUp(1, Controller.BUTTON_RIGHT);
step(10);

const saveState = nes.toJSON();

// ============================================================
// Helper: Install a pose's tiles and write OAM
// ============================================================
function installPose(poseName) {
  const tiles = SPRITES.poses[poseName];
  // Write 6 tiles to CHR $F0-$F5
  for (let i = 0; i < tiles.length; i++) {
    const t = nes.ppu.ptTile[0xF0 + i];
    if (t && t.pix) for (let p = 0; p < 64; p++) t.pix[p] = tiles[i].pixels[p];
  }
  // Set palette
  const pal = SPRITES.palette.normal;
  nes.ppu.vramMem[0x3F11] = pal[1];
  nes.ppu.vramMem[0x3F12] = pal[2];
  nes.ppu.vramMem[0x3F13] = pal[3];
}

function replaceMegaMan(poseName, facingLeft) {
  installPose(poseName);

  const tiles = SPRITES.poses[poseName];
  const hFlip = facingLeft ? 0x40 : 0x00;

  // Read game's OAM for Mario's visible tiles (slots 5-8)
  // Slots 3-4 are at Y = slot5Y - 8 (the row above visible Mario)
  // We use: slots 3/4=top, 5/6=mid, 7/8=bottom of Mega Man
  const slot5Y = nes.cpu.mem[0x0200 + 5*4];
  const slot5X = nes.cpu.mem[0x0200 + 5*4 + 3];
  const slot7Y = nes.cpu.mem[0x0200 + 7*4];

  // Suppress slots 1-2 (still blank)
  nes.cpu.mem[0x0200 + 1*4] = 0xFF;
  nes.cpu.mem[0x0200 + 2*4] = 0xFF;

  // Map 6 Mega Man tiles to slots 3-8
  // tile layout: col 0 = left, col 1 = right
  // row 0 = top (head), row 1 = mid (torso), row 2 = bottom (legs)
  const slotMap = [
    { slot: 3, row: 0, col: 0, y: slot5Y - 8 },  // head-left
    { slot: 4, row: 0, col: 1, y: slot5Y - 8 },  // head-right
    { slot: 5, row: 1, col: 0, y: slot5Y },        // torso-left
    { slot: 6, row: 1, col: 1, y: slot5Y },        // torso-right
    { slot: 7, row: 2, col: 0, y: slot7Y },        // legs-left
    { slot: 8, row: 2, col: 1, y: slot7Y },        // legs-right
  ];

  for (let i = 0; i < slotMap.length; i++) {
    const sm = slotMap[i];
    const base = 0x0200 + sm.slot * 4;
    // Find the tile for this grid position
    const tileData = tiles.find(t => t.col === sm.col && t.row === sm.row);
    const chrIdx = tileData ? (0xF0 + tiles.indexOf(tileData)) : 0xFC; // blank if missing

    // For H-flip: swap left/right columns
    const flipCol = facingLeft ? (1 - sm.col) : sm.col;
    const flipTile = tiles.find(t => t.col === flipCol && t.row === sm.row);
    const flipChrIdx = flipTile ? (0xF0 + tiles.indexOf(flipTile)) : 0xFC;

    nes.cpu.mem[base]     = sm.y;
    nes.cpu.mem[base + 1] = facingLeft ? flipChrIdx : chrIdx;
    nes.cpu.mem[base + 2] = hFlip; // palette 0 + flip
    nes.cpu.mem[base + 3] = facingLeft ? (slot5X + (1 - sm.col) * 8) : (slot5X + sm.col * 8);
  }
}

// ============================================================
// TEST 1: Standing pose
// ============================================================
console.log('=== TEST 1: Mega Man Standing ===');
nes.fromJSON(saveState);
replaceMegaMan('stand', false);
nes.frame();
savePNG(lastFrame, 'megaman-stand.png');

// ============================================================
// TEST 2: Walk animation (3 frames)
// ============================================================
console.log('=== TEST 2: Walk animation ===');
nes.fromJSON(saveState);
const walkPoses = ['walk1', 'walk2', 'walk3'];
nes.buttonDown(1, Controller.BUTTON_RIGHT);
for (let f = 0; f < 90; f++) {
  const poseIdx = Math.floor(f / 8) % walkPoses.length;
  replaceMegaMan(walkPoses[poseIdx], false);
  nes.frame();
  if (f % 30 === 15) savePNG(lastFrame, `megaman-walk-f${f}.png`);
}
nes.buttonUp(1, Controller.BUTTON_RIGHT);

// ============================================================
// TEST 3: Jump pose
// ============================================================
console.log('=== TEST 3: Jump ===');
nes.fromJSON(saveState);
replaceMegaMan('stand', false);
nes.frame();
nes.buttonDown(1, Controller.BUTTON_A);
for (let f = 0; f < 40; f++) {
  replaceMegaMan('jump', false);
  nes.frame();
  if (f === 10) savePNG(lastFrame, 'megaman-jump.png');
}
nes.buttonUp(1, Controller.BUTTON_A);

// ============================================================
// TEST 4: Fire palette (red Mega Man)
// ============================================================
console.log('=== TEST 4: Fire palette ===');
nes.fromJSON(saveState);
nes.cpu.mem[0x0756] = 2; // Fire power
const firePal = SPRITES.palette.fire;
nes.ppu.vramMem[0x3F11] = firePal[1];
nes.ppu.vramMem[0x3F12] = firePal[2];
nes.ppu.vramMem[0x3F13] = firePal[3];
replaceMegaMan('stand', false);
nes.frame();
savePNG(lastFrame, 'megaman-fire.png');

console.log('\nAll tests complete. Check validation/ for PNGs.');
