#!/usr/bin/env node
/**
 * NES Trace-Based Analyzer - Hybrid runtime analysis
 *
 * Instead of static disassembly (which fails on bank-switched games),
 * this runs the game in jsnes and traces actual instruction execution.
 * Bank switching is handled by the emulator, not us.
 */

const fs = require('fs');
const path = require('path');
const { NES, Controller } = require('jsnes');

class NESTraceAnalyzer {
    constructor() {
        this.trace = [];
        this.ramAccesses = new Map(); // addr -> { reads: [], writes: [], instructions: [] }
        this.routines = new Map(); // PC -> routine info
        this.instructionCount = 0;
        this.frameCount = 0;
        this.gameplayStartFrame = -1;
        this.isTracing = false;

        // Pattern analysis (adapted from nes-analyzer.cjs)
        this.patterns = {
            POSITION_UPDATE: [],
            THRESHOLD_CHECK: [],
            PPU_WRITE_SEQUENCE: [],
            OAM_UPDATE: [],
            AUDIO_WRITE: [],
            COUNTER_DECREMENT: []
        };
    }

    instrumentCPU(nes) {
        const self = this;

        // Store original emulate method
        const originalEmulate = nes.cpu.emulate.bind(nes.cpu);

        // Replace with instrumented version that preserves 'this' context
        nes.cpu.emulate = function() {
            if (!self.isTracing) {
                return originalEmulate.call(this);
            }

            // Store state before instruction
            const pc = this.REG_PC + 1; // REG_PC is one behind actual PC
            const ramBefore = this.mem.slice(0, 0x800); // Faster than Map for small arrays

            // Execute the original instruction
            const result = originalEmulate.call(this);

            // Record what changed in RAM
            const ramWrites = [];
            for (let addr = 0; addr < 0x800; addr++) {
                const before = ramBefore[addr];
                const after = this.mem[addr];

                if (before !== after) {
                    ramWrites.push({ addr: addr, before: before, after: after });
                }
            }

            // Get opcode (only if we have writes to record)
            if (ramWrites.length > 0 || self.trace.length < 1000) { // Limit early trace entries
                let opcode = 0;
                try {
                    // Use the CPU's own memory access method
                    opcode = this.load ? this.load(pc) : this.mem[pc];
                } catch (e) {
                    // Ignore read errors
                    opcode = 0;
                }

                // Record trace entry
                const traceEntry = {
                    frame: self.frameCount,
                    pc: pc,
                    opcode: opcode,
                    ram_writes: ramWrites,
                    instruction_count: self.instructionCount++
                };

                self.trace.push(traceEntry);

                // Update RAM access tracking for writes
                for (const write of ramWrites) {
                    if (!self.ramAccesses.has(write.addr)) {
                        self.ramAccesses.set(write.addr, { reads: [], writes: [], instructions: [] });
                    }
                    self.ramAccesses.get(write.addr).writes.push({
                        pc: pc,
                        frame: self.frameCount,
                        value: write.after,
                        prev_value: write.before
                    });
                    self.ramAccesses.get(write.addr).instructions.push(pc);
                }
            }

            return result;
        };

        console.log('- CPU instrumentation installed');
    }

