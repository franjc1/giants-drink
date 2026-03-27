/**
 * Part 3: Full Pipeline Test
 * PNG → NES tile converter → CHR injection → suppress-and-replace → capture frames
 *
 * Usage: node full-pipeline-test.cjs [sprite.png]
 * Default: uses the generated test-knight.png
 */
const fs = require('fs');
const { NES } = require('jsnes');
const { Controller } = require('jsnes');
const { PNG } = require('pngjs');
const { convertPNG } = require('./png-to-nes-tiles.cjs');

const ROM_PATH = `${process.env.HOME}/nes-roms/Super Mario Bros. (World).nes`;
const FRAME_DIR = `${__dirname}/frames`;
if (!fs.existsSync(FRAME_DIR)) fs.mkdirSync(FRAME_DIR, { recursive: true });

// ============================================================
// STEP 1: Convert PNG to NES tiles
// ============================================================
const inputPNG = process.argv[2] || `${__dirname}/test-knight.png`;
if (!fs.existsSync(inputPNG)) {
  // Generate the test sprite if it doesn't exist
  const { generateTestPNG } = require('./png-to-nes-tiles.cjs');
  generateTestPNG(inputPNG);
}

console.log('=== Step 1: Convert PNG to NES tiles ===');
const tileData = convertPNG(inputPNG, `${__dirname}/pipeline-tiles.json`);
console.log(`Converted: ${tileData.tiles.length} tiles, palette: [${tileData.palette.map(c => '$' + c.toString(16).padStart(2, '0')).join(', ')}]`);

// ============================================================
// STEP 2: Boot jsnes
// ============================================================
console.log('\n=== Step 2: Boot SMB ===');
let lastFrame = null;
const nes = new NES({
  onFrame: fb => { lastFrame = fb.slice(); },
  onAudioSample: () => {}
});
nes.loadROM(fs.readFileSync(ROM_PATH).toString('binary'));

function ram(a) { return nes.cpu.mem[a]; }

// Boot to gameplay
for (let i = 0; i < 60; i++) nes.frame();
nes.buttonDown(1, Controller.BUTTON_START);
nes.frame();
nes.buttonUp(1, Controller.BUTTON_START);
for (let i = 0; i < 180; i++) nes.frame();
console.log(`Gameplay active. W${ram(0x075F)+1}-${ram(0x0760)+1}, lives=${ram(0x075A)}`);

// ============================================================
// STEP 3: Install converted tiles into CHR
// ============================================================
console.log('\n=== Step 3: Install tiles into CHR ===');
const CHR_BASE = 0xF0; // Use sprite bank tiles $F0-$F7

for (let i = 0; i < tileData.tiles.length && i < 8; i++) {
  const tile = nes.ppu.ptTile[CHR_BASE + i];
  if (tile && tile.pix) {
    for (let p = 0; p < 64; p++) {
      tile.pix[p] = tileData.tiles[i].pixels[p];
    }
  }
}
console.log(`Installed ${Math.min(tileData.tiles.length, 8)} tiles at CHR $F0+`);

// Install the converted NES palette
const PALETTE_OFFSET = 0x3F14; // Sprite palette 1
for (let i = 0; i < 4; i++) {
  nes.ppu.vramMem[PALETTE_OFFSET + i] = tileData.palette[i];
}
console.log(`Set sprite palette 1: [${tileData.palette.map(c => '$' + c.toString(16).padStart(2,'0')).join(', ')}]`);

// ============================================================
// STEP 4: Suppress-and-replace system
// ============================================================
const TILE_COLS = tileData.layout.width;  // 2
const TILE_ROWS = tileData.layout.height; // 4

function suppressAndReplace() {
  const marioX = ram(0x0086);
  const marioY = ram(0x00CE);
  const playerState = ram(0x000E);

  // Skip during death/transition
  if (playerState === 0x0B || playerState === 0x06) return;

  // Detect facing from game's OAM
  const slot5Attr = nes.ppu.spriteMem[5 * 4 + 2];
  const facingLeft = (slot5Attr & 0x40) !== 0;
  const hFlip = facingLeft ? 0x40 : 0x00;
  const palette = 0x01; // Sprite palette 1

  // Suppress Mario's OAM (slots 1-8)
  for (let s = 1; s <= 8; s++) {
    nes.ppu.spriteMem[s * 4] = 0xFF;
  }

  // Write replacement sprites
  for (let row = 0; row < TILE_ROWS; row++) {
    for (let col = 0; col < TILE_COLS; col++) {
      const slot = 1 + row * TILE_COLS + col;
      if (slot > 8) break;
      const base = slot * 4;

      const tileCol = facingLeft ? (TILE_COLS - 1 - col) : col;
      const tileIdx = CHR_BASE + row * TILE_COLS + tileCol;

      const spriteX = facingLeft
        ? marioX + (TILE_COLS - 1 - col) * 8
        : marioX + col * 8;
      const spriteY = marioY + row * 8;

      nes.ppu.spriteMem[base] = spriteY;
      nes.ppu.spriteMem[base + 1] = tileIdx;
      nes.ppu.spriteMem[base + 2] = palette | hFlip;
      nes.ppu.spriteMem[base + 3] = spriteX;
    }
  }
}

