// smb-composer.js
// 1. Load 230 frames of OAM from jsnes-extractor output (SMB uses 8×8 sprites)
// 2. Group spatially within same palette, deduplicate by tile signature
// 3. Render sprite row PNG, save tile-map JSON
// 4. Send sprite row to FLUX Kontext, download result
// 5. Quantize FLUX output back to NES CHR tiles
// Output: experiment-output/smb-sprites-for-flux.png
//         experiment-output/smb-sprites-flux-out.png
//         experiment-output/smb-sprites-quantized.chr
//         experiment-output/smb-tile-map.json

import { fal } from "@fal-ai/client";
import fs from "fs";
import path from "path";
import os from "os";
import sharp from "sharp";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const EXTRACT_DIR = path.join(os.homedir(), "nes-extracted", "super-mario-bros-world");
const OUTPUT_DIR  = path.join(__dirname, "..", "experiment-output");

if (!process.env.FAL_KEY) { console.error("FAL_KEY not set"); process.exit(1); }
fal.config({ credentials: process.env.FAL_KEY });

// ── NES hardware palette (64 RGB entries) ─────────────────────────────────────
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

function colorDistSq(a, b) {
  return (a[0]-b[0])**2 + (a[1]-b[1])**2 + (a[2]-b[2])**2;
}
function nearestNesIdx(r, g, b) {
  let best = 0, bestD = Infinity;
  for (let i = 0; i < NES_PAL.length; i++) {
    const d = colorDistSq([r,g,b], NES_PAL[i]);
    if (d < bestD) { bestD = d; best = i; }
  }
  return best;
}

// ── Load CHR and palette from extraction ──────────────────────────────────────
const chrData = fs.readFileSync(path.join(EXTRACT_DIR, "state-0x0773-v0.chr.bin"));
console.log(`CHR: ${chrData.length} bytes (${chrData.length/16} tiles)`);

const stateData = JSON.parse(
  fs.readFileSync(path.join(EXTRACT_DIR, "states", "state-773-102.json"))
);
const palHex = stateData.palette;
const palBytes = [];
for (let i = 0; i < palHex.length; i += 2)
  palBytes.push(parseInt(palHex.slice(i, i+2), 16));

// Sprite palettes: bytes 16–31 of 32-byte palette dump
const sprPalettes = Array.from({length:4}, (_,p) =>
  Array.from({length:4}, (_,c) => NES_PAL[palBytes[16 + p*4 + c] & 0x3F] ?? [0,0,0])
);
console.log("Sprite palettes:");
sprPalettes.forEach((p,i) =>
  console.log(`  pal${i}: ${p.map(c=>`rgb(${c})`).join(" | ")}`)
);

// ── Tile decode / render helpers ──────────────────────────────────────────────
function decodeTile(idx) {
  const base = idx * 16, px = new Uint8Array(64);
  for (let r = 0; r < 8; r++) {
    const p0 = chrData[base+r], p1 = chrData[base+8+r];
    for (let c = 0; c < 8; c++)
      px[r*8+c] = (((p1>>(7-c))&1)<<1) | ((p0>>(7-c))&1);
  }
  return px;
}
function tileHasData(idx) {
  if (idx < 0 || idx*16+15 >= chrData.length) return false;
  const base = idx*16;
  for (let i = 0; i < 16; i++) if (chrData[base+i]) return true;
  return false;
}
function renderTile(idx, pixels, dx, dy, W, H, pal, hFlip, vFlip) {
  const tp = decodeTile(idx);
  for (let r = 0; r < 8; r++) {
    for (let c = 0; c < 8; c++) {
      const ci = tp[(vFlip?7-r:r)*8 + (hFlip?7-c:c)];
      if (ci === 0) continue;
      const [rv,gv,bv] = pal[ci];
      const px = dx+c, py = dy+r;
      if (px<0||px>=W||py<0||py>=H) continue;
      const o = (py*W+px)*4;
      pixels[o]=rv; pixels[o+1]=gv; pixels[o+2]=bv; pixels[o+3]=255;
    }
  }
}

// ── Load and decode all OAM frame files ───────────────────────────────────────
const oamFiles = fs.readdirSync(EXTRACT_DIR)
  .filter(f => f.endsWith(".oam-frames.json")).sort();
