/**
 * MM2 Active Probing — Find player position, HP, weapon damage table
 */
const fs = require('fs');
const { NES } = require('jsnes');
const { Controller } = require('jsnes');

const ROM_PATH = `${process.env.HOME}/nes-roms/Mega Man 2 (USA).nes`;
const romData = fs.readFileSync(ROM_PATH);

let lastFrame = null;
const nes = new NES({
  onFrame: fb => { lastFrame = fb; },
  onAudioSample: () => {}
});
nes.loadROM(romData.toString('binary'));

function step(n) { for (let i = 0; i < n; i++) nes.frame(); }
function ram(a) { return nes.cpu.mem[a]; }
function wram(a, v) { nes.cpu.mem[a] = v; }

// Boot to gameplay
console.log('Booting to gameplay...');
step(60);
nes.buttonDown(1, Controller.BUTTON_START);
step(1);
nes.buttonUp(1, Controller.BUTTON_START);
step(60);
// Select Normal mode
nes.buttonDown(1, Controller.BUTTON_START);
step(1);
nes.buttonUp(1, Controller.BUTTON_START);
step(120);
// Select stage (default)
nes.buttonDown(1, Controller.BUTTON_START);
step(1);
nes.buttonUp(1, Controller.BUTTON_START);
step(300);

console.log('State $2A:', ram(0x2A), 'Bank $29:', ram(0x29));

// Wait a bit more and try to move
step(120);
const gameState = nes.toJSON();

// ============================================================
// ACTIVE PROBING: Find player X by OAM correlation
// ============================================================
console.log('\n=== OAM-based player detection ===');

// Read all visible OAM sprites
console.log('Visible sprites:');
for (let s = 0; s < 64; s++) {
  const y = nes.ppu.spriteMem[s * 4];
  const x = nes.ppu.spriteMem[s * 4 + 3];
  if (y < 0xEF && y > 0) {
    const tile = nes.ppu.spriteMem[s * 4 + 1];
    const attr = nes.ppu.spriteMem[s * 4 + 2];
    console.log(`  Slot ${s}: x=${x} y=${y} tile=$${tile.toString(16)} attr=$${attr.toString(16)}`);
  }
}

// Move right and see which OAM sprites move
const beforeState = nes.toJSON();
const oamBefore = [];
for (let s = 0; s < 64; s++) {
  oamBefore.push({
    y: nes.ppu.spriteMem[s * 4],
    x: nes.ppu.spriteMem[s * 4 + 3]
  });
}

nes.buttonDown(1, Controller.BUTTON_RIGHT);
step(30);
nes.buttonUp(1, Controller.BUTTON_RIGHT);

console.log('\nOAM changes after moving right:');
for (let s = 0; s < 64; s++) {
  const newX = nes.ppu.spriteMem[s * 4 + 3];
  const newY = nes.ppu.spriteMem[s * 4];
  if (oamBefore[s].x !== newX && newY < 0xEF) {
    console.log(`  Slot ${s}: x ${oamBefore[s].x}→${newX} (delta=${newX - oamBefore[s].x})`);
  }
}

// Find the cluster of sprites that moved together (= player character)
// Then search RAM for matching X/Y values
const playerOamX = nes.ppu.spriteMem[0 * 4 + 3]; // First visible sprite likely player
const playerOamY = nes.ppu.spriteMem[0 * 4];
console.log(`\nLikely player OAM position: X=${playerOamX}, Y=${playerOamY}`);

// ============================================================
// Brute-force: write to candidate addresses, check OAM changes
// ============================================================
console.log('\n=== Write-probe for player X ===');
nes.fromJSON(gameState);
step(30);
const probeSave = nes.toJSON();

// Scan $00-$FF and $0400-$04FF for player X
for (const range of [[0x00, 0x100], [0x0400, 0x0500]]) {
  for (let addr = range[0]; addr < range[1]; addr++) {
    nes.fromJSON(probeSave);
    const origVal = ram(addr);
    wram(addr, origVal + 30);
    step(2);

    // Check if any OAM X moved by ~30
    let oamMoved = false;
    for (let s = 0; s < 8; s++) {
      const x = nes.ppu.spriteMem[s * 4 + 3];
      const diff = x - oamBefore[s].x;
      if (Math.abs(diff - 30) < 5 || Math.abs(diff + 30) < 5) {
        oamMoved = true;
        break;
      }
    }

    nes.fromJSON(probeSave);
    if (oamMoved) {
      console.log(`  $${addr.toString(16).padStart(4, '0')}: writing +30 moved OAM! (was ${origVal})`);
    }
  }
}

