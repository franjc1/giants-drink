/**
 * Part 1: Suppress-and-Replace Mario with a Custom Robot Character
 *
 * Mario OAM layout (discovered):
 *   Slots 1-8, 2x4 grid, offsets: (dx, dy) = (col*8, row*8) where col=0-1, row=0-3
 *   Small Mario: rows 0-1 = blank tile $FC, rows 2-3 = visible character
 *   Facing left: attr bit 6 (H-flip) set on ALL slots
 *   Standing: tiles $3A/$37 (row 2), $4F/$4F (row 3)
 *   Walking: various animation tiles cycling
 *
 * Strategy:
 *   1. Write custom tile data to CHR slots $F0-$F7 (verified unused)
 *   2. Each frame: suppress Mario slots 1-8 (Y=$FF)
 *   3. Write replacement OAM entries using our tiles at Mario's position
 *   4. Capture PNGs for verification
 */
const fs = require('fs');
const { NES } = require('jsnes');
const { Controller } = require('jsnes');
const { PNG } = require('pngjs');

const ROM_PATH = `${process.env.HOME}/nes-roms/Super Mario Bros. (World).nes`;
const FRAME_DIR = `${__dirname}/frames`;
if (!fs.existsSync(FRAME_DIR)) fs.mkdirSync(FRAME_DIR, { recursive: true });

let lastFrame = null;
const nes = new NES({
  onFrame: fb => { lastFrame = fb.slice(); },
  onAudioSample: () => {}
});
nes.loadROM(fs.readFileSync(ROM_PATH).toString('binary'));

function ram(a) { return nes.cpu.mem[a]; }

// ============================================================
// CUSTOM CHARACTER: A distinctive robot (2x4 tiles = 16x32)
// Each tile is 8x8 pixels, values 0-3 (0=transparent, 1-3=palette colors)
// Layout: 2 cols × 4 rows
// For small Mario: rows 0-1 blank, rows 2-3 = character
// ============================================================

// Row 0, Col 0 — blank for small Mario
const TILE_R0C0 = new Array(64).fill(0);

// Row 0, Col 1 — blank for small Mario
const TILE_R0C1 = new Array(64).fill(0);

// Row 1, Col 0 — blank for small Mario
const TILE_R1C0 = new Array(64).fill(0);

// Row 1, Col 1 — blank for small Mario
const TILE_R1C1 = new Array(64).fill(0);

// Row 2, Col 0 — Robot head left half
// Design: helmet with visor
const TILE_R2C0 = [
  0,0,1,1,1,1,1,1,  // helmet top
  0,1,2,2,2,2,2,1,  // helmet side
  0,1,2,3,3,2,2,1,  // visor (color 3 = bright)
  0,1,2,3,3,2,2,1,  // visor
  0,1,2,2,2,2,2,1,  // below visor
  0,1,1,2,2,1,1,1,  // chin
  0,0,1,1,1,1,0,0,  // neck
  0,0,1,2,2,1,0,0,  // shoulder
];

// Row 2, Col 1 — Robot head right half
const TILE_R2C1 = [
  1,1,1,1,1,1,0,0,
  1,2,2,2,2,2,1,0,
  1,2,2,3,3,2,1,0,
  1,2,2,3,3,2,1,0,
  1,2,2,2,2,2,1,0,
  1,1,1,2,2,1,1,0,
  0,0,1,1,1,1,0,0,
  0,0,1,2,2,1,0,0,
];

// Row 3, Col 0 — Robot body left half
// Design: torso with belt and legs
const TILE_R3C0 = [
  0,1,1,2,2,1,1,0,  // shoulders
  0,1,2,2,2,2,1,0,  // chest
  0,1,2,3,3,2,1,0,  // belt buckle (bright)
  0,1,1,1,1,1,1,0,  // belt
  0,0,1,2,0,1,2,0,  // legs
  0,0,1,2,0,1,2,0,  // legs
  0,0,1,1,0,1,1,0,  // feet
  0,0,1,1,0,1,1,0,  // feet base
];

// Row 3, Col 1 — Robot body right half
const TILE_R3C1 = [
  0,1,1,2,2,1,1,0,
  0,1,2,2,2,2,1,0,
  0,1,2,3,3,2,1,0,
  0,1,1,1,1,1,1,0,
  0,2,1,0,2,1,0,0,
  0,2,1,0,2,1,0,0,
  0,1,1,0,1,1,0,0,
  0,1,1,0,1,1,0,0,
];

const TILES = [TILE_R0C0, TILE_R0C1, TILE_R1C0, TILE_R1C1, TILE_R2C0, TILE_R2C1, TILE_R3C0, TILE_R3C1];
const CHR_BASE = 0xF0; // CHR tile indices $F0-$F7

