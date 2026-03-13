# Two Fires — Current Status

**Last updated:** 2026-03-13 (Thread 10: Emulator-as-Engine Paradigm Shift)

---

## What Just Happened (Thread 10)

### Paradigm Shift: Emulator as Controllable Game Engine

This session fundamentally changed the project's technical architecture. The previous approach (extract game data into manifests → build custom engine to render from manifests) was replaced by: **run actual game ROMs in an emulator and modify them in real-time through memory writes.**

The shift was motivated by empirical failure: Claude cannot generate pixel art at acceptable quality, and our custom renderer couldn't reproduce extracted game data faithfully. The new approach eliminates both problems by never generating base graphics and never building a custom renderer — the original game runs in the original (emulated) hardware, producing perfect output by definition.

### Experiments Conducted and Results

**Experiment 1: Live Game Modification (SMB in jsnes)**
- ✅ Palette modification at runtime (PPU palette RAM writes)
- ✅ Entity position modification (RAM writes to behavioral map addresses)
- ✅ Entity behavior override (per-frame position write freezes entities)
- ✅ Tile graphics modification (CHR-ROM bypass via direct vramMem writes — major discovery)
- ✅ Game stability maintained through all modifications
- Result: **VIABLE** — emulator-as-engine paradigm validated

**Experiment 2: Hybrid Trace Analyzer (4 games)**
- Built automated game analysis pipeline: run game in jsnes, trace CPU execution, identify all RAM variables and their roles
- ✅ SMB (mapper 0): 662 variables, 180 classified — EXCELLENT
- ✅ Mega Man 2 (mapper 1): 65 variables, 15 classified — SUCCESS (previously 0 with static analysis)
- ✅ Contra (mapper 2): 388 variables, 157 classified — EXCELLENT
- ✅ SMB3 (mapper 4): 233 variables, 106 classified — EXCELLENT
- Result: **Universal mapper support validated** — trace-based analysis works on any game jsnes can run

**Experiment 3: Write-Verify Oracle (causation testing)**
- Refined behavioral maps by testing which variables actually CONTROL behavior (vs merely correlating)
- ✅ SMB: 8 verified player controls
- ✅ Contra: 32 verified controls (51.6% verification rate — excellent)
- ⚠️ MM2: 0 verified (sub-pixel buffering system — needs oracle timing refinement)
- ❌ Speed variables: failed across all games (speed computed indirectly)
- Result: **Partially validated** — works on direct-sprite-control games, needs refinement for buffered systems

**Experiment 4: Browser Demo**
- ✅ SMB running in browser via jsnes with correct colors
- ✅ Five theme preset buttons (Underwater, Lava, Ice, Night, Original) producing instant palette transformations
- ⚠️ API-driven prompt transformation attempted but hit CORS issues (deferred)
- Result: **Core interaction loop proven** — game runs, modifications apply in real-time from external input

### Architecture Developed

**Three-layer architecture:**
1. **Emulator Runtime** — jsnes (NES), future SNES/Genesis equivalents. Runs actual ROM code. Provides perfect fidelity for physics, rendering, audio, entity behavior.
2. **Behavioral Map** — per-game database of "address X controls behavior Y." Built through hybrid trace analysis (CPU execution tracing) + write-verify oracle (causation testing). Automated, zero per-game configuration.
3. **Creative Controller** — Claude's imagination expressed as specific memory writes. CAS state changes → parameter modifications via behavioral map. Novel visuals → tile data writes. Palette shifts, entity behavior modulation, level modifications — all expressed as writes to known addresses.

**Six modification channels identified:**
- Visual (palettes, tiles, sprites, scene composition, effects)
- Mechanical (entity state machines, interactions, boss AI, NPC behavior)
- Physical (gravity, acceleration, friction, jump arc, knockback)
- Structural (level layouts, progression gating, room connectivity)
- Musical (background music, sound effects, audio cues)
- Ludic (win/lose conditions, scoring, power-ups, resource economies)

**Composition heuristics for cross-game content:**
1. Ratio preservation (entity-to-player ratios maintained when transplanting)
2. One source of authority per cluster (physics from one game, combat from one game — never split within a cluster)
3. Constraint inheritance from tightest source (mix NES+SNES → use NES constraints)
4. Claude's creative contribution concentrated in semantic mapping (naming, theming, narrative framing)
5. Validate composition against extracted precedent (do combined values exist in any real game?)
6. Degrade gracefully toward source (when uncertain, fall back to proven game rather than inventing)

**Six parameter clusters that travel together:**
1. Movement feel (gravity, acceleration, friction, jump, air control)
2. Combat system (damage, HP, invincibility frames, knockback, weakness graphs)
3. Level grammar (progression gating, key/lock patterns, teachability arcs)
4. Entity design philosophy (pattern-based vs reactive vs swarm)
5. Audiovisual identity (palettes, tile style, proportions, music, SFX)
6. Rule economy (lives, scoring, currency, power-ups)

**Track B legal pathway identified:**
- "Engine ROM" approach: strip all creative expression from ROM, keep only functional code (physics, collision, rendering pipeline), populate with 100% original content at generation time
- Automatic shift guarantee: no generated game can have identical palettes, layouts, tiles, or physics to any source ROM
- Legal argument: ROM code is functional (not copyrightable expression); all player-facing content is original
- Alternative: homebrew ROMs built as flexible game engines

### Tools Built

