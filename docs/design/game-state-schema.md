# Two Fires — Game State JSON Schema
## The Contract Between Every System

---

## What This Document Is

This is the single source of truth for the data structures that flow between all Two Fires systems. Every agent, every engine component, every diagnostic tool reads from or writes to these structures. If it's not in this document, it doesn't exist in the game state.

**Who reads this:** Claude Code (for implementation), every agent prompt (for knowing what they produce and consume), the diagnostic framework (for knowing what to validate).

**Design principles:**
- **Flat where possible, nested only where ownership is clear.** Flat dictionaries of typed values make it trivial to add new fields later without restructuring. Missing fields fall back to defaults, so old saves remain compatible.
- **Every field has a single writer.** One system produces it, others read. If two systems need to modify the same data, that's a design problem — resolve it by splitting the field or routing through one system.
- **CAS state is sacred.** Nothing except the CAS engine modifies faction state, entity minds, or the social graph at runtime.
- **Asset references are always semantic specs, never filenames.** Track A/B resolution happens downstream.
- **All float values are 0.0–1.0 unless explicitly noted.** Disposition values range -1.0 to 1.0.
- **Identity is stable, expression is dynamic.** The game knows what it IS (immutable meta), but how it looks/sounds/feels responds to CAS state (dynamic modifiers in episodes).
- **Forward-compatible by default.** Flat dicts, typed items in lists, version field. Adding a new primitive or knowledge type is a new field or tag, never a restructure.

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
| `world` | Game Compiler (initial), CAS Engine (runtime) | Paradigm Engine, Visual Manifestation, Entity Minds, Claude narrative | Per-game, evolves at episode boundaries |
| `cas` | CAS Engine exclusively | Dramaturgical monitor, Visual Manifestation, content agents | Per-game, ticks per paradigm spec |
| `episode` | Content agents (per episode) | Paradigm Engine (renderer + physics) | Per-episode, regenerated each episode |
| `player` | Paradigm Engine (position/actions), Game Mind (behavioral model) | CAS Engine (as input to disposition updates), Overseer, Diagnostics | Per-game + cross-game (behavioral model) |
| `overseer` | Overseer system | Experience Interpreter (for later games), Dramaturgical Agent | Cross-game persistent (Cloudflare KV/R2) |
| `diagnostics` | Simulated Player, Moment Extractor, Gate checks | Testing UI, Pattern Distiller | Per-generation, dev only, never shipped |

---

## Concern 1: `meta` — Game Identity

Created by the pre-game agent pipeline. Immutable after game creation (with one exception: paradigm shifts update `current_paradigm` in the world state, not here — meta records the *original* identity).

### Structure

```json
{
  "meta": {
    "schema_version": "0.1.0",
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

    "dramaturgical_setup": {
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
      "catalysts": [
        {
          "id": "catalyst_1",
          "type": "defection_event",
          "trigger_condition": "drama_density_below_threshold_for_3_episodes",
          "description": "high-ranking koopa troopa defects publicly"
        }
      ],
      "drama_density_threshold": 0.3
    }
  }
}
```

### Key Fields

**`paradigm.id`** — one of: `platformer`, `shmup`, `top_down_action`, `rpg_combat`, `fps`, `adventure`, `fighting`, `racing_mode7`, `racing_overhead`, `rts`, `management_sim`, `isometric`, `fixed_screen`.

**`aesthetic` and `audio_profile`** — the *home state*. The game's visual and audio identity at equilibrium. Episode generation applies CAS-driven mood modifiers that push expression away from home during crisis and back toward it during stability. Modifiers live in the episode block, not here.

**`philosophy`** — genuinely immutable. The soul of the game. Informs how Claude interprets CAS events, how the Dramaturgical Agent calibrates ingredients, what kind of post-game reading the Game Mind produces.

**`dramaturgical_setup.intended_length`** — short / medium / long / epic. Calibrates `event_magnitude_sensitivity`. Shorter games need higher sensitivity so the CAS ramps meaningfully in the available window. Longer games can afford lower sensitivity for gradual unfolding.

**`dramaturgical_setup.pressure_ramp: "player_driven"`** — difficulty escalation is keyed to the player's own impact on the world, not a fixed curve. The player IS the catalyst (see Player as Catalyst below).

### Player as Catalyst Principle

