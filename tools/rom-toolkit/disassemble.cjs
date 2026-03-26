/**
 * 6502 Disassembler for NES PRG-ROM
 * Extracts PRG-ROM from iNES file, disassembles all 32KB.
 * Output: tools/rom-toolkit/smb-disasm.asm
 */
const fs = require('fs');

const ROM_PATH = `${process.env.HOME}/nes-roms/Super Mario Bros. (World).nes`;
const OUTPUT_PATH = `${__dirname}/smb-disasm.asm`;

// ============================================================
// 6502 Opcode Table
// Format: [mnemonic, addressing_mode, bytes]
// Addressing modes: imp, acc, imm, zpg, zpx, zpy, abs, abx, aby, ind, izx, izy, rel
// ============================================================
const OPCODES = {
  0x00: ['BRK', 'imp', 1], 0x01: ['ORA', 'izx', 2], 0x05: ['ORA', 'zpg', 2],
  0x06: ['ASL', 'zpg', 2], 0x08: ['PHP', 'imp', 1], 0x09: ['ORA', 'imm', 2],
  0x0A: ['ASL', 'acc', 1], 0x0D: ['ORA', 'abs', 3], 0x0E: ['ASL', 'abs', 3],
  0x10: ['BPL', 'rel', 2], 0x11: ['ORA', 'izy', 2], 0x15: ['ORA', 'zpx', 2],
  0x16: ['ASL', 'zpx', 2], 0x18: ['CLC', 'imp', 1], 0x19: ['ORA', 'aby', 3],
  0x1D: ['ORA', 'abx', 3], 0x1E: ['ASL', 'abx', 3],
  0x20: ['JSR', 'abs', 3], 0x21: ['AND', 'izx', 2], 0x24: ['BIT', 'zpg', 2],
  0x25: ['AND', 'zpg', 2], 0x26: ['ROL', 'zpg', 2], 0x28: ['PLP', 'imp', 1],
  0x29: ['AND', 'imm', 2], 0x2A: ['ROL', 'acc', 1], 0x2C: ['BIT', 'abs', 3],
  0x2D: ['AND', 'abs', 3], 0x2E: ['ROL', 'abs', 3],
  0x30: ['BMI', 'rel', 2], 0x31: ['AND', 'izy', 2], 0x35: ['AND', 'zpx', 2],
  0x36: ['ROL', 'zpx', 2], 0x38: ['SEC', 'imp', 1], 0x39: ['AND', 'aby', 3],
  0x3D: ['AND', 'abx', 3], 0x3E: ['ROL', 'abx', 3],
  0x40: ['RTI', 'imp', 1], 0x41: ['EOR', 'izx', 2], 0x45: ['EOR', 'zpg', 2],
  0x46: ['LSR', 'zpg', 2], 0x48: ['PHA', 'imp', 1], 0x49: ['EOR', 'imm', 2],
  0x4A: ['LSR', 'acc', 1], 0x4C: ['JMP', 'abs', 3], 0x4D: ['EOR', 'abs', 3],
  0x4E: ['LSR', 'abs', 3],
  0x50: ['BVC', 'rel', 2], 0x51: ['EOR', 'izy', 2], 0x55: ['EOR', 'zpx', 2],
  0x56: ['LSR', 'zpx', 2], 0x58: ['CLI', 'imp', 1], 0x59: ['EOR', 'aby', 3],
  0x5D: ['EOR', 'abx', 3], 0x5E: ['LSR', 'abx', 3],
  0x60: ['RTS', 'imp', 1], 0x61: ['ADC', 'izx', 2], 0x65: ['ADC', 'zpg', 2],
  0x66: ['ROR', 'zpg', 2], 0x68: ['PLA', 'imp', 1], 0x69: ['ADC', 'imm', 2],
  0x6A: ['ROR', 'acc', 1], 0x6C: ['JMP', 'ind', 3], 0x6D: ['ADC', 'abs', 3],
  0x6E: ['ROR', 'abs', 3],
  0x70: ['BVS', 'rel', 2], 0x71: ['ADC', 'izy', 2], 0x75: ['ADC', 'zpx', 2],
  0x76: ['ROR', 'zpx', 2], 0x78: ['SEI', 'imp', 1], 0x79: ['ADC', 'aby', 3],
  0x7D: ['ADC', 'abx', 3], 0x7E: ['ROR', 'abx', 3],
  0x81: ['STA', 'izx', 2], 0x84: ['STY', 'zpg', 2], 0x85: ['STA', 'zpg', 2],
  0x86: ['STX', 'zpg', 2], 0x88: ['DEY', 'imp', 1], 0x8A: ['TXA', 'imp', 1],
  0x8C: ['STY', 'abs', 3], 0x8D: ['STA', 'abs', 3], 0x8E: ['STX', 'abs', 3],
  0x90: ['BCC', 'rel', 2], 0x91: ['STA', 'izy', 2], 0x94: ['STY', 'zpx', 2],
  0x95: ['STA', 'zpx', 2], 0x96: ['STX', 'zpy', 2], 0x98: ['TYA', 'imp', 1],
  0x99: ['STA', 'aby', 3], 0x9A: ['TXS', 'imp', 1], 0x9D: ['STA', 'abx', 3],
  0xA0: ['LDY', 'imm', 2], 0xA1: ['LDA', 'izx', 2], 0xA2: ['LDX', 'imm', 2],
  0xA4: ['LDY', 'zpg', 2], 0xA5: ['LDA', 'zpg', 2], 0xA6: ['LDX', 'zpg', 2],
  0xA8: ['TAY', 'imp', 1], 0xA9: ['LDA', 'imm', 2], 0xAA: ['TAX', 'imp', 1],
  0xAC: ['LDY', 'abs', 3], 0xAD: ['LDA', 'abs', 3], 0xAE: ['LDX', 'abs', 3],
  0xB0: ['BCS', 'rel', 2], 0xB1: ['LDA', 'izy', 2], 0xB4: ['LDY', 'zpx', 2],
  0xB5: ['LDA', 'zpx', 2], 0xB6: ['LDX', 'zpy', 2], 0xB8: ['CLV', 'imp', 1],
  0xB9: ['LDA', 'aby', 3], 0xBA: ['TSX', 'imp', 1], 0xBC: ['LDY', 'abx', 3],
  0xBD: ['LDA', 'abx', 3], 0xBE: ['LDX', 'aby', 3],
  0xC0: ['CPY', 'imm', 2], 0xC1: ['CMP', 'izx', 2], 0xC4: ['CPY', 'zpg', 2],
  0xC5: ['CMP', 'zpg', 2], 0xC6: ['DEC', 'zpg', 2], 0xC8: ['INY', 'imp', 1],
  0xC9: ['CMP', 'imm', 2], 0xCA: ['DEX', 'imp', 1], 0xCC: ['CPY', 'abs', 3],
  0xCD: ['CMP', 'abs', 3], 0xCE: ['DEC', 'abs', 3],
  0xD0: ['BNE', 'rel', 2], 0xD1: ['CMP', 'izy', 2], 0xD5: ['CMP', 'zpx', 2],
  0xD6: ['DEC', 'zpx', 2], 0xD8: ['CLD', 'imp', 1], 0xD9: ['CMP', 'aby', 3],
  0xDD: ['CMP', 'abx', 3], 0xDE: ['DEC', 'abx', 3],
  0xE0: ['CPX', 'imm', 2], 0xE1: ['SBC', 'izx', 2], 0xE4: ['CPX', 'zpg', 2],
  0xE5: ['SBC', 'zpg', 2], 0xE6: ['INC', 'zpg', 2], 0xE8: ['INX', 'imp', 1],
  0xE9: ['SBC', 'imm', 2], 0xEA: ['NOP', 'imp', 1], 0xEC: ['CPX', 'abs', 3],
  0xED: ['SBC', 'abs', 3], 0xEE: ['INC', 'abs', 3],
  0xF0: ['BEQ', 'rel', 2], 0xF1: ['SBC', 'izy', 2], 0xF5: ['SBC', 'zpx', 2],
  0xF6: ['INC', 'zpx', 2], 0xF8: ['SED', 'imp', 1], 0xF9: ['SBC', 'aby', 3],
  0xFD: ['SBC', 'abx', 3], 0xFE: ['INC', 'abx', 3],
};

