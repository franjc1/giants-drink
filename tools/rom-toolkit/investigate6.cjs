/**
 * Investigation Round 6: ROM-level area pointer system for level warping
 * Read the ROM tables to understand how world/level maps to area data
 */
const fs = require('fs');
const { NES } = require('jsnes');
const { Controller } = require('jsnes');

const ROM_PATH = `${process.env.HOME}/nes-roms/Super Mario Bros. (World).nes`;
const romData = fs.readFileSync(ROM_PATH);

let lastFrame = null;
const nes = new NES({
  onFrame: fb => { lastFrame = fb.slice(); },
  onAudioSample: () => {}
});
nes.loadROM(romData.toString('binary'));

function step(n) { for (let i = 0; i < n; i++) nes.frame(); }
function ram(a) { return nes.cpu.mem[a]; }
function wram(a, v) { nes.cpu.mem[a] = v; }

// Helper: read from CPU address space (includes ROM at $8000-$FFFF)
function cpuRead(addr) { return nes.cpu.mem[addr]; }

// Boot to gameplay
step(60);
nes.buttonDown(1, Controller.BUTTON_START);
step(1);
nes.buttonUp(1, Controller.BUTTON_START);
step(180);
const gameplayState = nes.toJSON();

// ============================================================
// EXPERIMENT 31: Read ROM level tables
// ============================================================
console.log('=== EXPERIMENT 31: ROM level mapping tables ===');

// From SMB1 disassembly:
// WorldAddrOffsets at $9CB4 (maps to CPU $9CB4)
// AreaAddrOffsets at $9CBC (40 entries)
// AreaType bases at $9D28 (4 bytes)
// Area object pointer lo at $9D2C, hi at $9D4E

// Read these tables
console.log('WorldAddrOffsets ($9CB4, 8 bytes - one per world):');
for (let w = 0; w < 8; w++) {
  console.log(`  World ${w+1}: offset=${cpuRead(0x9CB4 + w)}`);
}

console.log('\nAreaAddrOffsets ($9CBC, 40+ entries):');
for (let i = 0; i < 40; i++) {
  const byte = cpuRead(0x9CBC + i);
  const aoIdx = (byte >> 5) & 0x3;
  const offset = byte & 0x1F;
  console.log(`  Entry ${i}: raw=0x${byte.toString(16).padStart(2,'0')} ao_idx=${aoIdx} offset=${offset}`);
}

console.log('\nAreaType bases ($9D28, 4 bytes):');
for (let i = 0; i < 4; i++) {
  console.log(`  Type ${i}: base=${cpuRead(0x9D28 + i)}`);
}

// Now compute the area pointer for different world/levels
console.log('\n--- Computing area pointers ---');
for (let world = 0; world < 8; world++) {
  const worldBase = cpuRead(0x9CB4 + world);
  for (let level = 0; level < 4; level++) {
    const entryIdx = worldBase + level;
    if (entryIdx >= 40) break;
    const byte = cpuRead(0x9CBC + entryIdx);
    const aoIdx = (byte >> 5) & 0x3;
    const offset = byte & 0x1F;
    const typeBase = cpuRead(0x9D28 + aoIdx);
    const areaPtr = typeBase + offset;
    console.log(`  W${world+1}-${level+1}: entry[${entryIdx}]=0x${byte.toString(16)} → aoIdx=${aoIdx}, offset=${offset}, typeBase=${typeBase}, areaPtr=${areaPtr}`);
  }
}

// ============================================================
// EXPERIMENT 32: Find which RAM address holds the area pointer
// ============================================================
console.log('\n=== EXPERIMENT 32: Finding area pointer in RAM ===');

// In the SMB disassembly, the current area pointer is likely stored in RAM
// Scan $0748-$0770 area for the expected W1-1 area pointer
// W1-1: from computation above, should be areaPtr=some value

// First compute W1-1's area pointer
const w11_worldBase = cpuRead(0x9CB4 + 0); // World 1
const w11_entry = cpuRead(0x9CBC + w11_worldBase); // Level 1 entry
const w11_aoIdx = (w11_entry >> 5) & 0x3;
const w11_offset = w11_entry & 0x1F;
const w11_typeBase = cpuRead(0x9D28 + w11_aoIdx);
const w11_areaPtr = w11_typeBase + w11_offset;
console.log(`W1-1 area pointer should be: ${w11_areaPtr} (0x${w11_areaPtr.toString(16)})`);

// Search RAM for this value
console.log('Searching RAM $0740-$07FF for area pointer value:');
for (let addr = 0x0740; addr < 0x0800; addr++) {
  if (ram(addr) === w11_areaPtr) {
    console.log(`  $${addr.toString(16)}: ${ram(addr)} ← MATCH`);
  }
}

// Also search lower RAM
console.log('Searching RAM $0000-$00FF:');
for (let addr = 0; addr < 0x100; addr++) {
  if (ram(addr) === w11_areaPtr) {
    console.log(`  $${addr.toString(16)}: ${ram(addr)} ← MATCH`);
  }
}

// Also try common area pointer addresses from SMB disassemblies
// $074E = AreaPointer? Let's check
console.log('\nKey addresses:');
console.log('$074E:', ram(0x074E), '$074F:', ram(0x074F));
console.log('$0750:', ram(0x0750));
console.log('$0751:', ram(0x0751));

