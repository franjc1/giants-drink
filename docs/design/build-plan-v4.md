# Two Fires — Build Plan v4
## Updated for All 7 Engine Clusters in Phase 1

**Last updated:** 2026-03-08 (Phase 1, Session 5)

---

## What Changed (v3 → v4)

Phase 1 scope expanded from "one platformer engine cluster" to "all 7 engine clusters." Rationale: finding cross-cluster architectural issues early is cheaper than discovering them after CAS, agents, and diagnostics are layered on top. Each cluster is 1-2 sessions. The generalized JSON loader (Session 4) proved the engine architecture supports different paradigms with minimal per-paradigm work.

Additionally: Phase 0.75 (Asset Pipeline) added to reflect the sprite/music acquisition work that wasn't in previous plans.

Session count increases from 45 to ~55-60. Phase 1 grows from 7 sessions to ~16-18 sessions. All other phases shift accordingly but internal structure unchanged.

Read alongside: `claude.md` (architectural blueprint), `docs/design/game-state-schema.md` (reconciled schema), `docs/design/cas-engine-spec.md` (two-layer CAS), `docs/design/vme-spec.md` (visual manifestation engine), `docs/design/entity-minds-spec.md` (entity population + conversations), `docs/design/sequencing-grammar-framework.md` (intermediate layer), `docs/design/paradigm-shift-principles.md` (Phase 7 constraint document), `docs/design/asset-resolution-strategy.md` (two-track asset architecture).

---

## Phase Overview

| Phase | Sessions | Focus | Diagnostic Additions |
|-------|----------|-------|---------------------|
| 0 | 1 | Environment Setup ✅ | — |
| 0.5 | ongoing | Asset Ingestion ✅ | — |
| 0.75 | 3-5 | Asset Pipeline (sprites, music, tagging) ✅ IN PROGRESS | — |
| 1 | 2-18 | Paradigm Engine (all 7 clusters) | Simulated Player, Moment Extractor v1, Testing UI v1, Gate 1 |
| 2 | 19-22 | Experience Intelligence | Full Gate 2/3, Diagnostician, Stress-Tester v1, Distiller v1, Dashboard v1 |
| 3 | 23-26 | Aesthetics **→ DEMO 1** | Aesthetic INUS evaluation |
| 4 | 27-31 | Quality | Distiller v2, Stress-Tester v2, A/B mode, Taste Document |
| 5 | 32-36 | Entity Minds **→ DEMO 2** | Social clips + NC6 candidate |
| 6 | 37-43 | Social Ecology | CAS Monte Carlo, faction diagnostics |
| 7 | 44-48 | Genre Transformation | Genre shift evaluation |
| 8 | 49-58 | Game Mind & Overseer **→ DEMO 3** | Overseer diagnostics, full regression |

---

## Phase 0.75: Asset Pipeline (Sessions 3-5) — IN PROGRESS

### What's Being Built
- **Sprite scraper** (`tools/scrape-sprites.js`) — downloads ALL sprite sheets from The Spriters Resource across 12+ platforms. Resumable, rate-limited, gitignored PNGs with committed `asset-index.json`.
- **Music scraper** (`tools/scrape-music.js`) — downloads native chiptune files (NSF/SPC/VGM/GBS) from Zophar's Domain. Same pattern.
- **Asset tagging pipeline** — three phases: (1) programmatic sprite measurement (free), (2) Claude Haiku vision tagging for ambiguous sheets (~$15-50), (3) programmatic music analysis (free). Produces rich semantic metadata for the Asset Resolver.
- **Cloud storage upload** — sprite/music library to Cloudflare R2 for server-side access at runtime (both Track A and Track B need this).

### Status
- Sprite scraper: running (SNES ~70%, NES complete)
- Music scraper: running (SNES in progress, NES complete — 1,917 games)
- Tagging pipeline: specced, blocked on scrapers
- R2 upload: future session

---

## Phase 1: Paradigm Engine (Sessions 2-18)

### The 7 Engine Clusters

Build order is deliberate: Clusters 1-4 share 2D tile infrastructure and can be built quickly as variations. Clusters 5-7 are genuinely different rendering cores that test whether the engine's module architecture supports multiple renderers.

| Cluster | Name | Example Games | Build Effort | Sessions |
|---------|------|---------------|-------------|----------|
| 1 | Side-View Tile World | SMW, Mega Man, Castlevania, beat-em-ups | ✅ DONE | 2-4 |
| 2 | Top-Down Tile World | Zelda, action-RPG, top-down racing | Shares ~70% with Cluster 1 | 1-2 |
| 3 | Stage/Arena Screen | Fighting, RPG combat, fixed-screen | Simpler camera, new interaction model | 1-2 |
| 4 | Scrolling Shooter | Gradius, 1942, R-Type | Auto-scroll + projectiles + waves | 1-2 |
| 5 | Pseudo-3D / Mode 7 | Mario Kart, F-Zero | New rendering core | 2-3 |
| 6 | Raycasting First-Person | Doom, Wolfenstein | New rendering core | 2-3 |
| 7 | Strategic Map | RTS, tactics, management sim | New rendering core + new interaction model | 2-3 |

