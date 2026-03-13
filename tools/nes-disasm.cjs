#!/usr/bin/env node
/**
 * NES ROM Disassembler - Tool 1 of NES ROM Analyzer
 *
 * Takes any NES ROM and produces complete 6502 disassembly via recursive descent.
 * Phase A of Layer 2 pipeline for Two Fires.
 */

const fs = require('fs');
const path = require('path');
const { disasm } = require('6502-reasm');

class NESDisassembler {
    constructor() {
        this.codeAddresses = new Set();  // Confirmed code bytes
        this.queue = [];  // Addresses to disassemble
        this.instructions = [];
        this.subroutines = new Map();
        this.jumpTables = [];
        this.dataRegions = [];
        this.indirectJumps = [];

        // Track which bytes have been processed
        this.processedBytes = new Set();
    }

    parseROM(romPath) {
        console.log(`Parsing ROM: ${romPath}`);

        const romData = fs.readFileSync(romPath);

        // Parse iNES header
        if (romData.subarray(0, 4).toString() !== 'NES\x1A') {
            throw new Error('Invalid iNES header - not a valid NES ROM');
        }

        const header = {
            prgSize: romData[4] * 16384,  // PRG-ROM size in bytes
            chrSize: romData[5] * 8192,   // CHR-ROM size in bytes
            flags6: romData[6],
            flags7: romData[7],
            mapper: ((romData[7] & 0xF0) | (romData[6] >> 4)),
            mirroring: (romData[6] & 0x01) ? 'vertical' : 'horizontal',
            battery: !!(romData[6] & 0x02),
            trainer: !!(romData[6] & 0x04)
        };

        console.log(`- Mapper: ${header.mapper}`);
        console.log(`- PRG-ROM: ${header.prgSize} bytes`);
        console.log(`- CHR-ROM: ${header.chrSize} bytes`);
        console.log(`- Mirroring: ${header.mirroring}`);

        // Extract PRG-ROM data (starts at offset 16, plus trainer if present)
        let prgOffset = 16;
        if (header.trainer) {
            prgOffset += 512;
        }

        const prgRom = romData.subarray(prgOffset, prgOffset + header.prgSize);

        // Read interrupt vectors from end of PRG-ROM
        const vectorOffset = header.prgSize - 6;
        const nmiVector = prgRom[vectorOffset] | (prgRom[vectorOffset + 1] << 8);
        const resetVector = prgRom[vectorOffset + 2] | (prgRom[vectorOffset + 3] << 8);
        const irqVector = prgRom[vectorOffset + 4] | (prgRom[vectorOffset + 5] << 8);

        const entryPoints = {
            nmi: nmiVector,
            reset: resetVector,
            irq: irqVector
        };

        console.log(`- NMI vector: $${nmiVector.toString(16).toUpperCase()}`);
        console.log(`- RESET vector: $${resetVector.toString(16).toUpperCase()}`);
        console.log(`- IRQ vector: $${irqVector.toString(16).toUpperCase()}`);

        return { header, prgRom, entryPoints };
    }

    cpuToRomOffset(cpuAddr, prgSize) {
        // Convert CPU address to ROM offset
        if (cpuAddr < 0x8000 || cpuAddr > 0xFFFF) {
            return -1;  // Not in ROM space
        }

        // Handle mapper 0 (NROM) mirroring
        if (prgSize === 16384) {
            // 16KB ROM is mirrored at $8000 and $C000
            return (cpuAddr - 0x8000) % 16384;
        } else {
            // 32KB ROM maps directly
            return cpuAddr - 0x8000;
        }
    }

    disassembleFromQueue(prgRom, prgSize) {
        const processedInstructions = new Map(); // addr -> instruction

        while (this.queue.length > 0) {
            const addr = this.queue.shift();

            // Skip if already processed
            if (processedInstructions.has(addr)) {
                continue;
            }

            // Convert to ROM offset
            const romOffset = this.cpuToRomOffset(addr, prgSize);
            if (romOffset < 0 || romOffset >= prgSize) {
                continue;
            }

            try {
                // Get bytes to disassemble (we need at least 3 bytes for worst case)
                const maxBytes = Math.min(3, prgSize - romOffset);
                const bytes = prgRom.subarray(romOffset, romOffset + maxBytes);

                // Disassemble single instruction
                const disasmResult = disasm(bytes, addr);
                if (disasmResult.length === 0) {
                    continue;
                }

                const instruction = disasmResult[0];
                const instrLen = instruction.bytes.length;

                // Mark these bytes as code
                for (let i = 0; i < instrLen; i++) {
                    this.codeAddresses.add(addr + i);
                    this.processedBytes.add(romOffset + i);
                }

                processedInstructions.set(addr, instruction);

                // Analyze instruction for control flow
                this.analyzeInstruction(instruction);

            } catch (error) {
                console.warn(`Failed to disassemble at $${addr.toString(16)}: ${error.message}`);
            }
        }

        // Convert Map to array sorted by address
        this.instructions = Array.from(processedInstructions.values()).sort((a, b) => a.address - b.address);
    }

