# Decisions Log — Thread 15 Additions

**Append these to the existing decisions-log.md after the last entry (Decision 109).**

---

## Thread 15 — Rubber Meets Road: Visual Composition Breakthrough (2026-03-22)

### Decision 110: Gap A (Backgrounds) Dissolved Into Gap B (Tilemap Composition)

**Context:** PixelLab background stress test generated an industrial SNES-style scene. Individual pixel art quality was SNES-caliber, but the composed scene was terrible — dense repetitive wallpaper with no depth layering or spatial variety. Analysis of real game screenshots (Metal Man, Storm Eagle, SNES Mario, Turtles in Time, SF2, Mario Kart, Link to the Past) revealed that backgrounds in great retro games are mostly empty. The visual richness comes from the foreground tilemap, not background layers.

**Decision:** Backgrounds are not a separate problem to solve. They are part of the tilemap composition problem. PixelLab is sufficient for generating visual ingredients (tiles, sprites, objects, textures). The unsolved challenge is how tiles are arranged in a 2D grid to create levels that look authored and play well. This is Gap B (level layout / tilemap composition), and solving it automatically solves visual composition.

**Rationale:** The PixelLab test proved ingredients are good but composition is bad. Real game analysis proved that great games achieve visual quality through tilemap composition, not through elaborate background images. Reframing backgrounds as "part of composition" rather than "a separate visual pipeline problem" eliminates a whole category of work and focuses effort on the actual bottleneck.

---

### Decision 111: Three Visual Situations Model

