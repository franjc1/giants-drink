#!/usr/bin/env node
/**
 * Verified Behavioral Map Generator
 *
 * Takes trace analysis results and applies write-verify oracle testing
 * to distinguish between correlating variables and actual control variables.
 * Only variables that pass causation testing are included in the verified map.
 */

const fs = require('fs');
const path = require('path');
const { NES, Controller } = require('jsnes');

class VerifiedBehavioralMapGenerator {
    constructor() {
        this.traceData = null;
        this.nes = null;
        this.baselineState = null;
        this.enemiesPresentState = null;
        this.verifiedVariables = [];
        this.playerSprites = []; // Which OAM sprites are controlled by player variables
        this.testResults = {
            candidates_tested: 0,
            verified_controls: 0,
            player_position_vars: [],
            enemy_position_vars: [],
            speed_vars: [],
            unexpected_effects: []
        };
    }

    loadTraceData(tracePath) {
        console.log(`Loading trace data: ${tracePath}`);
        this.traceData = JSON.parse(fs.readFileSync(tracePath));

        const posVars = this.traceData.variable_summary.position_variables || [];
        const speedVars = this.traceData.variable_summary.speed_variables || [];

        console.log('=== TRACE DATA SUMMARY ===');
        console.log(`Total variables: ${this.traceData.stats.ram_variables_found}`);
        console.log(`Position candidates: ${posVars.length}`);
        console.log(`Speed candidates: ${speedVars.length}`);
        console.log(`Position variables: ${posVars.join(', ')}`);
        console.log(`Speed variables: ${speedVars.join(', ')}`);

        return { posVars, speedVars };
    }

    bootToGameplay(romPath) {
        console.log(`\nBooting ${path.basename(romPath)} to gameplay...`);

        this.nes = new NES({
            onFrame: () => {},
            onAudioSample: null,
            emulateSound: false
        });

        const romData = fs.readFileSync(romPath);
        this.nes.loadROM(romData.toString('binary'));

        let attempts = 0;
        const maxAttempts = 1000;

        while (attempts < maxAttempts) {
            this.clearInput();

            if (attempts % 120 === 0) {
                this.nes.buttonDown(1, Controller.BUTTON_START);
                this.nes.frame();
                this.nes.buttonUp(1, Controller.BUTTON_START);
            }

            this.nes.frame();
            attempts++;

            if (this.isGameplay()) {
                console.log(`- Gameplay detected at frame ${attempts}`);

                // Bidirectional control test
                const oamBefore = this.snapshotOAM();

                this.nes.buttonDown(1, Controller.BUTTON_RIGHT);
                this.nes.frame();
                this.nes.frame();
                this.nes.buttonUp(1, Controller.BUTTON_RIGHT);

                const oamAfterRight = this.snapshotOAM();

                this.nes.buttonDown(1, Controller.BUTTON_LEFT);
                this.nes.frame();
                this.nes.frame();
                this.nes.buttonUp(1, Controller.BUTTON_LEFT);

                const oamAfterLeft = this.snapshotOAM();

                if (this.detectOAMMovement(oamBefore, oamAfterRight) ||
                    this.detectOAMMovement(oamBefore, oamAfterLeft)) {

                    console.log(`- Player control confirmed`);
                    this.baselineState = this.nes.toJSON();
                    return true;
                }
            }
        }

        console.log('- Failed to reach gameplay state');
        return false;
    }

    prepareEnemiesState() {
        console.log('\nPreparing enemies-present state...');
        this.nes.fromJSON(this.baselineState);
        this.clearInput();

        // Run gameplay to get enemies on screen
        this.nes.buttonDown(1, Controller.BUTTON_RIGHT);

        for (let i = 0; i < 300; i++) {
            this.nes.frame();

            if (i % 50 === 0) {
                const sprites = this.activeSprites();
                console.log(`- Frame ${i}: ${sprites} active sprites`);

                if (sprites > 6) { // Player + enemies
                    console.log(`- Enemies detected, saving enemies-present state`);
                    this.enemiesPresentState = this.nes.toJSON();
                    this.nes.buttonUp(1, Controller.BUTTON_RIGHT);
                    return true;
                }
            }
        }

        this.nes.buttonUp(1, Controller.BUTTON_RIGHT);
        console.log('- Warning: Could not clearly detect enemies, using current state');
        this.enemiesPresentState = this.nes.toJSON();
        return false;
    }

