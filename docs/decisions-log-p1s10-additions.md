# Decisions Log — Session 10 Additions

**Instruction:** Append these decisions to the existing `docs/decisions-log.md`.

---

## Session: 2026-03-09 — Phase 1 Session 10 (Universal Extraction Architecture)

### Decision 83: RAM Mutation Content Enumerator Replaces Chaos Player

**Context:** Decision 77 specified a multi-strategy chaos player for automated game exploration — a Lua script that plays the game using heuristic exploration, recording inputs for deterministic replay. Sessions 9-10 revealed this approach is fragile: each game requires different frame timings, button press sequences, and boot navigation. Two games (MM2, Castlevania) each needed debugging to render correctly. Scaling to 1,600+ games with per-game tuning is infeasible.

**Decision:** Replace the chaos player with a RAM mutation content enumerator. Instead of playing the game, the system:
1. Boots to first gameplay state (press Start at intervals, detect gameplay via OAM/nametable density)
2. Identifies candidate RAM addresses (volatile bytes that change occasionally, not every frame)
3. Systematically writes every value (0-255) to each candidate address, observing VRAM changes and mapper bank switches
4. Addresses that cause VRAM to change significantly or trigger mapper bank switches are content-switching variables (level ID, room ID, game phase)
5. All values of content variables are enumerated with full state capture at each

Estimated time: ~3 minutes per game. Zero per-game configuration. 100% generalizable.

**Rationale:** NES/SNES games store current level/room as RAM variables. The hardware mandates that changing these variables causes the engine to load different tile data into VRAM. The mutation sweep exploits this hardware-level guarantee — it finds content-switching variables without knowing their addresses. This is a property of the architecture, not a convention games might violate. The approach captures content that even a thorough chaos player would miss (secret levels, late-game content accessible only via specific progression).

### Decision 84: Unified Engine with Configurable Rendering Modes Replaces 7 Separate Clusters

**Context:** Build plan v4 (Decision 71) called for 7 separate engine clusters across 16-18 sessions. The manifest-based extraction approach changes the engine's job from "generate and render paradigm content" to "load manifest data and render it." Analysis revealed that rendering differences between paradigms reduce to camera behavior, physics direction, collision response, input mapping, and draw technique — configurable parameters, not fundamentally different code.

**Decision:** Build one engine with shared core (~80% of code: tile/sprite rendering, entity system, collision, input abstraction, CAS integration, game state management) and 7 swappable rendering modes (~20%): tile_2d_sideview, tile_2d_topdown, stage_arena, scrolling_shooter, pseudo_3d, raycast_3d, strategic_map. Rendering modes are hot-swappable at runtime for CAS-driven paradigm shifts.

**Rationale:** Reduces Phase 1 from ~16-18 sessions to ~8 sessions. Makes paradigm shifts (Thread 8 principles) a rendering mode swap rather than a whole-engine restart. The shared entity system, collision, and CAS integration mean that entity state, social graphs, and narrative carry over during shifts by default — no special crosswalk code needed for the 80% that's shared.

### Decision 85: Manifest as Ingredient Library, Game State Schema Unchanged

**Context:** Extraction manifests contain complete game data (visual, structural, mechanical). The manifest format could potentially replace the existing game state schema, simplifying the architecture.

**Decision:** Manifests are an ingredient library that populates the game state schema. They do not replace it. Manifest data populates: `episode` (content: tiles, layouts, physics, entity placements), `meta` (game identity, paradigm type), and `world.entities[].behavioral_parameters` (from extracted enemy behaviors). The `world.factions`, `cas`, `player`, `overseer`, and `diagnostics` blocks remain Claude-generated/runtime-managed and are NOT sourced from manifests.

**Rationale:** The game state schema was designed to hold both extracted and generated content. The CAS social ecology, faction dynamics, entity personalities (OCEAN), knowledge systems, reputation, and Overseer — the core of what makes Two Fires special — are creative/runtime constructs that emerge from Claude's interpretation layer and CAS evolution, not from ROM data. Keeping the manifest as an ingredient library preserves full creative flexibility: a game can use 100% manifest data (exact reproduction), 0% (fully generated), or any blend. The schema doesn't need to change because it was already designed as a paradigm-independent container.

### Decision 86: Extraction Scope Expanded to ~1,605 Games

**Context:** Decision 79 scoped extraction at ~820 games, limited by the assumed per-game engineering effort of the chaos player approach. The RAM mutation approach reduces per-game cost to ~3 minutes compute + ~$0.03 API.

**Decision:** Extract all US-licensed NES titles (~680), all US-licensed SNES titles (~725), top 100 Genesis titles, 50 hand-picked arcade titles (deduplicated against console versions), and 50 PC titles (FPS/RTS/sim canon). Total ~1,605 games.

**Rationale:** Completeness is a product feature — never saying "sorry, we don't have that game." Marginal cost is negligible (~$30 additional API, ~5 hours additional compute). Larger library provides richer distributional knowledge for Track B generation. Every additional extracted game is a potential composition ingredient for the creative layer.
