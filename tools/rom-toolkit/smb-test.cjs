/**
 * SMB Transformation Toolkit — Validation Test Suite
 *
 * Tests ALL required transformations:
 *
 * VISUAL:
 *   1. Swap background palette to a completely different color scheme
 *   2. Replace a CHR tile (ground tile → checkerboard)
 *   3. Inject a sprite that doesn't exist in the original game
 *
 * MECHANICAL:
 *   4. Change the player's jump height (super jump)
 *   5. Make an enemy move faster or slower
 *   6. Toggle player invincibility
 *
 * GAMEPLAY:
 *   7. Warp to a different level
 *   8. Change the number of lives
 *   9. Suppress death on enemy collision
 *
 * Run: node tools/rom-toolkit/smb-test.cjs
 */
const fs = require('fs');
const { NES } = require('jsnes');
const { PNG } = require('pngjs');
const SMBToolkit = require('./smb-api.cjs');
const { Controller, RAM, NES_COLORS } = SMBToolkit;

const ROM_PATH = `${process.env.HOME}/nes-roms/Super Mario Bros. (World).nes`;
const OUTPUT_DIR = `${__dirname}/test-output`;

// Create output directory
if (!fs.existsSync(OUTPUT_DIR)) fs.mkdirSync(OUTPUT_DIR, { recursive: true });

// ============================================================
// Setup
// ============================================================
const romData = fs.readFileSync(ROM_PATH);
let lastFrame = null;

const nes = new NES({
  onFrame: fb => { lastFrame = fb; },
  onAudioSample: () => {}
});
nes.loadROM(romData.toString('binary'));

const tk = new SMBToolkit(nes);

// Helper: save frame buffer as PNG
function saveFramePNG(filename) {
  // Capture a fresh frame
  tk.step(1);
  const fb = lastFrame;
  if (!fb) { console.log('  WARNING: No frame buffer available'); return; }

  const png = new PNG({ width: 256, height: 240 });
  for (let i = 0; i < 256 * 240; i++) {
    const pixel = fb[i];
    // jsnes frame buffer format: 0xAARRGGBB or 0xRRGGBBAA — need to check
    // Actually jsnes uses: (r << 16) | (g << 8) | b — no alpha in high byte
    // But it might be stored differently. Let's extract carefully.
    const r = (pixel >> 16) & 0xFF;
    const g = (pixel >> 8) & 0xFF;
    const b = pixel & 0xFF;
    png.data[i * 4] = r;
    png.data[i * 4 + 1] = g;
    png.data[i * 4 + 2] = b;
    png.data[i * 4 + 3] = 255; // Alpha
  }

  const buffer = PNG.sync.write(png);
  fs.writeFileSync(`${OUTPUT_DIR}/${filename}`, buffer);
  console.log(`  Saved: ${filename}`);
}

// Test results tracking
const results = [];
function report(name, pass, detail = '') {
  results.push({ name, pass, detail });
  console.log(`${pass ? '✓ PASS' : '✗ FAIL'}: ${name}${detail ? ' — ' + detail : ''}`);
}

// ============================================================
// Boot to gameplay
// ============================================================
console.log('Booting SMB to gameplay...');
tk.bootToGameplay();
const gameplayState = tk.saveState();

// Capture reference frame
saveFramePNG('00-reference.png');
console.log('Reference state:', JSON.stringify(tk.getFullState().game));
console.log('');

// ============================================================
// TEST 1: Background palette swap
// ============================================================
console.log('--- TEST 1: Background Palette Swap ---');
try {
  tk.loadState(gameplayState);
  tk.step(30);

  // Read original palettes
  const origPal0 = tk.getPalette(0);
  const origPal1 = tk.getPalette(1);
  console.log('  Original BG palette 0:', origPal0.map(c => '0x' + c.toString(16)));

  // Apply a "night mode" color scheme
  tk.setPalette(0, [NES_COLORS.BLACK, NES_COLORS.DARK_BLUE, NES_COLORS.PURPLE, NES_COLORS.GREY]);
  tk.setPalette(1, [NES_COLORS.BLACK, NES_COLORS.DARK_RED, NES_COLORS.RED, NES_COLORS.ORANGE]);
  tk.setPalette(2, [NES_COLORS.BLACK, NES_COLORS.DARK_GREEN, NES_COLORS.GREEN, NES_COLORS.YELLOW]);
  tk.setPalette(3, [NES_COLORS.BLACK, NES_COLORS.BROWN, NES_COLORS.ORANGE, NES_COLORS.WHITE]);

  // Verify the palette changed
  const newPal0 = tk.getPalette(0);
  const paletteChanged = newPal0[0] !== origPal0[0] || newPal0[1] !== origPal0[1];

  // Run some frames and capture
  tk.step(30);
  saveFramePNG('01-palette-swap.png');

  report('Background palette swap', paletteChanged,
    `Old: [${origPal0}] → New: [${newPal0}]`);
} catch (e) {
  report('Background palette swap', false, e.message);
}