    verifyPlayerPositionVariables(positionCandidates) {
        console.log('\n=== PHASE 2A: Player Position Verification ===');

        const verifiedPlayerVars = [];
        const WRITE_DELTA = 20;
        const TOLERANCE = 8;

        for (const candidate of positionCandidates) {
            console.log(`\nTesting candidate: ${candidate}`);
            const addr = parseInt(candidate, 16);

            // Restore baseline state
            this.nes.fromJSON(this.baselineState);
            this.clearInput();

            // Read current value
            const originalValue = this.nes.cpu.mem[addr];
            console.log(`- Original value: ${originalValue}`);

            // Get baseline OAM (step 2 frames for OAM DMA timing)
            this.nes.frame();
            this.nes.frame();
            const oamBaseline = this.snapshotOAM();

            // Write new value
            const newValue = (originalValue + WRITE_DELTA) & 0xFF;
            console.log(`- Writing new value: ${newValue}`);
            this.nes.cpu.mem[addr] = newValue;

            // Step 2 frames and check OAM
            this.nes.frame();
            this.nes.frame();
            const oamAfter = this.snapshotOAM();

            // Look for sprite movement
            let verifiedSprites = [];
            for (let sprite = 0; sprite < 64; sprite++) {
                const xBefore = oamBaseline[sprite * 4 + 3];
                const yBefore = oamBaseline[sprite * 4];
                const xAfter = oamAfter[sprite * 4 + 3];
                const yAfter = oamAfter[sprite * 4];

                const deltaX = Math.abs(xAfter - xBefore);
                const deltaY = Math.abs(yAfter - yBefore);

                // Check if movement matches our write delta (±tolerance)
                if (Math.abs(deltaX - WRITE_DELTA) <= TOLERANCE || Math.abs(deltaY - WRITE_DELTA) <= TOLERANCE) {
                    console.log(`- Sprite ${sprite} moved: (${xBefore},${yBefore}) → (${xAfter},${yAfter})`);
                    verifiedSprites.push({
                        sprite: sprite,
                        axis: Math.abs(deltaX - WRITE_DELTA) <= TOLERANCE ? 'x' : 'y',
                        movement: Math.abs(deltaX - WRITE_DELTA) <= TOLERANCE ? deltaX : deltaY
                    });
                }
            }

            if (verifiedSprites.length > 0) {
                const verified = {
                    address: candidate,
                    type: 'player_position',
                    axis: verifiedSprites[0].axis,
                    controlled_sprites: verifiedSprites,
                    confidence: 'high',
                    test_delta: WRITE_DELTA,
                    observed_movement: verifiedSprites[0].movement
                };

                verifiedPlayerVars.push(verified);
                this.playerSprites.push(...verifiedSprites.map(s => s.sprite));
                console.log(`✅ VERIFIED: ${candidate} controls player ${verified.axis}-position`);
            } else {
                console.log(`❌ NOT VERIFIED: ${candidate} - no matching sprite movement`);
            }

            this.testResults.candidates_tested++;
        }

        this.testResults.player_position_vars = verifiedPlayerVars;
        console.log(`\nPlayer position verification: ${verifiedPlayerVars.length}/${positionCandidates.length} verified`);

        return verifiedPlayerVars;
    }

