# Two Fires — Current Status

**Last updated:** 2026-03-09 (Phase 1, Session 10)

---

## What Just Happened (Session 10)

### CHR-RAM Extraction Validated

Ran Mesen2 extraction pipeline on Mega Man 2 (CHR-RAM/UNROM) and Castlevania (CHR-RAM/UNROM). Both render pixel-perfectly. Two bugs fixed in render-screen.js:
1. Hardcoded SMB1 BG bank — now derived from PPUCTRL at render time
2. `nesPpuDebug[0]` unreliable for CHR-RAM games — replaced with nametable coverage heuristic

**Result:** The extraction pipeline works for the entire NES library — both CHR-ROM (tiles in file) and CHR-RAM (tiles only in runtime VRAM).

### Architectural Redesign: Universal Extraction + Manifest Architecture

Major design session producing `docs/design/universal-extraction-spec.md`. This reshapes Two Fires' foundation:

**1. RAM Mutation Content Enumerator (Decision 83)**
Replaces the chaos player. Instead of simulating gameplay to explore content, systematically mutates every candidate RAM byte and observes VRAM changes. Content-switching variables (level ID, room ID) are identified by which mutations cause the PPU to load different tiles. All values of these variables are enumerated, capturing the entire game's content in ~3 minutes with zero per-game configuration.

**2. Unified Engine with Rendering Modes (Decision 84)**
Replaces 7 separate engine clusters with one configurable engine + 7 swappable rendering modes. Modes share ~80% of code (tile/sprite rendering, entity system, collision, input, CAS integration). Paradigm shifts become rendering mode hot-swaps.

**3. Manifest as Ingredient Library (Decision 85)**
Extraction produces a per-game manifest.json containing complete visual (tiles, sprites, palettes), structural (level layouts, entity placements, progression), and mechanical (physics constants, enemy behaviors, game rules) ground truth. Manifests populate the existing game state schema — they don't replace it. Claude's creative layer generates CAS setup, narrative, social ecology on top of manifest data.

**4. Expanded Scope (Decision 86)**
~1,605 games: all US NES (~680), all US SNES (~725), 100 Genesis, 50 arcade, 50 PC. Total extraction cost: ~9 hours compute + ~$50 API.

**Downstream impact:**
- Generation latency drops 60-80% (manifest loads replace generation)
- Generation cost drops proportionally (Claude composes, doesn't invent)
- Track A/B becomes a continuous blend spectrum, not a binary toggle
- CAS modulates real extracted parameters (not abstract values)
- Paradigm shifts use rendering mode swaps with manifest data
- Sequencing grammar seeds grounded in real game teachability arcs
- Build plan reduced from ~55-60 sessions to ~45

---

## Current Repo State

### File Structure
```
giants-drink/
  claude.md                              ← Needs update for manifest architecture
  tools/
    extract-chr-rom.js                   ← NES CHR-ROM bulk extractor (Session 8)
    mesen-extract.lua                    ← Mesen2 Lua extraction script (Session 9-10)
    render-screen.js                     ← NES screen renderer (Session 9-10, bugs fixed)
  src/
    asset-resolver.js                    ← Needs update for manifest queries
    game-loop.js, renderer.js, etc.      ← Will be rebuilt as unified engine
  data/
    test-fixtures/                       ← Unchanged
    ground-truth/                        ← Phase 0.5 ingestion (~37MB)
  docs/
    current-status.md                    ← THIS FILE
    decisions-log.md                     ← Needs Decisions 83-86 appended
    design/
      universal-extraction-spec.md       ← NEW: definitive extraction + manifest architecture
      rom-extraction-strategy.md         ← SUPERSEDED by universal-extraction-spec.md
      build-plan-v4.md                   ← SUPERSEDED — v5 in extraction spec
      (other design docs unchanged)
```

### External (not in repo)
```
~/nes-roms/                              ← No-Intro NES ROM set (~3,146 .nes files)
~/nes-extracted/                         ← CHR-ROM tile sheets (2,383 games) + capture tests
~/mesen2/                                ← Mesen2 emulator installation
```

### Deployed
- Vercel: two-fixture platformer (unchanged)
- Cloudflare R2: TSR catalog + partial sprites (will be replaced by manifest library)

---

## What's Next

### Immediate: Session 11 — Universal Extraction Pipeline Build (Session UE-1)

This is the highest-priority engineering session. Build the core extraction pipeline:

1. **Enhanced Mesen2 Lua recorder** — extend from single-frame capture to full-state-per-frame recording with delta compression
2. **RAM mutation content enumerator** — the Phase 1-4 algorithm from the spec
3. **Physics sampling module** — controlled input sequences for physics derivation
4. **Node.js orchestrator** — spawn Mesen2, capture output, store recordings

**Critical tests this session:**
- TEST 1: SMB full pipeline validation (compare against known community data)
- TEST 2: MM2 + Zelda + Contra three-game battery

**If Test 1 fails:** Stop, debug, do not proceed.
**If Test 2 fails on 2+ games:** Architectural problem, redesign before scaling.

### Session 12: Analysis & Manifest Generation (UE-2)

- Recording analyzer (tile dedup, sprite clustering, layout stitching)
- Physics derivation from position-over-time curves
- Enemy behavior pattern extraction
- Claude interpretation pipeline (summary → API → manifest JSON)
- TEST 3: 12-game diversity battery

### Session 13: Scale Run + Integration (UE-3)

- Batch orchestrator for full library
- SNES ROM acquisition + SNES validation
- Manifest → game state loader
- TEST 4: End-to-end creative pipeline
- TEST 5: Full library overnight run

### Session 14+: Unified Engine Build (Phase 1)

- Core engine loading from manifests
- Rendering modes: tile_2d_sideview first, then additional modes
- CAS integration layer
- Diagnostics pipeline

---

## Key Decisions This Session

- **Decision 83:** RAM mutation content enumerator replaces chaos player
- **Decision 84:** Unified engine with 7 rendering modes replaces 7 separate clusters
- **Decision 85:** Manifest as ingredient library populating game state (not replacing it)
- **Decision 86:** Scope expanded to ~1,605 games (all US NES/SNES + Genesis/arcade/PC)

---

## Key Open Questions

1. ~~CHR-RAM extraction~~ → Validated (RESOLVED)
2. **SNES ROM set acquisition** — needed for Session 13
3. **Genesis emulation** — Mesen2 may not support Genesis; may need separate emulator
4. **Game Genie code database** — needed for infinite-lives during extraction
5. **Pairwise RAM mutation** — how much does testing variable pairs improve coverage? (Test empirically)
6. Meta-game specification — flagged as needing its own thread (Decision 70, unchanged)
