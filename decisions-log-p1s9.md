## Session: 2026-03-09 — Phase 1 Session 7 (Asset Pipeline Strategic Pivot: ROM Extraction)

### Decision 76: ROM Extraction Replaces TSR Sheet Pipeline

**Context:** Session 6 built a four-script pipeline (sheet name enrichment, programmatic analysis, music analysis, vision tagging) to process 55K sprite sheets scraped from The Spriters Resource. Session 7 investigation revealed fundamental problems: TSR sheets are community-assembled composites with colored backgrounds, text labels baked in, irregular layouts, and incomplete coverage (Mega Man 2 had only 18 of ~30+ available sheets, and 4 of 8 robot masters). No single sprite had been cleanly extracted and rendered in the game engine end-to-end. The ceiling for this approach was "vaguely recognizable sprites at wrong sizes" — firmly in slop territory, well below the fidelity bar Two Fires requires.

**Decision:** ROM-based extraction replaces TSR sheet extraction as the primary asset pipeline. Three extraction methods cover different game categories:

1. **NES CHR-ROM bulk extraction** — parse iNES headers, extract uncompressed tile data directly from ROM files. Covers ~450 NES games with zero per-game effort. A single script processes the entire library.

2. **Universal Extractor** — emulator instrumentation via Lua scripting. Two-pass architecture: Pass 1 generates an automated exploration TAS per game using a multi-strategy chaos player with level-select codes; Pass 2 replays with full instrumentation capturing RAM state, VRAM tiles, nametable layouts, palettes, and OAM sprite assemblies. Covers all platforms.

3. **Community tool extraction** — dedicated editors (Lunar Magic, SMILE, Temporal Flux, etc.) for the ~25-30 top titles where these tools provide richer structural data (level objects, enemy placements, sprite behavior properties) beyond what VRAM capture alone provides.

The TSR sheets, music catalog, and Phase 0.5 ground truth library are retained as supplementary data. The vision tagger pipeline is deprecated.

**Rationale:** ROM data IS the game — identical pixels to what the hardware displayed. TSR sheets are community reconstructions with inherent quality loss. For Track A (pixel-perfect reproduction), only ROM data hits the bar. For Track B (generation from distributional knowledge), clean ROM-extracted data produces dramatically more accurate statistical models than noisy composite sheets. The extraction tooling is a front-loaded engineering investment (4-6 sessions across platforms) that pays off across every subsequent phase.

---

### Decision 77: Universal Extractor Architecture — Two-Pass Automated Exploration + Instrumented Extraction

