# Two Fires — Architectural Blueprint (claude.md)
## Source of truth for all Claude Code and Claude.ai sessions

**Last updated:** 2026-03-10 (Session 11: Universal Extraction & Manifest Architecture)

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
| `docs/design/paradigm-specs.md` | Player-facing paradigm specs (12 paradigms). Engine architecture moved to unified engine. | When paradigms are added/modified |
| `docs/design/universal-extraction-spec.md` | Universal extraction pipeline + manifest architecture + build plan v5 (Section 8) | When extraction/manifest approach changes |
| `docs/design/diagnostic-framework.md` | Fast-fail quality evaluation specification | When diagnostic approach changes |
| `docs/design/sequencing-grammar-framework.md` | Intermediate layer theory + grammar seeds | When sequencing logic evolves |
| `docs/design/asset-resolution-strategy.md` | Two-track asset architecture (now a continuous blend spectrum via manifests) | When asset approach changes |
| `docs/lore/two-fires.md` | Mythology, endgame mechanics, narrative backbone | When lore decisions are made |
| `giants-drink-transfer.md` | Original complete transfer document (historical reference) | Rarely — superseded by specific docs |
| `tools/extract-chr-rom.js` | NES CHR-ROM bulk extractor — parses iNES headers, extracts 2bpp tile data | Stable |
| `tools/mesen-extract.lua` | Mesen2 Lua extraction script — captures PPU state in headless mode | Active development |
| `tools/render-screen.js` | NES screen renderer — combines extracted PPU data into 256×240 PNG | Active development |
| `docs/design/rom-extraction-strategy.md` | **SUPERSEDED** by `universal-extraction-spec.md` | Historical reference only |
| `docs/design/build-plan-v4.md` | **SUPERSEDED** — build plan v5 is in Section 8 of `universal-extraction-spec.md` | Historical reference only |

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

### Difficulty Philosophy: Mechanical Texture, Social Challenge

Two Fires targets a broad audience. Mechanical difficulty is **texture** — it creates moment-to-moment tension and engagement — but it is not the primary challenge. The primary challenge comes from the social ecology and the Two Fires meta-narrative.

**Calibration range:** Super Mario World (baseline) to A Link to the Past (hard edge). Mega Man X is slightly beyond range. NES Mega Man and DKC2 are well out of range. Think Mario Kart 50cc (entry) to 150cc (ceiling) — the player is always working, never walled. See Decision 53 (SNES Comfort Model) for forgiveness parameters and Decision 67 for the full rationale.

**Social dynamics as the difficulty vector:** CAS states manifest as mechanical consequences through Claude's interpretation layer. When social dynamics oppose the player, the game gets harder *in ways that can't be solved mechanically alone* — pushing the player toward social engagement as the resolution path. When social dynamics favor the player, the game gets mechanically easier in some dimensions while growing socially more complex. This creates a self-balancing loop: the player is always being drawn toward the social layer, which is Two Fires' core differentiator.

**How CAS states become gameplay consequences:** Claude's interpretation layer has full creative latitude to translate CAS states into mechanical manifestations. The same underlying social state (e.g., a faction consolidating against the player) could manifest as reinforcements mid-level, terrain becoming hostile, allied information drying up, environmental traps activating, or something entirely unanticipated. There is no fixed taxonomy — Claude reads the CAS state in narrative context and constructs the most dramatically appropriate consequence.

Examples across the spectrum (illustrations of creative range, not an exhaustive menu):

*Mild favorable:* An enemy hesitates, pauses patrol, lets you pass. An NPC mentions a shortcut. A locked door is unlocked by a faction ally you never met.

*Extreme favorable:* Former enemies join you as CPU teammates, shifting the paradigm toward beat-em-up or tactical play. An entire faction defects, opening a previously hostile region. A key enemy surrenders and offers intelligence.

*Mild unfavorable:* Information sources dry up — NPCs who would have helped don't appear. A path that was open is now guarded. Enemies coordinate slightly better.

*Extreme unfavorable:* Boss-tier enemies appear mid-stage because faction leadership declared a crackdown. Multiple enemy types combine forces in encounters designed for solo combat. The environment itself turns hostile (a faction controls infrastructure). But crucially: these escalations signal the player toward social solutions — you need allies, defectors, intelligence. The mechanical pressure is the *prompt* to engage socially, not a wall to overcome through reflexes.

