/**
 * Extract Mega Man's sprite tiles from Mega Man 2 CHR-RAM.
 * MM2 uses 8x16 sprite mode and CHR-RAM.
 * Boot to gameplay, then capture tiles from various poses.
 */
const fs = require('fs');
const { NES, Controller } = require('jsnes');
const { PNG } = require('pngjs');

const MM2_ROM = `${process.env.HOME}/nes-roms/Mega Man 2 (USA).nes`;
const VAL_DIR = `${__dirname}/validation`;

let lastFrame = null;
const nes = new NES({
  onFrame: fb => { lastFrame = fb.slice(); },
  onAudioSample: () => {}
});
nes.loadROM(fs.readFileSync(MM2_ROM).toString('binary'));

function step(n) { for (let i = 0; i < n; i++) nes.frame(); }
function ram(a) { return nes.cpu.mem[a]; }
function savePNG(fb, filename) {
  const png = new PNG({ width: 256, height: 240 });
  for (let i = 0; i < 256*240; i++) {
    const v = fb[i];
    png.data[i*4]=v&0xFF; png.data[i*4+1]=(v>>8)&0xFF; png.data[i*4+2]=(v>>16)&0xFF; png.data[i*4+3]=255;
  }
  fs.writeFileSync(`${VAL_DIR}/${filename}`, PNG.sync.write(png));
  console.log(`Saved: ${filename}`);
}

// ============================================================
// Boot MM2 to gameplay
// ============================================================
console.log('Booting MM2...');
// Skip intro by pressing START repeatedly
step(30);
for (let i = 0; i < 8; i++) {
  nes.buttonDown(1, Controller.BUTTON_START); step(1); nes.buttonUp(1, Controller.BUTTON_START);
  step(60);
}

// Check state
console.log(`State $2A: ${ram(0x2A)}, Bank $29: ${ram(0x29)}`);

// If we're on the stage select, press A to pick a stage
nes.buttonDown(1, Controller.BUTTON_A); step(1); nes.buttonUp(1, Controller.BUTTON_A);
step(600); // Wait for stage to load

console.log(`After stage select: $2A=${ram(0x2A)}`);

// Check for visible sprites (Mega Man should be among them)
let mmSlots = [];
step(60);

// Print ALL visible OAM
console.log('\nVisible OAM sprites:');
for (let s = 0; s < 64; s++) {
  const y = nes.ppu.spriteMem[s*4];
  if (y < 0xEF && y > 0) {
    const x = nes.ppu.spriteMem[s*4+3];
    const tile = nes.ppu.spriteMem[s*4+1];
    const attr = nes.ppu.spriteMem[s*4+2];
    console.log(`  Slot ${s.toString().padStart(2)}: X=${x.toString().padStart(3)} Y=${y.toString().padStart(3)} tile=$${tile.toString(16).padStart(2,'0')} attr=$${attr.toString(16).padStart(2,'0')}`);
  }
}

// Check sprite size mode
console.log(`\nSprite mode: ${nes.ppu.f_spriteSize === 0 ? '8x8' : '8x16'}`);

// Capture current frame
nes.frame();
savePNG(lastFrame, 'mm2-gameplay.png');

// ============================================================
// Try to identify Mega Man by moving and diffing
// ============================================================
console.log('\n=== Movement detection ===');
const save1 = nes.toJSON();

// Stand still for 30 frames
step(30);
const oamStill = [];
for (let s = 0; s < 64; s++) {
  oamStill.push({
    y: nes.ppu.spriteMem[s*4], x: nes.ppu.spriteMem[s*4+3],
    tile: nes.ppu.spriteMem[s*4+1], attr: nes.ppu.spriteMem[s*4+2]
  });
}

// Move right for 30 frames
nes.fromJSON(save1);
nes.buttonDown(1, Controller.BUTTON_RIGHT);
step(30);
nes.buttonUp(1, Controller.BUTTON_RIGHT);
const oamMoved = [];
for (let s = 0; s < 64; s++) {
  oamMoved.push({
    y: nes.ppu.spriteMem[s*4], x: nes.ppu.spriteMem[s*4+3],
    tile: nes.ppu.spriteMem[s*4+1], attr: nes.ppu.spriteMem[s*4+2]
  });
}

// Sprites that moved = Mega Man
console.log('Sprites that moved (likely Mega Man):');
for (let s = 0; s < 64; s++) {
  if (oamStill[s].y < 0xEF && oamMoved[s].y < 0xEF) {
    const dx = oamMoved[s].x - oamStill[s].x;
    if (Math.abs(dx) > 2 && Math.abs(dx) < 50) {
      console.log(`  Slot ${s}: moved dx=${dx}, tile=$${oamMoved[s].tile.toString(16).padStart(2,'0')} Y=${oamMoved[s].y}`);
      mmSlots.push(s);
    }
  }
}

