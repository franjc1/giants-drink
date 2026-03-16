// smb-chr-render.js
// 1. Parse iNES header, extract full 8KB CHR-ROM (512 tiles)
// 2. Boot jsnes to gameplay, read PPUCTRL, OAM, and palette values
// 3. Render PT0 (sprites, tiles 0-255) with sprite palette 0 → smb-pt0-sprites.png
// 4. Render PT1 (BG, tiles 256-511) with BG palette 0 → smb-pt1-bg.png

import { NES, Controller } from "jsnes";
import fs from "fs";
import path from "path";
import os from "os";
import sharp from "sharp";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROM_PATH = path.join(os.homedir(), "nes-roms", "Super Mario Bros. (World).nes");
const OUTPUT_DIR = path.join(__dirname, "..", "experiment-output");

// NES master palette: 64 RGB entries
const NES_PAL = [
  [84,84,84],    [0,30,116],    [8,16,144],    [48,0,136],
  [68,0,100],    [92,0,48],     [84,4,0],      [60,24,0],
  [32,42,0],     [8,58,0],      [0,64,0],      [0,60,0],
  [0,50,60],     [0,0,0],       [0,0,0],       [0,0,0],
  [152,150,152], [8,76,196],    [48,50,236],   [92,30,228],
  [136,20,176],  [160,20,100],  [152,34,32],   [120,60,0],
  [84,90,0],     [40,114,0],    [8,124,0],     [0,118,40],
  [0,102,120],   [0,0,0],       [0,0,0],       [0,0,0],
  [236,238,236], [76,154,236],  [120,124,236], [176,98,236],
  [228,84,236],  [236,88,180],  [236,106,100], [212,136,32],
  [160,170,0],   [116,196,0],   [76,208,32],   [56,204,108],
  [56,180,204],  [60,60,60],    [0,0,0],       [0,0,0],
  [236,238,236], [168,204,236], [188,188,236], [212,178,236],
  [236,174,236], [236,174,212], [236,180,176], [228,196,144],
  [204,210,120], [180,222,120], [168,226,144], [152,226,180],
  [160,214,228], [160,162,160], [0,0,0],       [0,0,0],
];

// ── Step 1: Parse iNES header + extract CHR-ROM ───────────────────────────────
const rom = fs.readFileSync(ROM_PATH);
const magic = rom.slice(0,4).toString("ascii");
if (magic !== "NES\x1a") throw new Error(`Bad iNES magic: ${JSON.stringify(magic)}`);

const prgBanks = rom[4];
const chrBanks = rom[5];
const chrStart = 16 + prgBanks * 16384;
const chrData  = rom.slice(chrStart, chrStart + chrBanks * 8192);

console.log("=== iNES Header ===");
console.log(`  PRG: ${prgBanks} banks = ${prgBanks*16384} bytes`);
console.log(`  CHR: ${chrBanks} banks = ${chrBanks*8192} bytes`);
console.log(`  CHR offset in ROM: ${chrStart} (0x${chrStart.toString(16)})`);
console.log(`  Total tiles: ${chrData.length/16}`);
console.log(`  PT0 $0000-$0FFF: tiles 0-255  (sprites in SMB — PPUCTRL bit3=0)`);
console.log(`  PT1 $1000-$1FFF: tiles 256-511 (BG in SMB — PPUCTRL bit4=1)`);

// ── Step 2: Boot jsnes to gameplay ────────────────────────────────────────────
console.log("\n=== jsnes Boot ===");
const nes = new NES({
  onFrame: () => {},
  onAudioSample: null,
  onStatusUpdate: () => {},
  emulateSound: false,
});
nes.loadROM(rom.toString("binary"));
console.log("  ROM loaded");

// Press Start at frame 0
nes.buttonDown(1, Controller.BUTTON_START);
nes.frame();
nes.buttonUp(1, Controller.BUTTON_START);
console.log("  Start pressed @ frame 0");

// Run idle to frame 120
for (let i = 0; i < 119; i++) nes.frame();

// Press Start at frame 120 (title → game select or direct start)
nes.buttonDown(1, Controller.BUTTON_START);
nes.frame();
nes.buttonUp(1, Controller.BUTTON_START);
console.log("  Start pressed @ frame 120");

