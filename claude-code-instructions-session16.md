# Claude Code Instructions: Session 16 — 20-Game Validation Battery + Batch Runner

## READ FIRST

Before writing ANY code, read these files:
1. `claude.md` (architectural blueprint)
2. `tools/jsnes-extractor.js` (the extraction script — THIS IS THE MAIN FILE, ~43KB)
3. `docs/current-status.md` (what happened in Sessions 14-15)

## CONTEXT

The jsnes-based extraction pipeline (`tools/jsnes-extractor.js`) is built and working. It runs Phases 1-4 on NES ROMs, producing tile data, palette data, level snapshots, and game structure data. Previous sessions validated it on SMB (692 states), Mega Man 2, and Contra.

**This session has 3 tasks:**
1. Fix two known bugs
2. Run the extractor on 20 diverse games with ZERO per-game changes
3. If 17+ pass: build a batch runner and launch it on the full ROM library

**Do NOT work on:** Phase 5 (physics), music/APU capture, entity behavior analysis, manifest generation, SNES extraction, or any other future priorities.

## VERIFIED jsnes API

```javascript
const { NES, Controller } = require('jsnes');
const nes = new NES({ onFrame: () => {} });
nes.loadROM(romData.toString('binary'));
nes.frame();
nes.cpu.mem[addr]                            // read/write CPU RAM
nes.buttonDown(1, Controller.BUTTON_RIGHT);  // press
nes.buttonUp(1, Controller.BUTTON_RIGHT);    // release
nes.ppu.vramMem[addr]                        // VRAM (32KB)
nes.ppu.spriteMem[addr]                      // OAM (256B)
const state = nes.toJSON();                  // save
nes.fromJSON(state);                         // restore
```

## TASK 0: Fix Two Bugs (do this FIRST)

### Bug 1: Phase 1 results not saved to extraction.json

**Symptom:** The console output shows Phase 1 finding player control correctly:
```
Oracle X: $0086  orig=40→60  slot 1: dx=20 dy=0
Oracle Y: $00ce  orig=176→196  slot 1: dx=1 dy=16
```
But extraction.json records:
```json
"phase1": { "gameplayDetected": true, "playerOAMSlot": -1, "xAddr": null, "yAddr": null }
```

**Fix:** Find where the extraction.json is assembled and make sure it reads the Phase 1 discovered values (player OAM slot, X address, Y address) from whatever variables store them. The console logging code clearly has access to these values — the JSON assembly just isn't reading from the same place.

**Test:** Run on SMB. Check extraction.json — xAddr should be "0x0086", yAddr should be "0x00ce", playerOAMSlot should be 1.

### Bug 2: Phase 3 coarse sweep timing out before reaching important addresses

**Symptom:** Phase 3 has a 5-minute timeout on the coarse sweep. With 514 candidates × 32 values × 30 frames each, that's ~493,440 frames. At ~3000 frames/sec jsnes performance, that's ~164 seconds — tight but should fit. However, Phase 3 only found ONE content variable (0x0773) for SMB, when previous runs found 4 (0x00b5, 0x06d4, 0x074e, 0x0773).

**Investigate:** Check if the issue is:
a) The timeout is actually being hit (log a message when timeout triggers)
b) The coarse sweep threshold is filtering out variables (what threshold is used? Previous sessions raised it to 30 — that might be too aggressive)
c) The ordering of candidates — if forced-range addresses (0x0700-0x07FF) are tested last, timeout may cut them off

**Preferred fix:** Reorder candidates so that the forced ranges (0x0700-0x07FF) are tested FIRST in Phase 3, since those are the most likely content variables (level selectors, room IDs). The volatile candidates (which may just be animation timers) should be tested AFTER. This way, if timeout hits, we lose the least important candidates.

Also: bump the Phase 3 timeout from 5 minutes to 8 minutes. The 20-game battery will run sequentially anyway — a few extra minutes per game is fine.

**Test:** Run on SMB. Phase 3 should find at least 3 content variables including addresses in the 0x07xx range. Check if 0x075C (world) or 0x075F (level) show up.

**STOP after fixing both bugs. Run SMB. Report: Phase 1 JSON values, Phase 3 content variable count and addresses, Phase 4 state count. Only proceed if both bugs are confirmed fixed.**

