# Two Fires — Current Status

**Last updated:** 2026-03-11 (Session 11e)

---

## What Just Happened (Session 11e)

### Phase 5: Deep Debugging — Unresolved, Deferred to Session 12

Session 11e focused entirely on Phase 5 physics sampling. Despite significant debugging effort, the core Phase 5 issue remains unresolved. **Phases 1-4 are unaffected and continue to work.**

**Changes made this session:**

1. **Round-trip Y detection** (replaces dual-snapshot approach):
   - Press jump for 5 frames, snapshot at frame 15 (peak), snapshot at frame 60 (landing)
   - Select address where value DECREASED at peak AND RETURNED to ±2 of baseline at landing
   - Zero-page-first two-pass to avoid false positives from page-3+ tile/level data
   - This is the correct algorithm — clean, deterministic, no heuristics

2. **APU capture**: `DATA_APU` per Phase 4 state and `DATA_APU_FRAME` alongside `DATA_OAM_FRAME` ✅ working

3. **Orchestrator**: parses `DATA_APU`, `DATA_APU_FRAME`, `DATA_CANDIDATES` lines; writes apu-frames.json ✅

4. **Phase 1 settle improvement**: After 120 clearInput frames, added Left press for 5 frames + 60 more clearInput frames to cancel any rightward momentum before saving BASELINE. Also logs `STATUS_PHASE1:BASELINE saved ... x=NNN` for position tracking.

5. **PHYSICS_BASE concept**: Introduced in Phase 4 (saves a state when game loads a level naturally). Ultimately not used for Phase 5 — the captured state still had residual walk-in velocity.

**Phase 5 symptoms observed:**

| Attempt | LEVEL_STATE | Settle | Result |
|---------|-------------|--------|--------|
| Original (Session 11d) | p1BaselineState | 60f clearInput | $57=24, all tests identical rightward |
| PHYSICS_BASE approach | PHYSICS_BASE | 60f clearInput | $57=30, all tests identical rightward |
| BASELINE + counter-momentum | BASELINE | 120f clearInput | $57=240, all tests identical leftward (castle walk animation) |
| p1BaselineState + long settle | p1BaselineState | 200f clearInput | x frozen at 138 for all tests, WALK_RIGHT doesn't move Mario |

**Root causes identified:**
1. **Flagpole contamination**: Phase 1's directional test (Right 10 frames) pushes Mario toward the flagpole in SMB1's World 1-1. At frame 710, Mario has walked deep into the level. The Right press in the control test moves Mario from ~x=141 to ~x=177 (the flagpole). After that, BASELINE captures Mario in the castle walk animation where game ignores all input.
2. **Input injection uncertainty**: With p1BaselineState + 200-frame clearInput settle, x stays at 138 for ALL 6 tests including WALK_RIGHT (right=true every frame). Either emu.setInput isn't reaching the game during savestate-restored gameplay, OR Mario is in a state where input is ignored (walk-in, pause, etc.).
3. **Y detection**: Round-trip found 0x009F with delta=-2 (wrong; correct is 0x00CE with delta~-60). The tiny delta suggests Mario can't actually jump from the settlement state — either blocked against a wall (x=138 in World 1-1 might be at a pipe or block) or still in an animated state.

---

## What Just Happened (Session 11d)

### Phase 5: RAM-Correlated Player Position Tracking ✅ CORE WORKING

Replaced OAM proximity tracking in Phase 5 with direct RAM reads.

**What was built:**
- Phase 1 now captures 3 full 2048-byte RAM snapshots (pre-movement, post-right, post-left) alongside OAM snapshots
- X correlation: direction matching (dR≥2 during Right, dL≤-2 during Left) on all 2048 addresses; select zero-page candidate with largest rightward delta
- Y correlation: Phase 5 jump test using p1BaselineState + `base > 128` filter (game ground Y is always >128; timers cycle 0-128 and are excluded)
- Phase 5 uses `emu.read(p1PlayerXAddr/p1PlayerYAddr, emu.memType.nesInternalRam)` directly — no OAM scanning
- Physics test savestates load p1BaselineState (not BASELINE — BASELINE has Mario in a pipe transition)
- 60-frame settle between savestate load and test start (SMB1 takes ~45 frames to fully decelerate)

**Three-game results:**

| Game | X addr | Y addr | X correct? | Y correct? |
|------|--------|--------|-----------|-----------|
| SMB | 0x0086 | 0x00CE | ✅ known | ✅ known |
| MM2 | 0x0023 | y_delta=0 | unknown | ❌ jump test found no Y change |
| Contra | 0x0100 | 0x0028 | unknown | uncertain |

---

## What Just Happened (Session 11c)

### Three-Game Battery Results

All three games ran Phases 1-4 successfully. Phase 5 produces output but trajectories are wrong — deferred.

| Game | P1 Frame | P3 Content Vars | P4 States | P5 Status |
|------|----------|-----------------|-----------|-----------|
| SMB | 831 | 3 (0x0773, 0x00B5, 0x06D4) | 16 | ❌ tracking wrong entity |
| Mega Man 2 | 639 | 2 | 9 | ❌ stuck at (61,40) |
| Contra | 405 | 1 | 5 | ❌ stuck at (44,154) |