**Paradigm migration expectation:** As social complexity increases across a game's arc, paradigms are expected to naturally shift toward formats that can represent multi-character dynamics — beat-em-up with allies, tactical encounters, RTS-like command moments. This should emerge from existing paradigm shift triggers (the current genre can no longer represent what the CAS has produced), not be scripted. If testing reveals every game following the same migration path (e.g., always platformer → beat-em-up → RTS), that's a tuning signal for the shift trigger system to introduce more variety.

### Post-Game and Meta-Objective Structure

"Winning" a generated game is a transition, not an endpoint. When the game's primary objective is met and the antagonist is defeated, the CAS continues running. The world persists and evolves. The player's relationship to the world shifts: they are no longer trying to beat it — they are leveraging it for the meta-objective.

The meta-objective is the Two Fires quest: reaching the giant, recovering the two stolen fires. This requires achievements that span multiple "won" worlds — raising armies, developing cross-world alliances, finding specific artifacts, making sacrifices. The post-game social dynamics are inherently harder than the main game because the player is operating across multiple living worlds simultaneously with higher-stakes social decisions.

This gives the "personal epic" its structural shape: a constellation of worlds, each one beaten and then recruited into a larger campaign, building toward a confrontation with the giant. See `docs/lore/two-fires.md` for mythology details.

**⚠️ The meta-game structure requires its own specification thread.** The principle is decided; the mechanics (how worlds interconnect, what the giant confrontation looks like, what constitutes "winning" the meta-game) are unspecified.

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

CAS runs on independent ~2-minute heartbeat (adjustable per game by Dramaturgical Agent). Paradigm ticks determine when player perceives changes. Social graph evolves continuously.

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

**⚠️ SCHEMA NEEDS UPDATE.** The game-state-schema.md document was written before the Thread 3 CAS redesign and contains structures that are now superseded. The following changes are required when updating the schema:

### `world.factions.*.state` — Replace Entirely

**Old (7 stored primitives):**
```json
"state": {
  "cohesion": 0.65, "morale": 0.55, "loyalty": 0.70,
  "awareness_of_player": 0.20, "disposition_to_player": -0.60,
  "internal_dissent": 0.35, "resources": 0.75
}
```

**New (1 stored + 5 computed):**
```json
"state": {
  "resources": 0.75
},
"aggregates": {
  "avg_valence": -0.12,
  "avg_arousal": 0.45,
  "cohesion": 0.58,
  "bond_density": 0.42,
  "member_count": 23
}
```

`resources` is the only stored faction-level value. All others are computed from members each social timer cycle. `morale`, `loyalty`, `awareness_of_player`, `disposition_to_player`, `internal_dissent` are eliminated — Claude constructs these concepts from entity-level affect + knowledge + bonds.

### `world.entities.*.mind` — Replace Dynamic State

**Old:**
```json
"mind": {
  "personality": { ... },
  "disposition_to_player": 0.00,
  "motivations": ["survive", "protect_family"],
  "emotional_state": "anxious",
  "conversation_state": "never_contacted"
}
```

**New:**
```json
"mind": {
  "personality": {
    "openness": 0.20, "conscientiousness": -0.10,
    "extraversion": -0.05, "agreeableness": 0.15,
    "neuroticism": 0.10
  },
  "affect": {
    "valence": -0.15,
    "arousal": 0.40
  },
  "conversation_state": "never_contacted"
}
```

`disposition_to_player` is eliminated — it's constructed by Claude from bond to player (if any) + knowledge about player + affect + personality. `motivations` and `emotional_state` are eliminated — Claude constructs these from primitives in context. `conversation_state` retained (tracks mechanical interaction history). OCEAN personality retained unchanged.

### `world.entities.*.knowledge` — Add Attribution Fields

Knowledge items gain `causal_agent` and `emotional_charge` fields:
```json
{
  "id": "k_002",
  "type": "social",
  "content": "player spared goomba_06 in world_1_2",
  "accuracy": 0.75,
  "emotional_charge": 0.6,
  "source": "goomba_06",
  "causal_agent": "player",
  "acquired_tick": 5
}
```

`causal_agent` enables the attribution-gated reputation system. `emotional_charge` decays over time (facts remain, feelings fade).

### `world.information_packets` — Add Causal Agent

