# Two Fires — CAS Engine Specification
## Constructionist Social Ecology: Primitives, Rules, Interpretation

---

## What This Document Is

This is the specification for the Two Fires social ecology engine. It defines what primitives each entity has, the rules by which those primitives update, and how Claude interprets the resulting state into narrative and behavior.

**The core architecture is two layers:**

**Layer 1 — The CAS Engine.** Deterministic JavaScript running simple math on a social graph. Affect propagation, information flow, bond dynamics, natural decay. No interpretation, no thresholds, no essentialist categories. Just numbers moving through a network according to local rules. This layer never knows what "fear" or "loyalty" or "morale" means. It just propagates valence, arousal, and information.

**Layer 2 — Claude Interpretation.** At episode boundaries (and social encounter moments), Claude reads the CAS state and constructs situated narrative interpretations. Claude determines what entities are experiencing, what they would do, what the player sees. Claude directs NPC behavior, which creates events, which the CAS processes, which Claude interprets. The loop is continuous but the layers are cleanly separated.

**Claude never modifies CAS state directly.** Claude directs behavior → behavior creates events → events enter the CAS through the rules. This keeps the CAS honest — its behavior is a pure function of its rules, its initial conditions, and agent actions (both player and NPC). If something dramatic happens, it happened because the system dynamics produced it.

---

## Design Philosophy

### Why This Architecture

Traditional game AI uses essentialist categories: entities "are" afraid, loyal, hostile. State machines transition between labeled states at defined thresholds. This has a hard ceiling — the player learns the lookup table and the world feels mechanical.

This engine uses Barrett's constructionist framework as its design principle: there are no essential emotional or social categories at the primitive level. Entities have affect (valence + arousal), personality (OCEAN), knowledge, and social bonds. Everything else — fear, loyalty, courage, moral reasoning, social identity — is *constructed* by Claude from those ingredients in context. The same ingredients produce different constructions in different situations, just as human minds construct different experiences from the same interoceptive signals depending on context.

### What This Gets You

**No behavioral ceiling.** Any social dynamic Claude can recognize and interpret can emerge from the primitives. We don't need to anticipate every possible social situation — just maintain the ingredients.

**Fleeson personality dynamics.** Entities behave consistently in aggregate (OCEAN is stable) but variably in situations (Claude constructs situated expressions). The player develops intuition about who entities *are* while still being surprised by what they *do*.

**True emergence.** Tipping points, revolutions, alliances, betrayals — none programmed. They emerge from local rules on a complex graph, and Claude recognizes and narrates them.

**Infinite scalability.** New paradigms don't need new behavioral legibility tables. New entity types don't need new threshold definitions. The CAS is paradigm-agnostic; the interpretation is paradigm-aware.

---

## Part 1: Entity Primitives

### 1.1 What Each Entity Has

**Stable (set at creation, rarely change):**

```json
{
  "personality": {
    "openness": 0.15,
    "conscientiousness": -0.10,
    "extraversion": -0.05,
    "agreeableness": 0.20,
    "neuroticism": 0.10
  }
}
```

OCEAN values stored as offsets from faction `personality_center`. Entity absolute personality = faction center + offset. Typically -0.3 to +0.3 offset range.

| Factor | What It Does in the CAS |
|--------|------------------------|
| **Openness (O)** | Modulates receptivity to novel information and cross-group bonds. High-O entities adapt to change; low-O entities resist it. |
| **Conscientiousness (C)** | Modulates composure under pressure and reliability of response. High-C entities have smaller arousal spikes; low-C entities are more erratic. |
| **Extraversion (E)** | Modulates social propagation speed and bond formation rate. High-E entities spread information faster and form bonds more easily. |
| **Agreeableness (A)** | Modulates susceptibility to affect contagion and bond influence. High-A entities are pulled more strongly by their social graph. |
| **Neuroticism (N)** | Modulates affect magnitude and baseline. High-N entities have larger valence swings, higher resting arousal, and slower recovery from negative states. |

**Dynamic (updated every tick):**

