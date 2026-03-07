# Two Fires — Current Status

**Last updated:** 2026-03-07 (Phase 1, Session 3)

---

## What Just Happened (Session 3)

### Massive infrastructure session — engine polish + asset pipeline foundation

**Completed from Session 2 carryover (done in Claude Code before this session):**
- Base64 tilemap conversion — fixture and engine now use `base64_encoded_tile_indices` per schema spec
- Module split — `index.html` split into: `game-loop.js`, `renderer.js`, `physics.js`, `input.js`, `entities.js`, `collision.js`, `camera.js`, `state.js`. Vanilla JS, no frameworks.

**Physics calibration to SMW ground truth:**
- Replaced single gravity with two-phase gravity system matching Super Mario World ROM-disassembled values
- `gravity_ascending` (0.19) while holding jump + ascending — creates SMW's signature floaty hang at apex
- `gravity_falling` (0.5) for all other states — quick drop on release or fall
- `jump_hold_bonus` eliminated — two-phase gravity replaces it
- All physics values derived from `data/ground-truth/physics/super-mario-world-snes.json`
- `jump_velocity` adjusted from ground truth -5.0 to -5.5 for playability with current test level geometry

**Display scaling:**
- Integer scaling system — renders at native resolution, scales up by largest integer that fits browser window
- Scale capped at 3× to prevent over-zoom; larger screens show more of the level instead of bigger pixels
- On 1080p: 3× scale, ~40 tiles visible. On 1440p: 3× scale, ~53 tiles visible.
- All render positions rounded to integers to eliminate sub-pixel jitter
- Camera position rounded once per frame (root cause of 1px oscillation was gravity adding 0.5 then collision snapping back, causing Math.round to alternate)
- HUD text drawn on display canvas after scaling blit — crisp at screen resolution

**Sprite acquisition pipeline (Phase 0.75):**
- Discovered Phase 0.5 ingestion produced metadata JSONs only — no actual sprite images anywhere in repo
- Physics ground truth is excellent (ROM-disassembled values), but visual-identity JSONs have mostly null fields for sprite dimensions, color counts, frame counts
- Built and validated `tools/scrape-sprites.js` — comprehensive scraper for The Spriters Resource
- Scraping ALL available games across NES, SNES, Genesis, Game Boy, GBA, Master System, Sega CD, Game Gear, TurboGrafx-16, Neo Geo, Arcade, DOS, PC
- Downloads all categories: characters, enemies, tilesets, items, UI, stage maps, bosses, NPCs
- Resumable with `--resume`, polite rate limiting (1.5s between requests)
- File structure: `data/assets/sprites/{platform}/{game-slug}/{category}/{filename}.png`
- `asset-index.json` committed to git; sprite PNGs gitignored (too large for GitHub)
- **Status: RUNNING** — SNES ~70% complete as of session end. NES completed (912 games).

**Music acquisition pipeline:**
- Built `tools/scrape-music.js` — scrapes native chiptune formats (NSF, SPC, VGM, GBS) from Zophar's Domain
- Downloads EMU/native format ZIPs (not MP3s), extracts to individual track files
- File structure: `data/assets/music/{platform}/{game-slug}/{track-files}`
- Cross-references with ground-truth audio JSONs and sprite library game slugs
- NES complete: 1,917 games, 2,179 tracks
- **Status: RUNNING** — SNES in progress

**Asset tagging pipeline (specced, not yet built):**
- Phase 1: Programmatic sprite analysis (dimensions, colors, palette, grid detection) — free
- Phase 2: Claude vision API tagging for ambiguous sprites (~$15-50 estimated) — uses Haiku for cost efficiency
- Phase 3: Programmatic music analysis (tempo, key, channels, duration) — free
- Brief written and ready to paste into Claude Code after scrapers complete

### Session 3 Discovery: Phase 0.5 Gap

The Phase 0.5 ingestion pipeline ($100 API cost) produced rich structured data across 6 dimensions for ~1,300 games:
- **Physics** — excellent (ROM-level precision for many games)
- **Level sequences** — good structural data
- **Manifestation patterns** — good (13MB of rich pattern data)
- **Audio** — structural descriptions
- **Game design** — design analysis
- **Visual identity** — metadata only, most sprite-specific fields null

