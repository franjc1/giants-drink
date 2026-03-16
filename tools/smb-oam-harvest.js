// smb-oam-harvest.js
// Comprehensive OAM data capture across 2000+ frames + multiple level states.
// Goal: discover ALL sprite tile assemblies in SMB1.
//
// Output: experiment-output/smb-all-sprites.png
//         (every unique sprite assembly at 4× scale, magenta background)

import { NES, Controller } from "jsnes";
import fs from "fs";
import path from "path";
import os from "os";
import sharp from "sharp";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROM_PATH  = path.join(os.homedir(), "nes-roms", "Super Mario Bros. (World).nes");
const OUT_DIR   = path.join(__dirname, "..", "experiment-output");

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

// ── ROM + CHR ─────────────────────────────────────────────────────────────────
const romBuf    = fs.readFileSync(ROM_PATH);
const prgBanks  = romBuf[4];
const chrStart  = 16 + prgBanks * 16384;
const chrData   = romBuf.slice(chrStart, chrStart + romBuf[5] * 8192);
const romBinary = romBuf.toString("binary");
console.log(`ROM: ${chrData.length / 16} CHR tiles (${chrData.length} bytes)`);

// ── Tile helpers ──────────────────────────────────────────────────────────────
function decodeTile(tileIdx) {
  const base = tileIdx * 16;
  const px   = new Uint8Array(64);
  for (let y = 0; y < 8; y++) {
    const b0 = chrData[base + y], b1 = chrData[base + 8 + y];
    for (let x = 0; x < 8; x++)
      px[y * 8 + x] = (((b1 >> (7 - x)) & 1) << 1) | ((b0 >> (7 - x)) & 1);
  }
  return px;
}

function tileIsBlank(tileIdx) {
  const base = tileIdx * 16;
  for (let i = 0; i < 16; i++) if (chrData[base + i]) return false;
  return true;
}

// ── jsnes factory ─────────────────────────────────────────────────────────────
function makeNES() {
  const nes = new NES({
    onFrame: () => {},
    onAudioSample: null,
    onStatusUpdate: () => {},
    emulateSound: false,
  });
  nes.loadROM(romBinary);
  return nes;
}

// ── OAM reader ────────────────────────────────────────────────────────────────
function readOAM(nes) {
  const out = [];
  for (let i = 0; i < 64; i++) {
    const b    = i * 4;
    const rawY = nes.ppu.spriteMem[b];
    if (rawY >= 0xEF) continue;           // slot unused
    const tile = nes.ppu.spriteMem[b + 1];
    const attr = nes.ppu.spriteMem[b + 2];
    const x    = nes.ppu.spriteMem[b + 3];
    if (tileIsBlank(tile)) continue;       // skip zero-data tiles
    out.push({
      slot:  i,
      x,
      y:     rawY + 1,
      tile,
      attr,
      pal:   attr & 3,
      hFlip: (attr >> 6) & 1,
      vFlip: (attr >> 7) & 1,
    });
  }
  return out;
}

// ── Sprite palette reader (VRAM $3F10–$3F1F) ──────────────────────────────────
function readSprPalettes(nes) {
  const palettes = [];
  for (let p = 0; p < 4; p++) {
    const row = [];
    for (let c = 0; c < 4; c++)
      row.push(NES_PAL[(nes.ppu.vramMem[0x3F10 + p * 4 + c] ?? 0x0F) & 0x3F] ?? [0, 0, 0]);
    palettes.push(row);
  }
  return palettes;
}

// ── Spatial grouping: union-find on sprites within 16px in both axes ──────────
function groupSprites(sprites) {
  const n = sprites.length;
  if (n === 0) return [];
  const parent = Array.from({ length: n }, (_, i) => i);

  function find(i) {
    while (parent[i] !== i) { parent[i] = parent[parent[i]]; i = parent[i]; }
    return i;
  }

  for (let i = 0; i < n; i++)
    for (let j = i + 1; j < n; j++) {
      if (Math.abs(sprites[i].x - sprites[j].x) <= 16 &&
          Math.abs(sprites[i].y - sprites[j].y) <= 16) {
        const ri = find(i), rj = find(j);
        if (ri !== rj) parent[ri] = rj;
      }
    }

  const map = new Map();
  for (let i = 0; i < n; i++) {
    const r = find(i);
    if (!map.has(r)) map.set(r, []);
    map.get(r).push(sprites[i]);
  }
  return [...map.values()];
}

