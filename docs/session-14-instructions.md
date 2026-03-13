# Claude Code Instructions: Session 14 — jsnes Universal Extraction Pipeline

## READ FIRST

Before writing ANY code, read these files in order:
1. `claude.md` (architectural blueprint)
2. `docs/design/universal-extraction-spec.md` (extraction algorithm — your primary reference)
3. `tools/test-jsnes.js` (the jsnes validation test from Session 13 — copy its patterns)

## CONTEXT

Mesen2's --testrunner mode silently ignores all controller input. Three sessions of debugging failed because of this. We've replaced Mesen2 with **jsnes** (npm package), a Node.js NES emulator with full synchronous programmatic control. Session 13 validated 6 core capabilities: RAM read/write, controller input, frame stepping, savestates, PPU access.

We're building the COMPLETE extraction pipeline as a single Node.js script. This replaces `tools/extraction-enumerator.lua` and `tools/orchestrator.js` with one unified tool.

## VERIFIED jsnes API (from Session 13 test)

```javascript
const { NES } = require('jsnes');
const { Controller } = require('jsnes');

// Create NES instance
const nes = new NES({ /* callbacks */ });

// Load ROM
const romData = fs.readFileSync(romPath);
nes.loadROM(romData.toString('binary'));  // jsnes expects binary string, NOT buffer

// Frame step (synchronous)
nes.frame();

// RAM read/write (CPU address space)
const val = nes.cpu.mem[addr];     // read
nes.cpu.mem[addr] = value;         // write

// Controller input
nes.buttonDown(1, Controller.BUTTON_RIGHT);  // player 1
nes.buttonUp(1, Controller.BUTTON_RIGHT);

// Available buttons:
// Controller.BUTTON_A, BUTTON_B, BUTTON_SELECT, BUTTON_START
// Controller.BUTTON_UP, BUTTON_DOWN, BUTTON_LEFT, BUTTON_RIGHT

// Savestates (synchronous, no restrictions)
const state = nes.toJSON();        // save
nes.fromJSON(state);               // restore

// PPU access
nes.ppu.vramMem[addr]             // 32KB VRAM
nes.ppu.spriteMem[addr]           // 256B OAM
```

## STEP 0: PROBE jsnes INTERNALS (DO THIS FIRST)

Before building anything, write and run `tools/probe-jsnes.js` to answer critical unknowns:

```javascript
// Questions to answer:
// 1. How big is nes.cpu.mem? (Full 64KB address space or just 2KB RAM?)
//    console.log('CPU mem length:', nes.cpu.mem.length);
//
// 2. Can we read PPU registers via nes.cpu.mem[0x2000-0x2007]?
//    Or do those addresses return garbage / cause side effects?
//    (NES PPU registers are read-sensitive — reading 0x2002 resets the vblank flag)
//
// 3. Can we read APU registers via nes.cpu.mem[0x4000-0x4017]?
//    Or is there a separate APU object?
//    Try: console.log('APU status:', nes.cpu.mem[0x4015]);
//    Try: console.log('Has nes.apu?', typeof nes.apu);
//    If nes.apu exists, log its properties: console.log(Object.keys(nes.apu));
//
// 4. Does nes.ppu have the PPUCTRL register exposed?
//    Try: console.log('PPU keys:', Object.keys(nes.ppu));
//    Look for: f_bgPatternTable, f_spPatternTable, or similar
//    (jsnes may store PPUCTRL as decoded flags, not a single register byte)
//
// 5. Does toJSON/fromJSON survive mutation?
//    - Save state, write RAM[0x0000] = 0x42, restore state
//    - Read RAM[0x0000] — should NOT be 0x42 (proves restore works)
//
// 6. NES RAM mirror check:
//    - Write nes.cpu.mem[0x0000] = 0xAB
//    - Read nes.cpu.mem[0x0800] — if 0xAB, mirrors are real in this array
//    - Read nes.cpu.mem[0x1000] — check again
//    - This tells us whether we iterate 0-2047 or 0-0x7FF for unique RAM

// Load SMB ROM for this test:
// ls ~/nes-roms/ | grep -i "mario" to find exact filename
```

Run this probe FIRST. Report the results. The answers determine how the extraction script accesses memory.

**Do not proceed to Step 1 until the probe results are reported and understood.**

## STEP 1: Phase 1 — Boot to Gameplay + Player Discovery

Build `tools/jsnes-extractor.js` with Phase 1 only.

### Phase 1 Algorithm:

**1a. Boot past menus:**
- Press Start every 120 frames for 600 frames (10 seconds)
- Between Start presses, also try A (some games use A to advance)

**1b. Bidirectional control test (run every 60 frames during boot):**
- Snapshot OAM (all 256 bytes of nes.ppu.spriteMem)
- Hold Right for 10 frames, snapshot OAM again
- Hold Left for 10 frames, snapshot OAM again
- Compare: find any OAM sprite (4-byte entries: Y, tile, attr, X) whose X position increased during Right AND decreased during Left
- If found: player control confirmed. The OAM slot is the player sprite.
- Also find the RAM address (0x0000-0x07FF) whose value tracks the OAM X movement — this is the player X position RAM address.

**1c. Settle period:**
- After control confirmed, release ALL inputs
- Step 120 frames (let player land, game reach neutral state)

**1d. Player Y address discovery:**
- Snapshot all RAM
- Hold A for 15 frames (jump)
- At frame 20 from A press: snapshot RAM
- Wait until frame 60: snapshot RAM
- Y address = RAM byte that: decreased by >15 at frame 20 (mid-jump) AND returned to within ±2 of original by frame 60 (landed)
- NOTE: NES Y coordinates increase downward. "Jump" means Y DECREASES. The byte that decreased mid-air is Y.
- If no byte matches (game has no jump, or didn't land): flag Y as undiscovered, continue anyway

**1e. Save BASELINE:**
- Save state via nes.toJSON()
- Record: player X address, player Y address (if found), player OAM slot

### Test Step 1:
Run on SMB ROM.
- Expected: reaches gameplay within ~700 frames
- Expected: finds player OAM slot, X RAM address, Y RAM address
- Print: frame count to gameplay, player X addr (hex), player Y addr (hex), baseline saved

**SMB known values for validation:**
- Player X position: RAM address is in the range 0x0086 or 0x03AD area (depends on how the game uses page/screen-relative coordinates — accept any address that correctly tracks horizontal movement)
- Player Y position: RAM address is in the range 0x00CE or 0x03B8 area

Don't require exact address matches — just verify that reading the discovered addresses during gameplay shows values that change when the player moves.

**STOP HERE. Run Step 1 on SMB. Report results before proceeding.**

## STEP 2: Phase 2 — Candidate Variable Identification

Add Phase 2 to the script.

### Algorithm:
1. Restore BASELINE
2. Snapshot all 2KB RAM (addresses 0x0000-0x07FF)
3. Step 60 frames, snapshot again. Repeat 5 times (5 snapshots over 300 frames).
4. Classify each byte:
   - CONSTANT: same value in all 5 snapshots → skip
   - TICKER: strictly monotonically increasing → skip (frame counter)
   - VOLATILE: changed at least once but not monotonically → CANDIDATE
5. **CRITICAL FIX from Session 11:** Force-add addresses 0x0000-0x00FF and 0x0700-0x07FF as candidates regardless of classification. Level-switching variables are CONSTANT during gameplay (they only change when you switch levels) and the volatility filter misses them. This is the whole point of forcing these ranges.
6. Deduplicate: remove any address already in the forced ranges from the volatile set (avoid double-counting)

### Test Step 2:
Run Phases 1-2 on SMB.
- Expected: 100-300 total candidates (volatile + forced ranges)
- The forced range 0x0700-0x07FF should include SMB's level variables (0x075C = world, 0x075F = level)
- Print: total candidates, volatile count, forced-add count

**STOP. Report results before proceeding.**

## STEP 3: Phase 3 — RAM Mutation Content Enumeration

Add Phase 3 to the script.

### Algorithm:
1. For each candidate address:
   a. Restore BASELINE
   b. For each value in [0, 8, 16, 24, ..., 248] (32 samples):
      - Write value to candidate address
      - Step 3 frames
      - Hash the nametable VRAM (quick fingerprint of what's on screen):
        Read 960 bytes from nametable (nes.ppu.vramMem[0x2000..0x23BF] for nametable 0)
        Simple hash: sum all bytes, or use a fast string hash
   c. Count unique hashes for this address
2. Addresses with >3 unique hashes = CONTENT VARIABLES
3. For each content variable: re-sweep ALL 256 values (not just every 8th)
   - For each value that produces a new unique hash: record it as a "unique state"

### Performance note:
- ~200 candidates × 32 values × 3 frames = ~19,200 frames for coarse sweep. At jsnes speed this should be seconds.
- Content variables (expect 1-5) × 256 values × 3 frames = ~3,840 frames for fine sweep. Trivial.
- Key: restore BASELINE once per address, NOT once per value. The state drift between consecutive values within one address is acceptable — we're looking for big screen changes, not subtle differences.

### Test Step 3:
Run Phases 1-3 on SMB.
- Expected: finds content variables including addresses in the 0x075x range
- SMB known: 0x075C (world number, 0-7) and 0x075F (level within world, 0-3)
- We should find at least these two, possibly more (0x073D was found in Session 11)
- Print per content variable: address (hex), number of unique VRAM states

**STOP. Report results. If we found SMB's world/level variables, proceed. If not, debug.**

## STEP 4: Phase 5 — Physics Extraction

**We're doing Phase 5 before Phase 4.** Physics extraction is simpler and validates that input actually works during gameplay (the whole reason we switched to jsnes). Phase 4 (deep capture) is a data dump that doesn't need input.

### Algorithm:
Using the discovered player X and Y addresses from Phase 1:

For each test, restore BASELINE, then run the input sequence and record positions:

**Test 1: WALK_RIGHT**
- Hold Right for 60 frames
- Record player X every frame (read from discovered X address)
- Expected for SMB: X should increase, eventually reaching ~1.5 pixels/frame steady state

**Test 2: WALK_LEFT**
- Hold Left for 60 frames
- Record player X every frame

**Test 3: JUMP_TAP**
- Press A for 3 frames, release
- Record player Y for 60 frames
- Expected: Y decreases (player goes up), then increases (falls back down). Short arc.

**Test 4: JUMP_HOLD**
- Hold A for 20 frames, release
- Record player Y for 60 frames
- Expected: taller arc than JUMP_TAP (SMB has variable-height jump)

**Test 5: RUNNING_JUMP**
- Hold Right + A for 20 frames, release A, keep Right for 40 frames
- Record both X and Y for 60 frames
- Expected: parabolic arc with horizontal movement

**Test 6: FRICTION**
- Hold Right for 30 frames, release ALL
- Record player X for 60 frames from release point
- Expected: X continues increasing but decelerates to zero

**Test 7: GRAVITY (freefall)**
- Teleport player up: write Y address = (current Y value - 40)
- Release all input
- Record Y for 60 frames
- Expected: Y increases (falling), acceleration visible in increasing deltas

**Between each test:** release all buttons (buttonUp for all 8 buttons), then restore BASELINE.

### Physics Derivation (compute after capture):
From the position arrays, derive:
- **Walk speed:** steady-state delta-X from WALK_RIGHT (last 20 frames)
- **Gravity:** from GRAVITY test, compute delta-Y differences between consecutive frames. If [1,2,3,4,...] pattern, gravity = 1 pixel/frame²
- **Jump velocity:** first delta-Y in JUMP_TAP (the initial upward speed)
- **Variable jump:** compare peak Y in JUMP_TAP vs JUMP_HOLD. If different, variable jump exists.
- **Friction:** from FRICTION test, how many frames to stop after release

### Test Step 4:
Run Phases 1-3 + Phase 5 on SMB.
- **THIS IS THE CRITICAL TEST.** If physics extraction produces correct-looking data, the jsnes switch is fully validated.
- Expected walk speed: ~1.5 pixels/frame (might show as subpixel values depending on which address we found)
- Expected: JUMP_HOLD arc is taller than JUMP_TAP arc
- Expected: GRAVITY test shows accelerating Y (increasing deltas)
- Expected: FRICTION shows decelerating X
- Print: all position arrays + derived physics values
- Compare against known SMB values:
  - Gravity: ~0.4375 px/frame² (7/16 subpixels)
  - Walk speed: ~1.5 px/frame
  - Jump velocity: ~-4.0 px/frame (upward)
  - Within 20% is passing. Exact calibration isn't needed yet.

**STOP. Report physics results. This is the go/no-go for the rest of the session.**

## STEP 5: Phase 4 — Deep State Capture

Add Phase 4. This is the data hoover — capture everything about each unique game state.

### Algorithm:
For each content variable found in Phase 3:
  For each value that produced a unique VRAM hash:
    1. Restore BASELINE
    2. Write content variable to this value
    3. Step 120 frames (let level fully load)
    4. Capture COMPLETE state:
       - All 2KB CPU RAM: nes.cpu.mem[0..2047] (or 0..0x7FF — use probe results)
       - All nametable VRAM: nes.ppu.vramMem[0x2000..0x2FFF] (4KB, all 4 nametables)
       - Pattern table data: nes.ppu.vramMem[0x0000..0x1FFF] (8KB, both pattern tables)
       - OAM: all 256 bytes of nes.ppu.spriteMem
       - Palette: nes.ppu.vramMem[0x3F00..0x3F1F] (32 bytes)
       - PPUCTRL flags from nes.ppu (use probe results to find exact property names)
       - APU state if accessible (use probe results)
    5. Run 300 more frames holding Right:
       - Record player X/Y every frame (for scroll mapping)
       - Record all OAM every 30 frames (10 snapshots, for entity behavior)
    6. Restore BASELINE before next iteration

### Combinatorial Testing:
If 2+ content variables found:
  For each pair of content variables:
    For each unique value of var A × each unique value of var B:
      - Restore BASELINE, write both values
      - Step 120 frames, hash nametable
      - If new hash: do full capture above
  SMB example: world (0-7) × level (0-3) = 32 combinations

### Output:
Save all captured data to `~/nes-extracted/<game-slug>/`:
- `extraction.json` — structured metadata (content vars, physics, addresses found)
- `states/` directory — one JSON file per unique game state with full captures
- Include state index mapping (which content variable values → which state file)

### Test Step 5:
Run full pipeline (P1-P5) on SMB.
- Expected: 20-32 unique world-level combinations captured
- Expected: each state has nametable data, tile data, OAM, palette
- Expected: the 300-frame scroll recordings show level layouts
- Print summary: content variables found, total unique states, total data size

## STEP 6: Three-Game Battery (only if Step 5 passes)

Run the SAME script with ZERO changes on:
1. Mega Man 2
2. Contra
3. Legend of Zelda

Find exact ROM filenames first:
```
ls ~/nes-roms/ | grep -i "mega"
ls ~/nes-roms/ | grep -i "contra"
ls ~/nes-roms/ | grep -i "zelda"
```

For each game, report:
- Did Phase 1 reach gameplay? At what frame?
- How many candidates in Phase 2?
- How many content variables in Phase 3? What addresses?
- Did Phase 5 physics produce sensible data? (Walk speed > 0? Jump arc visible?)
- How many unique states in Phase 4?
- Any crashes, hangs, or errors?

**Known issues:**
- Zelda may not reach gameplay (stuck on file select/name entry screen). If Phase 1 times out on Zelda, that's expected — note it and move on. We'll add file-select navigation in a future session.
- Mega Man 2 should work (it worked in Session 11 with Mesen2 Phase 1).
- Contra should work (it also worked in Session 11).

## IMPORTANT REMINDERS

- **jsnes loads ROMs as binary strings, NOT Buffers.** Use `romData.toString('binary')` before passing to `nes.loadROM()`.
- **Test each step before building the next.** If Phase 1 doesn't find the player on SMB, don't build Phase 3.
- The ROM filenames in ~/nes-roms/ may not exactly match what's written above. Always `ls | grep` to find exact names.
- **NES Y coordinates increase downward.** Jumping = Y DECREASES. Falling = Y INCREASES.
- **OAM format:** 4 bytes per sprite, 64 sprites. Byte 0 = Y position, Byte 1 = tile index, Byte 2 = attributes, Byte 3 = X position. Y = 0xFF or Y >= 0xEF means sprite is hidden (off-screen).
- **Commit working code after each milestone:** `git add -A && git commit -m "[description]" && git push`
- **Output all results to console AND to JSON files** so we can review without re-running.
- **Do NOT build the manifest generator or analysis pipeline.** This session is raw extraction only. Manifest assembly is a future session.
- jsnes does NOT have audio output callbacks in headless mode. APU register capture may not be possible. Check during the probe step. If APU data isn't accessible, skip it — we can get music from other sources.

## BUILD ORDER SUMMARY

1. **Probe** (`tools/probe-jsnes.js`) → report results → STOP
2. **Phase 1** (boot + player discovery) → test on SMB → STOP  
3. **Phase 2** (candidate identification) → test on SMB → STOP
4. **Phase 3** (mutation sweep) → test on SMB → STOP
5. **Phase 5** (physics extraction) → test on SMB → **CRITICAL GO/NO-GO** → STOP
6. **Phase 4** (deep capture + combinatorial) → test on SMB → STOP
7. **Three-game battery** → report results

Each STOP means: print results, wait for review. If a step fails on SMB, debug it before moving forward. Do not skip ahead.
