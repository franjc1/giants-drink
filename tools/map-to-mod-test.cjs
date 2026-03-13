#!/usr/bin/env node
/**
 * Map-to-Modification Test - THE CRITICAL VALIDATION
 *
 * This test closes the loop between trace analysis and live modification.
 * It loads behavioral maps from the trace analyzer and uses them to make
 * targeted modifications to a running game.
 *
 * Success here validates the entire pipeline end-to-end.
 */

const fs = require('fs');
const path = require('path');
const { NES, Controller } = require('jsnes');

class MapToModTest {
    constructor() {
        this.behavioralMap = null;
        this.nes = null;
        this.baselineState = null;
        this.results = {
            player_teleport: 'NOT_TESTED',
            enemy_teleport: 'NOT_TESTED',
            enemy_freeze: 'NOT_TESTED',
            palette_swap: 'NOT_TESTED',
            tile_modification: 'NOT_TESTED'
        };
    }

    loadBehavioralMap(mapPath) {
        console.log(`Loading behavioral map: ${mapPath}`);
        this.behavioralMap = JSON.parse(fs.readFileSync(mapPath));

        console.log('=== BEHAVIORAL MAP SUMMARY ===');
        console.log(`Variables found: ${this.behavioralMap.stats.ram_variables_found}`);
        console.log(`Position variables: ${this.behavioralMap.variable_summary.position_variables.length}`);
        console.log(`Speed variables: ${this.behavioralMap.variable_summary.speed_variables.length}`);
        console.log(`State variables: ${this.behavioralMap.variable_summary.state_variables.length}`);

        console.log('\nPosition variables:', this.behavioralMap.variable_summary.position_variables.join(', '));
        console.log('Speed variables:', this.behavioralMap.variable_summary.speed_variables.join(', '));

        return this.behavioralMap;
    }

