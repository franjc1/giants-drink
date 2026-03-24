# SMCE (Sic Mundus Creatus Est) — Architectural Blueprint (claude.md)
## Source of truth for all Claude Code and Claude.ai sessions

**Last updated:** 2026-03-23 (Thread 16: Procedural Generation Exploration & Boundary Finding)

**Project rename (Decision 115):** Formerly "Two Fires." Internal shorthand: SMCE. Repo remains `giants-drink`. "Two Fires" is the lore concept (the stolen cosmic fires).

---

## Session Protocol

### At the START of every Claude Code session:
1. Read this file (`claude.md`)
2. Read `docs/current-status.md`
3. If the task involves a specific system, read the relevant doc from `docs/design/`
4. If decision history is needed, read `docs/decisions-log.md`

### At the END of every Claude Code session:
1. Update `docs/current-status.md` — what changed this session, what's next
2. Append new decisions to `docs/decisions-log.md` — if any architectural or design decisions were made this session. Use the established format: Session header with date + topic, then numbered decisions with Context, Decision, and Rationale fields
3. Update `claude.md` ONLY if architectural changes were made (new agents, changed pipeline, new systems). Most sessions won't need this.
4. `git add . && git commit -m "[descriptive message]" && git push`

### Key documents and their roles:

| Document | Role | Changes When |
|----------|------|-------------|
| `claude.md` | Architectural blueprint — source of truth for all sessions | Architecture changes |
| `docs/current-status.md` | Handoff document — where we left off, what's next | Every session |
| `docs/decisions-log.md` | Append-only decision record with full rationale | When decisions are made |
| `docs/design/cas-engine-spec.md` | CAS engine specification — primitives, rules, interpretation layer | When CAS design changes |
| `docs/design/game-state-schema.md` | JSON data structures between all systems | When schema changes |
| `docs/design/sequencing-grammar-framework.md` | Intermediate layer theory + grammar seeds | When sequencing logic evolves |
| `docs/design/paradigm-shift-principles.md` | Constraint document for paradigm shifts | When shift principles evolve |
| `docs/design/diagnostic-framework.md` | Fast-fail quality evaluation specification | When diagnostic approach changes |
| `docs/design/build-plan-v4.md` | Build plan (STALE — needs full revision for v5) | When plan changes |
| `docs/lore/two-fires.md` | Mythology, endgame mechanics, narrative backbone | When lore decisions are made |

### Cross-environment sync:
- **Claude.ai → repo:** Joe downloads docs from Claude.ai, drops them in repo folders, tells Claude Code to commit and push (or does it manually)
- **Claude Code → Claude.ai:** Joe includes relevant project files in Claude.ai project. current-status.md and decisions-log.md are the most important for context continuity.
- **Conflict resolution:** If current-status.md seems stale or contradictory, check decisions-log.md for the authoritative record of what was decided and when.

---

## Design Philosophy

