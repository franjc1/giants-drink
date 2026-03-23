# SMCE (Sic Mundus Creatus Est) — Current Status

**Last updated:** 2026-03-22 (Thread 15: Rubber Meets Road — Visual Composition Breakthrough)

**Project rename:** Two Fires is now officially **SMCE** (Sic Mundus Creatus Est). Repo remains `giants-drink`. Internal shorthand: SMCE.

---

## What Just Happened (Thread 15)

### Session Focus: Where does rubber meet road for making games great?

This was the most important design session since the PixelLab breakthrough (Thread 13). The central question: now that we have PixelLab for visual ingredients and the Tire Principle for architecture, what SPECIFICALLY must be solved to make generated games genuinely great — not "technically functional" but "I'd actually play this"?

### The 26-Primitive Audit

Systematically mapped every place where quality can fail, organized by how fast a player notices:

- **Tier 1 (first 5 seconds):** Visual impression, game feel, camera, audio
- **Tier 2 (first 30 seconds):** Onboarding, enemy behavior, mechanical clarity, pacing
- **Tier 3 (first 5 minutes):** Difficulty curve, level design craft, progression, bosses, narrative
- **Tier 4 (sustained play):** Mechanical depth, variety, music, surprise, CAS coherence
- **Tier 5 (meta-layer):** CAS legibility, entity minds, meta-narrative, cross-game persistence
- **Infrastructure:** Generation time, cost, prompt fidelity, paradigm breadth

Classification: 0 fully validated, 12 tire-identified-needs-validation, 8 tire-needed, 4 can't-address-yet, 2 split-status.

### The Background Reframing (Critical Insight)

**Ran a PixelLab background stress test** — generated a full industrial/SNES scene with parallax layers, character, enemy, and decorative objects. Result: individual pixel art quality is SNES-caliber, but composition was terrible (dense repetitive wallpaper, no depth layering, no spatial variety).

**Key realization from analyzing real game screenshots** (Metal Man, Storm Eagle, SNES Mario, Turtles in Time, SF2, Mario Kart, Link to the Past):

> Backgrounds in great retro games are mostly EMPTY. The visual richness comes from the foreground tilemap — the platforms, walls, and terrain the player interacts with. Backgrounds provide atmosphere through simplicity and negative space.

**Gap A (backgrounds) dissolved into Gap B (level layout / tilemap composition).** The "background problem" was a misframing. The real problem is how tiles are arranged in a 2D grid — and that's the same problem as level design. Solving level design automatically solves visual composition because they're the same tilemap.

### Three Visual Situations Across Paradigms

1. **Tilemap-dominant (5/7 paradigms):** Platformer, top-down RPG, shmup, Mode 7, RTS. The tilemap IS the visual richness. Simple atmospheric backgrounds behind it.
2. **Scenic backdrop (partial, 2/7):** Beat-em-ups, some platformers. Simple play surface + themed scenic illustration behind it (3-5 illustrated elements composed with spatial intent).
3. **Stage illustration (fighting games only):** Flat floor + full background painting. The one paradigm where "generate a pretty background" is the actual problem.

### All 7 Paradigms Are Tilemap-Based

Detailed analysis of Mode 7, raycasting FPS, and RTS confirmed: every paradigm uses a 2D grid as its fundamental spatial data structure. Mode 7 is a top-down tilemap viewed through a perspective warp. Wolfenstein is a 2D wall grid with raycasting. RTS is a terrain tilemap with Wang tile transitions.

The Section Template Library feeds ALL paradigms. Unique per-paradigm work is in the renderer (Mode 7 warp, raycaster, etc.), not the visual assets or composition.

### 20 Grounded Visual/Design Principles

