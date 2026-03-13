# Two Fires — Manifest Architecture Specification

**Date:** 2026-03-12
**Status:** Design complete, empirical testing next
**Context:** Sessions 10-18 extraction pipeline development + rendering validation attempts

---

## 1. Design Principles

The manifest is a complete, self-contained game description. It serves TWO purposes that must never be conflated:

1. **Exact reproduction:** The manifest contains enough raw hardware-level data to render any extracted game pixel-perfectly, with zero interpretation.
2. **Creative recombination:** The manifest contains enough semantic understanding for the AI to remix, blend, and generate new content from extracted game data.

These are separate data layers. The renderer reads layer 1. The AI reads layer 2. They reference each other by index but are independently usable.

**Key rule:** The renderer NEVER interprets semantic labels. It draws tile indices with palettes at positions. Period. If the renderer needs to know "this is a pipe," the architecture is wrong. The renderer only needs to know "draw tile 0x60 at position (224, 160) with palette 0."

**Key rule:** The AI NEVER generates raw tile indices. It generates semantic objects ("pipe at column 28, height 2") which get compiled into rendering data by the metatile compiler.

---

## 2. Manifest Schema

### 2.1 Top-Level Structure

```json
{
  "meta": { },
  "rendering": { },
  "semantic": { },
  "mechanical": { },
  "audio": { },
  "game_structure": { }
}
```

### 2.2 Meta

```json
"meta": {
  "game_id": "super-mario-bros-usa",
  "platform": "nes",
  "rom_hash": "sha256:abc123...",
  "mapper": 0,
  "prg_size": 32768,
  "chr_size": 8192,
  "extraction_date": "2026-03-12",
  "manifest_version": "2.0"
}
```

### 2.3 Rendering Layer (Platform-Specific Hardware Data)

This layer contains EXACTLY what the hardware PPU/VDP consumes. A dumb renderer draws from this alone.

**For NES:**
```json
"rendering": {
  "platform": "nes",
  "chr_tiles": "<base64-encoded 8192 bytes of 2bpp tile graphics>",
  "bg_palettes": [
    [34, 41, 26, 15],
    [34, 54, 23, 15],
    [34, 48, 33, 15],
    [34, 39, 23, 15]
  ],
  "sprite_palettes": [
    [34, 22, 16, 15],
    [34, 38, 16, 15],
    [34, 32, 39, 15],
    [34, 48, 38, 15]
  ],
  "screens": {
    "world_1_1": [
      {
        "screen_index": 0,
        "nametable": [960],
        "attributes": [64],
        "scroll_x": 0
      }
    ]
  }
}
```

**For SNES:**
```json
"rendering": {
  "platform": "snes",
  "tile_data": {
    "bg_tiles": "<base64 4bpp tile data>",
    "sprite_tiles": "<base64 4bpp sprite data>"
  },
  "palettes": "<base64 512 bytes, 256 colors × 2 bytes each>",
  "background_layers": {
    "world_1": [
      {
        "bg1_tilemap": [1024],
        "bg2_tilemap": [1024],
        "bg3_tilemap": [1024],
        "mode": "mode1"
      }
    ]
  }
}
```

The renderer checks `rendering.platform` and uses the appropriate drawing code. NES renderer handles nametables + 2bpp. SNES renderer handles multi-layer tilemaps + 4bpp. Both share the core logic: read tile index, decode pixel data, apply palette, draw to canvas.

### 2.4 Semantic Layer (AI-Readable Game Understanding)

This layer maps the raw rendering data to MEANINGS. The AI reads this. The renderer never touches it.

#### Tile Catalog
```json
"semantic": {
  "tile_catalog": [
    {
      "tile_index": 96,
      "semantic": "pipe_top_left",
      "category": "terrain",
      "solid": true,
      "visual_tags": ["green", "cylindrical", "structural"]
    },
    {
      "tile_index": 180,
      "semantic": "ground_surface",
      "category": "terrain",
      "solid": true,
      "visual_tags": ["brown", "rocky", "surface"]
    }
  ],
  "solid_tiles": [96, 97, 98, 99, 180, 181, 69, 71]
}
```

#### Metatile Dictionary (Semantic-to-Rendering Compiler Rules)

This is the bridge between "the AI wants a pipe here" and "draw these tile indices at these positions." Extracted from ROM metatile tables for known game styles.