// ============================================================
// Load and parse iNES ROM
// ============================================================
const rom = fs.readFileSync(ROM_PATH);
console.log(`ROM size: ${rom.length} bytes`);

// Parse iNES header
const magic = rom.slice(0, 4).toString('ascii');
console.log(`Magic: ${magic}`);
const prgBanks = rom[4]; // 16KB banks
const chrBanks = rom[5]; // 8KB banks
console.log(`PRG banks: ${prgBanks} (${prgBanks * 16}KB)`);
console.log(`CHR banks: ${chrBanks} (${chrBanks * 8}KB)`);

// Extract PRG-ROM
const PRG_START = 16; // After header
const PRG_SIZE = prgBanks * 16384;
const prg = rom.slice(PRG_START, PRG_START + PRG_SIZE);
console.log(`PRG-ROM: ${prg.length} bytes (offset ${PRG_START}-${PRG_START + PRG_SIZE - 1})`);

// For a 32KB PRG mapped at $8000-$FFFF:
const BASE_ADDR = 0x8000;

// Read vectors
const resetVec = prg[0x7FFC] | (prg[0x7FFD] << 8);
const nmiVec = prg[0x7FFA] | (prg[0x7FFB] << 8);
const irqVec = prg[0x7FFE] | (prg[0x7FFF] << 8);
console.log(`Reset vector: $${resetVec.toString(16).toUpperCase()}`);
console.log(`NMI vector:   $${nmiVec.toString(16).toUpperCase()}`);
console.log(`IRQ vector:   $${irqVec.toString(16).toUpperCase()}`);

