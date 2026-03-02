# Giants Drink — Game State Schema Specification

## What This Document Is

This is the central data contract for Giants Drink. Every system — the Paradigm Engine, the agent stack, the CAS engine, the Giant, the save system — reads from and writes to these structures. If it's not in this schema, it doesn't exist in the game.

The schema has four levels:

1. **Player Profile** — who you are across all worlds (persistent, cross-game)
2. **World State** — everything about a single generated world (per-game, saved)
3. **Session State** — runtime data that exists only while playing (ephemeral)
4. **Meta State** — the Giant, cross-world connections, the overarching game (persistent, cross-game)

---

## Level 1: Player Profile

This is created when someone first plays and persists forever. It's stored in browser localStorage initially, optionally synced to Cloudflare KV if they create an account.

```json
{
  "player_id": "uuid-string",
  "created_at": "2025-07-15T20:30:00Z",
  "account": null,

  "worlds": [
    {
      "world_id": "uuid-string",
      "prompt": "Mario but Bowser has his own political problems",
      "paradigm": "platformer",
      "dominant_inspiration": "Super Mario World",
      "created_at": "2025-07-15T20:31:00Z",
      "last_played": "2025-07-18T21:15:00Z",
      "status": "active",
      "summary": "Short description of current state for the world-select menu",
      "win_condition_met": false
    }
  ],

  "behavioral_profile": {
    "games_played": 3,
    "total_play_time_minutes": 240,
    "action_tendencies": {
      "aggression_ratio": 0.6,
      "exploration_thoroughness": 0.8,
      "risk_tolerance": 0.4,
      "persistence_after_failure": 0.7,
      "speed_preference": 0.5
    },
    "social_tendencies": {
      "first_contact_approach": "cautious",
      "persuasion_style": "logical",
      "loyalty_to_allies": 0.8,
      "information_sharing": 0.3,
      "mercy_tendency": 0.6,
      "trust_tendency": 0.4
    },
    "decision_patterns": {
      "deliberation_speed": "moderate",
      "consistency": 0.7,
      "failure_response": "adaptive",
      "planning_horizon": "medium"
    },
    "meta_awareness": {
      "social_ecology_engaged": true,
      "giant_acknowledged": false,
      "cross_world_attempted": false,
      "giant_dimension_reached": false
    }
  }
}
```

### Plain-Language Explanation

- **player_id**: Unique identifier. Generated on first visit.
- **account**: null until they optionally create one for cross-device sync.
- **worlds**: A list of every world they've generated. Each entry is a lightweight summary — the full world state is stored separately (it's big). `status` can be "active" (in progress), "completed" (win condition met), or "abandoned."
- **behavioral_profile**: The Giant's model of the player. Updated after every session. These values drive how the Giant adapts across games. The numbers are 0-1 scales derived from observed behavior (e.g., aggression_ratio = kills / total encounters). `meta_awareness` tracks the player's progression through the game's meta-layers — has the player engaged socially? Do they know about the Giant? Have they tried cross-world travel?

---

## Level 2: World State

This is the big one. Created when a world is generated, updated every evaluation tick, saved when the player exits. Each world is its own JSON blob stored in browser localStorage or Cloudflare KV.

