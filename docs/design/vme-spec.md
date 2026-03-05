# Two Fires — Visual Manifestation Engine Specification

**Thread 5 Deliverable | 2026-03-04**

---

## 1. Role in the Pipeline

The Visual Manifestation Engine (VME) sits between Claude's narrative interpretation of CAS state and the paradigm engine's renderer. It receives semantic-but-specific visual and audio directives from Claude and produces render-ready assets and compositions.

**Pipeline position:**

```
CAS engine ticks (deterministic JS)
  → CAS snapshot at episode boundary
  → Claude interpretation call
      (receives: CAS snapshot + previous narrative + drama signals + skeleton context)
      (produces: narrative update, behavioral directives, visual/audio directives, mechanical directives, faction leadership decisions)
  → Visual/audio directives → VME → render-ready assets + compositions
  → Mechanical directives → paradigm engine (physics, interactions, gameplay behavior)
  → Next episode renders with VME output + mechanical specs
```

**Claude produces two parallel output streams at each interpretation call:**

1. **Visual/audio directives** (consumed by VME) — what the player should see and hear has changed
2. **Mechanical directives** (consumed by paradigm engine / Game Compiler) — how new objects/entities behave, interact, and respond to physics

Novel interactive objects (a walrus launcher, a captured bomb you drag around, a vehicle you ride) require BOTH streams. The visual stream describes what it looks like in each state; the mechanical stream describes how it behaves. Neither system sees the other's directives. Claude is the only system that reasons about both.

**Design principle:** Claude speaks in semantic-but-specific directives (Approach B). Claude never specifies pixel coordinates, asset IDs, or hex color values. The VME never interprets narrative or makes creative judgments. Claude is the meaning-maker; the VME is the resolver.

---

## 2. The Semantic Scene Spec

The scene spec is an array of directives that Claude produces at each episode boundary. Claude may produce zero directives (nothing visually changed) or many (major faction war just erupted). Each directive has a type, type-specific content, and cross-cutting fields.

### 2.1 Seven Directive Types

---

#### Directive Type 1: Entity Visual Modifier

Changes how an existing entity or group of entities looks. The most common directive type — how CAS state becomes visible on characters.

**Eight primitives:**

| Primitive | What it does | Examples |
|-----------|-------------|----------|
| **Size** | Scale an entity larger or smaller | Faction grows powerful → entities appear larger and more imposing |
| **Color/palette** | Shift the color character of an entity | Corruption → dark purple tint; power-up → golden glow; faction allegiance shift → new faction colors |
| **Added element** | Attach something to or around the entity | Held weapon, floating status indicator (sweat drops, anger marks, hearts), worn accessory, status aura |
| **Removed element** | Strip something from the entity | Armor broken, crown removed, weapon lost, wings clipped |
| **Animation state** | Change how the entity moves/behaves visually | Limping, strutting, cowering, marching in formation, celebrating — behavioral legibility made visible |
| **Transparency/visibility** | Entity becomes more or less visible | Fading, ghostly, cloaked, solidifying, becoming more present |
| **Silhouette change** | The actual shape of the entity shifts | Hunched over, puffed up, deflated, stance change — modifying the entity's outline |
| **Entity replacement** | The entity's visual identity changes entirely (partial or full) | Werewolf transformation, transfiguration, possession, metamorphosis. Partial = mid-transformation hybrid. Full = new sprite entirely (may trigger Layer 3 generation) |

**Pose and gesture changes** (kneeling, holding a sign, arms raised, pointing) are expressed through combinations of these primitives — silhouette change for body posture, added element for held objects, animation state for gesture. There is no separate "pose" directive type.

---

#### Directive Type 2: Scene Composition

A composed visual moment from multiple elements arranged in a specific spatial relationship. The mushroom cloud over the fortress. A crowd of protestors in formation. A pile of defeated enemies.

**Five primitives:**

