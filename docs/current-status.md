# Two Fires — Current Status

**Last updated:** 2026-03-11 (Session 15)

---

## What Just Happened (Session 15)

### Write-Verify Oracle + Phase 3 Timeout + 30-Frame Settle

Three root causes from Session 14 fixed in `tools/jsnes-extractor.js`:

**Fix 1: Write-verify oracle for X/Y address detection**

Replaced bidir X linearity test and jump-arc Y detection with `findPositionAddrs(nes, baseState)`:
- Scans 0x0000–0x00FF. For each addr: restore baseState, write +20, step **2 frames**, compare OAM to reference (also +2 frames, no write).
- X match: |dx−20| ≤ 8 AND dy ≤ 3. Y match: |dy−20| ≤ 8 AND dx ≤ 3.
- **Critical finding**: must step 2 frames, not 1. OAM DMA runs at vblank start and shows the *previous* frame's computed positions — 1 frame always produces delta=0.
- Oracle is primary. Bidir xAddr is fallback if oracle fails (e.g. stage-select cursor = BG tiles, no sprites to detect).
- 258 frames total (1 ref + 257 test frames = very fast).

**Fix 2: Phase 3 settle 3→30 frames**
- Level-init routines need ~20 frames after state change to load tile data. 3f was too short.

**Fix 3: Phase 3 timeout + progress**
- 5-minute timeout on coarse sweep (aborts cleanly, proceeds with content vars found so far)
- Progress log every 50 addresses with elapsed time

**Session 15 battery results:**

| Game | Phase 1 | X addr | Y addr | Content vars | States | Notes |
|------|---------|--------|--------|--------------|--------|-------|
| SMB | ✓ frame 360 | $0086 ✓ | $00CE ✓ | 4 ($0773,$07f8,$07f9,$07fa) | 694 | Oracle finds Mario correctly |
| MM2 | ✓ frame 600 | $0008 (bidir fallback) | NOT FOUND | 2 ($001b 87 states, $0051 37 states) | 188 | Stage-select cursor = BG; oracle correctly skips |

**SMB improvement**: Phase 3 now finds 4 content vars (vs 1 in Session 14). $0773 scroll confirmed; $07f8/$07f9/$07fa are new — likely world/level/area ID registers that require 30f settle to manifest as tile changes.

**MM2 limitation**: Phase 1 boots into stage-select screen. Stage-select cursor is BG tile overlay (not a sprite), so oracle correctly finds no sprites to correlate. xAddr=$0008 comes from bidir RAM scan (cursor X position). To get actual Mega Man in-game X/Y, would need to navigate past stage select — a separate problem.

**Key technical facts confirmed:**
- jsnes OAM DMA timing: `spriteMem` reflects positions computed 2 frames ago (not current frame)
- SMB: world X register ($0086) moves OAM X by exactly +20 when scroll is 0; scroll-tracking games cancel out in 1 frame but work in 2
- Sub-pixel registers ($0005/$0002) do NOT produce +20 OAM movement → oracle filters them out correctly

---

## What Just Happened (Session 14)

### jsnes Extraction Pipeline — All 5 Phases, 4-Game Battery

Built `tools/jsnes-extractor.js` — the complete extraction pipeline (Phases 1, 2, 3, 5, 4 in that order). Runs end-to-end on any NES ROM without crashing. Wrote `tools/probe-jsnes.js` to establish jsnes internals (CPU mem size, PPU flags, RAM mirrors, etc.).

**4-game battery results:**

| Game | Phase 1 | X addr | Y addr | Content vars | States | Phase 5 |
|------|---------|--------|--------|--------------|--------|---------|
| SMB | ✓ frame 360 | $0005 (sub-px) | $0002 (sub-px) | 1 ($0773) | 84 | partial |
| MM2 | ✓ frame 600 | $0008 | NOT FOUND | 2 ($001b, $0051) | 187 | skipped |
| Contra | ✓ frame 720 | $01fb (screen-rel) | $0268 | 1 ($0077) | 14 | bad data |
| Zelda | ✗ (file select) | NOT FOUND | NOT FOUND | 1 ($0014) | 102 | skipped |

