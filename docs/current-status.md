# Two Fires — Current Status

**Last updated:** 2026-03-01

---

## What Just Happened

### Diagnostic & Tuning Framework Designed and Integrated into Build Plan

Extended design session addressing the fundamental challenge: how do you quality-assure a system that generates infinite variety? Traditional playtesting breaks down when every game instance is procedurally different. You can't QA infinity.

**The solution:** Don't test instances — test the generator. Joe's time is spent on diagnostic moments and taste decisions, not full playthroughs. Taste principles extracted from ratings compound over time, making the generator itself better.

**Framework designed:**
1. **Fast-fail evaluation funnel** — Gate 1 (automated checks) → Gate 2 (5 necessary conditions, Joe reviews clips in ~30-45s) → Gate 3 (INUS conditions, ~45-60s) → Gate 4 (periodic holistic playthroughs)
2. **Five necessary conditions** — readable opening, responsive controls (latency auto-checked; physics character via side-by-side comparison clip), teachability integrity, visual coherence, rhythm heartbeat
3. **Three-tier rating** — 👎/👍/🔥 with optional text rationale
4. **Pattern Distiller** — converts Joe's ratings into transferable design principles (Living Taste Document). Three modes: failure patterns, excellence patterns, parameter correlation.
5. **Testing UI** — zero-navigation card-based web interface. Phase-aware. Two modes: review pre-generated queue, or type prompt and evaluate. Principles tab for approving/rejecting distilled taste principles.
6. **Archetype Stress-Tester** — canonical prompt battery ensuring quality transfers across all game types, with regression detection
7. **Comparative Diagnostician** — variance analysis across multiple generations of same prompt (consistent vs. healthy variance vs. erratic)

**Build plan updated to v2 (45 sessions):** Diagnostic infrastructure threaded through all phases, not bolted on as a separate phase. +5 sessions spread across the plan.

**Session protocol established:** Rules for syncing context across Claude.ai and Claude Code sessions. `claude.md` gets a session protocol section + diagnostic framework summary + design philosophy summary.

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
   - `docs/design/diagnostic-framework.md`
   - `docs/design/build-plan-v2.md`
   - `docs/current-status.md` (this file)
   - `docs/decisions-log.md`
   - `claude-md-addition.md` (content to append to existing `claude.md`)
2. Append session protocol + diagnostic summary + design philosophy sections to `claude.md`
3. Commit and push

### Then: Begin Phase 1 — Paradigm Engine (Sessions 2-8)

**Phase 1 builds:**
1. Core game loop + canvas rendering
2. Entity system (player, enemies, items, environment)
3. Input manager (keyboard, mobile future-proofed)
4. Collision detection
5. Physics parameter table with easing curves (JSON-driven)
6. First rendering core: 2D tile-based with configurable camera
7. JSON-to-game machine: load config → get playable level
8. Simulated Player Agent (pathfinding + timeline recording)
9. Moment Extractor v1 (clips for NC1, NC2, NC4)
10. Testing UI v1 (card-based rating interface)
11. Gate 1 auto-checks

**First milestone:** A JSON config that produces a playable platformer level, auto-tested by Simulated Player, with diagnostic clips ready for Joe's review in the Testing UI.

### Ingredient specification threads still recommended (can proceed in parallel with Phase 1):
- Paradigm specs (all 13+ paradigms)
- CAS engine parameters + behavioral legibility rules
- Visual Manifestation Engine specification
- Dramaturgical Agent ingredients + CAS initial conditions

---

## Key Open Questions
1. Game state JSON schema — the exact contract between every system (must be specified before building)
2. MVP definition — minimum compelling first level
3. Granular constraint relationships between primitives (answers come from building/testing)
4. Paradigm spec completion for all 13+ paradigms
5. Visual Manifestation Engine specification
6. Multi-paradigm shift mapping mechanics
