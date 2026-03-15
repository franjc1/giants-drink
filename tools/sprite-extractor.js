/**
 * sprite-extractor.js — Extract real sprite pixel data from NES ROMs
 *
 * Outputs 2D pixel arrays and RGB palettes for use in browser visualizations
 *
 * Usage: node tools/sprite-extractor.js <rom-path>
 */

import { NES, Controller } from "jsnes";
import fs from "fs";
import path from "path";

// NES 64-color hardware palette (NTSC)
const NES_PALETTE = [
  "#666666", "#002A88", "#1412A7", "#3B00A4", "#5C007E", "#6E0040", "#6C0600", "#561D00",
  "#333500", "#0B4800", "#005200", "#004F08", "#00404D", "#000000", "#000000", "#000000",
  "#ADADAD", "#155FD9", "#4240FF", "#7527FE", "#A01ACC", "#B71E7B", "#B53120", "#994E00",
  "#6B6D00", "#388700", "#0C9300", "#008F32", "#007C8D", "#000000", "#000000", "#000000",
  "#FFFEFF", "#64B0FF", "#9290FF", "#C676FF", "#F36AFF", "#FE6ECC", "#FE8170", "#EA9E22",
  "#BCBE00", "#88D800", "#5CE430", "#45E082", "#48CDDE", "#4F4F4F", "#000000", "#000000",
  "#FFFEFF", "#C0DFFF", "#D3D2FF", "#E8C8FF", "#FBC2FF", "#FEC4EA", "#FECCC5", "#F7D8A5",
  "#E4E594", "#CFEF96", "#BDF4AB", "#B3F3CC", "#B5EBF2", "#B8B8B8", "#000000", "#000000"
];

const ROM_PATH = process.argv[2];
if (!ROM_PATH) {
  console.error("Usage: node sprite-extractor.js <rom-path>");
  process.exit(1);
}

// Helper functions from jsnes-extractor
function makeNES() {
  return new NES({
    onFrame: () => {},
    onAudioSample: null,
    onStatusUpdate: () => {},
    emulateSound: false,
  });
}

const BTNS = [
  Controller.BUTTON_A,
  Controller.BUTTON_B,
  Controller.BUTTON_SELECT,
  Controller.BUTTON_START,
  Controller.BUTTON_UP,
  Controller.BUTTON_DOWN,
  Controller.BUTTON_LEFT,
  Controller.BUTTON_RIGHT,
];

function clearInput(nes) {
  for (const b of BTNS) nes.buttonUp(1, b);
}

function step(nes, n = 1) {
  for (let i = 0; i < n; i++) nes.frame();
}

function activeSprites(nes) {
  let n = 0;
  for (let i = 0; i < 64; i++) {
    if (nes.ppu.spriteMem[i * 4] < 0xef) n++;
  }
  return n;
}

function nametableDensity(nes) {
  const v = nes.ppu.vramMem;
  let nonZero = 0;
  for (let i = 0x2000; i < 0x23c0; i++) {
    if (v[i] !== 0) nonZero++;
  }
  return nonZero / 960;
}

// Boot to gameplay
function bootToGameplay(nes) {
  console.log("Booting to gameplay...");

  for (let cycle = 0; cycle < 15; cycle++) {
    // Tap Start (and A on odd cycles)
    nes.buttonDown(1, Controller.BUTTON_START);
    if (cycle % 2 === 1) nes.buttonDown(1, Controller.BUTTON_A);
    nes.frame();
    nes.buttonUp(1, Controller.BUTTON_START);
    nes.buttonUp(1, Controller.BUTTON_A);

    step(nes, 119);

    const spr = activeSprites(nes);
    const nt = nametableDensity(nes);

    console.log(`  Cycle ${cycle + 1}: sprites=${spr} ntDensity=${(nt * 100).toFixed(1)}%`);

    if (spr > 4 && nt > 0.55) {
      console.log("  ✓ Gameplay detected");
      clearInput(nes);
      step(nes, 60); // settle
      return true;
    }
  }

  console.log("  ⚠ Gameplay not clearly detected, proceeding anyway");
  return false;
}

// Convert NES 2bpp CHR tile to 2D pixel array
function chrTileToPixels(chrData, tileIndex) {
  const tileOffset = tileIndex * 16;
  const pixels = [];

  for (let row = 0; row < 8; row++) {
    const pixelRow = [];
    const lowByte = chrData[tileOffset + row];
    const highByte = chrData[tileOffset + row + 8];

    for (let col = 0; col < 8; col++) {
      const bit = 7 - col; // NES tiles are stored MSB first
      const lowBit = (lowByte >> bit) & 1;
      const highBit = (highByte >> bit) & 1;
      const colorIndex = (highBit << 1) | lowBit;
      pixelRow.push(colorIndex);
    }
    pixels.push(pixelRow);
  }

  return pixels;
}

