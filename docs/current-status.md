# Two Fires — Current Status

**Last updated:** 2026-03-09 (Phase 1, Sessions 8-9)

---

## What Just Happened (Sessions 8-9)

### Session 8: NES CHR-ROM Bulk Extraction — Complete

Built and ran the NES CHR-ROM bulk extractor (`tools/extract-chr-rom.js`). Results:

- **3,146 ROMs scanned** from the full No-Intro NES library (downloaded from archive.org)
- **2,383 CHR-ROM games extracted** — zero errors
- **763 CHR-RAM games correctly skipped** (byte 5 = 0 in iNES header)
- **15,790,592 total tiles extracted** to `~/nes-extracted/`
- Each game gets a `tiles.png` (grayscale tile sheet, 16 tiles wide) and `manifest.json`

Spot check passed on Super Mario Bros (512 tiles), Super Mario Bros 3 (8,192 tiles), Little Nemo (8,192 tiles), and Kirby's Adventure (16,384 tiles — one of the largest).

**Correction to strategy doc:** Castlevania (USA) and DuckTales (USA) are both CHR-RAM (UNROM Mapper 2, byte 5 = 0), not CHR-ROM as the strategy doc listed. They load tiles from compressed PRG-ROM data at runtime. Moved to Universal Extractor target list.

### Session 9: Mesen2 Headless Extraction + Screen Render — Complete

Built the end-to-end proof-of-concept: emulator-based PPU state extraction → screen rendering.

