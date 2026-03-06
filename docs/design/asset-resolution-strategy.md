# Two Fires — Asset Resolution Strategy
## Two-Track Architecture with Runtime Toggle

**Last updated:** 2026-03-05 (Updated for Thread 5 VME spec, Thread 9 agent consolidation)

---

## The Problem

Two Fires needs authentic retro game assets for quality and feel. Real assets from commercial games are the ground truth for what "great" looks like. But shipping those assets in a public release is copyright infringement.

**Solution:** Build a two-track asset resolution system from day one. Same pipeline, same agent stack, same JSON game configs — the only thing that changes is how asset specifications resolve to actual pixels and audio at the final step.

---

## Architecture Overview

```
Agent Pipeline (identical in both modes)
  Experience Interpreter → Artistic Director
  → Game Visual Identity generator (Track B only)
  → Design Philosopher → Game Compiler
  → Designer → Builder → Validator
          │
          ▼
  Game Config JSON (identical in both modes)
  ┌─────────────────────────────────────┐
  │ Assets specified SEMANTICALLY:       │
  │ { "type": "enemy",                  │
  │   "size": "small",                  │
  │   "movement": "patrol_horizontal",  │
  │   "palette_profile": "warm_dark",   │
  │   "silhouette": "round_short",      │
  │   "animation_frames": 2,            │
  │   "style_era": "nes_late",          │
  │   "style_reference": "goomba" }     │
  └──────────────┬──────────────────────┘
                 │
          ┌──────┴──────┐
          ▼             ▼
    Track A           Track B
    (Reference)       (Generated)
    ┌──────────┐    ┌──────────────┐
    │ Lookup in │    │ Generate from │
    │ ingested  │    │ semantic spec │
    │ asset     │    │ constrained   │
    │ library   │    │ by Game       │
    │           │    │ Visual        │
    └──────────┘    │ Identity      │
                    └──────────────┘
```

**The toggle:** A single environment variable or config flag (`ASSET_MODE: "reference" | "generated"`) controls which track resolves asset specs. Everything upstream is identical.

---

## Track A: Reference Mode (Development + Internal Demo)

### What It Does
Resolves semantic asset specs against the ingested asset library. When the Artistic Director specifies an enemy with `style_reference: "goomba"`, Track A serves the actual goomba sprite from the library.

### How It Works
1. **Asset Ingestion Pipeline** (Phase 0.5 ✅) extracts and catalogs assets from real games
2. Each asset is tagged with semantic metadata matching the spec format:
   - Visual properties: size, palette profile, silhouette class, animation frame count, style era
   - Behavioral properties: movement pattern, interaction type
   - Source metadata: game of origin, paradigm, context of use
3. **Asset Resolver (Track A)** performs nearest-neighbor lookup against semantic tags
4. Falls back to closest match if exact spec isn't in library

### What Gets Ingested
- Sprite sheets (characters, enemies, items, environmental tiles)
- Color palettes (per-game and per-era)
- Sound effects (categorized by function: jump, hit, collect, death, etc.)
- Music patterns (not full tracks — phrase structures, chord progressions, rhythm patterns)
- UI elements (health bars, text boxes, menu frames)
- Level tile sets (ground, walls, platforms, decorative)

### Storage
```
/data/assets/
  /sprites/
    /enemies/     (tagged JSON index + image files)
    /players/
    /items/
    /environment/
    /ui/
  /audio/
    /sfx/
    /music-patterns/
  /palettes/
  /tilesets/
  asset-index.json   (semantic tags for all assets, used by resolver)
```

### Legal Status
Track A assets are for development and internal demo ONLY. They never reach end users in a public release. This is analogous to using reference images during design — standard practice, no legal exposure.

---

## Track B: Generated Mode (Public Release)

### What It Does
Resolves the same semantic asset specs by generating original assets that match the specifications without reproducing any copyrighted material.

### Game Visual Identity System (Thread 5)

Track B's key innovation: don't generate individual assets in isolation. **Generate a visual system first, then generate assets within that system.**

