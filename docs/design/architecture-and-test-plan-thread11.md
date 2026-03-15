# Two Fires — Architecture Summary & Validation Test Plan

**Thread 11 | 2026-03-15**

---

## Part 1: Current Architecture

### The Vision

Two Fires generates complete, playable retro-style games from natural language prompts. What appears to be a game generator is actually a deep social ecology game — a multi-agent AI pipeline that creates unique worlds with living social dynamics, emergent political narratives, and a persistent meta-narrative about two stolen cosmic fires.

The player prompts a world into existence ("an immersive game from 1940s France where I'm part of the resistance"), experiences it as a retro game, and gradually discovers a living social ecology underneath — factions, entity minds with bounded knowledge, emergent political dynamics — all converging on the Two Fires meta-narrative.

### The Meta-Architecture

The browser is the meta-engine. Emulators are pluggable execution contexts.

```
Browser (meta-engine / scene manager)
├── Player UI Layer
│   ├── Prompt input & game creation interface
│   ├── Character select / menu screens (your code, not emulator)
│   ├── Transition screens (loading art, episode boundaries)
│   ├── Dialog / conversation UI (CAS social encounters)
│   └── HUD overlays (narrative elements, faction indicators)
│
├── Claude (Creative Controller)
│   ├── Experience Interpreter (prompt → creative vision)
│   ├── Composition Engine (selects cluster authorities, generates manifest)
│   ├── Designer / Builder / Validator (level construction pipeline)
│   ├── CAS Interpreter (social state → behavioral/visual/narrative directives)
│   └── Entity Minds (NPC dialog, bounded knowledge, personality)
│
├── Image Model (visual asset generation)
│   ├── API tier: FLUX Kontext [pro] or FLUX.2 [pro] ($0.04-0.08/image)
│   ├── Local tier: FLUX.2 klein 4B via mflux (free, Apache 2.0)
│   └── Future: fine-tuned LoRA on klein Base 4B for sprite specialization
│
├── Quantizer (deterministic format conversion)
│   ├── Full-color image → NES 4-color-per-tile palette
│   ├── Snap to 8x8 tile grid
│   ├── Pack into CHR format (2bpp NES, 4bpp SNES)
│   └── Validate dimensions, frame counts, palette legality
│
├── CAS Engine (deterministic JavaScript)
│   ├── Affect propagation (valence + arousal through social bonds)
│   ├── Information propagation (knowledge with attribution)
│   ├── Bond dynamics (attribution-gated changes)
│   ├── Faction aggregates
│   └── Drama density tracking
│
└── Emulator Instances (pluggable, disposable)
    ├── jsnes (NES engine ROMs)
    ├── [future] SNES emulator
    └── [future] Genesis emulator
        Each instance runs:
        ├── Layer 1: Emulator Runtime (actual ROM code)
        ├── Layer 2: Behavioral Map (semantic → memory address)
        └── Layer 3: Memory Write Interface (Creative Controller's output)
```

### Key Architectural Principles

**1. The emulator IS the engine.** We never build custom renderers, physics engines, or audio systems. Proven emulators provide all of this at original quality. The quality floor is "the original game."

**2. The browser is the scene manager.** Emulator instances are spun up and torn down as needed. Different matchups, levels, or game segments can run in different emulator instances (potentially different engine ROMs). The browser UI handles all transitions seamlessly. The player never sees the infrastructure.

**3. Modifications are memory writes, not code generation.** The Creative Controller writes data values to specific addresses. The game's own code processes those values. Modifications are stable because the game engine handles all edge cases.

**4. Composition, not generation.** Claude doesn't invent game mechanics or pixel art from scratch. Claude composes: selects the best mechanical DNA from extracted sources, selects visual transformation parameters, maps semantic intent to proven game primitives. Every parameter value is grounded in data from real games.

**5. The Composition Manifest is a first-class artifact.** Every compositional decision Claude makes is captured in a structured document before any emulator spins up. This makes composition auditable, debuggable, and reproducible.

**6. Cross-game composition produces genuinely new experiences.** Movement feel from one source, combat from another, level grammar from a third, visuals entirely generated, social ecology unique. The player shouldn't recognize any single source game — they should be immersed in the world they prompted.

### The Composition Manifest

The central artifact that bridges player prompt and running game:

