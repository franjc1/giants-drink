/**
 * Convert PixelLab 32x48 sprites to NES 16x24 tile data.
 * Uses brightness-based clustering for better NES palette mapping.
 */
const fs = require('fs');
const { PNG } = require('pngjs');

const SPRITE_DIR = `${__dirname}/pixellab-sprites`;

// NES palette (from jsnes NTSC — stored as BGR internally, shown here as RGB)
const NES_PAL_RGB = [
  [82,82,82],[0,0,180],[8,0,160],[61,0,180],[100,0,116],[92,0,0],[95,0,0],[24,24,0],
  [16,47,0],[8,74,0],[0,103,0],[0,66,18],[0,40,109],[0,0,0],[0,0,0],[0,0,0],
  [231,213,196],[0,64,255],[34,14,220],[107,0,228],[159,0,215],[160,20,100],[188,25,0],[120,60,0],
  [84,90,0],[0,140,0],[0,171,0],[0,136,44],[0,102,120],[0,0,0],[0,0,0],[0,0,0],
  [248,248,248],[60,171,255],[129,121,255],[197,86,255],[242,72,255],[255,84,183],[255,102,99],[155,196,59],
  [63,191,243],[0,227,117],[3,244,43],[120,184,46],[229,226,24],[120,120,120],[0,0,0],[0,0,0],
  [255,255,255],[190,230,255],[203,203,255],[219,191,255],[242,186,255],[255,186,219],[255,191,198],[171,228,144],
  [163,231,204],[125,255,221],[184,248,184],[172,248,245],[176,255,255],[248,216,248],[0,0,0],[0,0,0],
];

function closestNES(r, g, b) {
  let best = 0x0F, bestD = Infinity;
  for (let i = 0; i < 64; i++) {
    const [pr, pg, pb] = NES_PAL_RGB[i];
    const d = (r-pr)**2 + (g-pg)**2 + (b-pb)**2;
    if (d < bestD) { bestD = d; best = i; }
  }
  return best;
}

function loadAndDownscale(path) {
  const png = PNG.sync.read(fs.readFileSync(path));
  const w = 16, h = 24;
  const pixels = [];
  for (let y = 0; y < h; y++) {
    for (let x = 0; x < w; x++) {
      // Pick the pixel with highest alpha from 2x2 block (nearest-neighbor feel)
      let bestA = 0, br = 0, bg = 0, bb = 0;
      for (let dy = 0; dy < 2; dy++) {
        for (let dx = 0; dx < 2; dx++) {
          const sx = x*2+dx, sy = y*2+dy;
          if (sx < png.width && sy < png.height) {
            const idx = (sy * png.width + sx) * 4;
            if (png.data[idx+3] > bestA) {
              bestA = png.data[idx+3];
              br = png.data[idx]; bg = png.data[idx+1]; bb = png.data[idx+2];
            }
          }
        }
      }
      pixels.push(bestA > 128 ? { r: br, g: bg, b: bb, a: 255 } : { r: 0, g: 0, b: 0, a: 0 });
    }
  }
  return { w, h, pixels };
}

// Load all frames
const frameNames = ['stand', 'walk1', 'walk2', 'walk3', 'jump'];
const frames = {};
for (const name of frameNames) {
  frames[name] = loadAndDownscale(`${SPRITE_DIR}/${name}-32x48.png`);
}

// Cluster ALL opaque pixels by brightness into 3 groups
const allPx = [];
for (const frame of Object.values(frames)) {
  for (const px of frame.pixels) {
    if (px.a > 128) allPx.push(px);
  }
}

// Sort by brightness and split into 3 equal groups
allPx.sort((a, b) => (a.r + a.g + a.b) - (b.r + b.g + b.b));
const third = Math.floor(allPx.length / 3);
const groups = [
  allPx.slice(0, third),                    // darkest
  allPx.slice(third, third * 2),             // mid
  allPx.slice(third * 2),                    // brightest
];

// Average each group
const palette = groups.map(g => {
  const avg = { r: 0, g: 0, b: 0 };
  for (const px of g) { avg.r += px.r; avg.g += px.g; avg.b += px.b; }
  avg.r = Math.round(avg.r / g.length);
  avg.g = Math.round(avg.g / g.length);
  avg.b = Math.round(avg.b / g.length);
  avg.nes = closestNES(avg.r, avg.g, avg.b);
  return avg;
});

// Ensure 3 DISTINCT NES colors (no duplicates)
const usedNes = new Set();
for (const c of palette) {
  if (usedNes.has(c.nes)) {
    // Find next closest distinct color
    let bestD = Infinity, bestI = c.nes;
    for (let i = 0; i < 64; i++) {
      if (usedNes.has(i)) continue;
      const [pr, pg, pb] = NES_PAL_RGB[i];
      const d = (c.r-pr)**2 + (c.g-pg)**2 + (c.b-pb)**2;
      if (d < bestD) { bestD = d; bestI = i; }
    }
    c.nes = bestI;
  }
  usedNes.add(c.nes);
}

console.log('Palette (brightness-clustered):');
palette.forEach((c, i) => console.log(`  Color ${i+1}: RGB(${c.r},${c.g},${c.b}) → NES $${c.nes.toString(16).padStart(2,'0')}`));
const nesPal = [0x0F, palette[0].nes, palette[1].nes, palette[2].nes];
console.log(`NES palette: [${nesPal.map(c => '$' + c.toString(16).padStart(2,'0')).join(', ')}]`);

// Map pixel to palette index
function mapPixel(px) {
  if (px.a < 128) return 0;
  let best = 1, bestD = Infinity;
  for (let i = 0; i < palette.length; i++) {
    const d = (px.r - palette[i].r)**2 + (px.g - palette[i].g)**2 + (px.b - palette[i].b)**2;
    if (d < bestD) { bestD = d; best = i + 1; }
  }
  return best;
}

// Convert frames to tiles
const output = { poses: {}, palette: { normal: nesPal, fire: [0x0F, 0x06, 0x16, 0x26] } };

for (const [name, frame] of Object.entries(frames)) {
  const tiles = [];
  for (let trow = 0; trow < 3; trow++) {
    for (let tcol = 0; tcol < 2; tcol++) {
      const px = [];
      for (let r = 0; r < 8; r++) {
        for (let c = 0; c < 8; c++) {
          px.push(mapPixel(frame.pixels[(trow*8+r) * 16 + (tcol*8+c)]));
        }
      }
      tiles.push({ dx: tcol * 8, dy: trow * 8, hf: 0, px });
    }
  }
  output.poses[name] = tiles;

  // ASCII art
  const chars = ['.', '@', '#', '*'];
  console.log(`\n${name}:`);
  for (let y = 0; y < 24; y++) {
    let row = '  ';
    for (let x = 0; x < 16; x++) row += chars[mapPixel(frame.pixels[y * 16 + x])];
    console.log(row);
  }
}

fs.writeFileSync(`${__dirname}/pixellab-tiles.json`, JSON.stringify(output));
fs.writeFileSync(`${__dirname}/pixellab-data.js`, 'var PL_SPRITES = ' + JSON.stringify(output) + ';\n');
console.log('\nSaved pixellab-tiles.json + pixellab-data.js');