// Run 200 frames with Right held (get Mario moving)
nes.buttonDown(1, Controller.BUTTON_RIGHT);
for (let i = 0; i < 200; i++) nes.frame();
nes.buttonUp(1, Controller.BUTTON_RIGHT);
console.log("  Right held for 200 frames");
console.log("  Total elapsed: ~321 frames");

// ── Step 3: Read PPUCTRL (control1 register) ──────────────────────────────────
// jsnes stores the last $2000 write in ppu.control1
const ctrl1 = nes.ppu.control1 ?? 0;
const spTable = (ctrl1 >> 3) & 1;   // bit 3: sprite PT (0=$0000, 1=$1000)
const bgTable = (ctrl1 >> 4) & 1;   // bit 4: BG PT (0=$0000, 1=$1000)
const largeSprites = (ctrl1 >> 5) & 1; // bit 5: sprite size (0=8x8, 1=8x16)

console.log("\n=== PPUCTRL ($2000) ===");
console.log(`  Raw value:       $${ctrl1.toString(16).padStart(2,"0")} (${ctrl1.toString(2).padStart(8,"0")}b)`);
console.log(`  Sprite PT:       ${spTable} → $${spTable?"1000":"0000"}-$${spTable?"1FFF":"0FFF"}`);
console.log(`  BG PT:           ${bgTable} → $${bgTable?"1000":"0000"}-$${bgTable?"1FFF":"0FFF"}`);
console.log(`  Sprite size:     ${largeSprites?"8×16":"8×8"}`);

// ── Step 4: Read sprite palettes from PPU VRAM $3F10-$3F1F ────────────────────
console.log("\n=== Sprite Palettes ($3F10-$3F1F) ===");
const sprPalettes = [];
for (let p = 0; p < 4; p++) {
  const pal = [];
  for (let c = 0; c < 4; c++) {
    const idx = nes.ppu.vramMem[0x3F10 + p*4 + c] & 0x3F;
    pal.push(idx);
  }
  sprPalettes.push(pal);
  const rgbs = pal.map(idx => {
    const rgb = NES_PAL[idx] ?? [0,0,0];
    return `$${idx.toString(16).padStart(2,"0")}=rgb(${rgb})`;
  });
  console.log(`  SPR pal ${p}: [${rgbs.join("  ")}]`);
}

// BG palettes $3F00-$3F0F
console.log("\n=== BG Palettes ($3F00-$3F0F) ===");
const bgPalettes = [];
for (let p = 0; p < 4; p++) {
  const pal = [];
  for (let c = 0; c < 4; c++) {
    // $3F00 is universal BG color, shared as CI0 for all BG palettes
    const addr = p === 0 && c === 0 ? 0x3F00 : (0x3F00 + p*4 + c);
    const idx = nes.ppu.vramMem[addr] & 0x3F;
    pal.push(idx);
  }
  bgPalettes.push(pal);
  const rgbs = pal.map(idx => {
    const rgb = NES_PAL[idx] ?? [0,0,0];
    return `$${idx.toString(16).padStart(2,"0")}=rgb(${rgb})`;
  });
  console.log(`  BG  pal ${p}: [${rgbs.join("  ")}]`);
}

// Print raw hex dump
console.log("\n  Raw palette dump ($3F00-$3F1F):");
const rawPal = [];
for (let i = 0; i < 32; i++) rawPal.push(nes.ppu.vramMem[0x3F00+i].toString(16).padStart(2,"0"));
console.log(`  BG:  ${rawPal.slice(0,16).join(" ")}`);
console.log(`  SPR: ${rawPal.slice(16,32).join(" ")}`);

