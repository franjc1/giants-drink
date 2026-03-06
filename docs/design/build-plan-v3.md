# Two Fires — Build Plan v3
## Updated for Thread 9 Agent Consolidation

**Last updated:** 2026-03-05

---

## What Changed (v2 → v3)

v2 threaded the Diagnostic & Tuning Framework through all phases. v3 updates Phase 2 to reflect Thread 9's agent consolidation (Designer + Builder + Validator replaces 8 separate agents) and incorporates Thread 5 VME spec, Thread 7 entity population architecture, Thread 8 paradigm shift principles, and Thread 9 SNES Comfort Model + level construction architecture.

Net session count unchanged (45). Phase 2 engineering complexity reduced; Phase 1 gains SNES Comfort Model defaults and Validator specification.

Read alongside: `claude.md` (architectural blueprint), `docs/design/game-state-schema.md` (reconciled schema), `docs/design/cas-engine-spec.md` (two-layer CAS), `docs/design/vme-spec.md` (visual manifestation engine), `docs/design/entity-minds-spec.md` (entity population + conversations), `docs/design/sequencing-grammar-framework.md` (intermediate layer), `docs/design/paradigm-shift-principles.md` (Phase 7 constraint document).

---

## Phase Overview

| Phase | Sessions | Focus | Diagnostic Additions |
|-------|----------|-------|---------------------|
| 0 | 1 | Environment Setup ✅ | — |
| 0.5 | ongoing | Asset Ingestion ✅ | — |
| 1 | 2-8 | Paradigm Engine | Simulated Player, Moment Extractor v1, Testing UI v1, Gate 1 |
| 2 | 9-12 | Experience Intelligence | Full Gate 2/3, Diagnostician, Stress-Tester v1, Distiller v1, Dashboard v1 |
| 3 | 13-16 | Aesthetics **→ DEMO 1** | Aesthetic INUS evaluation |
| 4 | 17-21 | Quality | Distiller v2, Stress-Tester v2, A/B mode, Taste Document |
| 5 | 22-26 | Entity Minds **→ DEMO 2** | Social clips + NC6 candidate |
| 6 | 27-33 | Social Ecology | CAS Monte Carlo, faction diagnostics |
| 7 | 34-38 | Genre Transformation | Genre shift evaluation |
| 8 | 39-45 | Game Mind & Overseer **→ DEMO 3** | Overseer diagnostics, full regression |

---

## Phase 1: Paradigm Engine (Sessions 2-8)

### Game Systems
- Core game loop + canvas rendering
- Entity system (player, enemies, items, environment)
- Input manager (keyboard, mobile future-proofed)
- Collision detection
- Physics parameter table with easing curves (JSON-driven), including SNES Comfort Model defaults (Decision 53): checkpoint frequency, death cost (time only), enemy telegraph timing (400-600ms), coyote time, teachability zone spacing
- First rendering core: 2D tile-based with configurable camera (Side-View Tile World engine cluster)
- JSON-to-game machine (reads reconciled GameState schema)
- Asset Resolver module with `ASSET_MODE` toggle (Track A: lookup, Track B: placeholder rectangles)
- **Validator** — deterministic pathfinding, reachability analysis, timing verification, teachability arc completeness checks, softlock detection. No Claude calls. Reads vocabulary_record for cumulative tracking.
- Level sequence / vocabulary record field in game config schema

### Diagnostic Systems (Sessions 7-8)
- **Simulated Player Agent** — pathfinding, timeline recording, death logging, element encounters
- **Moment Extractor v1** — clips NC1 (opening 3s), NC2 (physics character 5s), NC4 (visual pan 8-12s)
- **Testing UI v1** — card-based React app, 3 clips per game, 👎/👍/🔥 + text, fast-fail
- **Gate 1 auto-checks** — runs, spawns, assets resolve, latency < 50ms, completable, schema valid

### Joe's Workflow
Hand-author GameState JSON → Validator checks → auto-checks → 3 clips in ~20s → rate. Holistic playthroughs for first 5-10 games.

### First Milestone
Hand-authored GameState JSON → playable platformer level with SNES-grade forgiveness, auto-validated, diagnostic clips for Joe's review.

---

## Phase 2: Experience Intelligence (Sessions 9-12)

### Game Systems
**Pre-game pipeline:** Experience Interpreter → Artistic Director → Game Visual Identity generator (Track B) → Design Philosopher → Game Compiler (CAS initial conditions, social graph topology, personality distributions, social timer pace, drama calibration, skeleton instantiation, social hook placement, initial narrative, knowledge distribution pipeline, population template generation, named entity individuation, SNES Comfort Model forgiveness parameters).

**Per-episode construction pipeline:** Game Compiler produces Episode Brief → **Designer** produces Episode Vision (with game-type taste profile) → **Builder** constructs sections (Claude, Sonnet-level; integrated vocabulary + rhythm + spatial) → **Validator** checks feasibility → Designer evaluates taste → retry loop if rejected → Episode served; vocabulary record updated.

**Pre-Phase 2 design work required:**
- Extend each paradigm spec with full-game structural grammar
- Build game-type taste profiles from ingestion pipeline data (quality-weighted)
- Begin design move library extraction from ingestion data
- Bootstrap Living Taste Document with initial criteria

### Diagnostic Systems
- **Moment Extractor v2** — adds NC3 (teachability 10-20s), NC5 (rhythm 15-30s), INUS-1 (Designer signature moment 10-15s), INUS-2 (aesthetic personality, reuses NC4)
- **Comparative Diagnostician** — same prompt 5-10x, consistency/variance/erratic report
- **Archetype Stress-Tester v1** — 10-15 prompts per paradigm, auto-runs on changes, regression detection
- **Pattern Distiller v1** — accumulates ratings, proposes principles after 10-15 ratings
- **Testing UI v2** — all NC + INUS clips, Generate mode, session summaries, Principles tab