// ============================================================
// EXPERIMENT 33: Warp by setting area pointer + OperMode_Task
// ============================================================
console.log('\n=== EXPERIMENT 33: Warp with area pointer ===');

// Compute W4-1 area pointer
const w41_worldBase = cpuRead(0x9CB4 + 3); // World 4
const w41_entry = cpuRead(0x9CBC + w41_worldBase);
const w41_aoIdx = (w41_entry >> 5) & 0x3;
const w41_offset = w41_entry & 0x1F;
const w41_typeBase = cpuRead(0x9D28 + w41_aoIdx);
const w41_areaPtr = w41_typeBase + w41_offset;
console.log(`W4-1 area pointer: ${w41_areaPtr} (0x${w41_areaPtr.toString(16)})`);

// Try setting the area pointer at various candidate addresses
const candidates = [0x074E, 0x0750];
for (const addr of candidates) {
  nes.fromJSON(gameplayState);
  const origVal = ram(addr);

  wram(0x075F, 3); // World 4
  wram(0x0760, 0); // Level 1
  wram(addr, w41_areaPtr); // Set area pointer
  wram(0x0772, 0); // Reset to InitializeArea

  step(300);

  // Check nametable for differences
  let groundRow = '';
  for (let col = 0; col < 16; col++) {
    groundRow += nes.ppu.vramMem[0x2000 + 24 * 32 + col].toString(16).padStart(2, '0') + ' ';
  }

  console.log(`  $${addr.toString(16)}=${w41_areaPtr} (was ${origVal}): W${ram(0x075F)+1}-${ram(0x0760)+1}, NT row24: ${groundRow}`);
}

// Compare with the W1-1 nametable
nes.fromJSON(gameplayState);
let w11_groundRow = '';
for (let col = 0; col < 16; col++) {
  w11_groundRow += nes.ppu.vramMem[0x2000 + 24 * 32 + col].toString(16).padStart(2, '0') + ' ';
}
console.log('  W1-1 reference NT row24:', w11_groundRow);

// ============================================================
// EXPERIMENT 34: Compare natural level loads
// ============================================================
console.log('\n=== EXPERIMENT 34: Natural level comparison ===');

// Let's find the REAL differences between levels by observing a natural transition
// Play through to the end of W1-1 (hit the flagpole)
// But that takes too long...

// Alternative: track which RAM addresses change between the initial boot state
// and gameplay state. The area-related addresses should be among them.

// Let me try: compare RAM between W1-1 gameplay and a game that somehow gets to W1-2
// We know entering a pipe goes to W1-2 underground

// Actually, let me try the simplest possible thing:
// Set $075F=3, $0760=0, then do a FULL game reset via $0770=0
// and press start to get a new game starting at world 4
nes.loadROM(romData.toString('binary'));
step(30);

// At title screen, set world number
wram(0x075F, 3); // World 4
step(30);

// Press start
nes.buttonDown(1, Controller.BUTTON_START);
step(1);
nes.buttonUp(1, Controller.BUTTON_START);

// Continuously write world number during boot
for (let i = 0; i < 200; i++) {
  wram(0x075F, 3);
  nes.frame();
}

console.log('Title→boot with W4: W' + (ram(0x075F)+1) + '-' + (ram(0x0760)+1));
console.log('$0770=' + ram(0x0770) + ' $0772=' + ram(0x0772));

// Check unique nametable signature
let ntRow20 = '';
for (let col = 0; col < 16; col++) {
  ntRow20 += nes.ppu.vramMem[0x2000 + 20 * 32 + col].toString(16).padStart(2, '0') + ' ';
}
console.log('NT row 20:', ntRow20);

// ============================================================
// EXPERIMENT 35: Direct comparison — what RAM differs between worlds?
// ============================================================
console.log('\n=== EXPERIMENT 35: RAM comparison between levels ===');

// Boot a normal game (W1-1)
nes.loadROM(romData.toString('binary'));
step(60);
nes.buttonDown(1, Controller.BUTTON_START);
step(1);
nes.buttonUp(1, Controller.BUTTON_START);
step(180);
const w11_snap = new Uint8Array(0x800);
for (let i = 0; i < 0x800; i++) w11_snap[i] = ram(i);

// Boot with persistent W4 write
nes.loadROM(romData.toString('binary'));
step(60);
nes.buttonDown(1, Controller.BUTTON_START);
step(1);
nes.buttonUp(1, Controller.BUTTON_START);
for (let i = 0; i < 180; i++) { wram(0x075F, 3); nes.frame(); }
const w41_snap = new Uint8Array(0x800);
for (let i = 0; i < 0x800; i++) w41_snap[i] = ram(i);

console.log('RAM differences between W1-1 and "W4-1":');
for (let i = 0; i < 0x800; i++) {
  if (w11_snap[i] !== w41_snap[i]) {
    console.log(`  $${i.toString(16).padStart(4,'0')}: W1-1=${w11_snap[i]} vs W4-1=${w41_snap[i]}`);
  }
}

// Now check nametable differences (PPU VRAM)
let ntDiffs = 0;
for (let i = 0x2000; i < 0x2400; i++) {
  // Can't easily compare since both are current state...
  // Let me just print if they're the same
}

console.log('\n=== Investigation Round 6 complete ===');