```json
{
  "affect": {
    "valence": 0.1,
    "arousal": 0.3
  }
}
```

Two numbers. Valence (-1.0 to 1.0): how positive or negative the entity's current state is. Arousal (0.0 to 1.0): how activated. These are NOT emotions. They're the raw substrate from which Claude constructs situated emotional experience.

Personality-determined baselines (what valence and arousal drift toward during routine):

```
valence_baseline = 0.0
  + (extraversion - 0.5) × 0.15
  + (agreeableness - 0.5) × 0.10
  + (neuroticism - 0.5) × -0.15

arousal_baseline = 0.3
  + (neuroticism - 0.5) × 0.20
  + (extraversion - 0.5) × 0.10
```

**Accumulated:**

```json
{
  "knowledge": [
    {
      "id": "k_001",
      "type": "spatial",
      "content": "layout of world_1_1 through world_1_3",
      "accuracy": 1.0,
      "emotional_charge": 0.1,
      "source": "direct_observation",
      "causal_agent": null,
      "acquired_tick": 0
    }
  ],
  "event_history": []
}
```

Knowledge types: `spatial`, `social`, `factual`, `special`, `player_related`. Special knowledge includes Two Fires lore with resolution levels (`ambient`, `structural`, `actionable`).

Event history is append-only — what happened to this entity, when, and the resulting affect changes. Used by Claude for narrative continuity and by the post-game reading system for causal reconstruction.

**Structural:**

```json
{
  "bonds": [
    {
      "target_id": "goomba_06",
      "strength": 0.70,
      "valence": 0.80,
      "asymmetry": 0.0,
      "type": "friend"
    }
  ],
  "faction_id": "goomba_union",
  "status_tier": "low",
  "location_id": "world_1_3",
  "status": "active"
}
```

Bond primitives: `strength` (0.0–1.0, influence magnitude), `valence` (-1.0 to 1.0, positive = allied, negative = rival/enemy), `asymmetry` (-1.0 to 1.0, influence direction), `type` (semantic label for Claude only — CAS math uses strength/valence/asymmetry exclusively).

Status tier: `leader`, `lieutenant`, `specialist`, `mid`, `low`. Determines cascade impact weight and information access.

Entity status: `active`, `defeated`, `captured`, `defected`, `dead`, `fled`, `allied_with_player`.

### 1.2 What Each Faction Has

**Personality center (stable):**

```json
{
  "personality_center": {
    "openness": 0.25,
    "conscientiousness": 0.75,
    "extraversion": 0.50,
    "agreeableness": 0.20,
    "neuroticism": 0.40
  }
}
```

Entity personalities are offsets from this. Defines the faction's cultural character.

**Aggregate state (computed from members each tick, never set independently):**

```
faction.avg_valence = weighted_mean(member.valence, weight=status_tier_value)
faction.avg_arousal = weighted_mean(member.arousal, weight=status_tier_value)
faction.cohesion = 1.0 - weighted_std_dev(member.valence, weight=status_tier_value)
faction.bond_density = total_internal_bonds / max_possible_internal_bonds
faction.member_count = count(active members)
```

**Stored (physical reality, not emergent from affect):**

```json
{
  "resources": 0.75,
  "territory": ["world_1", "world_2", "fortress_1"],
  "leader_entity_id": "bowser_01"
}
```

Resources (0.0–1.0): abstract capacity to act. Not an economy — just a constraint on faction action. Updated by territory control, member count, operations cost, and passive regeneration. Claude interprets low resources as scarcity, desperation, degraded capability. No economy UI unless the paradigm exposes it.

---

## Part 2: The Five Event Categories

Every change to CAS primitives is caused by an event. Events are the only way state changes.

### 2.1 Direct Harm / Threat to Self

Something damages or immediately threatens this entity.

**Affect changes:**
```
entity.valence -= severity × harm_rate
entity.arousal += severity × threat_arousal_rate
```