The player is an extraordinary force. Conquering a world, destroying a castle, defeating hundreds of soldiers — these are seismic events. The CAS is calibrated to treat the player as the most disruptive force in the ecology. `event_magnitude_sensitivity` tunes how strongly the CAS reacts.

This creates the natural dual ramp: non-social challenge increases because the antagonist rationally responds to a genuine threat, and social opportunity expands because entities have heard of this extraordinary being and want to ally, defect, or negotiate. The better you are at the mechanical game, the faster the social game becomes essential.

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
    "locations": { },
    "information_packets": [ ],
    "event_log": [ ]
  }
}
```

`current_paradigm` — usually matches `meta.paradigm.id`, but updates during paradigm shifts (Layer 7).

### `world.factions`

Keyed by faction ID. Initial values from Game Compiler, runtime updates by CAS Engine exclusively.

```json
{
  "factions": {
    "koopa_army": {
      "id": "koopa_army",
      "name": "Koopa Army",
      "role": "antagonist_primary",

      "state": {
        "cohesion": 0.65,
        "morale": 0.55,
        "loyalty": 0.70,
        "awareness_of_player": 0.20,
        "disposition_to_player": -0.60,
        "internal_dissent": 0.35,
        "resources": 0.75
      },

      "personality_center": {
        "openness": 0.25,
        "conscientiousness": 0.75,
        "extraversion": 0.50,
        "agreeableness": 0.20,
        "neuroticism": 0.40
      },

      "leader_entity_id": "bowser_01",
      "territory": ["world_1", "world_2", "fortress_1"],

      "relationships": {
        "goomba_union": {
          "disposition": -0.30,
          "bond_strength": 0.20,
          "type": "subordinate_resentful"
        }
      }
    }
  }
}
```

**Seven faction state primitives** (grounded in CAS social system theory — Kauffman, Holland, Axelrod, Santa Fe Institute):

| Primitive | Range | Why Primitive | Thresholds |
|-----------|-------|---------------|------------|
| `cohesion` | 0.0–1.0 | Internal unity. Emergent from bond density but tracked as aggregate for CAS efficiency. | < 0.3 → splinter risk |
| `morale` | 0.0–1.0 | Collective will. Emergent from resources + recent outcomes + leadership quality. | < 0.2 → surrender/collapse |
| `loyalty` | 0.0–1.0 | Allegiance to current power structure. | < 0.3 → defection cascade |
| `awareness_of_player` | 0.0–1.0 | How much the faction knows about the player. Spikes with major events. | — |
| `disposition_to_player` | -1.0–1.0 | The faction's *perception* of the player, constructed from available information. Not carried by the player. | — |
| `internal_dissent` | 0.0–1.0 | Disagreement within. Distinct from low cohesion — unified disagreement with leadership. | > 0.7 → splinter risk |
| `resources` | 0.0–1.0 | Material capacity to act. Hard constraint — without resources, strategies can't execute. | < 0.2 → desperation |

**Why fear is NOT included:** Fear is a composite emerging from threat perception + power asymmetry + negative disposition. If the CAS doesn't produce fear-like behaviors from these primitives during testing, we add it then. Start without, test empirically. Barrett: fear is a constructed category, not a primitive.

**Why `information_about_regime` is NOT included:** It's knowledge-layer data distributed across entity knowledge blocks, not a faction state number.

**`personality_center`** — OCEAN factors for the faction. Individual entities are offsets from this. Koopa Army: low-O (rigid), high-C (disciplined), low-A (uncompromising). Goomba Workers: high-A (cooperative), high-N (anxious), high-O (open to change).

### `world.entities`

Keyed by entity ID. Every being with a mind.

```json
{
  "entities": {
    "goomba_07": {
      "id": "goomba_07",
      "name": "Goomba #7",
      "display_name": "Grim",
      "faction_id": "goomba_union",
      "role": "foot_soldier",
      "rank": "low",
      "status": "active",
      "location_id": "world_1_3",

      "mind": {
        "personality": {
          "openness": 0.20,
          "conscientiousness": -0.10,
          "extraversion": -0.05,
          "agreeableness": 0.15,
          "neuroticism": 0.10
        },
        "disposition_to_player": 0.00,
        "motivations": ["survive", "protect_family", "end_forced_labor"],
        "emotional_state": "anxious",
        "conversation_state": "never_contacted"
      },

      "knowledge": [
        {
          "id": "k_001",
          "type": "spatial",
          "content": "layout of world_1_1 through world_1_3",
          "accuracy": 1.0,
          "source": "direct_observation",
          "acquired_tick": 0
        },
        {
          "id": "k_002",
          "type": "social",
          "content": "goomba_foreman_01 is frustrated with koopa_army leadership",
          "accuracy": 0.75,
          "source": "goomba_06",
          "acquired_tick": 2
        },
        {
          "id": "k_003",
          "type": "special",
          "content": "ancient legends speak of two lights stolen from the sky",
          "accuracy": 0.40,
          "source": "faction_folklore",
          "acquired_tick": 0,
          "resolution_level": "ambient",
          "propagation_resistance": 0.1
        }
      ],

      "social_graph": [
        { "entity_id": "goomba_06", "strength": 0.70, "valence": 0.80, "asymmetry": 0.0, "type": "friend" },
        { "entity_id": "goomba_08", "strength": 0.40, "valence": 0.50, "asymmetry": 0.0, "type": "acquaintance" },
        { "entity_id": "goomba_foreman_01", "strength": 0.55, "valence": 0.60, "asymmetry": 0.3, "type": "mentor" }
      ],

      "behavioral": {
        "patrol_range": 64,
        "patrol_speed": 1.0,
        "awareness_radius": 48,
        "response_behavior": "approach_cautious",
        "contact_damage": 1,
        "capture_window_ms": 2000,
        "communication_willingness": 0.50
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

#### Entity Mind

**`personality`** — OCEAN offsets from faction `personality_center`. Entity's absolute personality = faction center + offset. Five factors, typically -0.3 to +0.3.

| Factor | In-Game Behavioral Driver |
|--------|--------------------------|
| **Openness** | Curiosity, willingness to consider new ideas (like allying with player), receptivity to information |
| **Conscientiousness** | Reliability, patrol discipline, follow-through. High-C = better soldiers AND better allies once turned |
| **Extraversion** | Social reach, information propagation speed, visibility. High-E = faster influence, more connections |
| **Agreeableness** | Disposition flexibility, persuasion susceptibility. High-A = easier to sway in both directions |
| **Neuroticism** | Emotional volatility, stress response magnitude. High-N = stronger reactions to events, more drama, less stability |

**Why deception, courage, empathy are NOT explicit traits:** They emerge from OCEAN + situation. Low-A + low-C + negative disposition + valuable info = likely to deceive. Low-N + threat = courage. High-A + high-O + exposure to suffering = empathy. Let them emerge from primitives.

**`disposition_to_player`** — this entity's personal perception, constructed from whatever information reached them. NOT a property the player carries. Barrett: reputation is a perception constructed by the perceiver.

**`conversation_state`** values: `never_contacted`, `hailed_rejected`, `spoken_once`, `spoken_multiple`, `allied`, `betrayed`.

#### Entity Knowledge

Flat list of tagged items. **This is the architectural enforcement of bounded knowledge.** Claude dialogue generation receives ONLY items in this list. The entity cannot reference information it doesn't possess.

All knowledge enters through information propagation — direct observation (highest accuracy), told by connected entity (degrades per hop), or faction channels (lowest accuracy, most delayed).

**Knowledge item types:** `spatial`, `social`, `factual`, `special`, `player_related`.

**Special knowledge resolution layers:**

| Level | Propagation Resistance | Examples | Who Typically Has It |
|-------|----------------------|---------|---------------------|
| `ambient` | Low (0.1–0.3) | "Legends speak of two lights stolen from the sky" | Many entities, vague and degraded |
| `structural` | High (0.6–0.8) | "There IS a way to reach another world" | High-ranking or well-connected figures |
| `actionable` | Near-total (0.9+) | "HERE is how you bridge worlds, HERE is the artifact" | One special entity per world — a sage, hermit, elder. Set apart from faction structure. Deliberately placed by Dramaturgical Agent |

The seed entity for actionable knowledge is not random — it's a key character somehow set apart (a version of Toad who's a sage, an oracle, a figure outside the faction structure). The Dramaturgical Agent authors their placement as part of game setup.

#### Entity Social Graph

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
| `communication_willingness` | 0.0–1.0, from personality + disposition |

**Stress response** is a modifier function in CAS engine code (not schema data) that reads personality + faction state and adjusts these parameters at episode generation. High-N + low morale → shrink patrol_range + increase awareness_radius (nervous, hypervigilant). Low-N + low morale → reduce patrol_speed (demoralized but steady). Novel behaviors emerge from parameter combinations nobody designed.

Adding new parameters: add field, set default. No restructuring.

#### Entity Asset Spec

Semantic description for Track A/B resolution. Three layers:
- **`visual`** — hard constraints: dimensions, colors, palette, silhouette, era, animation
- **`narrative`** — Track B generation guidance: role, faction, emotional tone
- **`reference`** — Track A lookup hints: "like a goomba." Track B ignores completely

**Not static.** Base spec lives on entity, but visual manifestation events generate *modified* specs for specific episodes. CAS state → visual changes (resources < 0.2 + leader + formal aesthetic → degraded appearance).

Handles novel characters: Uncle Baby Billy = heavyset + white pompadour + suit/robe + cross + arrogant posture. At 32x32 pixels, 4-5 distinguishing features is enough. Player imagination fills the rest. This is why retro resolution makes the system tractable.

**Entity `rank`** values: `leader`, `lieutenant`, `specialist`, `mid`, `low`. Determines CAS cascade impact magnitude.

**Entity `status`** values: `active`, `defeated`, `captured`, `defected`, `dead`, `fled`, `allied_with_player`.

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
      "entities_present": ["goomba_07", "goomba_08", "koopa_troopa_12"],
      "connected_to": ["world_1_2", "world_1_4"],
      "state": {
        "fortification": 0.3,
        "damage": 0.0,
        "propaganda_present": true,
        "morale_atmosphere": "tense"
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
      "current_holders": ["goomba_07", "goomba_06"],
      "propagation_speed": "between_episode",
      "hops": 1,
      "max_hops": 5
    }
  ]
}
```

**`magnitude`** values: `minor`, `moderate`, `major`, `seismic`. Calibrated by `event_magnitude_sensitivity`. Castle conquered = seismic (fast propagation, high charge, slow degradation). Single enemy spared = minor.

**`accuracy`** — degrades ~15% per hop. Below 0.5 → rumor. Below 0.3 → potential misinformation.

**`propagation_speed`** — paradigm-dependent: `immediate` (RTS), `between_episode` (platformer), `slow_ambient` (RPG).

**`emotional_charge`** — amplifies initial spread speed, decays with repetition.

**Antagonist is NOT omniscient.** Reads from same packet system. Disrupting intelligence network is valid strategy.

### `world.event_log`

Append-only. The causal chain for post-game reading.

```json
{
  "event_log": [
    {
      "tick": 3,
      "event_type": "player_action",
      "magnitude": "minor",
      "description": "player_spared_goomba_07",
      "caused_by": null,
      "effects": [
        { "target_type": "entity", "target_id": "goomba_07", "field": "disposition_to_player", "delta": 0.30 },
        { "target_type": "info_packet", "target_id": "info_001", "field": "created" }
      ]
    }
  ]
}
```

---

## `cas` — CAS Engine State

CAS engine's internal bookkeeping. **No other system writes here.**

```json
{
  "cas": {
    "tick_count": 4,
    "tick_spec": {
      "type": "episode_boundary",
      "full_eval_on": "episode_end",
      "light_tick_on": "social_encounter",
      "tick_weight_full": 1.0,
      "tick_weight_light": 0.3
    },
    "drama_density": {
      "current_rate": 0.25,
      "threshold": 0.30,
      "below_threshold_count": 1,
      "catalyst_armed": false
    },
    "phase_transitions_pending": [],
    "cascade_in_progress": false,
    "antagonist": {
      "last_action": null,
      "action_cooldown": 0,
      "threat_assessment_of_player": 0.15,
      "strategy_posture": "ignore"
    }
  }
}
```

**`antagonist.threat_assessment_of_player`** — aggregate factoring rate of progress, not just current state. Three worlds in three sessions ≠ three worlds in thirty sessions.

**`antagonist.strategy_posture`** values: `ignore` → `monitor` → `allocate_resources` → `prioritize` → `existential_threat`.

---

## `episode` — Current Renderable Content

Regenerated each episode by content agents reading `world` and `cas`.

```json
{
  "episode": {
    "episode_number": 3,

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
          "source": "cas_behavioral_legibility",
          "reason": "faction morale 0.35, entity neuroticism +0.15",
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
        "cas_source": "goomba_union.internal_dissent > 0.4"
      }
    ],

    "music": {
      "track_spec": {
        "tempo_bpm": 140,
        "key": "C",
        "mode": "major",
        "energy_curve": [0.6, 0.7, 0.8, 0.6, 0.9],
        "instrumentation": ["square_lead", "triangle_bass", "noise_percussion"]
      }
    },

    "sequence_record": {
      "element_introductions": [
        { "element": "goomba_patrol", "position_x": 160, "context": "safe_flat_ground" }
      ],
      "rhythm_map": [
        { "type": "relief", "start_x": 0, "end_x": 200, "duration_est_s": 5 },
        { "type": "tension", "start_x": 200, "end_x": 560, "duration_est_s": 12 }
      ],
      "spatial_grammar": ["gauntlet", "platform_puzzle", "safe_room"],
      "provocateur_moment": {
        "position_x": 820,
        "violation_type": "enemy_in_unexpected_position",
        "description": "koopa on ceiling — shell drops when player passes"
      }
    }
  }
}
```

### Key Design Decisions

**Physics are fixed per game.** Player's contract with controls never changes. Exception: paradigm-authored modifiers (underwater, damaged vehicle) taught through teachability primitive — these are game design features, not CAS interventions.

**`aesthetic_modifiers` and `audio_modifiers`** — computed from CAS state, push expression away from `meta` home state. Can be nonlinear — thresholds and phase transitions, not smooth gradients. The aesthetic system behaves like a CAS responding to the social CAS. World at 90% entity death: `saturation: 0.3`, `darkness: 0.6`, `decay: 0.8`, `sparseness: 0.7`.

**`spatial.format`** — varies by paradigm: `tilemap_2d_scrolling`, `room_graph`, `terrain_map`, `track_layout`, etc. Paradigm Engine reads its paradigm's format. Schema not locked to platformer assumptions.

**`behavioral_override`** — bridge between CAS and visible gameplay. `source` and `reason` trace WHY for debugging and post-game reading.

**`visual_manifestations`** — CAS-generated scene elements. `generation_layer`: `layer_1_compositional` (assets recombined), `layer_2_contextual_variant` (modified pose/state/text), `layer_3_novel` (AI-generated). `cas_source` traces the triggering condition.

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

**No reputation field.** Each faction/entity has its own `disposition_to_player`, constructed from available information. Barrett: reputation is a perception constructed by the perceiver, not a property of the perceived.

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
      "agent_calls": 10,
      "total_tokens": 12400,
      "generation_time_s": 8.3,
      "revision_loops": 1,
      "auditor_result": "pass"
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
| **Design Philosopher** | `meta` | `meta.philosophy` |
| **Dramaturgical Agent (setup)** | `meta`, paradigm spec | `meta.dramaturgical_setup` |
| **Dramaturgical Agent (runtime)** | `cas.drama_density` | catalyst triggers → CAS processes |
| **Grammarian** | `meta`, pattern library | `episode.sequence_record.element_introductions` |
| **Rhythmist** | `meta`, paradigm cadence | `episode.sequence_record.rhythm_map` |
| **Game Compiler** | `meta` | `episode.physics`, `world.factions` (initial), `world.entities` (initial) |
| **Cartographer** | sequence_record, physics, patterns | `episode.spatial`, `episode.entity_placements`, `episode.items`, `episode.hazards` |
| **Provocateur** | completed episode | `episode.sequence_record.provocateur_moment` + one modification |
| **Coherence Auditor** | episode + sequence_record | pass/fail + revision requests |
| **CAS Engine** | `world`, `player.social_stats`, tick spec | `cas.*`, `world.factions.*.state`, `world.entities.*.mind`, `world.entities.*.knowledge`, `world.entities.*.social_graph`, `world.information_packets`, `world.event_log` |
| **Visual Manifestation Engine** | `cas`, `world`, Claude narrative | `episode.visual_manifestations`, `episode.aesthetic_modifiers` |
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
- **Paradigm shifts:** `world.current_paradigm` changes, `cas.tick_spec` reloads, `episode` regenerates in new format. `world` and `player` carry over.
- **New paradigms:** New `spatial.format` type + paradigm spec. No schema changes needed.
