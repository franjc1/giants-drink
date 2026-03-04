# Two Fires — Current Status

**Last updated:** 2026-03-03

---

## What Just Happened

### CAS Engine Redesigned From First Principles (Thread 3)

Major architectural redesign of the social ecology engine. Started as a reconciliation session between Threads 1, 2, and the initial Thread 3 spec, evolved into a fundamental rethinking grounded in Barrett's constructionist framework and CAS theory (Kauffman, Holland, Axelrod, Santa Fe Institute).

**The key architectural shift:** Two-layer architecture replacing essentialist threshold-based systems.

**Layer 1 — CAS Engine (deterministic JS).** Entities have only two dynamic state values: affect valence (-1.0 to 1.0) and arousal (0.0 to 1.0). Plus OCEAN personality (stable), knowledge (accumulated), and bonds (structural, mutable). No loyalty, morale, fear, or stress variables. No threshold tables. No behavioral lookup. Just simple math propagating numbers through a social graph.

**Layer 2 — Claude Interpretation.** At episode boundaries, Claude reads the full CAS state and constructs situated narrative interpretations. Claude determines what entities are experiencing (fear? rage? grief? grudging respect?), what they would do, and what the player sees. No essentialist categories — Claude constructs meaning from primitives in context, exactly as Barrett argues human minds do.

**Claude never modifies CAS state directly.** Claude directs NPC behavior → behavior creates events → events enter the CAS through deterministic rules → CAS updates → Claude interprets.

**Key design decisions made (Decisions 17-28):**

1. Two-layer architecture: deterministic CAS + Claude interpretation
2. Entity state reduced to two affect primitives (valence, arousal)
3. OCEAN retained, custom traits dropped (emerge from OCEAN + situation)
4. Fear eliminated entirely — not stored, not computed, constructed by Claude
5. Five event categories with full OCEAN modulation
6. Two propagation mechanisms only: affect contagion + information propagation
7. Attribution-gated reputation: affect spreads fast (no attribution), understanding spreads slow (with attribution)
8. Bond dynamics via one core rule: attributed affect change = bond change
9. Social timer independent of paradigm ticks (~2 min heartbeat)
10. Resources as abstract capacity, not economy
11. Multi-scale Claude interpretation (ecology → faction → cluster → player sphere)
12. Narrative continuity as delta-from-previous

**Full claude.md rewrite completed** to propagate changes across all affected sections: JSON Game State Schema (specific field changes documented), Conversation System Design, Manifestation Layer, Quality Evaluation System, Social Hook Design, and Paradigm Architecture.

**Estimated implementation:** 430-610 lines JS. <10ms per cycle for 50-100 entities.

## What Changed in claude.md

All sections revised for CAS redesign impact:
- **CAS Engine Architecture** — new section replacing scattered CAS references
- **JSON Game State Schema** — specific diffs for faction state, entity mind, CAS block, behavioral overrides, visual manifestation cas_source, event log effects, System Read/Write Reference
- **Conversation System Design** — entities speak from affect + personality + knowledge + bonds, not from disposition/emotional_state
- **Manifestation Layer** — Claude produces visual specs directly from interpretation, not from threshold → lookup → override pipeline
- **Quality Evaluation System** — tuning targets shift from threshold tables to CAS_CONFIG rates + Claude prompt quality
- **Social Hook Design** — hooks are Claude-constructed from narrative context, not threshold-triggered
- **Paradigm Architecture** — behavioral legibility tables eliminated, paradigm specs define social surfaces + witness rules + propagation rates instead
- **Lore System** — confirmed unchanged, already aligned with new architecture
- **Agent Execution Order** and **Generation Flow** — updated to reflect two-layer loop

## Current Agent Execution Order

```
Pre-game:
  Experience Interpreter
    → Artistic Director
    → Design Philosopher
    → Dramaturgical Agent (setup: CAS initial conditions, social graph topology,
                           personality distributions, social timer pace, drama calibration,
                           initial narrative)
    → Grammarian → Rhythmist → Game Compiler → Cartographer
    → Provocateur → Coherence Auditor

Runtime loop:
  CAS engine ticks on social timer (deterministic, continuous)
    → affect propagation through bonds
    → information propagation through bonds
    → bond dynamics (attribution-based changes, shared experience, decay)
    → faction aggregate computation
    → drama density evaluation
  
  At paradigm tick (episode boundary, social encounter):
    → Claude receives CAS snapshot + previous narrative + drama signal
    → Claude interprets at multiple scales (ecology → faction → cluster → player sphere)
    → Claude produces: narrative update, entity behavioral directives,
        faction leadership decisions, visual/audio/aesthetic specs
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

## What's Next

### Immediate: Repo Sync
1. Replace `claude.md` with full rewrite
2. Drop `docs/design/cas-engine-spec.md` into repo
3. Replace `docs/current-status.md` with this file
4. Replace `docs/decisions-log.md` with full merged version (Decisions 1-28)
5. Commit and push

### Flagged for future threads:
- **Behavioral Implementation Thread:** How Claude's narrative directives ("goombas form guerrilla faction, kidnap Bowser's general") translate into actual on-screen game content. Touches VME spec, content generation pipeline, paradigm-specific rendering.
- **Game State Schema Update:** Apply the specific diffs documented in claude.md to the actual game-state-schema.md document
- **Visual Manifestation Engine Specification:** Scene spec format, composition system, sprite variants, retro effects
- **CAS Tuning:** All rate constants are starting estimates. Real calibration through diagnostic framework during testing.

### Build: Phase 1 — Paradigm Engine
Ready to begin. CAS engine spec + game state schema + paradigm specs provide sufficient structure for Claude Code implementation.

---

## Key Open Questions
1. Behavioral implementation — how Claude's narrative directives become rendered game content (dedicated thread needed)
2. Game state schema document update — apply diffs from claude.md to actual schema doc
3. Visual Manifestation Engine specification
4. CAS rate constant calibration (testing phase)
5. MVP definition — minimum compelling first level
6. Two-primitive sufficiency validation (optimistic, flagged as risk)