    bootToGameplay(nes, romPath) {
        console.log(`Booting ${path.basename(romPath)} to gameplay...`);

        // Load ROM
        const romData = fs.readFileSync(romPath);
        nes.loadROM(romData.toString('binary'));

        // Boot and find gameplay
        let attempts = 0;
        const maxAttempts = 1000; // ~16 seconds at 60fps

        while (attempts < maxAttempts) {
            // Clear all inputs
            for (const btn of [Controller.BUTTON_A, Controller.BUTTON_B, Controller.BUTTON_SELECT,
                              Controller.BUTTON_START, Controller.BUTTON_UP, Controller.BUTTON_DOWN,
                              Controller.BUTTON_LEFT, Controller.BUTTON_RIGHT]) {
                nes.buttonUp(1, btn);
            }

            // Press Start periodically to get through menus
            if (attempts % 120 === 0) {
                nes.buttonDown(1, Controller.BUTTON_START);
                nes.frame();
                nes.buttonUp(1, Controller.BUTTON_START);
            }

            nes.frame();
            this.frameCount++;
            attempts++;

            // Check for gameplay state
            if (this.isGameplay(nes)) {
                console.log(`- Gameplay detected at frame ${this.frameCount}`);

                // Test bidirectional movement to confirm player control
                const oamBefore = this.snapshotOAM(nes);

                // Test Right
                nes.buttonDown(1, Controller.BUTTON_RIGHT);
                nes.frame();
                nes.frame();
                nes.buttonUp(1, Controller.BUTTON_RIGHT);

                const oamAfterRight = this.snapshotOAM(nes);

                // Test Left
                nes.buttonDown(1, Controller.BUTTON_LEFT);
                nes.frame();
                nes.frame();
                nes.buttonUp(1, Controller.BUTTON_LEFT);

                const oamAfterLeft = this.snapshotOAM(nes);

                // Check if any sprite moved during control test
                if (this.detectOAMMovement(oamBefore, oamAfterRight) ||
                    this.detectOAMMovement(oamBefore, oamAfterLeft)) {

                    console.log(`- Player control confirmed at frame ${this.frameCount}`);
                    this.gameplayStartFrame = this.frameCount;
                    return true;
                }
            }
        }

        console.log('- Failed to reach gameplay state');
        return false;
    }

    isGameplay(nes) {
        // Heuristic: gameplay has multiple active sprites and reasonable nametable density
        return this.activeSprites(nes) > 4 && this.nametableDensity(nes) > 0.55;
    }

    activeSprites(nes) {
        let count = 0;
        const oam = nes.ppu.spriteMem;
        for (let i = 0; i < 64; i++) {
            const y = oam[i * 4];
            if (y < 0xEF) count++; // Y < 239 means on-screen
        }
        return count;
    }

    nametableDensity(nes) {
        let nonZero = 0;
        const vram = nes.ppu.vramMem;
        for (let i = 0x2000; i < 0x23C0; i++) { // Nametable 0 tile area
            if (vram[i] !== 0) nonZero++;
        }
        return nonZero / (0x23C0 - 0x2000);
    }

    snapshotOAM(nes) {
        return nes.ppu.spriteMem.slice(0, 256);
    }

    detectOAMMovement(oamBefore, oamAfter) {
        for (let i = 0; i < 64; i++) {
            const xBefore = oamBefore[i * 4 + 3];
            const yBefore = oamBefore[i * 4];
            const xAfter = oamAfter[i * 4 + 3];
            const yAfter = oamAfter[i * 4];

            if (Math.abs(xBefore - xAfter) > 1 || Math.abs(yBefore - yAfter) > 1) {
                return true;
            }
        }
        return false;
    }

    recordExecutionTrace(nes, frames = 600) {
        console.log(`Recording execution trace for ${frames} frames...`);

        this.isTracing = true;
        this.trace = [];
        this.instructionCount = 0;
        const startFrame = this.frameCount;

        for (let i = 0; i < frames; i++) {
            nes.frame();
            this.frameCount++;

            if (i % 100 === 0) {
                console.log(`- Frame ${this.frameCount} (${this.trace.length} instructions traced)`);
            }
        }

        this.isTracing = false;

        console.log(`- Trace complete: ${this.trace.length} instructions executed`);
        return this.trace;
    }

    analyzeTrace() {
        console.log('Analyzing execution trace...');

        // Group instructions by PC to identify routines
        const pcCounts = new Map();
        const pcFrames = new Map();

        for (const entry of this.trace) {
            const pc = entry.pc;

            if (!pcCounts.has(pc)) {
                pcCounts.set(pc, 0);
                pcFrames.set(pc, []);
            }

            pcCounts.get(pc)++;
            pcFrames.get(pc).push(entry.frame);
        }

        // Identify routines (PCs that execute multiple times)
        const routines = [];
        for (const [pc, count] of pcCounts) {
            if (count > 1) {
                routines.push({
                    pc: `0x${pc.toString(16)}`,
                    execution_count: count,
                    frames_active: [...new Set(pcFrames.get(pc))].length,
                    pattern: this.classifyRoutinePattern(pc)
                });
            }
        }

        // Sort by execution frequency
        routines.sort((a, b) => b.execution_count - a.execution_count);

        console.log(`- Found ${routines.length} routine entry points`);
        console.log(`- Unique instructions: ${pcCounts.size}`);

        return routines;
    }