    analyzeInstruction(instruction) {
        const { assembly, address, bytes } = instruction;
        const opcode = bytes[0];
        const mnemonic = assembly.split(' ')[0];

        // Add metadata to instruction
        instruction.mnemonic = mnemonic;
        instruction.addressing_mode = this.getAddressingMode(opcode, assembly);

        // Extract operand for analysis
        const operandMatch = assembly.match(/(?:\$([0-9a-f]+)|#\$([0-9a-f]+))/i);
        if (operandMatch) {
            const operandStr = operandMatch[1] || operandMatch[2];
            instruction.operand = parseInt(operandStr, 16);
        }

        // Control flow analysis
        switch (mnemonic) {
            case 'BCC': case 'BCS': case 'BEQ': case 'BNE':
            case 'BMI': case 'BPL': case 'BVC': case 'BVS':
                // Branch instruction - add target and fall through
                const branchTarget = this.calculateBranchTarget(address, bytes[1]);
                this.queue.push(branchTarget);
                this.queue.push(address + bytes.length); // Fall through
                instruction.branch_target = branchTarget;
                break;

            case 'JMP':
                if (bytes.length === 3 && bytes[1] !== 0x6C) {
                    // JMP absolute - add target, no fall through
                    const jumpTarget = instruction.operand;
                    this.queue.push(jumpTarget);
                    instruction.jump_target = jumpTarget;
                } else {
                    // JMP indirect - can't follow statically
                    this.indirectJumps.push({
                        addr: address,
                        pointer: instruction.operand
                    });
                }
                break;

            case 'JSR':
                // Subroutine call - add target and fall through
                const jsrTarget = instruction.operand;
                this.queue.push(jsrTarget);
                this.queue.push(address + bytes.length); // Return address
                instruction.call_target = jsrTarget;

                // Track subroutine
                if (!this.subroutines.has(jsrTarget)) {
                    this.subroutines.set(jsrTarget, {
                        entry: jsrTarget,
                        callers: []
                    });
                }
                this.subroutines.get(jsrTarget).callers.push(address);
                break;

            case 'RTS': case 'RTI':
                // Return - no fall through
                break;

            case 'BRK':
                // Break - no fall through
                break;

            default:
                // Regular instruction - fall through
                this.queue.push(address + bytes.length);
                break;
        }

        // Track memory accesses
        if (instruction.operand !== undefined) {
            const operand = instruction.operand;

            // Check for RAM access (including mirrors)
            if (operand <= 0x1FFF) {
                const normalizedAddr = operand & 0x07FF; // Remove mirroring
                if (this.isReadInstruction(mnemonic)) {
                    instruction.reads_from = `0x${normalizedAddr.toString(16).padStart(4, '0')}`;
                }
                if (this.isWriteInstruction(mnemonic)) {
                    instruction.writes_to = `0x${normalizedAddr.toString(16).padStart(4, '0')}`;
                }
            }

            // Check for PPU register access
            else if (operand >= 0x2000 && operand <= 0x2007) {
                instruction.ppu_register = this.getPPURegisterName(operand);
            }

            // Check for APU register access
            else if (operand >= 0x4000 && operand <= 0x4017) {
                instruction.apu_register = `APU_${operand.toString(16).toUpperCase()}`;
            }
        }
    }

    calculateBranchTarget(instrAddr, offset) {
        // Branch offset is signed byte
        const signedOffset = offset > 127 ? offset - 256 : offset;
        return instrAddr + 2 + signedOffset; // +2 because offset is from next instruction
    }

    getAddressingMode(opcode, assembly) {
        // Simple heuristic based on assembly string format
        if (assembly.includes('#$')) return 'immediate';
        if (assembly.includes('($') && assembly.includes(',X)')) return 'indexed_indirect';
        if (assembly.includes('($') && assembly.includes('),Y')) return 'indirect_indexed';
        if (assembly.includes('($')) return 'indirect';
        if (assembly.includes(',X')) return assembly.includes('$') && assembly.split('$')[1].length <= 2 ? 'zero_page_x' : 'absolute_x';
        if (assembly.includes(',Y')) return assembly.includes('$') && assembly.split('$')[1].length <= 2 ? 'zero_page_y' : 'absolute_y';
        if (assembly.includes('$')) {
            const addrStr = assembly.split('$')[1];
            return addrStr && addrStr.length <= 2 ? 'zero_page' : 'absolute';
        }
        return 'implied';
    }

    isReadInstruction(mnemonic) {
        return ['LDA', 'LDX', 'LDY', 'CMP', 'CPX', 'CPY', 'BIT', 'ADC', 'SBC', 'AND', 'ORA', 'EOR'].includes(mnemonic);
    }

    isWriteInstruction(mnemonic) {
        return ['STA', 'STX', 'STY', 'INC', 'DEC', 'ASL', 'LSR', 'ROL', 'ROR'].includes(mnemonic);
    }

    getPPURegisterName(addr) {
        const registers = {
            0x2000: 'PPUCTRL',
            0x2001: 'PPUMASK',
            0x2002: 'PPUSTATUS',
            0x2003: 'OAMADDR',
            0x2004: 'OAMDATA',
            0x2005: 'PPUSCROLL',
            0x2006: 'PPUADDR',
            0x2007: 'PPUDATA'
        };
        return registers[addr] || `PPU_${addr.toString(16).toUpperCase()}`;
    }

    detectJumpTables(prgRom, prgSize) {
        const jumpTables = [];

        // Method 1: Find potential address tables in data regions
        for (const region of this.dataRegions) {
            const startOffset = region.rom_offset;
            const endOffset = startOffset + region.size;

            // Check for sequences of 16-bit addresses (pairs of bytes)
            if (region.size >= 4 && region.size % 2 === 0) {
                const addresses = [];
                let validCount = 0;

                for (let i = startOffset; i < endOffset; i += 2) {
                    if (i + 1 < prgRom.length) {
                        const addr = prgRom[i] | (prgRom[i + 1] << 8);
                        addresses.push(addr);

                        // Check if this looks like a valid code address
                        if (addr >= 0x8000 && addr <= 0xFFFF) {
                            const romOffset = this.cpuToRomOffset(addr, prgSize);
                            if (romOffset >= 0 && romOffset < prgSize) {
                                validCount++;
                            }
                        }
                    }
                }

                // If >50% of entries look like valid code addresses, it might be a jump table
                if (addresses.length >= 2 && validCount / addresses.length > 0.5) {
                    jumpTables.push({
                        addr: `0x${(0x8000 + startOffset).toString(16)}`,
                        entries: addresses.map(addr => `0x${addr.toString(16)}`),
                        dispatch_code: 'unknown',
                        confidence: validCount / addresses.length
                    });

                    // Add these addresses to the disassembly queue
                    for (const addr of addresses) {
                        if (addr >= 0x8000 && addr <= 0xFFFF) {
                            this.queue.push(addr);
                        }
                    }
                }
            }
        }

        if (jumpTables.length > 0) {
            console.log(`- Found ${jumpTables.length} potential jump tables, re-running disassembly...`);
            // Re-run disassembly with new addresses
            this.disassembleFromQueue(prgRom, prgSize);
        }

        return jumpTables;
    }

    identifyDataRegions(prgSize) {
        const regions = [];
        let regionStart = null;

        for (let i = 0; i < prgSize; i++) {
            const isCode = this.processedBytes.has(i);

            if (!isCode && regionStart === null) {
                regionStart = i;
            } else if (isCode && regionStart !== null) {
                // End of data region
                regions.push({
                    start: `0x${(0x8000 + regionStart).toString(16)}`,
                    end: `0x${(0x8000 + i - 1).toString(16)}`,
                    size: i - regionStart,
                    rom_offset: regionStart
                });
                regionStart = null;
            }
        }

        // Handle data region at end of ROM
        if (regionStart !== null) {
            regions.push({
                start: `0x${(0x8000 + regionStart).toString(16)}`,
                end: `0x${(0x8000 + prgSize - 1).toString(16)}`,
                size: prgSize - regionStart,
                rom_offset: regionStart
            });
        }

        this.dataRegions = regions;
    }

    generateOutput(romPath, header, entryPoints) {
        const codeBytes = this.processedBytes.size;
        const dataBytes = header.prgSize - codeBytes;
        const coveragePct = (codeBytes / header.prgSize * 100).toFixed(1);

        return {
            meta: {
                rom_file: path.basename(romPath),
                mapper: header.mapper,
                prg_size: header.prgSize,
                chr_size: header.chrSize,
                entry_points: {
                    nmi: `0x${entryPoints.nmi.toString(16)}`,
                    reset: `0x${entryPoints.reset.toString(16)}`,
                    irq: `0x${entryPoints.irq.toString(16)}`
                }
            },
            instructions: this.instructions.map(instr => ({
                addr: `0x${instr.address.toString(16)}`,
                bytes: instr.bytes,
                asm: instr.assembly,
                mnemonic: instr.mnemonic,
                addressing_mode: instr.addressing_mode,
                operand: instr.operand ? `0x${instr.operand.toString(16)}` : null,
                reads_from: instr.reads_from,
                writes_to: instr.writes_to,
                ppu_register: instr.ppu_register,
                apu_register: instr.apu_register,
                branch_target: instr.branch_target ? `0x${instr.branch_target.toString(16)}` : undefined,
                jump_target: instr.jump_target ? `0x${instr.jump_target.toString(16)}` : undefined,
                call_target: instr.call_target ? `0x${instr.call_target.toString(16)}` : undefined
            })),
            subroutines: Array.from(this.subroutines.values()).map(sub => ({
                entry: `0x${sub.entry.toString(16)}`,
                called_from: sub.callers.map(addr => `0x${addr.toString(16)}`),
                size_bytes: null // Will be calculated by analyzer
            })),
            data_regions: this.dataRegions,
            jump_tables: this.jumpTables,
            indirect_jumps: this.indirectJumps.map(ij => ({
                addr: `0x${ij.addr.toString(16)}`,
                pointer: `0x${ij.pointer.toString(16)}`
            })),
            stats: {
                total_bytes: header.prgSize,
                code_bytes: codeBytes,
                data_bytes: dataBytes,
                instructions_decoded: this.instructions.length,
                subroutines_found: this.subroutines.size,
                jump_tables_found: this.jumpTables.length,
                indirect_jumps_unresolved: this.indirectJumps.length,
                coverage_pct: parseFloat(coveragePct)
            }
        };
    }

    disassemble(romPath) {
        const { header, prgRom, entryPoints } = this.parseROM(romPath);

        // Add entry points to queue
        this.queue.push(entryPoints.nmi);
        this.queue.push(entryPoints.reset);
        if (entryPoints.irq !== 0) {
            this.queue.push(entryPoints.irq);
        }

        // Add suspected code regions that might not be reachable via normal control flow
        // This is a heuristic approach for games with complex dispatch mechanisms
        const suspectedCodeRegions = [
            0x9000, 0x9500, 0xA000, 0xB000, 0xC000, 0xD000, 0xE000, 0xF000
        ];

        for (const addr of suspectedCodeRegions) {
            const romOffset = this.cpuToRomOffset(addr, header.prgSize);
            if (romOffset >= 0 && romOffset < header.prgSize) {
                this.queue.push(addr);
            }
        }

        console.log('Starting recursive descent disassembly...');

        // Recursive descent disassembly
        this.disassembleFromQueue(prgRom, header.prgSize);

        console.log(`- Disassembled ${this.instructions.length} instructions`);

        // Detect jump tables (phase 2)
        this.jumpTables = this.detectJumpTables(prgRom, header.prgSize);

        // Identify data regions
        this.identifyDataRegions(header.prgSize);
        console.log(`- Found ${this.dataRegions.length} data regions`);

        // Generate structured output
        const result = this.generateOutput(romPath, header, entryPoints);

        console.log(`=== DISASSEMBLY STATS ===`);
        console.log(`Code coverage: ${result.stats.coverage_pct}%`);
        console.log(`Instructions: ${result.stats.instructions_decoded}`);
        console.log(`Subroutines: ${result.stats.subroutines_found}`);
        console.log(`Data regions: ${this.dataRegions.length}`);

        return result;
    }
}

// CLI interface
function main() {
    const args = process.argv.slice(2);
    if (args.length === 0) {
        console.log('Usage: node nes-disasm.js <rom-file> [--output <output-file>]');
        console.log('');
        console.log('Examples:');
        console.log('  node nes-disasm.js ~/nes-roms/Super\\ Mario\\ Bros.\\ \\(World\\).nes');
        console.log('  node nes-disasm.js smb.nes --output disasm-smb.json');
        process.exit(1);
    }

    const romPath = args[0];
    let outputPath = null;

    // Parse --output flag
    const outputIndex = args.indexOf('--output');
    if (outputIndex !== -1 && outputIndex + 1 < args.length) {
        outputPath = args[outputIndex + 1];
    }

    if (!fs.existsSync(romPath)) {
        console.error(`Error: ROM file not found: ${romPath}`);
        process.exit(1);
    }

    try {
        const disassembler = new NESDisassembler();
        const result = disassembler.disassemble(romPath);

        if (outputPath) {
            // Ensure output directory exists
            const outputDir = path.dirname(outputPath);
            if (!fs.existsSync(outputDir)) {
                fs.mkdirSync(outputDir, { recursive: true });
            }

            fs.writeFileSync(outputPath, JSON.stringify(result, null, 2));
            console.log(`\nOutput saved to: ${outputPath}`);
        } else {
            // Print to stdout
            console.log('\n=== DISASSEMBLY OUTPUT ===');
            console.log(JSON.stringify(result, null, 2));
        }

    } catch (error) {
        console.error(`Error: ${error.message}`);
        process.exit(1);
    }
}

if (require.main === module) {
    main();
}

module.exports = { NESDisassembler };