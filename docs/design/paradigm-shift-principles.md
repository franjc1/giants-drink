# Paradigm Shift Design Principles

**Thread 8 Output | 2026-03-04**
**Status:** Principles only — no implementation specification. Implementation deferred to Phase 7 (sessions 34-38). Architecture already supports paradigm shifts via paradigm-independent CAS (Thread 3), flexible spatial format (Decision 11), and dynamic Episode Brief generation (Decision 46).

---

## Context

Two Fires generates games that can span multiple paradigms (platformer, RTS, FPS, racing, etc.). Paradigm shifts — moments where the game changes genre — can occur in two ways:

1. **Prompt-specified:** The player's prompt requests a multi-paradigm game ("Mega Man but dungeons are like Doom and the final boss is Mario Kart style"). The Experience Interpreter and Game Compiler map these to the skeleton's paradigm structure.
2. **CAS-emergent:** The social ecology produces a situation that the current paradigm can no longer adequately represent, and the system shifts to a paradigm that can.

Both cases are governed by the same principles.

---

## Principles

### Principle 1: Shifts Are Consequences, Not Requests

The game changes paradigm because the situation demands it — either because the CAS produced a state the current paradigm can't represent, or because the player's journey through the skeleton reaches a zone designed for a different paradigm. The player never selects a genre from a menu. But they should feel that their choices caused the shift: building an army in a platformer *made* the world outgrow the platformer frame.

### Principle 2: Player Prompts Are Ingredients, Not Contracts

A multi-paradigm prompt shapes initial conditions strongly. The Experience Interpreter picks the dominant paradigm; the Game Compiler skeletonizes reasonable paradigm requests into the game structure. But the CAS and narrative can take the game somewhere the player didn't request if that's where the social ecology drifts. The prompted Mario Kart finale might never happen if the player's faction diplomacy collapsed into full-scale war and the game shifted to RTS for the climax instead. The prompt sets the table; the social ecology decides what dinner looks like.

### Principle 3: CAS State Is Paradigm-Independent and Carries Over Completely

Every entity's loyalty, knowledge, bonds, affect, faction membership, and reputation persists across paradigm shifts. The social ecology IS the game; paradigms are lenses on it. This is already true architecturally (Thread 3 CAS is decoupled from rendering), stated here as an inviolable constraint. No CAS state is ever lost, reset, or simplified during a paradigm transition.

### Principle 4: Identity Persists, Capability Transforms

The player's strategic position in the social ecology carries over. Their mechanical capabilities change entirely. An allied entity is still an ally in the new paradigm — they just respond to different commands, appear in a different visual form, and occupy a different mechanical role. The *reasons* you do things don't change. The *things you can do* change completely.

### Principle 5: Transitions Are Narrative Moments, Not Loading Screens

Paradigm shifts occur in the between-episode window (which already serves triple duty: social interaction surface, CAS narrative delivery, generation masking). The shift should feel like the world transforming around the player — a breath of narrative weight — not a menu, screen wipe, or loading bar. The existing teachability primitive handles mechanical onboarding in the new paradigm.

### Principle 6: Shifts Occur Only at Episode Boundaries

No mid-episode paradigm shifts, no exceptions. The Episode Brief, Coherence Auditor, and full sequencing pipeline assume each episode is a coherent unit. If the CAS produces shift-worthy conditions mid-episode, that drama becomes the content of the current episode's climax. The shift takes effect at the next episode boundary. This is actually more dramatic — the between-episode window gives the transition narrative weight.

### Principle 7: Oscillation Damping Is Required

Some mechanism must prevent rapid back-and-forth shifting when CAS state hovers near a paradigm boundary. The specific mechanism (cooldown, escalating threshold, hysteresis) is a Phase 7 implementation detail. The principle: the system must guarantee paradigm stability long enough for the player to engage meaningfully with each paradigm before any subsequent shift.

### Principle 8: The Overseer Can Weaponize Paradigm Shifts

The Overseer's behavioral model identifies the player's comfort zone. It can nudge CAS dynamics toward situations that force shifts into paradigms the player finds challenging. This is the RLHF-as-gameplay thesis applied at the genre level: the game closes off comfortable strategies not just through difficulty scaling but through paradigm displacement. The player who masters platformers may find the world keeps evolving toward situations that demand RTS thinking.