// ── Group signature: normalize positions, sort, stringify ─────────────────────
function groupSig(group) {
  const minX = Math.min(...group.map(s => s.x));
  const minY = Math.min(...group.map(s => s.y));
  const norm = group.map(s => ({
    dx:    s.x - minX,
    dy:    s.y - minY,
    tile:  s.tile,
    hFlip: s.hFlip,
    vFlip: s.vFlip,
  })).sort((a, b) => a.dy - b.dy || a.dx - b.dx || a.tile - b.tile);
  return JSON.stringify(norm);
}

// ── Accumulator ───────────────────────────────────────────────────────────────
// Map<sig, { sprites (normalized, with pal), count, lastPal }>
const seenGroups = new Map();
const seenTiles  = new Set();

function ingestFrame(sprites) {
  for (const s of sprites) seenTiles.add(s.tile);

  for (const g of groupSprites(sprites)) {
    const sig  = groupSig(g);
    const minX = Math.min(...g.map(s => s.x));
    const minY = Math.min(...g.map(s => s.y));

    if (seenGroups.has(sig)) {
      seenGroups.get(sig).count++;
    } else {
      const norm = g.map(s => ({
        dx:    s.x - minX,
        dy:    s.y - minY,
        tile:  s.tile,
        attr:  s.attr,
        pal:   s.pal,
        hFlip: s.hFlip,
        vFlip: s.vFlip,
      })).sort((a, b) => a.dy - b.dy || a.dx - b.dx || a.tile - b.tile);
      seenGroups.set(sig, { sprites: norm, count: 1 });
    }
  }
}

// ── Run helper: run N frames, optionally holding Right, ingesting OAM each frame
function runAndCapture(nes, frames, holdRight) {
  if (holdRight) nes.buttonDown(1, Controller.BUTTON_RIGHT);
  for (let f = 0; f < frames; f++) {
    nes.frame();
    ingestFrame(readOAM(nes));
  }
  if (holdRight) nes.buttonUp(1, Controller.BUTTON_RIGHT);
}

// ── PHASE 1: Boot to gameplay ─────────────────────────────────────────────────
console.log("\n── Phase 1: Boot ─────────────────────────────────────────────");
const nes = makeNES();

nes.buttonDown(1, Controller.BUTTON_START);
nes.frame();
nes.buttonUp(1, Controller.BUTTON_START);
for (let i = 0; i < 119; i++) nes.frame();
nes.buttonDown(1, Controller.BUTTON_START);
nes.frame();
nes.buttonUp(1, Controller.BUTTON_START);
console.log("  Start pressed at frames 0 and 120");

// ── PHASE 2: 2000 frames Right held ──────────────────────────────────────────
console.log("── Phase 2: 2000 frames with Right held ─────────────────────");
runAndCapture(nes, 2000, true);
console.log(`  Unique groups: ${seenGroups.size}  Unique tiles: ${seenTiles.size}`);

// Print OAM state at the end of phase 2
const oamAtEnd = readOAM(nes);
console.log(`  OAM at frame 2321: ${oamAtEnd.length} active sprites`);
for (const s of oamAtEnd)
  console.log(`    tile=$${s.tile.toString(16).padStart(2,"0")} pos=(${s.x},${s.y}) pal=${s.pal}`);

// ── PHASE 3: Save state and try different levels ──────────────────────────────
const savedState = nes.toJSON();
console.log("  State saved");

const levelTests = [
  { world: 0, level: 1, label: "world=0 level=1 (W1-2?)" },
  { world: 0, level: 2, label: "world=0 level=2 (W1-3?)" },
  { world: 0, level: 3, label: "world=0 level=3 (W1-4?)" },
  { world: 1, level: 0, label: "world=1 level=0 (W2-1?)" },
];

