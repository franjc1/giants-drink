# Two Fires — Architectural Blueprint (claude.md)
## Source of truth for all Claude Code and Claude.ai sessions

**Last updated:** 2026-03-04 (Thread 5: Visual Manifestation Engine Specification)

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
| `docs/design/paradigm-specs.md` | Engine clusters + player-facing paradigm specs + full-game paradigm grammars (when built) | When paradigms are added/modified |
| `docs/design/build-plan-v2.md` | Current build plan (45 sessions, includes diagnostic framework) | When plan changes |
| `docs/design/diagnostic-framework.md` | Fast-fail quality evaluation specification | When diagnostic approach changes |
| `docs/design/sequencing-grammar-framework.md` | Intermediate layer theory + grammar seeds | When sequencing logic evolves |
| `docs/design/asset-resolution-strategy.md` | Two-track asset architecture | When asset approach changes |
| `docs/design/vme-spec.md` | Visual Manifestation Engine — directive types, scene spec format, three-layer model, Game Visual Identity | When VME architecture changes |
| `docs/lore/two-fires.md` | Mythology, endgame mechanics, narrative backbone | When lore decisions are made |
| `giants-drink-transfer.md` | Original complete transfer document (historical reference) | Rarely — superseded by specific docs |

### Cross-environment sync:
- **Claude.ai → repo:** Joe downloads docs from Claude.ai, drops them in repo folders, tells Claude Code to commit and push (or does it manually)
- **Claude Code → Claude.ai:** Joe includes relevant project files in Claude.ai project. current-status.md and decisions-log.md are the most important for context continuity.
- **Conflict resolution:** If current-status.md seems stale or contradictory, check decisions-log.md for the authoritative record of what was decided and when.

---

## Design Philosophy

Two Fires produces emergent game experiences from the mutual constraint of primitives. No single system dominates. Quality is guaranteed by the shape of the constraint space, not by prescription of outcomes.

Core principles:
- Agents define constraints, not content. Their job is to shape the solution space.
- CAS is a primitive/ingredient, not the whole system. Enormously influential, constrained by and constraining other primitives.
- Over-constraining = scripted (bad). Under-constraining = incoherent (bad). The art is in constraint design.
- Debugging is constraint diagnosis: which surface is miscalibrated?
- Analogous to Barrett's constructionist model: experience emerges from primitives in context.

---

## Agent Execution Order

```
Pre-game:
  Experience Interpreter
    → Artistic Director
    → Game Visual Identity generator (Track B only — instantiates visual system)
    → Design Philosopher
    → Game Compiler (expanded role: CAS initial conditions, social graph topology,
                     personality distributions, social timer pace, drama calibration,
                     skeleton instantiation from paradigm grammar, social hook placement,
                     initial narrative)
    → Grammarian → Rhythmist → Cartographer
    → Provocateur → Coherence Auditor
    → Layer 3 asset generation (all entities/environments under Game Visual Identity)
    → Assets enter game-instance library

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
    → Claude produces TWO parallel output streams:
        Visual/audio directives → VME directive stack (resolved via Layer 1/2/3)
        Mechanical directives → paradigm engine (physics, interactions, behavior)
        Plus: narrative update, faction leadership decisions (→ CAS events)
    → Claude evaluates: does skeleton still fit world reality? (override conditions)
    → Leadership decisions become CAS events → processed next cycle
    → Behavioral directives → paradigm engine renders behavior
    → Visual/audio specs → VME resolves and renders scene
  
  Player acts → events enter CAS → cycle continues

Diagnostic wrapper (per generated game):
  Simulated Player Agent → Gate 1 auto-checks
  → Moment Extractor clips diagnostic moments
  → Testing UI presents clips to Joe
  → Joe rates (👎/👍/🔥) → Pattern Distiller processes
  → Approved principles feed back into CAS_CONFIG tuning + Claude prompt refinement
```

---

## Generation Flow

