# Universal Game Extraction & Manifest Architecture
## Definitive Specification — Session 10

**Date:** 2026-03-09
**Status:** Design complete, ready for implementation
**Supersedes:** `docs/design/rom-extraction-strategy.md` (Session 7), build-plan-v4 Phase 0.75

---

## 1. Vision

Two Fires' value proposition shifts from "AI generates games from general knowledge" to "AI has internalized ~1,600 real games at perfect fidelity and creatively recombines them." Every generated game is grounded in real, tested, beloved game mechanics. The AI's creativity operates on proven ingredients rather than improvising from scratch.

**The fidelity bar:** If a player prompts "Mega Man 2: real game exactly as it was in the 1980s," they get it. Same gravity, same jump arc, same slide distance, same enemy behaviors, same level layouts, same tiles. Indistinguishable from the original cartridge.

**The creative bar:** If a player prompts "Mega Man 2, but every boss fight is a Mario Kart race, the levels mix in Mega Man X style, the music sounds like The Cure, and the world is Breaking Bad × Muppets" — the system loads exact mechanical data from MM2, MK, and MMX manifests, applies creative direction for theme/music/narrative, and produces something that feels mechanically authentic because it IS mechanically authentic.

---

## 2. Extraction Scope

### Target Library

| Platform | Count | Method | Source |
|----------|-------|--------|--------|
| NES | All US-licensed titles (~680) | Mesen2 headless | No-Intro ROM set (already acquired) |
| SNES | All US-licensed titles (~725) | Mesen2 headless | No-Intro SNES ROM set (to acquire) |
| Genesis | Top 100 | Genesis Plus GX or Mesen2 | No-Intro Genesis ROM set |
| Arcade | 50 hand-picked (deduplicated) | MAME Lua | MAME ROM set |
| PC | 50 (FPS + RTS + sim canon) | Existing extraction tools | WAD/MPQ/MIX extractors |
| **Total** | **~1,605** | | |

### Cost & Time Budget

| Resource | Budget |
|----------|--------|
| Emulator compute | ~9 hours (8 parallel instances) |
| Claude API (manifest interpretation) | ~$50 (Haiku for bulk, Sonnet for complex) |
| Storage | ~5-10GB total manifests |
| Calendar time (extraction run) | One overnight session |

---

## 3. The RAM Mutation Content Enumerator

### Core Insight

Instead of playing the game to discover content (chaos player), we systematically force the game to load all its own content by mutating RAM. The game engine reads data tables based on RAM state variables (current level, room ID, game phase). By writing every possible value to every candidate RAM address and observing what the PPU loads, we enumerate all game content without playing.

### Algorithm

```
Phase 1: BOOT TO GAMEPLAY (~5-10 seconds emulated)
  - Load ROM in Mesen2 headless
  - Apply Game Genie infinite-lives code (if available)
  - Press Start at 2-second intervals for 10 seconds
  - Detect "gameplay state" by checking:
    - OAM has >4 active sprites (title screens typically have few)
    - Nametable has >60% non-zero tiles (gameplay screens are dense)
    - RAM write frequency is high (gameplay has lots of state updates)
  - Save emulator state as BASELINE_STATE

Phase 2: IDENTIFY CONTENT-SWITCHING VARIABLES (~30 seconds)
  - From BASELINE_STATE, snapshot RAM 5 times over 300 frames
  - Classify each RAM byte:
    - CONSTANT: never changes across snapshots → skip
    - FRAME_TICKER: changes every snapshot monotonically → skip  
    - VOLATILE: changes occasionally → CANDIDATE
  - Typically yields 100-300 candidate addresses

Phase 3: MUTATION SWEEP (~30-60 seconds)
  For each CANDIDATE address:
    For each value 0-255:
      - Restore BASELINE_STATE
      - Write value to address
      - Run 3 frames (let engine react)
      - Capture: VRAM tile hash, nametable hash, palette hash
      - Did mapper bank switch occur? (hardware signal)
      - Restore BASELINE_STATE
  
  Score each address:
    - Number of UNIQUE VRAM states produced across 256 values
    - Number of mapper bank switches triggered
    - Addresses scoring >3 unique states = CONTENT VARIABLES

Phase 4: DEEP ENUMERATION (~60-90 seconds)
  For each CONTENT VARIABLE (typically 5-20 addresses):
    For each value that produced a unique VRAM state:
      - Restore BASELINE_STATE
      - Write value to address
      - Run 120 frames (2 seconds — let level fully load)
      - Capture FULL STATE:
        - All 2KB RAM (delta-compressed from baseline)
        - All VRAM tile data (complete pattern tables)
        - Full nametable (32×30 tile grid)
        - Palette RAM (all 32 entries)
        - OAM table (all 64 sprites)
        - Mapper state (current bank configuration)
        - PPUCTRL/PPUMASK register values
      - Additionally: run 300 more frames while recording
        OAM positions every frame (for enemy behavior observation)
      - Restore BASELINE_STATE

Phase 5: PHYSICS SAMPLING (~30 seconds)
  From a gameplay state (any content variable value that has
  a dense nametable + active OAM):
    - Identify player sprite via OAM persistence analysis
      (which sprite index is present across all frames?)
    - Record controlled input sequences:
      - Press Right 120 frames → walk speed
      - Release all 60 frames → friction/deceleration
      - Press A (tap) → jump height (short hop)
      - Press A (hold) → jump height (full jump)
      - Press A in air → air control or double jump
      - Press Right + A → running jump
      - Walk off ledge → coyote time + gravity
      - Press Down → duck or fast-fall
    - For each sequence: record player sprite OAM position
      every frame → position-over-time curves
    - Derive: gravity, max walk speed, max run speed, 
      jump velocity, air friction, ground friction,
      coyote frames, variable jump height range
```

