# Two Fires — Current Status

**Last updated:** 2026-03-05 (Thread 9: Gameplay Quality, Difficulty & Level Construction Architecture)

---

## What Just Happened

### Thread 9: Gameplay Quality, Difficulty Philosophy & Level Construction Architecture

Thread 9 addressed two critical product concerns: (1) will the generated games feel fun and engaging for a casual/broad audience, and (2) will they feel authored rather than soullessly generated. This led to both a difficulty philosophy and a major architectural simplification of the level construction pipeline.

**Key outcomes:**

1. **SNES Comfort Model established as default difficulty philosophy (Decision 53).** Games default to SNES-era forgiveness: frequent checkpoints, low death cost, generous teachability, thoughtful reaction windows (not reflex-dependent), concave difficulty ramp. The player should feel competent and want to make progress, not feel punished. This is both a taste preference and an architectural requirement — the social ecology needs cognitive bandwidth to land, which only exists when the player isn't in pure survival mode.

2. **Aesthetic era decoupled from difficulty (Decision 54).** "NES style" = 8-bit visuals, not NES-hard difficulty. Only explicit difficulty language ("hard," "punishing," etc.) overrides the SNES Comfort default. The full retro aesthetic palette is available to all audiences.

3. **"Soul" problem identified and addressed.** The gap between "syntactically valid game" and "authored-feeling game" was identified as the absence of authorial vision and iterative taste evaluation during construction. Syntax ensures correctness; soul requires intention and judgment. The solution: Claude as both designer and tastemaker in the construction loop.

4. **Level construction pipeline radically simplified (Decisions 55-61).** Eight components (Author Agent, Grammarian, Rhythmist, Cartographer, Provocateur, Coherence Auditor, Simulated Player, Taste Agent) consolidated to three:
   - **Designer** (Claude) — creates Episode Vision + evaluates each section for taste during construction. Maintains cumulative player experience model. Uses game-type taste profiles.
   - **Builder** (Claude, Sonnet) — constructs each section as an integrated design problem (vocabulary + rhythm + spatial layout). Same author for all sections.
   - **Validator** (deterministic code) — pathfinding, reachability, teachability verification, softlock detection. No Claude calls.

5. **Provocateur eliminated (Decision 55).** Surprise and delight emerge from the Designer's vision and taste, not from injected violations. Random pattern-breaking is more likely noise than genius.

6. **Game-type taste profiles established (Decision 59).** The Designer evaluates with paradigm-specific sensibility (Mario values flow; Mega Man values mastery; Zelda values mystery). Profiles derived from ingestion pipeline data weighted toward high-quality games.

7. **Design move library identified as key future work.** The right grain size for extractable game design patterns is the "design move" — a complete transferable micro-experience, not an abstract arc or a literal tile pattern. To be extracted from the ingestion pipeline.

---

## Current Agent Execution Order

```
Pre-game:
  Experience Interpreter
    → Artistic Director
    → Game Visual Identity generator (Track B only)
    → Design Philosopher
    → Game Compiler (CAS initial conditions, social graph topology,
                     personality distributions, social timer pace, drama calibration,
                     skeleton instantiation, social hook placement, initial narrative,
                     knowledge distribution, population template generation,
                     named entity individuation)

  Per-episode level construction:
    → Game Compiler produces Episode Brief
        (vocabulary budget, complexity ceiling, difficulty target,
         punctuation type, zone identity, mechanical thesis,
         narrative context, override flags)
    → Designer produces Episode Vision
        (emotional arc, signature moments, hidden intentionality,
         connective logic, section-by-section specs)
    → For each section:
        → Builder constructs (integrated vocabulary + rhythm + spatial)
        → Validator checks feasibility (pathfinding, reachability, teachability)
        → Designer evaluates taste (cumulative experience model + taste profile)
        → Retry loop if Validator or Designer rejects
    → Episode served; Vocabulary Record Update written

Runtime loop:
  CAS engine ticks on social timer (deterministic, continuous)
  
  At paradigm tick (episode boundary):
    → Claude receives: CAS snapshot + previous narrative + drama signal
        + skeleton context
    → Claude interprets at multiple scales
    → Claude produces:
        Visual/audio directives → VME directive stack
        Mechanical directives → paradigm engine
        Mechanical thesis → Episode Brief (via Game Compiler)
        Narrative update, faction leadership decisions → CAS events
    → Next episode enters construction pipeline (Designer → Builder → Validator)
    → VME resolves directives via Layer 1/2/3

  Player conversation:
    → Player hails entity (costs 1 exchange from daily budget)
    → If entity willing: conversation opens (multi-turn Claude API call)
    → If entity unwilling: rejection displayed
    → Post-conversation: events enter CAS, bonds update, knowledge propagates
    → If population entity: promoted to named on first exchange

  Emissary conversation (if player delegates):
    → Player instructs ally (costs player exchanges)
    → Single Claude API call with both entity schemas
    → Emissary reports filtered through own personality
    → Events from emissary conversation enter CAS normally

Diagnostic wrapper (unchanged):
  Simulated Player Agent → Gate 1 auto-checks
  → Moment Extractor → Testing UI → Joe rates → Pattern Distiller
```