    classifyRoutinePattern(pc) {
        // Find all trace entries for this PC
        const entries = this.trace.filter(entry => entry.pc === pc);

        const patterns = [];

        // Check for position update pattern
        if (this.isPositionUpdatePattern(entries)) {
            patterns.push('POSITION_UPDATE');
        }

        // Check for threshold check pattern
        if (this.isThresholdCheckPattern(entries)) {
            patterns.push('THRESHOLD_CHECK');
        }

        // Check for counter decrement pattern
        if (this.isCounterDecrementPattern(entries)) {
            patterns.push('COUNTER_DECREMENT');
        }

        return patterns;
    }

    isPositionUpdatePattern(entries) {
        // Look for entries that write to the same RAM address they read from
        // (or adjacent addresses for 16-bit positions)
        for (const entry of entries) {
            if (entry.ram_writes.length === 0) continue;

            for (const write of entry.ram_writes) {
                // Check if this routine frequently writes to this address
                const writeCount = entries.filter(e =>
                    e.ram_writes.some(w => Math.abs(w.addr - write.addr) <= 1)
                ).length;

                if (writeCount > entries.length * 0.5) {
                    return true; // More than half the time, writes to same address
                }
            }
        }
        return false;
    }

    isThresholdCheckPattern(entries) {
        // Look for routines that read RAM but don't write much
        // (characteristic of comparison/branching code)
        const readFrames = entries.filter(e => e.ram_reads.length > 0).length;
        const writeFrames = entries.filter(e => e.ram_writes.length > 0).length;

        return readFrames > writeFrames * 2; // Read much more than write
    }

    isCounterDecrementPattern(entries) {
        // Look for writes that consistently decrease values
        for (const entry of entries) {
            for (const write of entry.ram_writes) {
                if (write.before > write.after && (write.before - write.after) <= 2) {
                    return true; // Found decrementing behavior
                }
            }
        }
        return false;
    }

    classifyVariables() {
        console.log('Classifying RAM variables...');

        const variables = [];

        for (const [addr, access] of this.ramAccesses) {
            const variable = {
                addr: `0x${addr.toString(16).padStart(4, '0')}`,
                classification: this.classifyVariable(addr, access),
                write_count: access.writes.length,
                read_count: access.reads.length,
                accessing_routines: [...new Set(access.instructions)].map(pc => `0x${pc.toString(16)}`),
                value_range: this.getValueRange(access.writes)
            };

            variables.push(variable);
        }

        variables.sort((a, b) => (b.write_count + b.read_count) - (a.write_count + a.read_count));

        console.log(`- Classified ${variables.length} variables`);
        return variables;
    }

    classifyVariable(addr, access) {
        // Position variables: frequently updated, moderate value changes
        if (access.writes.length > 10) {
            const valueChanges = access.writes.map(w => Math.abs(w.value - (w.prev_value || 0)));
            const avgChange = valueChanges.reduce((sum, change) => sum + change, 0) / valueChanges.length;

            if (avgChange > 0.5 && avgChange < 10) {
                return 'position_variable';
            }
        }

        // Speed variables: less frequent updates, consistent small values
        if (access.writes.length < 5 && access.reads && access.reads.length > access.writes.length * 3) {
            return 'speed_variable';
        }

        // State variables: in game state area
        if (addr >= 0x0700 && addr <= 0x07FF) {
            return 'state_variable';
        }

        // Counter variables: decrementing behavior
        const decrements = access.writes.filter(w => w.prev_value > w.value).length;
        if (decrements > access.writes.length * 0.7) {
            return 'counter_variable';
        }

        // Flag variables: small values, zero page
        if (addr < 0x0100) {
            const values = access.writes.map(w => w.value);
            const maxValue = Math.max(...values);
            if (maxValue <= 3) {
                return 'flag_variable';
            }
        }

        return 'unknown_variable';
    }