for (const { world, level, label } of levelTests) {
  console.log(`\n── Level switch: ${label} ────────────────────────────`);
  nes.fromJSON(savedState);

  const beforeWorld = nes.cpu.mem[0x075C];
  const beforeLevel = nes.cpu.mem[0x075F];
  nes.cpu.mem[0x075C] = world;
  nes.cpu.mem[0x075F] = level;
  console.log(`  RAM $075C: ${beforeWorld} → ${world},  $075F: ${beforeLevel} → ${level}`);

  // Run 120 frames to let level load
  for (let i = 0; i < 120; i++) nes.frame();

  const oamAfterLoad = readOAM(nes);
  console.log(`  OAM after 120 frames: ${oamAfterLoad.length} active sprites`);
  if (oamAfterLoad.length > 0)
    console.log(`    tiles: [${[...new Set(oamAfterLoad.map(s=>"$"+s.tile.toString(16).padStart(2,"0")))].join(", ")}]`);

  // 1000 frames with Right
  runAndCapture(nes, 1000, true);
  console.log(`  After 1000 frames: groups=${seenGroups.size}  tiles=${seenTiles.size}`);
}

// ── Read final sprite palettes for rendering ──────────────────────────────────
const sprPalettes = readSprPalettes(nes);
console.log("\n── Final sprite palettes ─────────────────────────────────────");
for (let p = 0; p < 4; p++) {
  const hex = Array.from({length:4}, (_,c) =>
    "$"+((nes.ppu.vramMem[0x3F10+p*4+c]??0)&0x3F).toString(16).padStart(2,"0")).join(" ");
  console.log(`  SPR pal ${p}: ${hex}`);
}

// ── Print full group summary ───────────────────────────────────────────────────
const sorted = [...seenGroups.values()].sort((a, b) => b.sprites.length - a.sprites.length || b.count - a.count);

console.log(`\n═══════════════════════════════════════════════════════════════`);
console.log(`TOTAL: ${seenTiles.size} unique tile indices, ${sorted.length} unique sprite assemblies`);
console.log(`═══════════════════════════════════════════════════════════════\n`);
console.log("All spatial groups (sorted by tile count, then frequency):");
for (const [i, g] of sorted.entries()) {
  const tileList = [...new Set(g.sprites.map(s => "$"+s.tile.toString(16).padStart(2,"0")))].join(",");
  const palList  = [...new Set(g.sprites.map(s => s.pal))].join(",");
  const w = (Math.max(...g.sprites.map(s => s.dx), 0)) + 8;
  const h = (Math.max(...g.sprites.map(s => s.dy), 0)) + 8;
  console.log(`  [${String(i).padStart(3)}] ${String(g.count).padStart(5)}× │ ${String(w).padStart(2)}×${String(h).padStart(2)}px │ pal=[${palList}] │ tiles:[${tileList}]`);
}

// ── Render: pack all groups onto a sheet ──────────────────────────────────────
console.log("\n── Rendering sprite sheet ────────────────────────────────────");

const SCALE   = 4;
const GUTTER  = 6;            // pixels between groups (pre-scale)
const MARGIN  = 8;            // sheet margin (pre-scale)
const ROW_MAX = 256;          // max pre-scale width per row

// Compute bounding box for each group
const groupSizes = sorted.map(g => ({
  w: Math.max(...g.sprites.map(s => s.dx), 0) + 8,
  h: Math.max(...g.sprites.map(s => s.dy), 0) + 8,
}));

// Pack groups into rows greedily
const rows = [];
let curRow = [], curW = MARGIN;
for (let i = 0; i < sorted.length; i++) {
  const { w, h } = groupSizes[i];
  if (curRow.length > 0 && curW + w + GUTTER > ROW_MAX) {
    rows.push(curRow);
    curRow = [];
    curW   = MARGIN;
  }
  curRow.push(i);
  curW += w + GUTTER;
}
if (curRow.length) rows.push(curRow);

// Calculate final image dimensions
const rowHeights = rows.map(row => Math.max(...row.map(i => groupSizes[i].h)));
const rowWidths  = rows.map(row =>
  MARGIN * 2 + row.reduce((s, i) => s + groupSizes[i].w + GUTTER, 0) - GUTTER
);
const sheetW = Math.max(...rowWidths, 64) * SCALE;
const sheetH = (MARGIN * 2 + rowHeights.reduce((s, h) => s + h + GUTTER, 0) - GUTTER) * SCALE;