// ============================================================
// Disassemble
// ============================================================
function formatAddr(a) { return '$' + a.toString(16).toUpperCase().padStart(4, '0'); }
function formatByte(b) { return b.toString(16).toUpperCase().padStart(2, '0'); }

function disassembleAt(pc) {
  const offset = pc - BASE_ADDR;
  if (offset < 0 || offset >= PRG_SIZE) return null;

  const opcode = prg[offset];
  const info = OPCODES[opcode];

  if (!info) {
    return { addr: pc, bytes: [opcode], text: `.db $${formatByte(opcode)}`, size: 1, illegal: true };
  }

  const [mnemonic, mode, size] = info;
  const bytes = [];
  for (let i = 0; i < size; i++) bytes.push(prg[offset + i]);

  let operand = '';
  if (size === 2) {
    const val = prg[offset + 1];
    switch (mode) {
      case 'imm': operand = `#$${formatByte(val)}`; break;
      case 'zpg': operand = `$${formatByte(val)}`; break;
      case 'zpx': operand = `$${formatByte(val)},X`; break;
      case 'zpy': operand = `$${formatByte(val)},Y`; break;
      case 'izx': operand = `($${formatByte(val)},X)`; break;
      case 'izy': operand = `($${formatByte(val)}),Y`; break;
      case 'rel': {
        const offset8 = val > 127 ? val - 256 : val;
        const target = pc + 2 + offset8;
        operand = `${formatAddr(target)}`;
        break;
      }
    }
  } else if (size === 3) {
    const lo = prg[offset + 1];
    const hi = prg[offset + 2];
    const val16 = lo | (hi << 8);
    switch (mode) {
      case 'abs': operand = `${formatAddr(val16)}`; break;
      case 'abx': operand = `${formatAddr(val16)},X`; break;
      case 'aby': operand = `${formatAddr(val16)},Y`; break;
      case 'ind': operand = `(${formatAddr(val16)})`; break;
    }
  }

  const text = operand ? `${mnemonic} ${operand}` : mnemonic;
  return { addr: pc, bytes, text, size, mnemonic, mode, illegal: false };
}

