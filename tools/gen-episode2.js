#!/usr/bin/env node
// Generates data/test-fixtures/episode2.json
// Run: node tools/gen-episode2.js

const fs   = require('fs');
const path = require('path');

// ── Level dimensions ──────────────────────────────────────────────────────────
const MAP_W = 90;   // columns  (episode1 is 210 — much shorter)
const MAP_H = 15;   // rows     (same height; viewport = 15 × 16 = 240px)

// ── Tile IDs (must match tileset_spec below) ──────────────────────────────────
const AIR        = 0;
const STONE_TOP  = 1;
const STONE_FILL = 2;
const BRICK      = 3;
const PLATFORM   = 14;
const FLAG_POLE  = 12;
const FLAG_TOP   = 13;

// ── Grid init ─────────────────────────────────────────────────────────────────
const grid = Array.from({ length: MAP_H }, () => new Uint8Array(MAP_W));

function set(row, col, id) {
  if (row >= 0 && row < MAP_H && col >= 0 && col < MAP_W) grid[row][col] = id;
}

function fillRect(r0, r1, c0, c1, id) {
  for (let r = r0; r <= r1; r++)
    for (let c = c0; c <= c1; c++)
      set(r, c, id);
}

// ── Ground layer helpers ──────────────────────────────────────────────────────
// Lay solid ground from groundRow down to MAP_H-1 at column col
function groundCol(col, groundRow) {
  for (let r = 0; r < MAP_H; r++) {
    if (r < groundRow) {
      set(r, col, AIR);
    } else if (r === groundRow) {
      set(r, col, STONE_TOP);
    } else {
      set(r, col, STONE_FILL);
    }
  }
}

// ── Level design ──────────────────────────────────────────────────────────────
//
//  Segment A (0–10):  Spawn zone. Ground at row 12. One enemy (col 7).
//  Segment B (11–13): Pit #1 (3 tiles — narrow intro pit)
//  Segment C (14–25): Platform zone. Ground row 12. Floating platform row 9 at cols 16–20.
//  Segment D (26–29): Pit #2 (4 tiles — requires platform or precise jump)
//  Segment E (30–42): Elevated staircase. Ground rises: row 12→10→9.
//                     Then descends: row 9→10→12.
//  Segment F (43–48): Pit #3 (6 tiles — wide, challenging with heavy gravity)
//  Segment G (49–65): Two-platform zone. Ground row 12. Platforms at row 8/cols 50–54,
//                     row 9/cols 59–63. Two enemies on ground.
//  Segment H (66–71): Pit #4 (6 tiles)
//  Segment I (72–89): Final push. Ground row 12→9 (rising). Flag at col 87.

// Segment A: flat spawn ground (rows 12–14)
for (let c = 0; c <= 10; c++) groundCol(c, 12);

// Segment B: Pit #1 (cols 11–13)
// leave as AIR (already initialized)

// Segment C: ground + floating platform
for (let c = 14; c <= 25; c++) groundCol(c, 12);
fillRect(9, 9, 16, 20, PLATFORM);   // platform at row 9 above the pit exit

// Segment D: Pit #2 (cols 26–29)
// leave as AIR

// Segment E: staircase up then down
// Cols 30–32: ground at row 10 (step up)
for (let c = 30; c <= 32; c++) groundCol(c, 10);
// Cols 33–38: ground at row 9 (highest, tight ceiling feel)
for (let c = 33; c <= 38; c++) groundCol(c, 9);
// Cols 39–42: back down to row 11
for (let c = 39; c <= 42; c++) groundCol(c, 11);

// Segment F: Pit #3 (cols 43–48)

// Segment G: two-platform zone
for (let c = 49; c <= 65; c++) groundCol(c, 12);
fillRect(8, 8, 50, 54, PLATFORM);   // high platform
fillRect(9, 9, 59, 63, PLATFORM);   // lower platform

// Segment H: Pit #4 (cols 66–71)

// Segment I: rising ground to end
// Cols 72–77: row 12
for (let c = 72; c <= 77; c++) groundCol(c, 12);
// Cols 78–80: row 11
for (let c = 78; c <= 80; c++) groundCol(c, 11);
// Cols 81–89: row 9 (elevated end zone)
for (let c = 81; c <= 89; c++) groundCol(c, 9);

