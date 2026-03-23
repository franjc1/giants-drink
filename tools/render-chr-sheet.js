// render-chr-sheet.js
// Extracts CHR-ROM from SMB ROM and renders all 512 tiles as a reference sheet.
// Output: experiment-output/smb-chr-reference-sheet.png
// Grid: 16 cols x 32 rows, each tile 8x8 upscaled 4x → 32x32, final 512x1024

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import sharp from 'sharp';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROM_PATH = path.join(process.env.HOME, 'nes-roms/Super Mario Bros. (World).nes');
const OUT_PATH = path.join(__dirname, '../experiment-output/smb-chr-reference-sheet.png');

// Grayscale palette: color index 0-3
const PALETTE = [0, 85, 170, 255];  // black, dark gray, light gray, white

const rom = fs.readFileSync(ROM_PATH);

// iNES header: bytes 0-15
// Byte 4: number of 16KB PRG-ROM banks
// Byte 5: number of 8KB CHR-ROM banks
const prgBanks = rom[4];
const chrBanks = rom[5];
console.log(`PRG banks: ${prgBanks} (${prgBanks * 16}KB), CHR banks: ${chrBanks} (${chrBanks * 8}KB)`);

const chrStart = 16 + prgBanks * 16384;
const chrData = rom.slice(chrStart, chrStart + chrBanks * 8192);
console.log(`CHR-ROM: ${chrData.length} bytes, ${chrData.length / 16} tiles`);

const TILES = chrData.length / 16;  // should be 512
const COLS = 16;
const ROWS = Math.ceil(TILES / COLS);  // 32
const SCALE = 4;
const TILE_PX = 8 * SCALE;  // 32
const IMG_W = COLS * TILE_PX;  // 512
const IMG_H = ROWS * TILE_PX;  // 1024

// RGBA buffer for final image
const pixels = Buffer.alloc(IMG_W * IMG_H * 4, 0);

for (let t = 0; t < TILES; t++) {
  const tileBase = t * 16;
  const col = t % COLS;
  const row = Math.floor(t / COLS);
  const originX = col * TILE_PX;
  const originY = row * TILE_PX;

  for (let y = 0; y < 8; y++) {
    const b0 = chrData[tileBase + y];        // bitplane 0
    const b1 = chrData[tileBase + 8 + y];   // bitplane 1
    for (let x = 0; x < 8; x++) {
      const bit0 = (b0 >> (7 - x)) & 1;
      const bit1 = (b1 >> (7 - x)) & 1;
      const colorIdx = (bit1 << 1) | bit0;
      const gray = PALETTE[colorIdx];

      // Upscale 4x (nearest-neighbor)
      for (let sy = 0; sy < SCALE; sy++) {
        for (let sx = 0; sx < SCALE; sx++) {
          const px = originX + x * SCALE + sx;
          const py = originY + y * SCALE + sy;
          const offset = (py * IMG_W + px) * 4;
          pixels[offset]     = gray;
          pixels[offset + 1] = gray;
          pixels[offset + 2] = gray;
          pixels[offset + 3] = 255;
        }
      }
    }
  }
}

fs.mkdirSync(path.dirname(OUT_PATH), { recursive: true });

await sharp(pixels, { raw: { width: IMG_W, height: IMG_H, channels: 4 } })
  .png()
  .toFile(OUT_PATH);

console.log(`Saved: ${OUT_PATH} (${IMG_W}x${IMG_H})`);
console.log(`Tiles 0-255: pattern table 0 ($0000, sprites in SMB)`);
console.log(`Tiles 256-511: pattern table 1 ($1000, BG in SMB)`);
