# Two Fires — Architectural Blueprint (claude.md)
## Source of truth for all Claude Code and Claude.ai sessions

**Last updated:** 2026-03-13 (Thread 10: Emulator-as-Engine Paradigm Shift)

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
| `docs/design/manifest-architecture-spec.md` | Dual-layer manifest spec (now: behavioral map format reference) | When map format changes |
| `docs/design/build-plan-v4.md` | Build plan (needs revision for new architecture) | When plan changes |
| `docs/design/diagnostic-framework.md` | Fast-fail quality evaluation specification | When diagnostic approach changes |
| `docs/design/sequencing-grammar-framework.md` | Intermediate layer theory + grammar seeds | When sequencing logic evolves |
| `docs/design/paradigm-shift-principles.md` | Constraint document for paradigm shifts | When shift principles evolve |
| `docs/design/vme-spec.md` | Visual Manifestation Engine (partially superseded by emulator-as-engine) | Reference for creative operations taxonomy |
| `docs/lore/two-fires.md` | Mythology, endgame mechanics, narrative backbone | When lore decisions are made |
| `docs/design/thread-transfer-post-session18.md` | Sessions 10-18 marathon summary (historical reference) | Rarely |

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
- **Ground truth over vibes:** Every generated element is grounded in data extracted from real games, not Claude's imagination of what a game should be
- **Never reconstruct what you can reuse:** Real game engines run real game code; our systems modify, not recreate
- **Claude's creative contribution is compositional and semantic, not generative:** Claude selects, combines, arranges, and themes real ingredients — it doesn't generate raw game output from scratch

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

**Rationale:** The social ecology requires cognitive bandwidth to land. The Competence Bias is both a taste preference and an architectural requirement.

---

## Core Runtime Architecture: Emulator as Engine (Decision 91)

**This is the fundamental architectural change from Thread 10.** The game engine is NOT a custom-built renderer. The game engine IS the original game, running its original code in an emulated environment, with our systems modifying it through memory writes.

### Three Layers

**Layer 1 — Emulator Runtime**
- jsnes for NES games (validated). SNES/Genesis equivalents TBD.
- Runs actual ROM code: physics, collision, entity AI, rendering, audio — all at original quality
- Provides: frame buffer output, audio output, synchronous RAM/VRAM read/write, savestates, frame stepping
- We do NOT build game engines. We use proven emulators.
- jsnes API: `nes.cpu.mem[addr]` (RAM), `nes.ppu.vramMem[addr]` (VRAM/CHR/palettes), `nes.ppu.spriteMem[addr]` (OAM), `nes.frame()` (step), `nes.toJSON()`/`nes.fromJSON()` (savestates)

**Layer 2 — Behavioral Map**
- Per-game database mapping semantic concepts to specific memory addresses
- Built automatically through hybrid trace analysis + write-verify oracle
- Format: `{ "player_x": {"addr": "0x0086", "verified": true}, "enemy_table": {"base": "0x0300", "stride": 16, "fields": {"x": 4, "y": 5, "speed": 8, "type": 0}}, ... }`
- Zero per-game configuration. Automated pipeline processes any ROM.
- Tools: `nes-trace-analyzer.cjs` (primary), `verified-behavioral-map.cjs` (causation verification)

**Layer 3 — Creative Controller**
- Translates Claude's creative intent and CAS state changes into specific memory writes
- Uses the behavioral map to find the right addresses
- Channels: palette writes (visual theming), tile data writes (texture changes), RAM writes (entity behavior, physics, level content), pattern table writes (sprite appearance)
- This is the ONLY layer that requires AI/creative intelligence

### Six Modification Channels

All game modifications flow through one of six channels, each corresponding to memory regions in the emulator:

| Channel | What Changes | Memory Target | Proven? |
|---------|-------------|---------------|---------|
| Visual (palettes) | Color schemes, mood, theming | PPU $3F00-$3F1F | ✅ Yes |
| Visual (tiles) | Ground textures, wall appearance, decorative elements | CHR pattern tables $0000-$1FFF | ✅ Yes |
| Visual (sprites) | Character appearance, enemy looks | CHR sprite tables + OAM | ✅ Yes (single tile) |
| Mechanical | Entity behavior, speed, aggression, patrol patterns | RAM (behavioral map addresses) | ✅ Partial |
| Physical | Gravity, jump arc, friction, player speed | RAM (physics addresses) | ✅ Yes (via ROM extraction) |
| Structural | Level layouts, enemy placement, item positions | RAM (level data addresses) | ⚠️ Not yet tested at scale |
| Musical | Background music, SFX | APU registers $4000-$4017 | ⚠️ Not yet tested |

### Track A / Track B

**Track A (development, internal demos):** Run unmodified commercial ROMs in the emulator. Modify in real-time. Perfect fidelity. No legal issues for internal use.

**Track B (public release):** "Engine ROMs" — commercial ROMs with all creative expression (tiles, sprites, level data, music, palettes) stripped. Only functional code remains (physics, collision, entity management, rendering pipeline). At generation time, the Creative Controller populates the engine ROM with 100% original content through the modification pipeline. Automatic distribution shift guarantees no output matches any source ROM.

---

## Behavioral Map Pipeline

### Step 1: Hybrid Trace Analysis (nes-trace-analyzer.cjs)

Boot game in jsnes → get to gameplay via bidirectional control test → record CPU execution trace for 600 frames → classify every RAM variable by observed read/write patterns:
- Position variables (updated in movement-pattern routines)
- Speed variables (used in position update calculations)
- State variables (control game mode, entity states)
- Counter variables (timers, animation frames)
- Flag variables (boolean conditions)

Universal across mappers — the emulator resolves all bank switching internally.

### Step 2: Write-Verify Oracle (verified-behavioral-map.cjs)

For each candidate from Step 1: save state → write test value → step frames → check OAM/observable effect → restore state. Only verified controls enter the final behavioral map.

### Step 3: Claude Semantic Labeling (future)

Feed the verified behavioral map to Claude with the game's ROM analysis. Claude adds semantic labels: "this is the main boss HP variable," "this entity table contains the flying enemies," "this routine is the level transition handler." One API call per game (~$0.10-0.15).

### Known Limitations (to be resolved)

- Sub-pixel buffered games (MM2 type) need longer oracle observation windows
- Speed variables often computed indirectly — need alternative detection strategy
- Entity table field identification needs improvement (know the table exists, need to know which field is which)

---

## CAS Engine Architecture (Two-Layer Design)

**Unchanged from Thread 9.** Full specification: `docs/design/cas-engine-spec.md`

CAS state changes now manifest through the emulator modification pipeline:
- Affect changes → behavioral map writes (entity speed, aggression, patrol range)
- Faction territory changes → palette/tile modifications for zone theming
- Dramatic events → tile replacements, sprite modifications, audio changes
- Paradigm shifts → ROM swap with entity state serialization

### The Two Layers

**Layer 1 — CAS Engine (deterministic JavaScript).** Propagates valence, arousal, and information through bond networks. Unchanged.

**Layer 2 — Claude Interpretation.** At episode boundaries, Claude reads CAS state and produces: behavioral directives (→ RAM writes via behavioral map), visual directives (→ palette/tile writes), audio directives (→ APU writes), narrative updates. Claude directs behavior → behavior creates events → events enter CAS → CAS updates → Claude interprets.

### Integration with Emulator-as-Engine

CAS modulation is now direct parameter modification on the running game:
- "Faction demoralized, enemies 30% slower" → write speed × 0.7 to enemy speed addresses
- "Territory corrupted" → swap palette to darker values, replace ground tiles
- "Alliance formed" → modify NPC behavior state from hostile to neutral

The CAS never modifies ROM code. It modifies RAM values that the ROM code reads. The game's own engine processes the modified values correctly because it doesn't know they've been changed.

---

## Composition System

### Six Parameter Clusters (Decision 95)

When composing content from multiple source games, these clusters of parameters must travel together (one source authority per cluster):