**OCEAN modulation:**
```
severity_felt = severity
  × (1.0 + (N - 0.5) × 0.6)    // high-N: feels worse
  × (1.0 - (O - 0.5) × 0.2)    // high-O: novelty partially buffers
  × (1.0 + (A - 0.5) × 0.3)    // high-A: conflict-averse, more distressed

arousal_modifier = 1.0
  × (1.0 - (C - 0.5) × 0.4)    // high-C: composure dampens spike
  × (1.0 + (N - 0.5) × 0.4)    // high-N: larger spike

recovery_rate_modifier = 1.0
  × (1.0 + (E - 0.5) × 0.3)    // high-E: externalizes, recovers faster
  × (1.0 - (N - 0.5) × 0.4)    // high-N: slower recovery
```

### 2.2 Bond Change

Bond formed, strengthened, weakened, or severed.

**Affect changes:**
```
// Severance
entity.valence -= bond.strength × max(bond.valence, 0) × severance_rate
entity.arousal += suddenness × bond.strength × severance_arousal_rate

// Formation
entity.valence += initial_strength × initial_valence × formation_rate
entity.arousal += novelty_rate

// Strengthening
entity.valence += delta_strength × bond.valence × reinforcement_rate

// Betrayal (valence inversion)
entity.valence -= bond.strength × abs(bond.valence) × betrayal_rate
entity.arousal += bond.strength × betrayal_arousal_rate
```

**OCEAN modulation:**
```
bond_impact = base_impact
  × (1.0 + (A - 0.5) × 0.5)    // high-A: bonds matter more
  × (1.0 + (E - 0.5) × 0.3)    // high-E: social world is central
  × (1.0 + (N - 0.5) × 0.3)    // high-N: larger swings

cross_group_formation = base_rate
  × (1.0 + (O - 0.5) × 0.6)    // high-O: more receptive to outsiders

duty_bond_impact = base_impact
  × (1.0 + (C - 0.5) × 0.4)    // high-C: duty/hierarchical bonds hit harder
```

### 2.3 Information / Experience Event

Entity learns or directly experiences something about the state of the world. The broadest category.

**Affect changes:**
```
valence_shift = emotional_charge × alignment_with_entity_interests × accuracy_weight
arousal_shift = magnitude × novelty_factor
```

Where `alignment_with_entity_interests` is computed from the entity's current position: faction membership, bond network, location, status. Good for my group = positive alignment. Bad for my group = negative. Range: -1.0 to 1.0.

`novelty_factor` = how much this contradicts entity's current knowledge model. Confirming info = low arousal. Surprising info = high arousal.

**OCEAN modulation:**
```
novelty_arousal = base × (1.0 + (O - 0.5) × 0.5)     // high-O: stimulated by surprise
valence_flex = base × (1.0 + (O - 0.5) × 0.3)        // high-O: willing to update worldview
eff_accuracy = accuracy × (1.0 + (C - 0.5) × 0.3)    // high-C: weights reliable sources more
threat_amplify = base × (1.0 + (N - 0.5) × 0.4)      // high-N: threat info feels worse
social_receptivity = base × (1.0 + (A - 0.5) × 0.3)  // high-A: receptive to pro-social info
// E doesn't modulate response — it modulates propagation speed (Part 3)
```

### 2.4 Attention From Player

Pure arousal event, separate from any information exchanged (which is a 2.3 event).

```
entity.arousal += player_notoriety × attention_arousal_rate
  × (1.0 + (E - 0.5) × 0.3)    // high-E: social attention more activating
  × (1.0 + (N - 0.5) × 0.3)    // high-N: more activated
  × (1.0 + (O - 0.5) × 0.2)    // high-O: curiosity adds activation
```

### 2.5 Passage of Time / Routine

The system's gravity. No notable events.

**Drift toward baselines:**
```
entity.valence += (valence_baseline - entity.valence) × valence_drift_rate × drift_modifier
entity.arousal += (arousal_baseline - entity.arousal) × arousal_drift_rate × drift_modifier
```

**Social buffering accelerates recovery:**
```
social_support = sum(bond.strength × max(bond.valence, 0)) for all bonds
drift_modifier = 1.0 + social_support × social_buffering_rate
```

