import fs from 'fs';
import path from 'path';
import os from 'os';
import { fileURLToPath } from 'url';
import sharp from 'sharp';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

// Step 1: Find ROM
const romsDir = path.join(os.homedir(), 'nes-roms');
const romFile = fs.readdirSync(romsDir).find(f =>
  f.includes('Super Mario Bros') && !f.includes('2') && !f.includes('3') && f.endsWith('.nes')
);
console.log('ROM:', romFile);
const rom = fs.readFileSync(path.join(romsDir, romFile));

// Step 2: CHR-ROM (sprite table = first 4KB, tiles 0-255)
const chrData = rom.slice(32784, 32784 + 4096);

// Step 3: Decode 8x8 tile → 64 pixel values (0-3)
function decodeTile(idx) {
  const base = idx * 16;
  const px = [];
  for (let y = 0; y < 8; y++) {
    const b0 = chrData[base + y], b1 = chrData[base + 8 + y];
    for (let x = 0; x < 8; x++)
      px.push(((b1 >> (7 - x)) & 1) << 1 | ((b0 >> (7 - x)) & 1));
  }
  return px;
}

// Step 4: Canvas (light gray background)
const W = 512, H = 256;
const BG = [180, 180, 180, 255];
const buf = Buffer.alloc(W * H * 4);
for (let i = 0; i < W * H; i++) { buf[i*4]=BG[0]; buf[i*4+1]=BG[1]; buf[i*4+2]=BG[2]; buf[i*4+3]=255; }

function setPixel(x, y, r, g, b, a) {
  if (x < 0 || x >= W || y < 0 || y >= H || a === 0) return;
  const i = (y * W + x) * 4;
  buf[i]=r; buf[i+1]=g; buf[i+2]=b; buf[i+3]=a;
}

// Mario palette:  0=transparent, 1=dark-red, 2=skin, 3=white
const MARIO = [[0,0,0,0],[180,48,40,255],[228,148,88,255],[252,252,252,255]];
// Enemy palette: 0=transparent, 1=black, 2=orange, 3=white
const ENEMY = [[0,0,0,0],[40,40,40,255],[228,92,16,255],[252,252,252,255]];

function drawTile(idx, dx, dy, pal) {
  decodeTile(idx).forEach((v, i) => {
    const [r,g,b,a] = pal[v];
    setPixel(dx + (i%8), dy + Math.floor(i/8), r, g, b, a);
  });
}

// Draw a 16×16 character from 4 tiles (2×2 grid)
// tL=top-left, tR=top-right, bL=bot-left, bR=bot-right
function draw16x16(tL, tR, bL, bR, dx, dy, pal) {
  drawTile(tL, dx,   dy,   pal);
  drawTile(tR, dx+8, dy,   pal);
  drawTile(bL, dx,   dy+8, pal);
  drawTile(bR, dx+8, dy+8, pal);
}

const GAP = 6;

// ── Row 0 y=8: Small Mario (4 animation poses confirmed from live OAM)
// Pose 1 stand: tL=0x32 tR=0x33 bL=0x34 bR=0x35
// Pose 2 walk:  tL=0x36 tR=0x33 bL=0x38 bR=0x39
// Pose 3 walk:  tL=0x32 tR=0x33 bL=0x3B bR=0x3C
// Pose 4 jump:  tL=0x36 tR=0x33 bL=0x38 bR=0x39 (placeholder)
const marioY = 8;
[
  [0x32,0x33,0x34,0x35],
  [0x36,0x33,0x38,0x39],
  [0x32,0x33,0x3B,0x3C],
].forEach(([tL,tR,bL,bR], i) => {
  draw16x16(tL, tR, bL, bR, 8 + i*(16+GAP), marioY, MARIO);
});

// ── Row 1 y=40: Goomba
// 0x71=top-left, 0x70=top-right (confirmed from ASCII art mirror shapes)
// 0x73=bot-left, 0x72=bot-right
const goombaY = 40;
draw16x16(0x71, 0x70, 0x73, 0x72, 8, goombaY, ENEMY);

// ── Row 2 y=72: Koopa
// 0x77=top-left, 0x76=top-right, 0x79=bot-left, 0x78=bot-right
const koopaY = 72;
draw16x16(0x77, 0x76, 0x79, 0x78, 8, koopaY, ENEMY);

// Step 5: Upscale 4× nearest-neighbor → save
const outPath = path.join(__dirname, '../experiment-output/smb-composed.png');
fs.mkdirSync(path.dirname(outPath), { recursive: true });

await sharp(buf, { raw: { width: W, height: H, channels: 4 } })
  .resize(W*4, H*4, { kernel: 'nearest' })
  .png()
  .toFile(outPath);

console.log(`Saved: ${outPath}  (${W*4}×${H*4})`);
