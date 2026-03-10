# Two Fires — Current Status

**Last updated:** 2026-03-10 (Phase 1, Session 11a/11b)

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

### Immediate: Session 12 — Fix Phase 2 + Phase 5, Validate SMB, Three-Game Battery

Three focused fixes, then validation:

**Fix 1: Phase 2 — Full-address sweep**
Add a second pass that sweeps ALL 2048 RAM addresses (or a targeted range like $0700-$07FF) in addition to the volatile candidates. Level variables are constant during gameplay — the volatility filter misses them. This is Decision 90.

**Fix 2: Phase 1 — BASELINE settle period**
After bidirectional control test confirms gameplay, release all inputs and wait 60-120 frames for the player to land and the game to reach a neutral state before saving BASELINE. This is Decision 91.

**Fix 3: Phase 5 — Input sequencing and slot tracking**
- Ensure each physics test applies its specific input sequence (not all defaulting to walk-right)
- Handle OAM slot multiplexing (SMB cycles sprites through slots — track by proximity/continuity, not fixed slot)
- After restoring BASELINE for each test, explicitly clear all inputs for 2 frames before starting test inputs

**Validation:**
- TEST 1: Full pipeline on SMB — content variables found, physics data shows distinct movement per test
- Boot hardening: Phase 1 on 6-8 diverse games (MM2, Zelda, Contra, Castlevania, Metroid, Kirby)
- TEST 2: Full pipeline on MM2, Contra (Zelda needs name-entry navigation fix)

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