// ============================================================
// If we found Mega Man, extract his tiles for multiple poses
// ============================================================
if (mmSlots.length > 0) {
  console.log(`\nMega Man uses ${mmSlots.length} OAM slots: [${mmSlots.join(',')}]`);

  // Capture standing pose
  nes.fromJSON(save1);
  step(5);
  console.log('\n=== STANDING POSE ===');
  const standTiles = [];
  for (const s of mmSlots) {
    const b = s * 4;
    const y = nes.ppu.spriteMem[b], x = nes.ppu.spriteMem[b+3];
    const tile = nes.ppu.spriteMem[b+1], attr = nes.ppu.spriteMem[b+2];
    console.log(`  Slot ${s}: X=${x} Y=${y} tile=$${tile.toString(16).padStart(2,'0')} attr=$${attr.toString(16).padStart(2,'0')}`);
    standTiles.push({ slot: s, x, y, tile, attr });
  }

  // In 8x16 mode, each OAM slot displays TWO 8x8 tiles (top and bottom)
  // Tile index: even → ptTile[idx] (top) + ptTile[idx+1] (bottom) from pattern table 0
  //             odd → from pattern table 1
  console.log('\nExtracting tile pixel data:');
  const allPoseTiles = {};

  function extractPoseTiles(label) {
    const pose = [];
    for (const s of mmSlots) {
      const b = s * 4;
      const y = nes.ppu.spriteMem[b], x = nes.ppu.spriteMem[b+3];
      const tile = nes.ppu.spriteMem[b+1], attr = nes.ppu.spriteMem[b+2];

      // In 8x16 mode: top tile = tile & 0xFE, bottom tile = (tile & 0xFE) + 1
      // Pattern table selected by bit 0 of tile index
      const topIdx = tile & 0xFE;
      const botIdx = topIdx + 1;
      // In jsnes, 8x16 tiles are in ptTile based on bank selection
      // Tile bit 0 = 0 → bank 0 (ptTile[0-255]), bit 0 = 1 → bank 1 (ptTile[256-511])
      const bankOffset = (tile & 1) ? 256 : 0;

      const topTile = nes.ppu.ptTile[bankOffset + topIdx];
      const botTile = nes.ppu.ptTile[bankOffset + botIdx];

      const topPix = topTile && topTile.pix ? Array.from(topTile.pix) : new Array(64).fill(0);
      const botPix = botTile && botTile.pix ? Array.from(botTile.pix) : new Array(64).fill(0);

      pose.push({
        slot: s, x, y, tile, attr,
        topIdx: bankOffset + topIdx,
        botIdx: bankOffset + botIdx,
        topPix, botPix
      });
    }
    allPoseTiles[label] = pose;
    return pose;
  }

  // STANDING
  extractPoseTiles('stand');

  // WALK FRAMES (capture 4 different frames while moving right)
  nes.fromJSON(save1);
  nes.buttonDown(1, Controller.BUTTON_RIGHT);
  const walkFrames = new Set();
  for (let f = 0; f < 40; f++) {
    nes.frame();
    // Identify the current walk frame by the tile indices
    const tileKey = mmSlots.map(s => nes.ppu.spriteMem[s*4+1].toString(16)).join(',');
    if (!walkFrames.has(tileKey)) {
      walkFrames.add(tileKey);
      extractPoseTiles(`walk_${walkFrames.size}`);
      console.log(`  Walk frame ${walkFrames.size}: tiles=[${tileKey}]`);
    }
  }
  nes.buttonUp(1, Controller.BUTTON_RIGHT);

  // JUMP
  nes.fromJSON(save1);
  nes.buttonDown(1, Controller.BUTTON_A);
  step(5);
  nes.buttonUp(1, Controller.BUTTON_A);
  step(5);
  extractPoseTiles('jump');
  const jumpTileKey = mmSlots.map(s => nes.ppu.spriteMem[s*4+1].toString(16)).join(',');
  console.log(`  Jump: tiles=[${jumpTileKey}]`);

  // ============================================================
  // Build output JSON
  // ============================================================
  // Find Mega Man's base position (top-left corner of his sprite)
  const firstPose = allPoseTiles['stand'];
  const baseX = Math.min(...firstPose.map(t => t.x));
  const baseY = Math.min(...firstPose.map(t => t.y));

  const output = { poses: {}, palette: {} };

  for (const [name, tiles] of Object.entries(allPoseTiles)) {
    output.poses[name] = {
      tiles: tiles.map(t => ({
        slot: t.slot,
        offsetX: t.x - baseX,
        offsetY: t.y - baseY,
        tileIndex: t.tile,
        attr: t.attr,
        topPix: t.topPix,
        botPix: t.botPix
      })),
    };
  }

  // Sprite palette
  console.log('\nSprite palettes:');
  for (let p = 0; p < 4; p++) {
    const base = 0x3F10 + p * 4;
    const cols = [];
    for (let c = 0; c < 4; c++) cols.push(nes.ppu.vramMem[base + c]);
    console.log(`  Palette ${p}: $${cols.map(c => c.toString(16).padStart(2,'0')).join(' $')}`);
    output.palette[`pal${p}`] = cols;
  }

  // Save
  const outPath = `${__dirname}/megaman-sprites.json`;
  fs.writeFileSync(outPath, JSON.stringify(output, null, 2));
  console.log(`\nSaved sprite data: ${outPath}`);
  console.log(`Poses: ${Object.keys(output.poses).join(', ')}`);
  console.log(`Total pose count: ${Object.keys(output.poses).length}`);

  // Print composite of standing pose for visual check
  console.log('\n=== Standing pose composite ===');
  const stand = allPoseTiles['stand'];
  // Sort by Y then X
  stand.sort((a, b) => a.y - b.y || a.x - b.x);
  for (const t of stand) {
    console.log(`Slot ${t.slot}: offset=(${t.x-baseX},${t.y-baseY}) tile=$${t.tile.toString(16)}`);
    // Print top 8x8
    for (let r = 0; r < 8; r++) console.log('  T: ' + t.topPix.slice(r*8, r*8+8).join(''));
    for (let r = 0; r < 8; r++) console.log('  B: ' + t.botPix.slice(r*8, r*8+8).join(''));
  }
} else {
  console.log('FAILED to identify Mega Man sprites. May not be in gameplay.');
  console.log('Trying alternative: dump all CHR tiles to find Mega Man visually.');
}