// Flag pole at col 87, row 9 ground (flag above from row 3 to 8)
set(3, 87, FLAG_TOP);
for (let r = 4; r <= 8; r++) set(r, 87, FLAG_POLE);

// ── Flatten + base64 ──────────────────────────────────────────────────────────
const flat = new Uint8Array(MAP_W * MAP_H);
for (let r = 0; r < MAP_H; r++)
  for (let c = 0; c < MAP_W; c++)
    flat[r * MAP_W + c] = grid[r][c];

const b64 = Buffer.from(flat).toString('base64');

// ── ASCII preview (optional debug) ───────────────────────────────────────────
const CHARS = { [AIR]: '.', [STONE_TOP]: 'G', [STONE_FILL]: 'g', [BRICK]: 'B',
                [PLATFORM]: 'P', [FLAG_POLE]: 'F', [FLAG_TOP]: 'T' };
for (let r = 0; r < MAP_H; r++) {
  const row = Array.from(grid[r]).map(id => CHARS[id] ?? '?').join('');
  process.stderr.write(`${String(r).padStart(2)}: ${row}\n`);
}
process.stderr.write(`\nLevel: ${MAP_W}×${MAP_H} = ${flat.length} bytes\n`);
process.stderr.write(`Base64 length: ${b64.length}\n\n`);

// ── Entity placements (pixel coords from grid) ────────────────────────────────
// Entity at col C, ground at row R → x = C*16, y = (R-1)*16 (entity height 16)
// For 16×16 entities: y = groundRow*16 - 16
function entityY(groundRow, entityH = 16) {
  return groundRow * 16 - entityH;
}

// 4 entities: fast patrol enemies, heavier feel
// Enemy 1: goomba, col 7, ground row 12 → x=112, y=176
// Enemy 2: koopa,  col 19, ground row 12 → x=304, y=176 (on platform approach)
// Enemy 3: goomba, col 55, ground row 12 → x=880, y=176
// Enemy 4: koopa,  col 83, elevated ground row 9 → x=1328, y=128