console.log(`\nLoading ${oamFiles.length} OAM files...`);

function decodeOAMHex(hex) {
  const out = [];
  for (let i = 0; i < hex.length; i += 8) {
    const ch = hex.slice(i, i+8);
    if (ch.length < 8) break;
    const oamY = parseInt(ch.slice(0,2),16);
    const tile  = parseInt(ch.slice(2,4),16);
    const attr  = parseInt(ch.slice(4,6),16);
    const oamX  = parseInt(ch.slice(6,8),16);
    if (oamY >= 0xEF) continue;
    if (!tileHasData(tile)) continue;
    out.push({ x:oamX, y:oamY+1, tile, pal:attr&3, hFlip:(attr>>6)&1, vFlip:(attr>>7)&1 });
  }
  return out;
}

const allFrames = [];
for (const f of oamFiles) {
  const entries = JSON.parse(fs.readFileSync(path.join(EXTRACT_DIR, f)));
  for (const e of entries) {
    const spr = decodeOAMHex(e.data);
    if (spr.length) allFrames.push(spr);
  }
}
console.log(`Total frames with sprites: ${allFrames.length}`);

// ── Spatial grouping: same-palette sprites within ~2px ────────────────────────
// FIX: require a.pal === b.pal so Koopa tiles never attach to Mario groups
const GROUP_PAD = 2;
function groupFrame(sprites) {
  const parent = sprites.map((_,i) => i);
  function find(i) { return parent[i]===i ? i : (parent[i]=find(parent[i])); }
  for (let i = 0; i < sprites.length; i++)
    for (let j = i+1; j < sprites.length; j++) {
      const a=sprites[i], b=sprites[j];
      if (a.pal !== b.pal) continue;                              // same palette only
      if (a.x < b.x+8+GROUP_PAD && a.x+8+GROUP_PAD > b.x &&
          a.y < b.y+8+GROUP_PAD && a.y+8+GROUP_PAD > b.y)
        parent[find(i)] = find(j);
    }
  const map = new Map();
  for (let i=0;i<sprites.length;i++) {
    const r=find(i); if(!map.has(r)) map.set(r,[]);
    map.get(r).push(sprites[i]);
  }
  return [...map.values()];
}

function groupSig(group) {
  const minX=Math.min(...group.map(s=>s.x)), minY=Math.min(...group.map(s=>s.y));
  return JSON.stringify(
    group.map(s=>({dx:s.x-minX,dy:s.y-minY,tile:s.tile,pal:s.pal,hFlip:s.hFlip,vFlip:s.vFlip}))
         .sort((a,b)=>a.dy-b.dy||a.dx-b.dx||a.tile-b.tile)
  );
}

// ── Collect unique groups across all frames ───────────────────────────────────
const seen = new Map();
for (const frame of allFrames) {
  for (const g of groupFrame(frame)) {
    const sig = groupSig(g);
    if (!seen.has(sig)) seen.set(sig, g);
  }
}
const uniqueGroups = [...seen.values()]
  .sort((a,b) => b.length-a.length || a[0].pal-b[0].pal || a[0].tile-b[0].tile);

console.log(`\n${allFrames.length} frames → ${uniqueGroups.length} unique groups:`);
uniqueGroups.forEach((g,i) => {
  const tiles = [...new Set(g.map(s=>s.tile))].map(t=>"$"+t.toString(16).padStart(2,"0")).join(",");
  const w=Math.max(...g.map(s=>s.x))-Math.min(...g.map(s=>s.x))+8;
  const h=Math.max(...g.map(s=>s.y))-Math.min(...g.map(s=>s.y))+8;
  console.log(`  [${i}] ${g.length}t ${w}×${h}px pal=${g[0].pal} tiles:[${tiles}]`);
});

// ── Layout: single row of all groups ─────────────────────────────────────────
const SCALE   = 3;
const GUTTER  = 8;
const V_PAD   = 4;
const groupBounds = uniqueGroups.map(g => ({
  minX: Math.min(...g.map(s=>s.x)), minY: Math.min(...g.map(s=>s.y)),
  w: Math.max(...g.map(s=>s.x))-Math.min(...g.map(s=>s.x))+8,
  h: Math.max(...g.map(s=>s.y))-Math.min(...g.map(s=>s.y))+8,
}));

