#!/usr/bin/env node
/**
 * NES ROM Code Analyzer - Tool 2 of NES ROM Analyzer
 *
 * Takes disassembly JSON from nes-disasm.cjs and produces structured analysis
 * of routines, variables, and patterns. Phase A of Layer 2 pipeline for Two Fires.
 */

const fs = require('fs');
const path = require('path');

class NESCodeAnalyzer {
    constructor() {
        this.disassembly = null;
        this.routines = [];
        this.variables = new Map();
        this.entityTables = [];
        this.callGraph = { nmi_chain: [], game_loop_entry: null };
        this.ppuRoutines = [];
        this.audioRoutines = [];
        this.patterns = {
            POSITION_UPDATE: [],
            THRESHOLD_CHECK: [],
            TABLE_DISPATCH: [],
            PPU_WRITE_SEQUENCE: [],
            OAM_UPDATE: [],
            AUDIO_WRITE: [],
            COUNTER_DECREMENT: [],
            ENTITY_LOOP: []
        };
    }

    loadDisassembly(disasmPath) {
        console.log(`Loading disassembly: ${disasmPath}`);
        this.disassembly = JSON.parse(fs.readFileSync(disasmPath));
        console.log(`- Loaded ${this.disassembly.instructions.length} instructions`);
        console.log(`- ${this.disassembly.subroutines.length} subroutines`);
    }

    buildRoutineBoundaries() {
        console.log('Building routine boundaries...');

        const routineMap = new Map(); // entry address -> routine info
        const instructionMap = new Map(); // instruction address -> instruction

        // Index instructions by address for quick lookup
        for (const instr of this.disassembly.instructions) {
            const addr = parseInt(instr.addr, 16);
            instructionMap.set(addr, instr);
        }

        // Build routines from subroutine entry points
        for (const sub of this.disassembly.subroutines) {
            const entryAddr = parseInt(sub.entry, 16);
            const routine = {
                addr: sub.entry,
                entry: entryAddr,
                instructions: [],
                ram_reads: new Set(),
                ram_writes: new Set(),
                ppu_registers: new Set(),
                apu_registers: new Set(),
                rom_data_reads: new Set(),
                subroutine_calls: new Set(),
                called_from: sub.called_from.map(addr => parseInt(addr, 16)),
                patterns: [],
                size_bytes: 0,
                in_nmi_chain: false
            };

            // Trace through instructions until RTS/RTI or end of reachable code
            const visited = new Set();
            const queue = [entryAddr];

            while (queue.length > 0) {
                const addr = queue.shift();
                if (visited.has(addr)) continue;

                const instr = instructionMap.get(addr);
                if (!instr) continue;

                visited.add(addr);
                routine.instructions.push(instr);

                // Track memory accesses
                if (instr.reads_from) {
                    routine.ram_reads.add(instr.reads_from);
                }
                if (instr.writes_to) {
                    routine.ram_writes.add(instr.writes_to);
                }
                if (instr.ppu_register) {
                    routine.ppu_registers.add(instr.ppu_register);
                }
                if (instr.apu_register) {
                    routine.apu_registers.add(instr.apu_register);
                }
                if (instr.call_target) {
                    routine.subroutine_calls.add(instr.call_target);
                }

                // Check ROM data access (operands in ROM space)
                if (instr.operand) {
                    const operand = parseInt(instr.operand, 16);
                    if (operand >= 0x8000 && operand <= 0xFFFF) {
                        routine.rom_data_reads.add(instr.operand);
                    }
                }

                // Handle control flow
                const { mnemonic } = instr;
                if (mnemonic === 'RTS' || mnemonic === 'RTI') {
                    // End of routine
                    break;
                }

                // Regular fall-through (most instructions)
                if (!['JMP', 'BRK'].includes(mnemonic)) {
                    const nextAddr = addr + instr.bytes.length;
                    if (nextAddr >= 0x8000 && nextAddr <= 0xFFFF) {
                        queue.push(nextAddr);
                    }
                }

                // Branch targets (conditional branches fall through AND branch)
                if (instr.branch_target) {
                    const targetAddr = parseInt(instr.branch_target, 16);
                    queue.push(targetAddr);
                }

                // Jump targets (unconditional)
                if (instr.jump_target) {
                    const targetAddr = parseInt(instr.jump_target, 16);
                    queue.push(targetAddr);
                    // Don't fall through after JMP
                }
            }

            // Calculate routine size
            if (routine.instructions.length > 0) {
                routine.instructions.sort((a, b) => parseInt(a.addr, 16) - parseInt(b.addr, 16));
                const firstAddr = parseInt(routine.instructions[0].addr, 16);
                const lastInstr = routine.instructions[routine.instructions.length - 1];
                const lastAddr = parseInt(lastInstr.addr, 16) + lastInstr.bytes.length;
                routine.size_bytes = lastAddr - firstAddr;
            }

            // Convert sets to arrays for JSON output
            routine.ram_reads = Array.from(routine.ram_reads);
            routine.ram_writes = Array.from(routine.ram_writes);
            routine.ppu_registers = Array.from(routine.ppu_registers);
            routine.apu_registers = Array.from(routine.apu_registers);
            routine.rom_data_reads = Array.from(routine.rom_data_reads);
            routine.subroutine_calls = Array.from(routine.subroutine_calls);

            routineMap.set(entryAddr, routine);
        }

        this.routines = Array.from(routineMap.values());
        console.log(`- Built ${this.routines.length} routine boundaries`);
    }