### Why This Generalizes

Every NES/SNES game stores its current level/room/stage as a RAM variable. The hardware mandates that changing this variable causes the engine to load different tile data into VRAM. The mutation sweep finds these variables without knowing their addresses — it simply observes which RAM bytes control what's on screen. This is a consequence of how the hardware works, not a convention that games might violate.

### Edge Cases

| Edge Case | Handling |
|-----------|---------|
| Game with no stage select variable (linear games) | Mutation sweep finds room/screen ID instead — still works |
| Multi-variable content gates (need items A+B+C) | Pairwise mutation for top 20 candidates adds ~60s, catches most |
| Games with checksums/validation on RAM | Rare on NES/SNES; if mutation crashes, flag for manual inspection |
| Games that boot to cutscene, not gameplay | Extended boot phase with repeated Start + directional input |
| SNES games with 128KB RAM | Candidate filtering is proportionally more important; same algorithm, wider scan |

---

## 4. Unified Extraction Pass

All three ground truth categories — visual, structural, mechanical — are captured in a single emulator run.

### Output Per Game: The Manifest

```json
{
  "manifest_version": "1.0",
  "game_id": "mega-man-2-usa",
  "platform": "nes",
  "rom_hash": "sha256:abc123...",

  "visual": {
    "tile_dictionary": {
      "count": 847,
      "tiles": "base64-encoded unique 8x8 tiles",
      "palette_sets": [
        { "id": "palette_0", "colors": ["#0F", "#16", "#2A", "#38"] }
      ]
    },
    "sprite_dictionary": {
      "entries": [
        {
          "id": "sprite_player_walk_1",
          "tile_indices": [12, 13, 28, 29],
          "arrangement": "2x2",
          "palette": "palette_1",
          "observed_contexts": ["gameplay", "level_1", "level_3"]
        }
      ]
    },
    "background_sets": [
      {
        "content_variable_value": 1,
        "label": "level_1",
        "nametable": "base64-encoded 32x30 tile index grid",
        "attribute_table": "base64-encoded palette assignments",
        "scroll_frames": "base64-encoded nametable evolution over 300 frames"
      }
    ]
  },

  "structural": {
    "levels": [
      {
        "id": "level_1",
        "content_variable": { "address": "0x0032", "value": 1 },
        "layout": {
          "format": "tilemap_2d_scrolling",
          "width_tiles": 256,
          "height_tiles": 15,
          "tile_grid": "base64-encoded full level tilemap (stitched from scroll)",
          "collision_grid": "base64-encoded (derived: solid vs passable tiles)"
        },
        "entity_placements": [
          {
            "sprite_id": "sprite_enemy_met",
            "position": { "x": 320, "y": 176 },
            "behavior_id": "behavior_patrol_horizontal"
          }
        ]
      }
    ],
    "progression": {
      "type": "stage_select",
      "stages": [1, 2, 3, 4, 5, 6, 7, 8],
      "fortress_stages": [9, 10, 11, 12]
    }
  },

  "mechanical": {
    "player_physics": {
      "gravity": 0.25,
      "gravity_unit": "pixels_per_frame_squared",
      "max_walk_speed": 1.5,
      "max_run_speed": null,
      "jump_velocity_initial": -4.5,
      "jump_velocity_variable": true,
      "variable_jump_min_frames": 8,
      "variable_jump_max_frames": 24,
      "air_control": 1.0,
      "ground_friction": 0.85,
      "coyote_frames": 0,
      "special_abilities": ["slide"]
    },
    "enemy_behaviors": [
      {
        "id": "behavior_patrol_horizontal",
        "observed_pattern": "linear_oscillation",
        "speed": 0.75,
        "range_pixels": 64,
        "reversal_trigger": "wall_collision",
        "attack_pattern": null,
        "hp": 1,
        "contact_damage": 2
      },
      {
        "id": "behavior_turret_aimed",
        "observed_pattern": "stationary_aim_fire",
        "fire_rate_frames": 90,
        "projectile_speed": 2.5,
        "aim_type": "player_tracking",
        "hp": 3,
        "contact_damage": 4
      }
    ],
    "game_rules": {
      "player_max_hp": 28,
      "lives_start": 3,
      "damage_invincibility_frames": 60,
      "weapon_system": {
        "type": "selectable_inventory",
        "weapons_observed": 10
      }
    }
  },

  "metadata": {
    "extraction_date": "2026-03-10",
    "emulator": "mesen2",
    "content_variables_found": 3,
    "unique_vram_states_captured": 47,
    "physics_confidence": 0.99,
    "behavior_confidence": 0.95,
    "coverage_estimate": 0.92
  }
}
```