Identified and sourced 20 specific principles from:
- **CCST Framework** (Patrick Holleman, *Reverse Design: Super Mario World* — Routledge academic press)
- **Kishōtenketsu** (Nintendo's Koichi Hayashida, confirmed in GDC talks)
- **SLYNYRD Pixelblog** (Raymond Schlitter, 59 pixel art tutorials — practitioner methodology)
- **The Level Design Book** (Robert Yang et al. — open-source textbook grounded in architecture)
- **Visual design fundamentals** (hierarchy, contrast, negative space, shape language)

Principles organized into: Universal visual design (5), Pixel art-specific (5), Game visual composition (5), Level structure (5). All grounded in research or confirmed developer methodology, not intuition.

### Three-Layer Composition Model

For 90%+ hit rate on "looks and plays great":

1. **Layer 1: Sequencing** — What sections appear in what order. CCST + Kishōtenketsu + our sequencing grammar. Already specified.
2. **Layer 2: Section Templates** — Spatial skeleton for each section. Derived from real game levels. Proposed, needs building.
3. **Layer 3: Fill Patterns** — How tiles are actually placed within sections. Statistical distributions extracted from real game tilemaps. Needs research project.

The coupled constraint equations between fill variables (the "indeterminate equation" insight) ensure all solutions are in the "authored" zone. Set X (section type), Y (challenge configuration) is constrained, X+Y constrain Z (fill parameters), result is always good.

---

## Key Decisions Made This Session

| # | Decision | Summary |
|---|----------|---------|
| 110 | Gap A dissolved into Gap B | Backgrounds are not a separate problem; they're part of tilemap composition. PixelLab sufficient for ingredients. |
| 111 | Three visual situations model | Tilemap-dominant (5/7), scenic backdrop (partial 2/7), stage illustration (fighting only) |
| 112 | All paradigms are tilemap-based | Mode 7, raycasting, RTS all use 2D grids. Section Template Library feeds all 7 paradigms. |
| 113 | Three-layer composition model | Sequencing (grammar) → Section Templates (spatial skeleton) → Fill Patterns (empirical statistics) |
| 114 | 20 grounded principles framework | Visual and design principles sourced from CCST, Kishōtenketsu, SLYNYRD, Level Design Book. Not intuition. |
| 115 | Project officially renamed SMCE | Sic Mundus Creatus Est. Repo remains giants-drink. |
| 116 | Big Thing 1 = Gap B (composition), Big Thing 2 = CAS | Priority reframing: game quality through composition is the primary engineering challenge; CAS is secondary. |

---

## What's Next

### Immediate: Full Project Re-Orientation (Next Session — Thread 16)

The project plan (build-plan-v4) is stale. Sessions 1-14 explored and validated the visual pipeline (emulator-as-engine → ROM extraction → PixelLab pivot) and design architecture (CAS, agents, sequencing grammar). Thread 15 reframed the remaining work into "Big Thing 1" (composition/game quality) and "Big Thing 2" (CAS/social ecology).

Next session must produce:
- Revised project plan reflecting all Thread 10-15 learnings
- Clear session sequence for Big Thing 1 (composition system)
- Clear dependencies and placeholders for Big Thing 2 (CAS)
- Concrete next steps that can be executed in Claude Code sessions

### Big Thing 1: Tilemap Composition System (Gap B)

The core of making games great. Includes:
- Formalizing the 20 principles into implementable constraints
- Building the Section Template Library (per-paradigm templates derived from real games)
- The empirical research project: measure fill patterns from 20-30 real game tilemaps
- Building the fill pattern system that populates sections using extracted statistics
- Integrating with PixelLab tileset generation and Phaser rendering
- Validating end-to-end: does a composed level look and play great?

### Big Thing 2: CAS Social Ecology

The specs exist (CAS engine, entity minds, sequencing grammar, paradigm shift principles). Building this comes after Big Thing 1 proves the game foundation is solid.

### Other Gaps (from the 26-primitive audit)

- Game feel / juice layer (Gap C) — solvable with preset system, lower priority than composition
- Camera patterns (Gap D) — unaddressed, needed per-paradigm
- Fighting game stage illustrations — special case, after core composition system
- Music validation — Tone.js + ground truth patterns, unvalidated
- Mechanical Pattern Library — still needed for enemy behaviors, game mechanics systems

---

## Repo State

### New files from this session:

```
experiments/pixellab-bg-test/          — PixelLab background stress test
  index.html                           — Phaser scene (controls broken, visual test only)
  assets.html                          — Individual asset review page
  assets/                              — Generated PNGs (11 assets)
    bg-layer1-sky.png, bg-layer2-buildings.png, bg-layer3-machinery.png
    character-soldier-east.png, character-soldier-west.png
    enemy-drone-east.png, enemy-drone-west.png
    obj-crate.png, obj-pipe.png, obj-light.png, obj-conveyor.png
```

### Key docs needing update:
```
claude.md                              ← NEEDS UPDATE (Gap A/B reframing, 3-layer model, SMCE rename)
docs/decisions-log.md                  ← NEEDS UPDATE (decisions 110-116)
docs/design/build-plan-v4.md           ← NEEDS FULL REVISION (next session)
```

---

## Session Notes for Next Thread

- Thread 16 should be a PLANNING session, not a building session. Output = revised build plan + concrete session sequence.
- The project has gone through three major pivots (emulator-as-engine → ROM extraction → PixelLab + composition). Each was necessary and each narrowed the problem. We're now at the real problem: making composed tilemaps that look and play great.
- "Big Thing 1" (composition) and "Big Thing 2" (CAS) is the right high-level framing. Everything else is either solved (PixelLab, physics) or downstream (per-paradigm renderers, audio).
- The 20 principles need to be formally documented in a design spec — maybe `docs/design/composition-principles.md`. That's a Thread 16 deliverable.
- The empirical research project (measuring real game tilemaps) is the critical dependency for the fill pattern system. Without those numbers, we're guessing. With them, we have ground truth.
- Joe has lost the "wonderful sense of all specific steps" — Thread 16's primary job is restoring that clarity with a plan that accounts for everything learned.