    verifyEnemyPositionVariables(positionCandidates) {
        console.log('\n=== PHASE 2B: Enemy Position Verification ===');

        if (!this.enemiesPresentState) {
            console.log('⚠️ No enemies-present state available, skipping enemy verification');
            return [];
        }

        const verifiedEnemyVars = [];
        const WRITE_DELTA = 20;
        const TOLERANCE = 8;

        // Get unique player sprites to exclude from enemy detection
        const playerSpriteSet = new Set(this.playerSprites);

        for (const candidate of positionCandidates) {
            console.log(`\nTesting enemy candidate: ${candidate}`);
            const addr = parseInt(candidate, 16);

            // Skip if already verified as player variable
            if (this.testResults.player_position_vars.some(v => v.address === candidate)) {
                console.log(`- Skipping (already verified as player variable)`);
                continue;
            }

            // Restore enemies-present state
            this.nes.fromJSON(this.enemiesPresentState);
            this.clearInput();

            const originalValue = this.nes.cpu.mem[addr];
            console.log(`- Original value: ${originalValue}`);

            // Get baseline OAM
            this.nes.frame();
            this.nes.frame();
            const oamBaseline = this.snapshotOAM();

            // Write new value
            const newValue = (originalValue + WRITE_DELTA) & 0xFF;
            this.nes.cpu.mem[addr] = newValue;

            // Step frames and check OAM
            this.nes.frame();
            this.nes.frame();
            const oamAfter = this.snapshotOAM();

            // Look for non-player sprite movement
            let verifiedSprites = [];
            for (let sprite = 0; sprite < 64; sprite++) {
                if (playerSpriteSet.has(sprite)) continue; // Skip player sprites

                const xBefore = oamBaseline[sprite * 4 + 3];
                const yBefore = oamBaseline[sprite * 4];
                const xAfter = oamAfter[sprite * 4 + 3];
                const yAfter = oamAfter[sprite * 4];

                const deltaX = Math.abs(xAfter - xBefore);
                const deltaY = Math.abs(yAfter - yBefore);

                if (Math.abs(deltaX - WRITE_DELTA) <= TOLERANCE || Math.abs(deltaY - WRITE_DELTA) <= TOLERANCE) {
                    console.log(`- Enemy sprite ${sprite} moved: (${xBefore},${yBefore}) → (${xAfter},${yAfter})`);
                    verifiedSprites.push({
                        sprite: sprite,
                        axis: Math.abs(deltaX - WRITE_DELTA) <= TOLERANCE ? 'x' : 'y',
                        movement: Math.abs(deltaX - WRITE_DELTA) <= TOLERANCE ? deltaX : deltaY
                    });
                }
            }

            if (verifiedSprites.length > 0) {
                const verified = {
                    address: candidate,
                    type: 'enemy_position',
                    axis: verifiedSprites[0].axis,
                    controlled_sprites: verifiedSprites,
                    confidence: 'high',
                    test_delta: WRITE_DELTA,
                    observed_movement: verifiedSprites[0].movement
                };

                verifiedEnemyVars.push(verified);
                console.log(`✅ VERIFIED: ${candidate} controls enemy ${verified.axis}-position`);
            } else {
                console.log(`❌ NOT VERIFIED: ${candidate} - no enemy sprite movement`);
            }

            this.testResults.candidates_tested++;
        }

        this.testResults.enemy_position_vars = verifiedEnemyVars;
        console.log(`\nEnemy position verification: ${verifiedEnemyVars.length}/${positionCandidates.length - this.testResults.player_position_vars.length} verified`);

        return verifiedEnemyVars;
    }