Before any sprite is generated, Track B produces a **Game Visual Identity** — a complete specification of the visual rules for this specific game instance. Every asset generated for the game is generated under this identity, guaranteeing cohesion the same way a real art team's shared style guide guarantees cohesion.

**Game Visual Identity components:**
- **Palette architecture** — ~20-25 total colors organized into primary, secondary (per faction/zone), and accent palettes
- **Proportion grid** — exact pixel dimensions for every entity role (player, small enemy, large enemy, boss, collectible, tile, etc.)
- **Detail density rules** — how much visual information per pixel area (outlines vs. no outlines, eye size, interior detail colors)
- **Animation budget** — exact frame counts per action type, derived from target era
- **Visual shorthand dictionary** — how this game communicates concepts visually (danger, collectible, friendly, impassable)
- **Silhouette distinctiveness rules** — every entity must be identifiable by silhouette alone at target resolution

Full specification: `docs/design/vme-spec.md` Section 4.

### How Track B Generation Works

**Visual assets (sprites, tiles):**
- All generation constrained by Game Visual Identity
- VME Layer 3 (novel asset generation) produces complete sprite sheets at game creation time
- Each generated asset passes quality gates: palette compliance, proportion compliance, detail density compliance, silhouette distinctiveness, animation consistency
- Generated assets enter the game-instance library and are treated identically to Track A assets from that point

**Audio assets:**
- Chiptune synthesis from parameters (waveform, envelope, tempo, key)
- Sound effects generated from functional specs ("short rising tone, square wave, 100ms")
- Music generated from structural patterns (not reproductions of specific melodies)

**Level tiles and environments:**
- Generated from palette + style constraints within Game Visual Identity
- Tile sets maintain internal consistency (edges match, visual language is coherent)

### Where the Ingestion Library Powers This (Without Copying Expression)

The ingestion library provides **learned distributions and relational constraints**, never specific pixel data:

**Distributional knowledge (per era/paradigm/role):**
- Average sprite sizes per role per era
- Typical palette counts and color temperature distributions
- Animation frame counts per action type
- Detail density levels per era and sprite size

**Relational constraints (within a single game):**
- Color distance between player palette and primary enemy palette
- Size ratio between smallest and largest entities
- Palette overlap between enemies and their home environment tiles (~60-70% typical)
- Boss size relative to largest regular enemy (typically 2x+)
- Contrast ratio between interactive and decorative elements

**The legal principle:** Copyright protects specific pixel arrangements (expression). It does not protect distributional knowledge, relational constraints, or aesthetic tendencies (facts/ideas). Every asset Track B produces is novel. Cohesion comes from the Game Visual Identity system, not from copying.

---

## The Semantic Asset Specification Format

This is the contract between the agent pipeline and the resolution layer. It must be rich enough for Track A to find good matches AND for Track B to generate good output.

```json
{
  "asset_id": "enemy_world1_goomba_variant",
  "category": "sprite",
  "subcategory": "enemy",

  "visual": {
    "dimensions": [16, 16],
    "color_count": 3,
    "palette_profile": "warm_dark",
    "palette_override": null,
    "silhouette_class": "round_short",
    "style_era": "nes_late",
    "animation": {
      "frames": 2,
      "type": "walk_cycle",
      "speed": "slow"
    }
  },

  "behavioral": {
    "movement": "patrol_horizontal",
    "interaction": "damage_on_contact",
    "defeat_method": "stomp"
  },

  "narrative": {
    "role": "foot_soldier",
    "faction": "goomba_union",
    "disposition": "reluctant"
  },

  "reference": {
    "style_reference": "goomba",
    "primary_game": "super_mario_bros",
    "notes": "Should read as low-ranking, somewhat pathetic"
  }
}
```

**Track A** uses `reference` + `visual` fields for library lookup.
**Track B** uses `visual` + `behavioral` + `narrative` fields for generation, constrained by Game Visual Identity (ignores `reference`).

