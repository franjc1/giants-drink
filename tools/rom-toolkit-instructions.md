# Claude Code Instructions: ROM Transformation Toolkit Experiment

## YOUR MISSION

You are building a **transformation toolkit** for NES games. Given a ROM
running in jsnes, your goal is to produce a working JavaScript API that
lets you change the game's visuals, mechanics, and gameplay at runtime.

This is an open-ended research task. You are not implementing a
pre-designed architecture. You are a scientist investigating how NES
games work and building tools based on what you discover. Try things.
If they don't work, try something else. You have full access to jsnes
internals and can run experiments as fast as you want.

## WHAT SUCCESS LOOKS LIKE

At the end of this session, you should have:

1. A file `tools/rom-toolkit/smb-api.js` — a working JavaScript module
   with callable functions that transform a running Super Mario Bros game

2. A file `tools/rom-toolkit/smb-test.js` — a test script that USES
   the API to perform all of the following transformations on a live
   running game WITHOUT crashing it:

   VISUAL:
   - Swap the background palette to a completely different color scheme
   - Replace a CHR tile (e.g. swap the ground tile for something else)
   - Inject a sprite that doesn't exist in the original game

   MECHANICAL:
   - Change the player's jump height or gravity
   - Make an enemy move faster or slower
   - Toggle player invincibility

   GAMEPLAY:
   - Warp to a different level
   - Change the number of lives
   - Suppress or redirect a game event (e.g. prevent death on pit fall,
     or make a powerup do something different)

3. A file `tools/rom-toolkit/investigation-log.md` — a record of what
   methods you tried, what worked, what didn't, and what you learned.
   This is important because we want to know if your methods generalize.

## ENVIRONMENT

jsnes is installed in the repo. The verified API:

```javascript
const { NES } = require('jsnes');
const { Controller } = require('jsnes');

const nes = new NES({
  onFrame: function(frameBuffer) { /* 256x240 pixel data */ },
  onAudioSample: function(l, r) { /* audio callback */ }
});

// Load ROM (MUST be binary string, not Buffer)
const romData = fs.readFileSync(romPath);
nes.loadROM(romData.toString('binary'));

// Frame control
nes.frame();  // advance one frame, synchronous

// CPU RAM (full 64KB address space)
nes.cpu.mem[addr]          // read
nes.cpu.mem[addr] = value  // write

// Controller
nes.buttonDown(1, Controller.BUTTON_RIGHT);
nes.buttonUp(1, Controller.BUTTON_RIGHT);
// Buttons: BUTTON_A, BUTTON_B, BUTTON_SELECT, BUTTON_START,
//          BUTTON_UP, BUTTON_DOWN, BUTTON_LEFT, BUTTON_RIGHT

// Savestates
const state = nes.toJSON();   // save (returns serializable object)
nes.fromJSON(state);          // restore

// PPU
nes.ppu.vramMem[addr]        // 32KB VRAM
nes.ppu.spriteMem[addr]      // 256 bytes OAM (64 sprites x 4 bytes)
// OAM format per sprite: [Y position, tile index, attributes, X position]

// PPU registers (via CPU memory-mapped I/O)
// $2000 = PPUCTRL, $2001 = PPUMASK, $2002 = PPUSTATUS, etc.
// WARNING: reading $2002 resets the vblank flag (side effect)
```

ROM location: `~/nes-roms/`
Use `ls ~/nes-roms/ | grep -i mario` to find the exact SMB filename.

Output directory: `~/giants-drink/tools/rom-toolkit/`
Create this directory first.

## GROUND TRUTH FOR VALIDATION

These are KNOWN addresses for Super Mario Bros. Use them to validate
your investigation methods. If your methods find these, they're working.
If they don't, your methods need improvement.

Known SMB RAM addresses:
- $0086 = Player X position (screen-relative)
- $00CE = Player Y position (screen-relative)  
- $0756 = Powerup state (0=small, 1=big, 2=fire)
- $075A = Lives remaining
- $075E = Coins
- $075F = World number (0-indexed)
- $0760 = Level number (0-indexed)
- $079F = Game mode / state
- $000F = Timer (ones digit)
- $07F8 = Enemy active flag area

Do NOT hardcode these into your API. Your investigation must DISCOVER
them (or discover equivalent addresses). Then check against this list.
If your method found $0086 as player X — great, method works. If it
found $0087 — investigate why it's off by one. If it missed player X
entirely — your method has a gap.

## HOW TO APPROACH THIS

