# Two Fires — Current Status

**Last updated:** 2026-03-04

---

## What Just Happened

### Thread 4: Dramaturgical Agent Resolved — Eliminated and Distributed

Thread 4 was originally scoped as the Dramaturgical Agent ingredient specification. The session evolved into a first-principles analysis of what ensures a great game experience, leading to the elimination of the Dramaturgical Agent as a discrete component.

**The core realization:** The Thread 3 CAS redesign (two-layer architecture, Claude interpretation) had already absorbed most of the Dramaturgical Agent's runtime functions. The remaining setup functions belong in the Game Compiler. And the mechanical game arc question — how to ensure the non-social game feels authored and well-shaped — requires a different solution entirely: paradigm grammars.

**Key outcomes:**

1. **Dramaturgical Agent eliminated.** No discrete agent, no separate Claude call. Functions distributed: CAS initial conditions → Game Compiler. Prompt → OCEAN translation → Game Compiler. Social hooks → Game Compiler + paradigm specs. Pressure ramp → already architectural (player-driven). Drama density → already in CAS engine. Catalysts → Claude interpretation layer responding to stagnation signals.

2. **Social drama architecturally guaranteed** by three interacting systems: CAS engine (deterministic social physics + drama density signals), player as extraordinary catalyst (constant perturbation), Claude interpretation (narrative construction + NPC direction + stagnation response). One designed ingredient survives: early social hook at episode 1-2 boundary.

3. **Paradigm grammar framework established** for mechanical game quality. Three layers: paradigm grammar (native structural grammar per paradigm — what are the units, how organized, what's the punctuation, what are non-negotiable features), skeleton (Game Compiler instantiates grammar for this specific game/prompt/narrative), override conditions (Claude can adapt skeleton when CAS reality warrants it, using constructionist interpretation not deterministic rules).

4. **Five experience primitives identified** as quality checks: vocabulary accumulation, consequentiality escalation, environmental legibility, earned transformation, compression toward resolution. These are emergent properties of well-designed systems, not calibration targets. Used for diagnostic evaluation.

5. **Framework vs. specifics split:** The paradigm grammar *framework* is captured in claude.md now. The *specific grammars* per paradigm (Mega Man stage-select structure, Mario world-level-castle structure, racing cup structure, etc.) are built before Phase 2, leveraging ingestion pipeline data + Phase 1 playtesting experience.

## Current Agent Execution Order

```
Pre-game:
  Experience Interpreter
    → Artistic Director
    → Design Philosopher
    → Game Compiler (expanded role: CAS initial conditions, social graph topology,
                     personality distributions, social timer pace, drama calibration,
                     skeleton instantiation from paradigm grammar, social hook placement,
                     initial narrative)
    → Grammarian → Rhythmist → Cartographer
    → Provocateur → Coherence Auditor

Runtime loop:
  CAS engine ticks on social timer (deterministic, continuous)
    → affect propagation through bonds
    → information propagation through bonds
    → bond dynamics (attribution-based changes, shared experience, decay)
    → faction aggregate computation
    → drama density evaluation
  
  At paradigm tick (episode boundary, social encounter):
    → Claude receives: CAS snapshot + previous narrative + drama signal
        + skeleton context (current zone, vocabulary budget, difficulty phase)
    → Claude interprets at multiple scales (ecology → faction → cluster → player sphere)
    → Claude produces: narrative update, entity behavioral directives,
        faction leadership decisions, visual/audio/aesthetic specs
    → Claude evaluates: does skeleton still fit world reality? (override conditions)
    → Leadership decisions become CAS events → processed next cycle
    → Behavioral directives → paradigm engine renders behavior
    → Visual specs → Visual Manifestation Engine renders scene
  
  Player acts → events enter CAS → cycle continues

Diagnostic wrapper (per generated game):
  Simulated Player Agent → Gate 1 auto-checks
  → Moment Extractor clips diagnostic moments
  → Testing UI presents clips to Joe
  → Joe rates (👎/👍/🔥) → Pattern Distiller processes
  → Approved principles feed back into CAS_CONFIG tuning + Claude prompt refinement
```

**Changes from previous:** Dramaturgical Agent removed from pre-game pipeline. Game Compiler absorbs its setup responsibilities. Skeleton context added to Claude's runtime interpretation input. Override condition evaluation added to runtime loop.

## Generation Flow

```
Player prompt
  → Skeleton (~10-15s): paradigm grammar instantiation → skeleton
      (vocabulary budget, zone progression, boss placement, difficulty shape,
       CAS initial conditions, social graph, personality distributions,
       aesthetics, narrative premises, social hooks, social timer pace)
  → Episode 1 generates (content agents read skeleton + sequencing grammar
      + CAS state + prompt-time character/environment sprites)
  → Player plays Episode 1 (CAS evolving on social timer)
  → Social hook at episode 1-2 boundary (designed encounter, emergent outcome)
  → At episode boundary:
    → CAS snapshot taken
    → Claude interpretation call (multi-scale + skeleton context)
    → Override condition evaluation (does skeleton still fit?)
    → Claude produces: narrative update, behavioral directives, visual/audio specs,
        faction leadership decisions (→ CAS events)
  → Between-episode window (triple duty):
      1. Player social interaction surface
      2. CAS narrative delivery
      3. Generation masking (next episode content + new visual assets)
  → Episode 2+ generates incorporating: skeleton constraints + CAS state
      + Claude interpretation + sequencing grammar
  → [repeat, with skeleton adapting if override conditions met]
```

## What's Next

### Immediate: Repo Sync
1. Update `claude.md` — remove Dramaturgical Agent from agent execution order, expand Game Compiler responsibilities, add Paradigm Grammar Framework section, update generation flow
2. Append Thread 4 decisions (29-33) to `docs/decisions-log.md`
3. Replace `docs/current-status.md` with this file
4. Commit and push

### Then: Phase 1 — Paradigm Engine (Sessions 2-8)
Phase 1 is unblocked. The architectural decisions from Threads 1-4 provide sufficient specification:
- Game state schema (Thread 1, with Thread 3 CAS diffs documented in claude.md)
- CAS engine spec (Thread 3)
- Paradigm specs with sequencing grammar seeds (Thread 2)
- Dramaturgical functions distributed to Game Compiler + CAS + Claude interpretation (Thread 4)

Phase 1 builds: core game loop, canvas rendering, entity system, input manager, collision, physics parameter table, 2D tile-based rendering core, JSON-to-game machine, Simulated Player Agent, Moment Extractor v1, Testing UI v1, Gate 1 auto-checks.

**First milestone:** Hand-authored GameState JSON → playable platformer level with one entity + one social hook trigger, auto-tested by Simulated Player, diagnostic clips for Joe's review.

### Before Phase 2: Paradigm Grammar Buildout
Extend each paradigm spec with full-game structural grammar. Leverage:
- Ingestion pipeline structural data (~1,350 games, ~7,800 JSON files)
- Phase 1 playtesting experience
- Framework defined in claude.md

### Parallel design threads (can proceed during Phase 1):
- Social hook pattern library (compact, for Game Compiler)
- Visual Manifestation Engine specification
- Remaining paradigm spec completion

---

## Key Open Questions
1. Paradigm grammar specifics per paradigm (before Phase 2)
2. Behavioral implementation — how Claude's directives become rendered game content
3. Game state schema document update (apply Thread 3 diffs)
4. Visual Manifestation Engine specification
5. CAS rate constant calibration (testing phase)
6. MVP definition — minimum compelling first level
7. Two-primitive sufficiency validation
8. Social hook pattern library