### Manifest → Game State Schema Mapping

The manifest does NOT replace the game state schema. It populates it.

| Manifest Section | Populates Game State Block | How |
|-----------------|---------------------------|-----|
| `visual.tile_dictionary` + `visual.sprite_dictionary` | `episode` (entity asset specs, tile rendering) | Direct data load |
| `visual.background_sets` | `episode.spatial` (tilemap data) | Direct data load |
| `structural.levels` | `episode.spatial` + `episode.entities` | Level layout + entity placements |
| `structural.progression` | `meta` (game structure) | Claude interprets into skeleton |
| `mechanical.player_physics` | `episode.physics` | Direct parameter load |
| `mechanical.enemy_behaviors` | `world.entities[].behavioral_parameters` | Maps to flat float dict |
| `mechanical.game_rules` | `meta` + `episode` | Rules populate both |
| — | `world.factions`, `cas`, `player`, `overseer` | Claude's creative layer (NOT from manifest) |

**Key insight:** The manifest provides the mechanical foundation. Claude provides the social ecology, narrative, and creative direction. The game state schema accommodates both. This is why the schema doesn't need to change — it was already designed as a container for both extracted data and generated content.

---

## 5. Unified Engine Architecture

### The Shift: 7 Clusters → 1 Configurable Engine + 7 Rendering Modes

The manifest-based approach changes the engine calculus. Previously, each engine cluster needed to know how to generate its paradigm's content. With manifests, the engine just needs to render manifest data. The rendering differences between paradigms reduce to:

| Component | What Varies | How It's Configured |
|-----------|------------|-------------------|
| Camera | Scroll direction, lock mode, zoom | `episode.camera_config` from manifest or Claude |
| Physics direction | Gravity (down in platformer, none in top-down) | `episode.physics` from manifest |
| Collision response | Gravity-aware vs. 4-directional vs. none | `episode.physics.collision_mode` |
| Input mapping | Jump/attack vs. 4-dir+action vs. cursor+click | `episode.input_config` |
| Rendering technique | Tile blit, Mode 7, raycasting | `episode.rendering_mode` |
| Sprite draw order | Y-sort (top-down), Z-layer (side-view) | `episode.draw_order_mode` |

### Shared Core (~80% of code)

All rendering modes share:
- Tile lookup from dictionary (manifest `visual.tile_dictionary`)
- Sprite rendering from sprite dictionary (manifest `visual.sprite_dictionary`)
- Entity system (position, behavior, health, state machine)
- Collision detection (tile-based — same math, different axis interpretation)
- Input handling (abstracted: actions, not buttons)
- Audio system
- Game state management (load, save, transition)
- CAS integration layer
- Asset Resolver interface

