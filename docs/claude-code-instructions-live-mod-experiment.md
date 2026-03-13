# Claude Code Instructions: Live Game Modification Experiment

## WHAT THIS IS

This is a critical architectural experiment for Two Fires. We need to determine whether "controlling a running game through memory manipulation" is a viable paradigm for the project. The results of this experiment determine the entire project's technical direction.

**The question:** Can we meaningfully modify a running NES game in real-time — changing visuals, entity behavior, level content, and injecting new entities — through RAM/VRAM writes while the game continues running correctly?

## READ FIRST

1. `tools/test-jsnes.js` — the jsnes validation test from Session 13. Copy its patterns for NES initialization.
2. This file (read completely before writing any code)

## VERIFIED jsnes API

```javascript
const { NES } = require('jsnes');
const { Controller } = require('jsnes');

const nes = new NES({
  onFrame: function(frameBuffer) { /* 256x240 RGBA pixel data */ },
  onAudioSample: function(left, right) { /* audio callback */ }
});

// Load ROM (jsnes expects binary string, NOT buffer)
const romData = fs.readFileSync(romPath);
nes.loadROM(romData.toString('binary'));

// Frame step (synchronous)
nes.frame();

// RAM read/write (CPU address space 0x0000-0x07FF = 2KB internal RAM)
const val = nes.cpu.mem[addr];     // read
nes.cpu.mem[addr] = value;         // write

// Controller input
nes.buttonDown(1, Controller.BUTTON_RIGHT);
nes.buttonUp(1, Controller.BUTTON_RIGHT);

// Savestates
const state = nes.toJSON();
nes.fromJSON(state);

// PPU access
nes.ppu.vramMem[addr]    // VRAM (nametables, pattern tables for CHR-RAM games)
nes.ppu.spriteMem[addr]  // OAM (sprite positions, tile indices, attributes)
```

**NES memory map reminders:**
- CPU $0000-$07FF: 2KB internal RAM (mirrored at $0800, $1000, $1800)
- CPU $2000-$2007: PPU registers (PPUCTRL, PPUMASK, PPUSTATUS, OAMADDR, OAMDATA, PPUSCROLL, PPUADDR, PPUDATA)
- CPU $4000-$4017: APU and I/O registers
- CPU $8000-$FFFF: cartridge PRG-ROM (game code)
- PPU $0000-$1FFF: pattern tables (CHR — tile pixel data)
- PPU $2000-$2FFF: nametables (tile layout for background)
- PPU $3F00-$3F1F: palettes (background $3F00-$3F0F, sprite $3F10-$3F1F)

**PPU palette format:** Each palette is 4 bytes. Background has 4 palettes ($3F00-$3F0F), sprites have 4 palettes ($3F10-$3F1F). Byte 0 of each group ($3F00) is the universal background color.

**jsnes PPU memory access:** `nes.ppu.vramMem` is the PPU address space. So palette RAM is at indices $3F00-$3F1F within vramMem. Nametables start at $2000. Pattern tables at $0000.

## ROM LOCATION

NES ROMs are at `~/nes-roms/`. SMB is likely named something like `Super Mario Bros. (World).nes` or similar. Use `ls ~/nes-roms/ | grep -i mario` to find it. If you also need a CHR-RAM game, use `Mega Man 2 (USA).nes` or search with `grep -i mega`.

## THE EXPERIMENT

Build a single Node.js script: `tools/live-mod-experiment.js`

This script runs 4 steps sequentially. Each step builds on the last. **Report results after each step before proceeding to the next.** If a step fails, stop and report exactly what happened.

The script must save visual output so Joe can see results. For each sub-test, capture the frame buffer at key moments and save as PNG. Use the `pngjs` package (`npm install pngjs` in ~/giants-drink if not already installed) or write raw PPM files (simpler, no dependency).

### STEP 0: Examine jsnes internals (do this BEFORE writing any test code)

Before writing any experiment code, read jsnes's source code to understand:

1. **PPU memory access:** When we write to `nes.ppu.vramMem[addr]`, does it take effect immediately? Or is there a sync/latch mechanism? Check how jsnes handles PPU writes — the real NES requires writing to PPUADDR ($2006) twice then PPUDATA ($2007) to update VRAM. Does jsnes's vramMem array bypass this, or is it the same backing store?