    classifyPatterns() {
        console.log('Classifying routine patterns...');

        let classified = 0;

        for (const routine of this.routines) {
            const patterns = [];

            // POSITION_UPDATE pattern: reads address A, ADC/SBC, stores to address A
            if (this.isPositionUpdatePattern(routine)) {
                patterns.push('POSITION_UPDATE');
                this.patterns.POSITION_UPDATE.push(routine);
            }

            // THRESHOLD_CHECK pattern: reads address, CMP, branch
            if (this.isThresholdCheckPattern(routine)) {
                patterns.push('THRESHOLD_CHECK');
                this.patterns.THRESHOLD_CHECK.push(routine);
            }

            // PPU_WRITE_SEQUENCE: writes to PPUADDR then PPUDATA
            if (this.isPPUWriteSequence(routine)) {
                patterns.push('PPU_WRITE_SEQUENCE');
                this.patterns.PPU_WRITE_SEQUENCE.push(routine);
                this.ppuRoutines.push({
                    addr: routine.addr,
                    pattern: 'PPU_WRITE_SEQUENCE',
                    description: 'Updates PPU memory (nametable/palette)'
                });
            }

            // OAM_UPDATE: writes to $4014 (OAM DMA) or OAM staging area
            if (this.isOAMUpdate(routine)) {
                patterns.push('OAM_UPDATE');
                this.patterns.OAM_UPDATE.push(routine);
                this.ppuRoutines.push({
                    addr: routine.addr,
                    pattern: 'OAM_UPDATE',
                    description: 'Updates sprite positions/attributes'
                });
            }

            // AUDIO_WRITE: writes to APU registers
            if (this.isAudioWrite(routine)) {
                patterns.push('AUDIO_WRITE');
                this.patterns.AUDIO_WRITE.push(routine);
                this.audioRoutines.push({
                    addr: routine.addr,
                    pattern: 'AUDIO_WRITE',
                    channels: this.getAudioChannels(routine),
                    description: 'Sound/music playback'
                });
            }

            // COUNTER_DECREMENT: reads, DEC or SBC #1, stores back
            if (this.isCounterDecrement(routine)) {
                patterns.push('COUNTER_DECREMENT');
                this.patterns.COUNTER_DECREMENT.push(routine);
            }

            routine.patterns = patterns;
            if (patterns.length > 0) {
                classified++;
            }
        }

        console.log(`- Classified ${classified}/${this.routines.length} routines`);
    }

