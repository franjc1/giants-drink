# Two Fires — Current Status

**Last updated:** 2026-03-04 (Thread 5: Visual Manifestation Engine)

---

## What Just Happened

### Thread 5: Visual Manifestation Engine Fully Specified

Comprehensive specification session for the VME — the system that makes CAS state visible to players. This was identified in every previous thread's open questions list as a critical unresolved specification.

**Key outcomes:**

1. **Seven directive types defined with 39 primitives total.** Entity Visual Modifier (8 primitives), Scene Composition (5), Environment Modifier (6), Scene-Level Effect (4), Novel Entity Spec (6), Text Content (4), Audio/Music Modifier (6). Every visual, audio, and compositional change the CAS can produce is expressible as some combination of these directives.

2. **Scene spec format designed as Approach B** — Claude speaks in semantic-but-specific directives ("bob-ombs should appear larger with a red glow"), the VME resolves mechanically to actual rendering operations. Claude never specifies pixels; the VME never interprets narrative.

3. **Seven cross-cutting fields** apply to all directives: target, persistence, priority, narrative context, timing/sequencing, intensity/magnitude, layering behavior.

4. **Directive stack model established.** VME maintains a stack of active directives per target. Claude is the only system that adds or removes directives. Nothing auto-reverts. Additive directives accumulate; replacement directives replace only their own primitive type. Stack is serializable as game state.

5. **Three-layer capability model specified.** Layer 1 (compositional — canvas operations, zero AI cost, ~40-50%). Layer 2 (sprite variant — modifications to existing sprites, programmatic + AI-assisted, ~30-40%). Layer 3 (novel generation — from scratch, AI-required, ~10-20% runtime). VME always routes to cheapest capable layer.

6. **Game Visual Identity system designed for Track B.** Instead of generating individual assets, Track B generates a complete visual system first (palette architecture, proportion grid, detail density rules, animation budget, visual shorthand dictionary, silhouette distinctiveness rules), then generates every asset within that system. Ingestion library provides distributional knowledge and relational constraints without copying pixel expression. This is the Track B architecture that makes generated games look cohesive rather than like a collage.

7. **Claude's dual output streams formalized.** Each interpretation call produces visual/audio directives (to VME) and mechanical directives (to paradigm engine). Novel interactive objects require both. This was flagged for Game Compiler documentation in future sessions.

8. **Entity Pose/State collapsed into Entity Visual Modifier.** Originally scoped as a separate directive type, but the eight entity visual primitives already cover pose changes through silhouette change, added element, and animation state. The VME decides whether to fulfill via Layer 1 modification or Layer 2 generation — that's a routing decision, not a spec-level distinction.

## Current Agent Execution Order

```
Pre-game:
  Experience Interpreter
    → Artistic Director
    → Game Visual Identity generator (Track B only — instantiates visual system)
    → Design Philosopher
    → Game Compiler (expanded: CAS initial conditions, social graph, personality
                     distributions, social timer pace, drama calibration, skeleton
                     instantiation, social hook placement, initial narrative)
    → Grammarian → Rhythmist → Cartographer
    → Provocateur → Coherence Auditor
    → Layer 3 asset generation (all entities/environments under Game Visual Identity)
    → Assets enter game-instance library

Runtime loop:
  CAS engine ticks on social timer (deterministic, continuous)
  
  At paradigm tick (episode boundary):
    → Claude receives: CAS snapshot + previous narrative + drama signal + skeleton context
    → Claude interprets at multiple scales
    → Claude produces:
        Visual/audio directives → VME directive stack
        Mechanical directives → paradigm engine
        Narrative update, faction leadership decisions → CAS events
    → VME resolves directives:
        Layer 1 (canvas ops) for most changes
        Layer 2 (sprite variants) when new visual states needed
        Layer 3 (novel generation) when entirely new assets needed (rare)
    → Next episode renders with updated visual state

Diagnostic wrapper (unchanged):
  Simulated Player Agent → Gate 1 auto-checks
  → Moment Extractor → Testing UI → Joe rates → Pattern Distiller
```

## Generation Flow

```
Player prompt
  → Skeleton (~10-15s): paradigm grammar instantiation → skeleton
      + Game Visual Identity (Track B: palette, proportions, detail density,
        animation budget, visual shorthand, silhouette rules)
      + Layer 3 generates all initial entity/environment assets within identity
      + Assets enter game-instance library
  → Episode 1 generates (content agents + library assets)
  → Player plays Episode 1 (CAS evolving on social timer)
  → At episode boundary:
    → Claude interpretation call
    → Visual/audio directives → VME updates directive stack → resolves via layers
    → Mechanical directives → paradigm engine updates behavior/physics
  → Between-episode window (triple duty):
      1. Player social interaction surface
      2. CAS narrative delivery (rendered by VME from directive stack)
      3. Generation masking (next episode + any Layer 2/3 asset generation)
  → Episode 2+ renders with accumulated VME directive stack
  → [repeat]
```

## What's Next

### Immediate: Repo Sync
1. Drop into repo:
   - `docs/design/vme-spec.md` — the full VME specification
   - `docs/current-status.md` — this file
   - Append Thread 5 decisions to `docs/decisions-log.md`
2. Update `claude.md` — replace Manifestation Layer section with Thread 5 content, add `vme-spec.md` to key documents table, update open design work list
3. Update `docs/design/asset-resolution-strategy.md` — reference Game Visual Identity system
4. Commit and push

### Then: Phase 1 — Paradigm Engine (Sessions 2-8)
Phase 1 is unblocked. Threads 1-5 provide sufficient specification:
- Game state schema (Thread 1, with Thread 3 CAS diffs)
- Paradigm specs with sequencing grammar seeds (Thread 2)
- CAS engine spec (Thread 3)
- Dramaturgical functions distributed (Thread 4)
- VME spec with three-layer model (Thread 5)

Phase 1 builds: core game loop, canvas rendering, entity system, input manager, collision, physics parameter table, 2D tile-based rendering core, JSON-to-game machine, Simulated Player Agent, Moment Extractor v1, Testing UI v1, Gate 1 auto-checks. **Layer 1 VME operations** can be built during Phase 1 — they're pure canvas code.

### Before Phase 2: Paradigm Grammar Buildout
Extend each paradigm spec with full-game structural grammar. Leverage ingestion pipeline data + Phase 1 playtesting experience.

### Parallel design threads (if desired):
- Social hook pattern library (compact, for Game Compiler)
- Remaining paradigm spec completion
- Game state schema document update (apply Thread 3 + Thread 5 diffs)

---

## Key Open Questions
1. Paradigm grammar specifics per paradigm (before Phase 2)
2. CAS state → level content translation per paradigm
3. Multi-paradigm shift mapping mechanics
4. Game state schema document update (Thread 3 CAS diffs + Thread 5 `vme_state` section)
5. Asset resolution strategy update (reference Game Visual Identity)
6. Social hook pattern library
7. CAS rate constant calibration (testing phase)
8. MVP definition — minimum compelling first level
9. Layer 2 programmatic vs. AI-assisted boundary (tuned during development)