**What's working:**
- Full pipeline runs to completion on all 4 games without crashing
- Phase 1 control detection: confirmed for 3/4 (Zelda expected failure — file select)
- Phase 3 content variables found for all 4 games, with significant unique state counts
- Phase 4 deep capture working: 14–187 unique states per game, VRAM/RAM/OAM/palette saved
- Per-value baseline restore (fix for false positives from continuous game animation)
- try/catch around CPU steps (fix for invalid opcode crashes on bad RAM mutations)

**Three root causes to fix (Session 15):**

**Root cause 1: Address detection finds sub-pixel positions, not main pixel positions**
- Current algorithm: pick RAM address with highest combined delta in a 15-frame test
- Problem: sub-pixel counters change faster/more than main position registers, so they score higher
- SMB: found $0005 (sub-pixel) instead of $0086 (world X); $0002 instead of $00CE (screen Y)
- Fix: Walk 60 frames from baseline, find the address with the most LINEAR trajectory (lowest variance in per-frame deltas). Sub-pixel counters are noisier. Main position registers have steady, predictable increment.

**Root cause 2: Phase 3 finds continuous variables (scroll), not discrete level selectors**
- Current: writing a value + stepping 3 frames → compare VRAM hash to reference
- Problem: SMB level variables ($075C/$075F) only take visual effect during level initialization. 3 frames after writing is too short. Scroll position ($0773) responds immediately.
- Fix: increase settle time from 3 frames to 30 frames for Phase 3 hash capture. Level-init routines typically run within 20 frames of state change. Slower but catches more real content variables.

**Root cause 3: Phase 5 Y detection base>128 filter is too strict**
- SMB: Mario ground Y ≈ 176 (passes filter) → $0002 found (sub-pixel, base=208)
- MM2: Mega Man ground Y may be < 128 depending on level → filter excluded all candidates
- Contra: Y detection found $0268 (base=244) but it's not writable for gravity test
- Fix: Run jump test WITHOUT base>128 filter first. From all candidates showing a clean arc (decrease at peak, return at land), pick the one with the most parabolic trajectory. Fall back to base>128 filter only if too many false positives.

**MM2 content variables look promising:**
- $001b: 86 unique states, $0051: 37 unique states, pairwise gave 187 total
- MM2 has 8 robot master stages + fortress stages. 187 states plausibly covers stage variants.
- These may be actual stage/room ID variables (MM2 is CHR-RAM — changing stage loads different tile data immediately, so 3 frames is enough)

**Zelda content variable $0014 (102 states):**
- Zelda has 128 overworld screens + 9 dungeons. 102 unique states from one variable is significant.
- $0014 is likely the screen ID or room coordinate variable.
- This is exactly what we want — even though Phase 1 failed (file select), Phase 3 got useful data.

**jsnes probe findings (documented once, stable forever):**
- `nes.cpu.mem` = 65,536 bytes (full address space). NES RAM at 0x0000–0x07FF only.
- Mirrors NOT active in `cpu.mem[]` → scan/iterate 0x0000–0x07FF only
- `cpu.mem[0x2000-0x2007]` = plain array reads (no side effects, no PPU register routing)
- `nes.ppu.f_bgPatternTable` = 1 means BG tiles at $1000, 0 = at $0000
- `nes.papu` exists; `nes.apu` does not; `cpu.mem[0x4015]` returns 0 (no APU data)
- `nes.toJSON()` / `nes.fromJSON()` = fast, complete, reliable

---

## What Just Happened (Session 13)

### Replaced Mesen2 with jsnes — Phase 5 Now Unblocked

Phase 5 physics extraction has been blocked by Mesen2's `--testrunner` mode silently ignoring controller input. After three sessions of workarounds, switched to a Node.js NES emulator library (jsnes) that runs entirely in-process with no Lua sandbox, no callback restrictions, and working input.

**What was done:**

1. **Evaluated npm packages** — `jsnes` (v2.0.0, March 2026) selected. Pure ES module, zero dependencies beyond itself, works in Node.js directly.

2. **Installed jsnes** — Added to project `package.json` alongside `sharp`.

