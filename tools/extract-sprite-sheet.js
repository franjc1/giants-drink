import fs from 'fs';
import path from 'path';
import sharp from 'sharp';

// ─── 1. Find the ROM ────────────────────────────────────────────────────────

const ROM_PATH = path.join(process.env.HOME, 'nes-roms', 'Super Mario Bros. (World).nes');
if (!fs.existsSync(ROM_PATH)) {
  console.error('ROM not found at:', ROM_PATH);
  process.exit(1);
}
console.log('ROM found:', ROM_PATH);

// ─── 2. Parse iNES header ───────────────────────────────────────────────────

const rom = fs.readFileSync(ROM_PATH);

// Verify magic bytes: "NES\x1A"
if (rom[0] !== 0x4E || rom[1] !== 0x45 || rom[2] !== 0x53 || rom[3] !== 0x1A) {
  console.error('Not a valid iNES ROM (bad magic bytes)');
  process.exit(1);
}

const prgRomCount = rom[4];  // in 16KB units
const chrRomCount = rom[5];  // in 8KB units

const prgRomSize = prgRomCount * 16384;
const chrRomSize = chrRomCount * 8192;

console.log(`PRG-ROM: ${prgRomCount} × 16KB = ${prgRomSize / 1024}KB`);
console.log(`CHR-ROM: ${chrRomCount} × 8KB  = ${chrRomSize / 1024}KB`);

const chrRomOffset = 16 + prgRomSize;
const chrRom = rom.slice(chrRomOffset, chrRomOffset + chrRomSize);

// ─── 3. Decode all tiles ────────────────────────────────────────────────────

// Each tile is 16 bytes: 8 bytes low bitplane + 8 bytes high bitplane → 8×8 @ 2bpp
const TILE_BYTES = 16;
const totalTiles = chrRomSize / TILE_BYTES;  // should be 512

console.log(`Tiles extracted: ${totalTiles}`);

// Returns a Uint8Array of 64 values (0-3), row-major
function decodeTile(chrRom, tileIndex) {
  const base = tileIndex * TILE_BYTES;
  const pixels = new Uint8Array(64);
  for (let row = 0; row < 8; row++) {
    const lo = chrRom[base + row];
    const hi = chrRom[base + 8 + row];
    for (let col = 0; col < 8; col++) {
      const bit = 7 - col;  // MSB is leftmost pixel
      const low = (lo >> bit) & 1;
      const high = (hi >> bit) & 1;
      pixels[row * 8 + col] = (high << 1) | low;
    }
  }
  return pixels;
}

const allTiles = [];
for (let i = 0; i < totalTiles; i++) {
  allTiles.push(decodeTile(chrRom, i));
}

// ─── 4. Helpers ─────────────────────────────────────────────────────────────

// Grayscale: 0=black, 1=dark gray, 2=light gray, 3=white
const GRAY_PALETTE = [
  [0x00, 0x00, 0x00],    // 0 = black
  [0x55, 0x55, 0x55],    // 1 = dark gray
  [0xAA, 0xAA, 0xAA],    // 2 = light gray
  [0xFF, 0xFF, 0xFF],    // 3 = white
];

// SMB Mario palette (from the task spec)
const MARIO_PALETTE = [
  [0x80, 0x80, 0xFF],    // 0 = transparent → light blue background
  [0xB5, 0x31, 0x20],    // 1 = red
  [0x6B, 0x6D, 0x00],    // 2 = brown/dark olive
  [0xFF, 0xBF, 0x98],    // 3 = skin
];

// Render a grid of tiles into a flat RGB pixel buffer
// scale: NES pixel → N real pixels (square)
// Returns { buffer, width, height }
function renderTileGrid(tiles, cols, rows, scale, palette) {
  const tileSize = 8 * scale;
  const width  = cols * tileSize;
  const height = rows * tileSize;
  const buf = Buffer.alloc(width * height * 3, 0);

  for (let tRow = 0; tRow < rows; tRow++) {
    for (let tCol = 0; tCol < cols; tCol++) {
      const tIdx = tRow * cols + tCol;
      if (tIdx >= tiles.length) continue;
      const pixels = tiles[tIdx];

      for (let py = 0; py < 8; py++) {
        for (let px = 0; px < 8; px++) {
          const colorIdx = pixels[py * 8 + px];
          const [r, g, b] = palette[colorIdx];

          // Scale: each NES pixel → scale×scale real pixels
          for (let sy = 0; sy < scale; sy++) {
            for (let sx = 0; sx < scale; sx++) {
              const rx = tCol * tileSize + px * scale + sx;
              const ry = tRow * tileSize + py * scale + sy;
              const offset = (ry * width + rx) * 3;
              buf[offset]     = r;
              buf[offset + 1] = g;
              buf[offset + 2] = b;
            }
          }
        }
      }
    }
  }

  return { buffer: buf, width, height };
}

