# Two Fires — Current Status

**Last updated:** 2026-03-09 (Phase 1, Session 6)

---

## What Just Happened (Session 6)

### Massive infrastructure session: Complete audio-visual foundation + asset pipeline + R2 deployment

**Scrapers completed:**
- Sprite scraper finished: 55,679 sheets across 12 platforms (NES, SNES, Genesis, Game Boy, GBA, Master System, Sega CD, Game Gear, TurboGrafx-16, Neo Geo, Arcade, DOS)
- Music scraper finished: 7,068 games, 103,262 tracks across 7 platforms
- Both indexes committed to git

**Four-script asset pipeline built and run:**
1. `tools/enrich-sheet-names.js` — fetched TSR game pages for all 6,699 games, recovered human-written sheet names for 55,721/55,722 sheets (99.998% coverage). Writes `asset-catalog.json` as the single source of truth.
2. `tools/analyze-music.js` — parsed NSF/SPC/VGM/GBS headers and M3U playlists for all 7,068 games. Extracted track names, composers, durations, chip types. Classified 51,931 tracks into functional roles (stage, boss_battle, title, victory, etc.). Writes `music-catalog.json`.
3. `tools/analyze-sprites.js` — programmatic image analysis of all 55,722 sprite sheets via `sharp`. Extracted color counts, dominant palettes, palette temperature, grid spacing, transparency type. Updates `asset-catalog.json` programmatic_tags field.
4. `tools/tag-sprites.js` — Claude Haiku vision API tagging for entity identification, bounding boxes, named characters, animation states. Scoped to essential+nice categories (player, enemy, boss, npc, item, tileset, background, character, portrait) for all games PLUS stage maps for top 500 games = ~26,640 sheets at ~$106 estimated cost. **Currently running** with 5 concurrent requests, ~15 hour estimated completion.

**Track A/B Asset Resolver built (Claude Code Session 6):**
- `src/asset-resolver.js` — three-layer lookup: Layer 1 (named_character match), Layer 2 (semantic tag match), Layer 3 (platform/category fallback)
- `ASSET_MODE` toggle via `?track=a` or `?track=b` URL param
- Track A returns real sprite sheet URL + bounding box from vision_tags
- Track B returns null → renderer draws colored rectangles (stub for Phase 3 generation)
- Resolved assets stored on entity at build time, not per-frame

**Renderer updated for sprite sheets:**
- `src/renderer.js` — loads sprite sheet PNGs as Image objects with caching
- Draws entity sprites using `drawImage` with source rectangle clipping
- Falls back to colored rectangles if sprite not loaded or Track B mode

**Fixtures updated:**
- Both episode1.json and episode2.json now include `asset_context` and per-entity `asset_spec` fields

**Cloudflare R2 deployed:**
- R2 bucket `two-fires-assets` created and activated
- Public URL: `https://pub-ecf4e311bd274041bb08e03235ca660e.r2.dev/`
- `asset-catalog.json` uploaded and accessible
- `tools/upload-to-r2.cjs` — upload script for bulk sprite upload
- NES sprites uploading (~5,177 PNGs, in progress)
- Resolver fetches catalog and sprite sheets from R2, not local filesystem
- This is the permanent asset storage solution (Decision 64 fulfilled)

**Asset-catalog.json is gitignored** — at 105MB it exceeds GitHub's file size limit. Lives on R2 as the canonical location. The resolver loads it from R2 at runtime.

---

## Current Repo State

