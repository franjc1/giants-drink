#!/usr/bin/env node
/**
 * NES Trace-Based Analyzer - Simple frame-level sampling
 *
 * Samples CPU/RAM state at each frame instead of hooking individual instructions.
 * Much simpler and more reliable than instruction-level tracing.
 */

const fs = require('fs');
const path = require('path');
const { NES, Controller } = require('jsnes');

class NESTraceAnalyzer {
    constructor() {
        this.frameStates = [];
        this.ramAccesses = new Map(); // addr -> { values: [], frames: [] }
        this.frameCount = 0;
        this.gameplayStartFrame = -1;
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

    recordFrameTrace(nes, frames = 600) {
        console.log(`Recording frame-level trace for ${frames} frames...`);

        this.frameStates = [];
        const startFrame = this.frameCount;
        let lastRAM = nes.cpu.mem.slice(0, 0x800); // Initial RAM state

        for (let i = 0; i < frames; i++) {
            nes.frame();
            this.frameCount++;

            // Sample CPU and RAM state
            const currentRAM = nes.cpu.mem.slice(0, 0x800);
            const ramChanges = [];

            // Detect RAM changes
            for (let addr = 0; addr < 0x800; addr++) {
                if (lastRAM[addr] !== currentRAM[addr]) {
                    ramChanges.push({
                        addr: addr,
                        before: lastRAM[addr],
                        after: currentRAM[addr]
                    });

                    // Track this address
                    if (!this.ramAccesses.has(addr)) {
                        this.ramAccesses.set(addr, { values: [], frames: [], changes: [] });
                    }
                    this.ramAccesses.get(addr).values.push(currentRAM[addr]);
                    this.ramAccesses.get(addr).frames.push(this.frameCount);
                    this.ramAccesses.get(addr).changes.push({
                        frame: this.frameCount,
                        before: lastRAM[addr],
                        after: currentRAM[addr]
                    });
                }
            }

            // Record frame state
            const frameState = {
                frame: this.frameCount,
                pc: nes.cpu.REG_PC,
                ram_changes: ramChanges,
                active_sprites: this.activeSprites(nes)
            };

            this.frameStates.push(frameState);
            lastRAM = currentRAM;

            if (i % 100 === 0) {
                const changedAddrs = new Set();
                ramChanges.forEach(change => changedAddrs.add(change.addr));
                console.log(`- Frame ${this.frameCount} (${changedAddrs.size} RAM addresses changed this frame)`);
            }
        }

        console.log(`- Trace complete: ${this.frameStates.length} frames sampled`);
        console.log(`- RAM addresses that changed: ${this.ramAccesses.size}`);
        return this.frameStates;
    }

    analyzeTrace() {
        console.log('Analyzing frame trace...');

        // Identify frequently changing addresses (likely position/animation variables)
        const frequentChanges = [];
        const occasionalChanges = [];
        const rareChanges = [];

        for (const [addr, data] of this.ramAccesses) {
            const changeFreq = data.changes.length / this.frameStates.length;

            if (changeFreq > 0.1) { // Changes in >10% of frames
                frequentChanges.push({ addr, ...data, frequency: changeFreq });
            } else if (changeFreq > 0.01) { // Changes in >1% of frames
                occasionalChanges.push({ addr, ...data, frequency: changeFreq });
            } else {
                rareChanges.push({ addr, ...data, frequency: changeFreq });
            }
        }

        // Sort by frequency
        frequentChanges.sort((a, b) => b.frequency - a.frequency);
        occasionalChanges.sort((a, b) => b.frequency - a.frequency);

        console.log(`- Frequent changes (>10%): ${frequentChanges.length} addresses`);
        console.log(`- Occasional changes (1-10%): ${occasionalChanges.length} addresses`);
        console.log(`- Rare changes (<1%): ${rareChanges.length} addresses`);

        return { frequentChanges, occasionalChanges, rareChanges };
    }

    classifyVariables() {
        console.log('Classifying RAM variables...');

        const variables = [];

        for (const [addr, data] of this.ramAccesses) {
            const values = data.values;
            const changes = data.changes;

            const variable = {
                addr: `0x${addr.toString(16).padStart(4, '0')}`,
                classification: this.classifyVariable(addr, values, changes),
                change_count: changes.length,
                frequency: changes.length / this.frameStates.length,
                value_range: {
                    min: Math.min(...values),
                    max: Math.max(...values),
                    unique_count: new Set(values).size
                },
                pattern: this.detectPattern(changes)
            };

            variables.push(variable);
        }

        variables.sort((a, b) => b.change_count - a.change_count);

        console.log(`- Classified ${variables.length} variables`);
        return variables;
    }

    classifyVariable(addr, values, changes) {
        const changeFreq = changes.length / this.frameStates.length;
        const valueRange = Math.max(...values) - Math.min(...values);
        const uniqueValues = new Set(values).size;

        // Position variables: frequently changing, reasonable range, many unique values
        if (changeFreq > 0.05 && valueRange > 10 && uniqueValues > 5) {
            // Check if values tend to increase/decrease (movement)
            const movements = changes.map(c => c.after - c.before);
            const totalMovement = Math.abs(movements.reduce((sum, m) => sum + m, 0));
            if (totalMovement > 20) { // Significant net movement
                return 'position_variable';
            }
        }

        // Speed variables: less frequent changes, small values
        if (changeFreq < 0.02 && Math.max(...values) <= 10) {
            return 'speed_variable';
        }

        // State variables: in game state area
        if (addr >= 0x0700 && addr <= 0x07FF) {
            return 'state_variable';
        }

        // Counter variables: values tend to decrease over time
        const decrements = changes.filter(c => c.after < c.before).length;
        if (decrements > changes.length * 0.6) {
            return 'counter_variable';
        }

        // Flag variables: small values, zero page, few unique values
        if (addr < 0x0100 && Math.max(...values) <= 3 && uniqueValues <= 4) {
            return 'flag_variable';
        }

        return 'unknown_variable';
    }

    detectPattern(changes) {
        if (changes.length < 3) return 'insufficient_data';

        // Check for periodic patterns
        const increments = changes.filter(c => c.after > c.before).length;
        const decrements = changes.filter(c => c.after < c.before).length;
        const constant = changes.filter(c => c.after === c.before).length;

        if (increments > decrements * 2) return 'increasing';
        if (decrements > increments * 2) return 'decreasing';
        if (Math.abs(increments - decrements) <= changes.length * 0.2) return 'oscillating';

        return 'irregular';
    }

    generateOutput(romPath, traceAnalysis, variables) {
        const positionVars = variables.filter(v => v.classification === 'position_variable');
        const speedVars = variables.filter(v => v.classification === 'speed_variable');
        const stateVars = variables.filter(v => v.classification === 'state_variable');
        const entityTableCount = Math.floor(positionVars.length / 2); // Rough estimate

        return {
            meta: {
                rom_file: path.basename(romPath),
                analysis_method: 'frame_sampling',
                gameplay_start_frame: this.gameplayStartFrame,
                trace_duration_frames: this.frameStates.length,
                total_ram_addresses_tracked: this.ramAccesses.size
            },
            stats: {
                frames_sampled: this.frameStates.length,
                ram_variables_found: variables.length,
                variables_classified: variables.filter(v => v.classification !== 'unknown_variable').length,
                frequent_changes: traceAnalysis.frequentChanges.length,
                occasional_changes: traceAnalysis.occasionalChanges.length,
                entity_tables_estimated: entityTableCount
            },
            variables: variables,
            variable_summary: {
                position_variables: positionVars.map(v => v.addr),
                speed_variables: speedVars.map(v => v.addr),
                state_variables: stateVars.map(v => v.addr)
            },
            trace_analysis: {
                frequent_changes: traceAnalysis.frequentChanges.slice(0, 20), // Top 20 most active
                occasional_changes: traceAnalysis.occasionalChanges.slice(0, 10)
            }
        };
    }

    analyze(romPath, outputPath = null) {
        console.log(`=== NES Trace Analysis: ${path.basename(romPath)} ===`);

        // Create NES instance
        const nes = new NES({
            onFrame: () => {},
            onAudioSample: null,
            emulateSound: false
        });

        // Boot to gameplay
        if (!this.bootToGameplay(nes, romPath)) {
            throw new Error('Failed to reach gameplay state');
        }

        // Record frame trace
        const frameTrace = this.recordFrameTrace(nes, 600);

        // Analyze the trace
        const traceAnalysis = this.analyzeTrace();
        const variables = this.classifyVariables();

        // Generate output
        const result = this.generateOutput(romPath, traceAnalysis, variables);

        console.log('\n=== ANALYSIS SUMMARY ===');
        console.log(`Frames sampled: ${result.stats.frames_sampled}`);
        console.log(`RAM variables found: ${result.stats.ram_variables_found} (${result.stats.variables_classified} classified)`);
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
        console.log('Usage: node nes-trace-analyzer-simple.cjs <rom-file> [--output <output-file>]');
        console.log('');
        console.log('Examples:');
        console.log('  node nes-trace-analyzer-simple.cjs ~/nes-roms/Super\\ Mario\\ Bros.\\ \\(Europe\\).nes');
        console.log('  node nes-trace-analyzer-simple.cjs smb.nes --output analysis-output/trace-smb.json');
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