**Context:** ROM extraction requires the game to actually RUN to capture VRAM contents, sprite assemblies, and memory state. This raises the question: how do we get the game into all the states we need to capture? Options: rely on pre-existing TAS recordings (limited availability), manual play-through (doesn't scale), or automated exploration.

**Decision:** The Universal Extractor uses a two-pass architecture:

**Pass 1 (Exploration):** A Lua script inside the emulator plays the game using multi-strategy automated exploration. The chaos player uses exploration heuristics (seek unvisited screens, bias toward unexplored directions, try different button combinations when stuck). Multiple strategies run per game. Game Genie / Action Replay infinite-lives codes are applied to prevent game-over interruption. All inputs are recorded frame-by-frame, producing a custom TAS file per game.

**Pass 2 (Extraction):** The generated TAS is replayed in the emulator with full instrumentation active: complete RAM snapshots per frame, VRAM tile data capture, PPU nametable recording, palette RAM capture, OAM sprite table logging. Because emulation is deterministic, the replay is identical to the exploration run.

**Rationale:** Pre-existing TAS files only exist for ~300 NES games and fewer SNES titles. Manual play-through doesn't scale to 800+ games. The two-pass separation allows the exploration to be lightweight and experimental while the extraction pass is thorough and deterministic.

---

### Decision 78: Three Categories of Ground Truth — Visual, Structural, Mechanical

**Context:** The original asset pipeline focused exclusively on visual assets (sprite images). Investigation revealed that "high fidelity reproduction" requires not just sprites but also level layouts (structural) and gameplay parameters like physics, enemy behavior, and item effects (mechanical). Without mechanical ground truth, the system falls back to "vibes." Vibes = slop; ground truth = gold.

**Decision:** Every game extraction produces three categories of ground truth data:

1. **Visual ground truth:** Tile sheets, individual sprite frames, palettes, background graphics.
2. **Structural ground truth:** Level layouts as tile-index grids, enemy placement positions, item locations, room connections.
3. **Mechanical ground truth:** Player physics, enemy behavior parameters, item/power-up effects, ability definitions, difficulty curves.

All three categories are stored in a per-game `manifest.json` with standardized schema, making the entire library a queryable database.

**Rationale:** Visual fidelity alone produces "looks right but plays wrong." Mechanical fidelity alone produces "plays right but looks wrong." Structural fidelity alone produces "structured right but empty." All three together produce "this IS the game, recombined."

---

### Decision 79: Extraction Scope — ~820 Games Across Five Platforms

**Context:** The ROM extraction approach trades breadth for depth — fewer games but pixel-perfect fidelity with mechanical parameters.

**Decision:** Target ~820 games: NES ~550, SNES ~200, Arcade ~30, Genesis ~20, PC ~20. This covers an estimated 80-90% of games anyone would request by name.

**Rationale:** The per-game extraction cost is dominated by the one-time pipeline build, not per-game effort. Once the Universal Extractor exists, each additional game costs ~1-2 minutes of compute time.

---

## Session: 2026-03-09 — Phase 1 Sessions 8-9 (CHR-ROM Extraction + Mesen2 Proof-of-Concept)

### Decision 80: Mesen2 Replaces FCEUX as Universal Extractor Emulator

**Context:** Decision 77 originally specified FCEUX as the NES emulator for the Universal Extractor. Session 9 research revealed problems: FCEUX's macOS SDL port has a known buffer overflow bug with the `--loadlua` command-line flag (GitHub issue #413), making headless Lua scripting unreliable. FCEUX's documentation and tooling are Windows-centric.

**Decision:** Mesen2 replaces FCEUX as the emulator for all Universal Extractor work. Key advantages:

- **Headless CLI mode** via `--testrunner` flag — runs at maximum speed with no GUI, loads a ROM and Lua script, executes until `emu.stop()` is called
- **Multi-system emulation** — NES, SNES, Game Boy, GBA, PC Engine, SMS/Game Gear in a single application, eliminating the need for separate emulators per platform
- **Rich Lua API** — `emu.read(address, memType)` for CPU memory, PPU memory, CHR ROM/RAM, PRG ROM/RAM, OAM, palette RAM; `emu.getState()` for full emulator state; event callbacks for frame boundaries
- **Active maintenance** and native macOS support

Decision 77's two-pass architecture remains unchanged — only the emulator platform changes.

**Rationale:** The `--testrunner` headless mode is the critical feature for batch-processing 800+ games. Mesen2's multi-system support means the SNES Universal Extractor can use the same Lua API and orchestrator code as the NES extractor, dramatically reducing engineering effort.

---

### Decision 81: Stdout-Based Data Capture for Mesen2 Lua Extraction

**Context:** Mesen2's Lua sandbox strips the standard `io` and `os` libraries. Lua scripts cannot open files, write to disk, or access the filesystem. The extraction script needs to output captured PPU data (several KB of binary data) to the host system.

**Decision:** Extraction data is hex-encoded and printed to stdout via Lua's `print()` function. The Node.js orchestrator spawns Mesen2 as a child process, captures stdout, and parses hex-encoded `DATA_*` lines into binary buffers. Protocol: `DATA_<type>:<hex_string>`.

**Rationale:** `print()` works in headless mode (stdout captured by parent process). Simpler than the LuaSocket alternative (also built into Mesen2). Data volume is small enough that hex encoding overhead is negligible.

---

### Decision 82: PPUCTRL-Aware CHR Bank Selection in Screen Rendering

**Context:** Initial SMB screen render had backgrounds and sprites swapped. NES PPUCTRL register ($2000) bit 4 determines which CHR pattern table is used for background tiles. SMB sets PPUCTRL=$90 (backgrounds at CHR $1000, sprites at $0000) — opposite of the naive assumption hardcoded in the renderer.

**Decision:** The extraction script captures the current PPUCTRL register value as part of the PPU state dump. The renderer reads PPUCTRL bit 4 to determine correct CHR bank assignments. This is a per-game, per-frame value.

**Rationale:** Any NES renderer that doesn't respect PPUCTRL will produce incorrect output for roughly half of all NES games. The same principle applies to other PPU configuration bits (sprite size, nametable mirroring, etc.) which should also be captured during extraction.

---

### Correction: Castlevania and DuckTales Reclassified as CHR-RAM

**Context:** The ROM extraction strategy doc listed Castlevania as "MMC1, 128k CHR" and DuckTales as "MMC1, 128k CHR" in the CHR-ROM section. Session 8's bulk extractor read the actual iNES header byte 5 and determined both have CHR-ROM size = 0, meaning they use CHR-RAM (UNROM Mapper 2, tiles loaded from compressed PRG-ROM at runtime).

**Action:** Both games moved to the Universal Extractor target list. Strategy doc should be corrected. This validates the principle that ROM headers are ground truth — secondary sources about mapper assignments may be incorrect.
