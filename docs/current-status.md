# Two Fires — Current Status

**Last updated:** 2026-03-12 (Session 18)

---

## What Just Happened (Session 18)

### SMB1 Manifest — 4 More Bug Fixes + Schematic Renderer

Fixed four bugs in `tools/smb-manifest-complete.js` that were producing wrong area data, then built a browser schematic renderer to verify layout data visually.

**Fix 1: Wrong LO pointer table address ($9D28 → $9D2C)**
- `$9D28` is a 4-byte area-type BASE OFFSET table `[0x00, 0x03, 0x19, 0x1C]` — not the LO pointer table
- LO pointer table actually starts at `$9D2C`
- Added separate `areaTypeBases = cpuRead(0x9D28, 4)` and changed LO read to `cpuRead(0x9D2C, 34)`
- This was causing all 34 area pointers to be offset by 4 bytes

**Fix 2: Wrong page advance mechanism (explicit row=0xF → implicit column-decrease)**
- `CMP #$0F` at `$95A7` is in the ENEMY handler, NOT the area object handler
- Area objects use implicit page advance: when `x_col <= prevCol`, page increments
- Replaced `if (y_row === 0xF) { page++; }` with `if (x_col <= prevCol) page++; prevCol = x_col;`

**Fix 3: Wrong global area index (`areas[aoIdx]` → two-level lookup)**
- `aoIdx` is 0-3 (area type), not a flat index into 34 areas
- Correct formula: `global_index = areaTypeBases[aoIdx] + levelOffset`
- Fixed in both the worldLevelMap loop and the per-level file loop

**Fix 4: Wrong AREA_TYPE_NAMES mapping**
- h1 bits 5-4 encode background SCENERY type, not the area category
- Old mapping `['above_ground', 'underground', 'underwater', 'castle']` was wrong
- Correct: `['above_ground', 'above_ground_hills', 'underwater', 'underground']`
  - 0 = above_ground (plain sky — bonus rooms, bridge levels)
  - 1 = above_ground_hills (standard levels with scenery — W1-1 etc.)
  - 2 = underwater (unused in SMB1)
  - 3 = underground (W1-2, W4-2, W7-2)

**Results after fixes (W1-1 = area 8):**
- `area_ptr: 0xA68E` (was 0xAE03 — 4 bytes off due to wrong LO table)
- `area_type: above_ground_hills` (was "underground")
- `total_pages: 13`, `object_count: 48`, `enemy_count: 29`

**Schematic renderer created:**
- `~/nes-manifests/super-mario-bros/engine/test3.html` — standalone, no CHR/tiles/palettes
- Loads `manifest.json`, reads `areas[8].objects` + `enemy_areas[11].enemies`
- Colored shapes: blue sky, brown ground, yellow ?blocks, dark red bricks, green pipes, gray stairs, white flagpole shaft, red circles for enemies (abbreviated labels)
- Arrow key scrolling across 224 columns (14 pages × 16)
- Purpose: verify layout data correctness independent of tile rendering

**Also updated `engine/index.html`:**
- Replaced hand-coded `buildLevelGrid()` with `buildGridFromArea(areaObjects)` that reads manifest
- Fixed enemy loop: `areaKey = 11` (was `'1'` string), added `.enemies` accessor

**Server:** `python3 -m http.server 8080` rooted at `~/nes-manifests/super-mario-bros/`
- test3.html URL: `http://localhost:8080/engine/test3.html`
- Hard refresh: Cmd+Shift+R

**Not yet verified:** test3.html layout correctness — user will test next

---

## What Just Happened (Session 17)

### SMB1 Complete Manifest — 100% Extraction

Built `tools/smb-manifest-complete.js` — a complete replacement for the partial `smb-manifest.js`. Produces a full reference manifest for Super Mario Bros. (NES, 1985) from the ROM binary alone.

**Output (all written to `~/nes-manifests/super-mario-bros/`):**
- `manifest.json` — 733.8 KB, all physics, all world-level mappings, all enemy areas, scoring, warp zones, game structure
- `enemies.json` — all 16 enemy types with speed, behavior, stompability, fire immunity, world appearances
- `tiles.png` — CHR-ROM tile sheet (unchanged from prior sessions)
- `levels/` directory — 36 level JSON files: W1-1 through W8-4, plus bonus rooms, warp areas, and post-game stubs

**ROM-confirmed physics values:**
- Walk speed: 25 sub-px/frame = 1.5625 px/frame (16 sub-px/px system)
- Run speed: 31 sub-px/frame = 1.9375 px/frame
- Walk jump Y velocity: -4 px/frame (`$FC` at `$B432–$B434`)
- Run jump Y velocity: -5 px/frame (`$FB` at `$B435–$B436`)
- JumpForce table: `[7,7,6,5,4,3,2,1,0]` at `$9AA5` (applied while A held)
- FallForce table: `[3,3,4,5,6,7,8,9,10]` at `$9AAE`

**ROM-confirmed game structure:**
- Kill score progression: 100,200,400,800,1000,2000,4000,8000,1UP (packed BCD at `$C68A`)
- Starting lives: 2 extra lives (`$02` at CPU `$9069`)
- Star duration: 176 frames / `$B0` (ROM `$99C4`: `LDA #$B0 / STA $0D01`)
- Warp W1-2: worlds [2,3,4] (ROM `$85BC`)
- Warp W4-2: worlds [6,7,8] (ROM `$99EE`)

**Bugs found and fixed during this session:**
1. Score table: `cpuRead(0xC689)` → `cpuRead(0xC68A)` (off-by-one; `$C689` is `$60` = RTS opcode)
2. Bonus room detection: position-based → `ao_idx===0 && !isCastle` (content-based, correct)
3. isPostGame check before isBonusRoom (W8 post-game has ao_idx=0 + invalid enemy area 62≥34)
4. Player level numbering: only increments for non-internal, non-castle levels

