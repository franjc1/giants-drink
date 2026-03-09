## Session: 2026-03-09 — Phase 1 Session 7 (Asset Pipeline Strategic Pivot: ROM Extraction)

### Decision 76: ROM Extraction Replaces TSR Sheet Pipeline

**Context:** Session 6 built a four-script pipeline (sheet name enrichment, programmatic analysis, music analysis, vision tagging) to process 55K sprite sheets scraped from The Spriters Resource. Session 7 investigation revealed fundamental problems: TSR sheets are community-assembled composites with colored backgrounds, text labels baked in, irregular layouts, and incomplete coverage (Mega Man 2 had only 18 of ~30+ available sheets, and 4 of 8 robot masters). No single sprite had been cleanly extracted and rendered in the game engine end-to-end. The ceiling for this approach was "vaguely recognizable sprites at wrong sizes" — firmly in slop territory, well below the fidelity bar Two Fires requires.

**Decision:** ROM-based extraction replaces TSR sheet extraction as the primary asset pipeline. Three extraction methods cover different game categories:

1. **NES CHR-ROM bulk extraction** — parse iNES headers, extract uncompressed tile data directly from ROM files. Covers ~450 NES games with zero per-game effort. A single script processes the entire library.

2. **Universal Extractor** — emulator instrumentation via Lua scripting (FCEUX for NES, bsnes/RetroArch for SNES, MAME for arcade, Genesis emulator for Genesis). Two-pass architecture: Pass 1 generates an automated exploration TAS per game using a multi-strategy chaos player with level-select codes; Pass 2 replays with full instrumentation capturing RAM state, VRAM tiles, nametable layouts, palettes, and OAM sprite assemblies. Covers all platforms.

3. **Community tool extraction** — dedicated editors (Lunar Magic, SMILE, Temporal Flux, etc.) for the ~25-30 top titles where these tools provide richer structural data (level objects, enemy placements, sprite behavior properties) beyond what VRAM capture alone provides.

The TSR sheets, music catalog, and Phase 0.5 ground truth library are retained as supplementary data. The vision tagger pipeline is deprecated.

**Rationale:** ROM data IS the game — identical pixels to what the hardware displayed. TSR sheets are community reconstructions with inherent quality loss. For Track A (pixel-perfect reproduction), only ROM data hits the bar. For Track B (generation from distributional knowledge), clean ROM-extracted data produces dramatically more accurate statistical models than noisy composite sheets. The extraction tooling is a front-loaded engineering investment (4-6 sessions across platforms) that pays off across every subsequent phase.

---

### Decision 77: Universal Extractor Architecture — Two-Pass Automated Exploration + Instrumented Extraction

