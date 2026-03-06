# Two Fires — Architectural Blueprint (claude.md)
## Source of truth for all Claude Code and Claude.ai sessions

**Last updated:** 2026-03-05 (Thread 9: Gameplay Quality, Difficulty & Level Construction Architecture)

---

## Session Protocol

### At the START of every Claude Code session:
1. Read this file (`claude.md`)
2. Read `docs/current-status.md`
3. If the task involves a specific system, read the relevant doc from `docs/design/`
4. If decision history is needed, read `docs/decisions-log.md`

### At the END of every Claude Code session:
1. Update `docs/current-status.md` — what changed this session, what's next
2. Append new decisions to `docs/decisions-log.md` — if any architectural or design decisions were made this session. Use the established format: Session header with date + topic, then numbered decisions with Context, Decision, and Rationale fields
3. Update `claude.md` ONLY if architectural changes were made (new agents, changed pipeline, new systems). Most sessions won't need this.
4. `git add . && git commit -m "[descriptive message]" && git push`

### Key documents and their roles:

| Document | Role | Changes When |
|----------|------|-------------|
| `claude.md` | Architectural blueprint — source of truth for all sessions | Architecture changes |
| `docs/current-status.md` | Handoff document — where we left off, what's next | Every session |
| `docs/decisions-log.md` | Append-only decision record with full rationale | When decisions are made |
| `docs/design/cas-engine-spec.md` | CAS engine specification — primitives, rules, interpretation layer | When CAS design changes |
| `docs/design/game-state-schema.md` | JSON data structures between all systems | When schema changes |
| `docs/design/paradigm-specs.md` | Engine clusters + player-facing paradigm specs | When paradigms are added/modified |
| `docs/design/build-plan-v2.md` | Current build plan (45 sessions, includes diagnostic framework) | When plan changes |
| `docs/design/diagnostic-framework.md` | Fast-fail quality evaluation specification | When diagnostic approach changes |
| `docs/design/sequencing-grammar-framework.md` | Intermediate layer theory + grammar seeds | When sequencing logic evolves |
| `docs/design/asset-resolution-strategy.md` | Two-track asset architecture | When asset approach changes |
| `docs/design/paradigm-shift-principles.md` | Constraint document for Phase 7 paradigm shifts | When shift principles evolve |
| `docs/lore/two-fires.md` | Mythology, endgame mechanics, narrative backbone | When lore decisions are made |
| `giants-drink-transfer.md` | Original complete transfer document (historical reference) | Rarely — superseded by specific docs |

### Cross-environment sync:
- **Claude.ai → repo:** Joe downloads docs from Claude.ai, drops them in repo folders, tells Claude Code to commit and push (or does it manually)
- **Claude Code → Claude.ai:** Joe includes relevant project files in Claude.ai project. current-status.md and decisions-log.md are the most important for context continuity.
- **Conflict resolution:** If current-status.md seems stale or contradictory, check decisions-log.md for the authoritative record of what was decided and when.

---

## Design Philosophy