**Bond decay:** Unreinforced bonds lose strength. Below dissolution threshold → severed (triggers 2.2).

**Knowledge decay:** Emotional charge of stored knowledge decays per tick. Facts remain; feelings fade.

---

## Part 3: Propagation Rules

Two mechanisms. Everything else emerges.

### 3.1 Affect Contagion

Valence and arousal changes spread through bonds continuously. No attribution carried.

```
Per tick, for each entity A with valence/arousal changes:
  For each bonded entity B:
    valence_signal = A.valence_change × bond.strength × bond_valence_factor(bond.valence)
    B.valence += valence_signal × propagation_rate × B.A_factor × B.N_factor

    arousal_signal = A.arousal_change × bond.strength × novelty_factor
    B.arousal += arousal_signal × propagation_rate × B.N_factor
```

**Bond valence factor:** Positive bonds transmit faithfully (empathy). Negative bonds partially invert (schadenfreude, dampened).
```
bond_valence_factor(v) = v > 0 ? v : v × 0.5
```

**Consensus multiplier:** When multiple bonds send same-direction signal:
```
consensus_ratio = same_direction_bonds / total_bonds
multiplier = 1.0 + consensus_ratio²
// 3/5 same direction: 1.36x. 5/5: 2.0x.
```

### 3.2 Information Propagation

Knowledge packets travel along bonds discretely. Attribution travels with information.

```
Per tick, for entity A holding packets:
  For each bonded entity B, for each packet P that B lacks:
    propagation_chance = bond.strength × A.E_factor × paradigm_rate
    if propagates:
      P_copy.accuracy *= degradation_per_hop × (0.85 + A.C × 0.15)
      P_copy.emotional_charge *= charge_decay_per_hop
      P_copy.hops += 1
      P_copy.source = A.id
      // causal_agent preserved — attribution travels with info
      if P_copy.hops < max_hops AND P_copy.accuracy > min_threshold:
        B receives P_copy → processed as category 2.3 event
```

---

## Part 4: Bond Dynamics

### 4.1 Attribution-Based Bond Changes

When entity A experiences a valence shift attributed to entity B:

```
bond(A→B).valence += A.valence_change × attribution_strength × valence_update_rate
bond(A→B).strength += abs(A.valence_change) × attribution_strength × strength_update_rate
// Love and hate both strengthen connection

If no bond exists AND abs(A.valence_change) > formation_threshold:
  Create new bond with initial strength and valence matching the event
```

Attribution strength: 1.0 for direct witnesses, degrades with information hop accuracy for packet-propagated events.

### 4.2 Shared Experience

Co-presence during significant events strengthens bonds regardless of affect direction:
```
bond.strength += shared_experience_rate × event.magnitude
// Trauma bonds are real. Shared suffering connects.
// Valence not affected — closer doesn't mean friendlier.
```

### 4.3 Bond Formation Between Strangers

Repeated co-presence above interaction threshold → formation probability check modulated by E and A factors. Cross-group formation additionally modulated by O.

### 4.4 Bond Dissolution

Unreinforced bonds decay. Below dissolution threshold → severed → bond change event (2.2).

---

## Part 5: The Attribution Mechanism

### 5.1 How It Works

**Events carry `causal_agent` tags.** Player kills goomba → `causal_agent: player`. Leader orders crackdown → `causal_agent: leader_id`. Natural disaster → `causal_agent: null`.

**Witnesses get immediate attribution.** Within awareness radius + active + line of sight. Bond to causal agent updates immediately at full attribution strength.

**Information packets carry attribution.** `causal_agent` travels with the packet. Attribution strength degrades with packet accuracy. Recipients update bond to causal agent when packet arrives, at reduced strength.

**Affect contagion carries NO attribution.** Entity B feels worse because bonded entity A feels worse. B doesn't know why. No third-party bond changes from pure contagion.

### 5.2 The Timing Asymmetry

**Affect spreads fast without explanation. Understanding spreads slow with attribution.**

