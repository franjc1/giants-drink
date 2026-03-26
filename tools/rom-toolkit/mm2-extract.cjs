/**
 * Mega Man 2 PRG-ROM Extraction & Disassembly
 * Handles MMC1 bank switching: 16 banks × 16KB
 */
const fs = require('fs');
const path = require('path');

const ROM_PATH = `${process.env.HOME}/nes-roms/Mega Man 2 (USA).nes`;
const OUT_DIR = path.join(__dirname, 'mm2-disasm');

if (!fs.existsSync(OUT_DIR)) fs.mkdirSync(OUT_DIR, { recursive: true });

// ============================================================
// Parse iNES header
// ============================================================
const rom = fs.readFileSync(ROM_PATH);
console.log(`ROM size: ${rom.length} bytes`);
console.log(`Magic: ${rom.slice(0, 4).toString('ascii')}`);

const prgBanks = rom[4]; // in 16KB units
const chrBanks = rom[5]; // in 8KB units
const flags6 = rom[6];
const flags7 = rom[7];
const mapper = (flags6 >> 4) | (flags7 & 0xF0);

console.log(`PRG-ROM: ${prgBanks} × 16KB = ${prgBanks * 16}KB`);
console.log(`CHR-ROM: ${chrBanks} × 8KB = ${chrBanks * 8}KB (${chrBanks === 0 ? 'CHR-RAM' : 'CHR-ROM'})`);
console.log(`Mapper: ${mapper} (${mapper === 1 ? 'MMC1' : 'unknown'})`);
console.log(`Mirroring: ${flags6 & 1 ? 'vertical' : 'horizontal'}`);
console.log(`Battery: ${(flags6 & 2) ? 'yes' : 'no'}`);

const PRG_START = 16;
const BANK_SIZE = 16384;
const PRG_SIZE = prgBanks * BANK_SIZE;
const prg = rom.slice(PRG_START, PRG_START + PRG_SIZE);
console.log(`Total PRG: ${prg.length} bytes`);

// ============================================================
// 6502 Opcode Table
// ============================================================
const OPS = {
  0x00:['BRK','imp',1],0x01:['ORA','izx',2],0x05:['ORA','zpg',2],0x06:['ASL','zpg',2],
  0x08:['PHP','imp',1],0x09:['ORA','imm',2],0x0A:['ASL','acc',1],0x0D:['ORA','abs',3],
  0x0E:['ASL','abs',3],0x10:['BPL','rel',2],0x11:['ORA','izy',2],0x15:['ORA','zpx',2],
  0x16:['ASL','zpx',2],0x18:['CLC','imp',1],0x19:['ORA','aby',3],0x1D:['ORA','abx',3],
  0x1E:['ASL','abx',3],0x20:['JSR','abs',3],0x21:['AND','izx',2],0x24:['BIT','zpg',2],
  0x25:['AND','zpg',2],0x26:['ROL','zpg',2],0x28:['PLP','imp',1],0x29:['AND','imm',2],
  0x2A:['ROL','acc',1],0x2C:['BIT','abs',3],0x2D:['AND','abs',3],0x2E:['ROL','abs',3],
  0x30:['BMI','rel',2],0x31:['AND','izy',2],0x35:['AND','zpx',2],0x36:['ROL','zpx',2],
  0x38:['SEC','imp',1],0x39:['AND','aby',3],0x3D:['AND','abx',3],0x3E:['ROL','abx',3],
  0x40:['RTI','imp',1],0x41:['EOR','izx',2],0x45:['EOR','zpg',2],0x46:['LSR','zpg',2],
  0x48:['PHA','imp',1],0x49:['EOR','imm',2],0x4A:['LSR','acc',1],0x4C:['JMP','abs',3],
  0x4D:['EOR','abs',3],0x4E:['LSR','abs',3],0x50:['BVC','rel',2],0x51:['EOR','izy',2],
  0x55:['EOR','zpx',2],0x56:['LSR','zpx',2],0x58:['CLI','imp',1],0x59:['EOR','aby',3],
  0x5D:['EOR','abx',3],0x5E:['LSR','abx',3],0x60:['RTS','imp',1],0x61:['ADC','izx',2],
  0x65:['ADC','zpg',2],0x66:['ROR','zpg',2],0x68:['PLA','imp',1],0x69:['ADC','imm',2],
  0x6A:['ROR','acc',1],0x6C:['JMP','ind',3],0x6D:['ADC','abs',3],0x6E:['ROR','abs',3],
  0x70:['BVS','rel',2],0x71:['ADC','izy',2],0x75:['ADC','zpx',2],0x76:['ROR','zpx',2],
  0x78:['SEI','imp',1],0x79:['ADC','aby',3],0x7D:['ADC','abx',3],0x7E:['ROR','abx',3],
  0x81:['STA','izx',2],0x84:['STY','zpg',2],0x85:['STA','zpg',2],0x86:['STX','zpg',2],
  0x88:['DEY','imp',1],0x8A:['TXA','imp',1],0x8C:['STY','abs',3],0x8D:['STA','abs',3],
  0x8E:['STX','abs',3],0x90:['BCC','rel',2],0x91:['STA','izy',2],0x94:['STY','zpx',2],
  0x95:['STA','zpx',2],0x96:['STX','zpy',2],0x98:['TYA','imp',1],0x99:['STA','aby',3],
  0x9A:['TXS','imp',1],0x9D:['STA','abx',3],0xA0:['LDY','imm',2],0xA1:['LDA','izx',2],
  0xA2:['LDX','imm',2],0xA4:['LDY','zpg',2],0xA5:['LDA','zpg',2],0xA6:['LDX','zpg',2],
  0xA8:['TAY','imp',1],0xA9:['LDA','imm',2],0xAA:['TAX','imp',1],0xAC:['LDY','abs',3],
  0xAD:['LDA','abs',3],0xAE:['LDX','abs',3],0xB0:['BCS','rel',2],0xB1:['LDA','izy',2],
  0xB4:['LDY','zpx',2],0xB5:['LDA','zpx',2],0xB6:['LDX','zpy',2],0xB8:['CLV','imp',1],
  0xB9:['LDA','aby',3],0xBA:['TSX','imp',1],0xBC:['LDY','abx',3],0xBD:['LDA','abx',3],
  0xBE:['LDX','aby',3],0xC0:['CPY','imm',2],0xC1:['CMP','izx',2],0xC4:['CPY','zpg',2],
  0xC5:['CMP','zpg',2],0xC6:['DEC','zpg',2],0xC8:['INY','imp',1],0xC9:['CMP','imm',2],
  0xCA:['DEX','imp',1],0xCC:['CPY','abs',3],0xCD:['CMP','abs',3],0xCE:['DEC','abs',3],
  0xD0:['BNE','rel',2],0xD1:['CMP','izy',2],0xD5:['CMP','zpx',2],0xD6:['DEC','zpx',2],
  0xD8:['CLD','imp',1],0xD9:['CMP','aby',3],0xDD:['CMP','abx',3],0xDE:['DEC','abx',3],
  0xE0:['CPX','imm',2],0xE1:['SBC','izx',2],0xE4:['CPX','zpg',2],0xE5:['SBC','zpg',2],
  0xE6:['INC','zpg',2],0xE8:['INX','imp',1],0xE9:['SBC','imm',2],0xEA:['NOP','imp',1],
  0xEC:['CPX','abs',3],0xED:['SBC','abs',3],0xEE:['INC','abs',3],0xF0:['BEQ','rel',2],
  0xF1:['SBC','izy',2],0xF5:['SBC','zpx',2],0xF6:['INC','zpx',2],0xF8:['SED','imp',1],
  0xF9:['SBC','aby',3],0xFD:['SBC','abx',3],0xFE:['INC','abx',3],
};