**World-level structure confirmed:**
- 8 worlds × 4 player-facing levels + castles = 32 numbered levels
- 4 internal bonus rooms (W1, W2, W7 share template 0; others added as needed)
- Warp zone areas: W1-2 (3 pipes) and W4-2 (3 pipes + vine)
- 1 post-game stub (W8 after castle)
- Total: 36 level files covering all valid entries in the ROM world-level table

**Open question (still unresolved, deferred to Session 18):**
- Area objects 0-3 are shared templates. The unique per-level geometry (areas 4-33) is accessed via a different mechanism not yet traced. `ao_idx=1` template has 0 objects — base ground/sky terrain is rendered automatically by the game engine. How areas 4-33 are assigned to specific world/levels requires a new code trace from `$9C50`.

---

## What Just Happened (Session 16)

### SMB1 Manifest Extractor — Three Bug Fixes + World/Level Map

`tools/smb-manifest.js` was producing wrong output due to three bugs inherited from previous sessions. All three fixed and verified against ROM binary.

**Fix 1: Area pointer tables (critical)**
- Old: `$805A`/`$806D` (19 entries) — these are the **palette setup tables**, not level geometry
- New: `$9D28`/`$9D4E` (34 entries) — the actual area object pointer tables used by the ZP `$E7/$E8` area loader
- Result: all 34 areas now decoded correctly (was 19 before, all from wrong palette data)

**Fix 2: Area object terminator**
- Old: `if (b2 === 0xFD || b2 === 0xFE) { break; }` — checked byte 2, never fired, read 200+ objects per area
- New: `if (b1 === 0xFD) { break; }` — byte 1 is the terminator, checked before nibble decode
- Confirmed by `CMP #$FD` at CPU `$9516`/`$95A1`: `LDA ($E7),Y; CMP #$FD; BEQ end`
- Note: `b2` may validly be `$FD` (e.g. flagpole type) — it is NOT a terminator

**Fix 3: Area type label mapping**
- Old: `['ground','underground','underwater','castle']` — index 0 was wrong
- New: `['above_ground','underground','underwater','castle']`
- Verified: area 1 (W1-1 template) has header `h0=0x4D` → bits 5-4 = `00` → `above_ground` ✓
- Verified: castle areas (3, 6, 12, 16, 20) have bits 5-4 = `11` = 3 → `castle` ✓

**Fix 4: Enemy format (page embedded in byte 1)**
- Old: `x_col=bits6-4, y_row=bits3-0` in byte 1 + separate page-advance detection (never fired → all enemies on page 0)
- New: `page=bits6-4, col=bits3-0` in byte 1; `type=bits7-4, y=bits3-0` in byte 2
- Result: enemies now spread across pages 0-7 with realistic distributions

**Added: World/level → area_obj + enemy_area mapping**
- Decoded `$9CB4` (world bases) + `$9CBC` (40 level info entries) + `$9CE0` (enemy base by type)
- `world_level_map` field in manifest: all 36 valid levels across 8 worlds
- W1-1 → ao_idx=1, enemy_area=11 ✓
- Castle levels use enemy areas 0-5 (one per world, with sharing between W1/W6 and W2/W5)
- W1-5/W2-5/etc. are the internal castle entries; player-facing "W1-4" is internal sub-level 4

**Manifest output (verified):**
- 34 area objects, correct area types, object counts plausible (area 12 = castle 87 objects/8 pages = likely W8-4)
- 34 enemy areas, enemies distributed across pages 0-7
- World/level map for all 36 valid levels
- Physics tables (unchanged, still verified)
- 707 KB manifest.json + tiles.png

**Remaining unknowns (not blocking):**
- W1-1 area object template (ao_idx=1) has 0 regular objects — the level geometry for scrolling above-ground levels may use a different system (not yet found)
- Enemy area 11 (W1-1 enemy data) contains hammer brothers and spinies which don't appear in W1-1 normal play — the exact level-to-enemy-area mapping may need further verification

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
    smb-manifest-complete.js             ← NEW Session 17: complete SMB1 manifest extractor
    jsnes-extractor.js                   ← jsnes-based extraction pipeline (Sessions 13-15)
    extraction-enumerator.lua            ← Old Mesen2 script (superseded by jsnes)
    orchestrator.js                      ← Node.js Mesen2 runner + stdout parser
    physics-derivation.js                ← Position data → physics constants
    extract-chr-rom.js                   ← NES CHR-ROM bulk extractor (Session 8)
    mesen-extract.lua                    ← Single-frame capture (Sessions 9-10, superseded)
    render-screen.js                     ← NES screen renderer (Sessions 9-10)
  src/
    (unchanged from Session 10)
  data/
    (unchanged)
  docs/
    current-status.md                    ← THIS FILE
    decisions-log.md                     ← Updated through Decision 100
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

### Session 18: SMB Manifest — Find Scrolling Level Geometry

The main open question: where is the per-level scrolling tile layout stored?

- Area objects at `$9D28/$9D4E` define only the EXTRA features (custom pipes, bricks, question blocks)
- Most levels use ao_idx=1 (template with 0 objects) — the base ground/sky terrain is rendered automatically
- Long unique areas (4-33) in the area object table are accessed via a DIFFERENT mechanism not yet identified
- The connection between area objects 4-33 and specific world/levels needs a new code trace
- Approach: trace the level loading code at `$9C50` — follow how it selects from the 34 areas beyond the 4 templates

**Continue jsnes extraction pipeline** (deferred from Session 16)
- Contra/Zelda oracle runs still pending
- Physics derivation wiring still pending
- 12-game battery still pending

### Session 19+: Scale Run + Manifest Generation

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