### Rendering Modes (~20% of code, swappable)

| Mode | Unique Logic | Estimated Size |
|------|-------------|----------------|
| `tile_2d_sideview` | Horizontal/vertical scroll, gravity physics | ~200 lines |
| `tile_2d_topdown` | Free scroll, no gravity, Y-sort draw order | ~150 lines |
| `stage_arena` | Fixed camera, entity-centric interaction | ~100 lines |
| `scrolling_shooter` | Auto-scroll, bullet system, wave spawning | ~200 lines |
| `pseudo_3d` | Mode 7-style ground plane projection | ~400 lines |
| `raycast_3d` | Column-based raycasting, textured walls | ~500 lines |
| `strategic_map` | Zoomable tile grid, selection/command interface | ~300 lines |

### Impact on Build Plan

Previously: 7 separate engine cluster builds across ~16 sessions.
Now: 1 core engine build (~3-4 sessions) + rendering mode additions (~1 session each for tile-based, ~2 sessions each for Mode 7/raycast/strategic).

**Estimated savings: ~6-8 sessions.**

The core engine loads manifests and renders them. Adding a rendering mode means adding a camera model and a draw function — not rebuilding the entity system, collision, input, or game state management.

### Paradigm Shifts at Runtime

Cross-cluster paradigm shifts (platformer → racing) become rendering mode swaps. The engine:
1. Saves current CAS state (paradigm-independent, always)
2. Loads new rendering mode
3. Loads target paradigm's manifest data (or Claude-generated episode data using manifest ingredients)
4. Entities persist with transformed capabilities (Principle 4 from Thread 8)
5. Player input mapping swaps to new paradigm's scheme

This is a hot-swap of the rendering module, not a whole-engine replacement. All CAS state, entity state, narrative state carry over because they live above the rendering layer.

---

## 6. Downstream Impact Analysis

### Generation Flow — Before vs. After

**BEFORE (current architecture):**
```
Player prompt → Claude generates everything (~10-15s, $0.10-0.50):
  paradigm, physics, level layouts, enemy behaviors, aesthetics,
  CAS setup, narrative, social hooks
→ Episode fully generated by Claude
→ Player plays
```

**AFTER (manifest architecture):**
```
Player prompt → Claude selects + composes (~2-5s, $0.02-0.10):
  Identify source manifests (Claude's own knowledge)
  → Load manifest data (instant file read, $0.00)
  → Claude generates ONLY creative delta:
    theme/narrative wrapper, CAS setup, social ecology,
    visual reskinning direction, music style
  → Episode assembled from manifest data + creative delta
→ Player plays
```

### Prompt Categories and Cost

| Prompt Type | Example | Manifest Role | Claude Role | Est. Cost | Est. Time |
|-------------|---------|---------------|-------------|-----------|-----------|
| Exact reproduction | "Mega Man 2, exactly" | 100% manifest load | Zero | ~$0.00 | <1s |
| Themed variation | "MM2 but Harry Potter" | Mechanics from manifest | Theme + visual direction | ~$0.03 | 2-3s |
| Multi-game mashup | "MM2 + MK + TMNT + HP" | Multiple manifest loads | Composition + narrative | ~$0.08 | 3-5s |
| Style-inspired original | "A new game that feels like Metroid" | Distributional reference | Full creative generation | ~$0.15 | 5-8s |
| Fully original | "Something no one's ever seen" | Statistical patterns only | Full generation | ~$0.30 | 8-12s |

### CAS Integration — Enhanced, Not Constrained

Manifests provide the CAS engine with **real parameters to modulate**, not invented ones:

- "Faction controls this zone → gravity increased 15%" = multiply manifest gravity constant by 1.15
- "Power-up grants wall-jump" = load MMX's wall-jump parameters into player physics at runtime
- "Paradigm shifts to racing" = swap to Mario Kart manifest's physics + rendering mode
- "Enemy faction is demoralized" = reduce patrol_speed and awareness_radius from manifest baselines (CAS modulates real behavioral parameters, not abstract "morale" → behavior lookups)