Information packets gain explicit `causal_agent` field for attribution tracking:
```json
{
  "id": "info_001",
  "content": "player_spared_goomba_07",
  "content_type": "player_action",
  "magnitude": "minor",
  "accuracy": 0.95,
  "emotional_charge": 0.60,
  "causal_agent": "player",
  "origin_entity_id": "goomba_07",
  "origin_tick": 3,
  "current_holders": ["goomba_07", "goomba_06"],
  "propagation_speed": "between_episode",
  "hops": 1,
  "max_hops": 5
}
```

### `cas` Block — Replace Entirely

**Old:**
```json
"cas": {
  "tick_count": 4,
  "tick_spec": { "type": "episode_boundary", ... },
  "drama_density": { "current_rate": 0.25, "threshold": 0.30, ... },
  "phase_transitions_pending": [],
  "cascade_in_progress": false,
  "antagonist": { "last_action": null, "strategy_posture": "ignore", ... }
}
```

**New:**
```json
"cas": {
  "social_timer": {
    "tick_count": 4,
    "base_interval_seconds": 120,
    "game_pace_modifier": 1.0,
    "last_tick_timestamp": 1709312520
  },
  "drama_density": {
    "significant_changes_recent": 3,
    "cadence_window_ticks": 3,
    "signal": null
  },
  "previous_narrative": "The Koopa Army is consolidating after...",
  "config": "CAS_CONFIG object reference"
}
```

`antagonist` block eliminated — Claude constructs faction leadership decisions as part of the interpretation layer, not from a stored strategy posture. `cascade_in_progress` and `phase_transitions_pending` eliminated — cascades emerge from propagation rules, thresholds are not programmed. `previous_narrative` added — Claude's last interpretation, used as continuity anchor for delta-from-previous interpretation.

### `episode.entity_placements.*.behavioral_override` — Change Source

**Old:**
```json
"behavioral_override": {
  "source": "cas_behavioral_legibility",
  "reason": "faction morale 0.35, entity neuroticism +0.15",
  "patrol_range": 32, "patrol_speed": 0.6, ...
}
```

**New:**
```json
"behavioral_override": {
  "source": "claude_interpretation",
  "reason": "Claude interpretation: entity showing signs of stress and withdrawal...",
  "patrol_range": 32, "patrol_speed": 0.6, ...
}
```

Source changes from `cas_behavioral_legibility` to `claude_interpretation`. Reason changes from formula reference to natural language Claude interpretation trace. The override parameters themselves (patrol_range, patrol_speed, etc.) remain — they're the interface between Claude's directives and the paradigm engine.

### `episode.visual_manifestations.*.cas_source` — Change Format

**Old:** `"cas_source": "goomba_union.internal_dissent > 0.4"`

**New:** `"cas_source": "Claude interpretation: goomba faction showing internal fracture based on divergent affect clusters"`

No longer references specific CAS threshold values (there are none). References Claude's narrative interpretation of CAS state.

### `world.event_log` Effects — Change Format

**Old:**
```json
"effects": [
  { "target_type": "entity", "target_id": "goomba_07", "field": "disposition_to_player", "delta": 0.30 }
]
```

**New:**
```json
"effects": [
  { "target_type": "entity", "target_id": "goomba_07", "field": "affect.valence", "delta": 0.15 },
  { "target_type": "entity", "target_id": "goomba_07", "field": "affect.arousal", "delta": 0.25 },
  { "target_type": "bond", "source_id": "goomba_07", "target_id": "player", "field": "valence", "delta": 0.30 },
  { "target_type": "info_packet", "target_id": "info_001", "field": "created" }
]
```

Effects reference valence/arousal (not disposition/loyalty/morale), and include bond changes and info packet creation as explicit effects.

### System Read/Write Reference — Update CAS Engine Row

**Old:** CAS Engine writes `world.factions.*.state`, `world.entities.*.mind`, `world.entities.*.knowledge`, `world.entities.*.social_graph`, `world.information_packets`, `world.event_log`

**New:** CAS Engine writes `world.factions.*.aggregates`, `world.entities.*.mind.affect`, `world.entities.*.knowledge`, `world.entities.*.social_graph`, `world.information_packets`, `world.event_log`, `cas.*`. Add new row: **Claude Interpretation Layer** reads `cas`, `world`, `episode` context, writes `episode.entity_placements.*.behavioral_override`, `episode.visual_manifestations`, `episode.aesthetic_modifiers`, `episode.audio_modifiers`, NPC decisions (→ events → CAS).