**Context:** ROM extraction requires the game to actually RUN to capture VRAM contents, sprite assemblies, and memory state. This raises the question: how do we get the game into all the states we need to capture? Options: rely on pre-existing TAS (Tool-Assisted Speedrun) recordings (limited availability), manual play-through (doesn't scale), or automated exploration.

**Decision:** The Universal Extractor uses a two-pass architecture:

**Pass 1 (Exploration):** A Lua script inside the emulator plays the game using multi-strategy automated exploration. The chaos player uses exploration heuristics (seek unvisited screens, bias toward unexplored directions, try different button combinations when stuck). Multiple strategies run per game: forward explorer, backward explorer, door/entrance explorer, and level-select code jumps. Game Genie / Action Replay infinite-lives codes are applied to prevent game-over interruption. All inputs are recorded frame-by-frame, producing a custom TAS file per game. Multiple exploration runs are merged for maximum state space coverage.

**Pass 2 (Extraction):** The generated TAS is replayed in the emulator with full instrumentation active: complete RAM snapshots per frame, VRAM tile data capture, PPU nametable recording (for level layout reconstruction), palette RAM capture, OAM sprite table logging. Because emulation is deterministic, the replay is identical to the exploration run. The instrumentation captures everything the game displayed during the exploration.

This architecture eliminates the TAS file availability bottleneck entirely. No manual play required. No per-game human effort. The orchestrator runs multiple emulator instances in parallel for throughput.

**Rationale:** Pre-existing TAS files only exist for ~300 NES games and fewer SNES titles. Manual play-through doesn't scale to 800+ games. The automated chaos player with level-select codes achieves broad game state coverage without any per-game human effort. The two-pass separation allows the exploration to be lightweight and experimental while the extraction pass is thorough and deterministic. Multiple exploration strategies merged together approach the coverage of a human TAS for most games.

---

### Decision 78: Three Categories of Ground Truth — Visual, Structural, Mechanical

**Context:** The original asset pipeline focused exclusively on visual assets (sprite images). Investigation revealed that "high fidelity reproduction" requires not just sprites but also level layouts (structural) and gameplay parameters like physics, enemy behavior, and item effects (mechanical). Without mechanical ground truth, the system falls back to "vibes" — Claude improvising what it thinks a game plays like rather than using the actual parameters. Vibes = slop; ground truth = gold.

**Decision:** Every game extraction produces three categories of ground truth data:

1. **Visual ground truth:** Tile sheets, individual sprite frames, palettes, background graphics. Source: CHR-ROM parsing (NES bulk), VRAM capture during Universal Extractor runs, community tool export. Fidelity: pixel-perfect (literally the ROM data).

2. **Structural ground truth:** Level layouts as tile-index grids, enemy placement positions, item locations, room connections, track maps. Source: PPU nametable reconstruction during Universal Extractor playthrough (captures scrolling level layout), community tools for top titles (provide object-level data beyond raw tiles). Fidelity: complete for areas visited during extraction; supplemented by community tools for top titles.

3. **Mechanical ground truth:** Player physics (gravity, speed, jump velocity), enemy behavior parameters (HP, damage, patrol patterns, attack timing, state machines), item/power-up effects (duration, magnitude), ability definitions (input sequences, projectile properties, frame data), and difficulty curves. Source: automated RAM state analysis during Universal Extractor runs (diff consecutive RAM snapshots to identify game variables and their values), supplemented by community documentation (FGC wikis, ROM hacking databases, game-specific disassemblies). Fidelity: Tier 1 (exact ROM values) for parameters observed during extraction; Tier 2 (community-documented) for complex conditional behaviors.

All three categories are stored in a per-game `manifest.json` with standardized schema, making the entire library a queryable database. The Designer agent composes games by querying across manifests: "Give me Mega Man 2's physics, Castlevania's enemy behavior patterns, and Super Mario World's visual aesthetic."

**Rationale:** Visual fidelity alone produces "looks right but plays wrong." Mechanical fidelity alone (which the Phase 0.5 physics data partially provided) produces "plays right but looks wrong." Structural fidelity alone produces "structured right but empty." All three together produce "this IS the game, recombined." The automated RAM analysis approach (memory state diffing correlated with gameplay events) is feasible because retro consoles have small RAM (NES: 2KB, SNES: 128KB) and consistent memory patterns across games from the same era and developer. The extraction infrastructure for all three categories shares the same emulator instrumentation — capturing RAM + VRAM + nametables in one pass.

---

### Decision 79: Extraction Scope — ~820 Games Across Five Platforms

**Context:** The original TSR scrape covered 55K sheets across ~6,700 games — broad but shallow (composite sheets, no mechanical data, questionable fidelity). The ROM extraction approach trades breadth for depth — fewer games but pixel-perfect fidelity with mechanical parameters. The question: how many games and which ones?

**Decision:** Target ~820 games across five platforms:

- **NES: ~550 games** — ~450 via CHR-ROM bulk extraction (automated, minutes for entire library) + ~100 priority CHR-RAM titles via Universal Extractor. Covers virtually every notable NES game.
- **SNES: ~200 games** — ~25 via community tools (SMW, ALttP, Super Metroid, Chrono Trigger, FF4-6, EarthBound, Mega Man X 1-3, DKC 1-3, etc.) + ~175 via Universal Extractor (F-Zero, Mario Kart, Turtles in Time, Street Fighter II, Mortal Kombat, and the broader library). Covers every major SNES title.
- **Arcade: ~30 games** — via MAME Universal Extractor. Simpsons Arcade, TMNT, X-Men, CPS1/CPS2 fighters, Metal Slug, classics (Pac-Man, Galaga). De-duplicated against NES/SNES versions.
- **Genesis: ~20 games** — via Genesis Universal Extractor. Sonic 1-3, Streets of Rage, Phantasy Star, Shining Force, Gunstar Heroes. Only titles not better represented on other platforms.
- **PC: ~20 games** — via existing extraction tools (WadExt for Doom engine, Wolf3DExtract for Wolf3D, Build engine tools for Duke3D, documented archive formats for Warcraft/StarCraft/C&C/X-COM/SimCity/RCT). Covers FPS, RTS, and simulation genres.

This scope covers an estimated 80-90% of games anyone would request by name, with pixel-perfect visual fidelity and Tier 1-2 mechanical fidelity. The remaining 10-20% (obscure titles) can be extracted on-demand or fall back to genre-knowledge defaults supplemented by TSR sheet data.

**Rationale:** The per-game extraction cost is dominated by the one-time pipeline build, not per-game effort. Once the Universal Extractor exists, each additional game costs ~1-2 minutes of compute time. The scope limit is primarily about which games matter for Two Fires' coverage, not engineering cost. NES gets the deepest coverage because the extraction is cheapest and the library defines the retro gaming canon. SNES gets the second-deepest because it's the other pillar of the SNES Comfort Model. Genesis, arcade, and PC fill important genre gaps (Sonic-style platformers, arcade beat-em-ups, FPS/RTS) without redundant coverage.
