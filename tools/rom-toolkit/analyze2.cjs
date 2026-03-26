/**
 * PRG-ROM Analysis Part 2: Deep dive into key routines
 */
const fs = require('fs');
const ROM_PATH = `${process.env.HOME}/nes-roms/Super Mario Bros. (World).nes`;
const rom = fs.readFileSync(ROM_PATH);
const prg = rom.slice(16, 16 + 32768);
const BASE = 0x8000;
function pb(addr) { return prg[addr - BASE]; }
function pw(addr) { return pb(addr) | (pb(addr + 1) << 8); }
function hex(n, w=4) { return '$' + n.toString(16).toUpperCase().padStart(w, '0'); }
function hb(n) { return hex(n, 2); }

// Simple disassembler for a range
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

function disasmRange(start, end) {
  let pc = start;
  const lines = [];
  while (pc < end) {
    const op = pb(pc);
    const info = OPS[op];
    if (!info) {
      lines.push(`  ${hex(pc)}  ${hb(op)}        .db ${hb(op)}`);
      pc++; continue;
    }
    const [mn, mode, sz] = info;
    let operand = '';
    if (sz === 2) {
      const v = pb(pc+1);
      if (mode === 'imm') operand = `#${hb(v)}`;
      else if (mode === 'rel') { const t = pc+2+(v>127?v-256:v); operand = hex(t); }
      else if (mode === 'zpg') operand = `${hb(v)}`;
      else if (mode === 'zpx') operand = `${hb(v)},X`;
      else if (mode === 'zpy') operand = `${hb(v)},Y`;
      else if (mode === 'izx') operand = `(${hb(v)},X)`;
      else if (mode === 'izy') operand = `(${hb(v)}),Y`;
    } else if (sz === 3) {
      const v = pw(pc+1);
      if (mode === 'abs') operand = hex(v);
      else if (mode === 'abx') operand = `${hex(v)},X`;
      else if (mode === 'aby') operand = `${hex(v)},Y`;
      else if (mode === 'ind') operand = `(${hex(v)})`;
    }
    const bytes = [];
    for (let i = 0; i < sz; i++) bytes.push(hb(pb(pc+i)));
    const text = operand ? `${mn} ${operand}` : mn;
    lines.push(`  ${hex(pc)}  ${bytes.join(' ').padEnd(9)} ${text}`);
    pc += sz;
  }
  return lines.join('\n');
}

// ============================================================
// KEY ROUTINES
// ============================================================

// GameCoreRoutine — properly disassembled from $AEEA
console.log('=== GameCoreRoutine ($AEEA) ===');
console.log(disasmRange(0xAEEA, 0xAF95));

// Player input/control at $B624
console.log('\n=== Player Control ($B624) ===');
console.log(disasmRange(0xB624, 0xB6B0));

// Player physics / jump — area around $B430-$B520
console.log('\n=== Jump Velocity Table & Physics ($B430-$B520) ===');
// Print the velocity table
console.log('Jump velocity table at $B430:');
for (let i = 0; i < 16; i++) {
  const v = pb(0xB430 + i);
  const signed = v > 127 ? v - 256 : v;
  console.log(`  $B4${(0x30+i).toString(16)}: ${hb(v)} (${signed})`);
}
console.log('\nPhysics code:');
console.log(disasmRange(0xB440, 0xB520));

// Gravity / vertical movement — look around $B3D0-$B430
console.log('\n=== Gravity / Y Movement ($B3D0-$B430) ===');
console.log(disasmRange(0xB3D0, 0xB440));

// Entity processing at $C047
console.log('\n=== Entity Processing ($C047) ===');
console.log(disasmRange(0xC047, 0xC0D0));

// Enemy movement — area around $C500 (where $58,X writes cluster)
console.log('\n=== Enemy Movement ($C500-$C540) ===');
console.log(disasmRange(0xC500, 0xC540));

// Collision detection at $BE70
console.log('\n=== Collision Detection ($BE70) ===');
console.log(disasmRange(0xBE70, 0xBF00));

// Enemy spawn system — around $9860 (where $16,X STA is)
console.log('\n=== Enemy Spawn System ($9850-$98A0) ===');
console.log(disasmRange(0x9850, 0x98A0));

// Level loading at $8FE4 (Task 0 = InitializeArea)
console.log('\n=== InitializeArea ($8FE4) ===');
console.log(disasmRange(0x8FE4, 0x9020));

// Scroll engine — $B288
console.log('\n=== Scroll Engine ($B288) ===');
console.log(disasmRange(0xB288, 0xB2C0));

// Enemy AI dispatch — check $C047 calls
console.log('\n=== Goomba/Enemy AI area ($D670-$D7A0) ===');
console.log(disasmRange(0xD670, 0xD7A0));

console.log('\n=== Analysis Part 2 complete ===');