**Critical for your MM2 → RTS evolution scenario:** When CAS dynamics cause a paradigm shift from platformer to RTS, the engine loads an RTS manifest's rendering mode while preserving all entity state. Quick Man's behavioral parameters (fast, aggressive, predictable pattern) translate to RTS unit characteristics. Dr. Wily's boss parameters translate to RTS commander characteristics. The manifest data gives the crosswalk system real numbers to work with rather than Claude inventing RTS stats from scratch.

### Track A / Track B — Now a Spectrum

With manifests, the Track A/B toggle becomes a continuous blend:

| Blend | Visual Source | Mechanical Source | Structural Source |
|-------|-------------|-------------------|-------------------|
| 100% Track A | Exact manifest tiles | Exact manifest physics | Exact manifest layouts |
| 80/20 | Manifest tiles, recolored | Manifest physics | Manifest layout, rearranged |
| 50/50 | Generated tiles "inspired by" | Manifest physics | Claude-generated using manifest patterns |
| 20/80 | Fully generated (Track B) | Manifest-informed | Claude-generated |
| 100% Track B | Fully generated | Distributional average | Claude-generated |

### Sequencing Grammar — Grounded in Real Games

Instead of abstract grammar seeds, the Grammarian can reference actual game teachability arcs:

- "Use Mega Man X's intro stage teachability arc" = load level_1 from MMX manifest, which teaches wall-jump through level design (safe wall → wall over pit → wall with enemy → timed wall sequence)
- "Use Zelda's dungeon pacing" = load dungeon structural data from ALttP manifest (rooms per dungeon, key/lock ratios, mini-boss placement relative to dungeon length)

The grammar seeds become queryable patterns from the manifest library rather than hand-specified abstractions.

### Entity Population — Real Behavioral Templates

Instead of Claude inventing enemy behaviors, the entity system draws from extracted behavioral observations:

- `behavior_patrol_horizontal` from MM2 = a real enemy movement pattern with exact speed and range
- `behavior_turret_aimed` from Contra = a real turret with exact fire rate and projectile speed
- `behavior_chase_player` from Zelda = a real chase behavior with exact detection range and speed

Claude's role becomes selecting and contextualizing behaviors ("this Muppet-themed enemy uses Goomba patrol behavior but with Mega Man Met's shield mechanic") rather than defining the behaviors from scratch.

---

## 7. Test Plan

### Principle: Test small, test completely, then scale.

### Test 1: Single-Game Full Pipeline (Day 1, before anything else)

**Game:** Super Mario Bros (SMB)
**Why SMB:** Every byte has been documented by the community. We have ground truth for everything.

**Steps:**
1. Run the full extraction pipeline on SMB ROM
2. Compare extracted manifest against known community documentation:
   - Physics: gravity = 0x07 subpixels/frame² (known). Does our derivation match?
   - Tiles: 512 unique CHR-ROM tiles (known). Does our tile dictionary contain 512?
   - Level layouts: World 1-1 is 209 screens long (known). Does our stitched nametable match?
   - Enemies: Goomba walks at 1 pixel/frame (known). Does our behavior observation match?
3. **Pass criteria:** ≥95% match on physics values, 100% tile coverage, ≥90% level layout accuracy

**If this fails:** Stop. Debug. Do not proceed to multi-game testing.

### Test 2: Three-Game Validation Battery (Day 1-2)

**Games:** Mega Man 2 (action platformer, stage select), Legend of Zelda (top-down adventure, room graph), Contra (run-and-gun, forced scroll + gravity)

**Why these three:** Different paradigms, different spatial formats, different input models. If the extraction works for all three, it's not accidentally tuned to platformers.

**Steps:**
1. Run extraction pipeline on all three
2. For each game, verify:
   - All stages/rooms discovered by content enumerator
   - Physics feel correct when loaded into engine
   - Enemy behaviors match memory (Joe plays 30 seconds of each)
   - No corrupt or missing tiles
3. **Pass criteria:** All three games produce playable, recognizable reproductions

**If this fails on one game:** Diagnose why. Is it a game-specific issue or an architectural flaw?
**If this fails on two+ games:** Architectural problem. Redesign before scaling.

### Test 3: 12-Game Diversity Battery (Day 2-3)

**Games chosen for maximum diversity:**

