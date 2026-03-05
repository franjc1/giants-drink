# Two Fires — Current Status

**Last updated:** 2026-03-04 (Thread 8: Multi-Paradigm Shift Mechanics — Principles Only)

---

## What Just Happened

### Thread 8: Multi-Paradigm Shift Mechanics — Principles Established, Implementation Deferred

Thread 8 was originally scoped as a full specification of paradigm shift mechanics (triggers, state transfer, entity crosswalks, transition experience). Before diving in, audit of Threads 1-5, 7, and 7.6 revealed:

- **CAS state carryover:** Already solved. The CAS engine (Thread 3) is paradigm-independent by design. Entity state, social graphs, knowledge, reputation — all live in the CAS layer, not the paradigm layer. Carries over by default.
- **Schema support:** Already solved. Decision 11 (paradigm-flexible spatial format) ensures the schema accommodates multiple paradigms without restructuring.
- **Episode generation:** Already solved. The Episode Brief (Decision 46) generates dynamically at each episode boundary, reading from the appropriate paradigm grammar seed. A paradigm-shifted episode just gets a Brief from the new paradigm's seed.
- **What's genuinely missing:** Implementation-level specification (detection mechanisms, crosswalk mappings, damping parameters, transition experience design) that requires empirical grounding from Phases 1-6.

**Decision:** Establish design principles as constraints for Phase 7 implementation. Defer all implementation specification.

**10 principles established (Decisions 50-52):**

1. Shifts are consequences, not requests
2. Player prompts are ingredients, not contracts (multi-paradigm prompts shape initial conditions but CAS can override)
3. CAS state is paradigm-independent and carries over completely
4. Identity persists, capability transforms
5. Transitions are narrative moments, not loading screens
6. Shifts occur only at episode boundaries, no exceptions
7. Oscillation damping is required
8. The Overseer can weaponize paradigm shifts
9. Deliberate shift-triggering is deep mastery
10. First-time paradigm introductions get extended teachability

**Key design insight:** The multi-paradigm prompt case (e.g., "Mega Man but dungeons are Doom") doesn't violate the consequences principle — it reframes it. The prompt becomes the skeleton's paradigm map. The Experience Interpreter picks the dominant paradigm and skeletonizes reasonable requests. But emergent CAS shifts can override or supplement the prompted structure. The system honors prompt intent without being bound by it.

**New document:** `docs/design/paradigm-shift-principles.md` — constraint document for Phase 7.

---

## Current Agent Execution Order

*(Unchanged from Thread 7.6)*

```
Pre-game:
  Experience Interpreter
    → Artistic Director
    → Game Visual Identity generator (Track B only)
    → Design Philosopher
    → Game Compiler (expanded: CAS initial conditions, social graph, personality
                     distributions, social timer pace, drama calibration, skeleton
                     instantiation, social hook placement, initial narrative,
                     knowledge distribution, population template generation,
                     named entity individuation)
    → Grammarian → Rhythmist → Cartographer
    → Provocateur → Coherence Auditor
    → Layer 3 asset generation (under Game Visual Identity)
    → Assets enter game-instance library

Runtime loop:
  CAS engine ticks on social timer (deterministic, continuous)
  
  At paradigm tick (episode boundary):
    → Claude receives: CAS snapshot + previous narrative + drama signal + skeleton context
    → Claude interprets at multiple scales
    → Claude produces:
        Visual/audio directives → VME directive stack
        Mechanical directives → paradigm engine
        Mechanical thesis → Episode Brief (via Game Compiler)
        Narrative update, faction leadership decisions → CAS events
    → Game Compiler produces Episode Brief from skeleton + CAS + Claude interpretation
        + previous vocabulary record
    → Grammarian → Rhythmist → Cartographer → Provocateur → Coherence Auditor
    → VME resolves directives via Layer 1/2/3
    → Episode served; Vocabulary Record Update written
    → Next episode renders with updated visual state + sequenced content

  Player conversation:
    → Player hails entity (costs 1 exchange from daily budget)
    → If entity willing: conversation opens (multi-turn Claude API call)
    → If entity unwilling: rejection displayed (manner communicates CAS state)
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

## Generation Flow

*(Unchanged from Thread 7.6)*

```
Player prompt
  → Skeleton (~10-15s): paradigm grammar instantiation
      + Game Visual Identity (Track B)
      + Knowledge distribution (master fact list → entity knowledge lists)
      + Population templates generated for batch entity classes
      + Named entities individually realized
      + Layer 3 generates initial assets
  → Episode 1: Game Compiler produces Episode Brief from skeleton
      + Grammarian → Rhythmist → Cartographer → Provocateur → Auditor
      + Episode served; Vocabulary Record Update written
  → Player plays Episode 1 (CAS evolving on social timer)
  → Player conversations (if any) consume exchange budget, generate CAS events
  → At episode boundary: Claude interpretation → Episode Brief for next episode
  → Between-episode window (triple duty):
      1. Player social interaction surface
      2. CAS narrative delivery
      3. Generation masking (sequencing agents + VME + any Layer 2/3 assets)
  → Episode 2+ with accumulated state + updated vocabulary record
  → [repeat]
```

## What's Next

### Immediate: Repo Sync
1. Drop into repo:
   - `docs/design/paradigm-shift-principles.md` — new constraint document for Phase 7
   - `docs/current-status.md` — this file
   - Append Thread 8 decisions (50-52) to `docs/decisions-log.md`
2. Update `claude.md` — add paradigm-shift-principles.md to key documents table, update open design work list
3. Commit and push

### Then: Phase 1 — Paradigm Engine (Sessions 2-8)
Phase 1 remains unblocked. All design threads (1-5, 7, 7.6, 8) are complete or appropriately deferred. The paradigm shift principles inform Phase 1 schema design (paradigm-independent CAS, flexible spatial format) but require no Phase 1 implementation.

### Before Phase 2: Paradigm Grammar Buildout
Extend each paradigm spec with full-game structural grammar. Leverage ingestion pipeline data + Phase 1 playtesting experience.

### Parallel design threads (if desired):
- Social hook pattern library
- Remaining paradigm spec completion
- Game state schema document update (apply all thread diffs)

---

## Key Open Questions
1. Paradigm grammar specifics per paradigm (before Phase 2)
2. CAS state → level content translation per paradigm
3. ~~Multi-paradigm shift mapping mechanics~~ → Principles established (Thread 8), implementation deferred to Phase 7
4. Game state schema document update (Thread 3 CAS diffs + Thread 5 VME state + Thread 7 entity population fields)
5. Asset resolution strategy update (reference Game Visual Identity)
6. Social hook pattern library
7. Mechanical directive format specification (flagged by Decision 39)
8. CAS rate constant calibration (testing phase)
9. MVP definition — minimum compelling first level
10. Exact exchange budget numbers per tier (testing/economics)