### Principle 9: Deliberate Shift-Triggering Is Deep Mastery

A player who learns to intentionally manipulate CAS dynamics to force a specific paradigm shift — because that paradigm gives them strategic capabilities they need — has reached the deepest level of system understanding. Example: "I'll build a faction alliance in this platformer to force the RTS shift, because in RTS I can command coordinated attacks on the antagonist's supply lines." The design should make this possible without making it easy or obvious.

### Principle 10: First-Time Paradigm Introductions Get Extended Teachability

If a shift takes the player into a paradigm they've never experienced in this game, the teachability window must be longer and more generous than a shift between familiar paradigms. This is a design constraint, not just an implementation detail — it affects skeleton planning (the Game Compiler should anticipate first-time introductions) and Episode Brief generation (complexity ceiling should be lower for debut paradigm episodes).

---

## What This Document Does NOT Specify (Phase 7 Scope)

- **Shift detection mechanism:** How the system evaluates whether the current paradigm can represent the CAS state (fitness function, trigger rules, or hybrid).
- **Entity crosswalk mappings:** How entities, spatial layouts, and game objects map from one paradigm's representation to another's.
- **Transition experience design:** The specific visual/audio/narrative treatment of the between-episode paradigm transition moment.
- **Oscillation damping parameters:** Cooldown durations, threshold values, decay curves.
- **Overseer shift manipulation tactics:** How the Overseer nudges CAS dynamics toward specific paradigm triggers.
- **Crosswalk coverage:** Which paradigm pairs need explicit mappings vs. which can be handled generically.

These require empirical grounding from Phases 1-6 (working paradigms, playable levels, CAS tuning data) before meaningful specification is possible.

---

## Decisions Made (Thread 8)

### Decision 50: Paradigm Shift Design Principles Established

**Context:** Thread 8 (Multi-Paradigm Shift Mechanics) was scoped to specify shift triggers, state transfer, entity crosswalks, and transition experience. Audit of existing specs (Threads 1-5, 7, 7.6) revealed the architecture already supports paradigm shifts — paradigm-independent CAS, flexible spatial format, dynamic Episode Brief generation. What's missing is implementation-level specification that requires empirical grounding from Phases 1-6.

**Decision:** Establish 10 design principles as constraints for Phase 7 implementation. Defer all implementation specification (detection mechanisms, crosswalk mappings, transition design, damping parameters) to Phase 7 when working paradigms and CAS tuning data exist.

**Rationale:** Specifying shift mechanics now would produce placeholder numbers with no empirical basis. The principles capture the design intent that must survive into Phase 7 without over-constraining implementation details that depend on how the system actually feels when played. The architecture is already shift-ready; what's needed is taste-level guidance, not engineering specification.

### Decision 51: Player Prompts Are Ingredients, Not Contracts

**Context:** Players can prompt for multi-paradigm games ("Mega Man but dungeons are Doom"). How binding is that request?

**Decision:** The Experience Interpreter picks the dominant paradigm; the Game Compiler skeletonizes reasonable paradigm requests. But CAS-driven emergent shifts can override or supplement the prompted structure. The player's prompt shapes initial conditions, not outcomes. A prompted finale paradigm may never materialize if the social ecology evolves elsewhere.

**Rationale:** Consistent with the core design philosophy: ingredient design over outcome prescription. The prompt is the strongest ingredient in initial conditions, but the system's commitment is to emergent quality, not prompt fidelity. Locking paradigm structure to prompts would subordinate the CAS to player expectations — the opposite of the project's thesis.

### Decision 52: Strict Episode-Boundary Paradigm Shifts

**Context:** Should paradigm shifts ever occur mid-episode?

**Decision:** No. Shifts occur only at episode boundaries. If CAS produces shift-worthy conditions mid-episode, that drama becomes the episode's climax content. The shift takes effect at the next boundary.

**Rationale:** The entire sequencing pipeline (Episode Brief, Grammarian, Rhythmist, Cartographer, Provocateur, Coherence Auditor) assumes episode-level coherence. Mid-episode shifts would violate the Auditor's structural guarantees. The between-episode window is specifically designed for transitions, making it the natural home for paradigm shifts. Forcing the drama into the episode's conclusion is narratively stronger than an abrupt mid-level genre change.
