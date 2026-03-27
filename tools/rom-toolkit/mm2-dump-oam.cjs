/**
 * Boot MM2 to Metal Man's stage, freeze, dump ALL 64 OAM entries,
 * identify Mega Man, print each tile as ASCII art.
 */
const fs = require('fs');
const { NES, Controller } = require('jsnes');
const nes = new NES({ onFrame: () => {}, onAudioSample: () => {} });
nes.loadROM(fs.readFileSync(`${process.env.HOME}/nes-roms/Mega Man 2 (USA).nes`).toString('binary'));

function step(n) { for (let i = 0; i < n; i++) nes.frame(); }

// ============================================================
// Navigate to Metal Man's stage
// ============================================================
console.log('Booting MM2...');
step(30);
// Press START through intro/title/menus
for (let i = 0; i < 8; i++) {
  nes.buttonDown(1, Controller.BUTTON_START); step(1);
  nes.buttonUp(1, Controller.BUTTON_START); step(60);
}
// On stage select. Metal Man is bottom-left.
// From center (Dr. Wily), press DOWN then LEFT.
nes.buttonDown(1, Controller.BUTTON_DOWN); step(1);
nes.buttonUp(1, Controller.BUTTON_DOWN); step(10);
nes.buttonDown(1, Controller.BUTTON_LEFT); step(1);
nes.buttonUp(1, Controller.BUTTON_LEFT); step(10);

// Select stage
nes.buttonDown(1, Controller.BUTTON_START); step(1);
nes.buttonUp(1, Controller.BUTTON_START);
step(1800); // Wait for stage to fully load

console.log('State $2A:', nes.cpu.mem[0x2A]);
console.log('Sprite mode:', nes.ppu.f_spriteSize === 0 ? '8x8' : '8x16');

// Stand still for a moment to stabilize
step(60);

// ============================================================
// DUMP ALL 64 OAM ENTRIES
// ============================================================
console.log('\n====================================');
console.log('ALL 64 OAM ENTRIES');
console.log('====================================');
console.log('Slot  Y   Tile  Attr  X   | Pal Hflip Vflip Pri');
console.log('----  ---  ----  ----  --- | --- ----- ----- ---');
for (let s = 0; s < 64; s++) {
  const y    = nes.ppu.spriteMem[s*4];
  const tile = nes.ppu.spriteMem[s*4+1];
  const attr = nes.ppu.spriteMem[s*4+2];
  const x    = nes.ppu.spriteMem[s*4+3];
  const pal   = attr & 3;
  const hflip = (attr >> 6) & 1;
  const vflip = (attr >> 7) & 1;
  const pri   = (attr >> 5) & 1;
  const vis = (y > 0 && y < 0xEF) ? '' : ' (hidden)';
  console.log(
    `  ${s.toString().padStart(2)}  ${y.toString().padStart(3)}  $${tile.toString(16).padStart(2,'0')}   $${attr.toString(16).padStart(2,'0')}  ${x.toString().padStart(3)}` +
    ` |  ${pal}    ${hflip}      ${vflip}     ${pri}${vis}`
  );
}

// ============================================================
// IDENTIFY MEGA MAN
// Find the cluster of visible sprites that share similar attributes
// and are near each other spatially (not the health bar tiles $87)
// ============================================================
console.log('\n====================================');
console.log('VISIBLE SPRITES (Y < 0xEF, Y > 0)');
console.log('====================================');
const visible = [];
for (let s = 0; s < 64; s++) {
  const y = nes.ppu.spriteMem[s*4];
  if (y > 0 && y < 0xEF) {
    visible.push({
      slot: s,
      y, x: nes.ppu.spriteMem[s*4+3],
      tile: nes.ppu.spriteMem[s*4+1],
      attr: nes.ppu.spriteMem[s*4+2]
    });
  }
}
visible.forEach(s => {
  console.log(`  Slot ${s.slot.toString().padStart(2)}: X=${s.x.toString().padStart(3)} Y=${s.y.toString().padStart(3)} tile=$${s.tile.toString(16).padStart(2,'0')} attr=$${s.attr.toString(16).padStart(2,'0')}`);
});

// Mega Man sprites: exclude the health bar (all same tile like $87, at X=24)
// and any other non-player sprites
const healthBar = visible.filter(s => s.tile === 0x87 || s.x <= 30);
const nonHealth = visible.filter(s => s.tile !== 0x87 && s.x > 30);

