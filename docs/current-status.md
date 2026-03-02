# Two Fires — Current Status

Last updated: 2026-02-28

---

## Phase: 0.5 — Ground Truth Ingestion

### What's Done

**Physics library (complete):**
55 physics JSON files in `data/ground-truth/physics/` covering:
- 25 NES games (SMB1/2/3/Lost Levels, MM1–6, CV1–3, Metroid, Contra, Ninja Gaiden, GnG, Bionic Commando, DuckTales, Batman, Kirby's Adventure, Little Nemo, Chip 'n Dale, Tiny Toons, Battletoads, Gargoyle's Quest II, Metal Storm)
- 15 SNES games (SMW, Super Metroid, MMX/X2/X3, MM7, DKC1–3, Yoshi's Island, Kirby Super Star, SCIV, SGnG, Demon's Crest, TMNT IV)
- 15 Genesis games (Sonic 1/2/3+K, Castle of Illusion, Gunstar Heroes, Aladdin, EWJ, Ristar, Rocket Knight Adventures, Ghouls 'n Ghosts, Strider, Vectorman, Comix Zone, CV Bloodlines, Contra Hard Corps)

**1 palette file:** `data/ground-truth/palettes/nes-palette.json` — full 64-color NES hardware palette.

**Ingestion pipeline (built, not yet run at scale):**
All scripts in `tools/ingestion/`:
- `batch-scraper.js` — fetches docs from source URLs → raw-data/
- `data-extractor.js` — Claude Haiku extraction, one dimension per call
- `validator.js` — schema validation + coverage report
- `run-pipeline.sh` — orchestrates all three

**Game master lists (being expanded):**
- NES: expanding to 300+ (was 85)
- SNES: expanding to 250+ (was 62)
- Genesis: expanding to 200+ (was 58)
- PC: expanding to 100+ (was 55)
- Target total: 850+ games

### What's In Progress

Expanding game master lists to 850+ total coverage. Once lists are finalized, running full pipeline (scrape → extract → validate) for all four platforms.

### What's Next

1. **Finish list expansion** — NES 300+, SNES 250+, Genesis 200+, PC 100+
2. **Run full pipeline** — `./run-pipeline.sh all` overnight
3. **Validate coverage** — `node validator.js --report`
4. **Gap filling** — targeted re-runs for missing dimensions

Then **Phase 1 begins:**
- Session 1: Core game loop + SMW physics read from ground truth JSON config
- Session 2: Tiles + collision + camera (16x16 tiles, SMW-standard)
- Session 3: Entities + interaction (real enemy behaviors from ground truth)
- Session 4: Multiple levels, HUD, level transitions, physics swap demo

Phase 1 constraints: NO AI calls, NO social system, NO save system, NO shaders, platformer only.

---

## Key Files

| Path | Purpose |
|------|---------|
| `CLAUDE.md` | Master architectural blueprint (overrides everything) |
| `data/schema.md` | Full game state schema (4 levels) |
| `data/ground-truth/README.md` | Ground truth library documentation |
| `data/ground-truth/physics/` | 55 physics JSON files |
| `tools/ingestion/game-lists/` | Master game lists (NES/SNES/Genesis/PC) |
| `tools/ingestion/batch-scraper.js` | URL → raw text |
| `tools/ingestion/data-extractor.js` | Raw text → ground truth JSON via Claude |
| `tools/ingestion/validator.js` | Validates extracted files |
| `tools/ingestion/run-pipeline.sh` | Full pipeline orchestrator |
| `docs/decisions-log.md` | All design decisions |

---

## Known Issues / Open Questions

- No web access for background Task agents in this environment — all research done in main session
- PC games use different source key names (`pcgamingwiki`, `doomwiki`, `scummvm_wiki`) vs console games (`data_crystal`, `tasvideos`)
- Sub-pixel system varies per game: SMB1/SMW use 16 sub-px/px; Mega Man 2/3 and Sonic use 256 sub-px (8.8 fixed-point) — generation pipeline must handle both