const canvasW = groupBounds.reduce((s,b)=>s+b.w+GUTTER, GUTTER);
const canvasH = Math.max(...groupBounds.map(b=>b.h), 16) + V_PAD*2;
const pixels  = Buffer.alloc(canvasW * canvasH * 4, 240);

console.log(`\nSprite canvas: ${canvasW}×${canvasH} native → ${canvasW*SCALE}×${canvasH*SCALE} scaled`);

const tileMapEntries = [];
let cursorX = GUTTER;
for (let gi = 0; gi < uniqueGroups.length; gi++) {
  const g = uniqueGroups[gi], b = groupBounds[gi];
  const offX = cursorX - b.minX, offY = V_PAD - b.minY;
  for (const s of g) {
    renderTile(s.tile, pixels, s.x+offX, s.y+offY, canvasW, canvasH,
               sprPalettes[s.pal], s.hFlip===1, s.vFlip===1);
    tileMapEntries.push({
      group: gi, tile: s.tile, palette: s.pal,
      h_flip: s.hFlip===1, v_flip: s.vFlip===1,
      canvas_x: (s.x+offX)*SCALE,  // position in scaled output
      canvas_y: (s.y+offY)*SCALE,
    });
  }
  cursorX += b.w + GUTTER;
}

// ── Save sprite PNG (scaled 3×) ───────────────────────────────────────────────
fs.mkdirSync(OUTPUT_DIR, {recursive:true});
const forFluxPath = path.join(OUTPUT_DIR, "smb-sprites-for-flux.png");
const scaledW = canvasW * SCALE, scaledH = canvasH * SCALE;

const spritePngBuf = await sharp(pixels, {raw:{width:canvasW,height:canvasH,channels:4}})
  .resize(scaledW, scaledH, {kernel:"nearest"})
  .flatten({background:{r:240,g:240,b:240}})
  .png()
  .toBuffer();
fs.writeFileSync(forFluxPath, spritePngBuf);
console.log(`Saved: ${forFluxPath}  (${scaledW}×${scaledH})`);

// Save tile-map JSON (positions reference the sprite PNG above)
const tileMapPath = path.join(OUTPUT_DIR, "smb-tile-map.json");
fs.writeFileSync(tileMapPath, JSON.stringify({
  scale: SCALE, canvas_width: scaledW, canvas_height: scaledH,
  group_count: uniqueGroups.length, sprites: tileMapEntries,
}, null, 2));
console.log(`Saved: ${tileMapPath}`);

// ── FLUX round-trip (following flux-roundtrip-test.js pattern) ────────────────
console.log("\n── FLUX Kontext ──────────────────────────────────────────────");
console.log("Uploading sprite PNG...");
const imageBlob = new Blob([spritePngBuf], {type:"image/png"});
const imageUrl = await fal.storage.upload(imageBlob);
console.log(`  Uploaded: ${imageUrl}`);

console.log("Calling FLUX Kontext [pro]...");
let fluxOutputUrl;
try {
  const result = await fal.subscribe("fal-ai/flux-pro/kontext", {
    input: {
      prompt: "Transform these video game character sprites into a medieval knight in silver armor. Keep the exact same poses, frame layout, and dimensions.",
      image_url: imageUrl,
    },
    logs: true,
    onQueueUpdate: (u) => {
      const msg = u.logs?.map(l=>l.message).join(" | ") || "";
      if (msg) console.log(`  [${u.status}] ${msg}`);
    },
  });
  fluxOutputUrl = result.data?.images?.[0]?.url;
  console.log(`  FLUX output: ${fluxOutputUrl}`);
} catch (err) {
  console.error("FLUX failed:", err.message || err);
  process.exit(1);
}

console.log("Downloading FLUX output...");
const fluxResp = await fetch(fluxOutputUrl);
if (!fluxResp.ok) throw new Error(`Download failed: ${fluxResp.status}`);
const fluxBuf = Buffer.from(await fluxResp.arrayBuffer());
const fluxOutPath = path.join(OUTPUT_DIR, "smb-sprites-flux-out.png");
fs.writeFileSync(fluxOutPath, fluxBuf);
console.log(`Saved: ${fluxOutPath}  (${fluxBuf.length} bytes)`);

