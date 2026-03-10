# Two Fires — Current Status

**Last updated:** 2026-03-10 (Session 11b)

---

## What Just Happened (Session 11b)

### Phase 1 Boot Detection — Rewritten and Validated

**The problem:** Session 11a's Phase 1 used passive sprite-count heuristics (no-sprite-window detection, nametable density) to detect when the game reached gameplay. SMB1's attract demo looks identical to gameplay from those metrics — BASELINE was being captured during the demo, causing Phase 3 to find no real content variables.

**The fix:** Replaced all passive heuristics with an active bidirectional control test as the PRIMARY detection mechanism. Each ~75-frame cycle:
1. Press Start (odd cycles) or A (even cycles) for 10 frames
2. Wait 40 frames for the game to react
3. Snapshot all 64 OAM sprite X positions (pre-test)
4. Hold Right 10 frames, snapshot again (mid-test)
5. Hold Left 10 frames, snapshot (post-test)
6. Any sprite where mid > pre (moved right) AND post < mid (moved left) = player confirmed

This correctly rejects attract demos (pre-recorded input ignores Left button). Only real gameplay responds to both directions.

**Results on 4 games:**

| Game | Result | Frame | Cycle | Slot | dxRight / dxLeft |
|------|--------|-------|-------|------|-----------------|
| SMB1 | ✅ | 710 | 10 (A) | 52 | 36 / -44 |
| Mega Man 2 | ✅ | 639 | 9 (Start) | 57 | 105 / -105 |
| Contra | ✅ | 284 | 4 (A) | 18 | 44 / -105 |
| Legend of Zelda | ❌ TIMEOUT | 1800 | 26 | — | — |

**Zelda timeout:** Zelda's new-game boot sequence requires navigating a name-entry screen (type your name, press Start). Button-mashing Start/A doesn't resolve it — needs Down+A to select "End" and register a blank name. Game-specific issue, not a fundamental failure of the bidirectional test.

---

### Phase 3 Content Variables — Working, With Architectural Limitation

Phase 3 found 2 content variables in SMB1: `0x06D4` (unique=5) and `0x073D` (unique=5). Phase 4 captured 10 distinct states. Pipeline structurally complete.

**The limitation:** Expected level variables (`0x075C` area pointer, `0x075F` world number) were NOT found. Reason: Phase 2 classifies these as CONSTANT (they don't change while playing World 1-1) and excludes them from the mutation sweep. The Phase 2 candidate filter removes exactly the variables we need.

**Fix needed (Session 12):** Phase 3 should also sweep constant addresses. Option: after the candidate-only sweep, do a second pass over ALL 2048 addresses with a larger P3_SAMPLE_STEP to catch constant level variables without blowing up runtime.

---

### Phase 5 Physics — Structurally Complete, Data Unreliable

All 6 physics tests run and produce output. But all 6 tests produce **identical trajectories** — inputs are not affecting the game state after savestate load, OR the OAM slot from Phase 1 is unreliable.

**Identified issues:**
1. **BASELINE captured mid-jump:** Phase 1 cycle 10 pressed A (jump button in SMB1), waited 40 frames, saved BASELINE. At the 40-frame mark, Mario may be mid-air and about to enter a pipe. Pipe entry animations (~33 frames) ignore all player input → all tests produce the same pipe-entry trajectory.
2. **OAM sprite multiplexing:** SMB1 uses slot 52 for multiple sprites on alternating frames (3-frame cycling visible in data). The slot that passed Phase 1's bidirectional test doesn't reliably track Mario in Phase 5.
3. **Post-savestate input initialization:** Added 5-frame input warmup after loadstate (P5_WARMUP_FRAMES=5) but identical trajectories persist. Suggests the state issue is BASELINE quality (#1), not input timing.

**Fix needed (Session 12):**
- For BASELINE quality: before saving BASELINE, verify Mario is on the ground (OAM Y ≈ 175 for SMB) and not in a transition animation. Or: save BASELINE only AFTER the Right directional test (use a second savestate in Phase 1).
- For OAM slot tracking: probe multiple slots per frame to find which one tracks a moving entity, rather than locking in one slot from Phase 1.

---

## Current Repo State

### File Structure
```
giants-drink/
  claude.md                              ← Architectural blueprint (current)
  tools/
    extract-chr-rom.js                   ← NES CHR-ROM bulk extractor (✅ complete)
    extraction-enumerator.lua            ← Session 11b: Phase 1 rewritten
    mesen-extract.lua                    ← Older single-frame capture (superseded)
    render-screen.js                     ← NES screen renderer (✅ validated)
  docs/
    current-status.md                    ← THIS FILE
    decisions-log.md                     ← Decisions 83-88
    design/
      universal-extraction-spec.md       ← Extraction + manifest architecture
```

### External (not in repo)
```
~/nes-roms/                              ← No-Intro NES ROM set (~3,146 .nes files)
~/nes-extracted/                         ← CHR-ROM tile sheets (2,383 games)
~/mesen2/                                ← Mesen2 emulator
```

---

## What's Next

### Immediate: Session 12 — Phase 3 + Phase 5 Fixes

**Priority 1 — Phase 3: sweep constant addresses**
Add second pass in Phase 3 to test ALL 2048 RAM addresses (not just volatile candidates). Use P3_SAMPLE_STEP=32 (8 sampled values). This adds ~2048 × 8 × 5 frames ≈ 82,000 frames per game — about 1.4 minutes at 1000x. Acceptable. Expected: `0x075F` (world) and `0x075C` (area) should show up with many unique VRAM hashes.

**Priority 2 — Phase 5: BASELINE quality + OAM tracking**
- Fix BASELINE capture: after Phase 1 confirms control, wait for player to be standing on ground (OAM Y > 160 and stable for N frames) before saving BASELINE. This avoids the mid-jump/pipe-entry problem.
- Fix OAM tracking: scan multiple slots per frame and pick the one that consistently changes with directional input instead of locking in from Phase 1.

**Priority 3 — Zelda boot handling**
Zelda needs a name-entry bypass. After 10 failed cycles, try pressing Down × 8 then A to select "End" and register blank name. Or: detect name-entry screen by OAM pattern and send the bypass sequence.

### Session 13: Recording Analyzer + Manifest Generation

- Deduplicate tiles, cluster sprites, stitch level layouts
- Derive physics constants from position-over-time curves
- Claude interpretation pipeline (VRAM state → manifest JSON)
- TEST: 12-game diversity battery

---

## Key Open Questions

1. **Phase 3 constant address sweep** — confirm that level variables show up with sufficient VRAM variance (need full 256-value sampling, not just 8)
2. **BASELINE position quality** — need ground-state verification before save
3. **SNES ROM set acquisition** — needed for Session 13
4. **Genesis emulation** — Mesen2 may not support Genesis; may need separate emulator
5. **Zelda name-entry bypass** — game-specific boot handling needed
6. Meta-game specification — flagged, unchanged