SMCE produces emergent game experiences from the mutual constraint of primitives (Barrett's constructionist model applied to game design). No single system dominates. Quality is guaranteed by the shape of the constraint space, not by prescription of outcomes.

- CAS is a primitive, not the whole system
- Agents define constraints, not content
- The specific experience is unpredictable; the quality is guaranteed
- Over-constraining = scripted (bad). Under-constraining = incoherent (bad). The art is in constraint design.
- Debugging = constraint diagnosis: which surface is miscalibrated?
- **Ground truth over vibes:** Every generated element is grounded in data extracted from real games, not Claude's imagination of what a game should be
- **Claude's creative contribution is compositional and semantic, not generative:** Claude selects, combines, arranges, and themes real ingredients — it doesn't generate raw game output from scratch
- **Specialized tools for specialized jobs:** PixelLab generates visuals. Phaser renders gameplay. jsfxr produces SFX. p5.js generates atmospheric backgrounds. Claude designs levels and orchestrates the CAS. Each tool does what it's best at.

See `docs/decisions-log.md` Decision 1 (Constraint Surface Model) for full rationale.

### The Tire Principle (Decision 104)

**Claude must never "meet road."** For every primitive in the game, there must be a high-quality implementation layer between Claude's creative direction and the actual game output. Claude is the driver (making intentional, creative, compositional decisions). The implementation layer is the tire (translating intent into high-quality concrete output). The game is the road.

If, for any primitive, the answer to "what's the tire?" is "Claude generates it directly," that's an architectural red flag.

**Current implementation layers ("tires") per primitive:**

| Primitive | Tire | How It Works | Status |
|-----------|------|-------------|--------|
| Foreground visuals | PixelLab | Claude describes → PixelLab generates pixel art → PNG in game | ✅ Validated |
| Backgrounds (side-view) | p5.js procedural | Claude parameterizes → p5 renders atmosphere + parallax | ✅ Validated (Decision 117) |
| Physics | ROM parameter DB | Claude selects reference game → exact values loaded → engine config | ✅ Validated |
| SFX | jsfxr presets | Claude describes function → parameter preset → audio synthesis | 🟡 Identified |
| Music | Tone.js + ground truth patterns | Claude describes mood → structural patterns selected → real-time synthesis | 🟡 Direction set |
| Mechanics | **Mechanical Pattern Library** | Claude selects + configures patterns → proven code instantiated | ❌ Needs building |
| Layouts | **Composition System + Section Templates** | Claude defines zones → edges auto-detected → PixelLab tilesets fill roles | ❌ Needs building (architecture validated, Decision 119) |

### Big Thing 1 = Gap B (Composition), Big Thing 2 = CAS (Decision 116)

The project's remaining arc is two "big things":
- **Big Thing 1:** Gap B — Composition system, Section Template Library, fill patterns, mechanical patterns, game feel. Everything needed to generate games that look and play great WITHOUT the CAS.
- **Big Thing 2:** CAS — Social ecology engine, entity minds, meta-narrative, Overseer.

Big Thing 1 must be solid before Big Thing 2 can land.

### SNES Comfort Model (Default Difficulty Philosophy)

SMCE defaults to SNES-era difficulty: the game respects your time and assumes you want to make progress. Difficulty comes from complexity layering and spatial pressure, not punishment severity.

**Default forgiveness parameters:**
- Checkpoints: player never loses more than ~60-90s of progress
- Death cost: low (time, not accumulated progress)
- Enemy telegraphs: 400-600ms (thoughtful reaction, not reflex)
- Teachability: consequence-free introduction *zones* for every new element
- Complexity ceiling: conservative (2-3 simultaneous challenge types max)
- Ramp shape: concave (fast early progress, slow difficulty increase)

---

## Core Runtime Architecture: PixelLab + Phaser (Decision 99)

The game engine is Phaser 3 (browser-based 2D game framework). All foreground visual assets are generated by PixelLab's AI pixel art API. Game mechanics use physics parameters extracted from real ROMs. Levels are designed by Claude using patterns from the ingestion library. Atmospheric backgrounds are procedurally generated by p5.js.

### Three Layers (Revised)

**Layer 1 — Phaser 3 Game Engine (browser-based)**
- Renders all gameplay: sprite animation, tilemap rendering, physics, collision, camera, input
- Loads assets from PixelLab-generated PNGs (sprite sheets, tilesets)
- Loads level layouts from JSON manifest (tilemap arrays, entity placements, physics parameters)
- Handles multiple paradigms: sidescroller, top-down, Mode 7, raycasting, etc.

**Layer 2 — PixelLab Visual Pipeline (foreground art)**
- Generates all foreground visual assets via API/MCP
- **Role-based tileset generation (Decision 119):** Instead of individual tiles, PixelLab generates complete tilesets per material zone: 1 fill tile, 4 edge tiles (N/S/E/W), 4 outer corners, 4 inner corners, 2-3 detail variants ≈ 15-20 images per material
- Character creator: 4/8 directional views with animation (walk, idle, attack, death)
- Style consistency: reference images ensure all assets in a game look cohesive
- Combat animations validated (Thread 14): Kick, punch, fireball, reactions, custom specials

**Layer 2b — p5.js Procedural Background Pipeline (Decision 117)**
- Generates atmospheric/parallax background layers for side-view paradigms
- Parameterized by Claude: sky color ramp, silhouette profile, parallax layer count/speeds, mood
- Zero cost, instant generation, infinite variation (no two games have identical backgrounds)
- Covers ~70% of background needs (all side-view paradigms)
- PixelLab handles the remaining ~30% (scenic illustrated objects, fighting game stages)
- **Camera-derived boundary (Decision 121):** Side/angled view → p5 atmosphere. Top-down/FPS → no separate background (tilemap is everything).

**Layer 3 — Game Manifest (JSON)**
- Complete game description: entity definitions, physics parameters, level layouts, game rules
- Physics values sourced from ROM extraction library
- Level structures built by composition system (zones → edges → roles → tileset references)
- Mechanical patterns referenced by name, resolved to proven code at build time
- Section templates referenced by intention, resolved to spatial layouts at build time
- CAS initial conditions, faction definitions, social graph
- References to PixelLab-generated asset files and p5 background parameters

### PixelLab Integration Details

**MCP (Model Context Protocol):** Claude Code calls PixelLab tools directly — `create_character`, `animate_character`, `create_sidescroller_tileset`, `create_topdown_tileset`, `create_map_object`.

**API v2:** For production runtime, direct REST API calls.

**Key capabilities validated:**
- Character recognition: Harry Potter, Mega Man, Winston Churchill, Tony Soprano all recognizable at 48-128px
- Walk cycle animation: consistent across frames
- Wang tilesets: proper 16-tile terrain transitions, chainable
- Sidescroller tilesets: platform tiles with decorations
- Style consistency across session
- Fighting game combat animations (Thread 14)
- Custom Animation V3: arbitrary actions up to 16 frames

**Latency:** Single image ~20-30s. Character creator ~3-5 min. Tileset ~30-60s.

**Cost:** Full game asset set (~30-40 calls) ~$0.30-0.60. With asset banking (80% cache hits) ~$0.05-0.15 per game.

### Asset Banking Strategy

Three-tier cache: Universal bank (particles, UI), Semantic bank (tagged by concept/style), Per-game unique. Stored on Cloudflare R2.

---

## Composition System Architecture (Decision 119) — NEEDS BUILDING

This is the core architecture for Gap B / Big Thing 1. Validated in Thread 16 proof-of-concept.

### The Process (Top-Down, Not Bottom-Up)

The critical insight from Thread 16: composition works top-down (spatial intent → tile roles), not bottom-up (make tiles → arrange them). Bottom-up produces "tiled-looking" output. Top-down produces spatially coherent scenes.

**Step 1 — Zone Painting:** Define material zones on a grid (wall, ground, sky, grass, dirt, water, path, etc.). This is the macro-level spatial design. Claude designs this based on section templates and sequencing grammar.

**Step 2 — Edge Detection:** Automatically classify every cell: fill (all neighbors same zone), edge-N/S/E/W (neighbor in that direction is different zone), outer corner (two adjacent edges meet), inner corner (diagonal neighbor different). Uses marching-squares-style neighbor analysis.

**Step 3 — Detail Placement:** Place detail elements on fill tiles following rhythm rules: never adjacent to each other, density varies by zone type, only on interior tiles (never on edges). Breaks visual repetition.

**Step 4 — Role-Based Rendering:** Each cell renders based on its zone + edge classification + detail assignment. The rendering layer looks up the appropriate tile from a PixelLab-generated role-based tileset.

### Integration with Three-Layer Composition Model (Decision 113)

| Composition Layer | What It Does | What Feeds It |
|---|---|---|
| Layer 1: Sequencing | What sections in what order | CCST + Kishōtenketsu + sequencing grammar |
| Layer 2: Section Templates | Spatial skeleton (zone layout per section) | Real game level analysis |
| Layer 3: Fill Patterns + Edge Resolution | How tiles fill zones + how edges transition | Composition system + PixelLab role-based tilesets |

The composition system IS Layer 3. Section templates provide the zone layouts; the composition system resolves edges and assigns tile roles; PixelLab tilesets provide the visual art.

### Role-Based Tileset Specification

Per material zone, PixelLab generates:
- 1 fill tile (interior, no edges)
- 4 edge tiles (N, S, E, W — where this zone meets a different zone)
- 4 outer corner tiles (NE, NW, SE, SW)
- 4 inner corner tiles (for L-shaped zone boundaries)
- 2-3 detail variant tiles (decorative breaks for fill areas)
- **Total: ~15-20 images per material zone**

A typical game might have 4-6 material zones → 60-120 PixelLab images for the complete tileset. At ~$0.01/image, that's $0.60-1.20 for all level art.

---

## Procedural Generation Boundaries (Thread 16 Findings)

### What Procedural JS Can Do Well
- **Atmospheric backgrounds:** Sky gradients, mountain silhouettes, star fields, city skylines, parallax depth layers. p5.js validated at 9.5/10 quality for sunset scene.
- **Geometric structure at distance:** Building silhouettes, support columns, industrial shapes. Serviceable for background elements the player doesn't closely inspect.
- **Composition logic:** Zone painting, edge detection, detail placement rules. The architecture for arranging tiles.
- **Infinite variation:** Each procedural generation is unique. No two skies, no two cityscapes are identical.

### What Procedural JS Cannot Do
- **Organic shapes:** Trees, bushes, grass blade clusters, natural terrain transitions. Look "clip art" or "childish."
- **Recognizable objects:** Houses, specific machines, illustrated features. Look like programmer art.
- **SNES-quality tile art:** Despite four progressively sophisticated attempts (declarative operations, SNES-grade enhancements, Perlin/Worley/FBM noise, painterly palettes), procedural tiles consistently produced NES/early-PC quality output.
- **Anything the player stares at:** The quality gap between procedural and hand-crafted is immediately visible for foreground gameplay elements.

### The Camera-Derived Boundary Rule (Decision 121)
- **Side/angled view** → p5 for atmosphere behind gameplay, PixelLab for foreground
- **Top-down view** → no background, everything is PixelLab tiles in composition system
- **First-person** → PixelLab wall textures, no separate background
- **Mode 7** → p5 for horizon/sky, PixelLab for track surface

---

## Mechanical Pattern Library (Decision 105) — NEEDS BUILDING

A curated registry of parameterized Phaser 3 code modules, each extracted from a real working open-source JS game implementation. Claude's Builder references patterns by name and configures them with parameters.

Each pattern carries: Code (Phaser 3 module), Parameters (configurable), Required animation states (for PixelLab), Required sound events (for jsfxr), Hitbox/collision definitions, Composition rules.

Source: Open-source JS game clone ecosystem (Decision 109). 20-40 patterns per paradigm × 7 clusters = 140-280 total. Validate with ONE pattern before building full library.

---

## Section Template Library (Decision 106) — NEEDS BUILDING

Pre-built spatial zone arrangements derived from real game levels. Templates categorized by intention: introduction, escalation, combination, rest, puzzle, boss arena, reward, transition, climax, provocation.

Templates output zone maps that feed into the composition system (Decision 119). The composition system resolves edges and assigns tile roles. 10-20 templates per paradigm cluster.

---

## Audio Pipeline

### Sound Effects: jsfxr (browser library, zero cost)
Retro SFX from parameter presets. Zero API cost, zero latency.

### Background Music: Tone.js + Ground Truth Patterns (Decision 107)
Tone.js driven by structural patterns from the 103,262-track music library. Not yet validated.

---

## Physics and Game Feel

Physics parameters from ROM extraction data. The entire feel derives from two designer-chosen values — max jump height and time to apex. Everything else is calculable.

---

## CAS Engine Architecture (Two-Layer Design)

**Unchanged.** Full specification: `docs/design/cas-engine-spec.md`

CAS manifests through Phaser: affect changes → entity parameters, faction territory → tileset swaps, dramatic events → new spawns, paradigm shifts → full scene reconstruction.

---

## Diagnostic & Tuning Framework Summary

**Unchanged from Thread 9.** Full specification: `docs/design/diagnostic-framework.md`

Fast-fail funnel: Gate 1 (automated) → Gate 2 (Joe reviews clips) → Gate 3 (INUS conditions) → Gate 4 (holistic playthroughs).

---

## The Lore System

**Unchanged.** Full lore document: `docs/lore/two-fires.md`.

---

## Tools Reference

### Visual Generation
| Tool | What It Does |
|------|-------------|
| PixelLab MCP | AI pixel art generation via Claude Code — characters, animations, tilesets, items |
| PixelLab API v2 | Same capabilities via REST for production runtime |
| p5.js | Procedural atmospheric backgrounds — parallax layers, sky gradients, city silhouettes (Decision 117) |

### Game Engine
| Tool | What It Does |
|------|-------------|
| Phaser 3 | Browser-based 2D game engine — rendering, physics, collision, camera, input |

### Audio
| Tool | What It Does |
|------|-------------|
| jsfxr | Browser-based retro SFX generator from parameter presets |
| Tone.js | Browser-based synthesizer for chiptune music driven by ground truth patterns |

### Extraction & Analysis (retained for physics data)
| Tool | What It Does |
|------|-------------|
| `tools/jsnes-extractor.js` | 5-phase extraction pipeline — physics params from NES ROMs |
| `tools/nes-trace-analyzer.cjs` | Hybrid trace-based behavioral map generator |

### Pattern Library Source Material (Decision 109)
| Resource | What It Is |
|----------|------------|
| osgameclones.com | Structured database of open-source game clones, 157+ JS entries |
| awesome-game-remakes (GitHub) | Curated list of actively maintained open-source game remakes |
| awesome-open-source-games (GitHub) | Massive genre-organized list of open-source games |

### Demos & Proofs
| Tool | What It Does |
|------|-------------|
| `public/pixellab-proof.html` | Sidescroller POC: Harry Potter platformer with PixelLab assets |
| `public/pixellab-zelda-proof.html` | Top-down POC: Zelda-style RPG with PixelLab assets |
| `experiments/pixellab-fighting-test/` | Fighting game sprite test (Thread 14) |
| `experiments/pixellab-bg-test/` | PixelLab background stress test (Thread 15) |

---

## Key Architectural Principles

1. **The Tire Principle: Claude must never "meet road."** Every primitive needs a high-quality implementation layer. PixelLab for foreground visuals. p5.js for atmospheric backgrounds. ROM data for physics. jsfxr for SFX. Mechanical Pattern Library for mechanics. Composition System + Section Templates for layouts. Claude selects, configures, and composes — specialized tools implement.

2. **Ground truth from real games.** Physics parameters, level patterns, difficulty curves, structural grammars, mechanical code patterns, and spatial templates are extracted from real games.

3. **Generate once, reuse everywhere.** Asset banking keeps costs under $0.15 per game and creation time under 2 minutes for repeat styles.

4. **Claude's role is compositional and semantic.** Claude assembles manifests from extracted data + patterns + templates + asset descriptions. Claude decides intent. Tools execute.

5. **Composition is top-down, not bottom-up (Decision 119).** Zone painting → edge detection → role assignment → tile rendering. Never "make tiles, then arrange." Always "define spatial intent, then fill with art."

6. **The procedural/PixelLab boundary is camera-derived (Decision 121).** Side view = p5 atmosphere + PixelLab foreground. Top-down = all PixelLab. FPS = PixelLab walls. This rule is principled, falsifiable, and complete across all 7 paradigm clusters.

7. **The CAS modifies parameters, not assets.** At episode boundaries, CAS changes entity speeds, behaviors, placements. Rarely triggers new asset generation.

8. **Validate end-to-end before scaling.** Every architectural decision validated by building something playable first.

---

## Accounts & Infrastructure

- **GitHub:** franjc1 (repo: giants-drink)
- **Vercel:** giants-drink.vercel.app
- **Cloudflare R2:** asset storage (planned for asset bank)
- **PixelLab:** Tier 3 ($50/month, 10,000 images, 20 concurrent jobs)
- **Anthropic API:** ~$150 credits
- **Inference:** Fireworks (dialog, low latency), DeepInfra (background CAS)
- **ROM library:** ~3,146 NES ROMs in `~/nes-roms/`
- **Ingestion library:** ~7,800 structured JSON files across ~1,603 retro games
- **Music library:** 103,262 tracks across 7,068 games (NES/SNES/Genesis chiptune formats)