// Draw a 1px horizontal red line at y-pixel position `lineY` in an RGB buffer
function drawHorizontalLine(buf, width, lineY, height, color = [0xFF, 0, 0]) {
  const [r, g, b] = color;
  for (let x = 0; x < width; x++) {
    const offset = (lineY * width + x) * 3;
    buf[offset]     = r;
    buf[offset + 1] = g;
    buf[offset + 2] = b;
  }
}

// ─── 5. Ensure output directory ─────────────────────────────────────────────

const OUTPUT_DIR = path.join(process.cwd(), 'experiment-output');
fs.mkdirSync(OUTPUT_DIR, { recursive: true });

// ─── A. smb-chr-full.png — all 512 tiles, 16×32 grid, grayscale, 3× scale ──
// Red separator line between row 16 (BG tiles end) and row 17 (sprite tiles start)

{
  const COLS = 16, ROWS = 32, SCALE = 3;
  const { buffer, width, height } = renderTileGrid(allTiles, COLS, ROWS, SCALE, GRAY_PALETTE);

  // Row 16 ends at y = 16 * 8 * SCALE = 384. Draw line there (between row 16 and 17).
  const lineY = 16 * 8 * SCALE;  // = 384
  drawHorizontalLine(buffer, width, lineY, height);

  const outPath = path.join(OUTPUT_DIR, 'smb-chr-full.png');
  await sharp(buffer, { raw: { width, height, channels: 3 } })
    .png()
    .toFile(outPath);

  const stat = fs.statSync(outPath);
  console.log(`\nA) smb-chr-full.png`);
  console.log(`   Dimensions: ${width}×${height}px`);
  console.log(`   Path: ${outPath}`);
  console.log(`   Size: ${(stat.size / 1024).toFixed(1)}KB`);
}

// ─── B. smb-sprites-only.png — tiles 256-511, 16×16 grid, Mario palette, 3× ─

{
  const spriteTiles = allTiles.slice(256, 512);
  const COLS = 16, ROWS = 16, SCALE = 3;
  const { buffer, width, height } = renderTileGrid(spriteTiles, COLS, ROWS, SCALE, MARIO_PALETTE);

  const outPath = path.join(OUTPUT_DIR, 'smb-sprites-only.png');
  await sharp(buffer, { raw: { width, height, channels: 3 } })
    .png()
    .toFile(outPath);

  const stat = fs.statSync(outPath);
  console.log(`\nB) smb-sprites-only.png`);
  console.log(`   Dimensions: ${width}×${height}px`);
  console.log(`   Path: ${outPath}`);
  console.log(`   Size: ${(stat.size / 1024).toFixed(1)}KB`);
}

// ─── C. smb-sprites-only-gray.png — same tiles, grayscale ──────────────────

{
  const spriteTiles = allTiles.slice(256, 512);
  const COLS = 16, ROWS = 16, SCALE = 3;
  const { buffer, width, height } = renderTileGrid(spriteTiles, COLS, ROWS, SCALE, GRAY_PALETTE);

  const outPath = path.join(OUTPUT_DIR, 'smb-sprites-only-gray.png');
  await sharp(buffer, { raw: { width, height, channels: 3 } })
    .png()
    .toFile(outPath);

  const stat = fs.statSync(outPath);
  console.log(`\nC) smb-sprites-only-gray.png`);
  console.log(`   Dimensions: ${width}×${height}px`);
  console.log(`   Path: ${outPath}`);
  console.log(`   Size: ${(stat.size / 1024).toFixed(1)}KB`);
}

console.log('\nDone.');
