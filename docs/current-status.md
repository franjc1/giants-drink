# Two Fires — Current Status

**Last updated:** 2026-03-08 (Phase 1, Session 6)

---

## What Just Happened (Session 6)

### Engineering session: Track A/B Asset Resolver + sprite rendering

**New files:**
- `src/asset-resolver.js` — full three-layer resolver with Track A/B toggle

**Updated files:**
- `src/renderer.js` — sprite sheet rendering via drawImage; colored rect fallback unchanged
- `src/entities.js` — calls resolveAsset() for each entity at build time; stores resolvedAsset on entity
- `src/game-loop.js` — reads ?track=a|b URL param; inits resolver before level load; resolves player asset
- `data/test-fixtures/episode1.json` — added asset_context (SMW/SNES), asset_spec to entity_placements
- `data/test-fixtures/episode2.json` — added asset_context (MM2/NES), asset_spec to entity_placements
- `index.html` — hint text updated to mention ?track= param

**Asset resolver: three-layer lookup**
- Layer 1: vision_tags named_character match within specified game slug
- Layer 2: semantic match within game (category + style_reference)
- Layer 3: platform + category fallback, prefers sheets with vision_tags, returns null if no vision_tags
- Track B: always returns null → renderer draws colored rects (correct dimensions)

**Current resolution behavior (tagging pipeline still in progress):**
- SNES (episode1): 0 vision_tags → Track A falls back to null → colored rects (same as Track B)
- NES (episode2): 896 NES entries with vision_tags → Track A Layer 3 WILL find real NES sprites
  - 43 enemy sheets, 289 player sheets with vision_tags on NES platform
  - Will not find Mega Man 2 specifically (no vision_tags yet) but will find closest NES enemy/player
- When vision_tags arrive for SMW and MM2, Layers 1+2 will activate automatically — no code changes needed

**Architecture decision:** resolvedAsset stored on entity at build time (not per-frame). Re-builds when loadLevel() called. This keeps the hot render loop clean.

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
  claude.md                          ← UPDATED Session 5 (difficulty + meta-objective)
  .gitignore                         ← sprites + music gitignored
  index.html                         ← entry point (hint updated for ?track= param)
  src/
    game-loop.js                     ← loadLevel(url), URL params, level select overlay, resolver init
    renderer.js                      ← offscreen canvas + sprite sheet rendering (Track A/B)
    physics.js                       ← two-phase gravity, reads from fixture
    input.js                         ← keyboard input
    entities.js                      ← enemy patrol + resolveAsset() at build time
    collision.js                     ← tilemap + entity collision
    camera.js                        ← smooth follow with integer rounding
    state.js                         ← dynamic mapW/mapH/tileSize set at load time
    asset-resolver.js                ← NEW: Track A/B resolver, 3-layer catalog lookup
  data/
    test-fixtures/
      episode1.json                  ← SMW physics, 210×15, 3 entities, asset_context (SMW/SNES)
      episode2.json                  ← Mega Man 2 physics, 90×15, 4 entities, asset_context (MM2/NES)
    ground-truth/                    ← Phase 0.5 ingestion (~37MB JSON/text)
    assets/
      sprites/                       ← [gitignored PNGs — scraper complete, 55K+ sheets]
      music/                         ← [gitignored chiptune files]
      asset-catalog.json             ← 55,722 entries, 1,296 with vision_tags (NES+arcade only so far)
      asset-index.json               ← committed
      tag-log-all.txt                ← tagging pipeline progress log
  tools/
    scrape-sprites.js                ← sprite scraper (resumable)
    scrape-music.js                  ← music scraper (resumable)
    gen-episode2.js                  ← episode 2 level generator
  docs/
    current-status.md                ← UPDATED this session
    decisions-log.md                 ← UPDATED Session 5 (Decisions 67-70)
    design/
      asset-resolution-strategy.md
      ... (other design docs)
```

### Deployed
- Vercel: two-fixture platformer with level select, SMW + Mega Man 2 physics, Track A/B toggle

---

## What's Next

### Immediate
- Deploy to Vercel: verify ?track=a and ?track=b both work in browser
- Test episode2 with ?track=a — should show real NES sprites (Layer 3 NES enemy/player from catalog)
- Test episode1 with ?track=a — should show colored rects (SNES has no vision_tags yet)

### When Vision_Tags Pipeline Finishes for SNES/MM2
- No code changes needed — Layer 1 will activate automatically when SMW/MM2 get vision_tags
- Track A episode1 will then show real SMW sprites; episode2 will show real MM2 sprites

### Next Engineering Session (Phase 1, Session 7): Options
1. **Real SMW level layout as fixture 3** — parse stage map PNGs or use ground-truth data
2. **Tileset sprite rendering** — apply Track A to tile rendering (currently solid colors)
3. **Animation frames** — cycle through animationFrames[] in renderer for walk cycles
4. **Audio stub** — Web Audio API, play a simple chiptune loop from audio_profile params

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
