/**
 * Extract Link's sprite tiles from The Legend of Zelda CHR-ROM.
 * Zelda 1 uses CHR-ROM (not CHR-RAM), so tiles are in the ROM file directly.
 * Link facing down (standing) is a 2x2 tile arrangement = 16x16 pixels.
 */
const fs = require('fs');
const { NES, Controller } = require('jsnes');
const { PNG } = require('pngjs');

const ZELDA_ROM = `${process.env.HOME}/nes-roms/Legend of Zelda, The (USA) (Rev 1).nes`;
const VAL_DIR = `${__dirname}/validation`;

// First, boot Zelda in jsnes and find Link's tiles from the sprite pattern table
let lastFrame = null;
const nes = new NES({
  onFrame: fb => { lastFrame = fb.slice(); },
  onAudioSample: () => {}
});
nes.loadROM(fs.readFileSync(ZELDA_ROM).toString('binary'));

// Check ROM header
const rom = fs.readFileSync(ZELDA_ROM);
const prgBanks = rom[4], chrBanks = rom[5];
const mapper = (rom[6] >> 4) | (rom[7] & 0xF0);
console.log(`Zelda: PRG=${prgBanks}x16KB CHR=${chrBanks}x8KB mapper=${mapper}`);
console.log(`CHR-ROM: ${chrBanks > 0 ? 'YES' : 'NO (CHR-RAM)'}`);

// Boot the game - need to get to gameplay to see Link's sprites
// Zelda: press START on title, then pick a save slot
for (let i = 0; i < 120; i++) nes.frame(); // title screen
nes.buttonDown(1, Controller.BUTTON_START); nes.frame(); nes.buttonUp(1, Controller.BUTTON_START);
for (let i = 0; i < 60; i++) nes.frame();
// Register screen - press START to select first slot
nes.buttonDown(1, Controller.BUTTON_START); nes.frame(); nes.buttonUp(1, Controller.BUTTON_START);
for (let i = 0; i < 30; i++) nes.frame();
// Select name entry or start - just press START a few more times
for (let attempt = 0; attempt < 5; attempt++) {
  nes.buttonDown(1, Controller.BUTTON_START); nes.frame(); nes.buttonUp(1, Controller.BUTTON_START);
  for (let i = 0; i < 60; i++) nes.frame();
}

// Now let's look at the sprite pattern table tiles
// In Zelda, sprites typically use pattern table 0 (ptTile[0-255])
// Link's facing-down tiles are well known: usually around tiles $00-$03 or similar

// Dump ALL non-empty sprite tiles and look for Link's recognizable shape
console.log('\n=== Scanning sprite pattern table for Link ===');
const candidates = [];
for (let tIdx = 0; tIdx < 256; tIdx++) {
  const tile = nes.ppu.ptTile[tIdx];
  if (!tile || !tile.pix) continue;
  // Count non-zero pixels
  let nonZero = 0;
  for (let p = 0; p < 64; p++) if (tile.pix[p] !== 0) nonZero++;
  if (nonZero > 10 && nonZero < 55) { // Not empty, not solid
    candidates.push({ idx: tIdx, nonZero });
  }
}
console.log(`Found ${candidates.length} non-trivial sprite tiles`);

// Also check what OAM sprites are visible - Link should be among them
console.log('\nVisible OAM sprites:');
for (let s = 0; s < 64; s++) {
  const y = nes.ppu.spriteMem[s*4];
  if (y < 0xEF && y > 0) {
    const x = nes.ppu.spriteMem[s*4+3];
    const tile = nes.ppu.spriteMem[s*4+1];
    const attr = nes.ppu.spriteMem[s*4+2];
    console.log(`  Slot ${s}: X=${x} Y=${y} tile=$${tile.toString(16).padStart(2,'0')} attr=$${attr.toString(16).padStart(2,'0')}`);
  }
}

// Zelda uses 8x16 sprite mode or 8x8? Check PPUCTRL bit 5
const ppuctrl = nes.ppu.f_spriteSize;
console.log(`\nSprite size mode: ${ppuctrl === 0 ? '8x8' : '8x16'}`);

// Let's directly extract Link's known tile indices.
// In Legend of Zelda, Link facing down uses tiles around $00-$03.
// The tile arrangement for facing down (8x8 mode) is:
//   Top-left=$00, Top-right=$02, Bottom-left=$01, Bottom-right=$03
// (NES sprites in Zelda use this column-first order)
// Let's try several known arrangements and print them.

function printTile(idx, label) {
  const tile = nes.ppu.ptTile[idx];
  if (!tile || !tile.pix) { console.log(`${label} ($${idx.toString(16)}): NO DATA`); return; }
  console.log(`${label} ($${idx.toString(16)}):`);
  for (let r = 0; r < 8; r++) {
    console.log('  ' + Array.from(tile.pix.slice(r*8, r*8+8)).join(''));
  }
}

// Try common Link tile indices for facing-down standing pose
console.log('\n=== Candidate Link tiles ===');
for (const base of [0x00, 0x02, 0x04, 0x20, 0x40, 0x60, 0x80]) {
  printTile(base, `Tile`);
  printTile(base+1, `Tile`);
  printTile(base+2, `Tile`);
  printTile(base+3, `Tile`);
  console.log('---');
}

// Save a frame for visual reference
function savePNG(fb, filename) {
  const png = new PNG({ width: 256, height: 240 });
  for (let i = 0; i < 256*240; i++) {
    const v = fb[i];
    png.data[i*4] = v & 0xFF; png.data[i*4+1] = (v>>8)&0xFF;
    png.data[i*4+2] = (v>>16)&0xFF; png.data[i*4+3] = 255;
  }
  fs.writeFileSync(`${VAL_DIR}/${filename}`, PNG.sync.write(png));
  console.log(`Saved: ${filename}`);
}
nes.frame();
savePNG(lastFrame, 'zelda-gameplay.png');

// Also check the sprite palette
console.log('\nSprite palettes:');
for (let p = 0; p < 4; p++) {
  const base = 0x3F10 + p * 4;
  const colors = [];
  for (let c = 0; c < 4; c++) colors.push('$' + nes.ppu.vramMem[base+c].toString(16).padStart(2,'0'));
  console.log(`  Palette ${p}: ${colors.join(' ')}`);
}