| Primitive | What it does | Examples |
|-----------|-------------|----------|
| **Elements** | What's in the composition — entities, objects, effects, each referencing existing assets or novel specs | Bob-omb + scaled-up explosion + smoke cloud; crowd of 12 foot clan entities + signs |
| **Spatial arrangement** | How elements relate to each other | Clustered, in formation, surrounding something, stacked vertically, foreground/background layering, circular, scattered |
| **Scale context** | What scale this composition exists at relative to normal gameplay | World map scale (fortress + mushroom cloud), episode scale (crowd in a street), cutscene scale (zoomed-in dramatic moment) |
| **Temporal nature** | Whether this is static or animated | Static tableau the player sees on arrival, animated sequence (cloud rising, crowd marching), looping ambient scene |
| **Trigger context** | When/where the player encounters this composition | Episode transition, entering a zone, world map view, cutscene, background event visible during gameplay |

---

#### Directive Type 3: Environment Modifier

Changes the visual character of a location, zone, or area. How faction territory and world regions reflect CAS state. Scope can be local (one faction's territory) or global (the entire game world).

**Six primitives:**

| Primitive | What it does | Examples |
|-----------|-------------|----------|
| **Palette shift** | The color character of an area changes | Desaturation for decay, warming for prosperity, cooling for danger, darkening for oppression, corruption tint |
| **Tile replacement** | Specific environment tiles swap to different variants | Intact building → ruined building, healthy trees → dead trees, clean streets → debris-covered, open gate → barricaded |
| **Added environmental detail** | New objects placed in the environment | Flags, barricades, propaganda posters, fortifications, litter, flowers, graffiti, surveillance equipment |
| **Removed environmental detail** | Things stripped from the environment | Banners torn down, structures demolished, vegetation cleared, decorations removed |
| **Lighting change** | Brightness, shadow, time-of-day feel | Localized darkness over oppressed territory, warm glow in prosperous zone, harsh overhead lighting in militarized area |
| **Weather/atmospheric** | Atmospheric conditions in a zone or globally | Rain, snow, dust, fog, ash, heat shimmer, pollen, smoke. Scope determines local vs. global |

---

#### Directive Type 4: Scene-Level Effect

Screen/camera-level visual behaviors. Distinct from environment modifiers — these operate on the display itself, not on any location or entity. Cinematographic, not environmental.

**Four primitives:**

| Primitive | What it does | Examples |
|-----------|-------------|----------|
| **Screen shake** | The viewport vibrates | Explosion impact, earthquake, massive entity footsteps, dramatic revelation |
| **Screen flash** | Brief full-screen color flash | White flash on detonation, red flash on damage, dramatic punctuation at narrative peak |
| **Transition effect** | Visual transition between states | Fade to black, wipe, dissolve, iris in/out, static burst for paradigm shifts |
| **UI-level overlay** | Persistent or semi-persistent screen overlay | Vignette darkening edges, scan line intensification, static/interference, color filter over entire view |

---

#### Directive Type 5: Novel Entity Spec

A character, object, or element that doesn't exist in the game-instance library and needs to be generated from scratch. Layer 3 territory.

**Six primitives:**

| Primitive | What it does | Examples |
|-----------|-------------|----------|
| **Distinguishing features** | The 3-5 visual traits that make this recognizable at retro resolution | Kenny Powers = mullet + sunglasses + baseball jersey. Uncle Baby Billy = white pompadour + suit + cross. Harry Potter = round glasses + lightning scar + robe |
| **Size class** | How big relative to the game's proportion grid | Small enemy, player-sized, large enemy, boss, massive background element, small collectible/projectile |
| **Palette constraints** | Color identity for this entity | Dominant colors, whether to match a faction palette, accent color, number of colors allowed (from Game Visual Identity) |
| **Style era reference** | What retro aesthetic to target | Inherited from the Artistic Director's game-level decision — NES early, NES late, SNES, Genesis, etc. |
| **Animation states needed** | What states this entity needs sprite frames for | idle, walking, attacking, defeated, in_flight, held_by_player, impact, detonating — context-dependent |
| **Role/archetype reference** | What existing game role this maps to mechanically | enemy-patrol, boss, NPC-friendly, NPC-hostile, item-pickup, projectile, vehicle, weapon-held, decoration. Informs proportions, visual conventions, placement expectations |

---

#### Directive Type 6: Text Content

Readable text that appears in the game world. CAS-driven situations where *what is written* matters.

**Four primitives:**

| Primitive | What it does | Examples |
|-----------|-------------|----------|
| **Text string** | The actual words | "DOWN WITH [PLAYER]", "VOTE KOOPA", "DANGER: RESTRICTED ZONE", entity name labels |
| **Display method** | How and where the text appears | Sign object (held or posted), banner, wall graffiti, carved/engraved surface, dialogue box, floating label, marquee |
| **Visual style** | Font character appropriate to context | Crude handwritten (protest sign), official/formal (decree), magical/glowing (enchantment), military stencil, pixel-clean (UI label) |
| **Language/legibility** | Whether the text is fully readable | Fully readable, partially obscured (damaged sign), degraded (ancient text), fictional script (suggestive but not literally readable) |

---

#### Directive Type 7: Audio/Music Modifier

Changes the sonic landscape in response to CAS state. Scope can be local (one faction's territory sounds different) or global (the entire game's audio character shifts).

**Six primitives:**

| Primitive | What it does | Examples |
|-----------|-------------|----------|
| **Tonal shift** | The emotional key of the music changes | Major → minor, consonant → dissonant, resolving → tense, hopeful → ominous |
| **Instrumentation change** | Add or remove musical voices/channels | Add ominous bass line, strip melody to bare pulse, introduce military drums, replace lead with solo instrument, add choir/chant |
| **Tempo change** | Speed of the music | Faster (urgency, excitement), slower (dread, weight), halting/irregular (instability, fear) |
| **Volume/dynamics** | Loudness and dynamic character | Crescendo, sudden silence, quieter (desolation), louder (chaos), dynamic compression (everything uniformly loud = tension) |
| **Sound effect trigger** | A specific one-shot sound tied to a narrative event | Explosion, crowd roar, alarm siren, distant thunder, glass breaking, cheer, scream |
| **Ambient texture** | Persistent background audio layer for a location | Factory machinery, wind, crowd murmur, dripping water, crackling fire, buzzing electricity, birdsong, silence-with-tension |

---

### 2.2 Cross-Cutting Fields

Every directive, regardless of type, carries these seven fields:

| Field | Purpose | Values |
|-------|---------|--------|
| **Target** | What entity, faction, location, or zone this applies to | Entity ID, faction ID, zone ID, "global", or a reference to a composed element |
| **Persistence** | How long this directive remains active | "permanent" (until explicitly replaced/removed by a future directive), "episode" (active for one episode only), "momentary" (a one-shot event — flash, shake, sound effect) |
| **Priority** | Conflict resolution when multiple directives compete for the same target | "critical" (override everything), "high", "normal", "low", "ambient" (yield to everything). Higher-priority directive wins on conflict. |
| **Narrative context** | Claude's natural language explanation of why this change exists | Free text. Used for Artistic Director coherence checks and debugging. Not consumed by the renderer. |
| **Timing/sequencing** | When this directive manifests relative to other directives in the same batch | Group ID (directives sharing a group manifest simultaneously) + sequence order (directives in different groups manifest in sequence). Ungrouped directives manifest immediately. |
| **Intensity/magnitude** | How dramatic the change is | Semantic scale: "subtle", "moderate", "dramatic", "extreme". The VME resolves these to specific parameter values. |
| **Layering behavior** | Whether this directive adds to or replaces previous directives on the same target | "additive" (stacks with existing directives — rain + darkness accumulate), "replacement" (overrides the most recent directive of the same primitive type on this target — new palette shift replaces old palette shift) |

---

### 2.3 The Directive Stack Model

The VME maintains a **directive stack per target** — every entity, faction, zone, and global scope has an ordered list of active directives affecting it.

**Key rules:**

- **Claude is the only system that modifies the stack.** Directives are added when Claude produces them. Directives are removed only when Claude explicitly issues a counter-directive, or when their persistence expires (episode directives clear at episode boundary, momentary directives clear after execution).
- **Nothing auto-reverts.** If a faction's territory was darkened in episode 3, it stays dark until Claude issues a brightening directive. This keeps Claude as the sole meaning-maker — the VME never decides that a CAS state change should undo a visual change.
- **Additive directives accumulate.** Rain + darkness + debris all stack on the same zone. The VME composites them in priority order.
- **Replacement directives replace only their own primitive type.** A new palette shift replaces the old palette shift, but doesn't touch the rain or debris directives. This prevents unintended side effects.
- **Priority resolves conflicts.** If two factions claim the same zone's palette, the higher-priority directive wins. In a tie, the more recent directive wins.
- **The stack is serializable.** It can be saved as part of the game state and restored on reload. The VME's visual state is fully deterministic given its directive stack.

---

## 3. Three-Layer Capability Model

When a directive arrives, the VME routes it to the cheapest/fastest layer capable of fulfilling it. Always try Layer 1 first, escalate only when necessary.

### Layer 1 — Compositional Variation

**What it is:** Programmatic canvas operations on sprites and assets already in the game-instance library. No new pixel content is created. No AI calls.

**Operations available:**

| Operation | What it does | Limits |
|-----------|-------------|--------|
| **Scaling** | Render sprite larger/smaller via nearest-neighbor interpolation | Beyond ~3x gets obviously blocky; below ~50% loses readability |
| **Palette remapping** | Swap colors in a sprite to a different palette set | Can target specific colors or remap entire palette. Trivially fast |
| **Compositing** | Layer multiple sprites/effects together with z-ordering | Entity + held object, entity + status overlay, entity + particle behind/in front |
| **Flipping/rotation** | Mirror horizontally/vertically, rotate in 90° increments | Only 90° increments — arbitrary rotation looks wrong in pixel art |
| **Tiling/repetition** | Repeat a sprite/tile in patterns to fill areas | Barricades from blocks, debris fields, crowd duplication |
| **Opacity/blending** | Semi-transparent rendering, additive blending (glow), multiplicative blending (shadow) | Ghostly, glowing, darkened, highlighted effects |
| **Color shifting** | Global hue/saturation/brightness adjustment on a sprite or tile region | Desaturation, warm shift, cool shift. Mathematical, not palette-specific |
| **Positional composition** | Place sprites in spatial arrangements | Crowd formation, piles, environmental decoration placement |

**Handles:** ~40-50% of runtime VME directives. All Entity Visual Modifier primitives except entity replacement (when the replacement target is already in the library, even this is Layer 1). Most Environment Modifiers. All Scene-Level Effects. All Scene Compositions using existing assets.

**Cost:** Zero AI cost. Pure rendering code. Instantaneous.

---

### Layer 2 — Sprite Variant Generation

**What it is:** Creating new pixel content by modifying sprites that already exist in the game-instance library. The base sprite provides most of the visual information; Layer 2 edits it.

**Operations available:**

| Operation | What it does | Method |
|-----------|-------------|--------|
| **Pose adjustment** | Shift clusters of pixels within a sprite to new positions — standing → kneeling, upright → slumped | Programmatic for simple/templated poses; AI-assisted for complex/novel poses |
| **Held object insertion** | Add an object to an entity sprite with appropriate arm/hand positioning | Programmatic when object comes from library; AI-assisted when arm repositioning is needed |
| **Integrated status overlay** | Status indicators that follow sprite anatomy — cracks along the shape, bandages in right places, sweat at forehead level | AI-assisted (needs to understand sprite anatomy) |
| **Partial transformation** | Modify a portion of the sprite — corruption spreading, ice forming, mechanical replacement | AI-assisted (novel pixel content shaped by existing sprite) |
| **Pixel text rendering** | Generate readable text at retro resolution respecting the game's visual identity | Programmatic (bitmap font rendering matched to era) |
| **Expression/face change** | Modify the face region of sprites large enough to have distinguishable features (~24x24+) | AI-assisted for novel expressions; programmatic for simple eye/mouth swaps |

**Routing between programmatic and AI-assisted:**

Layer 2 uses **programmatic manipulation for common/simple cases** (pixel text, basic overlays, templated pose changes, simple composites) and **AI-assisted editing for complex cases** (novel poses, partial transformations, anatomy-aware overlays). The boundary is tuned during development — start conservative (send more to AI), gradually migrate operations to programmatic as rules prove reliable.

**Handles:** ~30-40% of runtime VME directives. Primarily Entity Visual Modifier directives that require new visual states not achievable through Layer 1 canvas operations alone.

**Cost:** Programmatic operations are instant and free. AI-assisted operations require an API call (~0.5-2s, low token count). Budget for Layer 2 AI calls during the between-episode generation window.

---

### Layer 3 — Novel Asset Generation

**What it is:** Generating entirely new sprites, tilesets, and visual assets from scratch. Every pixel is new. Constrained by the Game Visual Identity system (see Section 4).

**When it runs:**

| Timing | Use case | Time budget |
|--------|----------|-------------|
| **Game creation** (common) | All entities, environments, collectibles, weapons, bosses for a Track B game | Part of the 10-15s skeleton generation. Generates 15-30+ sprite sheets + environment tiles |
| **Runtime** (rare) | CAS produces entity transformation, completely novel object, or paradigm shift requiring new visual context | Must fit within between-episode generation window alongside episode content generation |

**Inputs required:**

1. **Game Visual Identity** (see Section 4) — the complete visual system specification for this game instance
2. **Novel Entity Spec** (directive type 5) — distinguishing features, size class, palette constraints, style era, animation states, role/archetype
3. **Existing entity roster** — silhouettes of all entities already generated for this game (for distinctiveness checking)
4. **Role convention data** — distributional constraints from ingestion library analysis for this entity's role in this era/paradigm

**Output:** A complete sprite sheet — all required animation states, at correct dimensions from the proportion grid, using only colors from the palette architecture, at correct detail density. Ready to enter the game-instance library. From that point, the VME treats it identically to any other library asset.

**Quality gates (every Layer 3 output must pass):**

- Palette compliance — only uses colors from the Game Visual Identity
- Proportion compliance — correct dimensions for its role on the proportion grid
- Detail density compliance — consistent with the rest of the game's assets
- Silhouette distinctiveness — readable and distinct from all existing entities at target resolution
- Animation consistency — frame count matches the animation budget

Failures trigger regeneration. Fast-fail at the asset level.

**Game-instance library as cache:** Once Layer 3 generates an asset, it lives in the library for the rest of the game. Every subsequent use is a Layer 1 operation. A walrus projectile generated once can be rendered 100 times per episode at zero additional generation cost.

**Cost:** AI image generation per asset. Highest cost of the three layers. Justified because it runs primarily at game creation time (amortized across the full play session) and rarely at runtime.

---

## 4. Game Visual Identity System (Track B Architecture)

### The Problem

Track A games use ingested assets from real retro games — natural visual cohesion because one art team made them. Track B games generate all assets — risk of visual incoherence where each sprite looks like it came from a different game.

### The Solution

Don't generate individual assets. **Generate a visual system, then generate assets within that system.**

Before any sprite is generated, Track B produces a **Game Visual Identity** — a complete specification of the visual rules for this specific game instance. Every asset generated for the game is generated under this identity, guaranteeing cohesion the same way a real art team's shared style guide guarantees cohesion.

### Game Visual Identity Components

**Palette architecture.** The specific master palette for this game — ~20-25 total colors. Organized into: primary palette (player, key NPCs), secondary palettes (enemies per faction, environment per zone), accent colors (collectibles, UI, danger signals). Generated from the Artistic Director's aesthetic direction, constrained by ingestion-derived distributions for the target era/platform.

**Proportion grid.** Exact pixel dimensions for every entity role in this game. Player character, small enemy, large enemy, boss, collectible, tile, door, projectile — all specified. Derived from ingestion analysis of the target era and paradigm, then instantiated for this game. Once set, every asset respects the grid.

**Detail density rules.** How much visual information per pixel area. Single-pixel eyes or 2x2? Outlines or no outlines? How many interior detail colors? This is one of the biggest cohesion killers when inconsistent — a highly detailed player character next to a simple enemy looks like a collage.

**Animation budget.** Exactly how many frames each action type gets. Idle: N frames. Walk: N frames. Jump: N ascending + N descending. Attack: N frames. Death: N frames. Derived from target era (NES has tighter budgets than SNES). Every entity follows the same budget.

**Visual shorthand dictionary.** How this game communicates concepts visually. Danger = spikes/red/flashing. Collectible = bright/small/bouncing. Friendly NPC = larger/static/facing player. Impassable = dark/heavy/textured. Derived from paradigm conventions, customized per game.

**Silhouette distinctiveness rules.** Every entity must be identifiable by silhouette alone at target resolution. The generation system checks each new entity's silhouette against all existing entities in this game. Enforced via height ratios, width ratios, asymmetry, distinctive features.

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

**Platform/genre-level aesthetic tendencies:**
- Genesis: higher contrast, more saturated than NES
- SNES RPGs: softer gradients within tiles than SNES platformers
- NES late era: more sophisticated palette usage than NES early
- These are stylistic patterns across bodies of work, not properties of any single game

**The legal principle:** Copyright protects specific pixel arrangements (expression). It does not protect distributional knowledge, relational constraints, or aesthetic tendencies (facts/ideas). The ingestion library's value is extracted as design knowledge, never as pixel data. Every asset Track B produces is novel. Cohesion comes from the system, not from copying.

### Generation Pipeline

```
1. Artistic Director sets aesthetic direction
     (mood, era, influences — semantic level)
2. Game Visual Identity generator instantiates complete visual system
     (palette architecture + proportion grid + detail density + animation budget
      + visual shorthand + silhouette rules)
     Constrained by: Artistic Director direction
                   + ingestion-derived distributions for target era/paradigm
3. Every individual asset generated WITHIN the identity
     (constrained by all identity components)
4. Coherence validator checks each asset against identity
     (reject and regenerate on violation)
5. Complete asset set enters game-instance library
     (VME treats identically to Track A from this point)
```

### Track A vs Track B Convergence

By the time the VME applies directives at episode boundaries, both tracks are identical. The game-instance library contains sprites either way — Track A populated it from ingestion lookup, Track B populated it from identity-constrained generation. The VME's Layer 1 operations, Layer 2 modifications, and directive stack all work the same regardless of asset origin.

The `ASSET_MODE` toggle controls only the initial library population step. Everything downstream is track-agnostic.

---

## 5. Architectural Notes

### VME Does Not Make Creative Decisions

The VME is a mechanical resolver, not a creative system. It does not decide what should change — Claude decides that. It does not evaluate whether a change is narratively appropriate — the Artistic Director does that. The VME routes directives to the cheapest capable layer, executes the rendering operations, and validates the output against the Game Visual Identity.

### Runtime Cost Profile

| Operation | When | Cost | Frequency |
|-----------|------|------|-----------|
| Layer 1 canvas operations | Per episode render | Zero AI cost, milliseconds | Every episode, many operations |
| Layer 2 programmatic edits | Between-episode window | Zero AI cost, milliseconds | Common |
| Layer 2 AI-assisted edits | Between-episode window | 1 API call per edit, ~0.5-2s | Occasional |
| Layer 3 novel generation | Game creation or between-episode | 1 API call per asset, ~1-5s | Rare at runtime; bulk at creation |
| Claude interpretation producing directives | Episode boundary | 1 API call (already happening for CAS interpretation) | Every episode boundary |

### What This Spec Does NOT Cover (Deferred to Implementation)

- **Specific retro visual effects library** — the exact implementation of glow, particle, shadow, weather effects. These emerge from what looks good on canvas during Phase 1-3 development.
- **Cutscene staging logic** — how Scene Compositions with temporal nature are sequenced and rendered. Depends on the rendering core built in Phase 1.
- **Artistic Director validation rules** — the specific coherence checks. These emerge from the diagnostic framework and Living Taste Document.
- **Exact Layer 2 programmatic vs. AI-assisted boundary** — tuned during development based on which operations prove reliable as rule-based systems.
- **Audio system implementation** — the chiptune synthesizer and music engine that resolves Audio/Music Modifier directives. Covered in Phase 3 (Aesthetics).

---

## 6. Relationship to Other Specifications

| Document | Relationship |
|----------|-------------|
| `claude.md` | VME is referenced in the runtime loop. This spec fills in its internal architecture. |
| `game-state-schema.md` | The directive stack is serializable game state. Schema needs a `vme_state` section. |
| `cas-engine-spec.md` | CAS produces the state that Claude interprets into VME directives. No direct CAS → VME connection. |
| `asset-resolution-strategy.md` | Track A/B toggle determines how the game-instance library is populated. The Game Visual Identity system is the Track B elaboration. Asset resolution strategy document should be updated to reference this spec. |
| `paradigm-specs.md` | Paradigm specs may define paradigm-specific VME conventions (e.g., how racing games handle environmental modifiers differently than platformers). |
| `diagnostic-framework.md` | NC4 (visual coherence) evaluates VME output quality. Gate 2 clip for visual coherence should capture before/after of VME directive application. |