After dramatic event: nearby entities feel emotional impact immediately via contagion. Only witnesses know the cause. Information propagates outward over subsequent ticks/episodes with degrading accuracy and attribution. Far entities feel ambient mood shift without understanding its cause — until information arrives.

### 5.3 Strategic Implications

Acting without witnesses limits attribution (stealth, covert action, proxies). Acting publicly maximizes it (dramatic gestures, visible mercy, public displays of power). The antagonist operates under the same information constraints — disloyal spies feed bad intel, disrupting intelligence networks is a valid player strategy.

### 5.4 Witness Determination

```
witnesses = entities within awareness_radius of event location
  AND status == active
  AND paradigm-specific line of sight
```

---

## Part 6: Faction Dynamics

### 6.1 Aggregates Computed From Members

```
avg_valence, avg_arousal: weighted mean (weight = status tier)
cohesion: 1.0 - weighted std dev of valence
bond_density: internal bonds / max possible
member_count: active members
```

Status tier weights: leader=5, lieutenant=3, specialist=2, mid=1.5, low=1.

### 6.2 Resources

Abstract capacity to act. The one stored faction value.
```
Per cycle: +territory +members -operations +passive_regen
```
Claude interprets low resources narratively. No economy UI unless paradigm demands it.

### 6.3 Faction Actions

Claude determines leadership decisions at episode boundaries. Decisions become CAS events processed through normal rules. A crackdown = harm events with leader as causal agent. Reinforcement = environmental shift events. Diplomacy = information events. Claude constructs what leadership would do from their personality, information, and situation — not from a fixed action menu.

---

## Part 7: The Social Timer

### 7.1 Independent Social Clock

The CAS runs on its own heartbeat independent of paradigm tick frequency.

```
social_time_interval = base_interval × game_pace_modifier
  base_interval: 120 seconds (2 min real time)
  game_pace_modifier: set per game by Dramaturgical Agent (0.5–1.5)
```

Per social time cycle: full propagation, information advancement, bond decay, drift, faction aggregation, drama density check.

### 7.2 Interaction With Paradigm

Paradigm ticks (episode boundaries, social encounters) are evaluation points where Claude interprets current CAS state. Between paradigm ticks, the CAS evolves continuously on its own clock. A player who takes a long time on a level returns to a social graph that has evolved more. Time matters.

---

## Part 8: Drama Density Calibration

### 8.1 Signals to Claude

**Stagnation signal:** Significant change count (valence/arousal shifts above threshold) falls below paradigm minimum over cadence window → signal included in Claude's interpretation context suggesting NPC action.

**Melodrama signal:** Significant change count exceeds paradigm maximum → signal suggesting consolidation/cooling.

### 8.2 Paradigm Cadence Defaults

| Paradigm | Drama Pace | Cadence Window |
|----------|-----------|----------------|
| Platformer | Slow burn | 2-3 episodes |
| RPG | Moderate | 3-5 transitions |
| Racing | Low-moderate | 1-2 races |
| RTS | Moderate-high | 2-3 minutes |
| Shmup | Low | 1-2 stages |
| Management Sim | Moderate-high | 2-3 decisions |
| Fighting | Low-moderate | 2-3 bouts |
| FPS | Moderate-high | 1-2 zones |

Starting defaults. Per-game adjustment. Refined through diagnostics.

---

## Part 9: Claude's Interpretation Layer

### 9.1 What Claude Receives

```
{
  "previous_narrative": "...",
  "social_time_elapsed": 2,
  "cas_snapshot": {
    "entities_in_scope": [...],
    "faction_aggregates": {...},
    "recent_events": [...],
    "information_flow": [...],
    "bond_changes": [...]
  },
  "drama_density_signal": "...",
  "paradigm_context": "...",
  "player_recent_actions": [...]
}
```

### 9.2 What Claude Produces

```
{
  "narrative_update": "...",
  "entity_interpretations": [{
    "entity_id": "...",
    "situated_experience": "...",
    "behavioral_directive": "...",
    "dialogue_ready": true/false
  }],
  "faction_interpretations": [{
    "faction_id": "...",
    "current_state_narrative": "...",
    "leadership_decisions": [...]    // Become CAS events
  }],
  "visual_manifestation_specs": [...],
  "audio_modifiers": {...},
  "aesthetic_modifiers": {...}
}
```