```
Player prompt
  → Skeleton (~10-15s): paradigm grammar instantiation → skeleton
      (vocabulary budget, zone progression, boss placement, difficulty shape,
       CAS initial conditions, social graph, personality distributions,
       aesthetics, narrative premises, social hooks, social timer pace)
      + Game Visual Identity (Track B: palette architecture, proportion grid,
        detail density, animation budget, visual shorthand, silhouette rules)
      + Layer 3 generates all initial entity/environment assets within identity
      + Assets enter game-instance library
  → Episode 1 generates (content agents read skeleton + sequencing grammar
      + CAS state + library assets)
  → Player plays Episode 1 (CAS evolving on social timer)
  → Social hook at episode 1-2 boundary (designed encounter, emergent outcome)
  → At episode boundary:
    → CAS snapshot taken
    → Claude interpretation call (multi-scale + skeleton context)
    → Override condition evaluation (does skeleton still fit?)
    → Claude produces: visual/audio directives + mechanical directives
        + narrative update + faction leadership decisions (→ CAS events)
    → VME updates directive stack, resolves via Layer 1/2/3
  → Between-episode window (triple duty):
      1. Player social interaction surface (conversations = CAS events)
      2. CAS narrative delivery (rendered by VME from directive stack)
      3. Generation masking (next episode content + any Layer 2/3 asset generation)
  → Episode 2+ generates incorporating: skeleton constraints + CAS state
      + Claude interpretation + sequencing grammar + accumulated VME directive stack
  → [repeat, with skeleton adapting if override conditions met]
```

---

## CAS Engine Architecture

Full specification: `docs/design/cas-engine-spec.md`

### Two-Layer Architecture

**Layer 1 — CAS Engine (deterministic JS).** Entities have two dynamic state values: affect valence (-1.0 to 1.0) and arousal (0.0 to 1.0). Plus OCEAN personality (stable offsets from faction center), knowledge (accumulated items with accuracy/source/attribution), and bonds (strength/valence/asymmetry).