2. **CHR-ROM vs CHR-RAM handling:** How does jsnes handle cartridge CHR data? Is CHR-ROM mapped read-only in vramMem, or can we write to it? Check the mapper implementation (SMB uses mapper 0 / NROM). Specifically look at how pattern table addresses $0000-$1FFF are handled.

3. **OAM access:** Can we write to `nes.ppu.spriteMem[addr]` and have it take effect on the next frame? Or does OAM DMA ($4014) need to be triggered?

4. **CPU mem vs actual addressing:** `nes.cpu.mem` — is this a flat array of the full 64KB address space, or just the 2KB RAM? When we write to it, does it go through the mapper (handling mirroring, bank switching)? Can we write to ROM space ($8000+)?

**Report findings from source code analysis before proceeding.** This determines whether we need to modify jsnes or use workarounds.

### STEP 1: Boot SMB to gameplay

Load Super Mario Bros ROM. Run frames while pressing Start periodically until gameplay begins (player can move). Save a "gameplay baseline" savestate. Capture and save a screenshot as `experiment-step1-baseline.ppm` (or .png).

Verify baseline: read a few known SMB RAM addresses to confirm we're in gameplay:
- $0770 = game mode (should be non-zero during gameplay — exact value TBD, check by observation)
- $0756 = player state (0 = alive and controllable in most states)
- Read player X position ($0086) and confirm it's reasonable (should be around 40 for start of W1-1)

### STEP 2: Palette modification at runtime

From the gameplay baseline:

**Sub-test 2a: Background palette swap.**
- Read current background palettes from PPU palette RAM ($3F00-$3F0F)
- Print the current values (so we can see what they are)
- Write new values that produce a dramatically different color scheme (e.g., make the sky red, ground purple — pick obviously different NES color values)
- Run 10 frames
- Capture screenshot as `experiment-step2a-palette.ppm`
- Compare visually: does the game look different but structurally identical?

**Sub-test 2b: Sprite palette swap.**
- Same but for sprite palettes ($3F10-$3F1F)
- Change Mario's colors to something obviously different
- Run 10 frames
- Capture screenshot as `experiment-step2b-sprite-palette.ppm`

**Sub-test 2c: Stability test.**
- After palette modifications, run 300 frames while holding Right
- Does the game still play? Does scrolling work? Do enemies appear?
- Capture screenshot every 60 frames (5 screenshots: `experiment-step2c-frame60.ppm` through `step2c-frame300.ppm`)

**Important:** After Step 2, restore the baseline savestate before Step 3.

### STEP 3: Entity behavior modification at runtime

From gameplay baseline:

**Sub-test 3a: Find a Goomba.**
- Hold Right and run frames until at least one enemy is visible on screen. In SMB W1-1, the first Goomba appears around X scroll position ~352 (column 22). You may need to run ~200-300 frames holding Right.
- Save a new savestate here ("goomba state")
- Read OAM (spriteMem) to find the Goomba's sprite entries
- Read RAM to find Goomba's position variable. Known SMB enemy data area: $0000-$000F region stores enemy types, $0086-$008A for positions (player is slot 0, enemies are slots 1-5). Try reading $0087 for enemy 1 X position — or discover by correlating OAM sprite X with RAM values.
- Print the Goomba's current position and the RAM address you found

**Sub-test 3b: Teleport an enemy.**
- From goomba state: write a different X position value to the Goomba's X address
- Run 1 frame
- Read OAM to confirm the Goomba sprite moved to the new position
- Capture screenshot showing Goomba in unexpected position

**Sub-test 3c: Modify enemy speed.**
- This is harder — SMB's enemy speed may be hardcoded in ROM, not a RAM variable
- Approach 1: Find if there's a speed variable in RAM by watching the Goomba's X change per frame (restore goomba state, step frame by frame, record X each frame, look for the RAM byte that decrements consistently)
- Approach 2: If speed is ROM-hardcoded, try modifying the enemy's X position every frame to simulate different speed (write X = X - 2 instead of the game's natural X = X - 1)
- Report what you find about how SMB stores/computes enemy speed

**Sub-test 3d: Freeze an enemy.**
- From goomba state: every frame, write the Goomba's current X position back to its X address (overriding whatever the game computes)
- Run 60 frames
- Does the Goomba stay in place while everything else (Mario, scrolling, other enemies) continues normally?
- Capture screenshot

### STEP 4: Tile graphics modification