// ── Build fixture ─────────────────────────────────────────────────────────────
const fixture = {
  meta: {
    schema_version: "0.2.0",
    game_id: "tf_test_002",
    created_at: "2026-03-07T00:00:00Z",
    prompt: "Mario but gravity is twice as heavy and the caves are alive",
    paradigm: {
      id: "platformer",
      rendering_core: "2d_tile_scrolling",
      interaction_grammar: "direct_action"
    },
    aesthetic: {
      style_era: "nes_early",
      palette_id: "cave_iron",
      palette_colors: [
        "#0A0A2A",
        "#667788",
        "#334455",
        "#998877",
        "#AABB88",
        "#CC9933",
        "#222233",
        "#000000"
      ],
      crt_intensity: 0.4,
      pixelation_scale: 3
    },
    audio_profile: {
      tempo_bpm: 110,
      key: "A",
      mode: "minor",
      waveforms: ["square", "triangle", "noise"],
      style_reference: "koji_kondo_tense"
    },
    philosophy: {
      conviction: "even the stone remembers what it once was",
      tone: "grim",
      dramatic_question: "what do you become when the weight never lifts?"
    },
    game_visual_identity: null,
    game_setup: {
      intended_length: "short",
      event_magnitude_sensitivity: 0.7,
      initial_conditions_summary: "iron caves, heavier gravity, tighter geometry",
      pressure_ramp: "constant",
      social_hooks: [],
      drama_density_defaults: {
        min_significant_changes_per_cadence: 1,
        max_significant_changes_per_cadence: 3
      },
      social_timer_pace: 1,
      forgiveness: {
        checkpoint_max_loss_seconds: 60,
        death_cost: "time_only",
        enemy_telegraph_ms: 400,
        teachability_zone_screens: 2,
        complexity_ceiling_simultaneous: 2,
        ramp_shape: "linear",
        difficulty_override: null
      }
    },
    skeleton: {
      paradigm_grammar_id: "platformer_standard",
      total_episodes: 4,
      zones: [
        {
          zone_id: "iron_caves",
          episodes: [1, 2],
          vocabulary_budget: ["cave_goomba", "wide_pit", "staircase_platform"],
          complexity_ceiling: 0.5,
          punctuation: null
        }
      ],
      override_conditions: []
    }
  },
  world: {
    current_paradigm: "platformer",
    factions: {
      cave_denizens: {
        id: "cave_denizens",
        name: "Iron Cave Denizens",
        role: "antagonist_primary",
        personality_center: {
          openness: 0.2,
          conscientiousness: 0.6,
          extraversion: 0.3,
          agreeableness: 0.2,
          neuroticism: 0.5
        },
        resources: 0.5,
        leader_entity_id: "cave_boss_01",
        territory: ["iron_caves"],
        computed_aggregates: {
          avg_valence: -0.1,
          avg_arousal: 0.4,
          cohesion: 0.55,
          bond_density: 0.35,
          member_count: 18
        }
      }
    },
    entities: {
      cave_goomba_01: {
        id: "cave_goomba_01",
        name: null,
        type: "population",
        template_id: "cave_goomba_standard",
        faction_id: "cave_denizens",
        rank: "low",
        status: "active",
        location_id: "iron_caves",
        personality: {
          openness: 0.2,
          conscientiousness: 0.55,
          extraversion: 0.3,
          agreeableness: 0.2,
          neuroticism: 0.5
        },
        affect: { valence: -0.1, arousal: 0.4 },
        bonds: [],
        knowledge: [
          {
            id: "k_cg01_001",
            type: "factual",
            content: "intruder_in_caves",
            accuracy: 0.7,
            emotional_charge: 0.5,
            source: "direct_observation",
            causal_agent: null,
            acquired_tick: 0
          }
        ],
        behavioral_params: {
          patrol_range: 48,
          patrol_speed: 0.7,
          awareness_radius: 40,
          response_behavior: "approach",
          contact_damage: 1,
          capture_window_ms: 0
        },
        conversation_state: "never_contacted",
        communication_willingness: 0.1,
        asset_spec: {
          visual: {
            dimensions: [16, 16],
            color_count: 3,
            palette_profile: "cave_dark",
            silhouette_class: "round_short",
            style_era: "nes_early",
            animation: {
              walk: { frames: 2, speed: "fast" },
              stomp: { frames: 1 }
            }
          },
          narrative: { role: "guard", faction: "cave_denizens", tone: "hostile" },
          reference: { style_reference: "goomba_smb1" }
        }
      },
      cave_koopa_01: {
        id: "cave_koopa_01",
        name: null,
        type: "population",
        template_id: "cave_koopa_standard",
        faction_id: "cave_denizens",
        rank: "low",
        status: "active",
        location_id: "iron_caves",
        personality: {
          openness: 0.15,
          conscientiousness: 0.7,
          extraversion: 0.3,
          agreeableness: 0.15,
          neuroticism: 0.4
        },
        affect: { valence: 0.0, arousal: 0.3 },
        bonds: [],
        knowledge: [],
        behavioral_params: {
          patrol_range: 56,
          patrol_speed: 0.8,
          awareness_radius: 48,
          response_behavior: "approach",
          contact_damage: 1,
          capture_window_ms: 0
        },
        conversation_state: "never_contacted",
        communication_willingness: 0.05,
        asset_spec: {
          visual: {
            dimensions: [16, 24],
            color_count: 3,
            palette_profile: "cave_green",
            silhouette_class: "humanoid_short_shell",
            style_era: "nes_early",
            animation: {
              walk: { frames: 2, speed: "fast" },
              shell: { frames: 1 }
            }
          },
          narrative: { role: "soldier", faction: "cave_denizens", tone: "cold" },
          reference: { style_reference: "koopa_troopa_smb1" }
        }
      },
      cave_goomba_02: {
        id: "cave_goomba_02",
        name: null,
        type: "population",
        template_id: "cave_goomba_standard",
        faction_id: "cave_denizens",
        rank: "low",
        status: "active",
        location_id: "iron_caves",
        personality: {
          openness: 0.2,
          conscientiousness: 0.5,
          extraversion: 0.35,
          agreeableness: 0.2,
          neuroticism: 0.45
        },
        affect: { valence: -0.15, arousal: 0.35 },
        bonds: [],
        knowledge: [],
        behavioral_params: {
          patrol_range: 40,
          patrol_speed: 0.7,
          awareness_radius: 40,
          response_behavior: "approach",
          contact_damage: 1,
          capture_window_ms: 0
        },
        conversation_state: "never_contacted",
        communication_willingness: 0.1,
        asset_spec: {
          visual: {
            dimensions: [16, 16],
            color_count: 3,
            palette_profile: "cave_dark",
            silhouette_class: "round_short",
            style_era: "nes_early",
            animation: {
              walk: { frames: 2, speed: "fast" },
              stomp: { frames: 1 }
            }
          },
          narrative: { role: "guard", faction: "cave_denizens", tone: "hostile" },
          reference: { style_reference: "goomba_smb1" }
        }
      },
      cave_koopa_02: {
        id: "cave_koopa_02",
        name: null,
        type: "population",
        template_id: "cave_koopa_standard",
        faction_id: "cave_denizens",
        rank: "low",
        status: "active",
        location_id: "iron_caves",
        personality: {
          openness: 0.15,
          conscientiousness: 0.65,
          extraversion: 0.25,
          agreeableness: 0.15,
          neuroticism: 0.4
        },
        affect: { valence: 0.05, arousal: 0.35 },
        bonds: [],
        knowledge: [],
        behavioral_params: {
          patrol_range: 64,
          patrol_speed: 0.85,
          awareness_radius: 52,
          response_behavior: "approach",
          contact_damage: 1,
          capture_window_ms: 0
        },
        conversation_state: "never_contacted",
        communication_willingness: 0.05,
        asset_spec: {
          visual: {
            dimensions: [16, 24],
            color_count: 3,
            palette_profile: "cave_green",
            silhouette_class: "humanoid_short_shell",
            style_era: "nes_early",
            animation: {
              walk: { frames: 2, speed: "fast" },
              shell: { frames: 1 }
            }
          },
          narrative: { role: "elite_soldier", faction: "cave_denizens", tone: "menacing" },
          reference: { style_reference: "koopa_troopa_smb1" }
        }
      }
    },
    population_templates: {
      cave_goomba_standard: {
        template_id: "cave_goomba_standard",
        faction_id: "cave_denizens",
        personality_center: {
          openness: 0.2,
          conscientiousness: 0.55,
          extraversion: 0.3,
          agreeableness: 0.2,
          neuroticism: 0.5
        },
        personality_variance: 0.08,
        behavioral_params_base: {
          patrol_range: 48,
          patrol_speed: 0.7,
          awareness_radius: 40,
          response_behavior: "approach",
          contact_damage: 1,
          capture_window_ms: 0
        },
        asset_spec: {
          visual: {
            dimensions: [16, 16],
            color_count: 3,
            palette_profile: "cave_dark",
            silhouette_class: "round_short",
            style_era: "nes_early"
          }
        }
      },
      cave_koopa_standard: {
        template_id: "cave_koopa_standard",
        faction_id: "cave_denizens",
        personality_center: {
          openness: 0.15,
          conscientiousness: 0.68,
          extraversion: 0.28,
          agreeableness: 0.15,
          neuroticism: 0.42
        },
        personality_variance: 0.06,
        behavioral_params_base: {
          patrol_range: 56,
          patrol_speed: 0.8,
          awareness_radius: 48,
          response_behavior: "approach",
          contact_damage: 1,
          capture_window_ms: 0
        },
        asset_spec: {
          visual: {
            dimensions: [16, 24],
            color_count: 3,
            palette_profile: "cave_green",
            silhouette_class: "humanoid_short_shell",
            style_era: "nes_early"
          }
        }
      }
    },
    locations: {
      iron_caves: {
        id: "iron_caves",
        name: "Iron Caves",
        type: "zone",
        controlling_faction: "cave_denizens",
        contested: false,
        entities_present: ["cave_goomba_01", "cave_koopa_01", "cave_goomba_02", "cave_koopa_02"],
        connected_to: [],
        state: { fortification: 0.4, damage: 0.1 }
      }
    },
    information_packets: [],
    event_log: []
  },
  cas: {
    tick_count: 0,
    social_timer: {
      base_interval_seconds: 120,
      game_pace_modifier: 1,
      last_tick_timestamp: null
    },
    drama_density: {
      current_rate: 0,
      cadence_window: 3,
      significance_threshold: 0.15,
      recent_significant_changes: []
    }
  },
  episode: {
    episode_number: 1,
    episode_brief: {
      vocabulary_available: ["cave_goomba", "wide_pit", "staircase_platform"],
      vocabulary_new: ["cave_goomba", "wide_pit", "staircase_platform"],
      complexity_ceiling: 0.35,
      difficulty_target: 0.4,
      punctuation_type: null,
      zone_identity: "iron_caves",
      mechanical_thesis: "heavy gravity demands deliberate timing — pits are wider, jumps are lower, every decision counts",
      narrative_context: "player descends into the iron caves — gravity presses harder here, the air tastes of rust",
      override_flags: []
    },
    physics: {
      gravity_ascending: 0.28,
      gravity_release: 0.6,
      gravity_falling: 0.6,
      jump_velocity: -5.0,
      max_fall_speed: 5.5,
      run_speed: 2.5,
      run_acceleration: 0.12,
      run_deceleration: 0.3,
      air_control: 0.85,
      coyote_time_ms: 60,
      friction_ground: 0.82,
      friction_air: 0.97
    },
    aesthetic_modifiers: {
      palette_shift: 0,
      saturation_modifier: 0.8,
      darkness_modifier: 0.3,
      decay_level: 0.2
    },
    audio_modifiers: {
      tension_level: 0.3,
      tempo_modifier: 0.85,
      mode_shift: "minor",
      sparseness: 0.2
    },
    spatial: {
      format: "tilemap_2d_scrolling",
      width: MAP_W,
      height: MAP_H,
      tile_size: 16,
      scroll_speed: 0,
      camera: {
        type: "follow_player",
        lead_pixels: 48,
        vertical_deadzone: 32
      },
      layers: [
        {
          name: "background",
          data_format: "base64_uint8",
          default_tile: 0,
          tileset_spec: {
            tiles: {
              "0": { id: "void", visual: "solid_color", color: "#0A0A2A", collision: false },
              "1": { id: "stone_top", visual: "stone_surface", color: "#667788", collision: true },
              "2": { id: "stone_fill", visual: "stone_body", color: "#334455", collision: true },
              "3": { id: "iron_brick", visual: "iron_brick", color: "#554433", collision: true, breakable: false },
              "12": { id: "flag_pole", visual: "flag_pole", color: "#998877", collision: true, interaction: "level_end" },
              "13": { id: "flag_top", visual: "flag_ball", color: "#CC9933", collision: false },
              "14": { id: "platform", visual: "floating_platform", color: "#445566", collision: true }
            }
          },
          data: b64
        },
        {
          name: "collision",
          data_format: "derived_from_tileset",
          data_comment: "Collision derived from tileset_spec collision flags."
        }
      ]
    },
    entity_placements: [
      {
        _comment: "Cave goomba #1 — safe flat spawn zone (col 7). Faster than episode1 goombas.",
        entity_id: "cave_goomba_01",
        position: { x: 112, y: 176 },
        active: true,
        behavioral_override: null
      },
      {
        _comment: "Cave koopa #1 — guards the platform after pit #1 (col 19). Forces use of the platform.",
        entity_id: "cave_koopa_01",
        position: { x: 304, y: 176 },
        active: true,
        behavioral_override: null
      },
      {
        _comment: "Cave goomba #2 — deep in the cave (col 55). Guards the second platform section.",
        entity_id: "cave_goomba_02",
        position: { x: 880, y: 176 },
        active: true,
        behavioral_override: null
      },
      {
        _comment: "Cave koopa #2 — elevated end zone (col 83, ground row 9). Tests elevation + combat combined.",
        entity_id: "cave_koopa_02",
        position: { x: 1328, y: 128 },
        active: true,
        behavioral_override: null
      }
    ],
    items: [],
    hazards: [
      {
        hazard_id: "pit_01", type: "pit",
        position: { x: 176, y: 224 }, width: 48,
        damage: "instant_death",
        respawn_point: { x: 128, y: 176 }
      },
      {
        hazard_id: "pit_02", type: "pit",
        position: { x: 416, y: 224 }, width: 64,
        damage: "instant_death",
        respawn_point: { x: 352, y: 176 }
      },
      {
        hazard_id: "pit_03", type: "pit",
        position: { x: 688, y: 224 }, width: 96,
        damage: "instant_death",
        respawn_point: { x: 672, y: 176 }
      },
      {
        hazard_id: "pit_04", type: "pit",
        position: { x: 1056, y: 224 }, width: 96,
        damage: "instant_death",
        respawn_point: { x: 1040, y: 176 }
      }
    ],
    triggers: [],
    visual_manifestations: [],
    vme_directive_stack: [],
    music: {
      track_spec: {
        tempo_bpm: 110,
        key: "A",
        mode: "minor",
        energy_curve: [0.4, 0.5, 0.55, 0.6, 0.65, 0.7, 0.75],
        instrumentation: ["square_lead", "triangle_bass", "noise_percussion"]
      }
    },
    vocabulary_record: {
      element_introductions: [
        { element: "cave_goomba", section: 1, context: "flat_open_approach", episode_introduced: 1 },
        { element: "wide_pit", section: 3, context: "after_platform_bridge", episode_introduced: 1 },
        { element: "staircase_platform", section: 4, context: "ascending_then_descending", episode_introduced: 1 }
      ],
      cumulative_vocabulary: ["cave_goomba", "wide_pit", "staircase_platform"],
      mastered_vocabulary: []
    }
  },
  player: {
    entity_id: "player_01",
    position: { x: 32, y: 176 },
    velocity: { x: 0, y: 0 },
    facing: "right",
    state: "idle",
    health: 3,
    max_health: 3,
    powerups: [],
    inventory: [],
    asset_spec: {
      visual: {
        dimensions: [16, 24],
        color_count: 4,
        palette_profile: "explorer_dark",
        silhouette_class: "humanoid_short",
        style_era: "nes_early",
        animation: {
          idle: { frames: 1 },
          run: { frames: 3, speed: "medium" },
          jump: { frames: 1 },
          fall: { frames: 1 }
        }
      },
      narrative: { role: "protagonist", tone: "wary" },
      reference: { style_reference: "mario_smb1" }
    },
    social_stats: {
      conversation_count: 0,
      entities_spared: 0,
      entities_defeated: 0,
      alliances_formed: 0
    },
    exchange_budget: { remaining: 10, max_daily: 10, reset_timestamp: null },
    behavioral_model: {
      action_tendencies: { aggression_ratio: null, exploration_thoroughness: null, risk_tolerance: null, persistence: null, speed_preference: null },
      social_tendencies: { first_contact_approach: null, persuasion_style: null, loyalty_to_allies: null, information_handling: null, mercy_rate: null, trust_baseline: null },
      decision_making: { deliberation_time_avg_ms: null, consistency: null, response_to_failure: null, planning_horizon: null },
      meaningful_decision_count: 0
    }
  },
  overseer: {
    player_account_id: "acct_test_001",
    total_meaningful_decisions: 0,
    model_confidence: 0,
    escalation_level: 0,
    cumulative_behavioral_model: {
      action_tendencies: {},
      social_tendencies: {},
      decision_making: {},
      comfort_strategies: [],
      pattern_signatures: []
    },
    game_history: [],
    lore_fragments_revealed: [],
    cross_world_state: {
      worlds_bridged: [],
      artifacts_obtained: [],
      giant_dimension_accessible: false
    },
    intervention_log: []
  },
  diagnostics: {
    gate_1: {
      runs: null, spawns_correctly: null, assets_resolve: null,
      latency_ms: null, completable: null, schema_valid: null, passed: null
    },
    simulated_player: {
      path_found: null, completion_time_s: null, deaths: null,
      death_locations: [], element_encounter_order: [], timeline: []
    },
    moment_clips: [],
    generation_metadata: {
      agent_calls: 0, total_tokens: 0, generation_time_s: 0,
      designer_vision_calls: 0, builder_calls: 0,
      validator_passes: 0, taste_rejections: 0
    }
  }
};

const outPath = path.join(__dirname, '..', 'data', 'test-fixtures', 'episode2.json');
fs.writeFileSync(outPath, JSON.stringify(fixture, null, 2));
process.stderr.write(`\nWritten: ${outPath}\n`);
