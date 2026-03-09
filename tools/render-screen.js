#!/usr/bin/env node
// render-screen.js
// Session 9: Mesen2 NES screen extractor + renderer
//
// Runs Mesen2 headless with mesen-extract.lua, captures PPU state from stdout,
// then renders a 256×240 NES screen PNG using the NES master palette.
//
// Usage:
//   node tools/render-screen.js [rom.nes] [output-dir]
//
// Defaults:
//   ROM:    ~/nes-roms/Super Mario Bros. (World).nes
//   Output: ~/nes-extracted/smb-capture/

import { spawn } from 'child_process';
import { readFileSync, mkdirSync, writeFileSync, existsSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';
import sharp from 'sharp';
import os from 'os';

const __dirname = dirname(fileURLToPath(import.meta.url));
const HOME = os.homedir();

// ---------------------------------------------------------------------------
// Config
// ---------------------------------------------------------------------------

const MESEN = `${HOME}/mesen2/Mesen.app/Contents/MacOS/Mesen`;
const LUA_SCRIPT = join(__dirname, 'mesen-extract.lua');
const PALETTE_FILE = join(__dirname, '../data/ground-truth/palettes/nes-palette.json');

const romArg = process.argv[2];
const outArg = process.argv[3];

const ROM = romArg || `${HOME}/nes-roms/Super Mario Bros. (World).nes`;
const OUT_DIR = outArg || `${HOME}/nes-extracted/smb-capture`;

// ---------------------------------------------------------------------------
// NES master palette: 64 RGB triples indexed 0x00-0x3F
// Loaded from data/ground-truth/palettes/nes-palette.json
// ---------------------------------------------------------------------------

function loadNesPalette() {
  const data = JSON.parse(readFileSync(PALETTE_FILE, 'utf8'));
  // palette_as_array: 64 hex strings like "#585858"
  return data.palette_as_array.map(hex => {
    const r = parseInt(hex.slice(1, 3), 16);
    const g = parseInt(hex.slice(3, 5), 16);
    const b = parseInt(hex.slice(5, 7), 16);
    return [r, g, b];
  });
}

// ---------------------------------------------------------------------------
// Run Mesen2 and collect stdout DATA_* lines
// ---------------------------------------------------------------------------

function runMesen(rom, luaScript) {
  return new Promise((resolve, reject) => {
    console.log(`Running: ${MESEN} --testrunner "${rom}" "${luaScript}"`);

    const proc = spawn(MESEN, ['--testrunner', rom, luaScript]);
    const lines = [];
    let stdout = '';
    let stderr = '';

    proc.stdout.on('data', chunk => {
      stdout += chunk.toString('binary');
      // Extract complete lines
      const newlines = stdout.split('\n');
      // All but the last element are complete lines
      for (let i = 0; i < newlines.length - 1; i++) {
        const line = newlines[i].trim();
        if (line.startsWith('DATA_')) {
          lines.push(line);
          const key = line.split(':')[0];
          if (key !== 'DATA_PNG' && key !== 'DATA_CHR') {
            console.log('  ' + line.slice(0, 80) + (line.length > 80 ? '...' : ''));
          } else {
            console.log(`  ${key}: (${(line.length - key.length - 1) / 2} bytes)`);
          }
        }
      }
      stdout = newlines[newlines.length - 1]; // remainder
    });

    proc.stderr.on('data', chunk => {
      const text = chunk.toString();
      stderr += text;
      // Filter out the noisy uninitialized memory read warnings
      const filtered = text.split('\n')
        .filter(l => !l.includes('Uninitialized memory read'))
        .join('\n').trim();
      if (filtered) process.stderr.write(filtered + '\n');
    });

    proc.on('close', code => {
      // Process any remaining stdout
      if (stdout.trim().startsWith('DATA_')) lines.push(stdout.trim());
      console.log(`Mesen exit code: ${code}`);
      resolve({ lines, exitCode: code });
    });

    proc.on('error', reject);

    // Timeout safety: 60 seconds
    setTimeout(() => {
      proc.kill();
      reject(new Error('Mesen timed out after 60s'));
    }, 60000);
  });
}

// ---------------------------------------------------------------------------
// Parse DATA_* lines from Lua stdout
// ---------------------------------------------------------------------------

function parseOutput(lines) {
  const data = {};
  for (const line of lines) {
    const colon = line.indexOf(':');
    if (colon === -1) continue;
    const key = line.slice(0, colon);
    const val = line.slice(colon + 1);
    data[key] = val;
  }
  return data;
}

function hexToBytes(hex) {
  const bytes = new Uint8Array(hex.length / 2);
  for (let i = 0; i < bytes.length; i++) {
    bytes[i] = parseInt(hex.slice(i * 2, i * 2 + 2), 16);
  }
  return bytes;
}

// ---------------------------------------------------------------------------
// NES background + sprite renderer
//
// Background rendering:
//   - Nametable: 32×30 tile indices at PPU $2000-$23BF
//   - Attribute table: 64 bytes at $23C0-$23FF
//     Each byte covers a 4×4 tile (32×32 pixel) block.
//     Bits [1:0] = palette for top-left 2×2, [3:2] = top-right, etc.
//   - CHR pattern table base is game-specific (PPUCTRL bit 4):
//       SMB1: BG = $1000 (bank 1), Sprites = $0000 (bank 0)
//       Most games: BG = $0000 (bank 0), Sprites = $1000 (bank 1)
//   - Each tile = 16 bytes: 8 bytes plane0 + 8 bytes plane1
//     Pixel color index = (plane1_bit << 1) | plane0_bit (0-3)
//     Color 0 = transparent (use universal background color)
//
// Sprite rendering:
//   - OAM: 64 sprites, each 4 bytes [Y-1, tile, attrs, X]
//   - Sprite palette: PPU $3F10-$3F1F (bytes 16-31 of paletteRam)
//   - Attr bits [1:0] = palette (0-3), bit 5 = priority, bits 6-7 = flip
// ---------------------------------------------------------------------------

// SMB1 uses PPUCTRL=$90: BG pattern table at $1000, sprite pattern table at $0000.
// TODO: read DATA_PPUCTRL from extraction to detect automatically.
const BG_PATTERN_TABLE    = 0x1000; // CHR byte offset for background tiles
const SPRITE_PATTERN_TABLE = 0x0000; // CHR byte offset for sprite tiles

function renderNESScreen(palette, nametable, oam, chr, nesPalette) {
  const W = 256, H = 240;
  // RGBA pixel buffer
  const pixels = new Uint8Array(W * H * 4);

  function setPixel(x, y, r, g, b) {
    const off = (y * W + x) * 4;
    pixels[off]     = r;
    pixels[off + 1] = g;
    pixels[off + 2] = b;
    pixels[off + 3] = 255;
  }

  // palette[0] = universal background color index
  const [bgR, bgG, bgB] = nesPalette[palette[0] & 0x3F];
  // Fill with universal background color
  for (let i = 0; i < W * H; i++) {
    pixels[i * 4]     = bgR;
    pixels[i * 4 + 1] = bgG;
    pixels[i * 4 + 2] = bgB;
    pixels[i * 4 + 3] = 255;
  }

  // --- Background ---
  for (let ty = 0; ty < 30; ty++) {
    for (let tx = 0; tx < 32; tx++) {
      const tileIdx = nametable[ty * 32 + tx];

      // Attribute byte: each byte covers a 4×4 tile block
      const attrByteIdx = Math.floor(ty / 4) * 8 + Math.floor(tx / 4);
      const attrByte = nametable[960 + attrByteIdx];
      // Which 2×2 sub-block within the 4×4?
      const subX = Math.floor(tx / 2) % 2; // 0=left, 1=right
      const subY = Math.floor(ty / 2) % 2; // 0=top,  1=bottom
      const paletteNum = (attrByte >> ((subY * 2 + subX) * 2)) & 3;

      // CHR tile data: BG pattern table (SMB1: bank 1 at $1000)
      const chrBase = BG_PATTERN_TABLE + tileIdx * 16;

      for (let py = 0; py < 8; py++) {
        const plane0 = chr[chrBase + py];
        const plane1 = chr[chrBase + py + 8];
        for (let px = 0; px < 8; px++) {
          const bit = 7 - px;
          const lo = (plane0 >> bit) & 1;
          const hi = (plane1 >> bit) & 1;
          const colorIdx = (hi << 1) | lo;
          if (colorIdx === 0) continue; // transparent: universal bg already set

          const nesIdx = palette[paletteNum * 4 + colorIdx] & 0x3F;
          const [r, g, b] = nesPalette[nesIdx];
          setPixel(tx * 8 + px, ty * 8 + py, r, g, b);
        }
      }
    }
  }

  // --- Sprites (drawn back-to-front, sprite 0 on top) ---
  // Priority 1 = behind background, Priority 0 = in front.
  // Render behind-bg sprites first, then front sprites.
  for (const priorityPass of [1, 0]) {
    for (let i = 63; i >= 0; i--) {
      const sprY    = oam[i * 4]     + 1; // Y stored as Y-1
      const sprTile = oam[i * 4 + 1];
      const sprAttr = oam[i * 4 + 2];
      const sprX    = oam[i * 4 + 3];

      const priority = (sprAttr >> 5) & 1;
      if (priority !== priorityPass) continue;

      const palNum  = sprAttr & 3;
      const flipH   = (sprAttr >> 6) & 1;
      const flipV   = (sprAttr >> 7) & 1;

      if (sprY >= 240) continue; // off-screen

      // Sprite tiles: sprite pattern table (SMB1: bank 0 at $0000)
      const chrBase = SPRITE_PATTERN_TABLE + sprTile * 16;

      for (let py = 0; py < 8; py++) {
        const srcPy = flipV ? 7 - py : py;
        const plane0 = chr[chrBase + srcPy];
        const plane1 = chr[chrBase + srcPy + 8];

        for (let px = 0; px < 8; px++) {
          const srcPx = flipH ? 7 - px : px;
          const bit = 7 - srcPx;
          const lo = (plane0 >> bit) & 1;
          const hi = (plane1 >> bit) & 1;
          const colorIdx = (hi << 1) | lo;
          if (colorIdx === 0) continue; // sprite transparent

          const screenX = sprX + px;
          const screenY = sprY + py;
          if (screenX < 0 || screenX >= W || screenY < 0 || screenY >= H) continue;

          // Sprite palette: PPU $3F10-$3F1F = bytes 16-31 of paletteRam
          const nesIdx = palette[16 + palNum * 4 + colorIdx] & 0x3F;
          const [r, g, b] = nesPalette[nesIdx];
          setPixel(screenX, screenY, r, g, b);
        }
      }
    }
  }

  return pixels;
}

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------

async function main() {
  console.log('=== NES Screen Extractor + Renderer ===');
  console.log(`ROM:    ${ROM}`);
  console.log(`Output: ${OUT_DIR}`);
  console.log('');

  if (!existsSync(ROM)) {
    console.error(`ROM not found: ${ROM}`);
    process.exit(1);
  }

  mkdirSync(OUT_DIR, { recursive: true });

  // Run Mesen2
  const { lines, exitCode } = await runMesen(ROM, LUA_SCRIPT);
  if (exitCode !== 0) {
    console.error(`Mesen exited with code ${exitCode}`);
    process.exit(1);
  }

  const raw = parseOutput(lines);

  if (!raw.DATA_DONE) {
    console.error('No DATA_DONE received — extraction incomplete');
    process.exit(1);
  }

  // Decode hex data
  const palette   = hexToBytes(raw.DATA_PALETTE);   // 32 bytes
  const nametable = hexToBytes(raw.DATA_NAMETABLE); // 1024 bytes
  const oam       = hexToBytes(raw.DATA_OAM);       // 256 bytes
  const chr       = hexToBytes(raw.DATA_CHR);       // 8192 bytes

  console.log(`\nDecoded: palette=${palette.length}B nametable=${nametable.length}B oam=${oam.length}B chr=${chr.length}B`);

  // Save raw JSON files for inspection
  writeFileSync(join(OUT_DIR, 'palette.json'), JSON.stringify(Array.from(palette)));
  writeFileSync(join(OUT_DIR, 'nametable.json'), JSON.stringify({
    tiles: Array.from(nametable.slice(0, 960)),
    attributes: Array.from(nametable.slice(960)),
  }));
  writeFileSync(join(OUT_DIR, 'oam.json'), JSON.stringify(
    Array.from({ length: 64 }, (_, i) => ({
      y: oam[i * 4],
      tile: oam[i * 4 + 1],
      attributes: oam[i * 4 + 2],
      x: oam[i * 4 + 3],
    }))
  ));
  writeFileSync(join(OUT_DIR, 'chr.json'), JSON.stringify(Array.from(chr)));

  // Save Mesen's rendered screenshot as reference
  if (raw.DATA_PNG) {
    const pngBytes = hexToBytes(raw.DATA_PNG);
    writeFileSync(join(OUT_DIR, 'mesen-reference.png'), Buffer.from(pngBytes));
    console.log(`Saved mesen-reference.png (${pngBytes.length} bytes)`);
  }

  // Load NES master palette and render our own screen
  const nesPalette = loadNesPalette();
  console.log('Rendering NES screen from PPU data...');

  const pixels = renderNESScreen(palette, nametable, oam, chr, nesPalette);

  // Write PNG via sharp
  const screenPath = join(OUT_DIR, 'screen.png');
  await sharp(Buffer.from(pixels), {
    raw: { width: 256, height: 240, channels: 4 },
  })
    .png()
    .toFile(screenPath);

  console.log(`Saved screen.png (256×240)`);
  console.log(`\nAll files written to: ${OUT_DIR}`);
  console.log('  mesen-reference.png  — Mesen2 rendered screenshot');
  console.log('  screen.png           — Our NES renderer output');
  console.log('  palette.json, nametable.json, oam.json, chr.json');
}

main().catch(err => {
  console.error(err);
  process.exit(1);
});