// ============================================================
// TEST 2: CHR tile replacement
// ============================================================
console.log('\n--- TEST 2: CHR Tile Replacement ---');
try {
  tk.loadState(gameplayState);
  tk.step(30);

  // Ground tile is $B4 in BG pattern table (index 256 + 0xB4 = 436)
  const groundTileIdx = 256 + 0xB4;
  const origTile = tk.getCHRTile(groundTileIdx);
  console.log('  Original ground tile ($B4):');
  for (let row = 0; row < 8; row++) {
    console.log('    ' + origTile.slice(row * 8, row * 8 + 8).join(''));
  }

  // Replace with a diagonal stripe pattern
  const newTile = new Array(64);
  for (let row = 0; row < 8; row++) {
    for (let col = 0; col < 8; col++) {
      newTile[row * 8 + col] = ((row + col) % 4 < 2) ? 2 : 1;
    }
  }
  tk.swapCHRTile(groundTileIdx, newTile);

  // Also swap the other ground tiles ($B5, $B6, $B7)
  tk.swapCHRTile(256 + 0xB5, newTile);
  const vertStripe = new Array(64);
  for (let row = 0; row < 8; row++) {
    for (let col = 0; col < 8; col++) {
      vertStripe[row * 8 + col] = (col % 2 === 0) ? 3 : 0;
    }
  }
  tk.swapCHRTile(256 + 0xB6, vertStripe);
  tk.swapCHRTile(256 + 0xB7, vertStripe);

  // Verify tile changed
  const modTile = tk.getCHRTile(groundTileIdx);
  const tileChanged = modTile[0] !== origTile[0] || modTile[1] !== origTile[1];

  tk.step(30);
  saveFramePNG('02-chr-tile-swap.png');

  report('CHR tile replacement', tileChanged,
    `Ground tile pixels changed from ${origTile.slice(0,8).join('')} to ${modTile.slice(0,8).join('')}`);
} catch (e) {
  report('CHR tile replacement', false, e.message);
}

// ============================================================
// TEST 3: Sprite injection
// ============================================================
console.log('\n--- TEST 3: Sprite Injection ---');
try {
  tk.loadState(gameplayState);
  tk.step(30);

  // Inject a sprite at a visible location using a coin/item tile
  // Use OAM slot 60 (high slot, less likely to be used by game)
  const slot = 60;
  const tileId = 0x2E; // Star/item tile from SMB sprite bank
  const xPos = 128;
  const yPos = 120;

  tk.injectSprite(slot, tileId, xPos, yPos, 0x01); // Palette 1

  // Run a frame so the injection takes effect via DMA
  tk.step(1);

  // Verify OAM has our sprite
  const oamBase = slot * 4;
  const oamY = nes.ppu.spriteMem[oamBase];
  const oamTile = nes.ppu.spriteMem[oamBase + 1];
  const oamX = nes.ppu.spriteMem[oamBase + 3];
  const spriteVisible = oamY === yPos && oamTile === tileId && oamX === xPos;

  console.log(`  OAM slot ${slot}: Y=${oamY} tile=0x${oamTile.toString(16)} X=${oamX}`);

  // Run more frames with persistent injection and capture
  tk.step(30);
  saveFramePNG('03-sprite-injection.png');

  report('Sprite injection', spriteVisible,
    `Injected tile 0x${tileId.toString(16)} at (${xPos},${yPos}) → OAM shows (${oamX},${oamY}) tile=0x${oamTile.toString(16)}`);
} catch (e) {
  report('Sprite injection', false, e.message);
}