// ── Quantize FLUX output back to NES CHR tiles ───────────────────────────────
// For each unique tile index in the tile-map, extract the 8×8 region from the
// FLUX output (after resizing to match the input canvas), quantize to NES colors.
console.log("\n── Quantizing to NES CHR ─────────────────────────────────────");

// Resize FLUX output to exactly match sprite canvas dimensions
const fluxMeta = await sharp(fluxBuf).metadata();
console.log(`  FLUX output size: ${fluxMeta.width}×${fluxMeta.height}`);

const fluxResized = await sharp(fluxBuf)
  .resize(scaledW, scaledH, {kernel:"lanczos3", fit:"fill"})
  .ensureAlpha()
  .raw()
  .toBuffer({resolveWithObject:true});
const {data: fluxPixels, info: fluxInfo} = fluxResized;
console.log(`  Resized to: ${fluxInfo.width}×${fluxInfo.height} (${fluxInfo.channels}ch)`);

// Build new CHR: start from original, overwrite transformed tiles
const newChr = Buffer.from(chrData);

// Group tile entries by tile index, use first occurrence for each tile
const tileFirst = new Map();
for (const e of tileMapEntries) {
  if (!tileFirst.has(e.tile)) tileFirst.set(e.tile, e);
}
console.log(`  Quantizing ${tileFirst.size} unique tile indices...`);

let quantized = 0;
for (const [tileIdx, entry] of tileFirst) {
  const tx = entry.canvas_x;   // top-left in scaled image
  const ty = entry.canvas_y;
  const tileSize = 8 * SCALE;  // 24px in scaled image

  // Bounds check
  if (tx < 0 || ty < 0 || tx + tileSize > scaledW || ty + tileSize > scaledH) continue;

  // Extract tileSize×tileSize block, downscale to 8×8
  const raw8 = await sharp(fluxPixels, {raw:{width:scaledW,height:scaledH,channels:4}})
    .extract({left:tx, top:ty, width:tileSize, height:tileSize})
    .resize(8, 8, {kernel:"lanczos3"})
    .raw()
    .toBuffer();

  // Map 64 pixels to NES palette color indices
  // Build the 4-color palette for this tile from sprite palette
  const pal = sprPalettes[entry.palette];   // [[r,g,b], [r,g,b], [r,g,b], [r,g,b]]

  const base = tileIdx * 16;
  for (let row = 0; row < 8; row++) {
    let plane0 = 0, plane1 = 0;
    for (let col = 0; col < 8; col++) {
      const off = (row*8+col)*4;
      const r = raw8[off], g = raw8[off+1], b = raw8[off+2], a = raw8[off+3];
      // If very dark or transparent → index 0 (transparent/background)
      if (a < 64) { continue; }  // plane bits stay 0 = index 0
      // Find nearest of 4 palette entries (skip index 0 which is transparent)
      let bestCi = 0, bestD = Infinity;
      for (let ci = 0; ci < 4; ci++) {
        const d = colorDistSq([r,g,b], pal[ci]);
        if (d < bestD) { bestD = d; bestCi = ci; }
      }
      // If the nearest match is palette[0] and pixel is not clearly dark, use it
      const bit0 = bestCi & 1, bit1 = (bestCi>>1) & 1;
      plane0 |= bit0 << (7-col);
      plane1 |= bit1 << (7-col);
    }
    newChr[base + row]     = plane0;
    newChr[base + 8 + row] = plane1;
  }
  quantized++;
}

const chrOutPath = path.join(OUTPUT_DIR, "smb-sprites-quantized.chr");
fs.writeFileSync(chrOutPath, newChr);
console.log(`  Quantized ${quantized} tiles → ${chrOutPath}  (${newChr.length} bytes)`);

console.log("\n── Done ──────────────────────────────────────────────────────");
console.log(`  smb-sprites-for-flux.png   ${scaledW}×${scaledH} — input to FLUX`);
console.log(`  smb-sprites-flux-out.png   — FLUX output`);
console.log(`  smb-sprites-quantized.chr  — ready for jsnes injection`);
console.log(`  smb-tile-map.json          — ${tileMapEntries.length} tile entries`);