### Entity Behavioral Parameters — Change Stress Response

**Old:** "Stress response is a modifier function in CAS engine code (not schema data) that reads personality + faction state and adjusts these parameters."

**New:** Stress response is constructed by Claude during interpretation. Claude reads entity affect (valence, arousal), personality, knowledge, bonds, and faction context, then produces behavioral override parameters. No CAS engine modifier function — Claude is the modifier function.

---

## Conversation System Design

The conversation system connects to the CAS through the two-layer architecture:

**What entities know:** Bounded by their knowledge list. Claude dialogue generation receives ONLY the entity's knowledge items + personality + affect state + bond to player (if any). The entity cannot reference information it doesn't possess. This is architecturally enforced, not prompt-managed.

**What entities feel:** Constructed by Claude from affect primitives in context. An entity with negative valence, high arousal, personality high-N, and knowledge that the player killed their friend might express rage, terror, grief, or accusation — Claude constructs the appropriate emotional expression situationally. The same entity in a different context (positive valence from recent positive events, despite the old grief knowledge) might express cautious hopefulness or conflicted gratitude.

**What entities say:** Claude generates dialogue grounded in: (1) the entity's current affect state (valence/arousal), (2) their OCEAN personality, (3) their knowledge list, (4) their bond to the player (strength/valence/asymmetry, if bond exists), (5) their faction context and role, (6) the previous narrative interpretation (continuity anchor), (7) the paradigm's conversation surface (between-level dialogue vs. real-time chat vs. formal audience).

**Conversation outcomes as CAS events:** When the player talks to an entity, the conversation itself generates events. What the player says is information the entity receives (category 3 event). The player's attention is an arousal event (category 4). If the player reveals new information, shares intel, makes promises, or threatens — each of these is an information/experience event with the player as causal agent. The entity's affect updates through normal CAS rules, and bond to player updates through attribution. Conversation is not a separate system — it's a specific type of CAS interaction.

**`conversation_state`** tracking: `never_contacted`, `hailed_rejected`, `spoken_once`, `spoken_multiple`, `allied`, `betrayed`. This is a mechanical state for gating conversation depth (first conversations are tentative; deep conversations require relationship history). It is NOT an emotional state — the entity's actual feelings about the player come from their affect + bond + knowledge.

---

## The Lore System

The Two Fires lore system is **unchanged** by the CAS redesign. Full lore document: `docs/lore/two-fires.md`.

The lore propagation mechanics are already aligned with the new architecture:

**Knowledge resolution layers** (ambient/structural/actionable) work through the information propagation mechanism. `propagation_resistance` maps directly to the information propagation rules — high resistance means lower probability of packet transmission per tick, effectively limiting how far and fast lore spreads. This is CAS math, untouched by the redesign.

**The Giant/Overseer** operates through the same two-layer architecture as everything else. The Giant is an entity (or operates through entities) whose actions create CAS events. The Giant's manipulations are Claude-directed NPC actions — feeding misinformation (information packets with low accuracy, Giant as hidden causal agent), reinforcing wrong interpretations (new knowledge items for faction leaders), disrupting social networks (creating events that weaken bonds between the player's allies). All processed through standard CAS rules.

**Lore discovery experience** is enhanced by the attribution system. When the player hears "legends speak of two lights stolen from the sky," that's an ambient knowledge item with no specific causal agent. When they hear "there is a way to bridge worlds" from a high-ranking figure, that's a structural knowledge item with attribution to the source entity. When they receive actionable knowledge, the entity sharing it has made a choice to share — which is Claude constructing a decision from that entity's affect state, personality, bond to player, and knowledge. The sharing IS the evidence of trust, not a disposition threshold being crossed.

---

## Manifestation Layer

The Visual Manifestation Engine's relationship to the CAS is restructured:

**Old pipeline:** CAS state → threshold-based behavioral legibility → lookup tables → visual/behavioral overrides → separate Claude call for narrative → separate Claude call for visuals

**New pipeline:** CAS state → Claude interprets at multiple scales in single call → produces unified output: narrative update + behavioral directives + visual manifestation specs + audio/aesthetic modifiers

