import { fal } from "@fal-ai/client";
import sharp from "sharp";
import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROM_PATH = path.join(process.env.HOME, "nes-roms", "Super Mario Bros. (World).nes");
const OUTPUT_DIR = path.join(__dirname, "..", "experiment-output");

// Standard NES master palette: 64 RGB entries (well-known Nestopia/accurate approximation)
const NES_PALETTE = [
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

function nearestNesColorIndex(r, g, b) {
  let minDist = Infinity;
  let nearest = 15;
  for (let i = 0; i < NES_PALETTE.length; i++) {
    const d = colorDistSq([r,g,b], NES_PALETTE[i]);
    if (d < minDist) { minDist = d; nearest = i; }
  }
  return nearest;
}

// Step 1: Parse iNES header and extract sprite pattern table
function extractSpriteTable() {
  console.log("Step 1: Parsing ROM and extracting CHR-ROM...");
  const rom = fs.readFileSync(ROM_PATH);

  const magic = rom.slice(0,4).toString("ascii");
  if (magic !== "NES\x1a") throw new Error(`Bad iNES magic: ${magic}`);

  const prgBanks = rom[4];
  const chrBanks = rom[5];
  console.log(`  PRG: ${prgBanks} banks (${prgBanks*16384} bytes), CHR: ${chrBanks} banks (${chrBanks*8192} bytes)`);

  const chrStart = 16 + prgBanks * 16384;
  const chrData = rom.slice(chrStart, chrStart + chrBanks * 8192);
  console.log(`  CHR-ROM: ${chrData.length} bytes starting at ROM offset ${chrStart}`);

  // SMB PPUCTRL=$90: sprites at pattern table 0 ($0000-$0FFF), BG at pattern table 1 ($1000-$1FFF)
  // Pattern table 0 = CHR-ROM bytes 0x0000-0x0FFF (first 4KB)
  const spriteTable = Buffer.from(chrData.slice(0, 4096));
  console.log(`  Sprite pattern table: ${spriteTable.length} bytes (256 tiles, pattern table 0 = PPU $0000-$0FFF)`);

  return { chrData: Buffer.from(chrData), spriteTable };
}

// Step 2: Render 256 sprite tiles in a 16x16 grid (128x128 pixels)
function renderTileGrid(spriteTable, palette) {
  const GRID = 16;
  const W = GRID * 8;
  const H = GRID * 8;
  const pixels = Buffer.alloc(W * H * 4);

  for (let tileIdx = 0; tileIdx < 256; tileIdx++) {
    const tx = (tileIdx % GRID) * 8;
    const ty = Math.floor(tileIdx / GRID) * 8;
    const base = tileIdx * 16;

    for (let row = 0; row < 8; row++) {
      const p0 = spriteTable[base + row];
      const p1 = spriteTable[base + 8 + row];
      for (let col = 0; col < 8; col++) {
        const b0 = (p0 >> (7-col)) & 1;
        const b1 = (p1 >> (7-col)) & 1;
        const ci = (b1 << 1) | b0;
        const [r,g,b] = palette[ci];
        const off = ((ty+row) * W + (tx+col)) * 4;
        pixels[off]   = r;
        pixels[off+1] = g;
        pixels[off+2] = b;
        pixels[off+3] = ci === 0 ? 48 : 255;
      }
    }
  }
  return { pixels, width: W, height: H };
}

// Step 6: Quantize a 128x128 raw RGBA image back to NES CHR format
// Returns { chrData (Buffer, 4096 bytes), paletteData (array of 256 x [4 NES indices]) }
function quantizeToChr(rawPixels) {
  console.log("  Quantizing to NES CHR format (per-tile palette selection)...");
  const chrData = Buffer.alloc(4096);
  const paletteData = [];

  for (let tileIdx = 0; tileIdx < 256; tileIdx++) {
    const tx = (tileIdx % 16) * 8;
    const ty = Math.floor(tileIdx / 16) * 8;

    // Collect 64 pixels from this tile, map each to nearest NES palette index
    const nesFreq = new Array(64).fill(0);
    const pixelNesIdx = [];

    for (let row = 0; row < 8; row++) {
      for (let col = 0; col < 8; col++) {
        const off = ((ty+row) * 128 + (tx+col)) * 4;
        const r = rawPixels[off];
        const g = rawPixels[off+1];
        const b = rawPixels[off+2];
        const a = rawPixels[off+3];
        // Treat very dark/transparent pixels as index 0 (transparent)
        let ni;
        if (a < 64 || (r < 20 && g < 20 && b < 20)) {
          ni = 15; // NES $0F = black (transparent slot)
        } else {
          ni = nearestNesColorIndex(r, g, b);
        }
        nesFreq[ni]++;
        pixelNesIdx.push(ni);
      }
    }

    // Pick top 4 most frequent NES colors for this tile's palette
    const sorted = nesFreq
      .map((cnt, i) => ({ i, cnt }))
      .filter(x => x.cnt > 0)
      .sort((a,b) => b.cnt - a.cnt);

    // Slot 0 = background/transparent (use black $0F if present, else darkest color)
    // Slots 1-3 = the next 3 most common colors
    const tilePal = [15, 15, 15, 15]; // default: all black
    let slot = 0;
    // Put black ($0F) in slot 0 if it's in the top colors
    const blackEntry = sorted.find(x => x.i === 15);
    if (blackEntry) tilePal[0] = 15;
    slot = 1;
    for (const entry of sorted) {
      if (slot > 3) break;
      if (entry.i !== 15) { tilePal[slot++] = entry.i; }
    }
    paletteData.push([...tilePal]);

    // Map each pixel to color index 0-3
    const tileBase = tileIdx * 16;
    for (let row = 0; row < 8; row++) {
      let plane0 = 0, plane1 = 0;
      for (let col = 0; col < 8; col++) {
        const ni = pixelNesIdx[row*8+col];
        // Find which palette slot this NES index maps to
        let ci = tilePal.indexOf(ni);
        if (ci === -1) {
          // Find nearest palette slot color
          let minD = Infinity;
          ci = 0;
          for (let k = 0; k < 4; k++) {
            const d = colorDistSq(NES_PALETTE[ni], NES_PALETTE[tilePal[k]]);
            if (d < minD) { minD = d; ci = k; }
          }
        }
        const b0 = ci & 1;
        const b1 = (ci >> 1) & 1;
        plane0 |= (b0 << (7-col));
        plane1 |= (b1 << (7-col));
      }
      chrData[tileBase + row]   = plane0;
      chrData[tileBase + 8 + row] = plane1;
    }
  }

  return { chrData, paletteData };
}

async function main() {
  if (!process.env.FAL_KEY) {
    console.error("ERROR: FAL_KEY environment variable not set");
    process.exit(1);
  }

  fal.config({ credentials: process.env.FAL_KEY });
  console.log("fal.ai client configured\n");

  // ── Step 1: Extract CHR-ROM ────────────────────────────────────────────────
  const { chrData: originalChrData, spriteTable } = extractSpriteTable();

  // ── Step 2: Render tile grid ───────────────────────────────────────────────
  console.log("Step 2: Rendering 16x16 sprite tile grid...");
  // SMB sprite palette 0: transparent, dark-red, orange-tan, near-white
  const smbSpritePalette = [
    [20, 20, 20],      // 0x0F near-black (transparent background)
    [152, 34, 32],     // 0x16 dark red
    [212, 136, 32],    // 0x27 orange-tan
    [236, 238, 236],   // 0x30 near-white
  ];
  const { pixels: nativePx, width: W, height: H } = renderTileGrid(spriteTable, smbSpritePalette);

  const nativePath = path.join(OUTPUT_DIR, "smb-sprites-original-native.png");
  await sharp(nativePx, { raw: { width: W, height: H, channels: 4 } })
    .png()
    .toFile(nativePath);
  console.log(`  Saved: smb-sprites-original-native.png (${W}x${H} native resolution)`);

  // ── Step 3: Upscale to 512x512 (nearest-neighbor) ─────────────────────────
  console.log("Step 3: Upscaling to 512x512 for FLUX...");
  const upscaledPath = path.join(OUTPUT_DIR, "smb-sprites-original.png");
  await sharp(nativePx, { raw: { width: W, height: H, channels: 4 } })
    .resize(512, 512, { kernel: "nearest" })
    .flatten({ background: { r: 20, g: 20, b: 20 } })
    .png()
    .toFile(upscaledPath);
  console.log(`  Saved: smb-sprites-original.png (512x512)`);

  // ── Step 4: Upload to fal storage ─────────────────────────────────────────
  console.log("Step 4: Uploading sprite sheet to fal storage...");
  const imageBuffer = fs.readFileSync(upscaledPath);
  let imageUrl;
  try {
    const imageBlob = new Blob([imageBuffer], { type: "image/png" });
    imageUrl = await fal.storage.upload(imageBlob);
    console.log(`  Uploaded: ${imageUrl}`);
  } catch (err) {
    console.error("fal.storage.upload failed:", err.message);
    console.error(JSON.stringify(err, null, 2));
    process.exit(1);
  }

  // ── Step 5: Call FLUX Kontext API ──────────────────────────────────────────
  console.log("Step 5: Calling FLUX Kontext [pro] API...");
  console.log("  Endpoint: fal-ai/flux-pro/kontext");
  let fluxOutputUrl;
  try {
    const result = await fal.subscribe("fal-ai/flux-pro/kontext", {
      input: {
        prompt: "Transform all characters and objects in this sprite sheet into medieval fantasy style. Knights in armor, fire-breathing dragons, treasure chests, magic wands, castle towers. Keep the exact same poses, positions, proportions, and layout for every sprite. Maintain the same grid structure with each sprite in its original cell. Pixel art style with 8-bit color depth.",
        image_url: imageUrl,
      },
      logs: true,
      onQueueUpdate: (update) => {
        const msg = update.logs?.map(l => l.message).join(" | ") || "";
        console.log(`  [FLUX ${update.status}] ${msg}`);
      },
    });
    fluxOutputUrl = result.data?.images?.[0]?.url;
    console.log(`  FLUX output URL: ${fluxOutputUrl}`);
  } catch (err) {
    console.error("FLUX API call failed:", err.message || err);
    console.error("Full error:", JSON.stringify(err, null, 2));
    console.log("Partial output saved. Exiting.");
    process.exit(1);
  }

  // ── Download FLUX output ───────────────────────────────────────────────────
  console.log("Downloading FLUX output image...");
  const fluxPath = path.join(OUTPUT_DIR, "smb-sprites-flux-transformed.png");
  const fluxResp = await fetch(fluxOutputUrl);
  if (!fluxResp.ok) throw new Error(`Download failed: ${fluxResp.status}`);
  const fluxBuffer = Buffer.from(await fluxResp.arrayBuffer());
  fs.writeFileSync(fluxPath, fluxBuffer);
  console.log(`  Saved: smb-sprites-flux-transformed.png (${fluxBuffer.length} bytes)`);

  // ── Step 6: Downscale FLUX output to 128x128 ──────────────────────────────
  console.log("Step 6: Downscaling FLUX output to 128x128 for CHR extraction...");
  const downResult = await sharp(fluxBuffer)
    .resize(128, 128, { kernel: "nearest" })
    .ensureAlpha()
    .raw()
    .toBuffer({ resolveWithObject: true });
  const { data: rawPixels128, info } = downResult;
  console.log(`  Downscaled: ${info.width}x${info.height} (${info.channels}ch, ${rawPixels128.length} bytes)`);

  // ── Quantize to NES CHR ────────────────────────────────────────────────────
  const { chrData: quantizedChr, paletteData } = quantizeToChr(rawPixels128);

  const chrOutPath = path.join(OUTPUT_DIR, "smb-sprites-quantized.chr");
  fs.writeFileSync(chrOutPath, quantizedChr);
  console.log(`  Saved: smb-sprites-quantized.chr (${quantizedChr.length} bytes)`);

  // ── Step 7: Save palette JSON ──────────────────────────────────────────────
  const palJson = {
    description: "Per-tile NES palette indices for quantized FLUX sprites",
    format: "256 tiles, each with 4 NES palette indices [bg/transparent, color1, color2, color3]",
    tile_count: 256,
    palettes: paletteData,
  };
  const palPath = path.join(OUTPUT_DIR, "smb-sprites-palette.json");
  fs.writeFileSync(palPath, JSON.stringify(palJson, null, 2));
  console.log(`  Saved: smb-sprites-palette.json`);

  // ── Render quantized preview ───────────────────────────────────────────────
  console.log("Step 7: Rendering quantized CHR preview...");
  const previewPx = Buffer.alloc(128 * 128 * 4);

  for (let tileIdx = 0; tileIdx < 256; tileIdx++) {
    const tx = (tileIdx % 16) * 8;
    const ty = Math.floor(tileIdx / 16) * 8;
    const base = tileIdx * 16;
    const tilePal = paletteData[tileIdx];

    for (let row = 0; row < 8; row++) {
      const p0 = quantizedChr[base + row];
      const p1 = quantizedChr[base + 8 + row];
      for (let col = 0; col < 8; col++) {
        const b0 = (p0 >> (7-col)) & 1;
        const b1 = (p1 >> (7-col)) & 1;
        const ci = (b1 << 1) | b0;
        const nesIdx = tilePal[ci];
        const [r,g,b] = NES_PALETTE[nesIdx];
        const off = ((ty+row)*128 + (tx+col)) * 4;
        previewPx[off]   = r;
        previewPx[off+1] = g;
        previewPx[off+2] = b;
        previewPx[off+3] = ci === 0 ? 48 : 255;
      }
    }
  }

  const previewPath = path.join(OUTPUT_DIR, "smb-sprites-quantized-preview.png");
  await sharp(previewPx, { raw: { width: 128, height: 128, channels: 4 } })
    .resize(512, 512, { kernel: "nearest" })
    .flatten({ background: { r: 20, g: 20, b: 20 } })
    .png()
    .toFile(previewPath);
  console.log(`  Saved: smb-sprites-quantized-preview.png (512x512)`);

  console.log("\n=== ROUND-TRIP COMPLETE ===");
  console.log("Files saved to experiment-output/:");
  console.log("  smb-sprites-original-native.png   128x128 native CHR render");
  console.log("  smb-sprites-original.png          512x512 upscaled (sent to FLUX)");
  console.log("  smb-sprites-flux-transformed.png  FLUX Kontext output");
  console.log("  smb-sprites-quantized.chr         NES CHR data (4096 bytes)");
  console.log("  smb-sprites-palette.json          Per-tile NES palette indices");
  console.log("  smb-sprites-quantized-preview.png 512x512 preview of quantized result");
  console.log("\nNext: open public/flux-sprite-test.html in a browser (via server.js)");
  console.log("  node server.js   then open http://localhost:3001");
}

main().catch(err => {
  console.error("\nFatal error:", err);
  process.exit(1);
});