// Get current palette and convert to RGB
function extractPalette(nes) {
  const paletteData = nes.ppu.vramMem.slice(0x3F00, 0x3F20);
  const palette = {};

  for (let i = 0; i < 32; i++) {
    const nesColorIndex = paletteData[i] & 0x3F; // mask to 6 bits
    palette[i] = NES_PALETTE[nesColorIndex];
  }

  return palette;
}

// Extract background tile from nametable
function extractBGTile(nes, nametableX, nametableY) {
  const v = nes.ppu.vramMem;
  const tileIndex = v[0x2000 + nametableY * 32 + nametableX];

  // Determine which pattern table for backgrounds
  const bgPatternTable = nes.ppu.f_bgPatternTable;
  const chrOffset = bgPatternTable * 0x1000;
  const chrData = v.slice(chrOffset, chrOffset + 0x1000);

  return chrTileToPixels(chrData, tileIndex);
}

// Find Mario's tiles by examining OAM
function findMarioTiles(nes) {
  const oam = nes.ppu.spriteMem;
  const marioTiles = new Set();

  // Look at visible sprites, find the largest one (likely Mario)
  let largestSprite = null;
  let maxTileCount = 0;

  for (let i = 0; i < 64; i++) {
    const spriteY = oam[i * 4];
    const tileIndex = oam[i * 4 + 1];
    const attributes = oam[i * 4 + 2];
    const spriteX = oam[i * 4 + 3];

    if (spriteY >= 0xEF) continue; // not visible

    // Count tiles in this general area (Mario might be multiple tiles)
    let nearbyTiles = 0;
    for (let j = 0; j < 64; j++) {
      const otherY = oam[j * 4];
      const otherX = oam[j * 4 + 3];
      if (otherY >= 0xEF) continue;

      // Check if this sprite is near the current one
      if (Math.abs(otherX - spriteX) <= 16 && Math.abs(otherY - spriteY) <= 16) {
        nearbyTiles++;
        marioTiles.add(oam[j * 4 + 1]); // tile index
      }
    }

    if (nearbyTiles > maxTileCount) {
      maxTileCount = nearbyTiles;
      largestSprite = { x: spriteX, y: spriteY, tiles: nearbyTiles };
    }
  }

  console.log(`  Found sprite cluster: ${maxTileCount} tiles, Mario tiles: [${[...marioTiles].join(', ')}]`);
  return [...marioTiles];
}

// Find enemy tiles (look for moving sprites away from Mario)
function findEnemyTiles(nes) {
  const oam = nes.ppu.spriteMem;
  const enemyTiles = new Set();

  // Get Mario position first
  const marioTiles = findMarioTiles(nes);
  let marioX = 0, marioY = 0;

  for (let i = 0; i < 64; i++) {
    const spriteY = oam[i * 4];
    const tileIndex = oam[i * 4 + 1];
    const spriteX = oam[i * 4 + 3];

    if (spriteY >= 0xEF) continue;
    if (marioTiles.includes(tileIndex)) {
      marioX = spriteX;
      marioY = spriteY;
      break;
    }
  }

  // Look for sprites away from Mario
  for (let i = 0; i < 64; i++) {
    const spriteY = oam[i * 4];
    const tileIndex = oam[i * 4 + 1];
    const spriteX = oam[i * 4 + 3];

    if (spriteY >= 0xEF) continue;
    if (marioTiles.includes(tileIndex)) continue;

    const distFromMario = Math.abs(spriteX - marioX) + Math.abs(spriteY - marioY);
    if (distFromMario > 32) { // likely enemy
      enemyTiles.add(tileIndex);
    }
  }

  console.log(`  Found enemy tiles: [${[...enemyTiles].join(', ')}]`);
  return [...enemyTiles];
}

// Extract sprites by capturing different animation frames
function captureAnimationFrames(nes) {
  const frames = {};

  // Capture initial frame
  console.log("Capturing animation frames...");
  const marioTiles = findMarioTiles(nes);
  frames.mario_initial = marioTiles;

  // Move right to get walking frames
  nes.buttonDown(1, Controller.BUTTON_RIGHT);
  step(nes, 15);
  frames.mario_walk1 = findMarioTiles(nes);

  step(nes, 15);
  frames.mario_walk2 = findMarioTiles(nes);

  nes.buttonUp(1, Controller.BUTTON_RIGHT);

  // Jump
  clearInput(nes);
  step(nes, 30);
  nes.buttonDown(1, Controller.BUTTON_A);
  step(nes, 3);
  nes.buttonUp(1, Controller.BUTTON_A);
  step(nes, 10);
  frames.mario_jump = findMarioTiles(nes);

  // Let Mario land
  step(nes, 60);
  clearInput(nes);

  // Get enemy tiles
  frames.enemies = findEnemyTiles(nes);

  return frames;
}