1. **Movement feel** — gravity, acceleration, friction, jump height/arc, air control, player speed
2. **Combat system** — player damage, enemy HP, invincibility frames, knockback, weakness graphs
3. **Level grammar** — progression gating, key/lock patterns, teachability arcs, challenge density
4. **Entity design philosophy** — pattern-based vs reactive vs swarm, difficulty scaling approach
5. **Audiovisual identity** — palettes, tile style, proportions, music, SFX vocabulary
6. **Rule economy** — lives, scoring, currency, power-ups, resource management

### Composition Heuristics (Decision 96)

1. **Ratio preservation** — transplanted elements maintain source game's inter-parameter ratios
2. **One authority per cluster** — no mixing sources within a cluster
3. **Constraint inheritance** — mix of eras uses the more constrained source's limits
4. **Semantic bridging** — Claude's creativity lives in the thematic/naming layer, not raw parameters
5. **Precedent validation** — composed parameter sets checked against real game parameter space
6. **Graceful degradation** — when uncertain, fall back toward a single proven source

### Generation Tiers

| Tier | Example | What's Extracted | What Claude Generates | Quality Risk |
|------|---------|------------------|-----------------------|-------------|
| 0: Exact replica | "Mega Man 2, exactly" | Everything | Nothing | Zero |
| 1: Surface variation | "MM2 but underwater theme" | All mechanics + structure | Palette + tile choices | Very low |
| 2: Entity reskin | "MM2 but Harry Potter" | All mechanics + structure | Character visuals + theme mapping | Low-moderate |
| 3: Cross-game composition | "Zelda gameplay in Mario world" | Mechanics from A, visuals from B | Composition strategy + entity mapping | Moderate |
| 4: CAS transformation | Bob-omb nuclear weapon | Base game + behavioral map | Parameter modifications + visual changes | Moderate |
| 5: Paradigm shift | MM2 → Zelda top-down | Multiple ROMs + behavioral maps | Transition orchestration + entity crosswalk | Moderate-high |
| 6: Fully original | "Something no one's ever seen" | Distributional patterns only | Everything within constraints | Highest |

