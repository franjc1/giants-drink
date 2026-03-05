# Two Fires — Sequencing Grammar Framework
## The Intermediate Layer: How Great Levels Teach Themselves

---

## What This Document Is

This document defines the **intermediate layer** of game design — the sequencing logic that sits between moment-to-moment mechanics (micro) and overall world arc (macro). It exists because:

- Bad generated games fail here. Assets can be excellent, macro arc can be well-designed, but if the sequencing logic is arbitrary, the level feels soulless and unauthored.
- This layer is invisible to most players but felt by everyone. Like paragraph logic in writing — you notice beautiful sentences and satisfying story arcs, but paragraph sequencing is what makes you feel a writer's mind.
- This is the primary quality differentiator between "generated" and "handcrafted."

---

## The Three Sequencing Primitives

Every moment in a great retro level simultaneously obeys three sequencing logics. Violation of any one — even locally — produces the "off" feeling players can't articulate.

### 1. Teachability
**Definition:** Every mechanic, threat, or environmental element is introduced in a safe context before it appears in a dangerous or combined context.

**The rule:** New element → safe encounter → escalated encounter → combined/tested encounter. This sequence must always complete before a new element is introduced that overlaps with the previous one.

**Why it works:** Players never feel cheated. Death is always comprehensible in retrospect. The designer feels present and intentional.

**Violation signature:** Player dies to something they've never seen before, or dies to a combination before seeing the components individually. Produces "cheap" or "unfair" feeling.

**Scope:** Operates at the room/screen level in most paradigms. A teachability arc typically spans 3-6 screens/rooms.

---

### 2. Rhythm
**Definition:** Tension and relief alternate at a cadence appropriate to the paradigm. Neither tension nor relief is allowed to persist too long.

**The rule:** Every tension section must resolve into relief within the paradigm's cadence window. Every relief section must not exceed the same window (relief that persists becomes boredom, which kills momentum as effectively as unrelenting difficulty).

**Why it works:** Players need a heartbeat. Tension only means something if relief is real. The rhythm creates the emotional shape of the level.

**Violation signature:** Level that's uniformly difficult (no heartbeat), or uniformly easy (no stakes), or that has unpredictable tension spikes unconnected to the cadence.

**Scope:** Operates at the section level — typically 45-120 seconds per cycle depending on paradigm.

**Paradigm cadences (approximate):**
- Shmup: 10-20 second cycles (nearly musical)
- Platformer: 45-90 second cycles
- Action RPG dungeon: 2-4 minute cycles
- Strategy/RTS: 5-10 minute cycles
- Adventure/exploration: variable, player-controlled

---

### 3. Directionality
**Definition:** At any moment, the player has a clear sense of what "forward" means, even in non-linear spaces.

**The rule:** The level communicates its own logic spatially. The player should never need to stop and wonder whether they've missed something mandatory. Optional content must be legible as optional.

**Why it works:** Cognitive load management. When directionality is clear, the player's full attention goes to the challenge. When it's unclear, anxiety bleeds into every decision.

**Violation signature:** Player backtracks looking for progress triggers. Player completes optional content thinking it was mandatory (or vice versa). Player reaches a dead end without understanding why.

**Scope:** Operates at the full level scale — the gestalt spatial logic of the entire stage.

---

## How the Three Interact (CAS Properties)

These primitives aren't independent — they constrain each other in ways that produce emergent level quality:

- **Teachability constrains Rhythm:** You can't create a tension spike around a threat the player hasn't been introduced to. The vocabulary must exist before the rhythm can use it.
- **Rhythm constrains Directionality:** Relief sections are often where optional content lives. Tension sections must be directionally unambiguous (player can't explore when under pressure).
- **Directionality constrains Teachability:** The safe introduction context must be on the critical path, not hidden in optional areas. Players who miss safe introductions will hit the dangerous version cold.

When all three are satisfied simultaneously, the level has **coherent intent at every scale** — the property players experience as "handcrafted."

---

## The Provocateur Principle

Great handcrafted levels contain exactly one moment per stage where the established pattern is deliberately violated. Not randomly — *meaningfully*. This is what makes players feel a designer's sensibility rather than a system's logic.

**Properties of a good provocation:**
- It can only be appreciated if the player has internalized the pattern being broken
- It's fair — the player had the tools to handle it, they just didn't expect to need them here
- It's singular — one per level. More than one and the pattern itself is destroyed.
- It's positioned at the level's emotional peak — usually in the final third

**Examples:**
- The enemy in the position it's never been in before, requiring an unintuitive approach that the player's toolkit actually supports
- The rhythm violation — the relief section that doesn't arrive when expected, extending tension just past the point of comfort before resolving
- The spatial surprise — the level that appeared linear revealing a second dimension at the climax

The Provocateur agent's only job is to identify and insert this moment. It operates after the Grammarian, Rhythmist, and Cartographer have produced a coherent level — then finds the one place where a meaningful violation serves the experience.

---

## Relationship to the Paradigm Grammar + Skeleton (Thread 4)

The sequencing grammar operates **within** an episode. It makes episode 7 feel handcrafted.

The paradigm grammar + skeleton (specified in `claude.md`, Decisions 31-32) operates **across** episodes. It ensures the full game has authored structure — vocabulary progression, zone identity, boss placement, difficulty shape.

These two layers connect through the **Episode Brief** — a per-episode structured object that translates the static skeleton into specific marching orders for the sequencing agents. See: Episode Brief section below.

---

## The Episode Brief

### What It Is

The Episode Brief is a structured object produced by the Game Compiler at each episode boundary. It is the interface between the across-episode skeleton and the within-episode sequencing agents. The Grammarian, Rhythmist, Cartographer, Provocateur, and Coherence Auditor all read the Episode Brief — they do not read the skeleton directly.

The Brief is generated **dynamically at episode entry**, not pre-computed at game creation. The Game Compiler reads the skeleton + current CAS state + Claude's interpretation + the actual previous vocabulary record and produces a Brief that reflects the skeleton's plan as modified by current world reality.

This dynamic generation is what makes non-linear paradigms work. In a Mega Man stage-select game, the same stage produces a different Episode Brief depending on which stages the player has already completed (different established vocabulary, different CAS state). In an RPG, the same dungeon zone produces different Briefs depending on what the player has encountered in previous zones.

### Episode Brief Fields

**Available vocabulary** — the complete set of mechanical elements the Grammarian is allowed to use this episode. Split into three categories:

- **Established:** Elements the player has already been taught in previous episodes. Full teachability arc completed. Can appear in any context — dangerous, combined, surprising. No introduction needed.
- **New:** Elements being introduced this episode. Full teachability arc required (safe → escalated → combined). Subject to the complexity ceiling.
- **Variant:** Established elements modified by CAS-driven changes (e.g., armored goomba after faction militarizes). Each variant carries a **behavioral delta** — a rough indicator of how much new learning this variant requires. Small delta (extra hit point) gets minimal teachability (one safe encounter showing the difference). Large delta (new attack pattern, new movement behavior) gets a full introduction arc, effectively treated as new. The Grammarian scales teachability investment to the behavioral delta, not to taxonomic distance from the base element.

**Complexity ceiling** — maximum number of new elements this episode. Drawn from the skeleton's per-episode budget. The Grammarian can use fewer but not more.

**Difficulty target** — where this episode sits on the skeleton's difficulty shape, expressed as a relative value (0.0–1.0 normalized against game-total range). The Rhythmist translates this into tension-relief balance. A 0.3 episode has longer relief sections and gentler tension. A 0.8 episode has compressed relief and sustained tension.

**Punctuation** — what structural beat this episode serves in the paradigm grammar. Values: normal, mini-boss, boss, breather/reward, finale. Constrains the Rhythmist's arc shape and the Provocateur's placement rules. A boss episode has a fundamentally different rhythm shape than a normal level.

**Zone identity** — the environmental context and its mechanical meaning. "Ice world = momentum carry, reduced friction." Tells the Cartographer what environmental vocabulary is available and constrains the Grammarian's introduction sequencing (ice physics must be taught before ice-specific challenges appear).

**Mechanical thesis** — a short semantic statement from Claude's interpretation identifying the productive friction in this episode's available vocabulary. Examples: "patience vs. urgency," "precision under environmental pressure," "familiar enemies in unfamiliar spatial configuration." The Grammarian uses this as an organizing principle — it doesn't constrain *what* appears, but *what relationship between elements* the sequence foregrounds. This is what separates "competent procedural generation" from "feels like a designer had a vision." The mechanical thesis is also how CAS state influences the *feel* of a level without changing the mechanical vocabulary — if a faction is in disarray, the thesis might shift from "coordinated assault" to "desperate ambush tactics."

**Narrative context** — lightweight semantic field from Claude's interpretation. Not the full CAS state, but the relevant bits: "faction X is hostile and patrolling aggressively," "this area was recently contested," "allied NPC may appear mid-level." Lets CAS reality bleed into level design without the Grammarian needing to understand the social model.

**Override flags** — if Claude's interpretation layer has triggered a skeleton override (faction collapse compresses this zone, paradigm shift imminent, player resolved faster than expected), the Episode Brief carries that context so the Grammarian can adapt.

### Vocabulary Record Update (Flow Back Up)

After the Coherence Auditor signs off on an episode, the system writes a **Vocabulary Record Update** — the list of what was actually introduced, reinforced, and what variants the player encountered. This is what the Game Compiler reads when constructing the next Episode Brief's "established" category.

The vocabulary record tracks **what was placed**, not what was experienced. The sequencing grammar guarantees that if an element was placed, its teachability arc was structurally complete (the Coherence Auditor verified this). Whether the player personally completed the arc is a player skill question, not a design quality question. If they died to the stalactite, they learned through failure — which is how retro games teach.

---

## Per-Paradigm Grammar Seeds

Each paradigm has a compact specification of how the three primitives manifest in that context. These seeds are the Grammarian agent's primary knowledge base and the Auditor's checklist.

**Note:** These seeds cover the six paradigms specified to date. Additional seeds (Racing, Fighting, Management Sim, Adventure/Myst, Isometric, etc.) will be built before Phase 2, leveraging ingestion pipeline structural data and Phase 1 playtesting experience.

### Platformer (Mario, Mega Man, Castlevania, Metroid)
- **Teachability window:** ~30 seconds / 2-3 screens per new element
- **Rhythm cadence:** 45-90 second tension cycles; relief sections are typically flat safe terrain with visible reward
- **Directionality model:** Primary horizontal axis; vertical branching signals optional content; locked progression gates must be visually distinct from decorative dead ends
- **Canonical spatial moves:** The shaft (vertical challenge), the gauntlet (linear enemy sequence), the platform puzzle (precision required), the safe room (relief + resource)
- **Introduction sequence template:** Safe static encounter → mobile encounter → combined/environmental encounter

### Shmup (R-Type, Gradius, 1942)
- **Teachability window:** 5-10 seconds per new bullet pattern; patterns must be learnable in real time
- **Rhythm cadence:** 10-20 second cycles; rhythm IS the dominant primitive; levels are essentially musical compositions
- **Directionality model:** Scroll provides direction; Cartographer focuses on density, lane structure, and safe corridor width
- **Canonical spatial moves:** The wave (enemy formation sweep), the corridor (forced precision navigation), the boss approach (escalating density before encounter)
- **Introduction sequence template:** Formation at screen edge → formation at mid-screen → formation with environmental obstacle

### Action RPG Dungeon (Zelda, Castlevania, early Final Fantasy)
- **Teachability window:** 1-2 rooms per new element; rooms function as discrete teaching units
- **Rhythm cadence:** 2-4 minute cycles; relief is the locked room solved, the chest found, the save point reached
- **Directionality model:** Locked-door logic; the dungeon communicates its own key structure through visual language (locked doors visible before keys, switches telegraph their effects)
- **Canonical spatial moves:** The lock-and-key (solution visible before problem), the combat room (clear before proceeding), the puzzle room (mechanical challenge distinct from combat), the reward room
- **Introduction sequence template:** Observe mechanic in safe context (switch with visible effect, no stakes) → use mechanic for progression → mechanic under pressure

### RPG Combat (Final Fantasy, Dragon Quest)
- **Teachability window:** Enemy type introduced in low-stakes encounter before appearing in dangerous combination
- **Rhythm cadence:** Encounter pacing — resource attrition should create meaningful decision points every 3-5 encounters; boss encounters are rhythm climaxes
- **Directionality model:** Dungeon map legibility; player should always know current depth and rough distance to exit/objective
- **Canonical combat moves:** The introduction encounter (single weak enemy), the combination encounter (two known enemy types with synergy), the attrition run (escalating resource pressure), the encounter break (safe save/rest point)
- **Introduction sequence template:** Single enemy solo → same enemy with support → enemy combination requiring new tactics

### Top-Down Action / RTS (Warcraft, StarCraft early, Zelda overhead)
- **Teachability window:** Unit type or mechanic introduced in low-pressure situation before appearing in coordinated opposition
- **Rhythm cadence:** 5-10 minute macro cycles; micro-engagements within those cycles at 30-60 second cadence
- **Directionality model:** Fog of war as explicit mechanic; scouted territory = known forward direction; map design guides natural scouting paths
- **Canonical spatial moves:** The forward base (staging ground before major push), the chokepoint (forced tactical decision), the resource denial (economic pressure), the flank (spatial surprise)

### First-Person (Wolfenstein, Doom, early Quake)
- **Teachability window:** Enemy type introduced at range before appearing at close quarters; weapon introduced with ample ammo before scarcity
- **Rhythm cadence:** 60-90 second tension cycles; relief is the cleared room (door sealed, enemies defeated, safe to look around)
- **Directionality model:** Landmark-based; key architectural features serve as navigation anchors; player should never be in a space without a visible landmark
- **Canonical spatial moves:** The ambush room (enemies triggered by entry), the hub (central space with radiating paths), the key hunt (exploration with clear objective), the arena (large space demanding positioning)

---

## What the Ingestion Pipeline Needs to Capture

For sequencing grammar to be grounded in real games rather than invented, the asset ingestion process must extract structural data beyond sprites and physics. See: **ingestion-plan-updated.md** for specifics.

The key question for every ingested level: **In what order does the player encounter things, and what changes between each encounter with the same element?**

---

## How This Document Is Used in Production

### Episode Generation Flow

```
Episode boundary reached
  → CAS snapshot taken
  → Claude interpretation call (produces narrative context, mechanical thesis,
      override evaluation, visual/audio directives, mechanical directives)
  → Game Compiler reads: skeleton + CAS state + Claude interpretation
      + previous vocabulary record
  → Game Compiler produces: Episode Brief
  → Grammarian reads: Episode Brief + paradigm grammar seed
      → outputs vocabulary sequence (what appears in what order,
         organized around mechanical thesis)
  → Rhythmist reads: Episode Brief (difficulty target, punctuation)
      + paradigm cadence spec
      → outputs temporal shape (tension/relief waveform)
  → Cartographer reads: vocabulary sequence + temporal shape + asset library
      → outputs level content
  → Provocateur reads: completed level + Episode Brief
      → inserts one targeted violation
  → Coherence Auditor validates against Episode Brief constraints
      + three sequencing primitives + Provocateur rules
  → On pass: episode served, Vocabulary Record Update written
  → On fail: targeted revision request to responsible agent (not full regeneration)
```

### Agent Responsibilities

**Game Compiler (Episode Brief production):** Reads skeleton + CAS + Claude interpretation + vocabulary record. Produces the Episode Brief. Handles cumulative vocabulary tracking — comparing skeleton's vocabulary budget against what's actually been introduced. The sequencing agents never touch the skeleton directly.

**Grammarian:** Reads Episode Brief + paradigm grammar seed. Produces the vocabulary sequence — the order in which elements appear, organized around the mechanical thesis. Ensures teachability arcs are complete for all new and variant elements. Respects complexity ceiling. Primary knowledge base: per-paradigm grammar seeds + paradigm pattern libraries from ingestion.

**Rhythmist:** Reads Episode Brief (difficulty target, punctuation type) + paradigm cadence spec. Produces the temporal shape — an abstract tension/relief waveform. Ensures cadence windows are respected. Boss punctuation produces different arc shapes than normal levels.

**Cartographer:** Reads vocabulary sequence + temporal shape + asset library structural data (real level sequences from ingested games). Instantiates actual level content satisfying both constraints.

**Provocateur:** Reads completed level + Episode Brief. Identifies optimal violation point. Makes one targeted modification. Positioned in the final third. Must be fair (player had the tools), meaningful (only works if pattern was internalized), and singular (one per episode).

**Coherence Auditor:** Binary compliance check against all constraints:
- Is every new element introduced safely before appearing in dangerous context? (Teachability)
- Does tension resolve within paradigm's cadence window? (Rhythm)
- Is there an unambiguous path forward at every decision point? (Directionality)
- Is there exactly one pattern violation, positioned in the final third? (Provocateur)
- Does the level respect the Episode Brief's complexity ceiling? (Vocabulary budget)
- Does the sequence foreground the mechanical thesis? (Thesis coherence — softer check)

Violations trigger targeted revision requests to the responsible agent — not full regeneration.
