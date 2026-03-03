# Two Fires — Current Status

**Last updated:** 2026-03-02

---

## What Just Happened

### Game State JSON Schema Designed — Thread 1 Complete

Extended collaborative design session producing the foundational schema document (`docs/design/game-state-schema.md`). This was the #1 open question from previous sessions. Every decision was discussed and grounded in CAS social system theory and Barrett's constructionist framework before being committed.

**Schema covers four concerns:**
1. **Game identity (`meta`)** — paradigm, aesthetic home state, audio home state, philosophy, dramaturgical setup with event magnitude sensitivity calibrated by intended game length. Immutable after creation.
2. **World state (`world`)** — factions (7 CAS primitives: cohesion, morale, loyalty, awareness_of_player, disposition_to_player, internal_dissent, resources), entities (OCEAN personality as offsets from faction center, flat-list knowledge with special knowledge resolution layers, mutable social graph with formation/dissolution rules, behavioral parameters as flat float dict, semantic asset specs), locations, information packets (with accuracy degradation and paradigm-specific propagation), append-only event log.
3. **Episode content (`episode`)** — fixed physics, CAS-responsive aesthetic/audio modifiers, paradigm-flexible spatial format, entity placements with behavioral overrides, visual manifestations with CAS source tracing, sequence record for quality audit.
4. **Player state (`player` + `overseer`)** — distributed reputation (no player-carried score), behavioral model built from meaningful decisions, Overseer keyed to model confidence not game count.

**11 design decisions made and documented** in decisions log, covering: schema structure, faction primitives, OCEAN personality, knowledge system, dynamic social graph, distributed reputation, identity-vs-expression, fixed physics, Overseer activation, player-as-catalyst calibration, paradigm-flexible spatial format.

## Current Agent Execution Order

*(Unchanged)*

```
Pre-game:
  Experience Interpreter
    → Artistic Director
    → Design Philosopher
    → Dramaturgical Agent (setup)
    → Grammarian → Rhythmist → Game Compiler → Cartographer
    → Provocateur → Coherence Auditor

Runtime (per episode):
  CAS engine ticks (per paradigm spec)
  Drama density monitor (threshold check, catalyst trigger)
  Claude interprets CAS state → narrative
  Visual Manifestation Engine (narrative → scene spec → assets)
  Visibility manager (CAS state → observable behaviors)
  Content agents generate next episode

Diagnostic wrapper:
  Simulated Player → Gate 1 → Moment Extractor → Testing UI → Joe rates → Distiller
```

## What's Next

### Immediate: Repo Sync
1. Drop into repo:
   - `docs/design/game-state-schema.md` — the schema document
   - `docs/current-status.md` — this file (rename from current-status.md)
   - Append `decisions-log-4.md` content to `docs/decisions-log.md`
2. Commit and push

### Then: Phase 1 — Paradigm Engine (Sessions 2-8)

The schema unlocks concrete building. Claude Code now knows:
- What `episode.physics` looks like (the game-feel knob table)
- What `episode.spatial` looks like (tilemap with collision layers)
- What `episode.entity_placements` looks like (entities with behavioral overrides)
- What `world.entities` looks like (the full entity data model)
- What `diagnostics` looks like (what to validate)

**First milestone:** Hand-authored GameState JSON → playable platformer level with one entity + one social hook trigger, auto-tested by Simulated Player, diagnostic clips for Joe's review.

### Parallel design threads recommended:
- **Thread 2:** Paradigm specs (all 13+ paradigms — social surfaces, CAS tick, behavioral legibility)
- **Thread 3:** CAS engine parameters + behavioral legibility rules (now that state structure is defined)
- **Thread 4:** Dramaturgical Agent ingredients (initial conditions, catalysts, social hooks)
- **Thread 5:** Visual Manifestation Engine specification

---

## Key Open Questions
1. ~~Game state JSON schema~~ ✅ RESOLVED
2. Granular constraint relationships between primitives (answers from building/testing)
3. Paradigm spec completion for all 13+ paradigms
4. Visual Manifestation Engine specification
5. Multi-paradigm shift mapping mechanics
6. Behavioral stress response modifier function design
7. Event magnitude calibration per paradigm
8. Overseer model confidence thresholds for escalation levels
