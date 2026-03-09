# Two Fires — Current Status

**Last updated:** 2026-03-09 (Phase 0.5, Sessions 8-9)

---

## What Just Happened (Session 7)

### Strategic pivot: ROM extraction replaces TSR sprite sheet pipeline

This session was a deep investigation and strategic redesign of the entire asset pipeline. The conclusion: the TSR sprite sheet approach (55K scraped composite sheets → vision tagging → bounding box extraction) cannot hit the fidelity bar Two Fires requires. The replacement: direct ROM extraction producing pixel-perfect visual assets, reconstructed level layouts, and automated mechanical parameter extraction.

**The problem identified:**
- TSR sheets are community-assembled composites with text labels baked in, colored backgrounds, irregular layouts, missing coverage (~50% of MM2's sheets were missing)
- Vision tagger bounding boxes were never validated end-to-end — no single sprite had been cleanly extracted and rendered
- The approach ceiling was "vaguely recognizable sprites at wrong sizes" — firmly in slop territory
- This was insufficient for both Track A (needs pixel-perfect reproduction) and Track B (needs precise distributional knowledge from clean source data)

**The replacement architecture — Universal Extractor:**
- Direct ROM extraction using emulator instrumentation (FCEUX Lua scripting for NES, bsnes/RetroArch for SNES, MAME Lua for arcade)
- Two-pass approach: Pass 1 generates an automated exploration TAS per game (multi-strategy chaos player with level-select codes), Pass 2 replays with full instrumentation (RAM logging, VRAM capture, nametable recording, palette capture, OAM logging)
- Produces three categories of ground truth per game: visual assets (tiles, sprites, palettes), structural data (level layouts from nametable reconstruction), and mechanical data (physics parameters, enemy behavior, item effects, ability definitions from RAM state analysis)
- Supplemented by community tool extraction for top ~25-30 titles where dedicated editors exist (Lunar Magic for SMW, SMILE for Super Metroid, etc.)

**Scope:**
- ~550 NES games (~450 CHR-ROM bulk extraction + ~100 CHR-RAM via Universal Extractor)
- ~200 SNES games (community tools for top ~25, Universal Extractor for remaining ~175)
- ~30 arcade games (via MAME Universal Extractor)
- ~20 Genesis games (via Genesis Universal Extractor)
- ~20 PC games (Doom WAD extraction, Wolf3D, Build engine, RTS archives)
- **Total: ~820 games at pixel-perfect fidelity for visuals, Tier 1-2 for mechanics**

**Fidelity guarantee:** ROM-extracted data IS the game — identical pixels to what the hardware displayed. When someone asks for "Mega Man 2 but in Super Mario World universe," the system serves MM2's actual level structures with SMW's actual sprites, at perfect fidelity. The only creative element is the combination, which is what Two Fires' intelligence layer is designed to do.

**What stays from the old pipeline:**
- Cloudflare R2 as asset storage (Decision 73 — still valid, new data is ~500MB-1GB vs old 15-20GB)
- Music catalog (Decision 75 — untouched, already good)
- Asset Resolver Track A/B toggle architecture (still valid, different data source)
- Phase 0.5 ground truth library (physics data for ~1,300 games — still valid, supplemented by new mechanical extraction)
- TSR sheets retained as supplementary reference for Track B distributional knowledge

**What gets deprecated:**
- Vision tagger pipeline (tag-sprites.js) — no longer needed
- TSR-based asset-catalog.json as primary asset source — replaced by ROM extraction manifests
- The four-script enrichment pipeline (enrich-sheet-names.js, analyze-sprites.js, analyze-music.js, tag-sprites.js) — analyze-music.js stays, others deprecated

---

## What Just Happened (Sessions 8-9)

### Session 8 — NES CHR-ROM Bulk Extractor (COMPLETED)

Built `tools/extract-chr-rom.js` — Node.js ESM script that:
- Parses iNES headers from any NES ROM (16-byte header: magic, PRG banks, CHR banks, mapper, flags)
- Extracts CHR-ROM tile data (2bpp NES format) and decodes to grayscale PNG tile sheets
- Runs on entire ROM library: 3,146 ROMs scanned, 2,383 CHR-ROM extracted, 763 CHR-RAM skipped, 0 errors
- Output per game: `~/nes-extracted/{slug}/tiles.png` + `manifest.json`
- 15,790,592 total tiles extracted

Key correction: Strategy doc listed Castlevania I and DuckTales as "MMC1 128k CHR" — both are CHR-RAM (Mapper 2/UNROM, byte 5 = 0). Fixed in spot-check.

### Session 9 — Mesen2 Headless Extraction + Screen Renderer (COMPLETED)

Pivoted from FCEUX to **Mesen2** (better headless support via `--testrunner` flag). Discovered Mesen2's Lua environment strips `io` and `os` libraries — output via `print()` to stdout instead. Built complete proof-of-concept pipeline:

**`tools/mesen-extract.lua`** — runs inside Mesen2 headless:
- Simulates Start button press at frame 80 to skip title screen
- At frame 600 (~10 seconds = World 1-1 gameplay): reads PPU state
- Outputs hex-encoded data lines to stdout: `DATA_PALETTE`, `DATA_NAMETABLE`, `DATA_OAM`, `DATA_CHR`, `DATA_PNG`
- Also calls `emu.takeScreenshot()` for a Mesen-rendered reference image

**`tools/render-screen.js`** — Node.js orchestrator + renderer:
- Spawns Mesen2 headless, captures stdout DATA_* lines
- Decodes hex → raw byte arrays, saves JSON files to `~/nes-extracted/smb-capture/`
- Renders 256×240 NES screen PNG using sharp + NES master palette from `data/ground-truth/palettes/nes-palette.json`
- Correct NES 2bpp pipeline: nametable tile index → attribute palette → CHR tile decode → palette lookup → RGB

**Key discovery — pattern table:** SMB1 uses PPUCTRL=$90 (BG at $1000, sprites at $0000) — opposite of assumed. Fixed: `BG_PATTERN_TABLE = 0x1000`, `SPRITE_PATTERN_TABLE = 0x0000`. The rendered screen matches Mesen's reference exactly (World 1-1, correct colors/tiles/HUD/sprites).

**Outputs at `~/nes-extracted/smb-capture/`:**
- `mesen-reference.png` — Mesen2's rendered screenshot (ground truth)
- `screen.png` — Our NES renderer output (matches reference)
- `palette.json`, `nametable.json`, `oam.json`, `chr.json`

---

## Current Repo State

### File Structure
```
giants-drink/
  claude.md                          ← Needs update for ROM extraction strategy
  src/
    asset-resolver.js                ← Needs update to read ROM extraction manifests
    game-loop.js, renderer.js, etc.  ← Unchanged
  data/
    test-fixtures/
      episode1.json, episode2.json   ← Unchanged
    ground-truth/                    ← Phase 0.5 ingestion (~37MB JSON/text)
    assets/
      sprites/                       ← [local only, gitignored] TSR sheets (kept as reference)
      music/                         ← [local only, gitignored] chiptune files
      asset-catalog.json             ← [local + R2, gitignored] TSR catalog (deprecated as primary)
      music-catalog.json             ← Committed, still valid
  tools/
    extract-chr-rom.js               ← Session 8: bulk CHR-ROM extractor
    mesen-extract.lua                ← Session 9: Mesen2 headless PPU extraction
    render-screen.js                 ← Session 9: NES screen renderer (Node.js + sharp)
    test-chr-parser.cjs              ← Session 8: 20 unit tests for iNES parser
  docs/
    current-status.md                ← THIS FILE
    decisions-log.md                 ← Updated with Decisions 76-79
    design/
      rom-extraction-strategy.md     ← Comprehensive strategy doc
      (other design docs unchanged)
```

### Local Data (not committed)
- `~/nes-extracted/` — 2,383 CHR-ROM tile PNGs + manifests (Session 8 output)
- `~/nes-extracted/smb-capture/` — SMB1 PPU state + rendered screens (Session 9 output)
- `~/nes-roms/` — No-Intro NES ROM set (3,146 ROMs)
- `~/mesen2/` — Mesen2 2.1.1 ARM64 macOS build

### Deployed
- Vercel: two-fixture platformer (unchanged)
- Cloudflare R2: TSR catalog + partial sprites (will be supplemented with ROM extraction data)

---

## What's Next

### Immediate: Session 10 — NES Universal Extractor v1 (Batch Mode)
Session 9 proved the single-game proof-of-concept works. Session 10 builds the batch extraction pipeline:
1. Extend `mesen-extract.lua` to support a configurable `CAPTURE_FRAME` and input sequence
2. Build Node.js batch orchestrator that runs Mesen2 on multiple games (priority: CHR-RAM games that need emulator capture)
3. Handle PPUCTRL detection properly (either via Mesen `getState()`, or read the game's PPUCTRL shadow copy from known RAM addresses)
4. For each extracted game: save palette.json, nametable.json, oam.json, chr.json, screen.png
5. Test on 5 CHR-RAM games (Castlevania, DuckTales, Contra, Bionic Commando, Batman)

### Following: Sessions 11-12 — SMW Community Tool Extraction + SNES Universal Extractor
1. Extract SMW via Lunar Magic or custom LC_LZ2 decompressor (visual + structural + mechanical)
2. Port Universal Extractor concepts to SNES emulator scripting
3. **Key milestone:** render actual Yoshi's Island 1 in our engine with correct tiles, enemies, and layout

### Then: Sessions 12+ — Scale and Resume Engine Work
1. Run Universal Extractor on full NES library (background compute)
2. Run on SNES library (background compute)
3. Resume Phase 1 engine cluster work with real ROM-extracted assets
4. Community tool extractions for top titles (parallel track)
5. PC game extractions (low effort, high payoff, whenever convenient)
6. Arcade + Genesis extractions

### Ongoing: Mechanical Data Ingestion
- For each game extracted, also ingest available community documentation for mechanical parameters
- Supplement automated RAM analysis with frame data from FGC wikis, ROM hacking docs, etc.
- Build mechanical manifest JSON alongside visual extraction

---

## Key Decisions / Discoveries (Sessions 8-9)

- **Decision 76-79:** ROM extraction strategy (from Session 7 — see decisions-log.md)
- **Session 8:** CHR-ROM extractor confirmed: 763 of 3,146 NES ROMs are CHR-RAM (need emulator capture)
- **Session 9:** Pivoted from FCEUX to Mesen2 for emulator capture. Key finding: Mesen2 Lua strips `io`/`os` but `print()` goes to stdout. Pattern table discovery: SMB1 BG=$1000, sprites=$0000.

---

## Key Open Questions

1. ~~Cloud storage~~ → R2 stays (RESOLVED)
2. ~~Asset fidelity approach~~ → ROM extraction (RESOLVED)
3. ~~NES emulator scripting~~ → Mesen2 `--testrunner` + print() to stdout (RESOLVED Session 9)
4. PPUCTRL detection in Mesen2 — `nesPpuDebug` address 0 ≠ PPUCTRL; need correct address mapping or alternative (open)
5. SNES emulator scripting — Mesen2 also supports SNES via `--testrunner` (same approach should work)
6. Game Genie / level-select code database — need for batch extraction across many games
7. Lunar Magic on macOS — may need Wine or alternative approach for SMW extraction
8. Physics fidelity — current engine values are from ROM data but feel doesn't match 1:1 yet (ongoing)
9. Meta-game specification — flagged as needing its own thread (Decision 70, unchanged)
10. API key rotation — Joe's Anthropic key was exposed in Session 6 chat, still needs rotation
