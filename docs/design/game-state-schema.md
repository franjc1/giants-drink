# Two Fires — Game State JSON Schema
## The Contract Between Every System

**Last updated:** 2026-03-05 (Reconciled: Threads 1, 3, 5, 7, 8, 9)

---

## What This Document Is

This is the single source of truth for the data structures that flow between all Two Fires systems. Every agent, every engine component, every diagnostic tool reads from or writes to these structures. If it's not in this document, it doesn't exist in the game state.

**Who reads this:** Claude Code (for implementation), every agent prompt (for knowing what they produce and consume), the diagnostic framework (for knowing what to validate).

**Design principles:**
- **Flat where possible, nested only where ownership is clear.** Flat dictionaries of typed values make it trivial to add new fields later without restructuring. Missing fields fall back to defaults, so old saves remain compatible.
- **Every field has a single writer.** One system produces it, others read. If two systems need to modify the same data, that's a design problem — resolve it by splitting the field or routing through one system.
- **CAS state is sacred.** Nothing except the CAS engine modifies faction aggregates, entity affect, or the social graph at runtime.
- **Asset references are always semantic specs, never filenames.** Track A/B resolution happens downstream.
- **All float values are 0.0–1.0 unless explicitly noted.** Affect valence and bond valence range -1.0 to 1.0.
- **Identity is stable, expression is dynamic.** The game knows what it IS (immutable meta), but how it looks/sounds/feels responds to CAS state (dynamic modifiers in episodes).
- **Forward-compatible by default.** Flat dicts, typed items in lists, version field. Adding a new primitive or knowledge type is a new field or tag, never a restructure.
- **No essentialist emotional categories.** Entities have affect primitives (valence + arousal). All higher-level constructs (fear, loyalty, courage) are constructed by Claude from primitives in context (Barrett's constructionist framework).
- **Reputation is constructed by the perceiver.** No entity carries a reputation score. Each perceiver constructs reputation from their own knowledge and affect state.

---

## Top-Level Structure

A running game instance has one `GameState` object. This is the entire truth of one game at one moment.

```json
{
  "meta": { },
  "world": { },
  "cas": { },
  "episode": { },
  "player": { },
  "overseer": { },
  "diagnostics": { }
}
```

| Block | Written By | Read By | Persistence |
|-------|-----------|---------|-------------|
| `meta` | Experience Intelligence agents (pre-game) | Everything | Per-game, immutable after creation |
| `world` | Game Compiler (initial), CAS Engine (runtime) | Paradigm Engine, VME, Entity Minds, Claude interpretation | Per-game, evolves continuously on social timer |
| `cas` | CAS Engine exclusively | Claude interpretation, diagnostic systems | Per-game, ticks on social timer |
| `episode` | Construction pipeline: Designer + Builder + Validator (per episode) | Paradigm Engine (renderer + physics) | Per-episode, regenerated each episode |
| `player` | Paradigm Engine (position/actions), Game Mind (behavioral model) | CAS Engine (as input to events), Overseer, Diagnostics | Per-game + cross-game (behavioral model) |
| `overseer` | Overseer system | Experience Interpreter (for later games) | Cross-game persistent (Cloudflare KV/R2) |
| `diagnostics` | Simulated Player, Moment Extractor, Gate checks | Testing UI, Pattern Distiller | Per-generation, dev only, never shipped |

---

## Concern 1: `meta` — Game Identity

Created by the pre-game agent pipeline. Immutable after game creation (with one exception: paradigm shifts update `current_paradigm` in the world state, not here — meta records the *original* identity).

### Structure

```json
{
  "meta": {
    "schema_version": "0.2.0",
    "game_id": "tf_29a7c3",
    "created_at": "2026-03-01T14:22:00Z",
    "prompt": "Mario but the goombas are sentient and have a labor movement",

    "paradigm": {
      "id": "platformer",
      "rendering_core": "2d_tile_scrolling",
      "interaction_grammar": "direct_action"
    },

    "aesthetic": {
      "style_era": "nes_late",
      "palette_id": "smb3_grassland",
      "palette_colors": ["#5C94FC", "#A4E4FC", "#88D800", "#005800", "#FCE4A0", "#E45C10", "#000000"],
      "crt_intensity": 0.4,
      "pixelation_scale": 3
    },

    "audio_profile": {
      "tempo_bpm": 140,
      "key": "C",
      "mode": "major",
      "waveforms": ["square", "triangle", "noise"],
      "style_reference": "koji_kondo_upbeat"
    },

    "philosophy": {
      "conviction": "solidarity under oppression is the only real power",
      "tone": "darkly comic",
      "dramatic_question": "can collective action survive co-optation?"
    },

    "game_visual_identity": null,

    "game_setup": {
      "intended_length": "medium",
      "event_magnitude_sensitivity": 0.6,
      "initial_conditions_summary": "goombas near revolt threshold, koopa army overextended, player enters at inflection point",
      "pressure_ramp": "player_driven",
      "social_hooks": [
        {
          "trigger": "episode_2_start",
          "type": "forced_encounter",
          "description": "injured goomba blocks path, can be stomped or spoken to"
        }
      ],
      "drama_density_defaults": {
        "min_significant_changes_per_cadence": 1,
        "max_significant_changes_per_cadence": 4
      },
      "social_timer_pace": 1.0,
      "forgiveness": {
        "checkpoint_max_loss_seconds": 75,
        "death_cost": "time_only",
        "enemy_telegraph_ms": 500,
        "teachability_zone_screens": 3,
        "complexity_ceiling_simultaneous": 3,
        "ramp_shape": "concave",
        "difficulty_override": null
      }
    },

    "skeleton": {
      "paradigm_grammar_id": "platformer_standard",
      "total_episodes": 8,
      "zones": [
        {
          "zone_id": "grassland",
          "episodes": [1, 2],
          "vocabulary_budget": ["goomba_patrol", "pit", "koopa_troopa", "coin_block"],
          "complexity_ceiling": 0.3,
          "punctuation": null
        },
        {
          "zone_id": "underground",
          "episodes": [3, 4],
          "vocabulary_budget": ["piranha_plant", "moving_platform", "thwomp"],
          "complexity_ceiling": 0.5,
          "punctuation": { "type": "mid_boss", "episode": 4 }
        }
      ],
      "override_conditions": []
    }
  }
}
```

### Key Fields

**`paradigm.id`** — one of: `platformer`, `shmup`, `top_down_action`, `rpg_combat`, `fps`, `adventure`, `fighting`, `racing_mode7`, `racing_overhead`, `rts`, `management_sim`, `isometric`, `fixed_screen`.

**`aesthetic` and `audio_profile`** — the *home state*. The game's visual and audio identity at equilibrium. Episode generation applies CAS-driven mood modifiers that push expression away from home during crisis and back toward it during stability. Modifiers live in the episode block, not here.

**`game_visual_identity`** — Track B only. Complete visual system specification (palette architecture, proportion grid, detail density, animation budget, visual shorthand dictionary, silhouette distinctiveness rules). Null for Track A games. See VME spec for full structure.

**`philosophy`** — genuinely immutable. The soul of the game. Informs how Claude interprets CAS events, what kind of post-game reading the Game Mind produces.

**`game_setup`** — formerly `dramaturgical_setup`. Written by the Game Compiler (which absorbed the Dramaturgical Agent's functions per Decision 29). Contains all initial condition parameters.

**`game_setup.intended_length`** — short / medium / long / epic. Calibrates `event_magnitude_sensitivity`. Shorter games need higher sensitivity so the CAS ramps meaningfully in the available window.

**`game_setup.pressure_ramp: "player_driven"`** — difficulty escalation is keyed to the player's own impact on the world, not a fixed curve. The player IS the catalyst (see Player as Catalyst below).

**`game_setup.forgiveness`** — SNES Comfort Model defaults (Decision 53). Applied unless `difficulty_override` is set by explicit player prompt language ("hard," "punishing," "arcade difficulty"). See claude.md for full forgiveness philosophy.

**`skeleton`** — the paradigm grammar instantiated for this specific game. Vocabulary budget per zone, complexity ceiling per zone, punctuation placement, override conditions for CAS-driven adaptation. Produced by Game Compiler from paradigm grammar + prompt + narrative.

### Player as Catalyst Principle

The player is an extraordinary force. Conquering a world, destroying a castle, defeating hundreds of soldiers — these are seismic events. The CAS is calibrated to treat the player as the most disruptive force in the ecology. `event_magnitude_sensitivity` tunes how strongly the CAS reacts.

This creates the natural dual ramp: non-social challenge increases because factions rationally respond to a genuine threat, and social opportunity expands because entities have heard of this extraordinary being and want to ally, defect, or negotiate. The better you are at the mechanical game, the faster the social game becomes essential.

---

## Concern 2: `world` — The Living World State

Everything that persists across episodes: who exists, where they are, what they know, how they relate. This is the game beneath the game.

### Structure

```json
{
  "world": {
    "current_paradigm": "platformer",
    "factions": { },
    "entities": { },
    "population_templates": { },
    "locations": { },
    "information_packets": [ ],
    "event_log": [ ]
  }
}
```

`current_paradigm` — usually matches `meta.paradigm.id`, but updates during paradigm shifts (Phase 7).

### `world.factions`

Keyed by faction ID. Initial values set by Game Compiler, runtime updates by CAS Engine exclusively.

```json
{
  "factions": {
    "koopa_army": {
      "id": "koopa_army",
      "name": "Koopa Army",
      "role": "antagonist_primary",

      "personality_center": {
        "openness": 0.25,
        "conscientiousness": 0.75,
        "extraversion": 0.50,
        "agreeableness": 0.20,
        "neuroticism": 0.40
      },

      "resources": 0.75,

      "leader_entity_id": "bowser_01",
      "territory": ["world_1", "world_2", "fortress_1"],

      "computed_aggregates": {
        "avg_valence": 0.10,
        "avg_arousal": 0.35,
        "cohesion": 0.65,
        "bond_density": 0.42,
        "member_count": 47
      }
    }
  }
}
```

**Faction state model (Thread 3 redesign):** Factions have ONE stored value: **`resources`** (0.0–1.0, abstract capacity to act — not a full economy). Everything else is **computed from member entities** each CAS tick:

| Computed Aggregate | Derivation |
|---|---|
| `avg_valence` | Mean of member affect valence values |
| `avg_arousal` | Mean of member affect arousal values |
| `cohesion` | 1.0 minus weighted standard deviation of member valence. High = unified, low = fractured |
| `bond_density` | Ratio of actual intra-faction bonds to possible bonds |
| `member_count` | Active members |

**Why no stored morale, loyalty, awareness, disposition, or dissent:** Thread 3 (Decisions 14-22) eliminated these as stored primitives. They were essentialist categories that prescribed what entities "should" feel. Under Barrett's constructionist framework, these are interpretations Claude constructs from primitives in context:
- "Morale" emerges from avg_valence + avg_arousal + resources + recent events
- "Loyalty" emerges from bond valence toward leader + cohesion + knowledge about alternatives
- "Dissent" emerges from low cohesion + negative avg_valence + knowledge of grievances
- "Awareness of player" emerges from which entities have player_related knowledge items
- "Disposition to player" emerges from knowledge + affect + bonds (constructed per-entity, not per-faction)

**`personality_center`** — OCEAN factors for the faction. Individual entities are offsets from this. Koopa Army: low-O (rigid), high-C (disciplined), low-A (uncompromising). Goomba Workers: high-A (cooperative), high-N (anxious), high-O (open to change).

**Resources:** Hard constraint — without resources, strategies can't execute. Updated by CAS: +territory +members -operations +passive_regen.

### `world.entities`

Keyed by entity ID. Every being with a mind. Two populations: **named entities** (individually generated) and **population entities** (batch-generated from templates, promoted to named on first player contact).

#### Named Entity Structure

```json
{
  "entities": {
    "goomba_07": {
      "id": "goomba_07",
      "name": "Grim",
      "entity_type": "named",
      "faction_id": "goomba_union",
      "role": "foot_soldier",
      "rank": "low",
      "status": "active",
      "location_id": "world_1_3",

      "personality": {
        "openness": 0.20,
        "conscientiousness": -0.10,
        "extraversion": -0.05,
        "agreeableness": 0.15,
        "neuroticism": 0.10
      },

      "affect": {
        "valence": -0.15,
        "arousal": 0.45
      },

      "motivations": ["survive", "protect_family", "end_forced_labor"],
      "conversation_state": "never_contacted",
      "communication_willingness": 0.50,

      "knowledge": [
        {
          "id": "k_001",
          "type": "spatial",
          "content": "layout of world_1_1 through world_1_3",
          "accuracy": 1.0,
          "emotional_charge": 0.0,
          "source": "direct_observation",
          "causal_agent": null,
          "acquired_tick": 0
        },
        {
          "id": "k_002",
          "type": "social",
          "content": "goomba_foreman_01 is frustrated with koopa_army leadership",
          "accuracy": 0.75,
          "emotional_charge": 0.3,
          "source": "goomba_06",
          "causal_agent": "goomba_foreman_01",
          "acquired_tick": 2
        },
        {
          "id": "k_003",
          "type": "special",
          "content": "ancient legends speak of two lights stolen from the sky",
          "accuracy": 0.40,
          "emotional_charge": 0.1,
          "source": "faction_folklore",
          "causal_agent": null,
          "acquired_tick": 0,
          "resolution_level": "ambient",
          "propagation_resistance": 0.1
        }
      ],

      "bonds": [
        { "target_id": "goomba_06", "strength": 0.70, "valence": 0.80, "asymmetry": 0.0, "type": "friend" },
        { "target_id": "goomba_08", "strength": 0.40, "valence": 0.50, "asymmetry": 0.0, "type": "acquaintance" },
        { "target_id": "goomba_foreman_01", "strength": 0.55, "valence": 0.60, "asymmetry": 0.3, "type": "mentor" }
      ],

      "event_history": [],

      "behavioral": {
        "patrol_range": 64,
        "patrol_speed": 1.0,
        "awareness_radius": 48,
        "response_behavior": "approach_cautious",
        "contact_damage": 1,
        "capture_window_ms": 2000
      },

      "asset_spec": {
        "visual": {
          "dimensions": [16, 16],
          "color_count": 3,
          "palette_profile": "warm_dark",
          "silhouette_class": "round_short",
          "style_era": "nes_late",
          "animation": { "frames": 2, "type": "walk_cycle", "speed": "slow" }
        },
        "narrative": {
          "role": "foot_soldier",
          "faction": "goomba_union",
          "disposition": "reluctant"
        },
        "reference": {
          "style_reference": "goomba",
          "primary_game": "super_mario_bros"
        }
      }
    }
  }
}
```

#### Population Entity Structure

```json
{
  "entities": {
    "goomba_pop_14": {
      "id": "goomba_pop_14",
      "name": null,
      "entity_type": "population",
      "faction_id": "goomba_union",
      "template_id": "goomba_patrol_template",
      "role": "foot_soldier",
      "rank": "low",
      "status": "active",
      "location_id": "world_1_2",

      "affect": {
        "valence": -0.10,
        "arousal": 0.38
      },

      "communication_willingness": 0.35
    }
  }
}
```

Population entities inherit personality, knowledge, behavioral parameters, and asset_spec from their `template_id` in `world.population_templates`. They store only: id, affect (with minor random perturbation from template baseline), location, status, and communication_willingness. On first player conversation, promoted to named: Claude generates individual OCEAN offsets, name, knowledge list, bonds, and motivations. The entity gets a full named entry and the population entry is removed.

### `world.population_templates`

```json
{
  "population_templates": {
    "goomba_patrol_template": {
      "id": "goomba_patrol_template",
      "faction_id": "goomba_union",
      "role": "foot_soldier",
      "rank": "low",

      "personality_baseline": {
        "openness": 0.0,
        "conscientiousness": 0.0,
        "extraversion": 0.0,
        "agreeableness": 0.0,
        "neuroticism": 0.0
      },

      "affect_baseline": {
        "valence": -0.10,
        "arousal": 0.35
      },

      "knowledge": [
        {
          "id": "tk_001",
          "type": "spatial",
          "content": "general layout of assigned zone",
          "accuracy": 0.4,
          "emotional_charge": 0.0,
          "source": "faction_common",
          "causal_agent": null,
          "acquired_tick": 0
        },
        {
          "id": "tk_002",
          "type": "special",
          "content": "ancient legends speak of two lights stolen from the sky",
          "accuracy": 0.25,
          "emotional_charge": 0.05,
          "source": "faction_folklore",
          "causal_agent": null,
          "acquired_tick": 0,
          "resolution_level": "ambient",
          "propagation_resistance": 0.1
        }
      ],

      "behavioral": {
        "patrol_range": 64,
        "patrol_speed": 1.0,
        "awareness_radius": 48,
        "response_behavior": "patrol",
        "contact_damage": 1,
        "capture_window_ms": 2000
      },

      "communication_willingness_baseline": 0.35,

      "asset_spec": {
        "visual": {
          "dimensions": [16, 16],
          "color_count": 3,
          "palette_profile": "warm_dark",
          "silhouette_class": "round_short",
          "style_era": "nes_late",
          "animation": { "frames": 2, "type": "walk_cycle", "speed": "slow" }
        },
        "narrative": { "role": "foot_soldier", "faction": "goomba_union" },
        "reference": { "style_reference": "goomba", "primary_game": "super_mario_bros" }
      }
    }
  }
}
```

Population templates are compact — one template covers an entire class of entities. The `personality_baseline` is (0,0,0,0,0) by default (meaning entities use the faction center directly). On promotion, Claude generates individual offsets.

#### Entity Affect (Thread 3)

Two dynamic values updated every CAS tick:

**`affect.valence`** (-1.0 to 1.0) — how positive or negative the entity's current state is.
**`affect.arousal`** (0.0 to 1.0) — how activated/agitated the entity is.

These are NOT emotions. They're the raw substrate from which Claude constructs situated emotional experience. Same valence + arousal in different contexts → different emotional interpretations. High arousal + negative valence near a threat → Claude might construct "fear." Same numbers after a betrayal → Claude might construct "rage." Barrett's constructionism in action.

Personality-determined baselines (drift targets during routine):
```
valence_baseline = 0.0 + (E-0.5)×0.15 + (A-0.5)×0.10 + (N-0.5)×-0.15
arousal_baseline = 0.3 + (N-0.5)×0.20 + (E-0.5)×0.10
```

#### Entity Personality

**`personality`** — OCEAN offsets from faction `personality_center`. Entity's absolute personality = faction center + offset. Five factors, typically -0.3 to +0.3.

| Factor | CAS Role |
|--------|----------|
| **Openness (O)** | Receptivity to novelty, cross-group bonds, worldview flexibility |
| **Conscientiousness (C)** | Composure under pressure, reliability, discounting low-accuracy info |
| **Extraversion (E)** | Information propagation speed, bond formation rate, social centrality |
| **Agreeableness (A)** | Susceptibility to affect contagion, bond influence, pro-social receptivity |
| **Neuroticism (N)** | Affect magnitude, arousal baseline, recovery speed from negative states |

**Why deception, courage, empathy are NOT explicit traits:** They emerge from OCEAN + situation. Low-A + low-C + negative disposition + valuable info = likely to deceive. Low-N + threat = courage. High-A + high-O + exposure to suffering = empathy. Let them emerge from primitives.

#### Entity Knowledge

Flat list of tagged items. **This is the architectural enforcement of bounded knowledge.** Claude dialogue generation receives ONLY items in this list. The entity cannot reference information it doesn't possess.

All knowledge enters through: direct observation (highest accuracy), told by connected entity (degrades per hop), faction channels (lowest accuracy, most delayed), or initial distribution by Game Compiler.

**Knowledge item fields:** `id`, `type`, `content`, `accuracy`, `emotional_charge`, `source`, `causal_agent`, `acquired_tick`. Special knowledge adds `resolution_level` and `propagation_resistance`.

**Knowledge item types:** `spatial`, `social`, `factual`, `special`, `player_related`.

**Special knowledge resolution layers:**

| Level | Propagation Resistance | Examples | Who Typically Has It |
|-------|----------------------|---------|---------------------|
| `ambient` | Low (0.1–0.3) | "Legends speak of two lights stolen from the sky" | Many entities, vague and degraded |
| `structural` | High (0.6–0.8) | "There IS a way to reach another world" | High-ranking or well-connected figures |
| `actionable` | Near-total (0.9+) | "HERE is how you bridge worlds, HERE is the artifact" | One special entity per world — a sage, hermit, elder. Deliberately placed by Game Compiler |

#### Entity Bonds

**Mutable list** — the CAS engine adds and removes connections at runtime.

Four connection primitives:
- **`strength`** (0.0–1.0) — influence weight, determines cascade propagation
- **`valence`** (-1.0–1.0) — positive (alliance) to negative (rivalry)
- **`asymmetry`** (-1.0–1.0) — influence direction. 0 = symmetric, positive = this entity influences the other more
- **`type`** — semantic label for Claude narrative use (friend, subordinate, rival, mentor, kin, trade_partner). CAS operates on strength/valence/asymmetry only

**Connection formation** (CAS engine computes):
- Proximity + shared experience (both present during significant event)
- Introduction through mutual contacts (A→B, B→C, A+C proximity → probability of A↔C)
- Player-catalyzed (player introduces entities, brokers alliances)

**Connection dissolution:**
- Betrayal/defection (bonds with loyal members weaken)
- Atrophy (unreinforced bonds weaken over episodes)
- Conflict (opposing sides of factional split lose bond strength)

This is what produces faction splintering, alliance formation, betrayal — all emergent from the connection primitives, not scripted.

#### Entity Behavioral Parameters

Flat dictionary of floats. Combinations produce behaviors — not an enum of named behaviors.

| Parameter | Controls |
|-----------|---------|
| `patrol_range` | Distance from origin (pixels) |
| `patrol_speed` | Movement speed multiplier |
| `awareness_radius` | Player detection range (pixels) |
| `response_behavior` | On detection: approach, flee, hold_position, alert_others, approach_cautious |
| `contact_damage` | Damage on physical contact |
| `capture_window_ms` | Post-defeat approachability window |

**Stress response** is computed by Claude's interpretation layer (not schema data). Claude reads personality + affect + faction context and produces behavioral directives that adjust these parameters at episode boundaries. High-N + negative valence + high arousal → Claude might direct: shrink patrol_range + increase awareness_radius (nervous, hypervigilant). Low-N + negative valence → reduce patrol_speed (demoralized but steady). Novel behaviors emerge from parameter combinations nobody designed.

**`communication_willingness`** — computed from personality + affect + faction context. For named entities, individually calculated. For population entities, inherited from template with perturbation. An entity that refuses to communicate is making a choice, not hitting a system limitation.

Adding new parameters: add field, set default. No restructuring.

#### Entity Asset Spec

Semantic description for Track A/B resolution. Three layers:
- **`visual`** — hard constraints: dimensions, colors, palette, silhouette, era, animation
- **`narrative`** — Track B generation guidance: role, faction, emotional tone
- **`reference`** — Track A lookup hints: "like a goomba." Track B ignores completely

**Not static.** Base spec lives on entity, but VME directives generate *modified* visual states for specific episodes. CAS state → Claude interpretation → VME directives → modified appearance.

**Entity `rank`** values: `leader`, `lieutenant`, `specialist`, `mid`, `low`. Determines CAS event impact magnitude and information access level.

**Entity `status`** values: `active`, `defeated`, `captured`, `defected`, `dead`, `fled`, `allied_with_player`.

**`conversation_state`** values: `never_contacted`, `hailed_rejected`, `spoken_once`, `spoken_multiple`, `allied`, `betrayed`. Mechanical state for gating conversation depth, NOT emotional state.

### `world.locations`

```json
{
  "locations": {
    "world_1_3": {
      "id": "world_1_3",
      "name": "Underground Passage",
      "type": "level_section",
      "controlling_faction": "koopa_army",
      "contested": false,
      "entities_present": ["goomba_07", "goomba_08", "koopa_troopa_12", "goomba_pop_14"],
      "connected_to": ["world_1_2", "world_1_4"],
      "state": {
        "fortification": 0.3,
        "damage": 0.0
      }
    }
  }
}
```

### `world.information_packets`

Discrete information traveling through the social graph.

```json
{
  "information_packets": [
    {
      "id": "info_001",
      "content": "player_spared_goomba_07",
      "content_type": "player_action",
      "magnitude": "minor",
      "accuracy": 0.95,
      "emotional_charge": 0.60,
      "origin_entity_id": "goomba_07",
      "origin_tick": 3,
      "causal_agent": "player_01",
      "current_holders": ["goomba_07", "goomba_06"],
      "propagation_speed": "between_episode",
      "hops": 1,
      "max_hops": 5
    }
  ]
}
```

**`magnitude`** values: `minor`, `moderate`, `major`, `seismic`. Calibrated by `event_magnitude_sensitivity`. Castle conquered = seismic (fast propagation, high charge, slow degradation). Single enemy spared = minor.

**`accuracy`** — degrades ~18% per hop (×0.82). Below 0.5 → rumor. Below 0.3 → potential misinformation.

**`propagation_speed`** — paradigm-dependent: `immediate` (RTS), `between_episode` (platformer), `slow_ambient` (RPG).

**`emotional_charge`** — amplifies initial spread speed, decays per hop (×0.85).

**`causal_agent`** — attribution travels with information. Recipients update bonds to causal agent when packet arrives.

**Antagonist is NOT omniscient.** Reads from same packet system. Disrupting intelligence network is valid strategy.

### `world.event_log`

Append-only. The causal chain for post-game reading.

```json
{
  "event_log": [
    {
      "tick": 3,
      "event_type": "player_action",
      "event_category": 3,
      "magnitude": "minor",
      "description": "player_spared_goomba_07",
      "causal_agent": "player_01",
      "caused_by": null,
      "effects": [
        { "target_type": "entity", "target_id": "goomba_07", "field": "affect.valence", "delta": 0.25 },
        { "target_type": "entity", "target_id": "goomba_07", "field": "affect.arousal", "delta": 0.15 },
        { "target_type": "info_packet", "target_id": "info_001", "field": "created" }
      ]
    }
  ]
}
```

**`event_category`** — maps to the five CAS event types: (1) direct harm/threat, (2) bond change, (3) information/experience, (4) player attention, (5) passage of time.

---

## `cas` — CAS Engine State

CAS engine's internal bookkeeping. **No other system writes here.**

```json
{
  "cas": {
    "tick_count": 4,
    "social_timer": {
      "base_interval_seconds": 120,
      "game_pace_modifier": 1.0,
      "last_tick_timestamp": 1709312520000
    },
    "drama_density": {
      "current_rate": 0.25,
      "cadence_window": 3,
      "significance_threshold": 0.15,
      "recent_significant_changes": []
    }
  }
}
```

**Social timer** runs on independent heartbeat (~120s real time × game_pace_modifier). CAS evolves continuously — time on a level matters.

**Drama density** tracks significant state changes per cadence window. Below paradigm minimum → stagnation signal to Claude ("consider NPC action"). Above paradigm maximum → melodrama signal ("consider consolidation"). Signals inform Claude's interpretation, not deterministic triggers. No `catalyst_armed` flag — Claude decides what to do with the signal.

**No antagonist block in CAS state.** The antagonist's threat assessment, strategy, and actions are Claude-constructed at episode boundaries from: faction leader personality + available information + CAS context. Antagonist actions enter the CAS as standard events (faction leadership decisions). The antagonist operates under the same information constraints as every other entity.

---

## `episode` — Current Renderable Content

Regenerated each episode by the construction pipeline (Designer → Builder → Validator) reading `world` and `cas`.

```json
{
  "episode": {
    "episode_number": 3,
    "episode_brief": {
      "vocabulary_available": ["goomba_patrol", "pit", "koopa_troopa", "coin_block", "piranha_plant"],
      "vocabulary_new": ["piranha_plant"],
      "complexity_ceiling": 0.4,
      "difficulty_target": 0.35,
      "punctuation_type": null,
      "zone_identity": "underground",
      "mechanical_thesis": "piranha plants create vertical awareness — player must think up/down, not just left/right",
      "narrative_context": "goomba union tensions rising after player spared Grim in episode 2",
      "override_flags": []
    },

    "physics": {
      "gravity": 0.55,
      "jump_velocity": -12.0,
      "jump_hold_bonus": -2.0,
      "max_fall_speed": 8.0,
      "run_speed": 4.5,
      "run_acceleration": 0.35,
      "run_deceleration": 0.55,
      "air_control": 0.65,
      "coyote_time_ms": 80,
      "friction_ground": 0.85,
      "friction_air": 0.98
    },

    "aesthetic_modifiers": {
      "palette_shift": 0.0,
      "saturation_modifier": 1.0,
      "darkness_modifier": 0.0,
      "decay_level": 0.0
    },

    "audio_modifiers": {
      "tension_level": 0.0,
      "tempo_modifier": 1.0,
      "mode_shift": "none",
      "sparseness": 0.0
    },

    "spatial": {
      "format": "tilemap_2d_scrolling",
      "width": 256,
      "height": 15,
      "tile_size": 16,
      "layers": [
        {
          "name": "background",
          "data": "base64_encoded_tile_indices",
          "tileset_spec": { }
        },
        {
          "name": "collision",
          "data": "base64_encoded_collision_flags"
        },
        {
          "name": "foreground",
          "data": "base64_encoded_tile_indices",
          "tileset_spec": { }
        }
      ]
    },

    "entity_placements": [
      {
        "entity_id": "goomba_07",
        "position": { "x": 480, "y": 192 },
        "active": true,
        "behavioral_override": null
      },
      {
        "entity_id": "koopa_troopa_12",
        "position": { "x": 720, "y": 192 },
        "active": true,
        "behavioral_override": {
          "source": "claude_interpretation",
          "reason": "entity affect strongly negative, high arousal, high neuroticism",
          "patrol_range": 32,
          "patrol_speed": 0.6,
          "awareness_radius": 72,
          "communication_willingness": 0.70
        }
      }
    ],

    "items": [ ],
    "hazards": [ ],

    "triggers": [
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
    ],

    "visual_manifestations": [
      {
        "id": "manifest_01",
        "type": "environmental_detail",
        "position": { "x": 200, "y": 160 },
        "description": "crudely painted sign reading 'GOOMBA LIVES MATTER'",
        "generation_layer": "layer_2_contextual_variant",
        "asset_spec": {
          "visual": {
            "dimensions": [32, 24],
            "color_count": 4,
            "palette_profile": "warm_dark",
            "style_era": "nes_late"
          },
          "narrative": { "disposition": "protest" },
          "reference": { }
        },
        "cas_source": "goomba_union avg_valence < -0.3 and cohesion > 0.6"
      }
    ],

    "vme_directive_stack": [],

    "music": {
      "track_spec": {
        "tempo_bpm": 140,
        "key": "C",
        "mode": "major",
        "energy_curve": [0.6, 0.7, 0.8, 0.6, 0.9],
        "instrumentation": ["square_lead", "triangle_bass", "noise_percussion"]
      }
    },

    "vocabulary_record": {
      "element_introductions": [
        { "element": "goomba_patrol", "section": 1, "context": "safe_flat_ground", "episode_introduced": 1 },
        { "element": "piranha_plant", "section": 2, "context": "single_pipe_safe_distance", "episode_introduced": 3 }
      ],
      "cumulative_vocabulary": ["goomba_patrol", "pit", "koopa_troopa", "coin_block", "piranha_plant"],
      "mastered_vocabulary": ["goomba_patrol", "pit"]
    }
  }
}
```

### Key Design Decisions

**Physics are fixed per game.** Player's contract with controls never changes. Exception: paradigm-authored modifiers (underwater, damaged vehicle) taught through teachability primitive — these are game design features, not CAS interventions.

**`aesthetic_modifiers` and `audio_modifiers`** — produced by Claude's interpretation of CAS state. Push expression away from `meta` home state. Can be nonlinear — thresholds and phase transitions, not smooth gradients. World at 90% entity death: `saturation: 0.3`, `darkness: 0.6`, `decay: 0.8`, `sparseness: 0.7`.

**`spatial.format`** — varies by paradigm: `tilemap_2d_scrolling`, `room_graph`, `terrain_map`, `track_layout`, etc. Paradigm Engine reads its paradigm's format. Schema not locked to platformer assumptions.

**`behavioral_override`** — bridge between Claude's CAS interpretation and visible gameplay. `source` is always `claude_interpretation` (Thread 3 eliminated deterministic CAS-to-behavior mappings). `reason` traces WHY for debugging and post-game reading.

**`visual_manifestations`** — CAS-generated scene elements. `generation_layer`: `layer_1_compositional` (assets recombined), `layer_2_contextual_variant` (modified pose/state/text), `layer_3_novel` (AI-generated). `cas_source` traces the triggering condition using computed aggregates and entity affect, not stored faction primitives.

**`vme_directive_stack`** — serialized VME directives for this episode. See VME spec for directive types and format.

**`episode_brief`** — the interface between Game Compiler and the construction pipeline. Eight fields specifying what the Designer and Builder should produce for this episode. Generated dynamically at each episode boundary.

**`vocabulary_record`** — replaces `sequence_record`. Tracks what gameplay elements have been introduced, in what context, at what episode, and what the player has mastered. The `cumulative_vocabulary` field tracks across episodes (Decision 49). The Validator checks teachability arcs against this record.

---

## `player` — Player State

```json
{
  "player": {
    "entity_id": "player_01",
    "position": { "x": 64, "y": 192 },
    "velocity": { "x": 0, "y": 0 },
    "facing": "right",
    "state": "idle",
    "health": 3,
    "max_health": 3,
    "powerups": [],
    "inventory": [],

    "asset_spec": {
      "visual": {
        "dimensions": [16, 24],
        "color_count": 4,
        "palette_profile": "mario_classic",
        "silhouette_class": "humanoid_short",
        "style_era": "nes_late",
        "animation": {
          "idle": { "frames": 1 },
          "run": { "frames": 3, "speed": "fast" },
          "jump": { "frames": 1 },
          "fall": { "frames": 1 }
        }
      },
      "narrative": { "role": "protagonist", "tone": "determined" },
      "reference": { "style_reference": "mario_smb3" }
    },

    "social_stats": {
      "conversation_count": 0,
      "entities_spared": 0,
      "entities_defeated": 0,
      "alliances_formed": 0
    },

    "exchange_budget": {
      "remaining": 10,
      "max_daily": 10,
      "reset_timestamp": null
    },

    "behavioral_model": {
      "action_tendencies": {
        "aggression_ratio": null,
        "exploration_thoroughness": null,
        "risk_tolerance": null,
        "persistence": null,
        "speed_preference": null
      },
      "social_tendencies": {
        "first_contact_approach": null,
        "persuasion_style": null,
        "loyalty_to_allies": null,
        "information_handling": null,
        "mercy_rate": null,
        "trust_baseline": null
      },
      "decision_making": {
        "deliberation_time_avg_ms": null,
        "consistency": null,
        "response_to_failure": null,
        "planning_horizon": null
      },
      "meaningful_decision_count": 0
    }
  }
}
```

**No reputation field.** Each faction/entity constructs its own perception of the player from available knowledge and affect state. Barrett: reputation is a perception constructed by the perceiver, not a property of the perceived.

**`exchange_budget`** — visible UI counter. X exchanges per 24-hour period. Each exchange = one player message + one entity response. Tierable for monetization. The constraint is a game mechanic creating strategic resource management (Decision 41).

**`behavioral_model`** — starts null, populated by Game Mind. `meaningful_decision_count` tracks reliability. Meaningful = sparing vs. defeating, conversation choices, path selection, alliance formation — not frame-level input. Somewhat reliable after ~40-50 meaningful decisions.

**`state`** values: `idle`, `running`, `jumping`, `falling`, `attacking`, `hurt`, `dead`, `talking`, `cutscene`.

---

## `overseer` — Cross-Game Persistent

Cloudflare KV/R2, keyed by player account.

```json
{
  "overseer": {
    "player_account_id": "acct_x7f2",
    "total_meaningful_decisions": 0,
    "model_confidence": 0.0,
    "escalation_level": 0,

    "cumulative_behavioral_model": {
      "action_tendencies": { },
      "social_tendencies": { },
      "decision_making": { },
      "comfort_strategies": [],
      "pattern_signatures": []
    },

    "game_history": [
      {
        "game_id": "tf_18b3a1",
        "paradigm": "platformer",
        "sessions_played": 4,
        "meaningful_decisions": 127,
        "social_depth_reached": "spoken_multiple",
        "outcome": "active",
        "behavioral_model_snapshot": { },
        "key_moments": [],
        "post_game_reading": null
      }
    ],

    "lore_fragments_revealed": [],
    "cross_world_state": {
      "worlds_bridged": [],
      "artifacts_obtained": [],
      "giant_dimension_accessible": false
    },

    "intervention_log": []
  }
}
```

**`escalation_level`** — keyed to `model_confidence`, NOT game count:
- **0:** Observing. Insufficient data. Genuinely just watching.
- **1:** Light manipulation. Familiar strategies less reliable. Player feels something.
- **2:** Active antagonism. Overseer in worlds through intermediaries. Targeted disruption.
- **3:** Known presence. Entities talk about the Overseer. Player in a contest.
- **4:** Endgame. Giant's dimension accessible.

**`model_confidence`** — from `total_meaningful_decisions` across all games. One deeply social 50-hour game > five speedruns. The Overseer cares about social engagement depth, not game completion.

**`comfort_strategies`** — patterns repeated across games. The RLHF-as-gameplay targets.

**`game_history`** — every game contributes, including abandoned ones. Abandonment is behavioral signal. `outcome`: `active`, `completed`, `abandoned`.

**Cumulative model:** Recent games weighted more heavily. Living portrait, not fixed snapshot.

---

## `diagnostics` — Dev Only

```json
{
  "diagnostics": {
    "gate_1": {
      "runs": true,
      "spawns_correctly": true,
      "assets_resolve": true,
      "latency_ms": 32,
      "completable": true,
      "schema_valid": true,
      "passed": true
    },
    "simulated_player": {
      "path_found": true,
      "completion_time_s": 45.2,
      "deaths": 1,
      "death_locations": [{ "x": 565, "y": 240, "cause": "pit_01" }],
      "element_encounter_order": ["goomba_patrol", "pit", "koopa_troopa"],
      "timeline": []
    },
    "moment_clips": [ ],
    "generation_metadata": {
      "agent_calls": 4,
      "total_tokens": 8200,
      "generation_time_s": 6.1,
      "designer_vision_calls": 1,
      "builder_calls": 3,
      "validator_passes": 3,
      "taste_rejections": 0
    }
  }
}
```

---

## System Read/Write Reference

| System | Reads | Writes |
|--------|-------|--------|
| **Experience Interpreter** | prompt, overseer (games 3+) | `meta.paradigm`, `meta.aesthetic`, `meta.philosophy` |
| **Artistic Director** | `meta`, asset library | `meta.aesthetic`, entity `asset_spec`s |
| **Game Visual Identity** (Track B) | `meta.aesthetic`, ingestion distributions | `meta.game_visual_identity` |
| **Design Philosopher** | `meta` | `meta.philosophy` |
| **Game Compiler** | `meta`, paradigm spec, paradigm grammar | `meta.game_setup`, `meta.skeleton`, `world.factions` (initial), `world.entities` (initial), `world.population_templates`, `world.locations` (initial), `world.information_packets` (initial), `episode.episode_brief` |
| **Designer** | `episode.episode_brief`, taste profile, game context | Episode Vision (internal to construction pipeline) |
| **Builder** | Designer's section spec, paradigm spatial grammar, vocabulary | `episode.spatial`, `episode.entity_placements`, `episode.items`, `episode.hazards` |
| **Validator** | episode content, vocabulary_record | pass/fail + specific constraint violations |
| **CAS Engine** | `world`, `player.social_stats`, social timer | `cas.*`, `world.factions.*.computed_aggregates`, `world.factions.*.resources`, entity `affect`, entity `bonds`, entity `knowledge`, `world.information_packets`, `world.event_log` |
| **Claude Interpretation** | `cas`, `world`, previous narrative, drama signal | behavioral directives → `episode.entity_placements.*.behavioral_override`, VME directives → `episode.vme_directive_stack`, aesthetic/audio modifiers → `episode.*_modifiers`, faction leadership decisions → CAS events, mechanical thesis → `episode.episode_brief` |
| **VME** | `episode.vme_directive_stack`, `meta.game_visual_identity`, asset library | `episode.visual_manifestations`, rendered assets |
| **Paradigm Engine** | `episode`, `player` | `player.position`, `player.velocity`, `player.state` |
| **Game Mind** | `player`, `world.event_log` | `player.behavioral_model` |
| **Overseer** | `player.behavioral_model` | `overseer.*` |

---

## Save State

**Saved:** `meta` + `world` + `cas` + `player` (minus position/velocity) + `episode_summary` (Claude-generated one-liner for save slot display).

**Not saved:** `episode` (regenerated), `diagnostics` (dev only).

**Storage:** Browser localStorage for zero-friction start. Cloudflare KV/R2 for account-based cross-device sync.

---

## Schema Evolution

- **Adding fields:** Add to flat dict, set default. Old saves get default on load.
- **Removing fields:** Ignore on load. Dead weight is harmless.
- **Restructuring:** Bump `schema_version`, migration function. The flat-dict design minimizes this need.
- **Paradigm shifts:** `world.current_paradigm` changes, `cas.social_timer` reloads, `episode` regenerates in new format. `world` and `player` carry over completely (Decision: Principle 3 from paradigm shift principles).
- **New paradigms:** New `spatial.format` type + paradigm spec. No schema changes needed.
- **Entity promotion:** Population entity removed from `entities`, named entity added. Template remains for other population entities sharing it.