    bootToGameplay(romPath) {
        console.log(`\nBooting ${path.basename(romPath)} to gameplay...`);

        // Create NES instance
        this.nes = new NES({
            onFrame: () => {},
            onAudioSample: null,
            emulateSound: false
        });

        // Load ROM
        const romData = fs.readFileSync(romPath);
        this.nes.loadROM(romData.toString('binary'));

        // Boot and find gameplay
        let attempts = 0;
        const maxAttempts = 1000; // ~16 seconds at 60fps

        while (attempts < maxAttempts) {
            // Clear all inputs
            this.clearInput();

            // Press Start periodically to get through menus
            if (attempts % 120 === 0) {
                this.nes.buttonDown(1, Controller.BUTTON_START);
                this.nes.frame();
                this.nes.buttonUp(1, Controller.BUTTON_START);
            }

            this.nes.frame();
            attempts++;

            // Check for gameplay state
            if (this.isGameplay()) {
                console.log(`- Gameplay detected at frame ${attempts}`);

                // Test bidirectional movement to confirm player control
                const oamBefore = this.snapshotOAM();

                // Test Right
                this.nes.buttonDown(1, Controller.BUTTON_RIGHT);
                this.nes.frame();
                this.nes.frame();
                this.nes.buttonUp(1, Controller.BUTTON_RIGHT);

                const oamAfterRight = this.snapshotOAM();

                // Test Left
                this.nes.buttonDown(1, Controller.BUTTON_LEFT);
                this.nes.frame();
                this.nes.frame();
                this.nes.buttonUp(1, Controller.BUTTON_LEFT);

                const oamAfterLeft = this.snapshotOAM();

                // Check if any sprite moved during control test
                if (this.detectOAMMovement(oamBefore, oamAfterRight) ||
                    this.detectOAMMovement(oamBefore, oamAfterLeft)) {

                    console.log(`- Player control confirmed at frame ${attempts}`);
                    this.baselineState = this.nes.toJSON();
                    return true;
                }
            }
        }

        console.log('- Failed to reach gameplay state');
        return false;
    }

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
            if (y < 0xEF) count++; // Y < 239 means on-screen
        }
        return count;
    }

    nametableDensity() {
        let nonZero = 0;
        const vram = this.nes.ppu.vramMem;
        for (let i = 0x2000; i < 0x23C0; i++) { // Nametable 0 tile area
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

    saveScreenshot(filename) {
        // Simple PPM format for screenshots
        const frameBuffer = new Uint32Array(256 * 240);

        // Capture current frame
        let bufferIndex = 0;
        this.nes.onFrame = (buffer) => {
            for (let i = 0; i < buffer.length; i++) {
                frameBuffer[i] = buffer[i];
            }
            bufferIndex = buffer.length;
        };

        this.nes.frame(); // Trigger frame capture

        // Convert to PPM
        let ppm = 'P3\n256 240\n255\n';
        for (let i = 0; i < bufferIndex; i++) {
            const pixel = frameBuffer[i];
            const r = (pixel >>> 16) & 0xFF;
            const g = (pixel >>> 8) & 0xFF;
            const b = pixel & 0xFF;
            ppm += `${r} ${g} ${b} `;
            if (i % 256 === 255) ppm += '\n';
        }

        const outputPath = `~/giants-drink/experiment-output/${filename}`;
        fs.writeFileSync(path.expanduser ? path.expanduser(outputPath) : outputPath.replace('~', require('os').homedir()), ppm);
        console.log(`Screenshot saved: ${filename}`);
    }

    // STEP 3: Test targeted modifications
    testPlayerTeleport() {
        console.log('\n=== SUB-TEST A: Player Teleport ===');

        if (!this.behavioralMap.variable_summary.position_variables.length) {
            console.log('❌ FAIL: No position variables found in behavioral map');
            this.results.player_teleport = 'FAIL';
            return false;
        }

        // Use the first position variable from the behavioral map
        const playerPosAddr = this.behavioralMap.variable_summary.position_variables[0];
        const addr = parseInt(playerPosAddr, 16);

        console.log(`Testing position variable: ${playerPosAddr} (${addr})`);

        // Restore baseline
        this.nes.fromJSON(this.baselineState);
        this.clearInput();

        // Read current player position
        const originalPos = this.nes.cpu.mem[addr];
        console.log(`- Original position at ${playerPosAddr}: ${originalPos}`);

        // Get baseline OAM
        this.nes.frame();
        const oamBefore = this.snapshotOAM();

        // Teleport player to a dramatically different position
        const newPos = (originalPos + 100) % 256; // Move right by 100 pixels
        console.log(`- Writing new position: ${newPos}`);
        this.nes.cpu.mem[addr] = newPos;

        // Step a few frames and check OAM
        this.nes.frame();
        this.nes.frame();
        this.nes.frame();
        const oamAfter = this.snapshotOAM();

        // Check if any sprite moved significantly
        let significantMovement = false;
        for (let i = 0; i < 64; i++) {
            const xBefore = oamBefore[i * 4 + 3];
            const xAfter = oamAfter[i * 4 + 3];
            const yBefore = oamBefore[i * 4];
            const yAfter = oamAfter[i * 4];

            if (Math.abs(xBefore - xAfter) > 50 || Math.abs(yBefore - yAfter) > 50) {
                console.log(`- Sprite ${i} moved: (${xBefore},${yBefore}) → (${xAfter},${yAfter})`);
                significantMovement = true;
            }
        }

        // Verify the RAM address still holds our value
        const currentPos = this.nes.cpu.mem[addr];
        console.log(`- Position after frames: ${currentPos}`);

        this.saveScreenshot('mm2-player-teleport.ppm');

        if (significantMovement) {
            console.log('✅ PASS: Player teleported successfully');
            this.results.player_teleport = 'PASS';
            return true;
        } else {
            console.log('❌ FAIL: No significant sprite movement detected');
            this.results.player_teleport = 'FAIL';
            return false;
        }
    }

    testEnemyTeleport() {
        console.log('\n=== SUB-TEST B: Enemy Teleport ===');

        // Restore baseline
        this.nes.fromJSON(this.baselineState);
        this.clearInput();

        // Run gameplay until enemies appear (hold Right for 200-300 frames)
        console.log('- Running gameplay to find enemies...');
        this.nes.buttonDown(1, Controller.BUTTON_RIGHT);

        let enemyFound = false;
        let enemyAddr = null;

        for (let frame = 0; frame < 300; frame++) {
            this.nes.frame();

            // Check if we have multiple sprites (player + enemies)
            if (frame % 50 === 0 && this.activeSprites() > 6) {
                console.log(`- Frame ${frame}: ${this.activeSprites()} sprites active`);

                // Look for position variables that might be enemies
                for (const posVar of this.behavioralMap.variable_summary.position_variables.slice(1, 4)) {
                    const addr = parseInt(posVar, 16);
                    const value = this.nes.cpu.mem[addr];

                    // If the value is in a reasonable screen range, it might be an enemy
                    if (value > 0 && value < 250 && addr !== parseInt(this.behavioralMap.variable_summary.position_variables[0], 16)) {
                        console.log(`- Potential enemy position at ${posVar}: ${value}`);
                        enemyAddr = addr;
                        enemyFound = true;
                        break;
                    }
                }

                if (enemyFound) break;
            }
        }

        this.nes.buttonUp(1, Controller.BUTTON_RIGHT);

        if (!enemyFound) {
            console.log('❌ FAIL: Could not identify enemy position variable');
            this.results.enemy_teleport = 'FAIL';
            return false;
        }

        // Test enemy teleport
        const originalEnemyPos = this.nes.cpu.mem[enemyAddr];
        console.log(`- Found enemy at address 0x${enemyAddr.toString(16)}: position ${originalEnemyPos}`);

        const oamBefore = this.snapshotOAM();

        // Teleport enemy
        const newEnemyPos = (originalEnemyPos + 80) % 256;
        console.log(`- Teleporting enemy to position: ${newEnemyPos}`);
        this.nes.cpu.mem[enemyAddr] = newEnemyPos;

        // Step frames and check movement
        this.nes.frame();
        this.nes.frame();
        this.nes.frame();
        const oamAfter = this.snapshotOAM();

        // Check for sprite movement
        let enemyMoved = false;
        for (let i = 0; i < 64; i++) {
            const xBefore = oamBefore[i * 4 + 3];
            const xAfter = oamAfter[i * 4 + 3];

            if (Math.abs(xBefore - xAfter) > 40) {
                console.log(`- Enemy sprite ${i} moved: ${xBefore} → ${xAfter}`);
                enemyMoved = true;
            }
        }

        this.saveScreenshot('mm2-enemy-teleport.ppm');

        if (enemyMoved) {
            console.log('✅ PASS: Enemy teleported successfully');
            this.results.enemy_teleport = 'PASS';
            return true;
        } else {
            console.log('❌ FAIL: No enemy movement detected');
            this.results.enemy_teleport = 'FAIL';
            return false;
        }
    }

    testEnemyFreeze() {
        console.log('\n=== SUB-TEST C: Enemy Freeze ===');

        // Use the same enemy finding logic as teleport test
        this.nes.fromJSON(this.baselineState);
        this.clearInput();

        console.log('- Finding enemy to freeze...');
        this.nes.buttonDown(1, Controller.BUTTON_RIGHT);

        let enemyAddr = null;

        for (let frame = 0; frame < 300; frame++) {
            this.nes.frame();

            if (frame % 50 === 0 && this.activeSprites() > 6) {
                // Find an enemy position variable
                for (const posVar of this.behavioralMap.variable_summary.position_variables.slice(1, 3)) {
                    const addr = parseInt(posVar, 16);
                    const value = this.nes.cpu.mem[addr];

                    if (value > 0 && value < 250) {
                        enemyAddr = addr;
                        console.log(`- Will freeze enemy at 0x${addr.toString(16)}: position ${value}`);
                        break;
                    }
                }

                if (enemyAddr) break;
            }
        }

        this.nes.buttonUp(1, Controller.BUTTON_RIGHT);

        if (!enemyAddr) {
            console.log('❌ FAIL: Could not find enemy to freeze');
            this.results.enemy_freeze = 'FAIL';
            return false;
        }

        // Freeze enemy by overriding position every frame
        const frozenPos = this.nes.cpu.mem[enemyAddr];
        console.log(`- Freezing enemy at position: ${frozenPos}`);

        const oamStart = this.snapshotOAM();
        let playerMoved = false;
        let enemyStayedFrozen = true;

        for (let frame = 0; frame < 60; frame++) {
            // Override enemy position every frame
            this.nes.cpu.mem[enemyAddr] = frozenPos;

            // Apply some player input to ensure other entities continue moving
            if (frame % 20 === 0) {
                this.nes.buttonDown(1, Controller.BUTTON_RIGHT);
            } else if (frame % 20 === 10) {
                this.nes.buttonUp(1, Controller.BUTTON_RIGHT);
            }

            this.nes.frame();

            // Check that enemy position stays frozen
            const currentPos = this.nes.cpu.mem[enemyAddr];
            if (Math.abs(currentPos - frozenPos) > 5) {
                console.log(`- Enemy broke free at frame ${frame}: ${currentPos} vs expected ${frozenPos}`);
                enemyStayedFrozen = false;
            }
        }

        // Check that player/other entities continued to move normally
        const oamEnd = this.snapshotOAM();
        for (let i = 0; i < 64; i++) {
            const xStart = oamStart[i * 4 + 3];
            const xEnd = oamEnd[i * 4 + 3];
            if (Math.abs(xStart - xEnd) > 10) {
                playerMoved = true;
                break;
            }
        }

        this.saveScreenshot('mm2-enemy-freeze.ppm');

        if (enemyStayedFrozen && playerMoved) {
            console.log('✅ PASS: Enemy frozen while other entities continued moving');
            this.results.enemy_freeze = 'PASS';
            return true;
        } else {
            console.log(`❌ FAIL: enemyFrozen=${enemyStayedFrozen}, playerMoved=${playerMoved}`);
            this.results.enemy_freeze = 'FAIL';
            return false;
        }
    }

    testPaletteSwap() {
        console.log('\n=== SUB-TEST D: Palette Swap ===');

        // Restore baseline
        this.nes.fromJSON(this.baselineState);
        this.clearInput();

        // Read current background palette
        console.log('- Reading current background palette...');
        const originalPalette = [];
        for (let i = 0x3F00; i <= 0x3F0F; i++) {
            originalPalette.push(this.nes.ppu.vramMem[i]);
        }
        console.log('- Original palette:', originalPalette.map(c => `0x${c.toString(16).padStart(2, '0')}`).join(' '));

        // Write dramatically different palette colors
        console.log('- Writing new palette colors...');
        const newColors = [0x0F, 0x16, 0x26, 0x36, 0x37, 0x17, 0x27, 0x07, 0x3D, 0x2D, 0x1D, 0x0D, 0x30, 0x20, 0x10, 0x00];
        for (let i = 0; i < 16; i++) {
            this.nes.ppu.vramMem[0x3F00 + i] = newColors[i];
        }

        // Run a few frames to see the color change
        this.nes.frame();
        this.nes.frame();
        this.nes.frame();

        this.saveScreenshot('mm2-palette-swap.ppm');

        // Verify the palette change stuck
        let paletteChanged = false;
        for (let i = 0; i < 16; i++) {
            if (this.nes.ppu.vramMem[0x3F00 + i] !== originalPalette[i]) {
                paletteChanged = true;
                break;
            }
        }

        if (paletteChanged) {
            console.log('✅ PASS: Palette successfully modified');
            this.results.palette_swap = 'PASS';
            return true;
        } else {
            console.log('❌ FAIL: Palette modification did not stick');
            this.results.palette_swap = 'FAIL';
            return false;
        }
    }

    testTileModification() {
        console.log('\n=== SUB-TEST E: Tile Modification ===');

        // Restore baseline
        this.nes.fromJSON(this.baselineState);
        this.clearInput();

        // MM2 uses CHR-RAM, so we can modify pattern table data
        console.log('- Modifying CHR-RAM tile data...');

        // Pick a tile to modify (tile 0x01, commonly used)
        const tileAddr = 0x0010; // Tile 1 in pattern table 0

        // Read original tile data
        const originalTile = [];
        for (let i = 0; i < 16; i++) {
            originalTile.push(this.nes.ppu.vramMem[tileAddr + i]);
        }

        console.log('- Original tile data at 0x' + tileAddr.toString(16) + ':', originalTile.map(b => `0x${b.toString(16).padStart(2, '0')}`).join(' '));

        // Write new tile data (solid checkerboard pattern)
        const newTileData = [0xAA, 0x55, 0xAA, 0x55, 0xAA, 0x55, 0xAA, 0x55, 0xAA, 0x55, 0xAA, 0x55, 0xAA, 0x55, 0xAA, 0x55];
        for (let i = 0; i < 16; i++) {
            this.nes.ppu.vramMem[tileAddr + i] = newTileData[i];
        }

        console.log('- New tile data written:', newTileData.map(b => `0x${b.toString(16).padStart(2, '0')}`).join(' '));

        // Run frames to see the change
        this.nes.frame();
        this.nes.frame();
        this.nes.frame();

        this.saveScreenshot('mm2-tile-modification.ppm');

        // Verify the tile data change stuck
        let tileChanged = false;
        for (let i = 0; i < 16; i++) {
            if (this.nes.ppu.vramMem[tileAddr + i] !== originalTile[i]) {
                tileChanged = true;
                break;
            }
        }

        if (tileChanged) {
            console.log('✅ PASS: Tile data successfully modified');
            this.results.tile_modification = 'PASS';
            return true;
        } else {
            console.log('❌ FAIL: Tile modification did not stick');
            this.results.tile_modification = 'FAIL';
            return false;
        }
    }

    runAllTests(mapPath, romPath) {
        console.log('🎯 MAP-TO-MODIFICATION VALIDATION TEST');
        console.log('=====================================');

        // Step 1: Load behavioral map
        this.loadBehavioralMap(mapPath);

        // Step 2: Boot to gameplay
        if (!this.bootToGameplay(romPath)) {
            console.log('❌ CRITICAL FAILURE: Could not boot to gameplay');
            return false;
        }

        // Ensure experiment output directory exists
        const expDir = path.join(require('os').homedir(), 'giants-drink', 'experiment-output');
        if (!fs.existsSync(expDir)) {
            fs.mkdirSync(expDir, { recursive: true });
        }

        // Step 3: Run all sub-tests
        this.testPlayerTeleport();
        this.testEnemyTeleport();
        this.testEnemyFreeze();
        this.testPaletteSwap();
        this.testTileModification();

        // Report final results
        console.log('\n🏁 FINAL RESULTS');
        console.log('================');
        console.log(`Player Teleport:    ${this.results.player_teleport}`);
        console.log(`Enemy Teleport:     ${this.results.enemy_teleport}`);
        console.log(`Enemy Freeze:       ${this.results.enemy_freeze}`);
        console.log(`Palette Swap:       ${this.results.palette_swap}`);
        console.log(`Tile Modification:  ${this.results.tile_modification}`);

        const passCount = Object.values(this.results).filter(r => r === 'PASS').length;
        const totalTests = Object.values(this.results).length;

        console.log(`\nOVERALL: ${passCount}/${totalTests} tests passed`);

        if (passCount === totalTests) {
            console.log('🎉 COMPLETE SUCCESS: Behavioral map → Runtime modification pipeline VALIDATED!');
            return true;
        } else if (passCount > 0) {
            console.log('⚠️  PARTIAL SUCCESS: Some modifications worked, some failed');
            return false;
        } else {
            console.log('❌ COMPLETE FAILURE: No modifications worked');
            return false;
        }
    }
}

// CLI interface
function main() {
    const args = process.argv.slice(2);

    if (args.length < 2) {
        console.log('Usage: node map-to-mod-test.cjs <behavioral-map.json> <rom-file>');
        console.log('');
        console.log('Example:');
        console.log('  node map-to-mod-test.cjs analysis-output/trace-mm2.json ~/nes-roms/Mega\\ Man\\ 2.nes');
        process.exit(1);
    }

    const mapPath = args[0];
    const romPath = args[1];

    if (!fs.existsSync(mapPath)) {
        console.error(`Error: Behavioral map not found: ${mapPath}`);
        process.exit(1);
    }

    if (!fs.existsSync(romPath)) {
        console.error(`Error: ROM file not found: ${romPath}`);
        process.exit(1);
    }

    try {
        const tester = new MapToModTest();
        const success = tester.runAllTests(mapPath, romPath);
        process.exit(success ? 0 : 1);
    } catch (error) {
        console.error(`Error: ${error.message}`);
        console.error(error.stack);
        process.exit(1);
    }
}

if (require.main === module) {
    main();
}

module.exports = { MapToModTest };