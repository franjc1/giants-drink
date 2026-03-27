/**
 * Comprehensive Mega Man sprite extraction from MM2.
 * Extract standing, 3 walk frames, jump.
 * Save tile pixel data for each pose as JSON.
 */
const fs = require('fs');
const { NES, Controller } = require('jsnes');
const { PNG } = require('pngjs');

const MM2_ROM = `${process.env.HOME}/nes-roms/Mega Man 2 (USA).nes`;
const VAL_DIR = `${__dirname}/validation`;

let lastFrame;
const nes = new NES({ onFrame: fb => { lastFrame = fb.slice(); }, onAudioSample: () => {} });
nes.loadROM(fs.readFileSync(MM2_ROM).toString('binary'));

function step(n) { for (let i = 0; i < n; i++) nes.frame(); }
function savePNG(fb, name) {
  const png = new PNG({width:256,height:240});
  for(let i=0;i<256*240;i++){const v=fb[i];png.data[i*4]=v&0xFF;png.data[i*4+1]=(v>>8)&0xFF;png.data[i*4+2]=(v>>16)&0xFF;png.data[i*4+3]=255;}
  fs.writeFileSync(`${VAL_DIR}/${name}`, PNG.sync.write(png));
}

// Boot to Air Man stage
step(30);
for (let i = 0; i < 8; i++) { nes.buttonDown(1,Controller.BUTTON_START);step(1);nes.buttonUp(1,Controller.BUTTON_START);step(60); }
nes.buttonDown(1,Controller.BUTTON_UP);step(1);nes.buttonUp(1,Controller.BUTTON_UP);step(10);
nes.buttonDown(1,Controller.BUTTON_START);step(1);nes.buttonUp(1,Controller.BUTTON_START);
step(1800);
console.log('In gameplay. State:', nes.cpu.mem[0x2A]);

// Identify Mega Man's OAM slots by looking for the cluster around his position
// From earlier: slots 7-16 with attr=$60, palette 0
function getMegaManSprites() {
  const sprites = [];
  for (let s = 0; s < 64; s++) {
    const y = nes.ppu.spriteMem[s*4];
    const attr = nes.ppu.spriteMem[s*4+2];
    if (y > 0 && y < 0xEF && (attr & 0x60) === 0x60) { // Mega Man's attr pattern
      sprites.push({
        slot: s,
        x: nes.ppu.spriteMem[s*4+3],
        y: y,
        tile: nes.ppu.spriteMem[s*4+1],
        attr: attr
      });
    }
  }
  return sprites;
}

function extractTilePixels(tileIdx) {
  const t = nes.ppu.ptTile[tileIdx];
  return t && t.pix ? Array.from(t.pix) : new Array(64).fill(0);
}

function capturePose(label) {
  const sprites = getMegaManSprites();
  if (sprites.length === 0) return null;

  const minX = Math.min(...sprites.map(s => s.x));
  const minY = Math.min(...sprites.map(s => s.y));

  const tiles = sprites.map(s => ({
    offsetX: s.x - minX,
    offsetY: s.y - minY,
    tileIdx: s.tile,
    pixels: extractTilePixels(s.tile)
  }));

  console.log(`${label}: ${sprites.length} sprites, origin=(${minX},${minY})`);
  sprites.forEach(s => {
    console.log(`  (${s.x-minX},${s.y-minY}) tile=$${s.tile.toString(16).padStart(2,'0')}`);
  });

  return { tiles, originX: minX, originY: minY, label };
}

// ============================================================
// CAPTURE POSES
// ============================================================
const poses = {};
const save = nes.toJSON();

// STANDING
step(10);
poses.stand = capturePose('STAND');
nes.frame();
savePNG(lastFrame, 'mm2-pose-stand.png');

// WALK FRAMES — move right and capture unique tile sets
nes.fromJSON(save);
step(5);
nes.buttonDown(1, Controller.BUTTON_RIGHT);
const walkTileSets = new Map();
for (let f = 0; f < 60; f++) {
  nes.frame();
  const sprites = getMegaManSprites();
  const key = sprites.map(s => s.tile.toString(16)).sort().join(',');
  if (!walkTileSets.has(key)) {
    const pose = capturePose(`WALK_${walkTileSets.size + 1}`);
    walkTileSets.set(key, pose);
    nes.frame();
    savePNG(lastFrame, `mm2-pose-walk${walkTileSets.size}.png`);
  }
}
nes.buttonUp(1, Controller.BUTTON_RIGHT);