```
Composition Manifest:
  prompt: "immersive game from 1940s France, resistance fighter"
  
  engine_rom: "castlevania_engine_v2"  // selected for exploration + combat affordances
  
  cluster_authorities:
    movement_feel:
      source: "castlevania_3"
      params: { gravity, acceleration, friction, jump_height, air_control }
      rationale: "deliberate, weighty — fits sneaking/resistance fantasy"
    combat_system:
      source: "ninja_gaiden"
      params: { damage, iframes, knockback, weapon_types }
      rationale: "quick, lethal — high stakes combat"
    level_grammar:
      source: "metroid"
      pattern: "interconnected_zones"
      rationale: "exploration with backtracking, gated by acquired contacts/tools"
    entity_design:
      source: "castlevania_3"
      philosophy: "pattern_based_patrols"
      rationale: "predictable patrol patterns = stealth gameplay"
    audiovisual:
      generated: true
      brief: "1940s occupied France, muted tones, tense atmosphere"
    rule_economy:
      source: "zelda_2"
      params: { health_model, save_system, progression_rewards }
      rationale: "RPG-lite progression, safe house save points"
  
  visual_brief:
    style_anchor: "wartime european city, NES pixel art, muted palette"
    player: { desc: "resistance fighter, beret, trench coat", frames: 12 }
    enemies:
      - { role: "patrol_soldier", frames: 8, behavior: "pattern_patrol" }
      - { role: "officer", frames: 6, behavior: "mini_boss" }
    tiles:
      - { role: "ground", variants: 8, desc: "cobblestone, cracked" }
      - { role: "walls", variants: 6, desc: "stone buildings, bomb damage" }
      - { role: "background", desc: "city skyline, smoke, overcast" }
    palette: { primary: "desaturated blues/grays", accent: "warm amber interiors" }
  
  level_structure:
    zones: 5
    layout: "hub-and-spoke from central safe house"
    progression_gates: ["contact_meeting", "forged_papers", "radio_parts"]
    cas_hooks: ["patrol_intensity", "safe_house_discovery", "ally_capture"]
  
  cas_initial_state:
    factions: [resistance_cell, occupying_force, civilians]
    key_entities: [cell_leader, radio_operator, informant, double_agent]
    initial_tension: 0.3
```

### Six Modification Channels

All game modifications flow through memory writes to the running emulator:

| Channel | What Changes | How | Proven? |
|---------|-------------|-----|---------|
| Palette | Colors, mood, atmosphere | PPU palette RAM writes | ✅ Yes |
| Tiles | Ground textures, wall appearance, decorations | CHR pattern table writes | ✅ Yes |
| Sprites | Character appearance, enemy looks, items | CHR sprite tables + OAM | ✅ Single tile |
| Mechanical | Entity behavior, speed, aggression, patrol patterns | RAM via behavioral map | ✅ Partial |
| Structural | Level layouts, enemy placement, item positions | RAM level data addresses | ⚠️ Needs format work |
| Audio | Background music, SFX | APU registers | ⚠️ Untested |

### Six Parameter Clusters

Parameters that must travel together (one source authority per cluster):

1. **Movement feel** — gravity, acceleration, friction, jump height/arc, air control
2. **Combat system** — damage, HP, invincibility frames, knockback, weakness graphs
3. **Level grammar** — progression gating, key/lock patterns, teachability arcs
4. **Entity design philosophy** — pattern-based vs reactive vs swarm
5. **Audiovisual identity** — palettes, tile style, proportions, music, SFX
6. **Rule economy** — lives, scoring, currency, power-ups

### The CAS Two-Layer Architecture

**Layer 1 — CAS Engine (deterministic JS):** Entities have affect (valence + arousal), personality (OCEAN), knowledge, and social bonds. Simple math propagates these through a social graph. ~430-610 lines JS, <10ms per cycle for 50-100 entities. No interpretation, no thresholds, no essentialist categories.