**Context:** Pressure-testing the "backgrounds are mostly empty" claim against diverse examples: Turtles in Time (sewer + pirate ship), SF2 (Sagat's stage), Mario Kart, Link to the Past overworld.

**Decision:** Three distinct visual situations exist across paradigms:

1. **Tilemap-dominant (5/7 paradigms):** Platformer, top-down RPG, shmup, Mode 7/racing, RTS. The tilemap carries 80-100% of visual weight. Background is empty, gradient, or simple atmospheric layer.
2. **Scenic backdrop (partial, 2/7):** Beat-em-ups, some platformers (e.g., Turtles pirate ship level). Simple play surface + themed scenic illustration (3-5 illustrated elements composed behind the tilemap).
3. **Stage illustration (fighting games only):** Flat floor + full composed background painting. The only paradigm where background generation is the primary visual challenge.

**Rationale:** Different paradigms have genuinely different visual requirements. A one-size-fits-all "background pipeline" would over-engineer for most paradigms (which need almost no background) while under-delivering for fighting games (which need full scene composition). The three-situation model allocates effort correctly.

---

### Decision 112: All 7 Paradigm Clusters Are Tilemap-Based

**Context:** Needed to determine whether the composition system being designed for platformers would extend to Mode 7 racing, raycasting FPS, and RTS — or whether those paradigms need fundamentally different approaches.

**Decision:** All 7 paradigm clusters use a 2D grid as their fundamental spatial data structure:

- Mode 7 (Mario Kart, F-Zero): A top-down tilemap viewed through a per-scanline perspective warp. Track surfaces, terrain types, all in a 2D grid.
- Raycasting FPS (Wolfenstein, Doom): A 2D grid where cells are wall types. The raycaster projects this 2D data into a first-person view.
- RTS (Warcraft 2, StarCraft): A terrain tilemap with Wang tile transitions, buildings as multi-tile objects, units as sprites.

The Section Template Library feeds all paradigms. Unique per-paradigm work is in the renderer (Mode 7 warp, raycaster, pathfinding), not in visual assets or composition methodology.

**Rationale:** This was validated by technical analysis of how each paradigm's renderer actually works. Mode 7 is an affine transformation of a 128×128 tilemap. Wolfenstein casts rays through a 2D grid. RTS maps are literally tilemaps. The composition problem is universal; only the camera/renderer differs.

---

### Decision 113: Three-Layer Composition Model for 90%+ Hit Rate

**Context:** Need a systematic approach to tilemap composition that produces authored-looking results consistently, not just occasionally. Inspired by the "indeterminate equation" insight: a system of coupled constraints where many valid solutions exist (all good) but the constraint system excludes bad solutions.

**Decision:** Three-layer composition model:

1. **Layer 1 — Sequencing:** What sections appear in what order. Uses existing sequencing grammar (teachability, rhythm, directionality) + CCST framework + Kishōtenketsu structure. Claude handles this layer.
2. **Layer 2 — Section Templates:** Spatial skeleton for each section type. A grid with typed zones (ground, cover, enemy spawn, decoration). Derived from real game levels. 10-20 templates per paradigm. This is the proposed Section Template Library.
3. **Layer 3 — Fill Patterns:** How tiles are actually placed within each zone. Statistical distributions extracted from real game tilemaps — variant frequency, feature clustering, density distribution, transition gradient width, negative space ratio. Deterministic system that executes fill rules, not Claude generating individual tiles.

Layers constrain each other like an indeterminate equation: setting section type constrains challenge configuration, which constrains fill parameters, and all solutions within the constraint surface are "authored-quality."

**Rationale:** Templates alone are insufficient (they give skeleton but not texture). Fill patterns alone are insufficient (they give texture but not structure). The three layers correspond to macro (level flow), meso (section design), and micro (tile-level composition). Each layer has a different "tire": the grammar for Layer 1, the template library for Layer 2, and empirical statistics for Layer 3.

---

### Decision 114: 20 Grounded Principles as Composition Constraints

**Context:** Needed to ensure the composition system is grounded in actual design knowledge, not Claude's intuition or vague approximations. Searched for rigorous frameworks in visual design, pixel art methodology, and game-specific level design research.

**Decision:** Identified and sourced 20 specific principles organized into four categories:

**Universal visual design (5):** Visual hierarchy, contrast as primary tool, negative space, repetition with variation, rule of thirds.

**Pixel art-specific (5):** Texture balance within tiles, contrast management between adjacent textures, grid-breaking through variants, depth through edge lighting, mixed tile sizes break monotony. (Source: SLYNYRD Pixelblog series)

**Game visual composition (5):** Readability, shape language, color-coded function, environmental storytelling through detail clustering, theme mesh. (Sources: Level Design Book, SLYNYRD, GDC practitioner talks)

**Level structure (5):** CCST challenges/cadences/skill themes, Kishōtenketsu four-step structure, teach through consequence, expansion by contraction, spot-check gating. (Sources: Holleman *Reverse Design*, Hayashida GDC talks)

Each principle must be formalized as an implementable constraint in the composition system. This is a Thread 16 deliverable.

**Rationale:** "Vibes = slop, ground truth = gold" applies to design principles as much as to physics parameters. These 20 principles are grounded in published research, confirmed developer methodology, or rigorous practitioner documentation — not in Claude's general knowledge of "what makes games good."

---

### Decision 115: Project Officially Renamed SMCE (Sic Mundus Creatus Est)

**Context:** Joe renamed the project. Internal shorthand: SMCE. Repo remains `giants-drink`.

**Decision:** All future documents, sessions, and references use SMCE as the project name. "Two Fires" remains as the lore concept (the stolen cosmic fires in the meta-narrative). The repo name `giants-drink` is unchanged.

**Rationale:** Joe's call. The name reflects the project's deeper ambition.

---

### Decision 116: Big Thing 1 = Gap B (Composition), Big Thing 2 = CAS

**Context:** After the 26-primitive audit and the background reframing, the remaining project work crystallized into two major categories: (1) making the core game experience great through tilemap composition, level design, mechanics, and visual quality; (2) adding the CAS social ecology layer on top of that great foundation.

**Decision:** Reframe the project's remaining arc as two "big things":

- **Big Thing 1:** Gap B — Tilemap composition system, Section Template Library, fill patterns, mechanical patterns, game feel. Everything needed to generate games that look and play great WITHOUT the CAS.
- **Big Thing 2:** CAS — Social ecology engine, entity minds, meta-narrative, Overseer. The layer that makes SMCE unique beyond being a great game generator.

Big Thing 1 must be solid before Big Thing 2 can land. A great CAS on top of a mediocre game feels gimmicky. A great game foundation makes the CAS feel magical.

**Rationale:** The social ecology requires cognitive bandwidth from the player to perceive and engage with. If the player is distracted by bad level design, dead movement feel, or ugly composition, the CAS is wasted. The SNES Comfort Model (Decision 45) already established this — the game must respect the player's time and attention so they have bandwidth for the social layer.