3. **Wrote and ran validation test** (`tools/jsnes-validate.js`) against SMB ROM — all 6 checks passed:
   - ROM loads in-process (no subprocess, no Lua, no stdout parsing)
   - Mario X ($0086) increases by 17 pixels over 30 frames of Right held — confirmed
   - Mario Y ($00CE) decreases by 66 pixels at jump peak during A held — confirmed
   - PPU VRAM accessible at `nes.ppu.vramMem` (32KB) — confirmed
   - OAM accessible at `nes.ppu.spriteMem` (256 bytes) — confirmed
   - Save/restore via `nes.toJSON()` / `nes.fromJSON()` round-trips correctly

**jsnes API surface for the extraction pipeline:**
```js
const nes = new NES({ onFrame: () => {}, emulateSound: false });
nes.loadROM(romData);              // load from binary string
nes.frame();                       // step one frame (synchronous)
nes.buttonDown(1, Controller.BUTTON_RIGHT);  // set input
nes.buttonUp(1, btn);
nes.cpu.mem[addr]                  // read/write CPU RAM (Uint8Array, 64KB)
nes.ppu.vramMem                    // PPU address space (Uint8Array, 32KB)
nes.ppu.spriteMem                  // OAM (Uint8Array, 256 bytes)
nes.toJSON() / nes.fromJSON(state) // save/restore state
```

**What this changes:** The entire extraction pipeline (Phases 1–5) will be ported from `extraction-enumerator.lua` + Mesen2 to a Node.js script using jsnes. The algorithms are identical — only the substrate changes. No orchestrator subprocess needed. No stdout parsing. State saves/restores are in-memory objects.

---

## What Just Happened (Session 12)

### Phase 5: Core Working — Three-Game Battery Complete

Session 12 focused on fixing Phase 5 physics sampling. The pipeline now runs all 5 phases on SMB, MM2, and Contra without crashing. Y detection and input injection are confirmed working for SMB.

**Changes made this session:**

1. **Phase 1 settle fix** — After bidirectional control confirmation, reload `p1BaselineState` before settling (new `settle_reload` sub). Previously the settle ran from the post-flagpole state (Mario in castle-walk animation). Now the settle always starts from the pre-directional-test snapshot.

2. **Phase 5 always uses `p1BaselineState`** — Removed PHYSICS_BASE as LEVEL_STATE for Phase 5. PHYSICS_BASE was being captured in castle-walk/world-complete animations where input is ignored. `p1BaselineState` is the only guaranteed interactive state.

3. **Input sanity check** (`sanity_settle` → `sanity_right`) — After Y detection, reload LEVEL_STATE, settle 60 frames, press Right 10 frames, verify `dx > 0`. If not → `INPUT_BROKEN` → skip tests. Runs once per game before the 6 physics tests.

4. **4-state structured settle per test** (`wait_load` → `wait_load_left` → `wait_load_settle2` → `wait_load_xstable`) — clearInput 60f → Left 5f (cancel rightward inertia) → clearInput 60f → 30-frame X stability check. Replaces single 200-frame settle.

5. **WALK_RIGHT debug logging** — Prints `x` every 10 frames during WALK_RIGHT test.

**Three-game battery results:**

| Game | X addr | Y addr | Y delta | Input | Tests | Notes |
|------|--------|--------|---------|-------|-------|-------|
| SMB | 0x0086 | 0x00CE | -35 | VERIFIED ✅ | 6/6 | Level geometry: Mario mid-jump near wall (World 1-1 end) |
| MM2 | 0x0023 | 0x00EE | -1 | VERIFIED ✅ | 6/6 | X=screen-relative; Y wrong (delta too small) |
| Contra | 0x0100 | 0x0001 | -94 | BROKEN ❌ | 0/6 | False positive: auto-scroll makes X decrease with Right held |

**SMB physics tests** — all 6 complete, but data quality limited:
- WALK_RIGHT: X stuck at 152 (wall); Y=168→127→213 (valid jump arc from mid-air start)
- All tests identical — Mario is mid-jump at start, input irrelevant while airborne
- Y trajectory IS valid — gravity constant derivable from the descent arc

**Root causes of remaining issues:**

1. **SMB test quality** — `p1BaselineState` for SMB1 World 1-1 has Mario mid-air near the level end (Phase 1 takes 10 cycles/710 frames, advancing Mario to ~x=165). All 6 physics tests start mid-jump. Fix: add Y stability check at test start — if Y is changing between two reads, defer (or skip) the test.