**Layer 2 — Claude Interpretation:** At episode boundaries, Claude reads CAS state and constructs narrative. Same primitives produce different constructions in different contexts (Barrett's constructionism). Claude directs NPC behavior → behavior creates events → events enter CAS → CAS updates → Claude interprets. The loop is continuous, the layers are cleanly separated.

### Track A / Track B

**Track A (development, internal):** Run unmodified commercial ROMs. Modify in real-time. Perfect fidelity.

**Track B (public release):** "Engine ROMs" — commercial ROMs stripped of all copyrightable creative expression (tiles, sprites, level data, music, palettes). Only functional code remains. At generation time, Creative Controller populates with 100% original content via modification pipeline. ALL tiles and sprites replaced. ALL level layouts generated. ALL palettes generated. Automatic distribution shift guarantees no output matches any source ROM.

### Dynamic ROM Context Switching

The browser can swap emulator instances between game segments:

- Character select screen (your UI) → load appropriate engine ROM for the matchup
- Episode boundary → potentially swap engine ROM if mechanical needs change
- Each ROM loads in milliseconds (NES ROMs are <1MB)
- Player sees seamless transitions via your UI layer
- Enables cross-engine composition: different fights/levels can use different mechanical DNA
- Pre-allocated empty entity slots allow CAS to introduce new entities mid-game

---

## Part 2: What Needs Testing

### The Dependency Chain

Tests are ordered by dependency — later tests depend on earlier ones passing. Failing early is cheap; failing late is expensive. Each test has a clear pass/fail criterion.

```
Test 1: Image Model Sprite Transformation
    ↓ (must pass)
Test 2: Quantization Survival
    ↓ (must pass)
Test 3: Emulator Injection & Rendering
    ↓ (must pass — Tests 1-3 form the "Visual Pipeline Proof")
Test 4: Multi-Asset Cohesion
    ↓ (must pass)
Test 5: Visual Inventory Classification
    ↓ (must pass)
Test 6: Full Visual Reskin (all tiles + sprites for one game)
    ↓ (must pass — Tests 4-6 form the "Complete Visual Transformation Proof")
Test 7: Level Format Identification
    ↓ (must pass)
Test 8: Level Data Generation & Injection
    ↓ (must pass — Tests 7-8 form the "Structural Modification Proof")
Test 9: Cross-Game Parameter Composition
    ↓ (must pass)
Test 10: Composition Manifest → Running Game (end-to-end)
    ↓ (must pass — the "Composition Proof")
Test 11: CAS → Emulator Modification Loop
    ↓ (must pass — the "Living World Proof")
Test 12: Full Prompt-to-Play Pipeline
    ↓ (the "Product Proof")
```

---

## Part 3: The Test Plan (Priority Order)

### TIER 1: Visual Pipeline Proof (Highest Priority, Highest Uncertainty)

This is the existential test. If image generation → quantization → emulator injection doesn't produce good-looking results, the entire visual strategy needs rethinking. Test this first, fail fast.

#### Test 1: Image Model Sprite Transformation

**What:** Send a real game sprite sheet to FLUX Kontext [pro] via API. Ask it to transform the sprites into a themed variant while preserving layout, poses, and frame count.

**Setup:**
- Extract SMB's Mario sprite sheet from CHR-ROM (all animation frames, rendered as a single image)
- Send to FLUX Kontext [pro] via fal.ai API ($0.04/call)
- Prompt: "Transform this sprite sheet into a knight in armor. Same poses, same frame layout, same dimensions. Medieval fantasy style."
- Also test: "Transform into a 1940s resistance fighter in a trench coat"
- Also test with enemy sprites (Goombas → themed enemies)

**Pass criteria:**
- Output preserves the spatial layout of the input (frames are in the same positions)
- Output is recognizably the requested theme (you can tell it's a knight / resistance fighter)
- Output doesn't have obvious artifacts (smearing, misalignment, wrong proportions)

**Fail criteria:**
- Layout destroyed (frames jumbled, dimensions wrong)
- Unrecognizable output (can't tell what it's supposed to be)
- Consistent artifacts that would be visible in-game

**Cost:** ~$0.50-2.00 (10-50 API calls for experimentation)

**What we learn:** Whether image-to-image transformation preserves the structural constraints we need. This is the single most important unknown.

#### Test 2: Quantization Survival

**What:** Take the output from Test 1 and quantize it to NES constraints. Does it still look good?

**Setup:**
- Build a quantizer (Claude Code task): takes a full-color PNG, forces to NES palette (4 colors per 8x8 tile from the game's palette), snaps to 8x8 tile grid
- Run Test 1's output through the quantizer
- Compare: original generated image vs quantized version

**Pass criteria:**
- Characters/objects are still recognizable after quantization
- Color reduction doesn't destroy important details (face features, weapon outlines)
- Tile grid snapping doesn't create obvious seams

**Fail criteria:**
- Quantization turns recognizable images into unrecognizable blobs
- Color banding destroys the visual identity
- Tile boundaries create grid artifacts visible at game resolution

**Cost:** $0 (deterministic code, runs locally)

**What we learn:** Whether the quality survives the format conversion. If it doesn't, we need to either generate at lower color depth (constrain the image model) or improve the quantization algorithm (dithering, palette optimization).

#### Test 3: Emulator Injection & Rendering

**What:** Take quantized tiles from Test 2 and inject them into a running SMB game in jsnes. Does it look right in motion?

**Setup:**
- Pack quantized tile data into CHR format (2bpp, NES standard)
- Write to jsnes vramMem at the appropriate pattern table addresses
- Run the game and observe: does the player character look like the knight? Do enemies look themed?
- Capture screenshots and short gameplay video

**Pass criteria:**
- Injected sprites render correctly (no glitches, no missing tiles, no color errors)
- Animation plays correctly (all frames display in proper sequence)
- Game remains stable (no crashes, no visual corruption of non-replaced elements)
- The overall visual impression is "this looks like a themed game, not a glitch"

**Fail criteria:**
- Visual corruption (tiles in wrong positions, wrong palette applied)
- Game instability (crashes after injection, rendering glitches)
- The result looks broken rather than themed

**Cost:** $0 (runs locally in jsnes)

**What we learn:** Whether the full image → quantize → inject pipeline produces a playable, good-looking result. This is the "Visual Pipeline Proof" — if Tests 1-3 all pass, we have a viable visual transformation pipeline.

**DECISION GATE:** If Tests 1-3 pass → proceed to Tier 2. If any fail → diagnose which step failed and iterate on that step before proceeding.

---

### TIER 2: Complete Visual Transformation Proof

Tests 1-3 prove single sprites/tiles work. Tier 2 proves the pipeline works for an ENTIRE game's visual identity.

#### Test 4: Multi-Asset Cohesion

**What:** Generate multiple asset groups (player sprites, enemy sprites, ground tiles, background tiles) for a single theme. Do they look like they belong together?

**Setup:**
- Define a theme (e.g., "medieval castle, torchlit, stone walls")
- Generate a "style anchor" image first (the overall art direction reference)
- Generate player sprite sheet, enemy sprite sheet, ground tileset, background tileset — all referencing the style anchor via multi-reference input
- Lay out all generated assets on a single comparison sheet

**Pass criteria:**
- Consistent art style across all asset groups (same pixel density, same level of detail)
- Consistent palette usage (colors harmonize, same mood across all assets)
- A non-technical viewer would say "these all look like they're from the same game"

**Fail criteria:**
- Obvious style mismatch between asset groups (player looks realistic, tiles look cartoonish)
- Palette clash (enemies use colors that don't exist in the tile palette)
- Quality inconsistency (some assets much better than others)

**Cost:** ~$1-3 (20-60 API calls with style anchor + multiple asset groups)

**What we learn:** Whether the style anchor + multi-reference approach produces visual coherence across dozens of assets. This is the cohesion question.

#### Test 5: Visual Inventory Classification

**What:** Can Claude accurately classify every tile group in a game by semantic role?

**Setup:**
- Extract all unique tiles from SMB's CHR-ROM (you have this)
- Render them as a visual grid
- Capture 3-5 gameplay screenshots with tile position data from the nametable
- Present to Claude: "Here are all the tiles in this game and screenshots showing where they appear. Classify each tile group by role: player frames, ground tiles, pipe segments, cloud/bush decorations, enemy type A, enemy type B, coin/item, UI elements, etc."

**Pass criteria:**
- Claude correctly identifies >90% of tile groups by role
- Player character frames correctly identified and grouped
- Ground/wall/platform tiles correctly distinguished from decorative background
- Enemy types correctly separated

**Fail criteria:**
- Misclassification of critical tile groups (thinks enemy tiles are background)
- Can't distinguish player tiles from enemy tiles
- Fails to identify tile groups that animate together

**Cost:** ~$0.10 (one Claude API call with images, or done in this Claude.ai conversation)

**What we learn:** Whether the Visual Inventory step is reliable enough to automate. If Claude can't classify tiles accurately, the pipeline won't know what to replace with what.

#### Test 6: Full Visual Reskin

**What:** Replace ALL visual assets in SMB with a themed set. Play the result.

**Setup:**
- Use Test 5's Visual Inventory to identify every tile group
- Generate replacement for every group using the image model + style anchor
- Quantize all replacements
- Inject ALL replacements into running SMB
- Play through World 1-1 and 1-2

**Pass criteria:**
- The game looks like a complete, cohesive themed game (not SMB with some tiles swapped)
- No un-replaced tiles visible (no original SMB art leaking through)
- Game is fully playable (nothing about the visual replacement breaks gameplay)
- A player unfamiliar with SMB wouldn't immediately recognize it as SMB
- Joe's gut reaction: "this looks good" (not "this looks like a mod")

**Fail criteria:**
- Patchwork appearance (some areas themed, others obviously original)
- Visual incoherence (tiles that should be adjacent don't match at edges)
- Game-breaking visual issues (can't tell where platforms are, enemies invisible)

**Cost:** ~$3-8 (full asset set generation, multiple iterations likely)

**What we learn:** Whether complete visual transformation is achievable at quality. This is the "Complete Visual Transformation Proof."

**DECISION GATE:** If Tests 4-6 pass → visual pipeline is validated. If Test 4 fails → cohesion approach needs work. If Test 5 fails → Visual Inventory needs a different method. If Test 6 fails → assess whether failures are fixable or fundamental.

---

### TIER 3: Structural Modification Proof

Can we change what the player physically navigates, not just what it looks like?

#### Test 7: Level Format Identification

**What:** Can the behavioral map pipeline (extended) identify how a game stores its level data?

**Setup:**
- Start with SMB (best-documented level format in NES history)
- Use the trace analyzer + ROM hacking community documentation to identify: where level data lives in ROM, what format it uses, how the game's level loader reads it
- Document the format as a machine-readable schema
- Verify by: writing a known level layout in the identified format, injecting it, confirming the game renders the expected level

**Pass criteria:**
- Level format fully documented (object types, position encoding, scroll commands)
- Can write arbitrary valid level data that the game engine renders correctly
- Injected level is playable (collisions work, enemies spawn correctly, scrolling works)

**Fail criteria:**
- Can't identify the level format (too compressed, too complex)
- Can write level data but game crashes or renders incorrectly
- Format is identified but too limited (can't express the level designs we need)

**Cost:** $0 (engineering work, runs locally)

**What we learn:** Whether level generation is tractable for at least one well-known game. SMB is the easiest case — if this fails, level format identification for other games will be harder.

#### Test 8: Level Data Generation & Injection

**What:** Can Claude design a level, express it in the identified format, and have the game render and run it?

**Setup:**
- Give Claude the level format schema from Test 7
- Ask Claude to design a short level: "A bombed-out street with rubble to jump over, a patrol route with gaps to sneak through, and a safe house entrance at the end"
- Claude outputs level data in the game's format
- Inject into running emulator
- Play the level

**Pass criteria:**
- Level renders correctly (all objects where expected, scroll behaves properly)
- Level is physically completable (player can reach the end)
- Level design reflects Claude's intent (rubble is in the right places, patrol route is visible)

**Fail criteria:**
- Level data causes crashes or rendering errors
- Level is physically impossible (unreachable platforms, inescapable pits)
- Level layout doesn't match what Claude described (random-looking placement)

**Cost:** ~$0.10 (one Claude API call for level design)

**What we learn:** Whether the full loop works: Claude designs → format encodes → emulator renders → player plays. This is the "Structural Modification Proof."

**DECISION GATE:** If Tests 7-8 pass → level generation is viable. If Test 7 fails on SMB → try a simpler game or a homebrew engine with a known format. If Test 8 fails → Claude's level design needs more constraints or the format has limitations.

---

### TIER 4: Composition Proof

Can parameters from different games combine into something that feels good?

#### Test 9: Cross-Game Parameter Composition

**What:** Take movement physics from one game and enemy behavior from another. Does the combination feel designed or broken?

**Setup:**
- Extract movement parameters (gravity, acceleration, jump height) from Game A (e.g., Castlevania)
- Extract enemy patrol parameters (speed, pattern timing) from Game B (e.g., Mega Man)
- Apply composition heuristics (ratio preservation: enemy speed as proportion of player speed)
- Write composed parameters to a running engine ROM
- Play and evaluate feel

**Pass criteria:**
- The game feels "designed" — movement and enemies interact in satisfying ways
- Difficulty is reasonable (not impossible, not trivial)
- The ratio preservation heuristic produces sensible enemy-to-player speed relationships
- Joe plays it and doesn't feel like something is "off"

**Fail criteria:**
- Obvious mismatch (enemies impossibly fast relative to player, or trivially slow)
- Physics feel wrong (jump arc doesn't match gravity in a satisfying way)
- The "Frankenstein" feeling — pieces from different games are individually fine but don't cohere

**Cost:** $0 (parameter manipulation, runs locally)

**What we learn:** Whether cross-game parameter composition produces acceptable game feel. This validates or invalidates the core composition hypothesis.

#### Test 10: Composition Manifest → Running Game (End-to-End)

**What:** Write a complete Composition Manifest and have the system produce a running game from it.

**Setup:**
- Author a full manifest (like the 1940s France example above)
- System executes: select engine ROM → write composed parameters → generate all visual assets → quantize → inject → generate level data → inject → set CAS initial state
- Play the result

**Pass criteria:**
- A playable game emerges from the manifest
- Visual theme matches the brief
- Mechanical feel reflects the cluster authorities specified
- Level structure follows the specified grammar
- It feels like "a game" not "a tech demo"

**Fail criteria:**
- Pipeline breaks at any integration point
- Result is playable but incoherent (visuals don't match mechanics don't match level design)
- Total creation time exceeds 60 seconds (aspirational target: 10-15 seconds, but be realistic early)

**Cost:** ~$5-10 (full asset generation + multiple iteration cycles)

**What we learn:** Whether the architecture actually works end-to-end. This is the "Composition Proof" — the first time the full vision produces a running game.

**DECISION GATE:** If Tests 9-10 pass → core architecture validated. Proceed to CAS integration and polish. If Test 9 fails → composition heuristics need refinement (but the architecture is sound). If Test 10 fails → identify which subsystem failed and fix it.

---

### TIER 5: Living World Proof

Does the social ecology actually modify the running game?

#### Test 11: CAS → Emulator Modification Loop

**What:** Run the CAS engine, have it produce state changes, and see those changes reflected in the running game.

**Setup:**
- Initialize CAS with a simple social scenario (two factions, tension rising)
- Run CAS for several ticks
- At an episode boundary, Claude interprets the CAS state and produces modification directives
- Creative Controller translates directives to memory writes:
  - "Faction A demoralized" → enemy speed reduced by 20%, palette shifted toward desaturated
  - "Faction B emboldened" → new enemy type appears in previously empty patrol route
  - "Ally captured" → safe house zone now has enemies, door blocked

**Pass criteria:**
- CAS state changes produce visible, meaningful game modifications
- Palette shifts are instant and look good
- Behavioral modifications (enemy speed/aggression) are perceptible to the player
- Structural modifications (new enemies, blocked paths) work without breaking the level

**Fail criteria:**
- CAS-to-emulator translation produces no visible change
- Changes break the game (enemies in walls, player stuck)
- Changes are technically correct but imperceptible during gameplay

**Cost:** ~$1-3 (Claude interpretation calls + image model for any new visual assets)

**What we learn:** Whether the full CAS → Claude interpretation → Creative Controller → emulator write loop produces a "living world" experience.

---

### TIER 6: Product Proof

#### Test 12: Full Prompt-to-Play Pipeline

**What:** A human types a prompt and gets a playable, immersive game.

**Setup:**
- Build the minimum viable prompt-to-play pipeline connecting all subsystems
- Give it to 3-5 test players (friends, not Joe) with no context
- Prompts ranging from simple ("a platformer in space") to ambitious ("1940s France resistance")
- Measure: creation time, first impression, play duration, "would you play this again?"

**Pass criteria:**
- Games generate successfully >80% of the time
- First impressions are positive ("this is cool" not "this is broken")
- Players engage for >5 minutes on average
- At least one player asks "how does this work?"

**Fail criteria:**
- Generation fails frequently
- First impressions are negative
- Players quit within 1-2 minutes
- Nobody is curious about the technology

**Cost:** Variable (depends on how many test games)

**What we learn:** Whether the product vision lands with real humans. This is the ultimate validation.

---

## Part 4: Known Gaps & Open Questions

### Gaps Requiring Dedicated Work

| Gap | Description | When Needed | Effort Estimate |
|-----|------------|-------------|-----------------|
| Visual Inventory pipeline | Automated semantic classification of all tile/sprite groups per game | Before Test 5 | 1-2 sessions |
| Level format layer | Extending behavioral map to capture level data schemas | Before Test 7 | 2-3 sessions |
| Engine Capability Catalog | Structured docs of each engine ROM's mechanical affordances | Before Test 10 | 1 session per engine |
| Cross-cluster compatibility rules | Which cluster authority combinations work vs break | Before Test 10 | 1 design session |
| Transition/seam manager | Spec for how transitions between UI and emulator instances work | Before Test 10 | 1 session |
| Audio pipeline | Music/SFX generation or selection for themed games | Before Test 12 | 2-3 sessions |
| Composition quality evaluation | Automated testing of whether composed games are completable | Before scaling | 2-3 sessions |

### Open Questions (Answered by Testing)

1. Can image models produce sprite sheets with sufficient structural precision? (Test 1)
2. Does NES palette quantization destroy visual quality? (Test 2)
3. Can multi-asset generation maintain visual cohesion? (Test 4)
4. Can Claude reliably classify tile semantic roles? (Test 5)
5. Is level format identification tractable beyond SMB? (Test 7)
6. Does cross-game parameter composition feel "designed"? (Test 9)
7. Can the full pipeline fit in a 10-15 second creation budget? (Test 10)
8. Does CAS-driven modification produce perceptible "living world" effects? (Test 11)

### Architecture Risks

**Scope risk:** Each engine ROM is a new platform to support. Mitigate by focusing on ONE reference engine ROM end-to-end before expanding.

**Composition quality risk:** "Not broken" ≠ "feels authored." Mitigate with diagnostic framework and Joe taste-testing.

**Cost risk:** Image model API calls during development add up. Mitigate by validating with API first, then moving to local FLUX.2 klein 4B for iteration.

**Latency risk:** Full pipeline (LLM + image model + quantization + injection) might exceed creation time budget. Mitigate by parallelizing independent steps and profiling early.

### What's Deprioritized

- **Old jsnes-extractor.js pipeline (Sessions 10-18):** Superseded by behavioral map approach. Keep for reference but not on critical path.
- **Custom game engine (giants-drink.vercel.app):** Superseded by emulator-as-engine. May serve as prototyping tool but not primary renderer.
- **Ground truth library in old manifest format:** Valuable for parameter values but format may need updating. Audit later, don't rebuild now.
- **Sprite scraper / asset pipeline (Phase 0.75):** Partially superseded — image model generates visual assets rather than scraping/resolving existing ones. Scraped assets still useful as training data for potential LoRA fine-tuning and as reference for the Visual Inventory.

---

## Part 5: Recommended Execution Order

### Phase 0: Visual Pipeline Proof (Next 2-3 sessions)
- Tests 1-3
- Build: quantizer, CHR packer, injection test harness
- Decision gate: viable or need to rethink visual strategy

### Phase 1: Complete Visual Transformation (2-3 sessions)
- Tests 4-6
- Build: Visual Inventory pipeline, style anchor workflow, full reskin tooling
- Decision gate: complete reskin achievable at quality

### Phase 2: Structural Modification (2-3 sessions)
- Tests 7-8
- Build: level format documentation, level data generator, injection pipeline
- Decision gate: level generation viable

### Phase 3: Composition (2-3 sessions)
- Tests 9-10
- Build: Composition Manifest schema, parameter composition engine, Engine Capability Catalog for reference engine
- Decision gate: cross-game composition produces good game feel

### Phase 4: Living World (2-3 sessions)
- Test 11
- Build: CAS → Creative Controller → emulator write loop
- Decision gate: social ecology modifies game in meaningful ways

### Phase 5: Integration & Polish (3-5 sessions)
- Test 12
- Build: prompt-to-play pipeline, transition manager, audio (at least placeholder)
- Decision gate: real humans enjoy it

### Budget Estimate

| Category | Monthly | Notes |
|----------|---------|-------|
| Image model API (development/testing) | $20-50 | Heavy during visual pipeline work |
| Image model API (production) | $50-200 | Depends on usage volume |
| GPU rental (if needed for local model) | $50-150 | On-demand, not always-on |
| DeepSeek API (CAS dialog, runtime) | $15-50 | Very cheap per session |
| Claude API (composition, interpretation) | $50-100 | Anthropic credits available |
| **Total** | **$185-550/month** | Well within $1000 budget |