console.log(`\nHealth bar sprites: ${healthBar.length}`);
console.log(`Non-health sprites: ${nonHealth.length}`);

// Among non-health sprites, find the cluster (Mega Man should be the
// tightest spatial cluster with shared attributes)
if (nonHealth.length > 0) {
  // Sort by Y then X
  nonHealth.sort((a, b) => a.y - b.y || a.x - b.x);

  const minX = Math.min(...nonHealth.map(s => s.x));
  const maxX = Math.max(...nonHealth.map(s => s.x));
  const minY = Math.min(...nonHealth.map(s => s.y));
  const maxY = Math.max(...nonHealth.map(s => s.y));

  console.log('\n====================================');
  console.log(`MEGA MAN SPRITES (${nonHealth.length} tiles)`);
  console.log(`Bounding box: X=[${minX}..${maxX+8}] Y=[${minY}..${maxY+8}]`);
  console.log(`Size: ${maxX-minX+8}w × ${maxY-minY+8}h pixels`);
  console.log('====================================');

  // ============================================================
  // DUMP EACH TILE AS ASCII ART
  // ============================================================
  for (const sp of nonHealth) {
    const offX = sp.x - minX;
    const offY = sp.y - minY;
    const t = nes.ppu.ptTile[sp.tile];
    const nonZero = t && t.pix ? Array.from(t.pix).filter(v => v !== 0).length : 0;

    console.log(`\n--- Slot ${sp.slot}: tile=$${sp.tile.toString(16).padStart(2,'0')} at offset (${offX}, ${offY}) — ${nonZero}/64 pixels ---`);

    if (t && t.pix) {
      for (let r = 0; r < 8; r++) {
        let row = '  ';
        for (let c = 0; c < 8; c++) {
          const px = t.pix[r * 8 + c];
          row += px === 0 ? '.' : px.toString();
        }
        console.log(row);
      }
    } else {
      console.log('  (NO TILE DATA)');
    }
  }

  // ============================================================
  // RENDER FULL COMPOSITE
  // ============================================================
  const cw = maxX - minX + 8;
  const ch = maxY - minY + 8;
  const canvas = Array.from({length: ch}, () => new Array(cw).fill('.'));

  for (const sp of nonHealth) {
    const t = nes.ppu.ptTile[sp.tile];
    if (!t || !t.pix) continue;
    const ox = sp.x - minX;
    const oy = sp.y - minY;
    const hflip = (sp.attr >> 6) & 1;

    for (let r = 0; r < 8; r++) {
      for (let c = 0; c < 8; c++) {
        const srcC = hflip ? (7 - c) : c;
        const px = t.pix[r * 8 + srcC];
        if (px !== 0 && (oy + r) < ch && (ox + c) < cw) {
          canvas[oy + r][ox + c] = px.toString();
        }
      }
    }
  }

  console.log('\n====================================');
  console.log(`FULL COMPOSITE (${cw}x${ch}, with H-flip applied)`);
  console.log('====================================');
  for (let r = 0; r < ch; r++) {
    console.log('  ' + canvas[r].join(''));
  }

  // ============================================================
  // OUTPUT TILE DATA FOR SMB INJECTION
  // ============================================================
  console.log('\n====================================');
  console.log('TILE DATA FOR INJECTION');
  console.log('====================================');
  console.log('const MM_TILES = [');
  for (const sp of nonHealth) {
    const t = nes.ppu.ptTile[sp.tile];
    const px = t && t.pix ? Array.from(t.pix) : new Array(64).fill(0);
    console.log(`  { dx: ${sp.x - minX}, dy: ${sp.y - minY}, px: [${px.join(',')}] }, // slot ${sp.slot}, tile $${sp.tile.toString(16).padStart(2,'0')}`);
  }
  console.log('];');

  // Palette
  console.log('\nconst MM_PAL_NORMAL = [0x0F, ' +
    `0x${nes.ppu.vramMem[0x3F11].toString(16).padStart(2,'0')}, ` +
    `0x${nes.ppu.vramMem[0x3F12].toString(16).padStart(2,'0')}, ` +
    `0x${nes.ppu.vramMem[0x3F13].toString(16).padStart(2,'0')}];`);
}