// ============================================================
// TEST 4: Jump height modification
// ============================================================
console.log('\n--- TEST 4: Jump Height Modification ---');
try {
  tk.loadState(gameplayState);
  tk.step(30);

  // Record normal jump height
  const normalJumpState = tk.saveState();
  nes.buttonDown(1, Controller.BUTTON_A);
  tk.step(5);
  nes.buttonUp(1, Controller.BUTTON_A);
  tk.step(25);
  const normalPeakY = tk.ram(RAM.PlayerY);

  // Restore and do a super jump
  tk.loadState(normalJumpState);
  nes.buttonDown(1, Controller.BUTTON_A);
  tk.step(2);
  // Set super jump velocity
  tk.setJumpVelocity(-10); // Much stronger than normal -4
  nes.buttonUp(1, Controller.BUTTON_A);
  tk.step(25);
  const superPeakY = tk.ram(RAM.PlayerY);

  // Higher jump = lower Y value (NES Y increases downward)
  const jumpImproved = superPeakY < normalPeakY;

  saveFramePNG('04-super-jump.png');

  report('Jump height modification', jumpImproved,
    `Normal peak Y=${normalPeakY}, Super peak Y=${superPeakY} (lower=higher)`);
} catch (e) {
  report('Jump height modification', false, e.message);
}

// ============================================================
// TEST 5: Enemy speed modification
// ============================================================
console.log('\n--- TEST 5: Enemy Speed Modification ---');
try {
  tk.loadState(gameplayState);

  // Move right to encounter an enemy
  nes.buttonDown(1, Controller.BUTTON_RIGHT);
  tk.step(120);
  nes.buttonUp(1, Controller.BUTTON_RIGHT);

  // Find an active enemy
  const enemies = tk.getFullState().enemies;
  console.log('  Active enemies:', enemies.length);

  if (enemies.length > 0) {
    const slot = enemies[0].slot;
    const origSpeed = tk.ram(RAM.EnemyXSpeed + slot);
    const origX = tk.ram(RAM.EnemyX + slot);

    // Record normal movement over 20 frames
    const normalState = tk.saveState();
    tk.step(20);
    const normalDelta = tk.ram(RAM.EnemyX + slot) - origX;

    // Restore and set enemy to double speed
    tk.loadState(normalState);
    tk.freezeEnemySpeed(slot, 200); // Much faster than default 248
    tk.step(20);
    const fastDelta = tk.ram(RAM.EnemyX + slot) - origX;
    tk.unfreezeEnemySpeed(slot);

    // Restore and stop enemy
    tk.loadState(normalState);
    tk.freezeEnemySpeed(slot, 0); // Stopped
    tk.step(20);
    const stoppedDelta = tk.ram(RAM.EnemyX + slot) - origX;
    tk.unfreezeEnemySpeed(slot);

    const speedChanged = Math.abs(fastDelta) > Math.abs(normalDelta) || stoppedDelta === 0;

    saveFramePNG('05-enemy-speed.png');

    report('Enemy speed modification', speedChanged,
      `Normal: ${normalDelta}px, Fast: ${fastDelta}px, Stopped: ${stoppedDelta}px`);
  } else {
    // No enemies found — move further right and retry
    console.log('  No enemies found, trying further...');
    report('Enemy speed modification', false, 'No enemies encountered');
  }
} catch (e) {
  report('Enemy speed modification', false, e.message);
}

// ============================================================
// TEST 6: Player invincibility
// ============================================================
console.log('\n--- TEST 6: Player Invincibility ---');
try {
  tk.loadState(gameplayState);
  tk.step(30);

  // Set small Mario (vulnerable to one-hit kill)
  tk.setPlayerState(0); // Small Mario

  // Enable invincibility
  tk.enablePersistentInvincibility();

  // Walk into enemy territory
  nes.buttonDown(1, Controller.BUTTON_RIGHT);
  tk.step(200);
  nes.buttonUp(1, Controller.BUTTON_RIGHT);

  const livesAfterInvincible = tk.ram(RAM.Lives);
  const playerStateAfter = tk.ram(RAM.PlayerState);
  tk.disablePersistentInvincibility();

  // Compare with non-invincible run
  tk.loadState(gameplayState);
  tk.step(30);
  tk.setPlayerState(0); // Small Mario
  const livesBeforeVulnerable = tk.ram(RAM.Lives);

  nes.buttonDown(1, Controller.BUTTON_RIGHT);
  tk.step(200);
  nes.buttonUp(1, Controller.BUTTON_RIGHT);

  const livesAfterVulnerable = tk.ram(RAM.Lives);

  // Invincible run should have same lives; vulnerable might have lost one
  const invincibleWorks = livesAfterInvincible >= livesBeforeVulnerable;

  saveFramePNG('06-invincibility.png');

  report('Player invincibility', invincibleWorks,
    `Invincible: lives=${livesAfterInvincible}, Vulnerable: lives ${livesBeforeVulnerable}→${livesAfterVulnerable}`);
} catch (e) {
  report('Player invincibility', false, e.message);
}