**Sub-test 4a: Determine CHR access method.**
Based on Step 0's findings about CHR-ROM vs CHR-RAM in jsnes:
- If CHR-ROM is writable through vramMem: proceed directly
- If CHR-ROM is read-only: try writing to the pattern table region ($0000-$1FFF) of vramMem and check if it persists after a frame. Report result.
- If truly read-only: we need a CHR-RAM game. Load Mega Man 2 instead and repeat Steps 1-2 quickly on it, then do tile modification on MM2.

**Sub-test 4b: Modify one background tile.**
- Find a commonly-used tile (like the ground tile or brick tile in SMB/MM2)
- Read its current 16-byte tile data from pattern table memory (NES tiles are 8x8 pixels, 2 bits per pixel = 16 bytes per tile)
- Write new pixel data that's obviously different (e.g., make it a solid checkerboard pattern, or an X shape)
- Run 10 frames
- Capture screenshot
- Does every instance of that tile on screen show the new graphic? (It should — they all reference the same tile in the pattern table)

**Sub-test 4c: Modify a sprite tile.**
- Same approach but for a sprite tile (Mario's body, an enemy, etc.)
- Change the pixel data
- Run frames
- Does the character look different?
- Capture screenshot

### STEP 5: Behavioral probing (address discovery without prior knowledge)

This tests whether we can discover game-relevant addresses automatically.

**Sub-test 5a: Discover a previously unknown address.**
- From gameplay baseline, pick a RAM region you did NOT already identify in Step 3 (avoid the known enemy position addresses)
- Systematically probe addresses $0700-$07FF (a common NES game state region):
  - For each address:
    - Restore baseline
    - Write value 0x05 to the address
    - Run 3 frames
    - Capture a quick VRAM hash (hash the first 960 bytes of the nametable at PPU $2000)
    - Compare to baseline VRAM hash
  - Report: which addresses caused visible changes? What changed?

**Sub-test 5b: Identify what the discovered addresses control.**
- For each address from 5a that caused VRAM changes:
  - Restore baseline
  - Write different values (0x00, 0x01, 0x02, 0x03, 0x04) and capture screenshots for each
  - Can you infer what the address controls from the visual changes?

## OUTPUT

Save ALL screenshots to `~/giants-drink/experiment-output/`. Create this directory at the start.

At the end, print a summary:

```
=== LIVE MODIFICATION EXPERIMENT RESULTS ===

STEP 0 (jsnes internals):
- PPU vramMem writability: [direct/requires-ppuaddr/read-only]
- CHR-ROM writability: [yes/no/requires-mapper-modification]
- OAM writability: [direct/requires-dma]
- cpu.mem addressing: [flat-64kb/2kb-only/mapper-aware]

STEP 2 (palette modification):
- Background palette: [PASS/FAIL] - [description]
- Sprite palette: [PASS/FAIL] - [description]
- Stability: [PASS/FAIL] - [survived N frames of gameplay]

STEP 3 (entity modification):
- Enemy found at RAM: $[addr]
- Teleport: [PASS/FAIL]
- Speed modification: [PASS/FAIL/NOT-POSSIBLE-reason]
- Freeze: [PASS/FAIL]

STEP 4 (tile modification):
- CHR access method: [direct-vramMem/rom-patch/chr-ram-game]
- Background tile: [PASS/FAIL]
- Sprite tile: [PASS/FAIL]

STEP 5 (behavioral probing):
- Addresses causing VRAM changes: [list]
- Identified controls: [addr → what it does]

OVERALL: The "emulator as controllable game engine" paradigm is [VIABLE/PARTIALLY-VIABLE/NOT-VIABLE]
```

## CRITICAL RULES

1. **Report after each step.** Don't silently proceed if something fails.
2. **Save screenshots at every sub-test.** Joe needs to see visual evidence.
3. **If jsnes doesn't allow a write you need, don't give up.** Look at the jsnes source, understand WHY it doesn't work, and report whether the limitation is fundamental or fixable with a small jsnes modification.
4. **Read jsnes source code in Step 0.** Don't guess at how the internals work. `node_modules/jsnes/src/` has the full source. Key files: `ppu.js`, `cpu.js`, `mappers/*.js`, `nes.js`.
5. **Use `#` comment syntax carefully in terminal commands.** Omit comments from multi-line shell blocks.
6. **No guessing.** If you're unsure whether a write took effect, read the value back and verify.
