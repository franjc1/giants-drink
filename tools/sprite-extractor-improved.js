/**
 * sprite-extractor-improved.js — Extract complete sprite assemblies from NES ROMs
 *
 * Improved version that captures multi-tile sprites and finds enemies properly
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
  console.error("Usage: node sprite-extractor-improved.js <rom-path>");
  process.exit(1);
}

function makeNES() {
  return new NES({
    onFrame: () => {},
    onAudioSample: null,
    onStatusUpdate: () => {},
    emulateSound: false,
  });
}

const BTNS = [
  Controller.BUTTON_A, Controller.BUTTON_B, Controller.BUTTON_SELECT, Controller.BUTTON_START,
  Controller.BUTTON_UP, Controller.BUTTON_DOWN, Controller.BUTTON_LEFT, Controller.BUTTON_RIGHT,
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

// Boot to gameplay with more attempts to find enemies
function bootToGameplay(nes) {
  console.log("Booting to gameplay...");

  for (let cycle = 0; cycle < 15; cycle++) {
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
      step(nes, 60);

      // Move right a bit to encounter enemies
      console.log("  Moving right to find enemies...");
      nes.buttonDown(1, Controller.BUTTON_RIGHT);
      step(nes, 240); // Run for 4 seconds
      nes.buttonUp(1, Controller.BUTTON_RIGHT);
      clearInput(nes);
      step(nes, 60);

      return true;
    }
  }

  console.log("  ⚠ Gameplay not clearly detected, proceeding anyway");
  return false;
}

// Convert CHR tile to pixels (same as before)
function chrTileToPixels(chrData, tileIndex) {
  const tileOffset = tileIndex * 16;
  const pixels = [];

  for (let row = 0; row < 8; row++) {
    const pixelRow = [];
    const lowByte = chrData[tileOffset + row];
    const highByte = chrData[tileOffset + row + 8];

    for (let col = 0; col < 8; col++) {
      const bit = 7 - col;
      const lowBit = (lowByte >> bit) & 1;
      const highBit = (highByte >> bit) & 1;
      const colorIndex = (highBit << 1) | lowBit;
      pixelRow.push(colorIndex);
    }
    pixels.push(pixelRow);
  }

  return pixels;
}

// Get palette
function extractPalette(nes) {
  const paletteData = nes.ppu.vramMem.slice(0x3F00, 0x3F20);
  const palette = {};

  for (let i = 0; i < 32; i++) {
    const nesColorIndex = paletteData[i] & 0x3F;
    palette[i] = NES_PALETTE[nesColorIndex];
  }

  return palette;
}

// Get ALL visible sprites and their details
function getAllVisibleSprites(nes) {
  const oam = nes.ppu.spriteMem;
  const sprites = [];

  for (let i = 0; i < 64; i++) {
    const spriteY = oam[i * 4];
    const tileIndex = oam[i * 4 + 1];
    const attributes = oam[i * 4 + 2];
    const spriteX = oam[i * 4 + 3];

    if (spriteY >= 0xEF) continue; // not visible

    sprites.push({
      slot: i,
      x: spriteX,
      y: spriteY,
      tile: tileIndex,
      attributes: attributes
    });
  }

  return sprites.sort((a, b) => a.x - b.x); // Sort by X position
}

// Group sprites that are close together (likely part of same character)
function groupSprites(sprites) {
  const groups = [];
  const processed = new Set();

  for (const sprite of sprites) {
    if (processed.has(sprite.slot)) continue;

    const group = [sprite];
    processed.add(sprite.slot);

    // Find other sprites within 16 pixels
    for (const other of sprites) {
      if (processed.has(other.slot)) continue;

      const dx = Math.abs(other.x - sprite.x);
      const dy = Math.abs(other.y - sprite.y);

      if (dx <= 16 && dy <= 16) {
        group.push(other);
        processed.add(other.slot);
      }
    }

    groups.push(group);
  }

  return groups;
}

// Capture different game states to get variety
function captureMultipleStates(nes) {
  const states = {};

  console.log("Capturing sprite states...");

  // State 1: Initial position
  const sprites1 = getAllVisibleSprites(nes);
  const groups1 = groupSprites(sprites1);
  states.initial = { sprites: sprites1, groups: groups1 };
  console.log(`  Initial: ${sprites1.length} sprites, ${groups1.length} groups`);

  // State 2: After walking right
  clearInput(nes);
  nes.buttonDown(1, Controller.BUTTON_RIGHT);
  step(nes, 30);
  nes.buttonUp(1, Controller.BUTTON_RIGHT);

  const sprites2 = getAllVisibleSprites(nes);
  const groups2 = groupSprites(sprites2);
  states.walking = { sprites: sprites2, groups: groups2 };
  console.log(`  Walking: ${sprites2.length} sprites, ${groups2.length} groups`);

  // State 3: After jumping
  clearInput(nes);
  step(nes, 30);
  nes.buttonDown(1, Controller.BUTTON_A);
  step(nes, 3);
  nes.buttonUp(1, Controller.BUTTON_A);
  step(nes, 15);

  const sprites3 = getAllVisibleSprites(nes);
  const groups3 = groupSprites(sprites3);
  states.jumping = { sprites: sprites3, groups: groups3 };
  console.log(`  Jumping: ${sprites3.length} sprites, ${groups3.length} groups`);

  // State 4: Let Mario land and wait for enemies
  step(nes, 120);
  const sprites4 = getAllVisibleSprites(nes);
  const groups4 = groupSprites(sprites4);
  states.landed = { sprites: sprites4, groups: groups4 };
  console.log(`  Landed: ${sprites4.length} sprites, ${groups4.length} groups`);

  return states;
}

// Extract individual tiles
function extractSpriteTiles(nes, states) {
  const spPatternTable = nes.ppu.f_spPatternTable;
  const sprChrOffset = spPatternTable * 0x1000;
  const sprChrData = nes.ppu.vramMem.slice(sprChrOffset, sprChrOffset + 0x1000);

  console.log(`Extracting tiles from sprite pattern table at $${sprChrOffset.toString(16)}`);

  const allTiles = new Set();
  const tilesByState = {};

  // Collect all unique tiles from all states
  for (const [stateName, state] of Object.entries(states)) {
    const stateTiles = new Set();
    for (const sprite of state.sprites) {
      allTiles.add(sprite.tile);
      stateTiles.add(sprite.tile);
    }
    tilesByState[stateName] = [...stateTiles];
  }

  console.log(`  Found ${allTiles.size} unique sprite tiles across all states`);

  // Extract pixel data for common tiles
  const extractedSprites = {};

  // SMB common sprite tiles (from SMB disassembly knowledge)
  const knownTiles = {
    mario_stand: 0xA2,      // Mario standing frame 1
    mario_walk: 0xA3,       // Mario walking frame
    mario_jump: 0xA5,       // Mario jumping
    goomba: 0x70,           // Goomba frame 1
    koopa: 0xA0,            // Koopa frame
    question_coin: 0x24,    // Coin from question block
  };

  // Try to extract known tiles
  for (const [name, tileIndex] of Object.entries(knownTiles)) {
    if (tileIndex < 256) { // Valid tile index
      extractedSprites[name] = chrTileToPixels(sprChrData, tileIndex);
    }
  }

  // Extract some tiles we actually found
  const foundTilesList = [...allTiles].slice(0, 10); // First 10 unique tiles
  for (let i = 0; i < foundTilesList.length; i++) {
    const tileIndex = foundTilesList[i];
    extractedSprites[`found_tile_${i}_0x${tileIndex.toString(16)}`] = chrTileToPixels(sprChrData, tileIndex);
  }

  // Log what we found
  console.log(`  Tiles by state:`);
  for (const [stateName, tiles] of Object.entries(tilesByState)) {
    console.log(`    ${stateName}: [${tiles.map(t => '0x' + t.toString(16)).join(', ')}]`);
  }

  return extractedSprites;
}

// Extract background tiles with better identification
function extractBackgroundTiles(nes) {
  const v = nes.ppu.vramMem;
  const bgPatternTable = nes.ppu.f_bgPatternTable;
  const bgChrOffset = bgPatternTable * 0x1000;
  const bgChrData = v.slice(bgChrOffset, bgChrOffset + 0x1000);

  console.log(`Extracting background tiles from pattern table at $${bgChrOffset.toString(16)}`);

  const tiles = {};

  // SMB known background tiles
  const knownBgTiles = {
    question_block: 0x24,   // ? block
    used_block: 0x25,       // Used block
    brick: 0x40,            // Brick block
    ground: 0x54,           // Ground surface
    underground_brick: 0x45,
    pipe_top_left: 0x60,
    pipe_top_right: 0x61,
    cloud_top_left: 0x20,
    bush_left: 0x22,
  };

  for (const [name, tileIndex] of Object.entries(knownBgTiles)) {
    if (tileIndex < 256) {
      tiles[name] = chrTileToPixels(bgChrData, tileIndex);
    }
  }

  return tiles;
}

function main() {
  console.log(`Loading ROM: ${ROM_PATH}`);

  const romData = fs.readFileSync(ROM_PATH, { encoding: "binary" });
  console.log(`✓ ROM loaded: ${romData.length} bytes`);

  const nes = makeNES();
  nes.loadROM(romData);

  // Boot to gameplay
  const gameplayOk = bootToGameplay(nes);

  // Extract palette
  const palette = extractPalette(nes);
  console.log("✓ Palette extracted");

  // Capture multiple states
  const states = captureMultipleStates(nes);

  // Extract sprites
  const sprites = extractSpriteTiles(nes, states);

  // Extract background tiles
  const tiles = extractBackgroundTiles(nes);

  // Prepare output
  const output = {
    smb: {
      palette_rgb: palette,
      sprites: sprites,
      tiles: tiles,
      debug: {
        states: Object.fromEntries(
          Object.entries(states).map(([name, state]) => [
            name,
            state.sprites.map(s => ({x: s.x, y: s.y, tile: '0x' + s.tile.toString(16)}))
          ])
        )
      }
    }
  };

  // Write output
  const outputDir = "/Users/joe/giants-drink/experiment-output";
  fs.mkdirSync(outputDir, { recursive: true });

  const outputPath = path.join(outputDir, "real-sprite-data.json");
  fs.writeFileSync(outputPath, JSON.stringify(output, null, 2));

  console.log(`\n✓ Improved sprite data extracted to: ${outputPath}`);
  console.log(`  Sprites: ${Object.keys(sprites).length} tiles`);
  console.log(`  Background tiles: ${Object.keys(tiles).length} tiles`);
  console.log(`  Palette entries: ${Object.keys(palette).length}`);
}

main();