**Note on Simulated Player Agent:** The Simulated Player Agent still exists in the diagnostic wrapper for automated playtesting/clip generation. Its *level verification* function (pathfinding, reachability) was absorbed into the Validator within the construction pipeline. These are separate uses of similar technology — the Validator runs during construction, the Simulated Player Agent runs after construction for diagnostic purposes.

---

## Generation Flow

```
Player prompt
  → Skeleton (~10-15s): paradigm grammar instantiation
      + Game Visual Identity (Track B)
      + Knowledge distribution
      + Population templates + named entity individuation
      + SNES Comfort Model defaults applied to forgiveness parameters
        (unless explicit difficulty override in prompt)
      + Layer 3 generates initial assets
  → Episode 1: 
      Game Compiler produces Episode Brief from skeleton
      → Designer produces Episode Vision (taste profile loaded)
      → Builder constructs sections → Validator → Designer taste check
      → Episode served; Vocabulary Record Update written
  → Player plays Episode 1 (CAS evolving on social timer)
  → Player conversations (if any) consume exchange budget, generate CAS events
  → At episode boundary: Claude interpretation → Episode Brief for next episode
  → Between-episode window (triple duty):
      1. Player social interaction surface
      2. CAS narrative delivery
      3. Generation masking (construction pipeline + VME + any Layer 2/3 assets)
  → Episode 2+ with accumulated state + updated vocabulary record
  → [repeat]
```

---

## What's Next

### Immediate: Repo Sync
1. Drop into repo:
   - Append Thread 9 decisions (53-61) to `docs/decisions-log.md`
   - Replace `docs/current-status.md` with this file
   - Replace `claude.md` with updated architectural blueprint
2. Commit and push

### Then: Phase 1 — Paradigm Engine (Sessions 2-8)
Phase 1 remains unblocked. All design threads (1-5, 7, 7.6, 8, 9) are complete or appropriately deferred. Thread 9's simplification reduces Phase 2's agent count (3 level construction components instead of 8).

**Phase 1 builds:** Core game loop, canvas rendering, entity system, input manager, collision, physics parameter table (with SNES Comfort Model defaults), 2D tile-based rendering core, JSON-to-game machine, Validator (pathfinding + reachability + teachability verification), Moment Extractor v1, Testing UI v1, Gate 1 auto-checks.

**First milestone:** Hand-authored GameState JSON → playable platformer level with SNES-grade forgiveness, auto-validated, diagnostic clips for Joe's review.

### Before Phase 2: Paradigm Grammar Buildout + Taste Profiles
- Extend each paradigm spec with full-game structural grammar
- Build game-type taste profiles from ingestion pipeline data (quality-weighted)
- Begin design move library extraction from ingestion data
- Bootstrap Living Taste Document with initial criteria

### Build Plan Impact
The build plan (v2) references agents that are now consolidated. Phase 2 scope simplifies: instead of building Grammarian + Rhythmist + Cartographer + Provocateur + Coherence Auditor as separate agents, Phase 2 builds Designer + Builder + Validator. Net reduction in Phase 2 engineering complexity. Diagnostic systems unchanged.

---

## Key Open Questions
1. Paradigm grammar specifics per paradigm (before Phase 2) — now includes taste profiles
2. CAS state → level content translation per paradigm
3. Social hook pattern library
4. Game state schema document update (Thread 3/5/7 diffs)
5. Asset resolution strategy update (reference Game Visual Identity)
6. Mechanical directive format specification (Decision 39)
7. CAS rate constant calibration (testing phase)
8. MVP definition — minimum compelling first level
9. Exact exchange budget numbers per tier (testing/economics)
10. Design move library extraction from ingestion pipeline
11. Living Taste Document bootstrap
