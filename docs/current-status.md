# Two Fires — Current Status

**Last updated:** 2026-03-08 (Phase 1, Session 5)

---

## What Just Happened (Session 5)

### Design session: Difficulty philosophy and meta-objective structure

No engineering this session — this was a design conversation that produced foundational principles affecting the entire system.

**Difficulty philosophy refined (Decision 67):**
- Extended Decision 53 (SNES Comfort Model) with a stronger claim: mechanical difficulty is texture, not content. Social dynamics are the primary difficulty vector.
- Calibration range: Super Mario World (baseline) to A Link to the Past (hard edge). Mario Kart 50cc→150cc as the mental model. Mega Man X slightly out of range; NES Mega Man and DKC2 well out of range.
- Self-balancing loop: social opposition → game gets mechanically harder → pushes player toward social solutions. Social success → game gets mechanically easier → social complexity increases. Player always drawn toward Two Fires' core differentiator.

**Social-to-mechanical manifestation (Decision 68):**
- CAS states manifest as gameplay consequences through Claude's interpretation layer with full creative latitude.
- No fixed taxonomy — explicitly rejected building a manifestation lookup table.
- Mild-to-extreme examples provided as illustrations of creative range, not an exhaustive menu.
- Key principle: mechanical difficulty that exceeds solo capability is a signal prompting social engagement, not a wall.

**Paradigm migration expectation (Decision 69):**
- Games expected to naturally migrate toward multi-character paradigms (beat-em-up, tactical, RTS-like) as social complexity increases.
- Should emerge from existing shift triggers, not be prescribed.
- Variety is critical — if every game follows the same migration path, that's a tuning signal.

**Post-game continuation (Decision 70):**
- "Winning" a generated game is a transition, not an endpoint. CAS continues, world persists.
- Meta-objective (reaching the giant, recovering the two fires) becomes the primary driver.
- Requires cross-world achievements: raising armies, alliances, artifacts, sacrifices.
- Meta-game structure flagged as needing its own specification thread.

**claude.md updated:**
- New "Difficulty Philosophy" subsection in Design Philosophy
- New "Post-Game and Meta-Objective Structure" subsection
- Both reference relevant decisions

---

## Current Repo State

### File Structure
```
giants-drink/
  claude.md                          ← UPDATED this session (difficulty + meta-objective)
  .gitignore                         ← sprites + music gitignored
  index.html                         ← entry point
  src/
    game-loop.js                     ← loadLevel(url), URL params, level select overlay
    renderer.js                      ← offscreen canvas rendering (dynamic dimensions)
    physics.js                       ← two-phase gravity, reads from fixture
    input.js                         ← keyboard input
    entities.js                      ← enemy patrol + rendering (dynamic dimensions)
    collision.js                     ← tilemap + entity collision (dynamic dimensions)
    camera.js                        ← smooth follow with integer rounding (dynamic dimensions)
    state.js                         ← dynamic mapW/mapH/tileSize set at load time
  data/
    test-fixtures/
      episode1.json                  ← SMW physics, 210×15, 3 entities
      episode2.json                  ← Mega Man 2 physics, 90×15, 4 entities, cave palette
    ground-truth/                    ← Phase 0.5 ingestion (~37MB JSON/text)
    assets/
      sprites/                       ← [gitignored PNGs — check scraper status]
      music/                         ← [gitignored chiptune files — check scraper status]
      asset-index.json               ← committed, updated after scrape
      music-index.json               ← committed, updated after scrape
      game-list.json                 ← master game list from scraper
  tools/
    scrape-sprites.js                ← sprite scraper (resumable)
    scrape-music.js                  ← music scraper (resumable)
    gen-episode2.js                  ← episode 2 level generator
  docs/
    current-status.md                ← UPDATED this session
    decisions-log.md                 ← UPDATED this session (Decisions 67-70)
    design/
      game-state-schema.md
      asset-resolution-strategy.md
      ... (other design docs)
```

### Deployed
- Vercel: two-fixture platformer with level select, SMW + Mega Man 2 physics

---

## What's Next

### Immediate: Repo Sync (Still Pending from Session 4)
- Update repo `claude.md` to current version (now includes difficulty philosophy + meta-objective)
- Update repo `docs/decisions-log.md` with Sessions 3-5 decisions
- Update repo `docs/current-status.md` with this file

### Immediate: When Scrapers Finish (Carried from Session 4)
1. Check scrape logs for errors
2. Rebuild indexes
3. Commit indexes
4. Run tagging pipeline
5. Upload sprite library to Cloudflare R2

### Next Engineering Session (Phase 1, Session 6): Asset Pipeline
- Check scraper status — if complete, run tagging pipeline
- Build Track A Asset Resolver module
- Get real sprites rendering in the engine
- If scrapers still running: real SMW level layout as fixture 3

### Future Design Work
- **Meta-game specification thread** — how worlds interconnect, what the giant confrontation looks like, what cross-world achievements entail, how the post-game CAS evolves
- Per-paradigm difficulty calibration (Phase 1 playtesting)
- Social-to-mechanical manifestation tuning (Phase 1+ playtesting)
- Paradigm migration variety diagnostics (later phases)

---

## Key Open Questions
1. Cloud storage for sprite/music library — Cloudflare R2 vs S3, when to upload
2. Track B distributional analysis — how to extract statistical models from sprite library
3. Real SMW level as test fixture — parsing stage map PNGs into tilemap data
4. Asset Resolver matching strategy — Layer 1 (name match), Layer 2 (semantic tags), Layer 3 (Claude runtime)
5. claude.md repo sync — now includes Thread 3→9 + difficulty philosophy + meta-objective
6. Physics fidelity — current values are from ROM data but engine feel doesn't match 1:1 yet
7. Meta-game specification — flagged as needing its own thread (Decision 70)
