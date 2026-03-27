/**
 * Part 2: PNG-to-NES Tile Converter
 *
 * Takes a PNG sprite image and converts it to NES-compatible tile data:
 * - Slices into 8x8 tiles
 * - Quantizes to 4 colors (transparent + 3)
 * - Maps to nearest NES palette entries
 * - Outputs JSON ready for CHR injection
 *
 * Usage: node png-to-nes-tiles.cjs <input.png> [output.json]
 */
const fs = require('fs');
const { PNG } = require('pngjs');

// ============================================================
// NES Master Palette (54 canonical colors + duplicates to fill 64)
// Index → [R, G, B]
// ============================================================
const NES_PALETTE = [
  [84,84,84],[0,30,116],[8,16,144],[48,0,136],[68,0,100],[92,0,48],[84,4,0],[60,24,0],
  [32,42,0],[8,58,0],[0,64,0],[0,60,0],[0,50,60],[0,0,0],[0,0,0],[0,0,0],
  [152,150,152],[8,76,196],[48,50,236],[92,30,228],[136,20,176],[160,20,100],[152,34,32],[120,60,0],
  [84,90,0],[40,114,0],[8,124,0],[0,118,40],[0,102,120],[0,0,0],[0,0,0],[0,0,0],
  [236,238,236],[76,154,236],[120,124,236],[176,98,236],[228,84,236],[236,88,180],[236,106,100],[212,136,32],
  [160,170,0],[116,196,0],[76,208,32],[56,204,108],[56,180,220],[60,60,60],[0,0,0],[0,0,0],
  [236,238,236],[168,204,236],[188,188,236],[212,178,236],[236,174,236],[236,174,212],[236,180,176],[228,196,144],
  [204,210,120],[180,222,120],[168,226,144],[152,226,180],[160,214,228],[160,162,160],[0,0,0],[0,0,0],
];

// ============================================================
// Find closest NES palette entry for an RGB color
// ============================================================
function closestNESColor(r, g, b) {
  let bestIdx = 0x0F; // Default to black
  let bestDist = Infinity;
  for (let i = 0; i < 64; i++) {
    const [pr, pg, pb] = NES_PALETTE[i];
    const dist = (r - pr) ** 2 + (g - pg) ** 2 + (b - pb) ** 2;
    if (dist < bestDist) {
      bestDist = dist;
      bestIdx = i;
    }
  }
  return bestIdx;
}

// ============================================================
// K-means color quantization to 3 colors (+ transparent)
// ============================================================
function quantizeColors(pixels, maxColors = 3) {
  // Collect unique non-transparent colors
  const colorMap = new Map();
  for (const px of pixels) {
    if (px.a < 128) continue; // Transparent
    const key = `${px.r},${px.g},${px.b}`;
    if (!colorMap.has(key)) colorMap.set(key, { r: px.r, g: px.g, b: px.b, count: 0 });
    colorMap.get(key).count++;
  }

  const uniqueColors = [...colorMap.values()];
  if (uniqueColors.length <= maxColors) {
    return uniqueColors.map(c => ({ r: c.r, g: c.g, b: c.b }));
  }

  // Simple quantization: pick the most frequent colors
  uniqueColors.sort((a, b) => b.count - a.count);
  const palette = uniqueColors.slice(0, maxColors).map(c => ({ r: c.r, g: c.g, b: c.b }));

  return palette;
}

// ============================================================
// MAIN CONVERTER
// ============================================================
function convertPNG(inputPath, outputPath) {
  const data = fs.readFileSync(inputPath);
  const png = PNG.sync.read(data);
  const { width, height } = png;

  console.log(`Input: ${inputPath} (${width}×${height})`);

  if (width % 8 !== 0 || height % 8 !== 0) {
    throw new Error(`Dimensions must be multiples of 8. Got ${width}×${height}`);
  }

  const tilesWide = width / 8;
  const tilesHigh = height / 8;
  console.log(`Tiles: ${tilesWide}×${tilesHigh} = ${tilesWide * tilesHigh} tiles`);

  // Extract all pixels
  const pixels = [];
  for (let y = 0; y < height; y++) {
    for (let x = 0; x < width; x++) {
      const idx = (y * width + x) * 4;
      pixels.push({
        x, y,
        r: png.data[idx], g: png.data[idx + 1], b: png.data[idx + 2], a: png.data[idx + 3]
      });
    }
  }

  // Quantize to 3 colors + transparent
  const palette = quantizeColors(pixels, 3);
  console.log(`Palette (${palette.length} colors):`);
  palette.forEach((c, i) => {
    const nesIdx = closestNESColor(c.r, c.g, c.b);
    console.log(`  Color ${i + 1}: RGB(${c.r},${c.g},${c.b}) → NES $${nesIdx.toString(16).padStart(2, '0')}`);
  });

  // Map each pixel to palette index (0=transparent, 1-3=colors)
  function mapPixel(px) {
    if (px.a < 128) return 0; // Transparent
    let bestIdx = 1;
    let bestDist = Infinity;
    for (let i = 0; i < palette.length; i++) {
      const c = palette[i];
      const dist = (px.r - c.r) ** 2 + (px.g - c.g) ** 2 + (px.b - c.b) ** 2;
      if (dist < bestDist) {
        bestDist = dist;
        bestIdx = i + 1;
      }
    }
    return bestIdx;
  }

  // Slice into 8x8 tiles
  const tiles = [];
  for (let ty = 0; ty < tilesHigh; ty++) {
    for (let tx = 0; tx < tilesWide; tx++) {
      const tilePixels = [];
      for (let row = 0; row < 8; row++) {
        for (let col = 0; col < 8; col++) {
          const px = pixels[(ty * 8 + row) * width + (tx * 8 + col)];
          tilePixels.push(mapPixel(px));
        }
      }
      tiles.push({ index: ty * tilesWide + tx, pixels: tilePixels });
    }
  }

  // Build NES palette (transparent BG + 3 colors)
  const nesPalette = [
    0x0F, // Background/transparent (black)
    ...palette.map(c => closestNESColor(c.r, c.g, c.b))
  ];
  // Pad to 4 entries if needed
  while (nesPalette.length < 4) nesPalette.push(0x0F);

  const output = {
    tiles,
    palette: nesPalette,
    layout: {
      width: tilesWide,
      height: tilesHigh,
      frames: 1
    }
  };

  const outPath = outputPath || inputPath.replace(/\.png$/i, '.json');
  fs.writeFileSync(outPath, JSON.stringify(output, null, 2));
  console.log(`Output: ${outPath}`);
  console.log(`  ${tiles.length} tiles, NES palette: [${nesPalette.map(c => '$' + c.toString(16).padStart(2, '0')).join(', ')}]`);

  return output;
}

