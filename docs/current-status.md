# Two Fires — Current Status

**Last updated:** 2026-03-11 (Session 13)

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

### Session 14 — Port Extraction Pipeline to jsnes

Port all 5 phases from `extraction-enumerator.lua` to a Node.js jsnes script. The algorithms are already proven — this is a substrate swap, not a redesign.

**Port map (Lua → Node.js):**

| Lua construct | Node.js equivalent |
|---|---|
| `emu.read(addr)` | `nes.cpu.mem[addr]` |
| `emu.write(addr, val)` | `nes.cpu.mem[addr] = val` |
| `emu.saveSavestate()` | `state = nes.toJSON()` |
| `emu.loadSavestate()` | `nes.fromJSON(state)` |
| `emu.setInput(port, input)` | `nes.buttonDown(1, btn)` / `nes.buttonUp()` |
| `print("DATA_RAM:...")` (stdout export) | Direct JS object — no serialization needed |
| `emu.addEventCallback(fn, "startFrame")` | `for` loop calling `nes.frame()` |

**Phase 5 fixes to carry over from Session 12/13 decisions:**
- Sanity check: `Math.abs(dx) > 2` (not `dx > 0`) — handles auto-scrollers
- Y stability check before each test: if `|dY| > 2` over 30 frames → player airborne → reload + retry (max 3)
- MM2 jump window: hold A for 20 frames (not 15), snapshot at frame 15

**OAM scanning (Phase 1 player detection):**
- jsnes `nes.ppu.spriteMem` is a live 256-byte array — read directly each frame
- Same slot detection logic: any slot with `dxRight > 0 && dxLeft < 0` = player

**Output format:** Phase 1–5 results go directly into a JS object, no DATA_ prefix parsing needed. Orchestrator becomes a simple `node extract.js <rom>` call.

**No subprocess, no stdout, no Lua.** The new extractor will be ~400 lines of straightforward Node.js.

### Session 15: 12-Game Diversity Battery + Physics Analysis

- Run jsnes extractor against 12-game diversity battery from spec
- Wire `tools/physics-derivation.js` to position arrays from extraction output
- Derive constants: gravity (Y descent arc), walk speed (WALK_RIGHT dX/frame), jump velocity (Y at frame 1), variable jump height (JUMP_TAP vs JUMP_HOLD peak delta)
- Add directional input + A sequences for name-entry/file-select screens (Zelda/RPGs)
- Begin manifest generation (recording analyzer, Claude interpretation)

### Session 16+: Scale Run + Engine Build

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