    isPositionUpdatePattern(routine) {
        // Look for: LDA addr, ADC/SBC val, STA addr (or addr+1 for 16-bit)
        const instructions = routine.instructions;

        for (let i = 0; i < instructions.length - 2; i++) {
            const instr1 = instructions[i];
            const instr2 = instructions[i + 1];
            const instr3 = instructions[i + 2];

            if (instr1.mnemonic === 'LDA' && instr1.reads_from &&
                (instr2.mnemonic === 'ADC' || instr2.mnemonic === 'SBC') &&
                instr3.mnemonic === 'STA' && instr3.writes_to) {

                // Check if reading from and writing to same or adjacent address
                const readAddr = parseInt(instr1.reads_from, 16);
                const writeAddr = parseInt(instr3.writes_to, 16);

                if (readAddr === writeAddr || Math.abs(readAddr - writeAddr) === 1) {
                    return true;
                }
            }
        }
        return false;
    }

    isThresholdCheckPattern(routine) {
        // Look for: LDA addr, CMP val/addr, BCC/BCS/BEQ/BNE
        const instructions = routine.instructions;

        for (let i = 0; i < instructions.length - 2; i++) {
            const instr1 = instructions[i];
            const instr2 = instructions[i + 1];
            const instr3 = instructions[i + 2];

            if (instr1.mnemonic === 'LDA' && instr1.reads_from &&
                instr2.mnemonic === 'CMP' &&
                ['BCC', 'BCS', 'BEQ', 'BNE', 'BMI', 'BPL'].includes(instr3.mnemonic)) {
                return true;
            }
        }
        return false;
    }

    isPPUWriteSequence(routine) {
        return routine.ppu_registers.includes('PPUADDR') &&
               routine.ppu_registers.includes('PPUDATA');
    }

    isOAMUpdate(routine) {
        // Check for OAM DMA ($4014) or writes to typical OAM staging area ($0200-$02FF)
        const hasOAMDMA = routine.apu_registers.some(reg => reg === 'APU_4014');
        const hasOAMStaging = routine.ram_writes.some(addr => {
            const intAddr = parseInt(addr, 16);
            return intAddr >= 0x0200 && intAddr <= 0x02FF;
        });

        return hasOAMDMA || hasOAMStaging;
    }

    isAudioWrite(routine) {
        return routine.apu_registers.some(reg => {
            const regNum = parseInt(reg.replace('APU_', ''), 16);
            return regNum >= 0x4000 && regNum <= 0x4013;
        });
    }

    getAudioChannels(routine) {
        const channels = [];
        for (const reg of routine.apu_registers) {
            const regNum = parseInt(reg.replace('APU_', ''), 16);
            if (regNum >= 0x4000 && regNum <= 0x4003) channels.push('pulse1');
            else if (regNum >= 0x4004 && regNum <= 0x4007) channels.push('pulse2');
            else if (regNum >= 0x4008 && regNum <= 0x400B) channels.push('triangle');
            else if (regNum >= 0x400C && regNum <= 0x400F) channels.push('noise');
            else if (regNum === 0x4010 || regNum === 0x4011 || regNum === 0x4012 || regNum === 0x4013) channels.push('dmc');
        }
        return [...new Set(channels)]; // Remove duplicates
    }

    isCounterDecrement(routine) {
        // Look for: LDA addr, DEC or SBC #1, STA addr
        const instructions = routine.instructions;

        for (let i = 0; i < instructions.length - 2; i++) {
            const instr1 = instructions[i];
            const instr2 = instructions[i + 1];
            const instr3 = instructions[i + 2];

            if (instr1.mnemonic === 'LDA' && instr1.reads_from &&
                (instr2.mnemonic === 'DEC' ||
                 (instr2.mnemonic === 'SBC' && instr2.addressing_mode === 'immediate' &&
                  instr2.operand === '0x1')) &&
                instr3.mnemonic === 'STA' && instr3.writes_to) {

                const readAddr = parseInt(instr1.reads_from, 16);
                const writeAddr = parseInt(instr3.writes_to, 16);

                if (readAddr === writeAddr) {
                    return true;
                }
            }
        }
        return false;
    }