// Main extraction function
function extractSprites(nes) {
  console.log("\nExtracting sprites...");

  // Get palette first
  const palette = extractPalette(nes);
  console.log("✓ Palette extracted");

  // Get sprite pattern table data
  const spPatternTable = nes.ppu.f_spPatternTable;
  const sprChrOffset = spPatternTable * 0x1000;
  const sprChrData = nes.ppu.vramMem.slice(sprChrOffset, sprChrOffset + 0x1000);

  // Get background pattern table data
  const bgPatternTable = nes.ppu.f_bgPatternTable;
  const bgChrOffset = bgPatternTable * 0x1000;
  const bgChrData = nes.ppu.vramMem.slice(bgChrOffset, bgChrOffset + 0x1000);

  console.log(`Sprite pattern table: $${sprChrOffset.toString(16)}, BG pattern table: $${bgChrOffset.toString(16)}`);

  // Capture animation frames
  const animFrames = captureAnimationFrames(nes);

  // Convert tiles to pixel arrays
  const sprites = {};

  // Mario sprites
  if (animFrames.mario_initial.length > 0) {
    sprites.mario_stand = chrTileToPixels(sprChrData, animFrames.mario_initial[0]);
  }
  if (animFrames.mario_walk1.length > 0) {
    sprites.mario_walk1 = chrTileToPixels(sprChrData, animFrames.mario_walk1[0]);
  }
  if (animFrames.mario_walk2.length > 0) {
    sprites.mario_walk2 = chrTileToPixels(sprChrData, animFrames.mario_walk2[0]);
  }
  if (animFrames.mario_jump.length > 0) {
    sprites.mario_jump = chrTileToPixels(sprChrData, animFrames.mario_jump[0]);
  }

  // Enemy sprites
  if (animFrames.enemies.length > 0) {
    sprites.goomba = chrTileToPixels(sprChrData, animFrames.enemies[0]);
    if (animFrames.enemies.length > 1) {
      sprites.koopa = chrTileToPixels(sprChrData, animFrames.enemies[1]);
    }
  }

  // Background tiles (sample from nametable)
  const tiles = {};

  // Look for question block (common tile, find by scanning nametable)
  const v = nes.ppu.vramMem;
  let questionBlockTile = null;
  let groundTile = null;

  // Scan nametable for interesting tiles
  for (let y = 10; y < 15; y++) { // middle area likely to have question blocks
    for (let x = 5; x < 25; x++) {
      const tileIndex = v[0x2000 + y * 32 + x];
      if (tileIndex > 0) {
        if (!questionBlockTile) questionBlockTile = tileIndex;
        if (tileIndex !== questionBlockTile && !groundTile) groundTile = tileIndex;
        if (questionBlockTile && groundTile) break;
      }
    }
    if (questionBlockTile && groundTile) break;
  }

  if (questionBlockTile) {
    tiles.question_block = chrTileToPixels(bgChrData, questionBlockTile);
  }
  if (groundTile) {
    tiles.ground = chrTileToPixels(bgChrData, groundTile);
  }

  // Add brick tile (commonly tile index 0x0A in SMB)
  tiles.brick = chrTileToPixels(bgChrData, 0x0A);

  return { palette, sprites, tiles };
}

// Main function
function main() {
  console.log(`Loading ROM: ${ROM_PATH}`);

  const romData = fs.readFileSync(ROM_PATH, { encoding: "binary" });
  console.log(`✓ ROM loaded: ${romData.length} bytes`);

  const nes = makeNES();
  nes.loadROM(romData);

  // Boot to gameplay
  const gameplayOk = bootToGameplay(nes);

  // Extract sprite data
  const extracted = extractSprites(nes);

  // Prepare output
  const output = {
    smb: {
      palette_rgb: extracted.palette,
      sprites: extracted.sprites,
      tiles: extracted.tiles
    }
  };

  // Ensure output directory exists
  const outputDir = "/Users/joe/giants-drink/experiment-output";
  fs.mkdirSync(outputDir, { recursive: true });

  // Write output
  const outputPath = path.join(outputDir, "real-sprite-data.json");
  fs.writeFileSync(outputPath, JSON.stringify(output, null, 2));

  console.log(`\n✓ Sprite data extracted to: ${outputPath}`);
  console.log(`  Sprites: ${Object.keys(extracted.sprites).join(", ")}`);
  console.log(`  Tiles: ${Object.keys(extracted.tiles).join(", ")}`);
  console.log(`  Palette entries: ${Object.keys(extracted.palette).length}`);
}

main();