# Two Fires — Current Status

**Last updated:** 2026-03-02

---

## What Just Happened

### Paradigm Specifications Complete (Thread 2)

Full paradigm specification document created covering the complete landscape of retro game types from NES through early PC.

**Key insight:** Player-facing paradigms (what the game feels like) and engine clusters (what's actually rendering) are different things. Many paradigms that feel completely different to players share an engine — the differences are parameters, interaction grammars, and social surface design.

**7 Engine Clusters defined:**
1. **Side-View Tile World** — platformer, beat-em-up, run-and-gun, cinematic action
2. **Top-Down Tile World** — action-adventure, RPG overworld, top-down action/racing/sports
3. **Stage/Arena Screen** — fighting, RPG combat, fixed-screen arcade, puzzle, boss encounters
4. **Scrolling Shooter** — horizontal shmup, vertical shmup
5. **Pseudo-3D / Mode 7** — behind-view racing, driving action
6. **Raycasting First-Person** — FPS, first-person adventure, dungeon crawler
7. **Strategic Map** — RTS, tactics/SRPG, management sim

**12 full player-facing paradigm specs** populated with consistent template: temporal structure, sequencing grammar, social surface, CAS integration, physics & mechanics, aesthetics, genre shift interface.

**10 additional paradigms** documented as parameter variants of parent paradigms (don't need separate specs).

**Cross-cluster relationship mapping:** Intra-cluster shifts (parameter swaps, seamless) vs. cross-cluster shifts (rendering core switches, require transitions). Shift triggers and what carries across all shifts documented.

**Build priority order** established: Cluster 1 first (platformer launch), then 3, 2, 7, 5, 4, 6.

**Prompt handling pattern established:** "Mario characters playing quidditch" → Experience Interpreter maps the *activity* (quidditch = flying + dodging + scoring) to the engine cluster that delivers that feel (Cluster 4 shmup mechanics or Cluster 1 with flight physics), then maps *characters* onto the social ecology. The system serves any prompt by finding the right engine, not by matching to a genre label.

**Critical safeguard added:** All numerical values (thresholds, ranges, frame counts, tile distances) are explicitly marked as illustrative placeholders. Behavior descriptions are authoritative design intent. Actual thresholds come from Thread 3 (CAS Engine Parameters). Warning at top of document prevents future sessions or agents from treating placeholder values as implementation-ready.

## Current Agent Execution Order

```
Pre-game:
  Experience Interpreter
    → Artistic Director
    → Design Philosopher
    → Dramaturgical Agent (setup: initial conditions, pressure ramp,
                           social hooks, drama density threshold, catalysts)
    → Grammarian → Rhythmist → Game Compiler → Cartographer
    → Provocateur → Coherence Auditor

Runtime (per episode):
  CAS engine ticks (per paradigm spec)
  Drama density monitor (threshold check, catalyst trigger)
  Claude interprets CAS state → narrative
  Visual Manifestation Engine (narrative → scene spec → assets)
  Visibility manager (CAS state → observable behaviors)
  Content agents generate next episode

Diagnostic wrapper (per generated game):
  Simulated Player Agent → Gate 1 auto-checks
  → Moment Extractor clips diagnostic moments
  → Testing UI presents clips to Joe
  → Joe rates (👎/👍/🔥) → Pattern Distiller processes
  → Approved principles feed back into pipeline agents
```

## Generation Flow

```
Player prompt
  → Experience Interpreter maps activity to engine cluster + paradigm
  → Skeleton (~10-15s): paradigm, CAS initial conditions, aesthetics,
    narrative premises, social hooks, pressure ramp, catalysts
  → Episode 1 generates (content agents + prompt-time character/environment sprites)
  → Player plays Episode 1
  → CAS ticks at episode boundary
  → Between-episode window (triple duty):
      1. Player social interaction surface
      2. CAS narrative delivery (cutscenes, dialogue, reveals)
      3. Generation masking (next episode content + new visual assets from CAS changes)
  → Episode 2 generates incorporating CAS state + new visuals
  → [repeat]
```

## What's Next

### Immediate: Repo Sync
1. Drop new docs into repo:
   - `docs/design/paradigm-specs.md` (this session's output)
   - `docs/current-status.md` (this file)
   - `docs/decisions-log.md` (updated with this session's decisions)
2. Commit and push

### Then: Thread 3 — CAS Engine Parameters
Thread 3 takes the behavioral legibility rules from the paradigm specs and makes them machine-readable:
- Exact thresholds for all CAS state → observable behavior mappings
- Tick timing specifications per engine cluster
- Drama density calibration values
- Event magnitude sensitivity curves
- CAS state → aesthetic/audio modifier functions

This is where the placeholder values in the paradigm specs get replaced with real numbers.

### Parallel work still available:
- Thread 4: Dramaturgical Agent ingredients + CAS initial conditions
- Visual Manifestation Engine specification
- Phase 1 implementation in Claude Code (can begin — game state schema + paradigm specs provide enough structure)

---

## Key Open Questions
1. CAS engine parameter tuning — exact thresholds for behavioral legibility (Thread 3)
2. MVP definition — minimum compelling first level
3. Granular constraint relationships between primitives (answers come from building/testing)
4. Visual Manifestation Engine specification
5. Multi-paradigm shift mapping mechanics (partially addressed in paradigm specs cross-cluster section)
6. Behavioral stress response modifier function design
7. Event magnitude calibration per paradigm and game length
8. Overseer model confidence thresholds for escalation levels