## TASK 1: 20-Game Validation Battery

Run `jsnes-extractor.js` on each of these 20 games. All ROMs are in `~/nes-roms/`. Use fuzzy filename matching — titles have suffixes like "(USA)", "(World)", "(USA) (Rev A)", etc.

**Find exact filenames first:**
```bash
for game in "Super Mario Bros" "Mega Man 2" "Contra" "Super Mario Bros. 3" "Zelda" "Metroid" "Castlevania" "Kirby" "Mega Man 3" "Ninja Gaiden" "Punch-Out" "Gradius" "Final Fantasy" "Tecmo Super Bowl" "Tetris" "Double Dragon" "Balloon Fight" "Excitebike" "Duck Hunt" "Dr. Mario"; do
  echo "=== $game ==="
  ls ~/nes-roms/ | grep -i "$game" | head -3
done
```

Pick the best match for each (prefer "(USA)" over "(Japan)", prefer no "(Rev)" over "(Rev A)").

**Run each game:**
```bash
node tools/jsnes-extractor.js ~/nes-roms/"<exact-filename>.nes" > /tmp/extract-<slug>.log 2>&1
```

Capture the full output to a log file for each game. After each run, check:
1. Did Phase 1 find player control? (grep for "control confirmed" or timeout)
2. How many content variables did Phase 3 find? (grep for contentVars in extraction.json)
3. How many unique states did Phase 4 capture?
4. Did the script crash or timeout? If so, which phase?

**The 20 games:**

| # | Game | Why It's Here |
|---|------|--------------|
| 1 | Super Mario Bros. | Baseline — already proven |
| 2 | Mega Man 2 | CHR-RAM, stage select |
| 3 | Contra | Auto-scroll, forced scroll |
| 4 | Super Mario Bros. 3 | Complex mapper (MMC3), world maps |
| 5 | Legend of Zelda | Top-down, room-based, may fail Phase 1 (file select screen) |
| 6 | Metroid | Open world, no stage select |
| 7 | Castlevania | CHR-RAM, subweapons |
| 8 | Kirby's Adventure | Large CHR-ROM, copy abilities |
| 9 | Mega Man 3 | Similar to MM2, different mapper |
| 10 | Ninja Gaiden | Cutscenes between levels |
| 11 | Punch-Out!! | Behind-the-back boxing paradigm |
| 12 | Gradius | Scrolling shooter |
| 13 | Final Fantasy | RPG, menu-driven — may fail Phase 1 |
| 14 | Tecmo Super Bowl | Sports game |
| 15 | Tetris | Puzzle game |
| 16 | Double Dragon | Beat-em-up |
| 17 | Balloon Fight | Fixed-screen action |
| 18 | Excitebike | Racing/track |
| 19 | Duck Hunt | Light gun game — will likely fail Phase 1 |
| 20 | Dr. Mario | Puzzle game |

**Run them SEQUENTIALLY, not in parallel.** jsnes is CPU-bound; parallel runs will just slow everything down.

**Expected outcomes:**
- Most platformers/action games (1-12, 16-17): should complete all phases
- RPGs (13 Final Fantasy): may fail Phase 1 (menu navigation needed to reach gameplay)
- Puzzle games (15, 20): may find fewer content variables (no "levels" in the traditional sense)
- Light gun (19 Duck Hunt): will likely fail Phase 1 (no standard controller movement)
- Zelda (5): may fail Phase 1 (stuck on file select screen)
- Sports (14): unknown — might have unusual boot sequence

## TASK 2: Analyze Results

After all 20 games, produce a summary table:

```
| # | Game | P1 Control | P3 Vars | P4 States | Time | Status | Notes |
|---|------|-----------|---------|-----------|------|--------|-------|
| 1 | SMB  | Y (360f)  | 4       | 692       | 8m   | PASS   |       |
```

Save this table to `~/giants-drink/docs/validation-battery-results.md`.

**Analysis:**
- For any failures: document which phase failed, the error message, and whether it's game-specific or systemic
- If 3+ games fail for the SAME reason: that's a systemic bug. Fix it, rerun those games.
- If failures are all different game-specific edge cases: document and move on.

**Success criteria:** 14+ of 20 games complete Phases 1-4 without crashing AND produce non-zero VRAM captures.

