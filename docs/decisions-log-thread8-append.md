# Decisions Log — Thread 8 Append

## Append this to the existing `docs/decisions-log.md`

---

## Session: 2026-03-04 — Multi-Paradigm Shift Mechanics (Thread 8)

### Decision 50: Paradigm Shift Design Principles Established (Implementation Deferred)

**Context:** Thread 8 (Multi-Paradigm Shift Mechanics) was scoped to specify shift triggers, state transfer, entity crosswalks, and transition experience. Audit of existing specs (Threads 1-5, 7, 7.6) revealed the architecture already supports paradigm shifts — paradigm-independent CAS, flexible spatial format (Decision 11), dynamic Episode Brief generation (Decision 46). What's missing is implementation-level specification that requires empirical grounding from Phases 1-6.

**Decision:** Establish 10 design principles as constraints for Phase 7 implementation. Defer all implementation specification (detection mechanisms, crosswalk mappings, transition design, damping parameters) to Phase 7 when working paradigms and CAS tuning data exist.

The 10 principles:
1. Shifts are consequences, not requests
2. Player prompts are ingredients, not contracts
3. CAS state is paradigm-independent and carries over completely
4. Identity persists, capability transforms
5. Transitions are narrative moments, not loading screens
6. Shifts occur only at episode boundaries, no exceptions
7. Oscillation damping is required
8. The Overseer can weaponize paradigm shifts
9. Deliberate shift-triggering is deep mastery
10. First-time paradigm introductions get extended teachability

**Rationale:** Specifying shift mechanics now would produce placeholder numbers with no empirical basis. The principles capture the design intent that must survive into Phase 7 without over-constraining implementation details that depend on how the system actually feels when played. The architecture is already shift-ready; what's needed is taste-level guidance, not engineering specification.

---

### Decision 51: Player Prompts Are Ingredients, Not Contracts

**Context:** Players can prompt for multi-paradigm games ("Mega Man but dungeons are Doom and final boss is Mario Kart style"). How binding is that request?

**Decision:** The Experience Interpreter picks the dominant paradigm; the Game Compiler skeletonizes reasonable paradigm requests into the game structure. But CAS-driven emergent shifts can override or supplement the prompted structure. The player's prompt shapes initial conditions, not outcomes. A prompted finale paradigm may never materialize if the social ecology evolves elsewhere.

**Rationale:** Consistent with the core design philosophy: ingredient design over outcome prescription. The prompt is the strongest ingredient in initial conditions, but the system's commitment is to emergent quality, not prompt fidelity. Locking paradigm structure to prompts would subordinate the CAS to player expectations — the opposite of the project's thesis.

---

### Decision 52: Strict Episode-Boundary Paradigm Shifts

**Context:** Should paradigm shifts ever occur mid-episode? Initial proposal included "rare climactic exceptions."

**Decision:** No mid-episode shifts, no exceptions. If CAS produces shift-worthy conditions mid-episode, that drama becomes the current episode's climax content. The shift takes effect at the next episode boundary.

**Rationale:** The entire sequencing pipeline (Episode Brief, Grammarian, Rhythmist, Cartographer, Provocateur, Coherence Auditor) assumes episode-level coherence. Mid-episode shifts would violate the Auditor's structural guarantees. The between-episode window is specifically designed for transitions, making it the natural home for paradigm shifts. Forcing the drama into the episode's conclusion is narratively stronger than an abrupt mid-level genre change.

---

### Open Design Work (Updated)

**Resolved by Thread 8:**
- ~~Multi-paradigm shift mapping mechanics~~ ✅ (Design principles established; implementation deferred to Phase 7)

**Remaining:**
1. Paradigm grammar specifics per paradigm (before Phase 2)
2. CAS state → level content translation per paradigm
3. Social hook pattern library
4. Game state schema document update (apply Thread 3 CAS diffs + Thread 5 VME state + Thread 7 entity population fields)
5. Asset resolution strategy document update (reference Game Visual Identity)
6. Mechanical directive format specification (flagged by Decision 39)
7. CAS rate constant calibration (testing phase)
8. MVP definition — minimum compelling first level
9. Exact exchange budget numbers per tier (testing/economics)