```json
{
  "world_id": "uuid-string",
  "version": 1,
  "generation_metadata": {
    "player_prompt": "Mario but Bowser has his own political problems",
    "dominant_inspiration": "Super Mario World",
    "paradigm": "platformer",
    "secondary_inspirations": ["Super Mario Bros 3", "Yoshi's Island"],
    "design_conviction": "This game believes political power is fragile and every tyrant depends on people who could choose differently.",
    "estimated_duration": "medium",
    "aesthetic_profile": {
      "palette": "snes_mario",
      "shader_preset": "crt_warm",
      "music_parameters": {
        "valence": 0.7,
        "arousal": 0.6,
        "style_references": ["Koji Kondo", "overworld_theme"]
      }
    }
  },

  "win_condition": {
    "description": "Free Princess Peach and end Bowser's control over the Mushroom Kingdom.",
    "conditions": [
      {
        "id": "princess_freed",
        "description": "Princess Peach is no longer held captive",
        "check": "entity:princess_peach.status != 'captive'"
      },
      {
        "id": "bowser_deposed",
        "description": "Bowser no longer controls the Mushroom Kingdom's governing structure",
        "check": "entity:bowser.status IN ['dead', 'exiled', 'surrendered', 'deposed', 'subordinated'] OR faction:koopa_regime.controls_territory == false"
      }
    ],
    "all_required": true,
    "progress": {
      "princess_freed": false,
      "bowser_deposed": false
    }
  },

  "fiction": {
    "setting": "The Mushroom Kingdom — a once-peaceful federation now under Koopa military occupation.",
    "backstory": "Bowser seized control 3 years ago. His real concern isn't Mario — it's holding together a fractious military coalition while managing a Bob-omb labor crisis and a border dispute with the Koopa Troopa eastern garrisons. Princess Peach is a political hostage, not a personal obsession.",
    "current_situation": "Bowser is dealing with rumors of dissent in his eastern garrisons. The Bob-ombs are threatening a work stoppage. A food shortage in World 3 is creating civilian unrest. Mario — the player — is a minor nuisance at best, having just entered World 1.",
    "tone": "Bright and adventurous on the surface, with genuine political complexity underneath."
  },

  "entities": {
    "bowser": {
      "id": "bowser",
      "name": "Bowser",
      "type": "named",
      "species": "koopa",
      "role": "supreme_commander",
      "faction": "koopa_regime",
      "status": "alive",
      "location": "world_8_castle",

      "mind": {
        "personality": {
          "authoritarianism": 0.9,
          "intelligence": 0.7,
          "paranoia": 0.6,
          "cruelty": 0.5,
          "pragmatism": 0.8
        },
        "motivations": [
          "Maintain control over the Mushroom Kingdom",
          "Resolve the Bob-omb labor crisis before it destabilizes production",
          "Prevent eastern garrison commanders from gaining too much autonomy"
        ],
        "current_concerns": [
          "The Bob-omb situation is more serious than his advisors are telling him",
          "He suspects General Koopa in the east is building an independent power base"
        ],
        "knowledge": {
          "knows": [
            "The broad military situation across all territories",
            "Princess Peach is valuable as a political symbol",
            "The Bob-ombs are unhappy but he doesn't know how close to revolt they are",
            "There's a plumber causing trouble in World 1 (minor concern)"
          ],
          "does_not_know": [
            "The specific plans of dissidents in his ranks",
            "That several Goomba captains are considering defection",
            "The full extent of civilian suffering in World 3"
          ]
        },
        "disposition_to_player": -0.3,
        "conversation_stance": null
      }
    },

    "goomba_captain_7": {
      "id": "goomba_captain_7",
      "name": "Captain Grim",
      "type": "named",
      "species": "goomba",
      "role": "patrol_captain",
      "faction": "koopa_regime",
      "status": "alive",
      "location": "world_2_level_1",

      "mind": {
        "personality": {
          "loyalty_baseline": 0.4,
          "courage": 0.3,
          "empathy": 0.7,
          "ambition": 0.2,
          "cynicism": 0.6
        },
        "motivations": [
          "Protect his squad of goombas",
          "Survive — he never wanted this posting"
        ],
        "current_concerns": [
          "Two of his soldiers were crushed last week by an intruder in World 1",
          "He's heard rumors about food shortages"
        ],
        "knowledge": {
          "knows": [
            "His patrol route and immediate territory",
            "Rumors of a plumber who stomped through World 1",
            "His squad's morale is low",
            "The goombas in World 3 are hungry"
          ],
          "does_not_know": [
            "Bowser's strategic concerns",
            "The Bob-omb labor situation",
            "What's happening in the eastern garrisons"
          ]
        },
        "disposition_to_player": -0.1,
        "conversation_stance": null
      }
    },

    "goomba_squad_2a": {
      "id": "goomba_squad_2a",
      "type": "group",
      "species": "goomba",
      "role": "foot_soldiers",
      "faction": "koopa_regime",
      "status": "active",
      "location": "world_2_level_1",
      "member_count": 6,
      "leader": "goomba_captain_7",

      "mind": {
        "personality": {
          "loyalty_baseline": 0.35,
          "courage": 0.25,
          "morale": 0.3
        },
        "collective_knowledge": [
          "Their immediate surroundings",
          "Their captain seems worried",
          "The food has been getting worse"
        ],
        "disposition_to_player": -0.15,
        "conversation_stance": null
      }
    },

    "princess_peach": {
      "id": "princess_peach",
      "name": "Princess Peach",
      "type": "named",
      "species": "toad",
      "role": "political_hostage",
      "faction": "mushroom_kingdom",
      "status": "captive",
      "location": "world_8_castle",

      "mind": {
        "personality": {
          "intelligence": 0.9,
          "composure": 0.8,
          "political_acumen": 0.85,
          "courage": 0.7
        },
        "motivations": [
          "Regain control of the Mushroom Kingdom",
          "Protect her people from further suffering"
        ],
        "knowledge": {
          "knows": [
            "The political structure of Bowser's regime from overhearing guards",
            "That Bowser is more worried about internal problems than external threats",
            "Key guard rotation schedules",
            "Which of her Toad retainers are still loyal and positioned throughout the kingdom"
          ],
          "does_not_know": [
            "That a plumber is making progress through the worlds",
            "The full extent of the Bob-omb crisis"
          ]
        },
        "disposition_to_player": 0.0,
        "conversation_stance": null
      }
    }
  },

  "factions": {
    "koopa_regime": {
      "id": "koopa_regime",
      "name": "The Koopa Regime",
      "leader": "bowser",
      "type": "authoritarian_military",

      "state": {
        "cohesion": 0.55,
        "morale": 0.5,
        "loyalty_to_regime": 0.5,
        "awareness_of_player": 0.15,
        "disposition_to_player": -0.3,
        "internal_dissent": 0.4,
        "resource_level": 0.6,
        "information_quality": 0.5
      },

      "sub_groups": {
        "eastern_garrisons": {
          "loyalty_offset": -0.15,
          "morale_offset": 0.1,
          "leader": "general_koopa_east",
          "concern": "Building autonomous power base"
        },
        "bob_omb_workers": {
          "loyalty_offset": -0.3,
          "morale_offset": -0.4,
          "concern": "Labor exploitation, considering work stoppage"
        },
        "goomba_infantry": {
          "loyalty_offset": -0.1,
          "morale_offset": -0.2,
          "concern": "High casualties, low status, food shortages"
        },
        "elite_guard": {
          "loyalty_offset": 0.3,
          "morale_offset": 0.2,
          "concern": "Maintaining privileged position"
        }
      },

      "members": ["bowser", "general_koopa_east", "goomba_captain_7", "goomba_squad_2a"]
    },

    "mushroom_kingdom": {
      "id": "mushroom_kingdom",
      "name": "The Mushroom Kingdom (Occupied)",
      "leader": "princess_peach",
      "type": "occupied_civilian",

      "state": {
        "cohesion": 0.3,
        "morale": 0.25,
        "loyalty_to_regime": 0.1,
        "awareness_of_player": 0.05,
        "disposition_to_player": 0.2,
        "internal_dissent": 0.1,
        "resource_level": 0.3,
        "information_quality": 0.2
      },

      "members": ["princess_peach", "toad_elder_1"]
    }
  },

  "social_graph": {
    "edges": [
      {
        "from": "goomba_captain_7",
        "to": "goomba_squad_2a",
        "type": "commands",
        "bond_strength": 0.7,
        "trust": 0.6
      },
      {
        "from": "bowser",
        "to": "general_koopa_east",
        "type": "commands",
        "bond_strength": 0.3,
        "trust": 0.25
      },
      {
        "from": "goomba_captain_7",
        "to": "goomba_squad_3a",
        "type": "peer",
        "bond_strength": 0.5,
        "trust": 0.4
      }
    ]
  },

  "information_packets": [
    {
      "id": "info_001",
      "content": "A plumber destroyed two castles in World 1",
      "origin": "world_1",
      "accuracy": 0.8,
      "emotional_charge": 0.6,
      "hops": 2,
      "reached_entities": ["goomba_captain_7"],
      "not_yet_reached": ["bowser", "general_koopa_east"]
    }
  ],

  "dramaturgical_state": {
    "arc_phase": "rising_action",
    "tension_level": 0.3,
    "drama_budget_remaining": 3,
    "planned_catalysts": [
      {
        "trigger": "player_reaches_world_3",
        "type": "food_crisis_escalation",
        "description": "The food shortage in World 3 reaches a breaking point. Civilian goombas are starving. The player witnesses it firsthand."
      },
      {
        "trigger": "player_engages_socially_first_time",
        "type": "social_hook",
        "description": "First major social hook — the entity the player talks to reveals something that reframes their understanding of the conflict.",
        "fallback_trigger": "world_2_level_1_midpoint"
      }
    ],
    "social_hook_delivered": false,
    "giant_appearances": 0
  },

  "levels": {
    "current_level": "world_1_level_2",
    "completed_levels": ["world_1_level_1"],

    "world_1_level_1": {
      "paradigm": "platformer",
      "template": "grassland_intro",
      "difficulty": 0.3,
      "length": "short",
      "entities_present": ["goomba_squad_1a", "koopa_patrol_1"],
      "terrain": { },
      "hazards": [],
      "items": [],
      "completed": true,
      "events_occurred": [
        "player_stomped_3_goombas",
        "player_reached_flag"
      ]
    },

    "world_1_level_2": {
      "paradigm": "platformer",
      "template": "underground_passage",
      "difficulty": 0.4,
      "length": "medium",
      "entities_present": ["goomba_captain_7", "goomba_squad_2a", "bob_omb_worker_1"],
      "terrain": { },
      "hazards": [],
      "items": [],
      "completed": false,
      "events_occurred": []
    }
  },

  "events_log": [
    {
      "tick": 1,
      "event": "player_stomped_3_goombas",
      "location": "world_1_level_1",
      "consequences": [
        "goomba_squad_1a.member_count reduced from 8 to 5",
        "goomba_squad_1a.morale reduced by 0.1",
        "info_packet created: 'intruder in World 1'"
      ]
    }
  ],

  "cas_tick_count": 3,
  "total_play_time_minutes": 12
}
```