// ============================================================
// Disassemble a bank
// ============================================================
function disassembleBank(bankData, baseAddr, bankNum) {
  const lines = [];
  lines.push(`; Mega Man 2 — PRG Bank ${bankNum}`);
  lines.push(`; Base address: $${baseAddr.toString(16).toUpperCase()}`);
  lines.push(`; Size: ${bankData.length} bytes`);
  lines.push('');

  // Vectors (only for fixed bank at $C000)
  if (baseAddr === 0xC000) {
    const nmi = bankData[0x3FFA] | (bankData[0x3FFB] << 8);
    const reset = bankData[0x3FFC] | (bankData[0x3FFD] << 8);
    const irq = bankData[0x3FFE] | (bankData[0x3FFF] << 8);
    lines.push(`; NMI vector:   $${nmi.toString(16).toUpperCase()}`);
    lines.push(`; Reset vector: $${reset.toString(16).toUpperCase()}`);
    lines.push(`; IRQ vector:   $${irq.toString(16).toUpperCase()}`);
    lines.push('');
  }

  // Collect jump targets
  const targets = new Set();
  let pc = 0;
  while (pc < bankData.length) {
    const op = bankData[pc];
    const info = OPS[op];
    if (!info) { pc++; continue; }
    const [mn, mode, sz] = info;
    if (['JMP','JSR'].includes(mn) && sz === 3 && pc + 2 < bankData.length) {
      const target = bankData[pc+1] | (bankData[pc+2] << 8);
      if (target >= baseAddr && target < baseAddr + bankData.length) targets.add(target);
    }
    if (['BPL','BMI','BVC','BVS','BCC','BCS','BNE','BEQ'].includes(mn) && pc + 1 < bankData.length) {
      const off = bankData[pc+1] > 127 ? bankData[pc+1] - 256 : bankData[pc+1];
      const target = baseAddr + pc + 2 + off;
      if (target >= baseAddr && target < baseAddr + bankData.length) targets.add(target);
    }
    pc += sz;
  }

  // Disassemble
  pc = 0;
  let instrCount = 0, illegalCount = 0;
  while (pc < bankData.length) {
    const addr = baseAddr + pc;
    if (targets.has(addr)) {
      lines.push('');
      lines.push(`L_${addr.toString(16).toUpperCase()}:`);
    }

    const op = bankData[pc];
    const info = OPS[op];
    if (!info) {
      lines.push(`  $${addr.toString(16).toUpperCase().padStart(4,'0')}  ${op.toString(16).toUpperCase().padStart(2,'0')}        .db $${op.toString(16).toUpperCase().padStart(2,'0')}`);
      illegalCount++;
      pc++; continue;
    }

    const [mn, mode, sz] = info;
    let operand = '';
    const bytes = [];
    for (let i = 0; i < sz; i++) bytes.push(bankData[pc + i]);

    if (sz === 2) {
      const v = bankData[pc+1];
      switch (mode) {
        case 'imm': operand = `#$${v.toString(16).toUpperCase().padStart(2,'0')}`; break;
        case 'zpg': operand = `$${v.toString(16).toUpperCase().padStart(2,'0')}`; break;
        case 'zpx': operand = `$${v.toString(16).toUpperCase().padStart(2,'0')},X`; break;
        case 'zpy': operand = `$${v.toString(16).toUpperCase().padStart(2,'0')},Y`; break;
        case 'izx': operand = `($${v.toString(16).toUpperCase().padStart(2,'0')},X)`; break;
        case 'izy': operand = `($${v.toString(16).toUpperCase().padStart(2,'0')}),Y`; break;
        case 'rel': {
          const off = v > 127 ? v - 256 : v;
          const target = addr + 2 + off;
          operand = `$${target.toString(16).toUpperCase().padStart(4,'0')}`;
          break;
        }
      }
    } else if (sz === 3) {
      const v = bankData[pc+1] | (bankData[pc+2] << 8);
      switch (mode) {
        case 'abs': operand = `$${v.toString(16).toUpperCase().padStart(4,'0')}`; break;
        case 'abx': operand = `$${v.toString(16).toUpperCase().padStart(4,'0')},X`; break;
        case 'aby': operand = `$${v.toString(16).toUpperCase().padStart(4,'0')},Y`; break;
        case 'ind': operand = `($${v.toString(16).toUpperCase().padStart(4,'0')})`; break;
      }
    }

    const text = operand ? `${mn} ${operand}` : mn;
    const byteStr = bytes.map(b => b.toString(16).toUpperCase().padStart(2,'0')).join(' ').padEnd(9);
    lines.push(`  $${addr.toString(16).toUpperCase().padStart(4,'0')}  ${byteStr} ${text}`);
    instrCount++;
    pc += sz;
  }

  return { text: lines.join('\n'), instrCount, illegalCount };
}