// ============================================================
// GENERATE TEST PNG: A 16x32 knight character
// ============================================================
function generateTestPNG(outputPath) {
  const width = 16, height = 32;
  const png = new PNG({ width, height });

  // Colors: transparent (alpha=0), dark_blue, silver, gold
  const COLORS = {
    T: [0, 0, 0, 0],          // Transparent
    B: [20, 40, 120, 255],     // Dark blue (armor)
    S: [180, 190, 210, 255],   // Silver (highlights)
    G: [220, 180, 40, 255],    // Gold (visor/accents)
  };

  // Knight sprite design (16x32 = 2x4 tiles)
  const design = [
    // Row 0: empty (small character padding)
    'TTTTTTTTTTTTTTTT',
    'TTTTTTTTTTTTTTTT',
    'TTTTTTTTTTTTTTTT',
    'TTTTTTTTTTTTTTTT',
    'TTTTTTTTTTTTTTTT',
    'TTTTTTTTTTTTTTTT',
    'TTTTTTTTTTTTTTTT',
    'TTTTTTTTTTTTTTTT',
    // Row 1: empty
    'TTTTTTTTTTTTTTTT',
    'TTTTTTTTTTTTTTTT',
    'TTTTTTTTTTTTTTTT',
    'TTTTTTTTTTTTTTTT',
    'TTTTTTTTTTTTTTTT',
    'TTTTTTTTTTTTTTTT',
    'TTTTTTTTTTTTTTTT',
    'TTTTTTTTTTTTTTTT',
    // Row 2: Head (helmet with visor)
    'TTTBBBBBBBBBTTT',
    'TTBSSSSSSSSSBTT',
    'TTBSGGGGGGSSBTT',
    'TTBSGGGGGGSSBTT',
    'TTBSSSSSSSSSBTT',
    'TTTBBBSSBBBTTT',
    'TTTTBBBBBBTTTT',
    'TTTBBSSSSBBTT',
    // Row 3: Body (armor with sword)
    'TTBBBSSSSBBBTT',
    'TTBSSSSSSSSBT',
    'TTBSSGGSSSSBTT',
    'TTTBBBBBBBBTTTT',
    'TTTTBSSTBSTTTT',
    'TTTTBSSTBSTTTT',
    'TTTTBBTTBBTTTT',
    'TTTTBBTTBBTTTT',
  ];

  for (let y = 0; y < height; y++) {
    const row = design[y] || 'TTTTTTTTTTTTTTTT';
    for (let x = 0; x < width; x++) {
      const ch = row[x] || 'T';
      const color = COLORS[ch] || COLORS.T;
      const idx = (y * width + x) * 4;
      png.data[idx] = color[0];
      png.data[idx + 1] = color[1];
      png.data[idx + 2] = color[2];
      png.data[idx + 3] = color[3];
    }
  }

  fs.writeFileSync(outputPath, PNG.sync.write(png));
  console.log(`Generated test PNG: ${outputPath} (${width}×${height})`);
}

// ============================================================
// CLI or module usage
// ============================================================
if (require.main === module) {
  const args = process.argv.slice(2);

  if (args.length === 0 || args[0] === '--generate-test') {
    const testPath = `${__dirname}/test-knight.png`;
    generateTestPNG(testPath);
    const result = convertPNG(testPath, `${__dirname}/test-knight.json`);
    console.log('\nTest conversion complete.');
  } else {
    convertPNG(args[0], args[1]);
  }
}

module.exports = { convertPNG, generateTestPNG, closestNESColor, NES_PALETTE };