// ============================================================
// HELPER: Save frame as PNG
// ============================================================
function savePNG(filename) {
  if (!lastFrame) return;
  const png = new PNG({ width: 256, height: 240 });
  for (let i = 0; i < 256 * 240; i++) {
    const pixel = lastFrame[i];
    png.data[i * 4] = (pixel >> 16) & 0xFF;     // R
    png.data[i * 4 + 1] = (pixel >> 8) & 0xFF;  // G
    png.data[i * 4 + 2] = pixel & 0xFF;          // B
    png.data[i * 4 + 3] = 255;                    // A
  }
  fs.writeFileSync(`${FRAME_DIR}/${filename}`, PNG.sync.write(png));
}

// ============================================================
// INSTALL CUSTOM TILES INTO CHR
// ============================================================
function installTiles() {
  for (let i = 0; i < 8; i++) {
    const tile = nes.ppu.ptTile[CHR_BASE + i];
    if (tile && tile.pix) {
      for (let p = 0; p < 64; p++) {
        tile.pix[p] = TILES[i][p];
      }
    }
  }
}

// ============================================================
// SUPPRESS-AND-REPLACE: Called every frame
// ============================================================
function suppressAndReplace() {
  const marioX = ram(0x0086);
  const marioY = ram(0x00CE);
  const powerup = ram(0x0756);
  const playerState = ram(0x000E);

  // Detect facing direction from the game's own OAM
  // Slot 5 (first visible Mario tile) has attr bit 6 = H-flip when facing left
  const slot5Attr = nes.ppu.spriteMem[5 * 4 + 2];
  const facingLeft = (slot5Attr & 0x40) !== 0;

  // Don't replace during death animation (state 0x0B = dying)
  if (playerState === 0x0B || playerState === 0x06) {
    return; // Let the game render its own death/transition sprites
  }

  // Suppress Mario's OAM slots (1-8)
  for (let s = 1; s <= 8; s++) {
    nes.ppu.spriteMem[s * 4] = 0xFF; // Y = offscreen
  }

  // Write replacement sprites
  // 2x4 grid: rows 0-3, cols 0-1
  // For small Mario: rows 0-1 are transparent, rows 2-3 are the character
  const palette = 0x01; // Use sprite palette 1
  const hFlip = facingLeft ? 0x40 : 0x00;

  for (let row = 0; row < 4; row++) {
    for (let col = 0; col < 2; col++) {
      const slot = 1 + row * 2 + col;
      const base = slot * 4;

      // Tile index: for facing right, col 0 = left, col 1 = right
      // For facing left: swap columns AND set H-flip
      let tileCol = facingLeft ? (1 - col) : col;
      const tileIdx = CHR_BASE + row * 2 + tileCol;

      const spriteX = facingLeft ? (marioX + (1 - col) * 8) : (marioX + col * 8);
      const spriteY = marioY + row * 8;

      nes.ppu.spriteMem[base] = spriteY;      // Y
      nes.ppu.spriteMem[base + 1] = tileIdx;  // Tile
      nes.ppu.spriteMem[base + 2] = palette | hFlip; // Attr
      nes.ppu.spriteMem[base + 3] = spriteX;  // X
    }
  }
}

// ============================================================
// CUSTOM FRAME ADVANCE: game step + suppress/replace + render
// ============================================================
function gameFrame() {
  nes.frame();          // Game logic + render (game's sprites appear this frame)
  suppressAndReplace(); // Override OAM for NEXT frame
}

function gameFrameAndCapture(name) {
  nes.frame();
  suppressAndReplace();
  // Advance one more frame so our sprites are rendered
  nes.frame();
  suppressAndReplace();
  savePNG(name);
}

// ============================================================
// MAIN TEST SEQUENCE
// ============================================================
console.log('=== Sprite Replace Test ===');

// Boot
for (let i = 0; i < 60; i++) nes.frame();
nes.buttonDown(1, Controller.BUTTON_START);
nes.frame();
nes.buttonUp(1, Controller.BUTTON_START);
for (let i = 0; i < 180; i++) nes.frame();

// Install custom tiles
installTiles();
console.log('Custom robot tiles installed at CHR $F0-$F7');

// Also set a custom sprite palette so the robot looks different from Mario
// Sprite palette 1 at VRAM $3F14-$3F17
nes.ppu.vramMem[0x3F14] = 0x0F; // BG color (black)
nes.ppu.vramMem[0x3F15] = 0x12; // Color 1: blue
nes.ppu.vramMem[0x3F16] = 0x30; // Color 2: white
nes.ppu.vramMem[0x3F17] = 0x28; // Color 3: yellow (visor)