| Game | Why It's in the Battery |
|------|------------------------|
| Super Mario Bros 3 | Complex mapper (MMC3), bank switching, multiple world maps |
| Castlevania | CHR-RAM, subweapons, staircase physics |
| Metroid | Open world, no stage select — tests whether mutation finds rooms |
| Kirby's Adventure | Copy abilities change player sprites/physics mid-game |
| Punch-Out!! | Unique paradigm (Stage/Arena), pattern-based boss fights |
| Gradius | Scrolling shooter, power-up bar, option trail |
| Tecmo Super Bowl | Sports, completely different from action games |
| Final Fantasy | RPG, menu-driven, turn-based combat |
| Super Mario World (SNES) | SNES validation, Mode 7 bonus stages |
| F-Zero (SNES) | Mode 7 racing, pseudo-3D rendering |
| Street Fighter II (SNES) | Fighting game, frame data matters |
| Sonic the Hedgehog (Genesis) | Genesis validation, different hardware |

**Steps:**
1. Run extraction pipeline on all 12 with ZERO per-game configuration
2. Generate manifest for each
3. Load each manifest into engine, play 30 seconds
4. Score: physics accuracy, visual completeness, behavioral correctness
5. **Pass criteria:** ≥10 of 12 produce playable, recognizable reproductions

**If <10 pass:** Analyze failure patterns. Are failures platform-specific? Paradigm-specific? Mapper-specific?

### Test 4: End-to-End Creative Pipeline (Day 3-4)

**Purpose:** Validate that manifests integrate with the full Two Fires generation pipeline, not just mechanical reproduction.

**Test prompts:**
1. "Mega Man 2, exactly as it was" → loads manifest, zero generation, plays correctly
2. "Mega Man 2 but the levels are underwater themed" → manifest mechanics + visual reskin
3. "A game that plays like Zelda but in a Mario world" → cross-manifest composition
4. "Start as Contra, but if I build alliances, shift to an RTS" → paradigm shift from manifests

**Pass criteria:** Each prompt produces a playable game within 10 seconds. Mechanical feel matches source games. Creative elements (theme, narrative) are coherent.

### Test 5: Scale Run (Day 4-5)

**Only after Tests 1-4 pass.**

Run the full extraction pipeline on the complete ~1,605 game library. Automated quality checks:
- Manifest schema validation (does the JSON conform?)
- Tile dictionary non-empty (did we extract any tiles?)
- Physics values in sane ranges (gravity > 0, speed > 0)
- At least 3 content variable values found (did the enumerator find multiple levels?)
- Coverage estimate > 0.5 (did we visit >50% of estimated content?)