2. **MM2 Y detection** — `0x00EE` delta=-1 is a marginal correlation hit. Y stays at value 3 throughout all tests → wrong address. The Y round-trip window (A for 15 frames, snapshot at 10) may be too short for MM2's jump arc, or the base>128 filter excludes the correct address.

3. **Contra sanity check false positive** — Stage 1 is a forced horizontal auto-scroller. `0x0100` is screen-relative X; pressing Right can make X decrease as the scroll advances faster than the player. Fix: change sanity check from `dx > 0` to `|dx| > 2` — movement in either direction confirms input is reaching the game.

---

## What Just Happened (Session 11e)

### Phase 5: Deep Debugging — Unresolved, Deferred to Session 12

Session 11e focused entirely on Phase 5 physics sampling. Despite significant debugging effort, the core Phase 5 issue remained unresolved. **Phases 1-4 were unaffected and continued to work.**

**Changes made:**
1. Round-trip Y detection (replaces dual-snapshot approach)
2. APU capture: `DATA_APU` per Phase 4 state and `DATA_APU_FRAME` alongside `DATA_OAM_FRAME` ✅ working
3. Orchestrator: parses `DATA_APU`, `DATA_APU_FRAME`, `DATA_CANDIDATES` lines; writes apu-frames.json ✅
4. Phase 1 settle improvement: After 120 clearInput frames, added Left press for 5 frames + 60 more clearInput frames to cancel any rightward momentum before saving BASELINE.
5. PHYSICS_BASE concept: Introduced but ultimately not used for Phase 5 — the captured state had residual walk-in velocity and was easily fooled by level-complete animations.

---

## Current Repo State

### File Structure
```
giants-drink/
  claude.md                              ← Updated Session 11a (manifest architecture)
  tools/
    extraction-enumerator.lua            ← Main extraction script (~1130 lines; Phase 5 working)
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
    decisions-log.md                     ← Updated through Decision 96
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

### Session 16: Contra + Zelda + Physics Analysis

**Immediate: run Contra and Zelda through updated extractor**
- Contra: expected to find X/Y via oracle (previous runs found $01fb/$0268 which are screen-relative; oracle should find the actual pixel registers)
- Zelda: Phase 1 fails (file select), Phase 3 still finds content vars — run to confirm $0014 still stable

**Physics derivation: wire `tools/physics-derivation.js`**
- SMB Phase 5 has position arrays in `physics-raw.json` — connect to derivation script
- Derive: gravity (Y descent arc), walk speed (WALK_RIGHT dX/frame), jump velocity (Y at frame 1), variable jump height (JUMP_TAP vs JUMP_HOLD peak delta)

**12-game diversity battery**
- Run full battery against updated extractor: SMB, MM2, Contra, Zelda, Metroid, Castlevania, Ninja Gaiden, DuckTales, Kirby, Mega Man 3, Batman, Bionic Commando
- Goal: confirm oracle works on games with different player sprite configurations (multi-sprite players, CHR-RAM games, etc.)

**MM2 in-level extraction** (nice-to-have, not blocking)
- To get actual Mega Man in-game position, need to navigate past stage select (press A on a stage) — requires extending the boot loop

### Session 17+: Scale Run + Manifest Generation

- Batch orchestrator for full NES library (~760 CHR-RAM games)
- SNES ROM acquisition + validation
- Manifest → game state loader
- Unified engine core build begins

---

## Key Open Questions

1. **MM2/Contra player address accuracy**: `0x0023` (MM2) and `0x0100` (Contra) may be screen-relative X, not world X. For physics extraction we need world X. May need game-specific RAM documentation (Data Crystal) for accurate address mapping on these games.
2. **Y round-trip robustness**: The base>128 filter works for SMB but may exclude valid Y addresses in other games. Need a fallback: scan ALL addresses for the largest round-trip delta, then verify the result makes physical sense (values in 0-240 range, round-trip within ±5).
3. **Zelda name-entry navigation**: Need directional + A input pattern to get past file select.
4. **OAM slot multiplexing**: SMB cycles 3 sprites through the same slot. Need a tracking approach that follows the player sprite by position continuity rather than fixed OAM slot index.
5. **SNES ROM set acquisition** — needed for Session 16+
6. **Game Genie code database** — needed for infinite-lives during extraction
7. Meta-game specification — flagged as needing its own thread (Decision 70, unchanged)