### Fix 1: Phase 2 full-address sweep ✅ WORKING
Force-add ALL $0700-$07FF and $0000-$00FF addresses as Phase 3 candidates regardless of volatility. Level variables (SMB: 0x0773, others) are constant during gameplay — the old volatility filter missed them. Now they're always included. SMB found 3 content variables in the current run (was finding 0-1 before this fix).

### Fix 2: Phase 1 BASELINE settle ✅ WORKING
After bidirectional control confirmation, wait 120 frames with cleared input before saving BASELINE. Prevents mid-jump contamination from the A-press in the control test cycle.

### Fix 3: Phase 5 sprite tracking ❌ NOT RESOLVED
Implemented mini bidirectional test (same logic as Phase 1) to uniquely identify player sprite per test. Code is in the file but has a runtime issue causing complete silence (no Phase 1 output either). Reverted concept, deferred to Session 12.

---

## Current Repo State

### File Structure
```
giants-drink/
  claude.md                              ← Updated Session 11a (manifest architecture)
  tools/
    extraction-enumerator.lua            ← Main extraction script (~1090 lines; Phase 5 marked WIP)
    orchestrator.js                      ← Node.js Mesen2 runner + stdout parser (APU support added)
    physics-derivation.js                ← NEW: position data → physics constants
    extract-chr-rom.js                   ← NES CHR-ROM bulk extractor (Session 8)
    mesen-extract.lua                    ← Single-frame capture (Sessions 9-10, superseded)
    render-screen.js                     ← NES screen renderer (Sessions 9-10)
    test-exec-callback.lua               ← Diagnostic
    test-savestate-callback.lua          ← Diagnostic
    test-readwrite-callback.lua          ← Diagnostic
    test-jump.lua                        ← Diagnostic
  src/
    (unchanged from Session 10)
  data/
    (unchanged)
  docs/
    current-status.md                    ← THIS FILE
    decisions-log.md                     ← Updated through Decision 91
    design/
      universal-extraction-spec.md       ← Decision numbers corrected (85-88)
      (other docs unchanged)
```

### External (not in repo)
```
~/nes-roms/                              ← No-Intro NES ROM set (~3,146 .nes files)
~/nes-extracted/                         ← CHR-ROM tile sheets + extraction output
~/mesen2/                                ← Mesen2 emulator binary
```

### Deployed
- Vercel: two-fixture platformer (unchanged)
- Cloudflare R2: TSR catalog + partial sprites (unchanged)

---

## What's Next

### Session 12 — Phase 5 Debugging (Fresh Context)

Phase 5 needs focused debugging with a clean context window. Key investigation tasks:

**A. Diagnose emu.setInput in Phase 5:**
- Add debug: print x every 10 frames inside run_test_frames for WALK_RIGHT
- Verify: does x change AT ALL during the test? If not → emu.setInput issue
- Check: read SMB1's game mode register ($000E) to verify game is in play state (0x08), not pause/transition

**B. Fix BASELINE contamination (flagpole issue):**
- Phase 1's control test Right-press is pushing Mario to World 1-1's flagpole (~x=177) by the time control is confirmed at cycle 10
- Fix: after control confirmation, reload p1BaselineState (pre-directional-test state) and do a SHORT settle (30-60 frames) from there, instead of settling from the post-flagpole position
- This guarantees BASELINE is in the safe starting area

**C. Y detection with round-trip:**
- Round-trip algorithm is correct but found 0x009F (delta=-2) instead of 0x00CE (delta~-60)
- Mario can't jump from the current settle state (frozen at x=138, likely against a wall)
- Fix: use the corrected BASELINE (from fix B) and verify Mario can actually jump

**D. Validate SMB1 game state address:**
- Read $000E (or $0770 — SMB1's area/mode register) at the start of each test to confirm game is in playable mode

### Session 13: Zelda/RPG Boot Fix + 12-Game Battery

- Add directional input + A sequences for name-entry/file-select screens
- Run extraction on 12-game diversity battery from spec
- Begin manifest generation (recording analyzer, Claude interpretation)

### Session 14+: Scale Run + Engine Build

- Batch orchestrator for full NES library
- SNES ROM acquisition + validation
- Manifest → game state loader
- Unified engine core build begins

---

## Key Open Questions

1. **emu.setInput during Phase 5**: Does input injection work correctly after loadSavestate? The Phase 5 data strongly suggests it doesn't — WALK_RIGHT (right=true every frame) fails to move Mario. Possible fix: inject input via exec callbacks (fires during NES execution) rather than startFrame callbacks.
2. **BASELINE contamination**: Phase 1's many cycles navigate deep into levels before confirming control. At cycle 10 in SMB1 (frame 710), Mario is at ~x=141 and the Right-press test moves him to the flagpole. Need to reload p1BaselineState after confirmation to avoid this.
3. **Zelda name-entry navigation:** Need to add directional + A input pattern to get past file select. Similar issue expected for Final Fantasy, Dragon Quest, and other RPGs with character creation.
4. **OAM slot multiplexing:** SMB cycles 3 sprites through the same slot. Need a tracking approach that follows the player sprite by position continuity rather than fixed OAM slot index.
5. **SNES ROM set acquisition** — needed for Session 13+
6. **Game Genie code database** — needed for infinite-lives during extraction
7. Meta-game specification — flagged as needing its own thread (Decision 70, unchanged)