| Tool | Purpose | Location |
|------|---------|----------|
| live-mod-experiment.js | Proves live game modification works | tools/ |
| nes-disasm.cjs | 6502 disassembler with recursive descent | tools/ |
| nes-analyzer.cjs | Static code pattern analyzer | tools/ |
| nes-trace-analyzer.cjs | Hybrid trace-based game analyzer (the breakthrough tool) | tools/ |
| verified-behavioral-map.cjs | Write-verify oracle for causation testing | tools/ |
| map-to-mod-test.cjs | Tests behavioral map → live modification pipeline | tools/ |
| simple-demo.html | Browser demo: SMB + palette theme buttons | public/ |
| server.js | Local HTTP server for demo | public/ or root |

### Decisions Made This Session

| # | Decision | Summary |
|---|----------|---------|
| 91 | Emulator-as-engine paradigm | Run actual ROMs in emulator, modify through memory writes — replaces custom engine approach |
| 92 | Hybrid trace analysis for behavioral maps | Run game in emulator, trace CPU execution, classify variables — replaces static disassembly |
| 93 | Write-verify oracle for causal verification | Distinguish control variables from correlated variables through targeted write tests |
| 94 | Three-layer architecture | Emulator Runtime + Behavioral Map + Creative Controller |
| 95 | Six parameter clusters | Movement feel, combat, level grammar, entity philosophy, AV identity, rule economy — clusters travel together, one authority per cluster |
| 96 | Composition heuristics framework | Six heuristics for cross-game content composition (ratio preservation, single authority, etc.) |
| 97 | Track B via engine ROMs | Strip creative expression, keep functional code, populate with original content |
| 98 | Pixel art abandoned, SVG confirmed for novel entities | Claude cannot generate pixel art; SVG constrained by extracted visual identity for novel characters |

---

## Current Repo State

### File Structure
```
giants-drink/
  claude.md                              ← NEEDS UPDATE (this session's architecture)
  tools/
    jsnes-extractor.js                   ← extraction pipeline (Phases 1-4, from Sessions 10-18)
    live-mod-experiment.js               ← NEW: live modification proof
    nes-disasm.cjs                       ← NEW: 6502 disassembler
    nes-analyzer.cjs                     ← NEW: static code analyzer
    nes-trace-analyzer.cjs               ← NEW: hybrid trace analyzer (key tool)
    verified-behavioral-map.cjs          ← NEW: write-verify oracle
    map-to-mod-test.cjs                  ← NEW: behavioral map → live mod test
    [other existing tools from Sessions 8-18]
  public/
    simple-demo.html                     ← NEW: browser demo with palette themes
    demo.html                            ← earlier demo version (API integration, broken)
  experiment-output/
    smb-behavioral-map.json              ← SMB static analysis output
    trace-*.json                         ← trace analysis outputs (4 games)
    verified-map-*.json                  ← verified behavioral maps (3 games)
    *.ppm                                ← experiment screenshots (~15 files)
  analysis-output/
    disasm-smb.json                      ← SMB disassembly
    analysis-smb.json                    ← SMB code analysis
    summary-smb.txt                      ← human-readable analysis summary
  docs/
    current-status.md                    ← THIS FILE (needs update)
    decisions-log.md                     ← NEEDS UPDATE (decisions 91-98)
    design/
      manifest-architecture-spec.md      ← from Sessions 10-18 (still valid as behavioral map format reference)
      universal-extraction-spec.md       ← extraction pipeline spec
      [other design docs]
```

---

## What's Next

### Immediate: Solidify the Browser Demo
1. Add tile replacement to theme buttons (not just palettes — actual texture changes)
2. Set up Node.js proxy for Anthropic API calls (CORS workaround)
3. Add Claude-driven prompt → modification pipeline
4. Test on multiple prompts to evaluate modification quality

### Near-term: Complete Behavioral Map Validation
1. Fix MM2 oracle failure (extend oracle timing window for sub-pixel systems)
2. Add speed variable detection (indirect speed computation handling)
3. Test automated pipeline on 20+ diverse NES games
4. Batch-process behavioral maps for full NES library

### Near-term: Visual Reskin Test
1. Replace multiple tiles simultaneously (full theme, not single tile)
2. Test SVG → tile rasterization pipeline for novel entity graphics
3. Validate that mass tile replacement doesn't break game stability

### Medium-term: CAS Integration
1. Map CAS state changes to behavioral map writes
2. Test: "faction demoralized" → enemy speed reduction, palette desaturation
3. Test: paradigm shift → ROM swap with entity state serialization

### Medium-term: Track B Prototype
1. Build one "engine ROM" (stripped platformer)
2. Populate it entirely through modification pipeline
3. Evaluate: does it feel like a real game?

### Longer-term: SNES/Genesis
1. Identify equivalent JS emulators with memory access APIs
2. Port trace analyzer approach to SNES (65816 CPU)
3. Validate live modification on SNES titles

---

## Key Open Questions

1. Can the behavioral map get complete enough for diverse games? (MM2 failure, speed variables)
2. Does visual reskinning at scale look coherent? (many tiles replaced simultaneously)
3. Can novel entities be injected into running games? (new sprites in unused OAM slots)
4. Does the prompt → modification quality meet the bar? (Claude generating good themed modifications)
5. Can "engine ROMs" deliver recognizable game-feel without original creative content?
6. How does this architecture extend to SNES/Genesis platforms?