### 9.3 Narrative Continuity

Each interpretation is a **delta from the previous**. The narrative has inertia — same as CAS values track their prior values. Prevents jarring discontinuities. Claude receives previous interpretation as context and updates based on what changed.

### 9.4 Multi-Scale Interpretation

In a single call, Claude interprets at:
- **Ecology-wide:** Macro narrative from all faction aggregates
- **Faction-scale:** Within and between faction dynamics
- **Cluster-scale:** Sub-faction group dynamics from graph topology
- **Player-sphere:** Individual entities the player interacts with

Each scale provides context for the others. Barrett's framework at social scale.

---

## Part 10: Initial Conditions

The Dramaturgical Agent establishes CAS initial conditions at game creation:
- Faction personality centers
- Entity personality offset distributions
- Initial valence/arousal ranges per faction (never uniform)
- Social graph topology (clustered with weak bridges)
- Power asymmetries
- Resource levels
- Social timer pace modifier
- Drama density calibration

The player enters an already-evolving system. CAS has dynamics from tick zero.

---

## Part 11: Tuning Configuration

```javascript
const CAS_CONFIG = {
  affect: {
    harm_rate: 0.3,
    threat_arousal_rate: 0.4,
    severance_rate: 0.25,
    severance_arousal_rate: 0.3,
    formation_rate: 0.1,
    reinforcement_rate: 0.05,
    betrayal_rate: 0.35,
    betrayal_arousal_rate: 0.4,
    attention_arousal_rate: 0.15,
  },
  drift: {
    valence_drift_rate: 0.03,
    arousal_drift_rate: 0.05,
    social_buffering_rate: 0.02,
  },
  propagation: {
    affect_rate: 0.12,
    info_base_rate: 0.3,
    accuracy_degradation: 0.82,
    charge_decay: 0.85,
    min_accuracy: 0.2,
    consensus_exponent: 2,
  },
  bonds: {
    valence_update_rate: 0.1,
    strength_update_rate: 0.05,
    formation_rate: 0.3,
    formation_threshold: 0.2,
    interaction_threshold: 3,
    initial_strength: 0.2,
    neglect_decay: 0.01,
    dissolution_threshold: 0.05,
    shared_experience_rate: 0.03,
  },
  resources: {
    territory_rate: 0.02,
    member_rate: 0.001,
    operation_cost: 0.05,
    regen_rate: 0.01,
  },
  social_timer: {
    base_interval_seconds: 120,
  },
  drama: {
    significance_threshold: 0.15,
    cadence_window: 3,
  },
  knowledge: {
    charge_decay: 0.95,
    max_hops: 6,
  }
};
```

All values are starting estimates. Calibrated through diagnostic framework.

---

## Part 12: Implementation Summary

**Estimated scope:** 430-610 lines JavaScript.

**Performance:** <10ms per full social timer cycle for 50-100 entities.

**The CAS engine does:** propagate affect, propagate information, update bonds, compute faction aggregates, manage resources, track drama density, log events.

**The CAS engine does NOT:** interpret state, determine emotions, decide behavior, trigger thresholds, prescribe expressions, or modify its own rules.

---

## Appendix: Relationship to Other Specs

**Game State Schema (Thread 1):** Entity state variables (loyalty, morale, stress, etc.) replaced by valence + arousal. OCEAN, knowledge system, bond primitives, distributed reputation retained. `behavioral_override` structure retained for Claude directives.

**Paradigm Specs (Thread 2):** Behavioral legibility descriptions become inputs to Claude's interpretation rather than deterministic lookup tables. Social surface maps, tick timing, drama density calibrations retained.

**Diagnostic Framework:** CAS_CONFIG values are the primary tuning target. Pattern Distiller and Stress-Tester evaluate whether dynamics produce compelling Claude interpretations.