    classifyVariables() {
        console.log('Classifying RAM variables...');

        // Collect all RAM accesses across all routines
        const ramAccesses = new Map(); // address -> { readers: [], writers: [], read_patterns: [], write_patterns: [] }

        for (const routine of this.routines) {
            // Track reads
            for (const addr of routine.ram_reads) {
                if (!ramAccesses.has(addr)) {
                    ramAccesses.set(addr, { readers: [], writers: [], read_patterns: [], write_patterns: [] });
                }
                ramAccesses.get(addr).readers.push(routine.addr);

                // Add context from routine patterns
                for (const pattern of routine.patterns) {
                    if (pattern === 'POSITION_UPDATE') {
                        ramAccesses.get(addr).read_patterns.push(`read in POSITION_UPDATE at ${routine.addr}`);
                    } else if (pattern === 'THRESHOLD_CHECK') {
                        ramAccesses.get(addr).read_patterns.push(`read in THRESHOLD_CHECK at ${routine.addr}`);
                    }
                }

                if (routine.patterns.length === 0) {
                    ramAccesses.get(addr).read_patterns.push(`read at ${routine.addr}`);
                }
            }

            // Track writes
            for (const addr of routine.ram_writes) {
                if (!ramAccesses.has(addr)) {
                    ramAccesses.set(addr, { readers: [], writers: [], read_patterns: [], write_patterns: [] });
                }
                ramAccesses.get(addr).writers.push(routine.addr);

                for (const pattern of routine.patterns) {
                    if (pattern === 'POSITION_UPDATE') {
                        ramAccesses.get(addr).write_patterns.push(`updated in POSITION_UPDATE at ${routine.addr}`);
                    } else if (pattern === 'OAM_UPDATE') {
                        ramAccesses.get(addr).write_patterns.push(`sprite data written at ${routine.addr}`);
                    }
                }

                if (routine.patterns.length === 0) {
                    ramAccesses.get(addr).write_patterns.push(`written at ${routine.addr}`);
                }
            }
        }

        // Classify variables based on usage patterns
        for (const [addr, access] of ramAccesses) {
            const variable = {
                addr: addr,
                classification: this.classifyVariable(addr, access),
                accessed_by: [...new Set([...access.readers, ...access.writers])],
                write_patterns: [...new Set(access.write_patterns)],
                read_patterns: [...new Set(access.read_patterns)]
            };

            this.variables.set(addr, variable);
        }

        console.log(`- Classified ${this.variables.size} RAM variables`);
    }

    classifyVariable(addr, access) {
        const intAddr = parseInt(addr, 16);

        // Position variables: written by POSITION_UPDATE, read by OAM_UPDATE
        const hasPositionUpdate = access.write_patterns.some(p => p.includes('POSITION_UPDATE'));
        const hasOAMRead = access.read_patterns.some(p => p.includes('OAM_UPDATE'));

        if (hasPositionUpdate || hasOAMRead) {
            return 'position_variable';
        }

        // Speed variables: read by POSITION_UPDATE but rarely written
        const readByPositionUpdate = access.read_patterns.some(p => p.includes('POSITION_UPDATE'));
        if (readByPositionUpdate && access.writers.length <= 1) {
            return 'speed_variable';
        }

        // Counter variables: written by COUNTER_DECREMENT
        const hasCounterPattern = access.write_patterns.some(p => p.includes('COUNTER_DECREMENT'));
        if (hasCounterPattern) {
            return 'counter_variable';
        }

        // Flag variables: in zero page, few readers/writers (likely state flags)
        if (intAddr < 0x0100 && access.readers.length + access.writers.length <= 3) {
            return 'flag_variable';
        }

        // Entity/game state variables: in common NES game state areas
        if (intAddr >= 0x0700 && intAddr <= 0x07FF) {
            return 'state_variable';
        }

        return 'unknown_variable';
    }

    buildCallGraph() {
        console.log('Building call graph...');

        // Find NMI chain by tracing from NMI handler
        const nmiEntry = parseInt(this.disassembly.meta.entry_points.nmi, 16);
        const visited = new Set();
        const chain = [];

        const traceChain = (addr) => {
            if (visited.has(addr)) return;
            visited.add(addr);

            const routine = this.routines.find(r => parseInt(r.addr, 16) === addr);
            if (routine) {
                chain.push(routine.addr);
                routine.in_nmi_chain = true;

                // Follow first subroutine call (main game loop pattern)
                if (routine.subroutine_calls.length > 0) {
                    const firstCall = parseInt(routine.subroutine_calls[0], 16);
                    traceChain(firstCall);
                }
            }
        };

        traceChain(nmiEntry);

        this.callGraph.nmi_chain = chain;
        this.callGraph.game_loop_entry = chain.length > 1 ? chain[1] : null;

        console.log(`- NMI chain depth: ${chain.length}`);
    }