```json
"semantic": {
  "metatile_dictionary": {
    "style": "smb_above_ground",
    "entries": {
      "ground": {
        "tiles": [180, 182, 181, 183],
        "arrangement": "2x2",
        "palette": 3
      },
      "brick": {
        "tiles": [69, 71, 69, 71],
        "arrangement": "2x2",
        "palette": 1
      },
      "question_block_active": {
        "tiles": [83, 85, 84, 86],
        "arrangement": "2x2",
        "palette": 1,
        "animation": {
          "frames": [[83,85,84,86], [87,87,87,87]],
          "frame_duration": 12
        }
      },
      "pipe_top": {
        "tiles": [[96, 100], [97, 101]],
        "arrangement": "2x2",
        "palette": 0
      },
      "pipe_body": {
        "tiles": [[98, 98], [99, 99]],
        "arrangement": "2x2",
        "palette": 0
      }
    }
  }
}
```

When the AI generates "pipe at column 28, height 3," the metatile compiler reads this dictionary and produces: pipe_top at (28, row), pipe_body at (28, row+1), pipe_body at (28, row+2) → expands to the correct tile indices in the correct nametable positions.

For extracted games: the dictionary comes directly from ROM metatile tables (proven extractable — Claude found SMB's at CPU $8B10).

For hybrid/original games: Claude generates the dictionary at skeleton time, mapping semantic concepts to tiles from the target style's tile library.

#### Entity Library
```json
"semantic": {
  "entity_library": {
    "goomba": {
      "sprite_data": {
        "frames": {
          "walk_1": {
            "tiles": [112, 113, 114, 115],
            "arrangement": [[0,0],[8,0],[0,8],[8,8]],
            "palette": 1
          },
          "walk_2": {
            "tiles": [116, 117, 118, 119],
            "arrangement": [[0,0],[8,0],[0,8],[8,8]],
            "palette": 1
          },
          "squished": {
            "tiles": [120, 121],
            "arrangement": [[0,0],[8,0]],
            "palette": 1
          }
        },
        "pixel_data": "<base64 embedded sprite graphics for portability>"
      },
      "dimensions": {"w": 16, "h": 16},
      "semantic_tags": ["enemy", "ground_enemy", "basic", "mushroom_kingdom"],
      "behavior": {
        "states": {
          "patrol": {
            "movement": "walk_horizontal",
            "speed": 0.75,
            "direction": "left",
            "animation": ["walk_1", "walk_2"],
            "animation_speed": 8,
            "transitions": [
              {"condition": "stomped_from_above", "target": "dead_squish"},
              {"condition": "hit_by_fireball", "target": "dead_flip"},
              {"condition": "hit_by_shell", "target": "dead_flip"},
              {"condition": "hit_by_star", "target": "dead_flip"}
            ]
          },
          "dead_squish": {
            "sprite": "squished",
            "duration_frames": 30,
            "transitions": [
              {"condition": "timer_expired", "target": "remove"}
            ]
          },
          "dead_flip": {
            "movement": "arc_up_then_fall",
            "flip_vertical": true,
            "transitions": [
              {"condition": "off_screen", "target": "remove"}
            ]
          }
        },
        "initial_state": "patrol",
        "affected_by_gravity": true,
        "falls_off_edges": true
      },
      "interactions": {
        "stomp_result": "dead_squish",
        "contact_damage": 1,
        "fireball_kills": true,
        "shell_kills": true,
        "star_kills": true
      }
    }
  }
}
```

Note: entity behaviors are FULL STATE MACHINES with exact values (speeds, frame counts, transition conditions), NOT semantic labels like "patrol_horizontal." The engine runs the state machine mechanically. No interpretation needed.

Entity sprite data includes BOTH tile index references (for rendering within the source game's CHR) AND embedded pixel data (for portability when transplanting entities between games).

### 2.5 Mechanical Layer (Physics + Game Constants)

Platform-neutral. Just numbers. Modifiable at runtime by CAS.

```json
"mechanical": {
  "player_physics": {
    "gravity_table": [3, 3, 4, 5, 6, 7, 8, 9, 10],
    "jump_force_table": [7, 7, 6, 5, 4, 3, 2, 1, 0],
    "walk_acceleration": [4, 4, 4, 5, 5, 5, 6, 6, 6],
    "max_walk_speed": 25,
    "max_run_speed": 31,
    "jump_velocity_walk": -4,
    "jump_velocity_run": -5,
    "friction": 8,
    "skid_deceleration": 8,
    "swimming": {
      "stroke_velocity": -3,
      "buoyancy": 1,
      "x_speed_cap": 24
    },
    "subpixel_unit": 16,
    "fixed_point_format": "8.4"
  },
  "player_states": {
    "small": {"hitbox": {"w": 12, "h": 12}, "any_hit": "die"},
    "big": {"hitbox": {"w": 12, "h": 24}, "any_hit": "shrink_to_small"},
    "fire": {"hitbox": {"w": 12, "h": 24}, "any_hit": "shrink_to_small", "can_shoot": true},
    "star": {"hitbox": {"w": 12, "h": 24}, "invincible": true, "duration_frames": 176}
  },
  "damage_table": {
    "format": "weapons × enemies matrix or descriptive",
    "data": {}
  },
  "enemy_hp": {},
  "scoring": {
    "stomp_combo": [100, 200, 400, 500, 800, 1000, 2000, 4000, 5000, 8000, "1up"],
    "coin": 200,
    "flagpole_height": [100, 200, 400, 800, 2000, 5000]
  },
  "invincibility_frames_after_hit": 128,
  "starting_lives": 3
}
```

### 2.6 Audio Layer

Dual representation: raw playback data for exact replay + structured musical data for remixing.

```json
"audio": {
  "tracks": {
    "overworld": {
      "apu_data": "<base64 APU register sequence for exact replay>",
      "structured": {
        "tempo_bpm": 150,
        "time_signature": "4/4",
        "sections": [
          {"label": "A", "measures": 8, "repeat": true},
          {"label": "B", "measures": 8, "repeat": true}
        ],
        "channels": {
          "pulse1": {"role": "melody", "notes": []},
          "pulse2": {"role": "harmony", "notes": []},
          "triangle": {"role": "bass", "notes": []},
          "noise": {"role": "percussion", "patterns": []}
        }
      }
    }
  },
  "sfx": {
    "jump": {"apu_data": "<base64>"},
    "stomp": {"apu_data": "<base64>"},
    "coin": {"apu_data": "<base64>"},
    "powerup": {"apu_data": "<base64>"},
    "death": {"apu_data": "<base64>"}
  },
  "track_assignments": {
    "world_1_1": "overworld",
    "world_1_2": "underground",
    "world_1_4": "castle",
    "boss": "boss_theme",
    "star": "star_theme",
    "hurry_tempo_multiplier": 1.5
  }
}
```

### 2.7 Game Structure

```json
"game_structure": {
  "progression_type": "linear_worlds",
  "worlds": 8,
  "levels_per_world": 4,
  "level_sequence": [
    {"id": "world_1_1", "area_index": 8, "enemy_area": 11, "type": "above_ground"},
    {"id": "world_1_2", "area_index": 12, "enemy_area": 15, "type": "underground"}
  ],
  "warp_zones": {
    "world_1_2": [2, 3, 4],
    "world_4_2_pipe": [5],
    "world_4_2_vine": [6, 7, 8]
  },
  "connections": {
    "pipe_entries": [
      {"from": "world_1_1_screen_3", "to": "underground_bonus_1", "type": "pipe_down"},
      {"from": "underground_bonus_1_end", "to": "world_1_1_screen_7", "type": "pipe_right"}
    ]
  },
  "game_over": "return_to_title",
  "loop_after_completion": true,
  "hard_mode_after_loops": 8
}
```

---

## 3. Extraction Pipeline

Two-source extraction: Claude reads ROM for tables/constants, jsnes captures PPU output for rendering data.

### 3.1 Source 1: Claude ROM Analysis (seconds per game via program, ~$0.15 per game for complex items)

A deterministic program codifying the patterns Claude demonstrated:

1. **Parse iNES/SNES header** → platform, mapper, PRG/CHR sizes
2. **Extract CHR tiles** → raw 2bpp/4bpp tile data (for NES CHR-ROM games, this is a direct copy)
3. **Find pointer tables** → locate level data, enemy data, music data pointer tables by byte signature
4. **Extract physics constants** → find immediate-mode loads into known velocity/position RAM patterns
5. **Extract damage/HP tables** → find indexed table reads near collision-handling code
6. **Extract music data** → find APU-writing subroutines, parse sound engine format

For items requiring deeper analysis (entity state machines, boss AI, complex level encoding), a focused Claude API call per game sends the relevant ROM section + surrounding code.

### 3.2 Source 2: jsnes PPU Capture (seconds per screen, ~10 min per game)

For level rendering data (nametables, attributes, palettes, sprite positions):

1. **Load ROM in jsnes**
2. **Use content variable mutation** to load each level (proven: Phases 1-4)
3. **For each level, mutate scroll position** through every screen:
   - Write scroll position to the game's scroll register in RAM
   - Step frames to let the game engine update the nametable
   - Read `nes.ppu.vramMem` for nametable + attributes
   - Read palettes from PPU palette RAM
   - Read OAM for entity positions
   - Increment scroll, repeat
4. **For room-based games** (Zelda, Metroid): each room ID from the content enumerator IS a complete screen — capture nametable directly, no scrolling needed
5. **For vertical scrolling**: find and mutate vertical scroll register alongside horizontal

No input injection, no "playing" the game. Pure RAM mutation + PPU read.

### 3.3 Source 3: jsnes for Audio Capture

1. Load each level via content variable mutation
2. Run for 60 seconds (3600 frames)
3. Capture every APU register write ($4000-$4017) with frame timing
4. Each level produces a complete APU register sequence = the music track for that level

### 3.4 ROM-as-Compiler (for level generation)

When the AI generates new level content, it produces semantic objects ("pipe at column 28, height 2"). These need compilation to nametable tile indices.

The extracted game's own ROM serves as the compiler:
1. Load the game's ROM in jsnes
2. Write the AI's semantic objects into RAM in the format the game's area object processor expects
3. Let the game engine run (it reads the objects and writes tile indices to the nametable)
4. Read the resulting nametable

This guarantees compilation correctness — the same code that built the original levels builds new ones.

---

## 4. CAS Integration

The CAS engine operates on the semantic and mechanical layers. It never modifies the rendering layer directly.

### 4.1 Runtime Behavioral Modifiers

When the CAS interprets entity state and Claude produces behavioral directives:

```json
"runtime_modifiers": {
  "goomba_07": {
    "speed_multiplier": 0.67,
    "periodic_pause": {"interval_frames": 120, "duration_frames": 30},
    "visual_override": {"palette_shift": "desaturated"}
  }
}
```

The engine reads: base behavior from entity state machine × runtime modifier. Base state machine stays intact. CAS effects are multiplicative/additive overlays.

### 4.2 Physics Modulation

CAS-driven environmental changes modify mechanical constants:

```json
"runtime_physics_overrides": {
  "gravity_multiplier": 1.15,
  "max_speed_multiplier": 0.8
}
```

Engine reads base physics from mechanical layer, applies multipliers from CAS.

### 4.3 Paradigm Shifts

When the CAS triggers a paradigm shift:
1. Save all entity semantic state (identity, CAS state, bonds, knowledge)
2. Load new rendering data (different game's screens, tiles, palettes)
3. Load new mechanical constants (different game's physics)
4. Map entities to new visual representations (use semantic tags to find appropriate sprites in the new style)
5. Resume with new rendering + mechanics, preserved social state

The manifest's separation of rendering/semantic/mechanical makes this a clean swap of layers 1 and 3 while preserving layer 2.

---

## 5. Use Case Verification

Every use case and the manifest layers it reads:

| Use Case | Rendering | Semantic | Mechanical | Audio | Compiler |
|----------|-----------|----------|------------|-------|----------|
| Exact replica | ✓ load screens | — | ✓ load physics | ✓ play APU data | — |
| Themed reskin | ✓ swap palettes | ✓ identify what to restyle | ✓ unchanged | ✓ unchanged | — |
| Mechanical mashup | ✓ from game A | ✓ map entities | ✓ from game B | ✓ either | — |
| Entity transplant | ✓ entity carries pixels | ✓ identify compatible slots | ✓ entity carries behavior | — | — |
| Style transfer | ✓ generate new tiles | ✓ understand source entity | ✓ from source | — | — |
| CAS modification | ✓ palette shifts | ✓ interpret entity state | ✓ apply multipliers | — | — |
| Paradigm shift | ✓ swap to new game style | ✓ map entities across | ✓ swap physics | ✓ swap tracks | — |
| Fully original | ✓ Track B generates | ✓ Claude creates | ✓ Claude creates | ✓ synthesizer | ✓ generic compiler |
| Mid-game generation | ✓ compile new screens | ✓ define new content | ✓ use current physics | — | ✓ ROM-as-compiler |
| Aesthetic shift | ✓ modify palettes/tiles | ✓ CAS drives mood | ✓ unchanged | ✓ tempo/key shift | — |

---

## 6. Architecture Decisions from Pressure Testing

### Decision: Entity behaviors are state machines, not labels

Entity behaviors in the manifest are complete state machines with exact numerical values (speeds, durations, transition conditions), not semantic labels like "patrol_horizontal." The engine runs state machines mechanically. Claude's CAS interpretation adds behavioral modifiers on top. (Attack 11)

### Decision: Entities carry embedded pixel data for portability

Each entity's sprite data includes both tile index references (for rendering within the source game) AND embedded base64 pixel data (for transplanting between games without tile index conflicts). (Attack 3)

### Decision: Platform-specific rendering, platform-neutral everything else

The rendering section has a platform field and platform-specific data formats (NES nametables, SNES tilemaps, Genesis scroll planes). The semantic, mechanical, and audio sections are platform-neutral. Two renderers share 80% of code. (Attack 10)

### Decision: ROM-as-compiler for level generation

When generating new level content, the source game's ROM is loaded in jsnes and used as a level compiler. The game's own area object processor converts semantic objects to nametable tile indices, guaranteeing visual correctness for that game's style. (Attack 14)

### Decision: Metatile dictionary as the semantic-to-rendering bridge

Each game style has a metatile dictionary mapping semantic concepts (ground, pipe, brick) to specific tile arrangements and palette assignments. Extracted from ROM metatile tables for known styles. Generated by Claude for hybrid/original styles. This dictionary is what makes the compiler work. (Attacks 2, 8)

### Decision: CAS modulates via overlays, not mutations

The CAS never modifies extracted base data. It adds a runtime_modifiers layer that applies multipliers and overrides to base behaviors and physics. The original extracted values are always recoverable. (Attack 13)

### Decision: No hardware constraints in creative mode

The engine has two rendering modes. Exact-replica mode respects NES/SNES hardware constraints (256 sprite tiles, 64 sprites per frame, etc.). Creative mode has no tile limits, enabling richer visual scenes than the original hardware could produce while maintaining the pixel art aesthetic. (Attack 12)

### Decision: Dual audio representation

Audio has both raw APU/SPC register sequences (for exact replay) and structured musical data (notes, rhythm, sections, instruments) for the chiptune synthesizer to use as templates when generating remixed music. (Attacks 5, 9)

---

## 7. Open Questions for Empirical Testing

1. **Scroll-mutation nametable capture:** Can mutating the scroll position register in jsnes produce clean, complete nametable data for every screen of a scrolling level?
2. **Nametable rendering:** Can a simple canvas renderer produce pixel-perfect output from captured nametable + CHR + palette data?
3. **Entity state machine extraction:** Can Claude reliably extract full state machines (not just labels) for enemy types across different developers' games?
4. **ROM-as-compiler:** Can we write semantic level objects to RAM and have the game's engine compile them to a correct nametable?
5. **Cross-game entity portability:** When transplanting an entity's embedded pixel data into a different game's rendering context, does it render correctly?
6. **Metatile dictionary generation:** Can Claude produce correct metatile dictionaries for hybrid styles at skeleton generation time?

---

## 8. Relationship to Existing Architecture

This manifest spec integrates with, but does not replace, the existing Two Fires architecture:

- **Game State Schema** (`docs/design/game-state-schema.md`): The manifest populates the `episode` and `meta` blocks. The `world`, `cas`, `player`, and `overseer` blocks remain Claude-generated/runtime-managed.
- **CAS Engine** (`docs/design/cas-engine-spec.md`): CAS operates on entity semantic state, produces behavioral modifiers that the engine applies to manifest base values.
- **Paradigm Specs** (`docs/design/paradigm-specs.md`): Each paradigm corresponds to a rendering mode + physics configuration. Paradigm shifts swap the active rendering/mechanical data from different manifests.
- **Sequencing Grammar** (`docs/design/sequencing-grammar-framework.md`): Grammar seeds can reference real game structures from the manifest library (e.g., "use MM2's Metal Man stage teachability arc").
- **Generation Flow** (`claude.md`): The skeleton generation step now includes: select source manifests, generate metatile dictionary if hybrid, compile initial level data via ROM-as-compiler.

---

## 9. Storage Estimates

Per game: ~100-400KB (CHR tiles ~8KB NES / ~64KB SNES, nametables ~1KB × 50-200 screens, entity library ~10-50KB, physics/structure ~5-20KB, audio ~20-100KB).

Total for ~580 games: 60-230MB. Fits trivially in Cloudflare R2.

## 10. Cost Estimates

| Step | Per Game | Total (580 games) |
|------|----------|-------------------|
| Deterministic program (tiles, pointers, constants) | ~0 (local compute) | ~0 |
| jsnes PPU capture (nametables, audio) | ~0 (local compute, 10 min) | ~100 hours parallel |
| Claude API (entity state machines, complex analysis) | ~$0.15 | ~$87 |
| **Total** | | **~$87 + ~12 hours compute** |