    getValueRange(writes) {
        if (writes.length === 0) return { min: 0, max: 0 };

        const values = writes.map(w => w.value);
        return {
            min: Math.min(...values),
            max: Math.max(...values)
        };
    }

    generateOutput(romPath, routines, variables) {
        const uniqueInstructions = new Set(this.trace.map(entry => entry.pc)).size;

        const positionVars = variables.filter(v => v.classification === 'position_variable');
        const speedVars = variables.filter(v => v.classification === 'speed_variable');
        const stateVars = variables.filter(v => v.classification === 'state_variable');
        const entityTableCount = Math.floor(positionVars.length / 4); // Rough estimate

        return {
            meta: {
                rom_file: path.basename(romPath),
                analysis_method: 'execution_trace',
                gameplay_start_frame: this.gameplayStartFrame,
                trace_duration_frames: this.frameCount - this.gameplayStartFrame,
                total_instructions_executed: this.trace.length
            },
            stats: {
                unique_instructions_traced: uniqueInstructions,
                routines_found: routines.length,
                routines_classified: routines.filter(r => r.pattern.length > 0).length,
                ram_variables_found: variables.length,
                variables_classified: variables.filter(v => v.classification !== 'unknown_variable').length,
                entity_tables_estimated: entityTableCount
            },
            routines: routines,
            variables: variables,
            variable_summary: {
                position_variables: positionVars.map(v => v.addr),
                speed_variables: speedVars.map(v => v.addr),
                state_variables: stateVars.map(v => v.addr)
            }
        };
    }

    analyze(romPath, outputPath = null) {
        console.log(`=== NES Trace Analysis: ${path.basename(romPath)} ===`);

        // Create NES instance and instrument CPU
        const nes = new NES({
            onFrame: () => {},
            onAudioSample: null,
            emulateSound: false
        });

        this.instrumentCPU(nes);

        // Boot to gameplay
        if (!this.bootToGameplay(nes, romPath)) {
            throw new Error('Failed to reach gameplay state');
        }

        // Record execution trace
        const trace = this.recordExecutionTrace(nes, 600);

        // Analyze the trace
        const routines = this.analyzeTrace();
        const variables = this.classifyVariables();

        // Generate output
        const result = this.generateOutput(romPath, routines, variables);

        console.log('\n=== ANALYSIS SUMMARY ===');
        console.log(`Unique instructions traced: ${result.stats.unique_instructions_traced}`);
        console.log(`Routines found: ${result.stats.routines_found} (${result.stats.routines_classified} classified)`);
        console.log(`Variables found: ${result.stats.ram_variables_found} (${result.stats.variables_classified} classified)`);
        console.log(`Position variables: ${result.variable_summary.position_variables.length}`);
        console.log(`Speed variables: ${result.variable_summary.speed_variables.length}`);
        console.log(`State variables: ${result.variable_summary.state_variables.length}`);
        console.log(`Estimated entity tables: ${result.stats.entity_tables_estimated}`);

        if (outputPath) {
            const outputDir = path.dirname(outputPath);
            if (!fs.existsSync(outputDir)) {
                fs.mkdirSync(outputDir, { recursive: true });
            }
            fs.writeFileSync(outputPath, JSON.stringify(result, null, 2));
            console.log(`\nOutput saved to: ${outputPath}`);
        }

        return result;
    }
}

// CLI interface
function main() {
    const args = process.argv.slice(2);
    if (args.length === 0) {
        console.log('Usage: node nes-trace-analyzer.cjs <rom-file> [--output <output-file>]');
        console.log('');
        console.log('Examples:');
        console.log('  node nes-trace-analyzer.cjs ~/nes-roms/Super\\ Mario\\ Bros.\\ \\(Europe\\).nes');
        console.log('  node nes-trace-analyzer.cjs smb.nes --output analysis-output/trace-smb.json');
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
        const analyzer = new NESTraceAnalyzer();
        analyzer.analyze(romPath, outputPath);
    } catch (error) {
        console.error(`Error: ${error.message}`);
        console.error(error.stack);
        process.exit(1);
    }
}

if (require.main === module) {
    main();
}

module.exports = { NESTraceAnalyzer };