    detectEntityTables() {
        console.log('Detecting entity tables...');

        // Look for routines that access indexed RAM (indicating entity loops)
        const indexedAccesses = new Map(); // base_addr -> { routines: [], stride_hints: [] }

        for (const routine of this.routines) {
            // Check for indexed addressing patterns in the instruction stream
            for (const instr of routine.instructions) {
                if (instr.addressing_mode && instr.addressing_mode.includes('x') && instr.operand) {
                    const baseAddr = parseInt(instr.operand, 16);

                    if (baseAddr >= 0x0000 && baseAddr <= 0x07FF) { // RAM space
                        if (!indexedAccesses.has(baseAddr)) {
                            indexedAccesses.set(baseAddr, { routines: [], stride_hints: [] });
                        }
                        indexedAccesses.get(baseAddr).routines.push(routine.addr);
                    }
                }
            }
        }

        // Look for patterns that suggest entity tables
        for (const [baseAddr, access] of indexedAccesses) {
            if (access.routines.length >= 2) { // Multiple routines accessing same base
                const entityTable = {
                    base_addr: `0x${baseAddr.toString(16).padStart(4, '0')}`,
                    stride: 16, // Common NES entity stride (estimated)
                    max_entries: 5, // Common NES entity count (estimated)
                    fields: {
                        type: { offset: 0, dispatch_routine: 'unknown' },
                        x_pos: { offset: 4, update_routine: 'unknown' },
                        y_pos: { offset: 5, update_routine: 'unknown' },
                        state: { offset: 8, update_routine: 'unknown' }
                    },
                    loop_routines: access.routines
                };

                this.entityTables.push(entityTable);
            }
        }

        console.log(`- Found ${this.entityTables.length} potential entity tables`);
    }

    generateOutput() {
        const stats = {
            routines_found: this.routines.length,
            routines_classified: this.routines.filter(r => r.patterns.length > 0).length,
            routines_unclassified: this.routines.filter(r => r.patterns.length === 0).length,
            ram_variables_found: this.variables.size,
            variables_classified: Array.from(this.variables.values()).filter(v => v.classification !== 'unknown_variable').length,
            entity_tables_found: this.entityTables.length,
            nmi_chain_depth: this.callGraph.nmi_chain.length
        };

        return {
            routines: this.routines.map(routine => ({
                addr: routine.addr,
                size: routine.size_bytes,
                patterns: routine.patterns,
                ram_reads: routine.ram_reads,
                ram_writes: routine.ram_writes,
                ppu_registers: routine.ppu_registers,
                apu_registers: routine.apu_registers,
                rom_data_reads: routine.rom_data_reads,
                called_from: routine.called_from.map(addr => `0x${addr.toString(16)}`),
                calls: routine.subroutine_calls,
                in_nmi_chain: routine.in_nmi_chain,
                description: this.generateRoutineDescription(routine)
            })),
            variables: Array.from(this.variables.values()),
            entity_tables: this.entityTables,
            call_graph: this.callGraph,
            ppu_routines: this.ppuRoutines,
            audio_routines: this.audioRoutines,
            stats: stats
        };
    }

    generateRoutineDescription(routine) {
        if (routine.patterns.includes('POSITION_UPDATE')) {
            const readAddrs = routine.ram_reads.join(', ');
            const writeAddrs = routine.ram_writes.join(', ');
            return `Updates positions at ${writeAddrs} using data from ${readAddrs}`;
        }

        if (routine.patterns.includes('PPU_WRITE_SEQUENCE')) {
            return 'Updates PPU memory (nametable/palette/CHR data)';
        }

        if (routine.patterns.includes('OAM_UPDATE')) {
            return 'Updates sprite positions and attributes';
        }

        if (routine.patterns.includes('AUDIO_WRITE')) {
            const channels = this.getAudioChannels(routine);
            return `Sound/music routine affecting channels: ${channels.join(', ')}`;
        }

        if (routine.patterns.includes('COUNTER_DECREMENT')) {
            return 'Timer/counter management routine';
        }

        if (routine.patterns.includes('THRESHOLD_CHECK')) {
            return 'Conditional logic routine (collision, bounds, state checks)';
        }

        if (routine.ram_reads.length > 0 || routine.ram_writes.length > 0) {
            return `Accesses RAM: reads [${routine.ram_reads.join(', ')}], writes [${routine.ram_writes.join(', ')}]`;
        }

        return 'Unclassified routine';
    }