The `reference` block exists solely for Track A and for agent communication (the Artistic Director can say "goomba-like" to communicate style intent). It's never passed to the generation system in Track B.

---

## Implementation in the Build Plan

### Phase 0.5: Asset Ingestion ✅
- ~1,603 games catalogued across NES, SNES, Genesis, PC
- ~7,800 structured JSON files across 6 dimensions
- Semantic tags for ingested assets
- Palette libraries, silhouette class definitions, style era constraints extracted

### Phase 1: Paradigm Engine
- Game config JSON references assets by semantic spec, never by filename
- Asset Resolver module with mode switch: `reference` vs `generated`
- Track A resolver: lookup against asset-index.json
- Track B resolver: stub that returns placeholder assets (colored rectangles with correct dimensions)
- **This means the engine works in both modes from day one**, even before Track B generation is built

### Phase 2: Experience Intelligence
- Agents produce semantic asset specs as part of game config
- Artistic Director's `reference` block guides agent reasoning but doesn't reach the renderer
- Game Visual Identity generator runs for Track B games (between Artistic Director and Design Philosopher)

### Phase 3: Aesthetics
- VME Layer 1 + Layer 2 implementation
- Build Track B generation (VME Layer 3) alongside shader pipeline
- Game Visual Identity system fully operational
- Start with constrained generation (palette-constrained shapes with correct silhouettes)
- Iterate toward higher quality
- **Toggle between modes during testing to verify both paths work**

### Later phases: no changes needed
- Social ecology, entity minds, Overseer — all operate on game state, not raw assets
- Asset resolution is fully decoupled from gameplay systems

---

## The Toggle in Practice

```javascript
// config.js (or environment variable)
const ASSET_MODE = process.env.ASSET_MODE || 'reference';

// asset-resolver.js
function resolveAsset(semanticSpec) {
  if (ASSET_MODE === 'reference') {
    return lookupFromLibrary(semanticSpec);  // Track A
  } else {
    return generateFromSpec(semanticSpec);    // Track B
  }
}
```

For the internal demo: `ASSET_MODE=reference` → real sprites, instant "wow."
For public release: `ASSET_MODE=generated` → original assets, legally clean.
For development: toggle freely to compare quality and iterate on Track B.

---

## What's Copyrightable vs. What's Not (Quick Reference)

| Element | Copyrightable? | Track A | Track B |
|---------|---------------|---------|---------|
| Specific sprite pixels | Yes | Used (internal only) | Generated original |
| Color palette values | No | Used | Same palettes |
| Sprite dimensions (16x16, etc.) | No | Used | Same constraints |
| Silhouette vocabulary | No | Extracted | Same vocabulary |
| Animation frame counts | No | Extracted | Same counts |
| Physics parameters (jump height, gravity, speed) | No | Extracted | Same parameters |
| Level structure patterns | No | Extracted | Same patterns |
| Specific level layouts | Gray area | Referenced | Adapted, not copied |
| Sound effect waveforms | Specific recordings yes, parameters no | Referenced | Generated from params |
| Music melodies | Yes | Referenced | Generated original |
| Music structure (verse/chorus, tempo, key) | No | Extracted | Same structures |
| Game mechanic designs | No | Used | Same mechanics |
| Sequencing grammar patterns | No | Extracted | Same patterns |
| Distributional knowledge (avg sizes, palette counts) | No | Extracted | Same distributions |
| Relational constraints (size ratios, color distances) | No | Extracted | Same constraints |

---

## Summary

Build one pipeline. Two resolution paths. One toggle. The agent stack, game configs, sequencing grammar, social ecology, and everything that makes Two Fires special operates identically in both modes. The only difference is whether the final pixel/audio output comes from a library of real assets or a generation system that produces original assets matching the same specifications — constrained by the Game Visual Identity system that guarantees visual cohesion.

Start in Track A for speed and quality during development. Flip to Track B when you're ready to go public. Iterate on Track B quality over time — the gap narrows as generation tools improve, and the retro aesthetic is the most forgiving domain for procedural generation because the constraints of the original hardware ARE the style guide.