(The session context says 17+ but realistically Zelda, Final Fantasy, and Duck Hunt are expected to fail Phase 1, so 14+ is the adjusted bar accounting for known limitations.)

## TASK 3: Build Batch Runner (only if Task 2 passes)

Create `tools/batch-extract.js`:

```javascript
// Requirements:
// 1. Reads all .nes files from a specified directory (default: ~/nes-roms/)
// 2. For each ROM:
//    a. Creates output directory ~/nes-manifests/<game-slug>/
//    b. Spawns: node tools/jsnes-extractor.js <rom-path>
//       (spawn as child process, NOT inline — isolation prevents one crash from killing the batch)
//    c. Timeout: 10 minutes per game max. Kill and log if exceeded.
//    d. Captures stdout/stderr to ~/nes-manifests/<game-slug>/extraction.log
//    e. On completion: copies extraction.json + state files to output dir
//    f. On crash/timeout: logs error, continues to next game
// 3. Runs sequentially (one game at a time)
// 4. Writes batch summary to ~/nes-manifests/batch-log.json:
//    {
//      "startedAt": "ISO timestamp",
//      "completedAt": "ISO timestamp",
//      "totalROMs": N,
//      "completed": N,
//      "failed": N,
//      "timedOut": N,
//      "results": [
//        { "rom": "filename.nes", "slug": "game-slug", "status": "pass|fail|timeout",
//          "phase1": true/false, "contentVars": N, "uniqueStates": N, "timeSeconds": N,
//          "error": "message if failed" }
//      ]
//    }
// 5. Supports resume: if batch-log.json already exists, skip ROMs that already have
//    status "pass" (rerun "fail" and "timeout" entries, plus any new ROMs)
// 6. Progress display: print one line per game as it completes
//    "[123/3146] super-mario-bros-world: PASS (4 vars, 692 states, 7m32s)"
//    "[124/3146] some-obscure-game: FAIL Phase 1 timeout (10m0s)"
```

**Output goes to ~/nes-manifests/ (NOT ~/nes-extracted/).** Keep the old extraction output separate.

**Test the batch runner on 3 games first** (SMB, MM2, Contra) to verify the child process spawning, timeout handling, and resume logic work.

**Then launch it on the full ~/nes-roms/ directory.** It will take many hours. That's fine — it runs overnight.

## TASK 4: End of Session

1. Commit all code changes:
```bash
cd ~/giants-drink && git add -A && git commit -m "Session 16: 20-game validation battery + batch runner" && git push
```

2. Update `~/giants-drink/docs/current-status.md` with:
   - Bug fixes made
   - 20-game battery results summary
   - Batch runner status (built? launched? how many completed so far?)
   - What's next

3. If any design decisions were made, append to `~/giants-drink/docs/decisions-log.md`

## IMPORTANT REMINDERS

- jsnes loads ROMs as binary strings: `romData.toString('binary')` — NOT Buffer
- ROM filenames in ~/nes-roms/ have various suffixes. Always `ls | grep -i` to find exact names.
- NES Y coordinates increase downward. Jump = Y decreases. Fall = Y increases.
- OAM format: 4 bytes per sprite (Y, tile, attr, X). Y >= 0xEF = hidden/off-screen.
- Do NOT modify the extraction algorithm or add new phases. This session is about VALIDATION and SCALE, not new features.
- Do NOT skip the bug fixes. Fix both bugs, verify on SMB, THEN run the battery.
- The batch runner spawns child processes — do NOT run the extractor inline (one crash would kill the whole batch).
- If a game's ROM won't load (bad mapper, bad header), that's a jsnes limitation, not a bug in our script. Log it and move on.
- Some ROMs may be for non-US regions or be hacks/homebrew. Skip anything that isn't a standard game release.

## BUILD ORDER SUMMARY

1. **Bug Fix 1** (Phase 1 JSON) → test on SMB → STOP
2. **Bug Fix 2** (Phase 3 ordering/timeout) → test on SMB → STOP
3. **20-game battery** → produce results table → STOP
4. **Analyze results** → document in validation-battery-results.md
5. **Batch runner** (only if 14+ passed) → test on 3 games → launch on full library
6. **Commit + update docs**