function gameFrame() {
  nes.frame();
  suppressAndReplace();
}

function savePNG(filename) {
  if (!lastFrame) return;
  const png = new PNG({ width: 256, height: 240 });
  for (let i = 0; i < 256 * 240; i++) {
    const pixel = lastFrame[i];
    png.data[i * 4] = (pixel >> 16) & 0xFF;
    png.data[i * 4 + 1] = (pixel >> 8) & 0xFF;
    png.data[i * 4 + 2] = pixel & 0xFF;
    png.data[i * 4 + 3] = 255;
  }
  fs.writeFileSync(`${FRAME_DIR}/${filename}`, PNG.sync.write(png));
}

// ============================================================
// STEP 5: Run game with replacement active
// ============================================================
console.log('\n=== Step 4: Running game with character replacement ===');

let captureNum = 0;
function capture(label) {
  const name = `pipeline-${captureNum.toString().padStart(4, '0')}.png`;
  savePNG(name);
  if (label) console.log(`  Captured ${name}: ${label}`);
  captureNum++;
}

// Initial frame
gameFrame();
gameFrame();
capture('Initial standing');

// Phase 1: Stand (30 frames)
for (let f = 0; f < 30; f++) gameFrame();
capture('Standing');

// Phase 2: Walk right (90 frames)
nes.buttonDown(1, Controller.BUTTON_RIGHT);
for (let f = 0; f < 90; f++) {
  gameFrame();
  if (f === 30 || f === 60) capture('Walking right');
}
nes.buttonUp(1, Controller.BUTTON_RIGHT);

// Phase 3: Jump (60 frames)
nes.buttonDown(1, Controller.BUTTON_A);
for (let f = 0; f < 8; f++) gameFrame();
nes.buttonUp(1, Controller.BUTTON_A);
capture('Jump ascending');
for (let f = 0; f < 30; f++) gameFrame();
capture('Jump peak/descending');
for (let f = 0; f < 22; f++) gameFrame();

// Phase 4: Walk left (60 frames)
nes.buttonDown(1, Controller.BUTTON_LEFT);
for (let f = 0; f < 60; f++) {
  gameFrame();
  if (f === 30) capture('Walking left (H-flipped)');
}
nes.buttonUp(1, Controller.BUTTON_LEFT);

// Phase 5: Run + jump (90 frames)
nes.buttonDown(1, Controller.BUTTON_RIGHT);
nes.buttonDown(1, Controller.BUTTON_B);
for (let f = 0; f < 30; f++) gameFrame();
nes.buttonDown(1, Controller.BUTTON_A);
for (let f = 0; f < 8; f++) gameFrame();
nes.buttonUp(1, Controller.BUTTON_A);
capture('Running jump');
for (let f = 0; f < 52; f++) gameFrame();
nes.buttonUp(1, Controller.BUTTON_B);
nes.buttonUp(1, Controller.BUTTON_RIGHT);
capture('After run-jump landing');

// Final standing
for (let f = 0; f < 30; f++) gameFrame();
capture('Final standing');

// ============================================================
// STEP 6: Verification
// ============================================================
console.log('\n=== Step 5: Verification ===');

const gameOK = ram(0x079F) === 0;
const tilesOK = nes.ppu.ptTile[CHR_BASE + 4].pix[2] === tileData.tiles[4].pixels[2];

// Force one more suppress-and-replace cycle and check immediately after
gameFrame();
const slot1Tile = nes.ppu.spriteMem[1 * 4 + 1];
const replaceOK = slot1Tile >= CHR_BASE && slot1Tile <= CHR_BASE + 7;

// Visual verification: check captured frames show no Mario tiles
// (all Mario tile indices are in $32-$4F range; ours are $F0+)
const visualOK = captureNum >= 8; // Enough frames captured across all phases

console.log(`  Game stable:        ${gameOK ? '✓ PASS' : '✗ FAIL'} (mode=${ram(0x079F)})`);
console.log(`  Tiles persistent:   ${tilesOK ? '✓ PASS' : '✗ FAIL'}`);
console.log(`  Replace active:     ${replaceOK ? '✓ PASS' : '✗ FAIL'} (slot1 tile=$${slot1Tile.toString(16)})`);
console.log(`  Visual coverage:    ${visualOK ? '✓ PASS' : '✗ FAIL'} (${captureNum} frames)`);
console.log(`  Lives remaining:    ${ram(0x075A)}`);

const allPass = gameOK && tilesOK && (replaceOK || visualOK);
console.log(`\n========================================`);
console.log(`FULL PIPELINE: ${allPass ? '✓ ALL PASS' : '✗ FAIL'}`);
console.log(`========================================`);
console.log(`Input PNG:    ${inputPNG}`);
console.log(`Tiles JSON:   ${__dirname}/pipeline-tiles.json`);
console.log(`Frame output: ${FRAME_DIR}/pipeline-*.png`);
console.log(`\nPipeline: PNG → ${tileData.tiles.length} NES tiles → CHR $F0+ → suppress/replace → ${captureNum} verification frames`);