// ============================================================
// Brute-force: write to find player HP
// ============================================================
console.log('\n=== Write-probe for player HP ===');
nes.fromJSON(probeSave);
// HP in MM2 is typically 0-28 (full = 28, or 0x1C)
// Search for addresses with value 0x1C (28)
const hpCandidates = [];
for (let addr = 0; addr < 0x800; addr++) {
  if (ram(addr) === 0x1C) {
    hpCandidates.push(addr);
  }
}
console.log(`Addresses with value $1C (28 = full HP?): ${hpCandidates.length}`);
hpCandidates.forEach(a => console.log(`  $${a.toString(16).padStart(4, '0')}`));

// ============================================================
// Check OAM shadow area ($0200-$02FF) for player sprite layout
// ============================================================
console.log('\n=== OAM Shadow ($0200) ===');
nes.fromJSON(probeSave);
step(5);
console.log('First 16 OAM shadow entries:');
for (let s = 0; s < 16; s++) {
  const base = 0x0200 + s * 4;
  const y = ram(base);
  const tile = ram(base + 1);
  const attr = ram(base + 2);
  const x = ram(base + 3);
  if (y < 0xEF) {
    console.log(`  Slot ${s}: Y=${y} tile=$${tile.toString(16)} attr=$${attr.toString(16)} X=${x}`);
  }
}

// ============================================================
// Search for weapon damage table more precisely
// ============================================================
console.log('\n=== Weapon damage table search ===');
const prgRom = fs.readFileSync(ROM_PATH).slice(16, 16 + 262144);

// Known MM2 weakness info: each boss is weak to one weapon that does high damage
// Buster does 1 damage to most. Special weapons do 1-4 normally, weakness does more.
// Metal Blade is special — does 4 damage to almost everything.
// Look for 8×9 or 9×8 damage matrix (8 bosses × 9 weapons including buster)
// Or 11 weapons × bosses if crash bombs etc count

// Known approximate damage values from gameplay:
// Heat Man: weak to Bubble Lead (4 hits = 7 damage each = 28 total)
// Air Man: weak to Leaf Shield (one hit kill? or high damage)
// Most weaknesses do ~4-7 per hit

// Search for a table where most values are 0-2 but each "row" has one high value
// in banks 9-14 (code banks)
console.log('Searching banks 9-14 for damage table pattern...');
for (let bank = 9; bank < 15; bank++) {
  const bankOffset = bank * 16384;
  const bankData = prgRom.slice(bankOffset, bankOffset + 16384);

  for (let i = 0; i < bankData.length - 80; i++) {
    // Check for 8 "rows" of 9-11 bytes each where most are 0-4 but some are > 4
    let rows = 0;
    let totalHigh = 0;
    for (let row = 0; row < 8; row++) {
      const offset = i + row * 11;
      if (offset + 11 > bankData.length) break;
      let lowCount = 0, highCount = 0;
      for (let col = 0; col < 11; col++) {
        const v = bankData[offset + col];
        if (v <= 4) lowCount++;
        else if (v >= 4 && v <= 28) highCount++;
        else break; // Value out of range
      }
      if (lowCount >= 6 && highCount >= 1) {
        rows++;
        totalHigh += highCount;
      }
    }
    if (rows >= 6 && totalHigh >= 6) {
      const cpuAddr = 0x8000 + i;
      console.log(`  Bank ${bank} $${cpuAddr.toString(16).toUpperCase()}:`);
      for (let row = 0; row < 8; row++) {
        const offset = i + row * 11;
        if (offset + 11 > bankData.length) break;
        const vals = [];
        for (let col = 0; col < 11; col++) vals.push(bankData[offset + col]);
        console.log(`    Row ${row}: ${vals.map(v => v.toString(16).padStart(2, '0')).join(' ')}`);
      }
      break; // Found it
    }
  }
}

// Also try stride of 8 (8 bosses, each weapon is a column)
console.log('\nSearching with stride=8...');
for (let bank = 9; bank < 15; bank++) {
  const bankOffset = bank * 16384;
  const bankData = prgRom.slice(bankOffset, bankOffset + 16384);

  for (let i = 0; i < bankData.length - 72; i++) {
    let rows = 0;
    for (let row = 0; row < 9; row++) {
      const offset = i + row * 8;
      let lowCount = 0, highCount = 0;
      for (let col = 0; col < 8; col++) {
        const v = bankData[offset + col];
        if (v <= 3) lowCount++;
        else if (v >= 4 && v <= 28) highCount++;
      }
      if (lowCount >= 4 && highCount >= 1 && lowCount + highCount === 8) rows++;
    }
    if (rows >= 7) {
      const cpuAddr = 0x8000 + i;
      console.log(`  Bank ${bank} $${cpuAddr.toString(16).toUpperCase()} (stride 8):`);
      for (let row = 0; row < 9; row++) {
        const offset = i + row * 8;
        const vals = [];
        for (let col = 0; col < 8; col++) vals.push(bankData[offset + col]);
        console.log(`    ${vals.map(v => v.toString(16).padStart(2, '0')).join(' ')}`);
      }
      break;
    }
  }
}

console.log('\n=== Probe complete ===');