### Plain-Language Explanation of Key Sections

**generation_metadata**: Everything about how this world was created. The `design_conviction` is the game's point of view — what it *believes* about the experience it's delivering. The `estimated_duration` ("short", "medium", "long") affects how dramatically the CAS initializes — shorter games start nearer to tipping points.

**win_condition**: Specific, operationalized, boolean. The `check` fields are pseudo-code that the evaluator (Claude) interprets against the current world state. `all_required: true` means every sub-condition must be met. The player sees the `description` but not the specific checks — they discover the solution space through play.

**entities**: Every entity in the world. Three types:
- `named`: Full individual mind. Bowser, Captain Grim, Princess Peach. Rich personality, specific knowledge, unique motivations. These are the social ecology's key nodes.
- `group`: A collective of similar entities treated as one unit. Goomba Squad 2a is 6 goombas under Captain Grim. They share a collective mind. If the player talks to one, they get a response shaped by the group's state. Individual members can be promoted to `named` if something significant happens (a specific goomba becomes important to the player).
- Background entities (enemies that are pure gameplay) don't appear in the entity list at all — they're defined in the level template.

**conversation_stance**: This is `null` when not yet computed. At each evaluation tick, the system generates stances for entities near the player. A stance is a pre-computed summary: "If approached, this entity would be nervous, willing to share X if pressed, persuadable by Y argument." Simple interactions use the stance directly. Substantive conversations trigger a Claude API call.

