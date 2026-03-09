# Two Fires — Current Status

**Last updated:** 2026-03-09 (Phase 1, Session 7)

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

## Current Repo State

### File Structure (unchanged from Session 6 — no code written this session)
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
    (existing tools unchanged — new extraction tools to be built)
  docs/
    current-status.md                ← THIS FILE
    decisions-log.md                 ← Updated with Decisions 76-79
    design/
      rom-extraction-strategy.md     ← NEW: comprehensive strategy doc
      (other design docs unchanged)
```

### Deployed
- Vercel: two-fixture platformer (unchanged)
- Cloudflare R2: TSR catalog + partial sprites (will be supplemented with ROM extraction data)

---

## What's Next

### Immediate: Session 8 — NES CHR-ROM Bulk Extractor
1. Claude Code builds Node.js script to parse iNES headers and extract CHR-ROM tile data
2. Acquire NES ROM set (Joe to source)
3. Run on entire CHR-ROM library (~450 games) — produces PNG tile sheets + manifest.json per game
4. Update Asset Resolver to read from new extraction format
5. **Pressure test:** render a level using real extracted tiles from two different games

### Next: Session 9 — NES Universal Extractor v1
1. Build FCEUX Lua script suite: exploration chaos player + RAM logger + VRAM capturer
2. Build Node.js orchestrator for batch processing
3. Test on 3 NES games (one CHR-ROM for validation, two CHR-RAM)
4. Validate: does the automated exploration achieve good game coverage? Are the extracted mechanical parameters accurate?

### Following: Sessions 10-11 — SMW Community Tool Extraction + SNES Universal Extractor
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

## Key Decisions This Session

- **Decision 76:** ROM extraction replaces TSR sheet extraction as primary asset pipeline
- **Decision 77:** Universal Extractor architecture — two-pass automated exploration + instrumented extraction
- **Decision 78:** Three categories of ground truth — visual, structural, mechanical — extracted together
- **Decision 79:** Extraction scope — ~820 games across NES, SNES, Genesis, arcade, PC

---

## Key Open Questions

1. ~~Cloud storage~~ → R2 stays, new data ~500MB-1GB (RESOLVED)
2. ~~Asset fidelity approach~~ → ROM extraction (RESOLVED)
3. FCEUX Lua scripting — need to validate chaos player + RAM logging approach works as theorized (Session 9)
4. SNES emulator scripting — which emulator has best scripting API for our needs? (Session 10-11)
5. Game Genie / level-select code database — need to source comprehensive code lists for NES + SNES
6. ROM sourcing — need NES and SNES ROM sets available locally for extraction
7. Lunar Magic on macOS — may need Wine or alternative approach for SMW extraction
8. Physics fidelity — current engine values are from ROM data but feel doesn't match 1:1 yet (ongoing)
9. Meta-game specification — flagged as needing its own thread (Decision 70, unchanged)
10. API key rotation — Joe's Anthropic key was exposed in Session 6 chat, still needs rotation