// ============================================================
// Extract and disassemble all banks
// ============================================================
console.log('\nExtracting and disassembling banks...');

const bankSummary = [];

for (let bank = 0; bank < prgBanks; bank++) {
  const offset = bank * BANK_SIZE;
  const bankData = prg.slice(offset, offset + BANK_SIZE);
  const baseAddr = bank === prgBanks - 1 ? 0xC000 : 0x8000;
  const filename = `bank${bank.toString().padStart(2, '0')}.asm`;

  const result = disassembleBank(bankData, baseAddr, bank);
  fs.writeFileSync(path.join(OUT_DIR, filename), result.text);

  const dataRatio = result.illegalCount / (result.instrCount + result.illegalCount);
  bankSummary.push({
    bank, filename,
    instructions: result.instrCount,
    illegal: result.illegalCount,
    dataRatio: (dataRatio * 100).toFixed(1),
    size: (result.text.length / 1024).toFixed(1)
  });

  console.log(`  Bank ${bank.toString().padStart(2)}: ${result.instrCount} instr, ${result.illegalCount} illegal (${(dataRatio*100).toFixed(0)}% data), ${filename}`);
}

// Print vectors from fixed bank
const fixedBank = prg.slice((prgBanks - 1) * BANK_SIZE);
const nmiVec = fixedBank[0x3FFA] | (fixedBank[0x3FFB] << 8);
const resetVec = fixedBank[0x3FFC] | (fixedBank[0x3FFD] << 8);
const irqVec = fixedBank[0x3FFE] | (fixedBank[0x3FFF] << 8);
console.log(`\nVectors (from fixed bank 15):`);
console.log(`  Reset: $${resetVec.toString(16).toUpperCase()}`);
console.log(`  NMI:   $${nmiVec.toString(16).toUpperCase()}`);
console.log(`  IRQ:   $${irqVec.toString(16).toUpperCase()}`);

// Identify bank characteristics
console.log('\nBank analysis:');
for (const b of bankSummary) {
  let purpose = '';
  if (b.dataRatio > 80) purpose = '(mostly data/graphics)';
  else if (b.dataRatio > 50) purpose = '(mixed code+data)';
  else purpose = '(mostly code)';
  if (b.bank === prgBanks - 1) purpose += ' [FIXED $C000-$FFFF]';
  console.log(`  Bank ${b.bank.toString().padStart(2)}: ${b.dataRatio}% data ${purpose}`);
}

console.log(`\nDisassembly complete. Output: ${OUT_DIR}/`);