The gap: Claude can describe games from training knowledge but cannot fetch actual image files. Sprite acquisition requires web scraping, which is a different tool (curl/wget) than knowledge extraction (Claude API). This gap is now being filled by the sprite and music scrapers.

---

## Current Repo State

### File Structure
```
giants-drink/
  claude.md                          ← Thread 9 version (needs repo sync — see below)
  .gitignore                         ← sprites + music gitignored
  index.html                         ← entry point
  src/
    game-loop.js                     ← requestAnimationFrame loop + display scaling
    renderer.js                      ← offscreen canvas rendering
    physics.js                       ← two-phase gravity, SMW-calibrated
    input.js                         ← keyboard input
    entities.js                      ← enemy patrol + rendering
    collision.js                     ← tilemap + entity collision
    camera.js                        ← smooth follow with integer rounding
    state.js                         ← game state + native resolution
  data/
    test-fixtures/
      episode1.json                  ← base64 tilemap, SMW physics, 3 entities
    ground-truth/                    ← Phase 0.5 ingestion (~37MB JSON/text)
      physics/                       ← ROM-level data for ~1,300 games
      level-sequences/
      manifestation-patterns/
      audio/
      game-design/
      visual-identity/               ← metadata only, most fields null
    assets/
      sprites/                       ← [DOWNLOADING] gitignored PNGs
      music/                         ← [DOWNLOADING] gitignored chiptune files
      asset-index.json               ← committed, updated after scrape
      music-index.json               ← committed, updated after scrape
      game-list.json                 ← master game list from scraper
  tools/
    scrape-sprites.js                ← sprite scraper (resumable)
    scrape-music.js                  ← music scraper (resumable)
  docs/
    current-status.md
    decisions-log.md
    design/
      game-state-schema.md
      asset-resolution-strategy.md
      ... (other design docs)
```

### Deployed
- Vercel: playable platformer with SMW physics, integer scaling, 3 enemies

---

## What's Next

### Immediate: When Scrapers Finish
1. Check scrape logs for errors: `tail -20 data/assets/scrape-log.txt` and `tail -20 data/assets/music-scrape-log.txt`
2. Rebuild indexes: `node tools/scrape-sprites.js --index-only` and `node tools/scrape-music.js --index-only`
3. Commit indexes: `git add data/assets/asset-index.json data/assets/music-index.json data/assets/game-list.json && git commit -m "Final asset indexes after full scrape" && git push`
4. Run tagging pipeline (brief ready — paste into Claude Code)
5. Upload sprite library to Cloudflare R2 for server-side access (needed for both Track A and Track B at runtime)

### Immediate: Repo Sync
- Update repo `claude.md` to Thread 9 version (repo has Thread 3, project files have Thread 9)
- Update repo `docs/decisions-log.md` with decisions from this session
- Update repo `docs/current-status.md` with this file

### Next Session (Phase 1, Session 4): Asset Resolver
- Build Track A Asset Resolver module — takes semantic asset specs, searches sprite library, returns sprite data
- Requires: sprite scrape complete + tagging pipeline complete
- The resolver makes the level render with real sprites instead of colored rectangles
- This is the single biggest visual quality jump remaining in Phase 1

### Ongoing Phase 1 Work
- Diagnostic infrastructure (Simulated Player Agent, Moment Extractor, Testing UI)
- Additional engine features as needed for diagnostic evaluation
- Eventually: load real SMW level layouts as test fixtures (stage maps from sprite scrape)

---

## Key Open Questions
1. Cloud storage for sprite/music library — Cloudflare R2 vs S3, when to upload
2. Track B distributional analysis — how to extract statistical models from sprite library for generation constraints
3. Real SMW level as test fixture — parsing stage map PNGs into tilemap data
4. Asset Resolver matching strategy — Layer 1 (name match), Layer 2 (semantic tags), Layer 3 (Claude runtime)
5. claude.md repo sync — Thread 3 → Thread 9 update needed