Claude's interpretation produces `visual_manifestation_specs` directly. Instead of "goomba_union.internal_dissent > 0.4 → protest sign," Claude reads the CAS state (cluster of goomba entities with negative valence, high arousal, weakening bonds to koopa_army faction members, recent knowledge of crackdown) and constructs: "goombas in world_1_3 are showing signs of organized resistance — crude graffiti, lookouts posted, patrol routes that avoid koopa checkpoints." This becomes concrete visual manifestation specs for the VME to render.

**Three generation layers remain:**
- `layer_1_compositional` — recombining existing assets (a goomba sprite + a protest sign prop)
- `layer_2_contextual_variant` — modified pose/state/text (a goomba sprite with altered animation, a sign with specific text)
- `layer_3_novel` — AI-generated assets for situations with no existing match

**`cas_source` field** now references Claude's narrative interpretation rather than CAS threshold values. This means the causal chain for post-game reading goes: CAS state → Claude interpretation → visual manifestation, with both the CAS state and the interpretation logged for reconstruction.

**Aesthetic and audio modifiers** are also produced by Claude's interpretation rather than computed from CAS formulas. Claude reads faction aggregates, player sphere state, and drama density signal, and outputs aesthetic_modifiers (palette_shift, saturation, darkness, decay) and audio_modifiers (tension, tempo, mode_shift, sparseness) as part of the unified interpretation. The principle from Decision 7 (identity stable, expression dynamic) still holds — modifiers push away from the meta home state and return to it, but the mapping from CAS state to modifier values is Claude-constructed rather than formula-computed.

---

## Quality Evaluation System

Full specification: `docs/design/diagnostic-framework.md`

The diagnostic framework is **largely unchanged** by the CAS redesign. The fast-fail funnel, Simulated Player Agent, Moment Extractor, Testing UI, and Pattern Distiller all work the same way.

**What changes:**

**Gate 1 (automated) adjustments:** Schema validation checks need updating to validate the new entity mind structure (affect.valence/arousal instead of disposition/emotional_state/motivations), the new faction state structure (resources only + computed aggregates), and the new CAS block structure (social_timer, previous_narrative).

**Gate 2/3 behavioral conditions:** The conditions that evaluate entity behavior no longer reference CAS threshold crossings. Instead, they evaluate whether Claude's behavioral interpretations produce visible, legible, and dramatically interesting entity behavior. The same quality question applies ("does this entity's behavior feel motivated and alive?") but the answer comes from Claude's interpretation quality rather than threshold calibration.

**Pattern Distiller tuning targets:** Instead of tuning threshold tables and behavioral legibility mappings, the Distiller tunes: (1) CAS_CONFIG rate constants (propagation rates, decay rates, consensus exponent, etc.), (2) Claude interpretation prompt quality (does Claude produce compelling situated interpretations from the primitive state?), (3) drama density calibration (are stagnation/melodrama signals firing at the right times?).

**Diagnostic `cas_source` in visual manifestations:** Now logs Claude's interpretation text rather than threshold values, which actually makes post-hoc analysis richer — you can see exactly what Claude saw and how it interpreted it.

---

## Social Hook Design

Social hooks are the mechanisms that draw the player from mechanical gameplay into social engagement. The CAS redesign changes HOW they're triggered but not WHAT they are or WHY they work.

**Old trigger model:** CAS state crosses a threshold → social hook fires → entity does something unusual that catches the player's attention.

**New trigger model:** Claude reads CAS state at episode boundary → Claude's multi-scale interpretation identifies narratively interesting entity states → Claude constructs behavioral directives that include social hooks as natural expressions of entity state. The hook is not "fired" by a threshold — it emerges from Claude recognizing that an entity's combination of affect, personality, and situation makes them ripe for player interaction.

**Examples (unchanged, but now Claude-constructed rather than threshold-triggered):**
- A goomba who stops patrolling and stands still, facing the player → Claude interprets: entity with near-zero arousal, negative valence, depleted social bonds. Behavioral directive: stop patrol, face player, posture defeated.
- An enemy who flinches instead of attacking → Claude interprets: high arousal, negative valence, knowledge that player is extremely powerful, high-N personality. Behavioral directive: approach but hesitate, flinch on proximity, open to capture.
- A koopa lieutenant who approaches the player cautiously during the between-episode window → Claude interprets: entity with mixed valence (negative about faction, tentatively positive about player from secondhand information), moderate arousal, high-C personality (deliberate, not impulsive). Behavioral directive: initiate contact during social surface window.