### File Structure
```
giants-drink/
  claude.md                          ← P1S5 version (needs Decision 71 edits)
  .gitignore                         ← sprites, music, asset-catalog.json gitignored
  package.json                       ← type: "module", sharp installed
  index.html                         ← entry point, ?track= hint text
  src/
    asset-resolver.js                ← NEW: three-layer resolver, Track A/B toggle
    game-loop.js                     ← UPDATED: reads ?track= param, inits resolver
    renderer.js                      ← UPDATED: sprite sheet rendering via drawImage
    physics.js                       ← two-phase gravity, reads from fixture
    input.js                         ← keyboard input
    entities.js                      ← UPDATED: calls resolveAsset() per entity
    collision.js                     ← tilemap + entity collision
    camera.js                        ← smooth follow with integer rounding
    state.js                         ← dynamic mapW/mapH/tileSize
  data/
    test-fixtures/
      episode1.json                  ← UPDATED: asset_context (SMW/SNES) + asset_specs
      episode2.json                  ← UPDATED: asset_context (MM2/NES) + asset_specs
    ground-truth/                    ← Phase 0.5 ingestion (~37MB JSON/text)
    assets/
      sprites/                       ← [local only, gitignored] 55K+ PNGs
      music/                         ← [local only, gitignored] chiptune files
      asset-index.json               ← scraper's index (committed)
      asset-catalog.json             ← [local + R2, gitignored] 105MB master catalog
      music-index.json               ← committed
      music-catalog.json             ← NEW: enriched music data (committed)
      game-list.json                 ← master game list (committed)
  tools/
    scrape-sprites.js                ← sprite scraper (complete)
    scrape-music.js                  ← music scraper (complete)
    enrich-sheet-names.js            ← NEW: TSR sheet name fetcher
    analyze-music.js                 ← NEW: music header/playlist parser
    analyze-sprites.js               ← NEW: programmatic image analysis
    tag-sprites.js                   ← NEW: Claude Haiku vision tagger (v2)
    upload-to-r2.cjs                 ← NEW: bulk R2 upload script
    gen-episode2.js                  ← episode 2 level generator
  docs/
    current-status.md                ← THIS FILE
    decisions-log.md                 ← UPDATED: Decisions 67-73
    design/
      game-state-schema.md
      asset-resolution-strategy.md
      build-plan-v4.md               ← NEEDS UPDATE (Decision 71)
      ... (other design docs)
```

### Deployed
- Vercel: two-fixture platformer with level select, Track A/B toggle
- Cloudflare R2: `two-fires-assets` bucket with asset-catalog.json + sprites (uploading)

### In Progress (background)
- Vision tagger: running NES → SNES → Genesis → all remaining platforms (~15 hours, ~$106)
- NES sprite upload to R2: ~5,177 PNGs uploading

---

## What's Next

### Immediate: When Vision Tagger Finishes
1. Check error rate: should be <5%
2. Re-upload updated `asset-catalog.json` to R2: `wrangler r2 object put two-fires-assets/asset-catalog.json --file data/assets/asset-catalog.json --remote`
3. Upload SNES and Genesis sprites to R2 (same upload script, different platform arg)
4. Verify Track A rendering with tagged sheets (episode2 + NES sprites should show real pixel art)

### Immediate: Repo Maintenance
- Apply Decision 71 edits to `claude.md` (build-plan-v4 reference + cluster scope note)
- Commit `music-catalog.json`
- Commit all new tools

### Next Engineering Work (Phase 1, Sessions 7-8): Diagnostic Pipeline
- Validator — deterministic pathfinding, reachability, teachability arc checks
- Simulated Player Agent — automated play-through, death logging, timeline recording
- Moment Extractor v1 — auto-clip diagnostic moments
- Testing UI v1 — card-based clip review app
- Gate 1 auto-checks — runs? spawns? completable? latency?

### Remaining Phase 1 (Sessions 9-18, per Decision 71)
- Engine clusters 2-4: Top-Down Tile World, Stage/Arena, Scrolling Shooter (~1-2 sessions each)
- Engine clusters 5-7: Pseudo-3D, Raycasting, Strategic Map (~2-3 sessions each)

### Future Design Work
- Meta-game specification thread (Decision 70)
- Per-paradigm grammar specs (deferred from Thread 4)
- Upload remaining platforms to R2 as tagger completes them

---

## Key Open Questions
1. ~~Cloud storage~~ → Cloudflare R2 deployed (RESOLVED)
2. Track B distributional analysis — how to extract statistical models from sprite library
3. Real SMW level as test fixture — parsing stage map PNGs into tilemap data
4. ~~Asset Resolver matching strategy~~ → Three-layer lookup built (RESOLVED)
5. ~~claude.md repo sync~~ → Current through P1S5 (RESOLVED, pending Decision 71 edit)
6. Physics fidelity — current values are from ROM data but engine feel doesn't match 1:1 yet
7. Meta-game specification — flagged as needing its own thread (Decision 70)
8. R2 upload automation — remaining platforms (SNES, Genesis, etc.) need uploading after tagger completes
9. Vision tagger error handling — arcade platform has higher error rate (~2.4%), may need retry pass
