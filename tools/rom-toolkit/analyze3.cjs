/**
 * PRG Analysis Part 3: Find Goomba movement direction code
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

const OPS={0x00:['BRK','imp',1],0x01:['ORA','izx',2],0x05:['ORA','zpg',2],0x06:['ASL','zpg',2],0x08:['PHP','imp',1],0x09:['ORA','imm',2],0x0A:['ASL','acc',1],0x0D:['ORA','abs',3],0x0E:['ASL','abs',3],0x10:['BPL','rel',2],0x11:['ORA','izy',2],0x15:['ORA','zpx',2],0x16:['ASL','zpx',2],0x18:['CLC','imp',1],0x19:['ORA','aby',3],0x1D:['ORA','abx',3],0x1E:['ASL','abx',3],0x20:['JSR','abs',3],0x21:['AND','izx',2],0x24:['BIT','zpg',2],0x25:['AND','zpg',2],0x26:['ROL','zpg',2],0x28:['PLP','imp',1],0x29:['AND','imm',2],0x2A:['ROL','acc',1],0x2C:['BIT','abs',3],0x2D:['AND','abs',3],0x2E:['ROL','abs',3],0x30:['BMI','rel',2],0x31:['AND','izy',2],0x35:['AND','zpx',2],0x36:['ROL','zpx',2],0x38:['SEC','imp',1],0x39:['AND','aby',3],0x3D:['AND','abx',3],0x3E:['ROL','abx',3],0x40:['RTI','imp',1],0x41:['EOR','izx',2],0x45:['EOR','zpg',2],0x46:['LSR','zpg',2],0x48:['PHA','imp',1],0x49:['EOR','imm',2],0x4A:['LSR','acc',1],0x4C:['JMP','abs',3],0x4D:['EOR','abs',3],0x4E:['LSR','abs',3],0x50:['BVC','rel',2],0x51:['EOR','izy',2],0x55:['EOR','zpx',2],0x56:['LSR','zpx',2],0x58:['CLI','imp',1],0x59:['EOR','aby',3],0x5D:['EOR','abx',3],0x5E:['LSR','abx',3],0x60:['RTS','imp',1],0x61:['ADC','izx',2],0x65:['ADC','zpg',2],0x66:['ROR','zpg',2],0x68:['PLA','imp',1],0x69:['ADC','imm',2],0x6A:['ROR','acc',1],0x6C:['JMP','ind',3],0x6D:['ADC','abs',3],0x6E:['ROR','abs',3],0x70:['BVS','rel',2],0x71:['ADC','izy',2],0x75:['ADC','zpx',2],0x76:['ROR','zpx',2],0x78:['SEI','imp',1],0x79:['ADC','aby',3],0x7D:['ADC','abx',3],0x7E:['ROR','abx',3],0x81:['STA','izx',2],0x84:['STY','zpg',2],0x85:['STA','zpg',2],0x86:['STX','zpg',2],0x88:['DEY','imp',1],0x8A:['TXA','imp',1],0x8C:['STY','abs',3],0x8D:['STA','abs',3],0x8E:['STX','abs',3],0x90:['BCC','rel',2],0x91:['STA','izy',2],0x94:['STY','zpx',2],0x95:['STA','zpx',2],0x96:['STX','zpy',2],0x98:['TYA','imp',1],0x99:['STA','aby',3],0x9A:['TXS','imp',1],0x9D:['STA','abx',3],0xA0:['LDY','imm',2],0xA1:['LDA','izx',2],0xA2:['LDX','imm',2],0xA4:['LDY','zpg',2],0xA5:['LDA','zpg',2],0xA6:['LDX','zpg',2],0xA8:['TAY','imp',1],0xA9:['LDA','imm',2],0xAA:['TAX','imp',1],0xAC:['LDY','abs',3],0xAD:['LDA','abs',3],0xAE:['LDX','abs',3],0xB0:['BCS','rel',2],0xB1:['LDA','izy',2],0xB4:['LDY','zpx',2],0xB5:['LDA','zpx',2],0xB6:['LDX','zpy',2],0xB8:['CLV','imp',1],0xB9:['LDA','aby',3],0xBA:['TSX','imp',1],0xBC:['LDY','abx',3],0xBD:['LDA','abx',3],0xBE:['LDX','aby',3],0xC0:['CPY','imm',2],0xC1:['CMP','izx',2],0xC4:['CPY','zpg',2],0xC5:['CMP','zpg',2],0xC6:['DEC','zpg',2],0xC8:['INY','imp',1],0xC9:['CMP','imm',2],0xCA:['DEX','imp',1],0xCC:['CPY','abs',3],0xCD:['CMP','abs',3],0xCE:['DEC','abs',3],0xD0:['BNE','rel',2],0xD1:['CMP','izy',2],0xD5:['CMP','zpx',2],0xD6:['DEC','zpx',2],0xD8:['CLD','imp',1],0xD9:['CMP','aby',3],0xDD:['CMP','abx',3],0xDE:['DEC','abx',3],0xE0:['CPX','imm',2],0xE1:['SBC','izx',2],0xE4:['CPX','zpg',2],0xE5:['SBC','zpg',2],0xE6:['INC','zpg',2],0xE8:['INX','imp',1],0xE9:['SBC','imm',2],0xEA:['NOP','imp',1],0xEC:['CPX','abs',3],0xED:['SBC','abs',3],0xEE:['INC','abs',3],0xF0:['BEQ','rel',2],0xF1:['SBC','izy',2],0xF5:['SBC','zpx',2],0xF6:['INC','zpx',2],0xF8:['SED','imp',1],0xF9:['SBC','aby',3],0xFD:['SBC','abx',3],0xFE:['INC','abx',3]};

function disasmRange(start, end) {
  let pc = start;
  const lines = [];
  while (pc < end) {
    const op = pb(pc);
    const info = OPS[op];
    if (!info) { lines.push(`  ${hex(pc)}  ${hb(op)}        .db ${hb(op)}`); pc++; continue; }
    const [mn, mode, sz] = info;
    let operand = '';
    if (sz === 2) {
      const v = pb(pc+1);
      if (mode === 'imm') operand = `#${hb(v)}`; else if (mode === 'rel') { const t = pc+2+(v>127?v-256:v); operand = hex(t); }
      else if (mode === 'zpg') operand = `${hb(v)}`; else if (mode === 'zpx') operand = `${hb(v)},X`;
      else if (mode === 'zpy') operand = `${hb(v)},Y`; else if (mode === 'izx') operand = `(${hb(v)},X)`;
      else if (mode === 'izy') operand = `(${hb(v)}),Y`;
    } else if (sz === 3) {
      const v = pw(pc+1);
      if (mode === 'abs') operand = hex(v); else if (mode === 'abx') operand = `${hex(v)},X`;
      else if (mode === 'aby') operand = `${hex(v)},Y`; else if (mode === 'ind') operand = `(${hex(v)})`;
    }
    const bytes = []; for (let i = 0; i < sz; i++) bytes.push(hb(pb(pc+i)));
    lines.push(`  ${hex(pc)}  ${bytes.join(' ').padEnd(9)} ${operand ? `${mn} ${operand}` : mn}`);
    pc += sz;
  }
  return lines.join('\n');
}

// Look at the entity processing dispatch — $C047 calls into entity-specific handlers
// The entity processing for enemy slots (X=1-5) calls through a dispatch table
// Let's trace $C882 which is the main enemy handler (when $0F,X is non-zero non-negative)
console.log('=== Enemy Handler Dispatch ($C882) ===');
console.log(disasmRange(0xC882, 0xC920));

// The enemy-type-specific movement handlers
// Goomba is type 6 from our investigation. Let's find the dispatch table
// that routes based on enemy type ($0016,X)

// Look at $C047 more carefully — it's the entity main
// $C047: LDA $0F,X  — entity enable/state
// if bit7 set → $C05F (check if enable counter expired)
// if 0 → $C053 (check scroll to spawn new enemy)
// if positive → $C882 (main enemy handler)
console.log('\n=== Enemy Main Handler ($C882 deeper) ===');
console.log(disasmRange(0xC920, 0xC9B0));

// Look at enemy movement code that sets $58,X (horizontal speed)
// Key writes to $58,X at: $C500, $C319, $C32D, $C344, $C358, $C37D
// Let's look at the broader context around $C300-$C400 (enemy movement routines)
console.log('\n=== Enemy Movement Routines ($C300-$C400) ===');
console.log(disasmRange(0xC300, 0xC400));

// Also check $C430-$C470 which might have direction logic
console.log('\n=== Enemy Direction Logic ($C430-$C520) ===');
console.log(disasmRange(0xC430, 0xC520));

// Look at the horizontal movement application
// This is where $87,X (enemy X) is updated using $58,X (speed)
// Should be somewhere in the physics/movement application code
console.log('\n=== Movement Application ($D3B0-$D440) ===');
console.log(disasmRange(0xD3B0, 0xD440));

// Also look at $D29F area (LDA $58,X)
console.log('\n=== Movement Direction ($D290-$D310) ===');
console.log(disasmRange(0xD290, 0xD310));

console.log('\n=== Analysis Part 3 complete ===');