**factions**: The CAS engine's primary data structure. Each faction has state variables (0-1 scales) that the JS code updates via propagation rules. `sub_groups` represent internal divisions within a faction — they inherit the faction baseline but have offsets that can push them toward defection thresholds.

**social_graph**: Explicit relationships between entities. `bond_strength` determines how much one entity's actions affect another. `trust` determines information flow. When Entity A defects, connected entities' loyalty is reduced proportional to `bond_strength` × (1 - their own loyalty).

**information_packets**: How knowledge moves through the world. Each packet has content, accuracy (degrades with hops), emotional charge (decays with repetition), and a list of who it's reached. The CAS engine propagates these along the social graph with delays based on the paradigm's pacing.

**dramaturgical_state**: The narrative control layer. Tracks where we are in the dramatic arc, how many significant events remain in the "drama budget," and what catalytic events are queued. The `social_hook` is the forced social encounter for players who haven't engaged socially yet — if they initiate on their own, it's delayed. `giant_appearances` tracks how many times the Giant has shown up in this world.

**levels**: The physical structure of the world. Each level has a paradigm (usually matches the world's paradigm, but can shift for genre transformation), a template, difficulty, and a list of entities present. `events_occurred` logs what happened for CAS evaluation.

**events_log**: The full causal chain of everything that's happened. This is what enables the Giant's reflections and post-game readings — it can reconstruct WHY things happened, not just what.

---

## Level 3: Session State

This exists only while the game is running. It's not saved — it's reconstructed from World State when a game is loaded.

```json
{
  "world_id": "uuid-string",
  "session_start": "2025-07-18T21:00:00Z",

  "player": {
    "x": 340,
    "y": 200,
    "health": 3,
    "power_state": "super",
    "velocity": { "x": 4.2, "y": 0 },
    "inventory": ["fire_flower"],
    "facing": "right"
  },

  "active_entities": [
    {
      "id": "goomba_squad_2a_member_3",
      "x": 580,
      "y": 220,
      "ai_state": "patrol",
      "alive": true
    }
  ],

  "camera": {
    "x": 280,
    "y": 0,
    "scroll_bounds": [0, 3200]
  },

  "active_conversations": [],

  "pending_cas_events": [
    "player_spared_goomba_captain_7"
  ],

  "ui_state": {
    "dialogue_open": false,
    "pause_menu": false
  }
}
```

### Plain-Language Explanation

This is the frame-by-frame game state — player position, velocity, what's on screen. It's managed entirely by the JS game loop. The important bridge to the world state is `pending_cas_events` — things that happened during gameplay that the CAS engine needs to process at the next evaluation tick. "Player spared goomba captain 7" doesn't immediately change faction states — it gets queued and processed when the player reaches a level transition or other evaluation point.

---

## Level 4: Meta State

This is the Giant's layer. Persistent across all worlds, stored alongside the Player Profile.

```json
{
  "player_id": "uuid-string",

  "giant": {
    "awareness_of_player": 0.3,
    "interest_level": 0.4,
    "current_strategy": "observe_and_comment",
    "disposition": "curious",

    "player_model": {
      "predicted_social_approach": "cautious_pragmatist",
      "predicted_combat_approach": "aggressive_then_strategic",
      "vulnerabilities": [
        "Tends to abandon allies once they've served their purpose",
        "Overvalues direct action, undervalues patience"
      ],
      "strengths": [
        "Quick to identify social fault lines",
        "Willing to take unconventional approaches"
      ],
      "confidence": 0.4
    },

    "appearance_phase": "silhouette",
    "total_appearances": 2,
    "emissaries_deployed": [],

    "reflections": [
      {
        "world_id": "uuid-world-1",
        "tick": "end_of_world_1_level_3",
        "text": "Interesting. You stomped your way through the first world without hesitation. But you paused at that one goomba — the one that flinched. You noticed. Most don't."
      }
    ]
  },

  "cross_world_connections": [],

  "giant_dimension_progress": {
    "technology_fragments": [],
    "awareness_of_giant_world": false,
    "portal_established": false
  },

  "meta_narrative": {
    "phase": "intrigue",
    "games_until_escalation": 2,
    "giant_has_directly_communicated": false
  }
}
```

### Plain-Language Explanation

**giant.awareness_of_player**: How much attention the Giant is paying. Starts low, increases as the player becomes more interesting (engaging socially, showing unusual strategies, playing multiple worlds).

**giant.current_strategy**: What the Giant is doing right now. Phases roughly:
- `"observe_and_comment"` — early games, the Giant watches and occasionally reflects
- `"test"` — middle games, the Giant starts nudging the world to see how the player responds
- `"antagonize"` — later games, the Giant actively works against the player's comfortable strategies
- `"engage"` — late game, direct interaction
- `"endgame"` — the final confrontation

**giant.player_model**: The Giant's understanding of how this player operates. This is what drives the Giant's adaptations — it designs challenges that target the player's specific patterns. `confidence` reflects how much data the Giant has; it starts low and grows with each game.

**giant.appearance_phase**: Controls how the Giant manifests. Progresses through:
- `"silhouette"` — dark figure in cutscenes, ambiguous
- `"murals"` — images and carvings appearing in game backgrounds
- `"emissaries"` — the Giant's agents appear in the game world, talking to NPCs
- `"direct"` — the Giant addresses the player directly

**cross_world_connections**: When the player punches a hole between worlds, it's recorded here. Each connection specifies the two worlds, the portal locations, and the cost paid.

**giant_dimension_progress**: Tracks the player's progress toward reaching the Giant. Technology fragments gathered across worlds, whether they know the Giant's world exists, whether a portal has been established.

---

## How Systems Use the Schema

| System | Reads | Writes |
|--------|-------|--------|
| **Paradigm Engine** | levels, session state | session state (player position, entity positions) |
| **Generation Pipeline** | player profile, meta state | world state (creates new worlds) |
| **CAS Engine** | factions, social_graph, entities, pending_cas_events | factions, entities, information_packets, events_log |
| **Entity Conversations** | entity mind, conversation_stance, faction state | conversation history, pending_cas_events |
| **Win Condition Evaluator** | win_condition, entity states, faction states | win_condition.progress |
| **Dramaturgical System** | dramaturgical_state, cas state, events_log | dramaturgical_state, planned_catalysts |
| **The Giant** | player behavioral_profile, events_log across worlds | meta_state, giant reflections |
| **Save System** | world state, player profile, meta state | localStorage / Cloudflare KV |

---

## Schema Design Principles

1. **The world state is the source of truth.** If two systems disagree, world state wins. The CAS engine updates world state; the rendering engine reads it.

2. **Entities can be promoted.** A group entity member can become a named entity if the narrative demands it. The system creates a new named entity, removes one from the group's count, and copies/specializes the group mind.

3. **Dead entities stay in the schema but are marked dead.** Their death is an event that cascades through the social graph. They're removed from `active_entities` in session state but remain in the world state for causal logging.

4. **Information is bounded by design.** No entity's `knowledge.knows` list should include things they couldn't plausibly know given their role, location, and connections. The generation pipeline enforces this, and the conversation system respects it.

5. **The schema is paradigm-agnostic above the level layer.** Factions, entities, social graphs, the Giant — none of this changes based on whether you're playing a platformer or an RPG. Only the `levels` structure and `session_state` are paradigm-specific.

6. **Conversation stances are ephemeral.** They're computed at evaluation ticks and discarded when re-computed. They're a cache, not state.

7. **The events log is append-only.** Nothing is ever deleted from it. It's the game's memory — the Giant reads it, the post-game reading is built from it, causal chains are reconstructed from it.