**Key pivot: Mesen2 replaces FCEUX.** Research revealed FCEUX's macOS SDL port has a broken `--loadlua` CLI flag (buffer overflow bug) and is Windows-centric. Mesen2 offers:
- Native macOS support
- Headless CLI mode via `--testrunner` flag (runs at max speed, no GUI)
- Lua scripting with full PPU/CPU/OAM memory access
- Multi-system: NES, SNES, GB, GBA, PCE, SMS — one emulator for all platforms
- Actively maintained (FCEUX's own repo suggests "you might like Mesen more")

**Key technical discovery: Mesen2's Lua sandbox strips `io` and `os` libraries.** Scripts cannot write files directly. Workaround: `print()` outputs to stdout, captured by Node.js orchestrator that spawns the Mesen2 process. All extraction data is hex-encoded and printed as `DATA_*` lines to stdout.

**Proof-of-concept result:** Rendered `screen.png` of Super Mario Bros World 1-1 from ROM-extracted data. Pixel-perfect match to Mesen2's own reference screenshot — correct sky, ground tiles, question blocks, pipes, HUD, and Mario in correct NES colors.

**PPUCTRL fix:** Initial render had backgrounds and sprites swapped. NES PPUCTRL register ($2000) bit 4 selects which CHR bank is used for background tiles. SMB sets PPUCTRL=$90, meaning BG tiles come from CHR $1000 (bank 1), sprite tiles from $0000 (bank 0) — opposite of the naive assumption. Renderer now reads PPUCTRL from the captured PPU state to select the correct banks. This is a per-game value that must be captured during extraction.

**What this proves:** The complete pipeline works end-to-end. ROM → Mesen2 headless extraction → PPU state capture (palettes, nametables, OAM, CHR data) → Node.js renderer → pixel-perfect game screen. This validates the entire ROM extraction approach established in Session 7.

---

## Current Repo State

### File Structure
```
giants-drink/
  claude.md                              ← Needs update for Mesen2 pivot
  tools/
    extract-chr-rom.js                   ← NEW: NES CHR-ROM bulk extractor (Session 8)
    mesen-extract.lua                    ← NEW: Mesen2 Lua extraction script (Session 9)
    render-screen.js                     ← NEW: NES screen renderer (Session 9)
  src/
    asset-resolver.js                    ← Not yet updated for extraction manifests
    game-loop.js, renderer.js, etc.      ← Unchanged
  data/
    test-fixtures/
      episode1.json, episode2.json       ← Unchanged
    ground-truth/                        ← Phase 0.5 ingestion (~37MB JSON/text)
    assets/
      music-catalog.json                 ← Committed, still valid
  docs/
    current-status.md                    ← THIS FILE
    decisions-log.md                     ← Updated with Decisions 80-82
    design/
      rom-extraction-strategy.md         ← Session 7 (needs Castlevania/DuckTales correction)
      (other design docs unchanged)
```

### External (not in repo)
```
~/nes-roms/                              ← No-Intro NES ROM set (~3,146 .nes files)
~/nes-extracted/                         ← CHR-ROM tile sheets + manifests (2,383 games)
~/nes-extracted/smb-capture/             ← Session 9 proof-of-concept output
  screen.png                             ← Rendered SMB World 1-1 (pixel-perfect)
  palette.json, nametable.json, etc.     ← Captured PPU state
~/mesen2/                                ← Mesen2 emulator installation
```

### Deployed
- Vercel: two-fixture platformer (unchanged from earlier sessions)
- Cloudflare R2: TSR catalog + partial sprites (will be supplemented with ROM extraction data)

---

## What's Next

### Session 10: CHR-RAM Validation + Batch Orchestrator

**Primary goal:** Validate that the extraction pipeline works for CHR-RAM games — games where tiles are NOT in the ROM file and can only be captured via emulator VRAM extraction at runtime.

1. Run Mesen2 extraction on 2-3 CHR-RAM games: Mega Man 2, Castlevania, and Legend of Zelda
2. Render screens for each — do they look correct?
3. If yes: the Universal Extractor approach works for the ENTIRE NES library, not just CHR-ROM games
4. Build Node.js batch orchestrator that loops through ROMs and runs Mesen2 headless on each

**Why this matters:** CHR-ROM games are the easy case (tiles sit uncompressed in the file). CHR-RAM games are the hard case — tiles are compressed in PRG-ROM and only appear in VRAM at runtime. If Mesen2 captures correct VRAM tiles for CHR-RAM games, we've proven the approach works universally. If not, we need to debug before scaling.

### Session 11: Feed Extracted Data into Game Engine

Take SMB extraction data and wire it into the platformer engine. Render World 1-1 playable in the browser using ROM-extracted tiles, palettes, and layout. This is the "close the loop" moment where extraction meets the actual Two Fires engine.

### Session 12: SNES Extraction via Mesen2

Mesen2 emulates SNES. Test the same headless + Lua extraction approach on Super Mario World. If it works, we have NES + SNES coverage from a single tool.

### Session 13+: Scale and Resume Engine Work

- Batch-extract full NES library (~550 CHR-RAM games via Universal Extractor)
- Batch-extract SNES library
- Resume Phase 1 diagnostic pipeline with real ROM-extracted assets
- Build chaos player for automated game exploration (deeper state coverage)

---

## Key Decisions This Session

- **Decision 80:** Mesen2 replaces FCEUX as the emulator platform for Universal Extraction
- **Decision 81:** Stdout-based data capture workaround for Mesen2's sandboxed Lua
- **Decision 82:** PPUCTRL-aware bank selection in screen rendering
- **Correction:** Castlevania and DuckTales reclassified as CHR-RAM (moved to Universal Extractor list)

---

## Key Open Questions

1. ~~Cloud storage~~ → R2 stays (RESOLVED)
2. ~~Asset fidelity approach~~ → ROM extraction (RESOLVED)
3. ~~Emulator choice~~ → Mesen2 with --testrunner headless mode (RESOLVED)
4. ~~Lua I/O in Mesen2~~ → stdout capture workaround (RESOLVED)
5. **CHR-RAM extraction** — does Mesen2 VRAM capture work for compressed-tile games? (Session 10)
6. **SNES extraction** — does Mesen2's SNES Lua API provide equivalent PPU access? (Session 12)
7. Game Genie / level-select code database — needed for chaos player (Session 13+)
8. Extracted data → engine integration — schema reconciliation needed (Session 11)
9. Meta-game specification — flagged as needing its own thread (Decision 70, unchanged)
10. ~~API key rotation~~ → Rotated (RESOLVED)