let walkIdx = 1;
for (const [key, pose] of walkTileSets) {
  poses[`walk${walkIdx}`] = pose;
  walkIdx++;
}

// JUMP
nes.fromJSON(save);
step(5);
nes.buttonDown(1, Controller.BUTTON_A);
step(8);
nes.buttonUp(1, Controller.BUTTON_A);
step(3);
poses.jump = capturePose('JUMP');
nes.frame();
savePNG(lastFrame, 'mm2-pose-jump.png');

// ============================================================
// EXTRACT PALETTE
// ============================================================
nes.fromJSON(save);
step(5);
const palette = [];
for (let c = 0; c < 4; c++) palette.push(nes.ppu.vramMem[0x3F10 + c]);
console.log(`\nSprite palette 0: $${palette.map(c=>c.toString(16).padStart(2,'0')).join(' $')}`);

// ============================================================
// Build output: simplify to 2-column layout (16px wide × Nx8 tall)
// For SMB replacement, we need tiles arranged in a consistent 2-col grid.
// Take each pose and arrange by (offsetX / 8, offsetY / 8) grid.
// ============================================================
function normalizePose(pose) {
  if (!pose) return null;
  // Group by grid position
  const grid = {};
  for (const t of pose.tiles) {
    const col = Math.round(t.offsetX / 8);
    const row = Math.round(t.offsetY / 8);
    const key = `${col},${row}`;
    grid[key] = t;
  }

  // Find bounding cols/rows
  const cols = [...new Set(pose.tiles.map(t => Math.round(t.offsetX / 8)))].sort((a,b) => a-b);
  const rows = [...new Set(pose.tiles.map(t => Math.round(t.offsetY / 8)))].sort((a,b) => a-b);

  // For SMB: take rightmost 2 columns (Mega Man faces right, body is on right side)
  // or leftmost 2 columns — depends on the data
  const useCols = cols.length <= 2 ? cols : cols.slice(cols.length - 2);

  const normalized = [];
  for (const row of rows) {
    for (const col of useCols) {
      const key = `${col},${row}`;
      const tile = grid[key];
      normalized.push({
        col: col - useCols[0],  // normalize to 0-based
        row: row - rows[0],
        pixels: tile ? tile.pixels : new Array(64).fill(0),
        tileIdx: tile ? tile.tileIdx : -1
      });
    }
  }

  return {
    tiles: normalized,
    width: useCols.length,
    height: rows.length
  };
}

// Normalize all poses
const normalizedPoses = {};
for (const [name, pose] of Object.entries(poses)) {
  normalizedPoses[name] = normalizePose(pose);
  if (normalizedPoses[name]) {
    console.log(`\n${name}: ${normalizedPoses[name].width}×${normalizedPoses[name].height} tiles`);
  }
}

// Save output JSON
const output = {
  poses: normalizedPoses,
  palette: {
    normal: [0x0F, palette[1], palette[2], palette[3]],
    // Red palette for fire flower: swap blues for reds
    fire: [0x0F, 0x06, 0x16, 0x26]
  },
  spriteMode: '8x8',
  characterSize: '16x24'
};

fs.writeFileSync(`${__dirname}/megaman-sprites.json`, JSON.stringify(output, null, 2));
console.log(`\nSaved megaman-sprites.json`);
console.log(`Poses: ${Object.keys(normalizedPoses).join(', ')}`);

// Print standing pose composite for visual verification
const stand = normalizedPoses.stand;
if (stand) {
  console.log('\n=== Standing pose composite ===');
  for (let row = 0; row < stand.height; row++) {
    for (let pixRow = 0; pixRow < 8; pixRow++) {
      let line = '';
      for (let col = 0; col < stand.width; col++) {
        const tile = stand.tiles.find(t => t.col === col && t.row === row);
        if (tile) {
          line += tile.pixels.slice(pixRow * 8, pixRow * 8 + 8).join('');
        } else {
          line += '00000000';
        }
      }
      console.log('  ' + line);
    }
  }
}