### Per-Cluster Deliverables
For each cluster:
1. Rendering core (or adaptation of existing)
2. Camera model appropriate to the paradigm
3. Collision system appropriate to the paradigm
4. Input model appropriate to the paradigm
5. Physics calibrated against ground truth (ROM data where available)
6. At least one hand-authored test fixture
7. Playable and deployed to Vercel

### Shared Infrastructure (built once, used by all clusters)
- Generalized JSON level loader ✅ (Session 4)
- Asset Resolver (Track A) — after tagging pipeline completes
- Integer display scaling ✅ (Session 3)
- Base64 tilemap format ✅ (Session 2)
- Two-phase gravity system ✅ (Session 3, Cluster 1 specific but pattern reusable)

### Game Systems (all clusters)
- Core game loop + canvas rendering ✅
- Entity system (player, enemies, items, environment) ✅ (Cluster 1, needs per-cluster adaptation)
- Input manager (keyboard, mobile future-proofed) ✅
- Collision detection ✅ (Cluster 1, needs per-cluster adaptation)
- Physics parameter table (JSON-driven) ✅
- SNES Comfort Model defaults (Decision 53)
- **Validator** — deterministic pathfinding, reachability analysis, timing verification, teachability arc completeness checks, softlock detection
- Level sequence / vocabulary record field in game config schema

### Diagnostic Systems (Sessions 16-18)
- **Simulated Player Agent** — pathfinding, timeline recording, death logging. Paradigm-aware (different movement models per cluster).
- **Moment Extractor v1** — clips NC1 (opening 3s), NC2 (physics character 5s), NC4 (visual pan 8-12s). Per-paradigm clip strategies.
- **Testing UI v1** — card-based web app, clips per game, 👎/👍/🔥 + text, fast-fail
- **Gate 1 auto-checks** — runs, spawns, assets resolve, latency < 50ms, completable, schema valid. Per-paradigm pathability checks.

### Joe's Workflow
Hand-author GameState JSON for any paradigm → Validator checks → auto-checks → clips → rate. Holistic playthroughs for first 5-10 games per paradigm.

### Phase 1 Milestone
Hand-authored GameState JSON for ALL 7 paradigms → playable levels with SNES-grade forgiveness across all clusters, auto-validated, diagnostic clips for Joe's review. Asset Resolver serving real sprites (Track A). Each paradigm calibrated against ground truth from ROM data.

---

## Phase 2: Experience Intelligence (Sessions 19-22)

### Game Systems
**Pre-game pipeline:** Experience Interpreter → Artistic Director → Game Visual Identity generator (Track B) → Design Philosopher → Game Compiler (CAS initial conditions, social graph topology, personality distributions, social timer pace, drama calibration, skeleton instantiation, social hook placement, initial narrative, knowledge distribution pipeline, population template generation, named entity individuation, SNES Comfort Model forgiveness parameters).

**Per-episode construction pipeline:** Game Compiler produces Episode Brief → **Designer** produces Episode Vision (with game-type taste profile) → **Builder** constructs sections (Claude, Sonnet-level; integrated vocabulary + rhythm + spatial) → **Validator** checks feasibility → Designer evaluates taste → retry loop if rejected → Episode served; vocabulary record updated.

**Critical:** The Experience Interpreter now maps prompts to ALL 7 engine clusters, not just platformer. Each cluster's paradigm specs must be complete before Phase 2 begins.

**Pre-Phase 2 design work required:**
- Extend each paradigm spec with full-game structural grammar
- Build game-type taste profiles from ingestion pipeline data (quality-weighted)
- Begin design move library extraction from ingestion data
- Bootstrap Living Taste Document with initial criteria

### Diagnostic Systems
- **Moment Extractor v2** — adds NC3, NC5, INUS-1, INUS-2. Paradigm-aware clip strategies for all 7 clusters.
- **Comparative Diagnostician** — same prompt 5-10x, consistency/variance/erratic report
- **Archetype Stress-Tester v1** — 10-15 prompts per paradigm (×7 clusters = 70-105 total), auto-runs on changes, regression detection
- **Pattern Distiller v1** — accumulates ratings, proposes principles after 10-15 ratings
- **Testing UI v2** — all NC + INUS clips, Generate mode, session summaries, Principles tab

### Joe's Workflow
Prompt → auto-checks → Gate 2 clips (5 NCs, ~30-45s) → Gate 3 clips (2 INUS, ~30s) → rate → principles review. 15-20 games per 20-min session. Across ALL paradigms.