**Social hooks in episode triggers** remain as the mechanical interface:
```json
{
  "trigger_id": "social_hook_01",
  "type": "entity_encounter",
  "position": { "x": 475, "y": 192 },
  "radius": 32,
  "target_entity_id": "goomba_07",
  "condition": "entity_alive_and_player_near",
  "visual_cue": {
    "type": "behavioral",
    "description": "goomba stops patrol, faces player, posture uncertain"
  }
}
```

The difference is that these trigger specs are now produced by Claude's interpretation layer rather than by a deterministic CAS-to-behavior mapping. Claude decides which entities should be hook candidates based on the full narrative context.

---

## Universal Extraction & Manifest Architecture

Full specification: `docs/design/universal-extraction-spec.md`

### Overview

Two Fires extracts complete game data from ~1,605 retro games (all US NES ~680, all US SNES ~725, 100 Genesis, 50 arcade, 50 PC) into per-game manifest files. Manifests are the ingredient library — they provide real tiles, real physics, real level layouts, and real enemy behaviors. Claude's creative layer generates CAS setup, narrative, social ecology, and aesthetic direction on top of manifest ingredients.

### RAM Mutation Content Enumerator (Decision 85)

Instead of playing games to discover content (chaos player), the system systematically mutates every candidate RAM byte and observes VRAM/PPU changes. Content-switching variables (level ID, room ID, game phase) are identified by which RAM addresses cause the PPU to load different tile data. All values of these variables are enumerated to capture all game content in ~3 minutes per game with zero per-game configuration.

Five phases: (1) boot to gameplay, (2) identify volatile RAM candidates, (3) mutation sweep scoring unique VRAM states per address, (4) deep enumeration of content variables with full state capture, (5) physics sampling via controlled input sequences.

### Manifest Format

Each game produces a `manifest.json` containing three ground truth categories:

- **Visual:** tile dictionary (unique 8×8 tiles), sprite dictionary (multi-tile arrangements with context), background sets (nametables per content variable value), palette sets
- **Structural:** level layouts (tilemap grids, collision grids), entity placements per level, progression structure (linear, stage select, open world)
- **Mechanical:** player physics (gravity, walk speed, jump velocity, friction, coyote time, variable jump), enemy behaviors (patrol patterns, attack patterns, speeds), game rules (HP, lives, damage, invincibility frames)

### Manifest → Game State Schema Mapping

Manifests populate the game state schema — they don't replace it.

| Manifest Section | Populates | Notes |
|-----------------|-----------|-------|
| `visual.*` | `episode` (tiles, sprites, backgrounds) | Direct data load |
| `structural.levels` | `episode.spatial` + `episode.entities` | Level layout + entity placements |
| `structural.progression` | `meta` (game structure) | Claude interprets into skeleton |
| `mechanical.player_physics` | `episode.physics` | Direct parameter load |
| `mechanical.enemy_behaviors` | `world.entities[].behavioral_parameters` | Maps to flat float dict |
| `mechanical.game_rules` | `meta` + `episode` | Rules populate both |
| — | `world.factions`, `cas`, `player`, `overseer` | Claude's creative layer (NOT from manifest) |

### Emulator: Mesen2 (Decision 80)

Mesen2 (`--testrunner` headless mode) is the extraction emulator for NES and SNES. FCEUX is no longer used.

- **Binary:** `~/mesen2/Mesen.app/Contents/MacOS/Mesen`
- **Headless mode:** `./Mesen --testrunner <rom-path> <lua-script-path>` — runs at max speed, exits on `emu.stop()`
- **Lua sandbox:** `io` and `os` libraries stripped. All data export via `print()` to stdout, captured by Node.js orchestrator (Decision 81)
- **Key API:** `emu.read()/write()` for memory, `emu.getState()` for full state, `emu.saveSavestate()/loadSavestate()` for state management, `emu.setInput()` for controller input, `emu.addEventCallback()` for frame hooks
- **Multi-system:** NES, SNES, GB, GBA, PCE, SMS/Game Gear
- **PPUCTRL (Decision 82):** Renderer must read PPUCTRL to determine CHR bank assignment. No safe default.

### Extraction Pipeline Status