// Linear sweep disassembly of the entire PRG-ROM
const lines = [];
lines.push(`; Super Mario Bros. PRG-ROM Disassembly`);
lines.push(`; Generated by disassemble.cjs`);
lines.push(`; PRG-ROM: 32KB mapped at $8000-$FFFF`);
lines.push(`; Reset vector: ${formatAddr(resetVec)}`);
lines.push(`; NMI vector:   ${formatAddr(nmiVec)}`);
lines.push(`; IRQ vector:   ${formatAddr(irqVec)}`);
lines.push(``);

// Add vector labels
const vectorLabels = {};
vectorLabels[resetVec] = 'RESET';
vectorLabels[nmiVec] = 'NMI';
vectorLabels[irqVec] = 'IRQ';

// Collect all branch/jump targets for labeling
const jumpTargets = new Set();
jumpTargets.add(resetVec);
jumpTargets.add(nmiVec);
jumpTargets.add(irqVec);

// First pass: collect jump targets
let pc = BASE_ADDR;
while (pc < BASE_ADDR + PRG_SIZE) {
  const inst = disassembleAt(pc);
  if (!inst) break;

  if (inst.mnemonic) {
    if (['JMP', 'JSR'].includes(inst.mnemonic) && inst.size === 3) {
      const target = inst.bytes[1] | (inst.bytes[2] << 8);
      if (target >= BASE_ADDR && target < BASE_ADDR + PRG_SIZE) {
        jumpTargets.add(target);
      }
    }
    if (['BPL','BMI','BVC','BVS','BCC','BCS','BNE','BEQ'].includes(inst.mnemonic)) {
      const offset8 = inst.bytes[1] > 127 ? inst.bytes[1] - 256 : inst.bytes[1];
      const target = pc + 2 + offset8;
      if (target >= BASE_ADDR && target < BASE_ADDR + PRG_SIZE) {
        jumpTargets.add(target);
      }
    }
  }

  pc += inst.size;
}

// Second pass: generate output with labels
pc = BASE_ADDR;
let instrCount = 0;
let illegalCount = 0;

while (pc < BASE_ADDR + PRG_SIZE) {
  // Add label if this is a jump target
  if (jumpTargets.has(pc)) {
    const label = vectorLabels[pc] || `L_${pc.toString(16).toUpperCase()}`;
    lines.push(``);
    lines.push(`${label}:`);
  }

  const inst = disassembleAt(pc);
  if (!inst) break;

  const bytesStr = inst.bytes.map(b => formatByte(b)).join(' ').padEnd(9);
  lines.push(`  ${formatAddr(inst.addr)}  ${bytesStr} ${inst.text}`);

  if (inst.illegal) illegalCount++;
  instrCount++;
  pc += inst.size;
}

// Add vectors at the end
lines.push(``);
lines.push(`; ============================================`);
lines.push(`; Interrupt Vectors at $FFFA-$FFFF`);
lines.push(`; ============================================`);
lines.push(`; $FFFA: NMI   = ${formatAddr(nmiVec)}`);
lines.push(`; $FFFC: RESET = ${formatAddr(resetVec)}`);
lines.push(`; $FFFE: IRQ   = ${formatAddr(irqVec)}`);

const output = lines.join('\n');
fs.writeFileSync(OUTPUT_PATH, output);

console.log(`\nDisassembly complete:`);
console.log(`  Instructions: ${instrCount}`);
console.log(`  Illegal opcodes: ${illegalCount}`);
console.log(`  Jump targets labeled: ${jumpTargets.size}`);
console.log(`  Output: ${OUTPUT_PATH} (${(output.length / 1024).toFixed(1)} KB)`);