// ============================================================
// TEST 7: Level warp
// ============================================================
console.log('\n--- TEST 7: Level Warp ---');
try {
  tk.loadState(gameplayState);
  tk.step(30);

  // Record current nametable signature (first 16 tiles of row 24)
  const origNT = [];
  for (let col = 0; col < 16; col++) {
    origNT.push(nes.ppu.vramMem[0x2000 + 24 * 32 + col]);
  }

  // Warp to World 4-1
  tk.warpToLevel(4, 1);

  // Verify world/level changed
  const state = tk.getFullState();
  const worldCorrect = state.game.world === 4;
  const levelCorrect = state.game.level === 1;

  // Check nametable changed
  const newNT = [];
  for (let col = 0; col < 16; col++) {
    newNT.push(nes.ppu.vramMem[0x2000 + 24 * 32 + col]);
  }
  const ntChanged = origNT.some((v, i) => v !== newNT[i]);

  // Verify game still runs (move right)
  nes.buttonDown(1, Controller.BUTTON_RIGHT);
  tk.step(60);
  nes.buttonUp(1, Controller.BUTTON_RIGHT);
  const canMove = tk.ram(RAM.PlayerX) > 40;

  const warpSuccess = worldCorrect && levelCorrect && ntChanged;

  saveFramePNG('07-level-warp.png');

  report('Level warp', warpSuccess,
    `Target: W4-1, Got: W${state.game.world}-${state.game.level}, NT changed: ${ntChanged}, Playable: ${canMove}`);
} catch (e) {
  report('Level warp', false, e.message);
}

// ============================================================
// TEST 8: Change lives
// ============================================================
console.log('\n--- TEST 8: Change Lives ---');
try {
  tk.loadState(gameplayState);
  tk.step(30);

  const origLives = tk.ram(RAM.Lives);
  tk.setLives(9);
  tk.step(1);
  const newLives = tk.ram(RAM.Lives);

  const livesChanged = newLives === 9 && newLives !== origLives;

  saveFramePNG('08-lives-change.png');

  report('Change lives', livesChanged,
    `Original: ${origLives}, Set to: 9, Read back: ${newLives}`);
} catch (e) {
  report('Change lives', false, e.message);
}

// ============================================================
// TEST 9: Suppress death on enemy collision
// ============================================================
console.log('\n--- TEST 9: Death Suppression ---');
try {
  tk.loadState(gameplayState);
  tk.step(30);

  // Set small Mario and enable death prevention
  tk.setPlayerState(0);
  tk.enableDeathPrevention();
  const livesBeforeDeath = tk.ram(RAM.Lives);

  // Walk into enemies
  nes.buttonDown(1, Controller.BUTTON_RIGHT);
  tk.step(200);
  nes.buttonUp(1, Controller.BUTTON_RIGHT);

  const livesAfterProtected = tk.ram(RAM.Lives);
  const stateAfterProtected = tk.ram(RAM.PlayerState);
  tk.disableDeathPrevention();

  // Compare: without death prevention
  tk.loadState(gameplayState);
  tk.step(30);
  tk.setPlayerState(0);
  const livesBeforeUnprotected = tk.ram(RAM.Lives);

  nes.buttonDown(1, Controller.BUTTON_RIGHT);
  tk.step(200);
  nes.buttonUp(1, Controller.BUTTON_RIGHT);

  const livesAfterUnprotected = tk.ram(RAM.Lives);

  // Protected run should keep lives; unprotected might lose one
  const deathSuppressed = livesAfterProtected >= livesBeforeDeath;

  saveFramePNG('09-death-suppression.png');

  report('Death suppression', deathSuppressed,
    `Protected: lives ${livesBeforeDeath}→${livesAfterProtected}, state=${stateAfterProtected}. Unprotected: lives ${livesBeforeUnprotected}→${livesAfterUnprotected}`);
} catch (e) {
  report('Death suppression', false, e.message);
}

// ============================================================
// SUMMARY
// ============================================================
console.log('\n========================================');
console.log('TEST SUMMARY');
console.log('========================================');
const passed = results.filter(r => r.pass).length;
const total = results.length;
results.forEach((r, i) => {
  console.log(`  ${i + 1}. ${r.pass ? '✓' : '✗'} ${r.name}`);
});
console.log(`\n  ${passed}/${total} tests passed`);
console.log(`\n  Screenshots saved to: ${OUTPUT_DIR}/`);
console.log('========================================');