| Component | Status | Location |
|-----------|--------|----------|
| CHR-ROM bulk extractor | ✅ Complete (2,383 NES games) | `tools/extract-chr-rom.js` → `~/nes-extracted/` |
| Mesen2 PPU capture | ✅ Validated (SMB, MM2, Castlevania) | `tools/mesen-extract.lua` |
| Screen renderer | ✅ Validated (CHR-ROM + CHR-RAM) | `tools/render-screen.js` |
| RAM mutation content enumerator | 🔨 Session 11 | `tools/mesen-extract.lua` (enhanced) |
| Physics sampling | 🔨 Session 11 | Part of enumerator |
| Node.js orchestrator | 🔨 Session 11 | `tools/orchestrator.js` |
| Recording analyzer + manifest gen | ❌ Session 12 | — |
| Batch pipeline + scale run | ❌ Session 13 | — |
| SNES extraction | ❌ Session 13 (ROM set needed) | — |

### Mesen2 Lua Development Pattern

1. `print()` goes to stdout — primary data export channel
2. `io.open()` will crash (`io` is nil) — never use file I/O in Lua
3. `emu.stop()` exits the emulator — call at end of every script
4. Hex-encode binary data with structured prefixes: `DATA_RAM:`, `DATA_VRAM:`, `DATA_OAM:`, etc.
5. Node.js orchestrator spawns Mesen2, captures stdout, parses prefixed lines

### Local Data Locations (not in repo)

| Path | Contents |
|------|----------|
| `~/nes-roms/` | No-Intro NES ROM set (~3,146 .nes files) |
| `~/nes-extracted/` | CHR-ROM tile sheets (2,383 games) + capture tests |
| `~/mesen2/` | Mesen2 emulator binary |

### Cost Model

| Resource | Budget |
|----------|--------|
| Emulator compute (full library) | ~9 hours (8 parallel instances) |
| Claude API (manifest interpretation) | ~$50 (Haiku bulk, Sonnet complex) |
| Storage (all manifests) | ~5-10GB |

---

## Paradigm Architecture

Two Fires organizes game types into two layers: a **unified engine with rendering modes** (what gets built) and **player-facing paradigms** (what agents read).

### Unified Engine + 7 Rendering Modes (Decision 86)

One core engine (~80% shared code: tile/sprite rendering, entity system, collision, input abstraction, CAS integration, game state management) with 7 swappable rendering modes (~20%):

1. `tile_2d_sideview` — platformer, beat-em-up, run-and-gun
2. `tile_2d_topdown` — action-adventure, RPG overworld, top-down action/racing
3. `stage_arena` — fighting, RPG combat, fixed-screen, puzzle
4. `scrolling_shooter` — shmups
5. `pseudo_3d` — Mode 7-style racing
6. `raycast_3d` — FPS, adventure, dungeon crawler
7. `strategic_map` — RTS, tactics, management sim

Rendering modes are hot-swappable at runtime for CAS-driven paradigm shifts. All modes share the entity system, collision, CAS integration, and game state — only camera, physics direction, draw order, and input mapping differ.

**This replaces the previous "7 Engine Clusters" architecture.** The 7 game type categories are identical — what changed is that they're rendering mode configurations of one engine, not 7 separate codebases. (Decision 86)

### 12 Player-Facing Paradigm Specs

Each paradigm defines temporal structure, sequencing grammar, social surface, CAS integration, physics, aesthetics, and genre shift interface. See `docs/design/paradigm-specs.md`. These are UNCHANGED by the unified engine decision — the player-facing paradigm layer is a design concept, not an implementation concept.

**Key rule:** The Experience Interpreter maps prompt *activities* to rendering modes based on mechanical feel, not genre labels.

**Shift mechanics:** Intra-mode shifts (platformer → beat-em-up within `tile_2d_sideview`) = parameter swap, seamless. Cross-mode shifts (platformer → racing) = rendering mode hot-swap at runtime. CAS state, entity state, and narrative carry over because they live above the rendering layer.

**CAS integration per paradigm (revised):** Paradigm specs no longer contain behavioral legibility threshold tables. Instead, each paradigm spec defines: (1) the **social surface** — where and how social interaction happens within that paradigm's mechanics, (2) the **social timer pace** — default game_pace_modifier for that paradigm type, (3) **drama density defaults** — min/max significant changes per cadence window, (4) **witness rules** — what constitutes line-of-sight/awareness for that paradigm (same screen in platformer, same room in RPG, visual range in RTS), (5) **information propagation speed** defaults — paradigm-specific rates for how fast knowledge packets travel.