// RGBA buffer, fill magenta
const buf = Buffer.alloc(sheetW * sheetH * 4);
for (let i = 0; i < sheetW * sheetH; i++) {
  buf[i*4]   = 255;   // R
  buf[i*4+1] = 0;     // G
  buf[i*4+2] = 255;   // B
  buf[i*4+3] = 255;
}

function setPixel(px, py, r, g, b) {
  if (px < 0 || px >= sheetW || py < 0 || py >= sheetH) return;
  const o = (py * sheetW + px) * 4;
  buf[o] = r; buf[o+1] = g; buf[o+2] = b; buf[o+3] = 255;
}

// Draw a tile at sheet pixel position (ox, oy) with palette and flip flags
function drawTile(tileIdx, ox, oy, pal, hFlip, vFlip) {
  const td = decodeTile(tileIdx);
  for (let y = 0; y < 8; y++) {
    const sy = vFlip ? 7 - y : y;
    for (let x = 0; x < 8; x++) {
      const sx = hFlip ? 7 - x : x;
      const ci = td[sy * 8 + sx];
      if (ci === 0) continue;   // transparent → leave magenta
      const [r, g, b] = pal[ci];
      for (let dy = 0; dy < SCALE; dy++)
        for (let dx = 0; dx < SCALE; dx++)
          setPixel(ox + x * SCALE + dx, oy + y * SCALE + dy, r, g, b);
    }
  }
}

// Render each group
let rowY = MARGIN;
for (let ri = 0; ri < rows.length; ri++) {
  const row     = rows[ri];
  const rowH    = rowHeights[ri];
  let   groupX  = MARGIN;

  for (const gi of row) {
    const g = sorted[gi];
    const dominantPal = (() => {
      const freq = [0, 0, 0, 0];
      for (const s of g.sprites) freq[s.pal]++;
      return freq.indexOf(Math.max(...freq));
    })();
    const pal = sprPalettes[dominantPal];

    for (const s of g.sprites) {
      const spritePal = sprPalettes[s.pal];
      const ox = (groupX + s.dx) * SCALE;
      const oy = (rowY   + s.dy) * SCALE;
      drawTile(s.tile, ox, oy, spritePal, s.hFlip === 1, s.vFlip === 1);
    }
    groupX += groupSizes[gi].w + GUTTER;
  }
  rowY += rowH + GUTTER;
}

// Save
fs.mkdirSync(OUT_DIR, { recursive: true });
const outPath = path.join(OUT_DIR, "smb-all-sprites.png");
await sharp(buf, { raw: { width: sheetW, height: sheetH, channels: 4 } })
  .png()
  .toFile(outPath);
console.log(`  Saved: smb-all-sprites.png (${sheetW}×${sheetH})`);

// ── Classification heuristic ──────────────────────────────────────────────────
console.log("\n── Classification ────────────────────────────────────────────");
console.log("(based on tile count, frequency, and known SMB tile ranges)");
for (const [i, g] of sorted.entries()) {
  const tileSet = [...new Set(g.sprites.map(s => s.tile))];
  const maxTile = Math.max(...tileSet);
  const minTile = Math.min(...tileSet);
  const ntiles  = g.sprites.length;

  let type = "?";
  // Known SMB tile ranges (sprite PT = $0000–$0FFF = tiles 0–255)
  // Mario body tiles: $32–$3F range confirmed from prior OAM capture
  // HUD/digit tiles: typically $F0–$FF
  if (tileSet.some(t => t >= 0x32 && t <= 0x45)) type = "MARIO";
  else if (tileSet.some(t => t >= 0x70 && t <= 0x7F)) type = "ENEMY (goomba/koopa range)";
  else if (tileSet.some(t => t >= 0xF0)) type = "HUD/digit";
  else if (ntiles === 1 && tileSet[0] >= 0x60 && tileSet[0] <= 0x6F) type = "ITEM/effect";
  else if (ntiles <= 2) type = "item or effect";
  else if (ntiles >= 4) type = "character/enemy";

  const tiles = tileSet.map(t => "$"+t.toString(16).padStart(2,"0")).join(",");
  console.log(`  [${String(i).padStart(3)}] ${type.padEnd(26)} tiles:[${tiles}]  count:${g.count}`);
}

console.log("\n=== Done ===");