**Expected outcome:** ~95% of games produce valid manifests. ~5% flagged for manual inspection (unusual mappers, non-standard boot sequences, games that don't fit the NES/SNES paradigm like educational titles).

---

## 8. Revised Build Plan

### Phase Overview (Revised)

| Phase | Sessions | Focus | Change from v4 |
|-------|----------|-------|----------------|
| 0 | 1 | Environment Setup ✅ | — |
| 0.5 | ongoing | Ground Truth Ingestion ✅ | — |
| **UE** | **2-4** | **Universal Extraction Pipeline** | **NEW: replaces Phase 0.75** |
| 1 | 5-12 | Unified Engine (1 core + 7 rendering modes) | **Reduced from 16-18 sessions** |
| 2 | 13-16 | Experience Intelligence | Agents compose from manifests |
| 3 | 17-20 | Aesthetics → **DEMO 1** | Track B informed by manifest library |
| 4 | 21-24 | Quality | Stress-tester uses manifest-loaded games |
| 5 | 25-29 | Entity Minds → **DEMO 2** | Behaviors grounded in manifest data |
| 6 | 30-35 | Social Ecology | CAS modulates real manifest parameters |
| 7 | 36-39 | Genre Transformation | Paradigm shifts = rendering mode swaps |
| 8 | 40-45 | Game Mind & Overseer → **DEMO 3** | Overseer manipulates manifest parameter space |

**Total: ~45 sessions (down from 55-60 in v4).** Savings from unified engine + manifest-loaded content reducing per-cluster engineering.

### Phase UE: Universal Extraction (Sessions 2-4)

**Session UE-1: Core Pipeline**
- Enhanced Mesen2 Lua recorder (full state capture every frame)
- RAM mutation content enumerator (Phase 1-4 of the algorithm)
- Physics sampling module (Phase 5 of the algorithm)
- Node.js orchestrator (spawn Mesen2, capture output, store recordings)
- **TEST 1: SMB full pipeline validation**
- **TEST 2: MM2 + Zelda + Contra three-game battery**

**Session UE-2: Analysis & Manifest Generation**
- Recording analyzer: tile deduplicator, OAM sprite clusterer, nametable stitcher
- RAM-OAM correlator for physics derivation
- Enemy behavior pattern extractor
- Claude interpretation pipeline (recording summary → API → structured manifest)
- Manifest schema definition and validator
- **TEST 3: 12-game diversity battery**

**Session UE-3: Scale Run + Creative Integration**
- Batch orchestrator for full library
- Automated manifest quality checks
- Manifest → game state loader (bridge between extraction and engine)
- **TEST 4: End-to-end creative pipeline**
- **TEST 5: Full library scale run (overnight)**
- SNES ROM acquisition + SNES extraction validation
- Genesis/Arcade extraction (if platform-specific Lua diffs needed)

**Session UE-4 (if needed): Remediation**
- Fix failures from Test 5
- Handle edge-case games
- PC game extraction via existing tools (WAD, MPQ, etc.)
- Finalize manifest library on Cloudflare R2

### Phase 1: Unified Engine (Sessions 5-12)

Build ONE engine with configurable rendering modes, loading content from manifests.

**Session 5-6: Core Engine**
- Game loop, canvas rendering, input abstraction
- Manifest loader (reads manifest JSON → populates engine state)
- Tile renderer (reads tile dictionary, draws to canvas)
- Sprite renderer (reads sprite dictionary, draws entities)
- Entity system (position, behavior, health, state)
- Collision system (tile-based, configurable axis interpretation)
- Physics system (reads manifest physics values, configurable gravity direction)
- Rendering mode: `tile_2d_sideview` (first mode, platformer)
- **TEST: Load SMB manifest → playable World 1-1**

**Session 7-8: Additional 2D Modes**
- Rendering mode: `tile_2d_topdown` (Zelda, action-RPG)
- Rendering mode: `stage_arena` (fighting, RPG combat)
- Rendering mode: `scrolling_shooter` (Gradius, R-Type)
- Input mode variants for each
- **TEST: Load Zelda manifest → playable dungeon. Load Gradius manifest → playable stage.**

**Session 9-10: 3D Modes**
- Rendering mode: `pseudo_3d` (Mode 7 racing)
- Rendering mode: `raycast_3d` (Doom-style FPS)
- Rendering mode: `strategic_map` (RTS/tactics)
- **TEST: Load F-Zero manifest → playable race. Load Doom WAD → playable level.**

**Session 11: Rendering Mode Hot-Swap**
- Runtime rendering mode switching (for paradigm shifts)
- CAS parameter modulation interface (CAS writes to physics/behavior values)
- Entity crosswalk system (entity persists, capabilities transform)
- **TEST: Start as MM2 platformer → force paradigm shift → loads as Zelda top-down**

**Session 12: Diagnostics**
- Simulated Player Agent (adapted for manifest-loaded games)
- Moment Extractor v1
- Testing UI v1
- Gate 1 auto-checks
- **TEST: Generate 10 manifest-loaded games, run diagnostic pipeline, Joe reviews clips**

### Phases 2-8: Unchanged Internal Structure

The remaining phases keep their goals but benefit from the manifest foundation:

- **Phase 2 (Experience Intelligence):** Agents select and compose from manifests rather than generating from scratch. Dramatically faster iteration.
- **Phase 3 (Aesthetics):** Track B visual generation is informed by distributional analysis of 1,605 game tile sets. Music synthesis informed by extracted audio patterns.
- **Phase 4 (Quality):** Stress-tester can load any manifest as a baseline, enabling "does our generation match the original?" comparisons.
- **Phase 5 (Entity Minds):** Entity behaviors initialized from manifest behavioral data. Claude interprets social overlay onto real behavioral patterns.
- **Phase 6 (Social Ecology):** CAS modulates real physics/behavior parameters from manifests. "Demoralized faction" = measurable reduction in real game parameters.
- **Phase 7 (Genre Transformation):** Paradigm shifts are rendering mode swaps. Entity crosswalks use manifest data for both source and target paradigms.
- **Phase 8 (Overseer):** Overseer can shift between entire manifest-based game feels. "Player is too comfortable with platformers → shift to manifest-derived RTS parameters."

---

## 9. Decisions

### Decision 83: Universal Extraction via RAM Mutation Content Enumeration

**Context:** The chaos player approach (Session 7, Decision 77) required automated gameplay to explore game content. This is inherently game-specific (different timings, different boot sequences) and incomplete (unreached content is missing). Session 10 CHR-RAM validation proved Mesen2 can capture runtime VRAM state, but the frame-timing approach needed per-game debugging.

**Decision:** Replace the chaos player with a RAM mutation content enumerator. Instead of playing the game, systematically write every value to every candidate RAM address and observe VRAM changes. Content-switching variables (level ID, room ID, game phase) are identified by which addresses cause VRAM to change. All values of content variables are enumerated to capture all game content.

**Rationale:** 100% generalizable (hardware behavior, not game convention), fast (~3 minutes per game), captures content the chaos player would miss (secret levels, late-game content). Zero per-game human effort. The same algorithm works identically on every NES, SNES, and Genesis game because the PPU/VRAM architecture mandates the relationship between RAM state and displayed content.

### Decision 84: Unified Engine with Configurable Rendering Modes

**Context:** Build plan v4 (Decision 71) called for 7 separate engine clusters built across 16-18 sessions. The manifest-based extraction approach changes the engine's job from "generate and render paradigm content" to "load manifest data and render it." Most rendering differences between paradigms reduce to camera, physics direction, and draw order — parameters, not separate engines.

**Decision:** Build one engine with a shared core (~80% of code) and 7 swappable rendering modes (~20%). Rendering modes are hot-swappable at runtime for paradigm shifts. All modes share: tile/sprite rendering, entity system, collision, input abstraction, CAS integration, game state management.

**Rationale:** Reduces Phase 1 from ~16-18 sessions to ~8 sessions. More importantly, it makes paradigm shifts a rendering mode swap rather than a whole-engine restart, which directly enables the Thread 8 paradigm shift principles (especially Principle 5: transitions are narrative moments, not loading screens).

### Decision 85: Manifest as Ingredient Library, Not Game State Replacement

**Context:** The manifest contains complete game data (visuals, structure, mechanics). It would be tempting to make the manifest the game state format, replacing the existing schema.

**Decision:** The manifest is an ingredient library that populates the game state, not a replacement for it. The game state schema (Threads 1, 3) remains unchanged. Manifest data populates `episode` (content), `meta` (identity), and entity behavioral parameters in `world`. The `cas`, `player`, `overseer`, and `diagnostics` blocks remain Claude-generated/runtime-managed.

**Rationale:** The game state schema was designed to accommodate both extracted data and generated content. The CAS social ecology, player behavioral model, and Overseer system are runtime constructs that don't come from ROM extraction. Keeping the manifest as an ingredient library preserves full creative flexibility — Claude can use 100% of a manifest, 0% of a manifest, or any blend.

### Decision 86: Extraction Scope Expanded to ~1,605 Games

**Context:** Decision 79 scoped extraction at ~820 games. The RAM mutation approach reduces per-game extraction cost to ~3 minutes compute + ~$0.03 API, making marginal cost of additional games negligible.

**Decision:** Extract all US-licensed NES (~680) and SNES (~725) titles, plus 100 Genesis, 50 arcade, and 50 PC games. Total ~1,605.

**Rationale:** Completeness is a product feature. "Play any retro game" requires having any retro game. The marginal cost (~$30 API, ~5 hours compute) is negligible against the value of never saying "sorry, we don't have that one." The larger library also provides richer distributional knowledge for Track B generation.

---

## 10. Open Questions

1. **SNES ROM set acquisition** — need No-Intro SNES set. Similar archive.org approach as NES.
2. **Genesis emulation in Mesen2** — Mesen2 may not support Genesis. May need Genesis Plus GX or BlastEm for Genesis extraction. Same algorithm, different emulator API.
3. **PC game extraction** — separate pipeline using established tools (WadExt, MPQ extractors, etc.). Same manifest output format. Lower priority (30-50 games).
4. **Game Genie code database** — needed for infinite-lives codes during extraction. Community databases exist (GameGenie.com archives, ROM hacking wikis). NES codes are 6 or 8 character hex. Auto-application via Mesen2 cheat interface.
5. **Manifest storage** — Cloudflare R2 for production. Local filesystem during development. Need asset resolver update to query manifests.
6. **Pairwise RAM mutation for hidden content** — how much time does testing pairs of content variables add? Is it worth the coverage gain? Test empirically on Test 3 battery.