**⚠️ All numerical values in paradigm specs are starting estimates.** Calibrated through the diagnostic framework during testing.

---

## Diagnostic & Tuning Framework Summary

### Testing & Tuning Infrastructure (threaded through all phases)
Two Fires uses a fast-fail diagnostic funnel to evaluate generated game quality efficiently. Full specification in `docs/design/diagnostic-framework.md`.

**Fast-fail funnel:**
- **Gate 1 (automated):** Does it run? Is it pathable? Latency OK? Schema valid?
- **Gate 2 (Joe reviews clips, ~30-45s):** 5 Necessary Conditions — readable opening, physics character (comparison clip), teachability integrity, visual coherence, rhythm heartbeat. Any 👎 = fast fail.
- **Gate 3 (Joe reviews clips, ~45-60s):** INUS Conditions — provocateur moment, aesthetic personality, social hook (Phase 5+), entity behavior (Phase 5+). Only evaluated if Gate 2 passes.
- **Gate 4 (periodic):** Holistic playthroughs, 5-15 minutes. Calibration and spot-checks.

**Rating system:** 👎 (below threshold) / 👍 (above threshold) / 🔥 (exceptional) + optional text rationale

**Diagnostic agents:**
- Simulated Player Agent — automated pathfinding + timeline recording
- Moment Extractor — clips diagnostically meaningful moments for Joe's review
- Comparative Diagnostician — variance analysis across multiple generations of same prompt
- Archetype Stress-Tester — canonical prompt battery, regression detection
- Pattern Distiller — converts Joe's ratings into transferable design principles (Living Taste Document)

**Primary tuning targets:** CAS_CONFIG rate constants, Claude interpretation prompt quality, drama density calibration per paradigm.

**Testing UI:** Zero-navigation card-based web interface. Phase-aware. Two modes: Review (pre-generated queue) and Generate (type prompt → evaluate). Principles tab for approving/rejecting distilled taste principles.

**Phase-gating:** Conditions activate as systems come online. Phase 1 has 3 NCs. Phase 2 has 5 NCs + 2 INUS. Phase 5+ adds social conditions. Each phase starts with more holistic playthroughs to calibrate, then shifts to the faster clip-based funnel.

---

## Agent Execution Order

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
    → Claude receives: CAS snapshot + previous narrative + drama signal
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

---

## Generation Flow

```
Player prompt
  → Claude selects source manifests + generates creative delta (~2-5s):
    - Identify source game manifests (from prompt activities/references)
    - Load manifest data (tiles, physics, layouts, behaviors — instant file read)
    - Claude generates ONLY the creative layer:
      theme/narrative wrapper, CAS initial conditions, social ecology setup,
      visual reskinning direction, aesthetic/music style, faction definitions
  → Skeleton assembled: manifest mechanical data + Claude creative layer
  → Episode 1 assembled from manifest layouts + creative direction
  → Player plays Episode 1 (CAS evolving on social timer)
  → At episode boundary:
    → CAS snapshot taken
    → Claude interpretation call (multi-scale: ecology → faction → cluster → player sphere)
    → Claude produces: narrative update, behavioral directives, visual/audio specs,
        faction leadership decisions (→ CAS events)
  → Between-episode window (triple duty):
      1. Player social interaction surface (conversations = CAS events)
      2. CAS narrative delivery (cutscenes, dialogue, reveals — from Claude interpretation)
      3. Generation masking (next episode content — may load different manifest data
         if paradigm shifting, or rearrange manifest ingredients for variety)
  → Episode 2 assembled incorporating Claude interpretation + CAS state
  → [repeat]

Prompt cost spectrum:
  "Mega Man 2, exactly"           → 100% manifest, ~$0.00, <1s
  "MM2 but Harry Potter theme"    → manifest mechanics + Claude theme, ~$0.03, 2-3s
  "MM2 + Mario Kart + TMNT"      → multi-manifest composition, ~$0.08, 3-5s
  "Feels like Metroid but new"    → manifest-informed generation, ~$0.15, 5-8s
  "Something never seen before"   → full generation, manifests as statistical reference, ~$0.30, 8-12s
```
