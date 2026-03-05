# Two Fires — Current Status

**Last updated:** 2026-03-04 (Thread 7.6: Sequencing Grammar Refinement)

---

## What Just Happened

### Thread 7.6: Sequencing Grammar Refinement — Interface Specified, Document Updated

Thread 6 was originally scoped as a full sequencing grammar refinement session. Audit of Threads 4, 5, and 7 revealed that most of the original scope was already resolved. The original four gaps:

1. ~~Agent stack outdated in sequencing grammar doc~~ → Resolved by Thread 4 (Dramaturgical Agent eliminated, paradigm grammar + skeleton + override conditions established)
2. ~~Missing paradigm grammar seeds~~ → Correctly deferred to "before Phase 2, leveraging ingestion data + Phase 1 playtesting" (Decision 33)
3. ~~Cumulative vocabulary tracking across episodes~~ → Partially resolved by skeleton's vocabulary budget (Thread 4), fully resolved this session via Episode Brief + behavioral delta model
4. ~~Paradigm shift sequencing~~ → Phase 7 territory (sessions 34-38), premature to specify now

The genuine remaining gap was the **interface between the across-episode skeleton and the within-episode sequencing agents**. This session specified:

**Episode Brief (Decision 46):** A structured object produced by the Game Compiler at each episode boundary, containing eight fields: available vocabulary (established/new/variant with behavioral delta), complexity ceiling, difficulty target, punctuation type, zone identity, mechanical thesis, narrative context, override flags. Generated dynamically at episode entry, not pre-computed. The sequencing agents read the Brief, never the skeleton directly.

**Mechanical Thesis (Decision 47):** The field that separates "competent procedural generation" from "feels like a designer had a vision." Claude identifies the productive friction in available vocabulary (e.g., "patience vs. urgency") at each episode boundary interpretation call. The Grammarian uses this as an organizing principle. Also enables CAS-to-feel influence: same enemies, different thesis, different experience.

**Behavioral Delta on Variants (Decision 48):** CAS-driven entity variants carry a behavioral delta rather than genealogy. Teachability investment scales with how different the variant is from what the player knows. No variant chain tracking needed.

**Vocabulary Record Update (Decision 49):** Tracks what was placed, not what was experienced. Structural completeness verified by Coherence Auditor = established. Clean separation between design quality (system's job) and player mastery (player's job).

**Sequencing grammar framework document updated** to reflect Thread 4 architecture, Episode Brief, and current agent responsibilities.

## Current Agent Execution Order

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
   - `docs/design/sequencing-grammar-framework.md` — updated framework with Episode Brief
   - `docs/current-status.md` — this file
   - Append Thread 7.6 decisions (46-49) to `docs/decisions-log.md`
2. Update `claude.md` — add Episode Brief reference to Paradigm Grammar Framework section, update open design work list
3. Commit and push

### Then: Phase 1 — Paradigm Engine (Sessions 2-8)
Phase 1 remains unblocked. Threads 1-5, 7, and 7.6 provide comprehensive specification. The Episode Brief is a Phase 2 deliverable (when sequencing agents come online), but its structure informs Phase 1 game state design.

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
3. Multi-paradigm shift mapping mechanics
4. Game state schema document update (Thread 3 CAS diffs + Thread 5 VME state + Thread 7 entity population fields)
5. Asset resolution strategy update (reference Game Visual Identity)
6. Social hook pattern library
7. Mechanical directive format specification (flagged by Decision 39)
8. CAS rate constant calibration (testing phase)
9. MVP definition — minimum compelling first level
10. Exact exchange budget numbers per tier (testing/economics)