No loyalty, morale, fear, stress, or other high-level constructs exist at the CAS level. These are constructed by Claude from primitives in context (Barrett's constructionist framework). Same ingredients produce different constructions in different situations — Fleeson's within-person personality variability.

**Layer 2 — Claude Interpretation.** At episode boundaries, Claude reads the full CAS state and constructs situated narrative interpretations. Claude determines what entities are experiencing, what they would do, and what the player sees. No essentialist categories — Claude constructs meaning from primitives in context.

**Claude never modifies CAS state directly.** Claude directs NPC behavior → behavior creates events → events enter the CAS through deterministic rules → CAS updates → Claude interprets.

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

CAS runs on independent ~2-minute heartbeat (adjustable per game by Game Compiler at creation time). Paradigm ticks determine when player perceives changes. Social graph evolves continuously.

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
- Dramaturgical Agent as discrete agent → eliminated entirely (Decision 29, Thread 4). Functions distributed to Game Compiler, CAS engine, Claude interpretation, paradigm grammar framework

---

## JSON Game State Schema

Full specification: `docs/design/game-state-schema.md`

**⚠️ SCHEMA NEEDS UPDATE.** The game-state-schema.md document was written before the Thread 3 CAS redesign and Thread 5 VME spec. The following changes are required:

### Thread 3 Changes (CAS Redesign)

**`world.factions.*.state` — Replace Entirely.** Old: 7 stored primitives. New: `resources` only stored; `avg_valence`, `avg_arousal`, `cohesion`, `bond_density`, `member_count` computed as aggregates.

**`world.entities.*.mind` — Replace Entirely.** Old: `disposition`, `emotional_state`, `motivations`, `current_goal`. New: `affect: { valence, arousal }` only. Everything else constructed by Claude.

**`cas` block — Add.** New top-level block: `social_timer` (interval, last_tick, game_pace_modifier), `previous_narrative` (Claude's last interpretation for continuity), `drama_density` (recent_significant_changes, cadence_window, stagnation/melodrama signals).

**`episode.entity_placements.*.behavioral_override` — Change reason format.** From CAS threshold reference to Claude interpretation trace.

**`episode.visual_manifestations.*.cas_source` — Change format.** From CAS threshold value to Claude narrative interpretation reference.

**`world.event_log` effects — Change format.** Effects reference valence/arousal and include bond changes and info packet creation.

**System Read/Write Reference — Add Claude Interpretation Layer row.**

### Thread 5 Changes (VME Spec)

**Add `vme_state` section.** The directive stack is serializable game state. New section containing the per-target directive stacks maintained by the VME. Enables save/restore of visual state.

**Add `game_visual_identity` to `meta` (Track B).** When ASSET_MODE is "generated", the Game Visual Identity (palette architecture, proportion grid, detail density rules, animation budget, visual shorthand dictionary, silhouette distinctiveness rules) is stored in meta as an immutable reference for all subsequent asset generation.

---

## Conversation System Design

The conversation system connects to the CAS through the two-layer architecture:

**What entities know:** Bounded by their knowledge list. Claude dialogue generation receives ONLY the entity's knowledge items + personality + affect state + bond to player (if any). The entity cannot reference information it doesn't possess.

**How entities speak:** Claude constructs dialogue from personality (OCEAN) + affect (valence/arousal) + bond state + knowledge. The speaking style, willingness to share, emotional register, and truthfulness are all Claude-constructed from these primitives. No disposition variable or emotional_state enum.

**Conversations as CAS events:** Every conversation creates events that enter the CAS. Sharing information = information propagation event. Player kindness/cruelty = affect event on the entity. Conversations have witnesses (nearby entities) who process events through their own bonds and knowledge.

When the player hears "legends speak of two lights stolen from the sky," that's an ambient knowledge item with no specific causal agent. When they hear "there is a way to bridge worlds" from a high-ranking figure, that's a structural knowledge item with attribution to the source entity. When they receive actionable knowledge, the entity sharing it has made a choice to share — which is Claude constructing a decision from that entity's affect state, personality, bond to player, and knowledge. The sharing IS the evidence of trust, not a disposition threshold being crossed.

---

## Manifestation Layer — Visual Manifestation Engine

Full specification: `docs/design/vme-spec.md`

The VME sits between Claude's interpretation output and the paradigm engine's renderer. It receives semantic-but-specific directives from Claude and produces render-ready assets and compositions. Claude speaks in semantic visual/audio language; the VME resolves mechanically. Claude is the meaning-maker; the VME is the resolver.

### Claude's Dual Output Streams

At each episode boundary interpretation call, Claude produces TWO parallel output streams:

1. **Visual/audio directives** (consumed by VME) — what the player should see and hear has changed
2. **Mechanical directives** (consumed by paradigm engine / Game Compiler) — how new objects/entities behave, interact, and respond to physics

Novel interactive objects (weapons, vehicles, tools) require BOTH streams. The visual stream describes appearance in each state; the mechanical stream describes behavior. Neither system sees the other's directives. Claude is the only system that reasons about both.

### Seven Directive Types

The scene spec is an array of directives. Claude may produce zero (nothing changed) or many (major event).

| Type | Primitives | What It Targets |
|------|-----------|-----------------|
| **Entity Visual Modifier** | size, color/palette, added element, removed element, animation state, transparency/visibility, silhouette change, entity replacement (partial/full) | Individual entities or faction members |
| **Scene Composition** | elements, spatial arrangement, scale context, temporal nature, trigger context | Composed multi-element visual moments |
| **Environment Modifier** | palette shift, tile replacement, added detail, removed detail, lighting change, weather/atmospheric | Zones, locations, faction territory (local or global scope) |
| **Scene-Level Effect** | screen shake, screen flash, transition effect, UI-level overlay | The screen/camera itself |
| **Novel Entity Spec** | distinguishing features, size class, palette constraints, style era reference, animation states needed, role/archetype reference | Entities/objects that don't exist yet (triggers Layer 3) |
| **Text Content** | text string, display method, visual style, language/legibility | Readable text in game world |
| **Audio/Music Modifier** | tonal shift, instrumentation change, tempo change, volume/dynamics, sound effect trigger, ambient texture | Music and sound (local or global scope) |

### Cross-Cutting Fields (All Directives)

Every directive carries: target, persistence (permanent/episode/momentary), priority (critical→ambient), narrative context (debugging/coherence), timing/sequencing (group ID + order), intensity/magnitude (subtle→extreme), layering behavior (additive vs replacement).

### Directive Stack Model

The VME maintains a directive stack per target. Claude is the only system that adds or removes directives. Nothing auto-reverts — if territory was darkened in episode 3, it stays dark until Claude issues a brightening directive. Additive directives accumulate; replacement directives replace only their own primitive type. The stack is serializable as game state.

### Three Generation Layers

| Layer | What | Cost | Handles |
|-------|------|------|---------|
| **Layer 1 — Compositional** | Canvas operations on existing library assets: scale, palette remap, composite, flip, tile, blend, color shift, position | Zero AI cost, instant | ~40-50% of directives |
| **Layer 2 — Sprite Variant** | Modifications to existing sprites: pose adjustment, held objects, integrated overlays, partial transformation, pixel text, expression change. Mix of programmatic + AI-assisted | Free (programmatic) to ~0.5-2s (AI) | ~30-40% of directives |
| **Layer 3 — Novel Generation** | New assets from scratch, constrained by Game Visual Identity. Quality-gated before entering library | AI image generation, ~1-5s per asset | ~10-20% at runtime; 100% of Track B initial population |

VME routes to cheapest capable layer. Always try Layer 1 first.

### Game Visual Identity System (Track B)

Track B generates a complete **visual system** before generating any individual asset. The Game Visual Identity specifies: palette architecture (~20-25 master colors organized by role), proportion grid (exact pixel dimensions per entity role), detail density rules, animation budget (frames per action), visual shorthand dictionary, silhouette distinctiveness rules.

The ingestion library powers this through **learned distributions and relational constraints** — not pixel data. Distributional knowledge (sprite sizes, palette counts, frame counts per era/paradigm/role), relational constraints (color distance between player and enemies, boss-to-enemy size ratios, environment-entity palette overlap), and platform-level aesthetic tendencies. Copyright protects pixel arrangements; it does not protect distributional knowledge or design patterns.

Every Track B asset is generated within the identity, quality-gated, then enters the game-instance library. From that point, the VME treats Track A and Track B identically.

---

## Quality Evaluation System

Full specification: `docs/design/diagnostic-framework.md`

The diagnostic framework is **largely unchanged** by the CAS redesign. The fast-fail funnel, Simulated Player Agent, Moment Extractor, Testing UI, and Pattern Distiller all work the same way.

**Gate 1 (automated) adjustments:** Schema validation checks need updating to validate the new entity mind structure (affect.valence/arousal instead of disposition/emotional_state/motivations), the new faction state structure (resources only + computed aggregates), the new CAS block structure (social_timer, previous_narrative), and VME directive stack state.

**Tuning targets shift:** From threshold tables (which no longer exist) to CAS_CONFIG rate constants (contagion_rate, propagation_base_probability, bond_change_scale, etc.) + Claude prompt quality (does interpretation produce coherent narrative? does it maintain continuity? does it catch stagnation?).

**Pattern Distiller** feeds back into: CAS_CONFIG parameter adjustments (changing social physics) + Claude interpretation prompt refinements (improving narrative quality). Not into behavioral legibility tables (eliminated).

---

## Social Hook Design

The social hook system connects to the CAS through Claude's constructionist interpretation:

Hooks are Claude-constructed encounters, not threshold-triggered events. At the episode 1-2 boundary, the Game Compiler places a paradigm-appropriate social hook pattern. The encounter is guaranteed; the outcome is emergent.

Claude receives: entity personality + affect state + knowledge + bond to player + hook pattern template. Claude constructs: a specific encounter that fits the paradigm's social surface. In a platformer: a captive enemy between levels who begs for mercy. In a racing game: a rival who challenges you to a side bet. In an RPG: an NPC with information who wants something in return.

The encounter creates CAS events (player choice → affect changes on involved entities → propagation begins). One designed spark that ignites emergent fire.

---

## Paradigm Architecture

Full specification: `docs/design/paradigm-specs.md`

Seven engine clusters providing rendering/collision/camera/input. 12 full paradigm specs + 10 variant paradigms mapped to parent clusters. See `docs/design/paradigm-specs.md`.

**Key rule:** The Experience Interpreter maps prompt *activities* to engine clusters based on mechanical feel, not genre labels. Any prompt can be served by finding the right engine cluster.

**Shift mechanics:** Intra-cluster shifts (platformer → beat-em-up) = parameter swap, seamless. Cross-cluster shifts (platformer → racing) = rendering core switch, requires transition.

**CAS integration per paradigm (revised):** Paradigm specs no longer contain behavioral legibility threshold tables. Instead, each paradigm spec defines: (1) the **social surface** — where and how social interaction happens within that paradigm's mechanics, (2) the **social timer pace** — default game_pace_modifier for that paradigm type, (3) **drama density defaults** — min/max significant changes per cadence window, (4) **witness rules** — what constitutes line-of-sight/awareness for that paradigm (same screen in platformer, same room in RPG, visual range in RTS), (5) **information propagation speed** defaults — paradigm-specific rates for how fast knowledge packets travel.

**⚠️ All numerical values in paradigm specs are starting estimates.** Calibrated through the diagnostic framework during testing. Paradigm behavioral descriptions ("visible wavering," "patrol gaps") are examples of what Claude MIGHT produce, not deterministic mappings.

---

## Paradigm Grammar Framework (Full-Game Arc)

The Sequencing Grammar Framework handles *within-episode* quality (teachability, rhythm, directionality). The Paradigm Grammar Framework handles *across-episode* quality — the full-game mechanical arc.

### The Dialectic

The CAS produces infinite emergent social possibilities. But a game also needs to *feel like a great game* mechanically — authored, shaped, progressing toward something. Pure emergence risks shapelessness. Pure structure risks feeling scripted and static. The resolution: firm but bendable structural constraints that serve as additional variables in the constraint surface equation. The paradigm grammar constrains the CAS (social dynamics express through paradigm-appropriate channels). The CAS constrains the grammar (social reality may override structural plans). Mutual constraint, same philosophy as the CAS itself.

### Three Layers

**Layer 1 — Paradigm Grammar.** Each paradigm has a native full-game structural grammar. This is NOT a universal template — it's fundamentally different per paradigm because different game types have fundamentally different structures.

Each paradigm grammar defines:
- **Structural units** — what are the building blocks? (levels, cups, missions, dungeons, stages)
- **Organization pattern** — how are units arranged? (linear worlds, stage-select, branching missions, tournament brackets)
- **Punctuation** — what marks boundaries? (bosses, championships, fortress sequences, final exams)
- **Progression shape** — how does complexity/intensity evolve? (steady escalation, difficulty valleys, cup-based plateaus)
- **Non-negotiable paradigm features** — what makes this paradigm recognizable? (bosses at end of Mega Man stages, castles in Mario worlds, cups in racing, dungeon items in Zelda)
- **Vocabulary accumulation pattern** — how does the mechanical repertoire grow? (one weapon per stage in Mega Man, gradual within worlds in Mario, unit unlocks per mission in RTS)

These are paradigm properties derived from ingestion pipeline data (~1,350 games), not invented from first principles. Players who prompt "a Mega Man game" expect boss stages and a stage select. That's what the paradigm *is*.

**Layer 2 — Skeleton.** At game creation time, the Game Compiler instantiates the paradigm grammar for this specific game. The skeleton is shaped by: prompt intent, narrative premises, intended length, and CAS initial conditions.

The skeleton includes:
- **Vocabulary budget** — the complete set of mechanical elements, tiered by complexity (tier 1 = available from episode 1, tier 2 = available after N episodes, etc.)
- **Zone/environment progression** — the sequence of environmental contexts with their mechanical identities (ice = momentum, water = different movement, fortress = tight spaces)
- **Boss placement** — where bosses appear, what zone they punctuate, how their design reflects the zone's vocabulary
- **Complexity ceiling per episode** — max new elements introduced per episode, minimum reuse of established elements
- **Difficulty shape** — the intended tension-relief pattern across the full game (e.g., 3:1 escalation-to-valley ratio)

The skeleton is stored as part of `meta` (immutable at creation) and consulted by content agents at each episode boundary. Content agents generating episode N read: skeleton constraints + CAS state + sequencing grammar + Claude interpretation + previous vocabulary record.

**Layer 3 — Override Conditions.** The skeleton is a default plan that knows it might be overridden. When CAS-driven events make the structural plan disconnected from world reality, Claude's interpretation layer can adapt.

Override conditions are **indeterminate and open to Claude's constructionist interpretation** — not a deterministic lookup. Claude reads CAS state + skeleton + current game reality and constructs the appropriate adaptation. Examples of legitimate overrides: faction collapse makes a planned zone empty (compress or skip), player earns a paradigm shift (current zone ends early, new grammar takes over), player social-engineers a shortcut to the antagonist (compression toward resolution accelerates), extended social engagement makes the game longer than planned (additional episodes within the grammar's structure).

When overriding, the five experience primitives must still be satisfied: vocabulary accumulation continues, consequentiality escalates, environment remains legible, the transformation feels earned, and the overall vector compresses toward resolution.

### Five Experience Primitives (Quality Checks)

These are emergent properties of well-designed systems, used for diagnostic evaluation — not calibration targets:

1. **Vocabulary accumulation** — player's mechanical repertoire grows. Emergent from paradigm grammar's vocabulary budget.
2. **Consequentiality escalation** — player actions have increasingly large consequences. Emergent from CAS bond accumulation + mechanical progression.
3. **Environmental legibility** — player understands the current context's rules. Emergent from zone design + teachability.
4. **Earned transformation** — when the game changes, it feels caused. Emergent from CAS causal chains + override condition requirements.
5. **Compression toward resolution** — experience vector points toward climax. Emergent from win condition + skeleton progression + CAS escalation.

### Status

**Framework: defined (this section).** Specific paradigm grammars: to be built before Phase 2, extending `docs/design/paradigm-specs.md`. Will leverage ingestion pipeline structural data + Phase 1 playtesting experience.

---

## Dramaturgical Agent — Superseded

**⚠️ The Dramaturgical Agent has been eliminated as a discrete agent (Decision 29, Thread 4).** All references to it in other documents should be understood as historical. Its functions are distributed:

| Original Function | Now Handled By |
|---|---|
| Fertile CAS initial conditions | Game Compiler (setup instructions) |
| Prompt → CAS parameter translation | Game Compiler (OCEAN offset generation) |
| Social hook placement | Game Compiler + paradigm spec hook patterns |
| External pressure ramp | Architectural (`pressure_ramp: "player_driven"`) + Claude interpretation |
| Drama density monitoring | CAS engine (stagnation/melodrama signals → Claude) |
| Catalytic perturbations | Claude interpretation layer (NPC actions in response to stagnation) |
| Mechanical game arc | Paradigm grammar + skeleton + override conditions |

**One designed social ingredient survives:** An early social hook placed at the episode 1-2 boundary. Encounter guaranteed, outcome emergent. Paradigm-appropriate pattern selected by Game Compiler from hook pattern library in paradigm spec.

---

## Diagnostic & Tuning Framework Summary

### Testing & Tuning Infrastructure (threaded through all phases)
Two Fires uses a fast-fail diagnostic funnel to evaluate generated game quality efficiently. Full specification in `docs/design/diagnostic-framework.md`.

**Fast-fail funnel:**
- **Gate 1 (automated):** Does it run? Is it pathable? Latency OK? Schema valid?
- **Gate 2 (Joe reviews clips, ~30-45s):** 5 Necessary Conditions — readable opening, physics character (comparison clip), teachability integrity, visual coherence, rhythm heartbeat. Any 👎 = fast fail.
- **Gate 3 (Joe reviews clips, ~45-60s):** INUS Conditions — provocateur moment, aesthetic personality, social hook (Phase 5+), entity behavior (Phase 5+). Only evaluated if Gate 2 passes.
- **Gate 4 (periodic):** Holistic playthroughs, 5-15 minutes. Calibration and spot-checks.

**Pattern Distiller:** Converts Joe's 👎/👍/🔥 ratings into transferable design principles. Three modes: failure patterns, excellence patterns, parameter correlation. Approved principles feed back into CAS_CONFIG tuning + Claude prompt refinement.

**Testing UI:** Zero-navigation card-based web interface. Phase-aware. Review mode (pre-generated queue) + Generate mode (type prompt, evaluate). Principles tab for approving/rejecting distilled taste principles.

---

## Open Design Work

**Resolved:**
- ~~Game state JSON schema~~ ✅ Thread 1
- ~~CAS engine parameters + behavioral legibility~~ ✅ Thread 3 (redesigned as two-layer architecture)
- ~~Dramaturgical Agent ingredients~~ ✅ Thread 4 (eliminated, functions distributed)
- ~~Visual Manifestation Engine specification~~ ✅ Thread 5
- ~~Prompt-time character/environment generation pipeline~~ ✅ Thread 5 (Game Visual Identity system)

**Remaining:**
1. Paradigm grammar specifics per paradigm (before Phase 2)
2. CAS state → level content translation per paradigm
3. Multi-paradigm shift mapping mechanics
4. Social hook pattern library (compact, paradigm-specific)
5. Game state schema document update (apply Thread 3 CAS diffs + Thread 5 VME state)
6. Asset resolution strategy document update (reference Game Visual Identity system)
7. Mechanical directive format specification (behavioral counterpart to VME scene spec)
8. CAS rate constant calibration (testing phase)
9. MVP definition — minimum compelling first level
