# Two Fires — Current Status

**Last updated:** 2026-03-10 (Session 11c)

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

**Root cause of all Phase 5 failures:** The player sprite cannot be reliably identified via OAM proximity alone. All three games showed the tracker latching onto non-player entities:
- SMB: Goomba walks into player spawn area during warmup, sits at distance 6 from centroid vs Mario's tiles at distance 8
- MM2: Tracker latched onto a static HUD/score element at (61,40)
- Contra: Tracker latched onto static element at (44,154)

**Correct fix for Session 12:** Correlate OAM movement with RAM writes during the Phase 1 control test to identify the exact RAM addresses holding player X/Y. Use those RAM addresses directly in Phase 5 instead of OAM proximity. This approach is game-agnostic and definitive.

---

## What Just Happened (Sessions 11a + 11b)

### Pre-Session Housekeeping (11a)
- `claude.md` updated with manifest architecture (Decisions 85-88), unified engine + 7 rendering modes, extraction pipeline status, Mesen2 API reference, revised generation flow
- `decisions-log.md` merged with Session 10 additions (Decisions 85-88)
- Decision numbering corrected in `universal-extraction-spec.md` (83-86 → 85-88)

### Mesen2 Lua API Verified (11a)
Critical API findings from source code analysis:
- **Savestates:** `emu.createSavestate()` / `emu.loadSavestate(state)` — NOT `saveSavestate`. Returns binary string, not slot-based. **Only callable from exec memory callbacks**, not from startFrame or top-level script.
- **Workaround:** Register exec callback on demand via `emu.addMemoryCallback()`, do savestate op, unregister via `emu.removeMemoryCallback()`. Confirmed working.
- **Read/write/setInput:** Work from ANY callback including startFrame. No constraint.
- **Memory types:** `emu.memType.nesInternalRam` for CPU RAM writes, `nesSpriteRam` for OAM, `nesNametableRam`, `nesPaletteRam`, `nesChrRam`/`nesChrRom` all confirmed.
- **Input format:** `emu.setInput({a=true, b=false, ...}, 0)` — lowercase button names, port 0.

### Extraction Pipeline Built (11a + 11b)
Built `tools/extraction-enumerator.lua` — a 600+ line Mesen2 Lua script implementing all 5 extraction phases as a state machine driven by startFrame callbacks with exec callbacks for savestate operations.

**Phase 1 — Boot to Gameplay: ✅ WORKING**
- Bidirectional control test: press Right 10 frames, press Left 10 frames, check if any OAM sprite moved in both directions
- Alternates Start and A presses between tests to advance past menus
- Results: SMB ✅ (frame 710), Mega Man 2 ✅ (frame 639), Contra ✅ (frame 284), Zelda ❌ (timeout — stuck on name-entry screen)
- Known issue: BASELINE can be contaminated if captured mid-jump (the A press in the control test cycle can trigger a jump). Needs a "settle" period after control confirmation.