    analyze(disasmPath) {
        this.loadDisassembly(disasmPath);
        this.buildRoutineBoundaries();
        this.classifyPatterns();
        this.classifyVariables();
        this.buildCallGraph();
        this.detectEntityTables();

        return this.generateOutput();
    }
}

// CLI interface
function main() {
    const args = process.argv.slice(2);
    if (args.length === 0) {
        console.log('Usage: node nes-analyzer.cjs <disasm-file> [--output <output-file>]');
        console.log('');
        console.log('Examples:');
        console.log('  node nes-analyzer.cjs analysis-output/disasm-smb.json');
        console.log('  node nes-analyzer.cjs disasm-smb.json --output analysis-smb.json');
        process.exit(1);
    }

    const disasmPath = args[0];
    let outputPath = null;

    // Parse --output flag
    const outputIndex = args.indexOf('--output');
    if (outputIndex !== -1 && outputIndex + 1 < args.length) {
        outputPath = args[outputIndex + 1];
    }

    if (!fs.existsSync(disasmPath)) {
        console.error(`Error: Disassembly file not found: ${disasmPath}`);
        process.exit(1);
    }

    try {
        const analyzer = new NESCodeAnalyzer();
        const result = analyzer.analyze(disasmPath);

        if (outputPath) {
            // Ensure output directory exists
            const outputDir = path.dirname(outputPath);
            if (!fs.existsSync(outputDir)) {
                fs.mkdirSync(outputDir, { recursive: true });
            }

            fs.writeFileSync(outputPath, JSON.stringify(result, null, 2));
            console.log(`\nOutput saved to: ${outputPath}`);
        } else {
            // Print summary to stdout (full JSON would be too large)
            console.log('\n=== ANALYSIS SUMMARY ===');
            console.log(`Routines found: ${result.stats.routines_found} (${result.stats.routines_classified} classified)`);
            console.log(`RAM variables: ${result.stats.ram_variables_found} (${result.stats.variables_classified} classified)`);
            console.log(`Entity tables: ${result.stats.entity_tables_found}`);
            console.log(`NMI chain depth: ${result.stats.nmi_chain_depth}`);
            console.log(`PPU routines: ${result.ppu_routines.length}`);
            console.log(`Audio routines: ${result.audio_routines.length}`);
        }

        // Print human-readable summary
        console.log('\n=== SMB ANALYSIS SUMMARY ===');
        console.log(`PRG-ROM: ${analyzer.disassembly.meta.prg_size} bytes`);
        console.log(`Code coverage: ${analyzer.disassembly.stats.coverage_pct}%`);
        console.log(`Subroutines found: ${result.stats.routines_found} (${result.stats.routines_classified} classified)`);
        console.log(`RAM variables found: ${result.stats.ram_variables_found} (${result.stats.variables_classified} classified)`);
        console.log(`Entity tables: ${result.stats.entity_tables_found}`);

        // Show some key variables
        const positionVars = result.variables.filter(v => v.classification === 'position_variable').map(v => v.addr);
        const speedVars = result.variables.filter(v => v.classification === 'speed_variable').map(v => v.addr);
        const stateVars = result.variables.filter(v => v.classification === 'state_variable').map(v => v.addr);

        console.log(`Position variables: [${positionVars.join(', ')}]`);
        console.log(`Speed variables: [${speedVars.join(', ')}]`);
        console.log(`State variables: [${stateVars.join(', ')}]`);

        // Show NMI chain
        console.log(`NMI chain: [${result.call_graph.nmi_chain.join(' → ')}]`);

    } catch (error) {
        console.error(`Error: ${error.message}`);
        console.error(error.stack);
        process.exit(1);
    }
}

if (require.main === module) {
    main();
}

module.exports = { NESCodeAnalyzer };