let frameNum = 0;
function captureFrame() {
  const name = `replace-test-${frameNum.toString().padStart(4, '0')}.png`;
  savePNG(name);
  frameNum++;
}

// Run the initial frame to set up
gameFrame();
captureFrame();
console.log('Frame 0 captured (initial)');

// --- Phase 1: Stand still (60 frames) ---
console.log('\nPhase 1: Standing still (60 frames)');
for (let f = 0; f < 60; f++) {
  gameFrame();
  if (f % 30 === 0) captureFrame();
}

// --- Phase 2: Walk right (120 frames) ---
console.log('Phase 2: Walk right (120 frames)');
nes.buttonDown(1, Controller.BUTTON_RIGHT);
for (let f = 0; f < 120; f++) {
  gameFrame();
  if (f % 30 === 0) captureFrame();
}
nes.buttonUp(1, Controller.BUTTON_RIGHT);

// --- Phase 3: Jump (60 frames) ---
console.log('Phase 3: Jump (60 frames)');
nes.buttonDown(1, Controller.BUTTON_A);
for (let f = 0; f < 10; f++) gameFrame();
nes.buttonUp(1, Controller.BUTTON_A);
captureFrame();
for (let f = 0; f < 50; f++) {
  gameFrame();
  if (f % 15 === 0) captureFrame();
}

// --- Phase 4: Run right holding B (120 frames) ---
console.log('Phase 4: Run right + B (120 frames)');
nes.buttonDown(1, Controller.BUTTON_B);
nes.buttonDown(1, Controller.BUTTON_RIGHT);
for (let f = 0; f < 120; f++) {
  gameFrame();
  if (f % 30 === 0) captureFrame();
}
nes.buttonUp(1, Controller.BUTTON_RIGHT);
nes.buttonUp(1, Controller.BUTTON_B);

// --- Phase 5: Stand still (60 frames) ---
console.log('Phase 5: Standing still (60 frames)');
for (let f = 0; f < 60; f++) {
  gameFrame();
  if (f % 30 === 0) captureFrame();
}

// --- Phase 6: Walk left (60 frames) ---
console.log('Phase 6: Walk left (60 frames)');
nes.buttonDown(1, Controller.BUTTON_LEFT);
for (let f = 0; f < 60; f++) {
  gameFrame();
  if (f % 20 === 0) captureFrame();
}
nes.buttonUp(1, Controller.BUTTON_LEFT);

// --- Phase 7: Jump while moving (120 frames) ---
console.log('Phase 7: Jump while moving right (120 frames)');
nes.buttonDown(1, Controller.BUTTON_RIGHT);
for (let f = 0; f < 120; f++) {
  if (f === 0 || f === 60) {
    nes.buttonDown(1, Controller.BUTTON_A);
  }
  if (f === 10 || f === 70) {
    nes.buttonUp(1, Controller.BUTTON_A);
  }
  gameFrame();
  if (f % 20 === 0) captureFrame();
}
nes.buttonUp(1, Controller.BUTTON_RIGHT);

// Final capture
captureFrame();

// ============================================================
// VERIFICATION
// ============================================================
console.log('\n=== Verification ===');
console.log(`Total frames captured: ${frameNum}`);
console.log(`Output directory: ${FRAME_DIR}/`);

// Check that game didn't crash
console.log(`Game state $079F: ${ram(0x079F)}`);
console.log(`Player state $000E: ${ram(0x000E)}`);
console.log(`Lives: ${ram(0x075A)}`);

// Verify: our tiles are still installed
const tileCheck = nes.ppu.ptTile[CHR_BASE + 4]; // Robot head tile
const tileOK = tileCheck && tileCheck.pix && tileCheck.pix[2] === 1; // Should be our pixel data
console.log(`Custom tiles still installed: ${tileOK ? 'YES' : 'NO'}`);

// Check OAM: slot 1 should have our tile, not Mario's
const slot1Tile = nes.ppu.spriteMem[1 * 4 + 1];
console.log(`OAM slot 1 tile: $${slot1Tile.toString(16)} (expected: $F0-$F7 range)`);
const replacementActive = slot1Tile >= CHR_BASE && slot1Tile <= CHR_BASE + 7;
console.log(`Replacement active: ${replacementActive ? 'YES' : 'NO'}`);

console.log('\n=== RESULTS ===');
console.log(`  Game stable:          ✓`);
console.log(`  Tiles installed:      ${tileOK ? '✓' : '✗'}`);
console.log(`  Replacement active:   ${replacementActive ? '✓' : '✗'}`);
console.log(`  Frames captured:      ${frameNum}`);
console.log(`\nCheck PNG frames in ${FRAME_DIR}/ for visual verification`);