**Phase 2 — RAM Candidate Identification: ✅ WORKING**
- Snapshots RAM 5 times over 300 frames, classifies bytes as constant/ticker/volatile
- SMB: 54 volatile candidates identified
- Known architectural issue: level-switching variables (like SMB's 0x075C/0x075F) are CONSTANT during gameplay and get filtered out. Phase 2's volatility filter is counterproductive for the very variables we most want to find. Fix needed: add a second sweep of ALL 2048 addresses (or at minimum, addresses in the $0700-$07FF region where NES games commonly store game state).

**Phase 3 — Mutation Sweep: ✅ STRUCTURALLY WORKING**
- Batched restores per address (~200 restores total, not ~51,200)
- SMB: found 2 content variables (0x06D4, 0x073D) with unique VRAM hashes > 30
- Missed the primary level variables (0x075C, 0x075F) due to Phase 2 filtering issue above
- Tuning: `P3_UNIQUE_THRESHOLD` raised from 3 to 30 to filter noise
- CHR-ROM caching added (capture once, not per-state) — major Phase 4 speedup

**Phase 4 — Deep Enumeration: ✅ STRUCTURALLY WORKING**
- Captures full state (RAM, VRAM, nametable, palette, OAM, CHR, PPUCTRL) per unique VRAM state
- Records OAM every 10 frames for 300 frames (enemy behavior observation)
- Currently captures data for Phase 3's found variables; will capture more once Phase 2 filtering is fixed

**Phase 5 — Physics Sampling: ⚠️ STRUCTURALLY COMPLETE, DATA UNRELIABLE**
- All 6 test sequences run (WALK_RIGHT, FRICTION, JUMP_TAP, JUMP_HOLD, RUNNING_JUMP, DUCK)
- Position capture works (X movement confirmed during walk tests)
- Known issues:
  - All tests produce identical trajectories (input sequencing not correctly differentiating between tests)
  - BASELINE contamination (captured mid-jump) corrupts starting state for all tests
  - OAM slot multiplexing: SMB cycles 3 sprites through same OAM slot on alternating frames, making position tracking noisy

### Supporting Scripts Built (11a)
- `tools/orchestrator.js` — Node.js wrapper that spawns Mesen2, captures stdout, parses DATA_ lines into JSON
- `tools/physics-derivation.js` — reads position arrays, derives gravity/walk speed/jump velocity/friction
- Several diagnostic test scripts (`test-exec-callback.lua`, `test-savestate-callback.lua`, `test-readwrite-callback.lua`, `test-jump.lua`)

### Decisions Made (11b, recorded by Claude Code)
- **Decision 89:** Bidirectional control test as primary gameplay detector (replaces passive heuristics)
- **Decision 90:** Phase 2 filtering needs full-address sweep to catch constant-during-gameplay level variables
- **Decision 91:** BASELINE needs settle period after control confirmation to avoid mid-action contamination

---

## Current Repo State

### File Structure
```
giants-drink/
  claude.md                              ← Updated Session 11a (manifest architecture)
  tools/
    extraction-enumerator.lua            ← NEW: main extraction script (P1-P5, ~600 lines)
    orchestrator.js                      ← NEW: Node.js Mesen2 runner + stdout parser
    physics-derivation.js                ← NEW: position data → physics constants
    extract-chr-rom.js                   ← NES CHR-ROM bulk extractor (Session 8)
    mesen-extract.lua                    ← Single-frame capture (Sessions 9-10, superseded by extraction-enumerator.lua)
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

### Immediate: Session 12 — Fix Phase 5 via RAM Correlation

**Fix 1 ✅ Done. Fix 2 ✅ Done. Fix 3 — new approach:**

**Phase 5 player tracking via RAM correlation (not OAM proximity)**

During Phase 1's control test (hold Right, then hold Left), simultaneously log ALL RAM addresses whose values change. The RAM addresses that change in sync with the OAM X movement are the player X position variables. Store these as `p1PlayerXAddrs[]` alongside `p1CandSlot`.

In Phase 5, read player position directly from these RAM addresses each frame instead of scanning OAM. This is:
- Definitive (we know exactly which bytes are player X/Y)
- Game-agnostic (works regardless of OAM multiplexing)
- Immune to enemy interference (enemy RAM addresses won't move bidirectionally with player input)

Implementation: in `hold_right` and `hold_left` sub-states, snapshot RAM before and after, diff against pre-test values. Addresses that moved right then left = player X candidates.

**Then validate:** distinct trajectories for all 6 tests (WALK_RIGHT: X increases; JUMP: Y arc; FRICTION: X decelerates; DUCK: constant).

**Then three-game battery:** SMB + MM2 + Contra with valid physics data.

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

1. **Phase 2 full-address sweep timing:** Sweeping all 2048 addresses × 256 values × 3 frames = significant time. May need sampling (every 4th value) or targeted address ranges. Test empirically.
2. **Zelda name-entry navigation:** Need to add directional + A input pattern to get past file select. Similar issue expected for Final Fantasy, Dragon Quest, and other RPGs with character creation.
3. **OAM slot multiplexing:** SMB cycles 3 sprites through the same slot. Need a tracking approach that follows the player sprite by position continuity rather than fixed OAM slot index.
4. **SNES ROM set acquisition** — needed for Session 13+
5. **Game Genie code database** — needed for infinite-lives during extraction
6. Meta-game specification — flagged as needing its own thread (Decision 70, unchanged)