// ── Step 5: Read OAM (64 sprites × 4 bytes) ───────────────────────────────────
console.log("\n=== OAM (nes.ppu.spriteMem) ===");
const activeSprites = [];
for (let i = 0; i < 64; i++) {
  const base = i * 4;
  const y    = nes.ppu.spriteMem[base];
  const tile = nes.ppu.spriteMem[base + 1];
  const attr = nes.ppu.spriteMem[base + 2];
  const x    = nes.ppu.spriteMem[base + 3];
  if (y < 0xEF) {
    const pal   = attr & 3;
    const hFlip = (attr >> 6) & 1;
    const vFlip = (attr >> 7) & 1;
    const prio  = (attr >> 5) & 1;
    activeSprites.push({ slot: i, x, y: y+1, tile, attr, pal, hFlip, vFlip, prio });
  }
}
console.log(`  Active sprites: ${activeSprites.length} / 64`);
for (const s of activeSprites) {
  const tileHex = "$"+s.tile.toString(16).padStart(2,"0");
  console.log(`  Slot ${String(s.slot).padStart(2)}: tile=${tileHex}  pos=(${String(s.x).padStart(3)},${String(s.y).padStart(3)})  pal=${s.pal}  hFlip=${s.hFlip}  vFlip=${s.vFlip}  prio=${s.prio}`);
}
const uniqueTileIdxs = [...new Set(activeSprites.map(s => s.tile))].sort((a,b)=>a-b);
console.log(`\n  Unique tile indices (${uniqueTileIdxs.length}): [${uniqueTileIdxs.map(t=>"$"+t.toString(16).padStart(2,"0")).join(", ")}]`);

// ── Step 6: Render pattern tables as colored PNGs ─────────────────────────────
function renderPatternTable(startTile, count, palIndices) {
  const COLS  = 16;
  const ROWS  = Math.ceil(count / COLS);
  const SCALE = 4;
  const imgW  = COLS * 8 * SCALE;
  const imgH  = ROWS * 8 * SCALE;
  const buf   = Buffer.alloc(imgW * imgH * 4, 0);

  // Fill background with palette CI0 color
  const bgRGB = NES_PAL[palIndices[0] & 0x3F] ?? [0,0,0];
  for (let i = 0; i < imgW * imgH; i++) {
    buf[i*4] = bgRGB[0]; buf[i*4+1] = bgRGB[1]; buf[i*4+2] = bgRGB[2]; buf[i*4+3] = 255;
  }

  for (let t = 0; t < count; t++) {
    const tileIdx = startTile + t;
    const col     = t % COLS;
    const row     = Math.floor(t / COLS);
    const base    = tileIdx * 16;

    for (let y = 0; y < 8; y++) {
      const b0 = chrData[base + y];
      const b1 = chrData[base + 8 + y];
      for (let x = 0; x < 8; x++) {
        const ci   = (((b1>>(7-x))&1)<<1) | ((b0>>(7-x))&1);
        const nesIdx = palIndices[ci] & 0x3F;
        const rgb  = NES_PAL[nesIdx] ?? [0,0,0];
        const ox   = (col * 8 + x) * SCALE;
        const oy   = (row * 8 + y) * SCALE;
        for (let sy = 0; sy < SCALE; sy++) {
          for (let sx = 0; sx < SCALE; sx++) {
            const off = ((oy+sy)*imgW + (ox+sx)) * 4;
            buf[off] = rgb[0]; buf[off+1] = rgb[1]; buf[off+2] = rgb[2]; buf[off+3] = 255;
          }
        }
      }
    }
  }
  return { buf, width: imgW, height: imgH };
}

fs.mkdirSync(OUTPUT_DIR, { recursive: true });

// PT0: sprites (tiles 0-255) with sprite palette 0
console.log("\n=== Rendering ===");
const { buf: pt0buf, width: pt0W, height: pt0H } = renderPatternTable(0, 256, sprPalettes[0]);
const pt0Path = path.join(OUTPUT_DIR, "smb-pt0-sprites.png");
await sharp(pt0buf, { raw: { width: pt0W, height: pt0H, channels: 4 } }).png().toFile(pt0Path);
console.log(`  Saved: smb-pt0-sprites.png (${pt0W}×${pt0H}) — sprite PT with sprite palette 0`);

// PT1: BG tiles (tiles 256-511) with BG palette 0
const { buf: pt1buf, width: pt1W, height: pt1H } = renderPatternTable(256, 256, bgPalettes[0]);
const pt1Path = path.join(OUTPUT_DIR, "smb-pt1-bg.png");
await sharp(pt1buf, { raw: { width: pt1W, height: pt1H, channels: 4 } }).png().toFile(pt1Path);
console.log(`  Saved: smb-pt1-bg.png (${pt1W}×${pt1H}) — BG PT with BG palette 0`);

console.log("\n=== Done ===");