Two Fires produces emergent game experiences from the mutual constraint of primitives (Barrett's constructionist model applied to game design). No single system dominates. Quality is guaranteed by the shape of the constraint space, not by prescription of outcomes.

- CAS is a primitive, not the whole system
- Agents define constraints, not content
- The specific experience is unpredictable; the quality is guaranteed
- Over-constraining = scripted (bad). Under-constraining = incoherent (bad). The art is in constraint design.
- Debugging = constraint diagnosis: which surface is miscalibrated?

See `docs/decisions-log.md` Decision 1 (Constraint Surface Model) for full rationale.

### SNES Comfort Model (Default Difficulty Philosophy)

Two Fires defaults to SNES-era difficulty: the game respects your time and assumes you want to make progress, not prove yourself. Difficulty comes from complexity layering and spatial pressure, not punishment severity.

**Default forgiveness parameters:**
- Checkpoints: player never loses more than ~60-90s of progress
- Death cost: low (time, not accumulated progress)
- Enemy telegraphs: 400-600ms (thoughtful reaction, not reflex)
- Teachability: consequence-free introduction *zones* for every new element
- Complexity ceiling: conservative (2-3 simultaneous challenge types max)
- Ramp shape: concave (fast early progress, slow difficulty increase, hardest sections near end)

**Era-style prompts are aesthetic signals, not difficulty signals.** "NES style" = 8-bit visuals, SNES-grade forgiveness. Only explicit difficulty language ("hard," "punishing," etc.) overrides the comfort model.

**Rationale:** The social ecology requires cognitive bandwidth to land. A competent, relaxed player notices social hooks. A dying, frustrated player notices nothing. The Competence Bias is both a taste preference and an architectural requirement.

---

## CAS Engine Architecture (Two-Layer Design)

Full specification: `docs/design/cas-engine-spec.md`

### The Two Layers

**Layer 1 — CAS Engine (deterministic JavaScript, ~430-610 lines).** Simple math on a social graph. No interpretation, no thresholds, no essentialist categories. Propagates valence, arousal, and information through bond networks. This layer never knows what "fear" or "loyalty" or "morale" means.

**Layer 2 — Claude Interpretation.** At episode boundaries (and social encounter moments), Claude reads CAS state and constructs situated narrative interpretations. Claude determines what entities are experiencing, what they would do, what the player sees. Claude directs NPC behavior, which creates events, which the CAS processes. The loop is continuous but the layers are cleanly separated.

**Claude never modifies CAS state directly.** Claude directs behavior → behavior creates events → events enter CAS through deterministic rules → CAS updates → Claude interprets. The CAS is a closed system whose behavior is a pure function of its rules, initial conditions, and agent actions (both player and NPC).

### Entity Primitives

Two dynamic state values per entity: **affect valence** (-1.0 to 1.0) and **affect arousal** (0.0 to 1.0). Plus **OCEAN personality** (stable offsets from faction center), **knowledge** (accumulated items with accuracy/source/attribution), and **bonds** (strength/valence/asymmetry).

No loyalty, morale, fear, stress, or other high-level constructs exist at the CAS level. These are constructed by Claude from primitives in context (Barrett's constructionist framework). Same ingredients produce different constructions in different situations — Fleeson's within-person personality variability.

### Five Event Categories

All CAS state changes come from five event types, each with full OCEAN modulation: (1) direct harm/threat, (2) bond change, (3) information/experience, (4) player attention (arousal spike from extraordinary entity), (5) passage of time (drift toward personality baselines, decay).

### Two Propagation Mechanisms

1. **Affect contagion** — valence/arousal spread through bonds continuously. Fast, no attribution. Consensus multiplier (squared ratio) for nonlinear social pressure.
2. **Information propagation** — knowledge packets travel along bonds discretely. Slow, causal attribution travels with info, accuracy degrades per hop.

### Attribution-Gated Reputation

Affect spreads fast without explanation. Understanding of causes spreads slow through information packets. Strategic play involves manipulating both layers. Acting without witnesses limits attribution; acting publicly maximizes it. The antagonist operates under the same information constraints.

### Bond Dynamics

One core rule: bond changes when entity attributes an affect change to another entity (valence shift direction → bond valence; absolute magnitude → bond strength; both love and hate strengthen connection). Plus shared experience strengthening and natural decay.

### Social Timer

CAS runs on independent ~2-minute heartbeat (adjustable per game by Game Compiler). Paradigm ticks determine when player perceives changes. Social graph evolves continuously.

### Faction State

Faction aggregates are computed from members, never set independently (except resources). Computed: avg_valence, avg_arousal, cohesion (inverted std dev of member valence), bond_density, member_count. Stored: resources (0.0-1.0, abstract capacity to act — not a full economy), territory, leader_entity_id, personality_center.

### Superseded Designs

This architecture replaces:
- Thread 1's 7 entity state variables (loyalty, morale, stress, etc.) → valence + arousal
- Thread 1's faction state primitives (morale, loyalty, awareness, disposition, dissent) → computed aggregates from entity affect
- Initial Thread 3's threshold-based behavioral legibility tables → eliminated (Claude interprets)
- Initial Thread 3's cascade formulas with trigger thresholds → eliminated (cascades emerge from propagation)
- Transfer doc's antagonist response menu → eliminated (Claude constructs faction leadership decisions from personality + information + situation)
- Dramaturgical Agent's deterministic catalyst trigger system → replaced by drama density signals to Claude

---

## JSON Game State Schema

Full specification: `docs/design/game-state-schema.md`

**⚠️ SCHEMA NEEDS UPDATE.** The game-state-schema.md document was written before the Thread 3 CAS redesign and contains structures that are now superseded. See the CAS Engine Architecture section above and `docs/decisions-log.md` for the specific diffs that need to be applied.

---

## Level Construction Architecture

**Three components, designed for parsimony and coherent output (Thread 9, Decisions 55-61).**

### Designer (Claude)

The Designer is the soul of the level construction system — both author and tastemaker in a single Claude call. It creates the vision for an episode and then evaluates each section as it's built, maintaining a running model of the player's cumulative psychological experience.

**Inputs:** Episode Brief from Game Compiler + game-type taste profile + Living Taste Document + full game context (skeleton, CAS state, prior episodes, narrative position).

**Produces Episode Vision:**
- Emotional arc for the episode
- Signature design moments ("wouldn't it be cool if..." ideas)
- Hidden intentionality (secrets, curiosity rewards, things that make the player feel anticipated)
- Connective logic to prior and future episodes
- Section-by-section specifications (emotional target, key moments, vocabulary allocation, intended player psychological state at entry/exit)

**Evaluates each section after construction:**
- Maintains cumulative player experience model (confidence, momentum, attention, expectation, curiosity)
- Evaluates against Vision, accumulated experience, and game-type taste profile
- Can approve, request revision with specific feedback, or revise remaining-section specs if the emerging level suggests a better direction
- Catches the "syntactically correct but soulless" failure mode — the gap between valid and authored

### Builder (Claude, Sonnet-level)

The Builder constructs each section as an integrated design problem. Vocabulary sequencing, tension/relief pacing, and spatial layout are considered together, not as separate concerns.

**Receives:** Designer's section specification + paradigm spatial grammar + available vocabulary.

**Produces:** A complete section with entities placed, geometry defined, and all three dimensions (vocabulary, rhythm, space) coherent by construction.

**On rejection:** Receives specific feedback from Designer (taste) or Validator (feasibility) and revises intelligently — not random retry.

Claude as Builder for ALL sections, no deterministic shortcuts. Same author = consistent design sensibility throughout.

### Validator (deterministic code, no Claude calls)

Physical feasibility verification. Fast and cheap.

**Checks:** Pathfinding (can player reach exit?), reachability (all elements accessible?), timing (reaction windows meet SNES Comfort Model?), teachability arc completeness (every new element has safe introduction?), softlock detection.

**Does NOT evaluate:** Taste, quality, experiential properties. Only physical constraint satisfaction.

### The Construction Loop

```
Game Compiler produces Episode Brief
  → Designer produces Episode Vision (1 Claude call)
  → For each section:
      → Builder constructs section (1 Claude call, Sonnet)
      → Validator checks feasibility (deterministic, fast)
      → If Validator fails → Builder retries with constraint violation
      → If Validator passes → Designer evaluates taste (1 Claude call)
      → If Designer flags problems → Builder retries with feedback
      → If Designer approves → next section
      → Designer can revise remaining specs based on emerging level
```

Typical cost: ~10-12 Claude calls per episode. Worst case ~20.

### Game-Type Taste Profiles

The Designer evaluates with paradigm-specific sensibility:
- **Mario-like:** Values flow, momentum, discovery. "Does the player want to keep moving?"
- **Mega Man-like:** Values mastery, precision, tool selection. "Does the player understand the challenge?"
- **Zelda-like:** Values mystery, spatial puzzles, discovery arcs. "Is the player forming hypotheses?"
- **Racing:** Values speed sensation, risk/reward, rivalry. "Does the player feel fast?"
- **Shmup:** Values pattern density, flow state, escalation. "Is the player in the zone?"
- **RTS/Tactics:** Values strategic clarity, meaningful tradeoffs. "Does the player feel clever?"

Profiles derived from ingestion pipeline data, weighted toward popular and well-reviewed games.

### Superseded Agents

Thread 9 consolidates the following into Designer + Builder + Validator:
- **Grammarian** → Builder (vocabulary sequencing integrated into construction)
- **Rhythmist** → Builder (tension/relief integrated into construction)
- **Cartographer** → Builder (spatial layout integrated into construction)
- **Provocateur** → Eliminated (surprise emerges from Designer's taste, not injected violations)
- **Coherence Auditor** → Validator (constraint checking as deterministic code)
- **Simulated Player Agent** (level verification function) → Validator (pathfinding/reachability)

**Note:** The Simulated Player Agent still exists in the diagnostic wrapper for automated playtesting and clip generation. Its verification function was absorbed into the Validator; its diagnostic function remains separate.

---

## Paradigm Grammar Framework

Full-game structural quality is handled by three layers:

**Layer 1 — Paradigm Grammar.** Each paradigm's native structural grammar: units (levels, cups, missions), organization (linear, selectable, branching), punctuation (bosses, championships), progression shape, non-negotiable features. Paradigm property, not per-game. Derived from ingestion pipeline data. Extends paradigm specs.

**Layer 2 — Skeleton.** Game Compiler instantiates the grammar for this specific game/prompt/narrative/intended length. Default plan with vocabulary budget, zone progression, boss placement, complexity ceiling, difficulty shape. Stored in `meta`, consultable by construction pipeline.

**Layer 3 — Override Conditions.** When CAS events produce situations where the skeleton no longer fits, Claude's interpretation layer can adapt it. Indeterminate — Claude constructs adaptation from CAS state + skeleton + game reality. Not a deterministic lookup.

### Five Experience Primitives (Quality Checks)

Emergent properties of well-designed systems, not calibration targets:
1. **Vocabulary accumulation** — player's repertoire grows
2. **Consequentiality escalation** — actions have increasingly large consequences
3. **Environmental legibility** — player understands current context's rules
4. **Earned transformation** — when the game changes, it feels caused
5. **Compression toward resolution** — experience vector points toward climax

### Episode Brief

The interface between Game Compiler and the construction pipeline. Eight fields: available vocabulary (with behavioral delta), complexity ceiling, difficulty target (0.0-1.0), punctuation type, zone identity, mechanical thesis (from Claude), narrative context, override flags. Generated dynamically at each episode boundary.

---

## Paradigm Architecture

Two Fires organizes game types into two layers: **engine clusters** (what gets built) and **player-facing paradigms** (what agents read).

**7 Engine Clusters** — each defined by a unique rendering core + camera + collision + input combination:
1. Side-View Tile World (platformer, beat-em-up, run-and-gun)
2. Top-Down Tile World (action-adventure, RPG overworld, top-down action/racing)
3. Stage/Arena Screen (fighting, RPG combat, fixed-screen, puzzle)
4. Scrolling Shooter (shmups)
5. Pseudo-3D / Mode 7 (racing)
6. Raycasting First-Person (FPS, adventure, dungeon crawler)
7. Strategic Map (RTS, tactics, management sim)

**12 Full Paradigm Specs** — each defines temporal structure, sequencing grammar, social surface, CAS integration, physics, aesthetics, and genre shift interface. See `docs/design/paradigm-specs.md`.

**Key rule:** The Experience Interpreter maps prompt *activities* to engine clusters based on mechanical feel, not genre labels. Any prompt can be served by finding the right engine cluster.

**Shift mechanics:** Intra-cluster shifts (platformer → beat-em-up) = parameter swap, seamless. Cross-cluster shifts (platformer → racing) = rendering core switch, requires transition. All shifts at episode boundaries only (Decision 52).

**CAS integration per paradigm:** Each paradigm spec defines social surface, social timer pace, drama density defaults, witness rules, and information propagation speed defaults.

**⚠️ All numerical values in paradigm specs are starting estimates.** Calibrated through the diagnostic framework during testing.

---

## Conversation System Design

The conversation system connects to the CAS through the two-layer architecture:

**What entities know:** Bounded by their knowledge list. Claude dialogue generation receives ONLY the entity's knowledge items + personality + affect state + bond to player (if any). Architecturally enforced, not prompt-managed.

**What entities feel:** Constructed by Claude from affect primitives in context. Same entity, different context → different emotional expression.

**What entities say:** Claude generates dialogue grounded in: (1) affect state, (2) OCEAN personality, (3) knowledge list, (4) bond to player, (5) faction context and role, (6) previous narrative interpretation, (7) paradigm's conversation surface.

**Conversation outcomes as CAS events:** What the player says = information the entity receives (category 3 event). Player attention = arousal event (category 4). Promises, threats, intel sharing — each generates events with player as causal agent. Bond updates through attribution. Conversation is a CAS interaction, not a separate system.

**`conversation_state`** tracking: `never_contacted` → `hailed_rejected` / `spoken_once` → `spoken_multiple` → `allied` / `betrayed`. Mechanical state for gating conversation depth, NOT emotional state.

**No artificial conversation soft caps (Decision 40).** Claude plays each character naturally — length emerges from knowledge depth, personality, affect, and situation.

**Player exchange budget (Decision 41).** Visible UI counter, X exchanges per 24 hours, tierable for monetization. Transforms API cost constraint into strategic game mechanic.

**Named + Population entity architecture (Decision 42).** Named entities have full mind schemas. Population entities share faction template + minor variation. Population entities promote to named on first player conversation.

**Emissary conversations (Decision 45).** Player instructs ally → single Claude API call with both entity schemas → emissary reports filtered through own personality. Extends player reach beyond exchange budget at cost of trust mediation.

---

## The Lore System

The Two Fires lore system is **unchanged** by recent redesigns. Full lore document: `docs/lore/two-fires.md`.

Knowledge resolution layers (ambient/structural/actionable) work through CAS information propagation. The Giant/Overseer operates through the two-layer architecture — actions create CAS events, manipulations are Claude-directed NPC actions. Lore discovery is enhanced by the attribution system.

---

## Manifestation Layer

CAS state → Claude interprets at multiple scales in single call → produces unified output: narrative update + behavioral directives + visual manifestation specs + audio/aesthetic modifiers.

**Three generation layers:**
- `layer_1_compositional` — recombining existing assets
- `layer_2_contextual_variant` — modified pose/state/text
- `layer_3_novel` — AI-generated assets

**Aesthetic and audio modifiers** produced by Claude's interpretation. Identity stable, expression dynamic (Decision 7).

Full specification: `docs/design/vme-spec.md`

---

## Diagnostic & Tuning Framework Summary

Full specification: `docs/design/diagnostic-framework.md`

**Fast-fail funnel:**
- **Gate 1 (automated):** Does it run? Pathable? Latency OK? Schema valid?
- **Gate 2 (Joe reviews clips, ~30-45s):** 5 Necessary Conditions — readable opening, physics character, teachability integrity, visual coherence, rhythm heartbeat. Any 👎 = fast fail.
- **Gate 3 (Joe reviews clips, ~45-60s):** INUS Conditions — provocateur moment (now: Designer signature moment), aesthetic personality, social hook (Phase 5+), entity behavior (Phase 5+). Only if Gate 2 passes.
- **Gate 4 (periodic):** Holistic playthroughs, 5-15 minutes.

**Rating system:** 👎 / 👍 / 🔥 + optional text

**Diagnostic agents:** Simulated Player Agent, Moment Extractor, Comparative Diagnostician, Archetype Stress-Tester, Pattern Distiller (→ Living Taste Document).

**Primary tuning targets:** CAS_CONFIG rate constants, Claude interpretation prompt quality, drama density calibration, Designer vision quality, Builder construction quality, game-type taste profile calibration.

---

## Agent Execution Order

```
Pre-game:
  Experience Interpreter
    → Artistic Director
    → Game Visual Identity generator (Track B only)
    → Design Philosopher
    → Game Compiler (expanded: CAS initial conditions, social graph,
                     personality distributions, social timer pace,
                     drama calibration, skeleton instantiation,
                     social hook placement, initial narrative,
                     knowledge distribution, population templates,
                     named entity individuation,
                     SNES Comfort Model forgiveness parameters)

Per-episode level construction:
  Game Compiler produces Episode Brief
    → Designer produces Episode Vision
    → For each section:
        Builder constructs → Validator verifies → Designer evaluates taste
    → Episode served; Vocabulary Record Update written

Runtime loop:
  CAS engine ticks on social timer (deterministic, continuous)
    → affect propagation, information propagation, bond dynamics,
       faction aggregates, drama density evaluation
  
  At paradigm tick (episode boundary):
    → Claude receives: CAS snapshot + previous narrative + drama signal
        + skeleton context
    → Claude interprets at multiple scales
    → Claude produces: narrative update, behavioral directives,
        visual/audio/aesthetic specs, faction leadership decisions (→ CAS events),
        mechanical thesis
    → Game Compiler produces Episode Brief
    → Construction pipeline: Designer → Builder → Validator
    → VME resolves visual/audio directives
    → Next episode rendered

  Player conversations:
    → Exchange budget system, CAS events generated
    → Population → named promotion on first contact

  Emissary delegation:
    → Single API call, personality-filtered report

Diagnostic wrapper:
  Simulated Player Agent → Gate 1 auto-checks
  → Moment Extractor → Testing UI → Joe rates (👎/👍/🔥)
  → Pattern Distiller → Living Taste Document
  → Feeds back into taste profiles + Designer prompts + CAS_CONFIG
```

---

## Generation Flow

```
Player prompt
  → Skeleton (~10-15s): paradigm grammar instantiation
      + SNES Comfort Model defaults (forgiveness parameters)
      + Game Visual Identity (Track B)
      + Knowledge distribution + population templates + named entities
      + Layer 3 initial assets
  → Episode 1:
      Game Compiler produces Episode Brief from skeleton
      → Designer produces Episode Vision (with taste profile)
      → Builder constructs sections (Claude, Sonnet)
      → Validator checks each section (deterministic)
      → Designer taste-checks each section (cumulative experience model)
      → Episode served; Vocabulary Record Update written
  → Player plays Episode 1 (CAS evolving on social timer)
  → Social hook at episode 1-2 boundary
  → Player conversations consume exchange budget, generate CAS events
  → At episode boundary:
      CAS snapshot → Claude interpretation → Episode Brief → construction pipeline
  → Between-episode window (triple duty):
      1. Player social interaction surface
      2. CAS narrative delivery
      3. Generation masking (construction + VME + Layer 2/3 assets)
  → Episode 2+ with accumulated state + vocabulary record
  → [repeat, with skeleton adapting if override conditions met]
```

---

## Quality Evaluation System

The diagnostic framework evaluates Designer + Builder output quality:

**Gate 2/3 conditions updated for Thread 9:**
- NC2 (physics character): Does the game feel SNES-comfortable? Forgiveness parameters within comfort model?
- INUS-1 (previously "provocateur moment"): Now evaluates **Designer signature moment** — does the episode have at least one moment that feels intentionally surprising or delightful?
- Entity behavior conditions (Phase 5+): Unchanged — evaluates Claude's behavioral interpretations.

**Pattern Distiller tuning targets updated:**
- CAS_CONFIG rate constants (unchanged)
- Claude interpretation prompt quality (unchanged)
- Drama density calibration (unchanged)
- **Designer Episode Vision quality** — does the Designer produce compelling, specific visions?
- **Builder construction quality** — does the Builder produce sections that serve the Designer's vision?
- **Taste profile calibration** — are the right things valued for each game type?
- **Living Taste Document** — accumulates from Joe's 🔥 ratings into transferable design principles that feed the Designer

---

## Social Hook Design

Social hooks draw the player from mechanical gameplay into social engagement. Claude reads CAS state at episode boundary → identifies narratively interesting entity states → constructs behavioral directives as natural expressions of entity state. One designed hook at episode 1-2 boundary, placed by Game Compiler.

---

## Entity Population Architecture

**Named entities:** Full mind schema (OCEAN, affect, knowledge, bonds, conversation_state). Individually realized by Game Compiler at creation.

**Population entities:** Share faction template + minor OCEAN variation. No individual knowledge beyond faction defaults. On first player contact, promoted to named: assigned unique name, individual OCEAN offsets calculated, initial knowledge populated, bond to player created. Population entities can also be promoted by Claude's interpretation when narratively significant events occur near them.

**Emissary system:** Player delegates conversations through allies. Single API call with dual schemas. Personality-filtered reports. Extends reach beyond exchange budget.