    verifySpeedVariables(speedCandidates) {
        console.log('\n=== PHASE 2C: Speed Variable Verification ===');

        const verifiedSpeedVars = [];

        for (const candidate of speedCandidates) {
            console.log(`\nTesting speed candidate: ${candidate}`);
            const addr = parseInt(candidate, 16);

            // Test 1: Measure normal speed
            this.nes.fromJSON(this.baselineState);
            this.clearInput();

            const playerSprite = this.playerSprites[0] || 0; // Use first identified player sprite
            const positions1 = [];

            this.nes.buttonDown(1, Controller.BUTTON_RIGHT);
            for (let frame = 0; frame < 30; frame++) {
                this.nes.frame();
                const oam = this.snapshotOAM();
                const x = oam[playerSprite * 4 + 3];
                positions1.push(x);
            }
            this.nes.buttonUp(1, Controller.BUTTON_RIGHT);

            const normalSpeed = this.calculateAverageSpeed(positions1);
            console.log(`- Normal speed: ${normalSpeed.toFixed(2)} pixels/frame`);

            // Test 2: Modify speed variable and measure again
            this.nes.fromJSON(this.baselineState);
            this.clearInput();

            const originalSpeedValue = this.nes.cpu.mem[addr];
            console.log(`- Original speed value: ${originalSpeedValue}`);

            // Try to slow down by setting to 0 or 1
            const slowedValue = Math.min(1, originalSpeedValue);
            this.nes.cpu.mem[addr] = slowedValue;
            console.log(`- Modified speed value: ${slowedValue}`);

            const positions2 = [];
            this.nes.buttonDown(1, Controller.BUTTON_RIGHT);
            for (let frame = 0; frame < 30; frame++) {
                this.nes.frame();
                const oam = this.snapshotOAM();
                const x = oam[playerSprite * 4 + 3];
                positions2.push(x);
            }
            this.nes.buttonUp(1, Controller.BUTTON_RIGHT);

            const modifiedSpeed = this.calculateAverageSpeed(positions2);
            console.log(`- Modified speed: ${modifiedSpeed.toFixed(2)} pixels/frame`);

            // Check if speed was significantly affected
            const speedReduction = normalSpeed - modifiedSpeed;
            const speedReductionPercent = (speedReduction / normalSpeed) * 100;

            if (speedReductionPercent > 20) { // >20% reduction
                const verified = {
                    address: candidate,
                    type: 'speed_variable',
                    normal_speed: normalSpeed,
                    modified_speed: modifiedSpeed,
                    reduction_percent: speedReductionPercent,
                    confidence: 'high'
                };

                verifiedSpeedVars.push(verified);
                console.log(`✅ VERIFIED: ${candidate} is a speed variable (${speedReductionPercent.toFixed(1)}% reduction)`);
            } else {
                console.log(`❌ NOT VERIFIED: ${candidate} - no significant speed change (${speedReductionPercent.toFixed(1)}%)`);
            }

            this.testResults.candidates_tested++;
        }

        this.testResults.speed_vars = verifiedSpeedVars;
        console.log(`\nSpeed verification: ${verifiedSpeedVars.length}/${speedCandidates.length} verified`);

        return verifiedSpeedVars;
    }

    calculateAverageSpeed(positions) {
        if (positions.length < 2) return 0;

        let totalDistance = 0;
        let validFrames = 0;

        for (let i = 1; i < positions.length; i++) {
            const distance = Math.abs(positions[i] - positions[i-1]);
            if (distance < 100) { // Filter out wrap-around movements
                totalDistance += distance;
                validFrames++;
            }
        }

        return validFrames > 0 ? totalDistance / validFrames : 0;
    }

    // Helper methods
    clearInput() {
        for (const btn of [Controller.BUTTON_A, Controller.BUTTON_B, Controller.BUTTON_SELECT,
                          Controller.BUTTON_START, Controller.BUTTON_UP, Controller.BUTTON_DOWN,
                          Controller.BUTTON_LEFT, Controller.BUTTON_RIGHT]) {
            this.nes.buttonUp(1, btn);
        }
    }

    isGameplay() {
        return this.activeSprites() > 4 && this.nametableDensity() > 0.55;
    }

    activeSprites() {
        let count = 0;
        const oam = this.nes.ppu.spriteMem;
        for (let i = 0; i < 64; i++) {
            const y = oam[i * 4];
            if (y < 0xEF) count++;
        }
        return count;
    }

    nametableDensity() {
        let nonZero = 0;
        const vram = this.nes.ppu.vramMem;
        for (let i = 0x2000; i < 0x23C0; i++) {
            if (vram[i] !== 0) nonZero++;
        }
        return nonZero / (0x23C0 - 0x2000);
    }