You have freedom to investigate however you want. Some ideas to consider
(but don't limit yourself to these):

COMPARATIVE ANALYSIS:
Run from the same savestate with different inputs. Diff all of RAM.
Everything that changed is causally linked to the input difference.
Scale this up systematically.

ACTIVE PROBING:
Write values to RAM addresses and observe what happens. If writing 5
to an address warps you to world 5, that's the level address. If
writing 0 to an address kills you, that's probably lives or health.

EXECUTION OBSERVATION:
Watch which RAM addresses change during specific game events (jumping,
landing, collecting a coin, getting hit). Cluster the changes to
identify which addresses belong to which game system.

VISUAL CORRELATION:
Compare OAM sprite data with RAM values. If an OAM sprite's X
position tracks a RAM address value, that RAM address is controlling
that sprite's position.

PPU OBSERVATION:
Read VRAM nametables, palette data, CHR tile data. Understand how the
visual output is composed. This directly informs what you can swap.

The key insight: you're building TWO things simultaneously.
1. The knowledge (what controls what)
2. The API (how to use that knowledge to transform the game)

Build them together. Every time you discover something, immediately
write the API function that uses it and TEST that function. Don't
accumulate knowledge and then build the API later. The act of building
and testing the API validates the knowledge.

## PHASE A: INVESTIGATE SMB AND BUILD THE API

Create tools/rom-toolkit/smb-api.js as a module that exports functions.
Structure suggestion (adapt as needed):

```javascript
class SMBToolkit {
  constructor(nes) { this.nes = nes; }
  
  // Discovery — call these to investigate the ROM
  discoverPlayerAddresses() { ... }
  discoverGameStateAddresses() { ... }
  
  // Visual transformation
  setPalette(paletteIndex, colors) { ... }
  swapCHRTile(tileIndex, newTileData) { ... }
  injectSprite(slot, tile, x, y, attributes) { ... }
  
  // Mechanical transformation  
  setPlayerPosition(x, y) { ... }
  setPlayerState(state) { ... }
  setPhysicsValue(param, value) { ... }
  
  // Gameplay transformation
  warpToLevel(world, level) { ... }
  setLives(n) { ... }
  suppressEvent(eventType) { ... }
  
  // Inspection
  getFullState() { ... }  // human-readable game state
  diffStates(state1, state2) { ... }  // what changed between states
}
```

## PHASE B: VALIDATE BY TRANSFORMATION

Write tools/rom-toolkit/smb-test.js that:
1. Boots SMB to gameplay
2. Creates a savestate
3. Performs each transformation from the success criteria
4. After each transformation, runs 60-300 frames to confirm the game
   doesn't crash and the transformation took effect
5. Restores the savestate between tests
6. Reports PASS/FAIL for each transformation

If a test fails, go back and fix the API. The test script IS the
validation. If all tests pass, the toolkit works.

IMPORTANT: For visual transformations (palette, CHR, sprite injection),
capture the frame buffer and save as a PNG so we can visually verify.
Use the onFrame callback to capture pixel data. You may need a PNG
library (pngjs or similar — install with npm if needed).

## STOP AFTER PHASE B

When Phase B is complete (all transformation tests run and reported),
STOP. Commit everything, print a summary of what worked and what
didn't, and wait for further instructions. Do not attempt to
generalize to other ROMs in this session.

## CRITICAL RULES

- Test every discovery immediately. Don't accumulate untested knowledge.
- If writing to an address crashes the game, that's useful information.
  Record the crash, restore from savestate, and move on. Document safe
  vs unsafe addresses in the API.
- Save investigation-log.md as you go, not at the end.
- Commit working code after each phase: git add -A && git commit -m "..."
- NES Y coordinates increase DOWNWARD. Jumping = Y decreases.
- OAM Y=0xFF or Y>=0xEF means the sprite is offscreen/hidden.
- jsnes loads ROMs as BINARY STRINGS: romData.toString('binary')
- Do NOT use Mesen2 for anything. jsnes only.
- The API should be structured so a DIFFERENT program (the Orchestrator)
  could import it and use it at runtime. It's not a one-off script.

## WHAT TO DO FIRST

1. mkdir -p ~/giants-drink/tools/rom-toolkit
2. ls ~/nes-roms/ | grep -i mario  (find exact ROM filename)
3. Write a minimal boot script that loads SMB, advances to gameplay,
   and confirms you have control (press Right, verify OAM X changes)
4. Start investigating. Build the API as you go. Test constantly.