### Joe's Workflow
Prompt → auto-checks → Gate 2 clips (5 NCs, ~30-45s) → Gate 3 clips (2 INUS, ~30s) → rate → principles review. 15-20 games per 20-min session.

---

## Phase 3: Aesthetics (Sessions 13-16)

### Game Systems
WebGL shader pipeline. Chiptune synthesizer. Music styling. Asset knowledge base. VME Layer 1 + Layer 2 implementation. Game Visual Identity system for Track B asset generation. Track B sprite generation from semantic specs.

### Diagnostic Additions
- INUS-2 aesthetic personality now evaluates shaders + audio + palette + VME directive output
- Stress-Tester adds aesthetic prompts ("melancholy palette," "neon arcade," "Game Boy green")

**→ POST FIRST DEMO**

---

## Phase 4: Quality (Sessions 17-21)

### Diagnostic Maturation (this phase's primary focus)
- **Pattern Distiller v2** — parameter correlation, effectiveness tracking, ineffective principle flagging
- **Archetype Stress-Tester v2** — 30+ prompts per paradigm, full regression suite, variance analysis
- **A/B Comparison Mode** — side-by-side variants, preference as additional Distiller signal
- **Taste Document v1** — formalized, versioned, integrated into Designer prompts and taste profiles
- Designer Episode Vision quality tuning
- Builder construction quality tuning
- Game-type taste profile calibration

---

## Phase 5: Entity Minds (Sessions 22-26)

### Game Systems
Conversation API structure (multi-turn Claude calls with entity system prompt + dynamic context). Player exchange budget UI. Population entity → named entity runtime promotion. Post-conversation CAS event processing. Emissary delegation mechanics. Communication willingness as CAS-responsive value.

### Diagnostic Additions
- **NC6 candidate: Social Legibility** — can player tell entities have dispositions without being told?
- **INUS-3:** Social hook clips (first entity interaction)
- **INUS-5:** Entity behavior clips (unprompted action from Claude interpretation)
- Stress-Tester adds social prompts ("entities distrust player," "three factions in tension")

**→ POST SECOND DEMO**

---

## Phase 6: Social Ecology (Sessions 27-33)

### Game Systems
CAS engine implementation (two-layer: deterministic JS + Claude interpretation). Five event categories, affect contagion, information propagation, bond dynamics, faction aggregates, drama density tracking, attribution mechanism. Knowledge distribution pipeline. Claude multi-scale interpretation at episode boundaries.

### Diagnostic Additions
- **CAS Monte Carlo** — 1000 runs per prompt, distribution analysis
- **INUS-6:** CAS responsiveness (consequences of player actions feel real)
- Claude interpretation evaluation (adapts? contextual? consistent?)

---

## Phase 7: Genre Transformation (Sessions 34-38)

### Game Systems
Mid-game paradigm switching governed by paradigm shift principles (Thread 8): shifts are consequences not requests, CAS state carries over completely, identity persists while capability transforms, transitions are narrative moments at episode boundaries. Intra-cluster shifts (parameter swap) and cross-cluster shifts (rendering core switch). Shift fitness evaluation.

### Diagnostic Additions
- **INUS-7:** Genre shift feels earned (clip: shift moment + 10s before/after)
- Cross-paradigm Stress-Tester prompts ("start platformer, build army")
- Verify NCs hold in new paradigm post-shift

---

## Phase 8: Game Mind & Overseer (Sessions 39-45)

### Game Systems
Behavioral monitoring, post-game reading, Overseer system (escalation keyed to model confidence, not game count), VME Layer 3 for novel asset generation, polish.

### Diagnostic Additions
- **INUS-8:** Overseer presence (multi-game evaluation sessions)
- Post-game reading evaluation (insightful vs. generic)
- Full pipeline regression (complete Stress-Tester battery, all conditions)

**→ POST FINAL DEMO**

---

## Infrastructure Timeline

| Component | Built | Matures |
|-----------|-------|---------|
| Simulated Player | Phase 1 | Phase 2 |
| Moment Extractor | Phase 1 (v1) | Phase 2 (v2), Phase 5 (social) |
| Testing UI | Phase 1 (skeleton) | Phase 2 (dashboard), Phase 4 (A/B) |
| Gate 1 Auto-Checks | Phase 1 | Phase 2 |
| Validator | Phase 1 | Phase 2 (full vocabulary tracking) |
| Comparative Diagnostician | Phase 2 | Phase 4 |
| Stress-Tester | Phase 2 (v1) | Phase 4 (v2) |
| Pattern Distiller | Phase 2 (v1) | Phase 4 (v2) |
| Taste Document | Phase 2 (informal) | Phase 4 (formal) |
| CAS Monte Carlo | — | Phase 6 |

---

## Cost Notes

Diagnostic agents are primarily local computation (Simulated Player, Moment Extractor, Validator) or lightweight analysis (Distiller, Diagnostician). No additional API calls to generation pipeline.

Level construction pipeline (Phase 2+): ~10-12 Claude calls per episode typical (1 Designer vision + ~4-5 Builder + ~4-5 Designer taste checks). Worst case ~20 per episode if several sections need revision.

Stress-Tester does add API cost (generating 30+ games per paradigm per battery run). Mitigation: runs only on changes, most games auto-filtered by Gate 1, battery size tunable to budget.

Testing UI is standard React, Vercel-hosted alongside the game.