    snapshotOAM() {
        return this.nes.ppu.spriteMem.slice(0, 256);
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

    generateVerifiedMap(romPath) {
        this.testResults.verified_controls =
            this.testResults.player_position_vars.length +
            this.testResults.enemy_position_vars.length +
            this.testResults.speed_vars.length;

        const verifiedMap = {
            meta: {
                rom_file: path.basename(romPath),
                verification_method: 'write_verify_oracle',
                source_trace_file: path.basename(this.traceData.meta.rom_file || 'unknown'),
                generated_timestamp: new Date().toISOString()
            },
            verification_stats: this.testResults,
            verified_variables: [
                ...this.testResults.player_position_vars,
                ...this.testResults.enemy_position_vars,
                ...this.testResults.speed_vars
            ],
            player_sprite_mapping: this.playerSprites.map(sprite => ({
                sprite_index: sprite,
                type: 'player'
            })),
            control_summary: {
                player_x_position: this.testResults.player_position_vars.filter(v => v.axis === 'x').map(v => v.address),
                player_y_position: this.testResults.player_position_vars.filter(v => v.axis === 'y').map(v => v.address),
                enemy_positions: this.testResults.enemy_position_vars.map(v => v.address),
                speed_controls: this.testResults.speed_vars.map(v => v.address)
            }
        };

        return verifiedMap;
    }

    runVerification(tracePath, romPath, outputPath = null) {
        console.log('🔬 VERIFIED BEHAVIORAL MAP GENERATION');
        console.log('=====================================');

        // Phase 1: Load trace data
        const { posVars, speedVars } = this.loadTraceData(tracePath);

        if (posVars.length === 0 && speedVars.length === 0) {
            console.log('❌ No candidate variables found in trace data');
            return null;
        }

        // Phase 2: Boot to gameplay
        if (!this.bootToGameplay(romPath)) {
            console.log('❌ Failed to boot to gameplay');
            return null;
        }

        // Phase 2: Prepare enemies state
        this.prepareEnemiesState();

        // Phase 2: Run verification tests
        const playerVars = this.verifyPlayerPositionVariables(posVars);
        const enemyVars = this.verifyEnemyPositionVariables(posVars);
        const speedVarsVerified = this.verifySpeedVariables(speedVars);

        // Phase 3: Generate verified map
        const verifiedMap = this.generateVerifiedMap(romPath);

        console.log('\n🏁 VERIFICATION RESULTS');
        console.log('=======================');
        console.log(`Candidates tested: ${this.testResults.candidates_tested}`);
        console.log(`Verified controls: ${this.testResults.verified_controls}`);
        console.log(`Player position vars: ${this.testResults.player_position_vars.length}`);
        console.log(`Enemy position vars: ${this.testResults.enemy_position_vars.length}`);
        console.log(`Speed vars: ${this.testResults.speed_vars.length}`);
        console.log(`Player sprites identified: [${this.playerSprites.join(', ')}]`);

        if (outputPath) {
            const outputDir = path.dirname(outputPath);
            if (!fs.existsSync(outputDir)) {
                fs.mkdirSync(outputDir, { recursive: true });
            }
            fs.writeFileSync(outputPath, JSON.stringify(verifiedMap, null, 2));
            console.log(`\nVerified map saved to: ${outputPath}`);
        }

        return verifiedMap;
    }
}

// CLI interface
function main() {
    const args = process.argv.slice(2);

    if (args.length < 2) {
        console.log('Usage: node verified-behavioral-map.cjs <trace-file.json> <rom-file> [--output <output-file>]');
        console.log('');
        console.log('Examples:');
        console.log('  node verified-behavioral-map.cjs analysis-output/trace-mm2.json ~/nes-roms/Mega\\ Man\\ 2.nes');
        console.log('  node verified-behavioral-map.cjs analysis-output/trace-smb.json smb.nes --output verified-map-smb.json');
        process.exit(1);
    }

    const tracePath = args[0];
    const romPath = args[1];
    let outputPath = null;

    const outputIndex = args.indexOf('--output');
    if (outputIndex !== -1 && outputIndex + 1 < args.length) {
        outputPath = args[outputIndex + 1];
    }

    if (!fs.existsSync(tracePath)) {
        console.error(`Error: Trace file not found: ${tracePath}`);
        process.exit(1);
    }

    if (!fs.existsSync(romPath)) {
        console.error(`Error: ROM file not found: ${romPath}`);
        process.exit(1);
    }

    try {
        const generator = new VerifiedBehavioralMapGenerator();
        generator.runVerification(tracePath, romPath, outputPath);
    } catch (error) {
        console.error(`Error: ${error.message}`);
        console.error(error.stack);
        process.exit(1);
    }
}

if (require.main === module) {
    main();
}

module.exports = { VerifiedBehavioralMapGenerator };