---

## Phase 3: Aesthetics (Sessions 23-26)

### Game Systems
WebGL shader pipeline. Chiptune synthesizer (leveraging music library ground truth). Music styling. Asset knowledge base. VME Layer 1 + Layer 2 implementation. Game Visual Identity system for Track B asset generation. Track B sprite generation from semantic specs constrained by distributional knowledge from sprite library.

### Diagnostic Additions
- INUS-2 aesthetic personality now evaluates shaders + audio + palette + VME directive output
- Stress-Tester adds aesthetic prompts ("melancholy palette," "neon arcade," "Game Boy green")

**→ POST FIRST DEMO**

---

## Phase 4: Quality (Sessions 27-31)

### Diagnostic Maturation (this phase's primary focus)
- **Pattern Distiller v2** — parameter correlation, effectiveness tracking, ineffective principle flagging
- **Archetype Stress-Tester v2** — 30+ prompts per paradigm (×7 clusters), full regression suite, variance analysis
- **A/B Comparison Mode** — side-by-side variants, preference as additional Distiller signal
- **Taste Document v1** — formalized, versioned, integrated into Designer prompts and taste profiles
- Designer Episode Vision quality tuning
- Builder construction quality tuning
- Game-type taste profile calibration

---

## Phase 5: Entity Minds (Sessions 32-36)

### Game Systems
Conversation API structure (multi-turn Claude calls with entity system prompt + dynamic context). Player exchange budget UI. Population entity → named entity runtime promotion. Post-conversation CAS event processing. Emissary delegation mechanics. Communication willingness as CAS-responsive value.

### Diagnostic Additions
- **NC6 candidate: Social Legibility** — can player tell entities have dispositions without being told?
- **INUS-3:** Social hook clips (first entity interaction)
- **INUS-5:** Entity behavior clips (unprompted action from Claude interpretation)
- Stress-Tester adds social prompts ("entities distrust player," "three factions in tension")

**→ POST SECOND DEMO**

---

## Phase 6: Social Ecology (Sessions 37-43)

### Game Systems
CAS engine implementation (two-layer: deterministic JS + Claude interpretation). Five event categories, affect contagion, information propagation, bond dynamics, faction aggregates, drama density tracking, attribution mechanism. Knowledge distribution pipeline. Claude multi-scale interpretation at episode boundaries.

### Diagnostic Additions
- **CAS Monte Carlo** — 1000 runs per prompt, distribution analysis
- **INUS-6:** CAS responsiveness (consequences of player actions feel real)
- Claude interpretation evaluation (adapts? contextual? consistent?)

---

## Phase 7: Genre Transformation (Sessions 44-48)

### Game Systems
Mid-game paradigm switching governed by paradigm shift principles (Thread 8): shifts are consequences not requests, CAS state carries over completely, identity persists while capability transforms, transitions are narrative moments at episode boundaries. Intra-cluster shifts (parameter swap) and cross-cluster shifts (rendering core switch). Shift fitness evaluation.

**Critical advantage of building all clusters in Phase 1:** Cross-cluster shifts are testable immediately. No waiting until Phase 7 to discover that the platformer-to-racing transition breaks the renderer architecture.

### Diagnostic Additions
- **INUS-7:** Genre shift feels earned (clip: shift moment + 10s before/after)
- Cross-paradigm Stress-Tester prompts ("start platformer, build army")
- Verify NCs hold in new paradigm post-shift

---

## Phase 8: Game Mind & Overseer (Sessions 49-58)

### Game Systems
Behavioral monitoring, post-game reading, Overseer system (escalation keyed to model confidence, not game count), VME Layer 3 for novel asset generation, polish. Post-game continuation and meta-objective integration (Decision 70).

### Diagnostic Additions
- **INUS-8:** Overseer presence (multi-game evaluation sessions)
- Post-game reading evaluation (insightful vs. generic)
- Full pipeline regression (complete Stress-Tester battery, all conditions, all 7 clusters)

**→ POST FINAL DEMO**

---

## Infrastructure Timeline

| Component | Built | Matures |
|-----------|-------|---------|
| Asset Pipeline | Phase 0.75 | Phase 1 (resolver), Phase 3 (Track B) |
| Simulated Player | Phase 1 | Phase 2 (per-paradigm strategies) |
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

Stress-Tester does add API cost (generating 30+ games per paradigm per battery run across 7 clusters). Mitigation: runs only on changes, most games auto-filtered by Gate 1, battery size tunable to budget.

Asset tagging pipeline (Phase 0.75): ~$15-50 one-time cost for Claude Haiku vision API.

Cloud storage (R2): ~$0.75/month for sprite/music library.

Testing UI is standard React, Vercel-hosted alongside the game.