**Design principle:** Keep everything in Tiers 0-4. Tier 5 is achievable. Tier 6 should be decomposed into lower tiers whenever possible (Claude's job is decomposition, not generation from scratch).

---

## Visual Generation for Novel Entities (Decision 98)

When novel visual content is needed (Track B characters, CAS-driven transformations), the pipeline is:

1. Claude generates SVG constrained by source game's extracted visual identity (palette, dimensions, animation frame count, proportion grid)
2. SVG is rasterized to tile format (2bpp for NES, 4bpp for SNES) at correct dimensions
3. Tile data is injected into emulator's CHR memory (pattern tables)
4. The emulator's own PPU renders the injected tiles alongside all original art

Claude never generates pixel art directly. SVG → rasterization → CHR injection leverages Claude's strength (structured code) and the emulator's strength (rendering).

---

## Level Construction Architecture

**Unchanged from Thread 9.** Three components: Designer (Claude) + Builder (Claude, Sonnet) + Validator (deterministic).

In the emulator-as-engine paradigm, constructed levels are expressed as:
- Level data writes to RAM (using behavioral map's level data addresses)
- Entity placement writes to entity table RAM
- Tile modifications for visual theming
- The game's own engine renders and runs the level

For games where the ROM's level loader is identified in the behavioral map, the ROM-as-compiler concept still applies: write semantic level objects in the format the game's own level loader expects, let the game's engine build the nametables.

---

## Agent Execution Order

```
Pre-game:
  Experience Interpreter (prompt → game concept)
    → Selects source ROM(s) based on mechanical feel
    → Artistic Director (aesthetic direction)
    → Design Philosopher (constraint philosophy)
    → Game Compiler:
        Loads source behavioral map(s)
        Instantiates skeleton from source game's structural grammar
        Sets CAS initial conditions, social graph, personality distributions
        Assigns parameter cluster authorities (which source for which cluster)
        Generates modification spec: palette theme, tile replacements,
          entity behavior modifications, physics adjustments
        Places social hook at episode 1-2 boundary
    → Creative Controller applies modification spec to running emulator

Per-episode level construction:
  Game Compiler produces Episode Brief
    → Designer produces Episode Vision
    → For each section:
        Builder constructs → Validator verifies → Designer evaluates taste
    → Episode served as emulator state modifications
    → Vocabulary Record Update written

Runtime loop:
  Emulator runs game ROM continuously (Layer 1)
  CAS engine ticks on social timer (deterministic, continuous)
  
  At paradigm tick (episode boundary):
    → Claude receives: CAS snapshot + previous narrative + drama signal
    → Claude interprets → produces modification directives
    → Creative Controller translates directives to memory writes via behavioral map
    → Next episode state applied to running emulator
  
  Player conversations:
    → Exchange budget system, CAS events generated
    → Population → named promotion on first contact

Diagnostic wrapper:
  Simulated Player Agent → Gate 1 auto-checks
  → Moment Extractor → Testing UI → Joe rates
  → Pattern Distiller → Living Taste Document
```

---

## Diagnostic & Tuning Framework Summary

**Unchanged from Thread 9.** Full specification: `docs/design/diagnostic-framework.md`

Fast-fail funnel: Gate 1 (automated) → Gate 2 (Joe reviews clips) → Gate 3 (INUS conditions) → Gate 4 (holistic playthroughs).

---

## The Lore System

**Unchanged.** Full lore document: `docs/lore/two-fires.md`. The Giant/Overseer operates through the CAS two-layer architecture. Lore discovery through attribution system.

---

## Tools Reference

### Extraction & Analysis
| Tool | What It Does |
|------|-------------|
| `tools/jsnes-extractor.js` | 5-phase extraction pipeline (boot, candidates, mutation sweep, deep capture, physics) |
| `tools/nes-trace-analyzer.cjs` | **Primary analysis tool.** Hybrid trace-based behavioral map generator |
| `tools/verified-behavioral-map.cjs` | Write-verify oracle for causal address verification |
| `tools/nes-disasm.cjs` | 6502 disassembler (supplemental to trace analysis) |
| `tools/nes-analyzer.cjs` | Static code pattern analyzer (supplemental) |

### Runtime Modification
| Tool | What It Does |
|------|-------------|
| `tools/live-mod-experiment.js` | Proof-of-concept: live game modification via memory writes |
| `tools/map-to-mod-test.cjs` | Tests behavioral map → live modification pipeline |

### Demo
| Tool | What It Does |
|------|-------------|
| `public/simple-demo.html` | Browser demo: SMB + palette theme preset buttons |

### Legacy (from Sessions 8-18, partially superseded)
| Tool | What It Does | Status |
|------|-------------|--------|
| `tools/extract-chr-rom.js` | NES CHR-ROM bulk extractor | Still useful for tile extraction |
| `tools/render-screen.js` | NES screen renderer | Superseded by emulator rendering |
| `tools/smb-manifest-complete.js` | SMB manifest builder | Reference only |

---

## Key Architectural Principles

1. **The emulator IS the engine.** We never build custom renderers, physics engines, or audio systems. Proven emulators provide all of this at original quality.

2. **Modifications are memory writes, not code generation.** The Creative Controller writes data values to specific addresses. The game's own code processes those values. This is why modifications are stable — the game engine handles all the edge cases.

3. **The behavioral map is the control surface.** Automated analysis discovers what each memory address does. The Creative Controller uses this map to translate semantic intent ("make enemies slower") into specific writes ("write 0x01 to $0423").

4. **Claude's role is decomposition and semantic mapping.** Claude breaks creative requests into compositions of extracted pieces, selects source authorities, and generates the thematic layer. Claude does not generate raw game output.

5. **Ground truth from real games.** Every parameter value, every behavioral pattern, every structural grammar, every visual constraint is extracted from real games. Nothing is invented from vibes.

6. **Quality floor is the original game.** The worst possible output is a real game running unmodified. Every modification can only add to or transform this baseline, never degrade below it.
