# Two Fires — Current Status

**Last updated:** 2026-03-07 (Phase 1, Session 4)

---

## What Just Happened

### Phase 1 Session 4: SMW Two-Phase Gravity + Integer-Scaled Display

**Task 1 — Two-phase gravity (SMW ROM-accurate).** Replaced single `gravity` + `jump_hold_bonus` system with two-phase gravity matching Super Mario World's ROM disassembly. Jump held while ascending: gravity_ascending = 0.19 (long hang time at apex). Any other state: gravity_falling = 0.5 (quick drop on release or during fall). Removed `holdFrames` entirely. Updated episode1.json physics to full SMW ground-truth values: jump_velocity -5.0, run_speed 3.0, run_acceleration 0.15, run_deceleration 0.25, air_control 1.0, max_fall_speed 4.5. Jump arc should now feel distinctly SMW: long float on hold, crisp cut on release.

**Task 2 — Integer-scaled display.** Game now renders to a 256×240 offscreen canvas (SNES native resolution), then blits to the display canvas at the largest integer scale factor that fits the window. `imageSmoothingEnabled = false` keeps pixels crisp. Resize handler recalculates scale on window resize. Black body background provides letterboxing. `state.js` W/H changed from 800×480 to 256×240; camera and renderer both use this correctly.

---

### Phase 1 Session 3: Base64 Tilemap, Physics Tuning, Module Split

**Task 1 — Tilemap converted to base64.** New tool `tools/build-tilemap-base64.js` builds the 210×15 Uint8Array from sparse_tiles and writes base64 to `episode1.json`. Layer now has `data_format: "base64_uint8"` and a 4200-char `data` field. Verified: ground rows, pit gaps, flag pole all decode correctly. Engine updated to use `atob()` instead of sparse_tiles parsing.

**Task 2 — Physics tuned.** `jump_velocity` reduced from -12 to -9.0, `jump_hold_bonus` scaled from -2 to -1.5. Max jump height: was ~153px (9.6 tiles), now ~88px (5.5 tiles). Question blocks at row 9 still reachable from flat ground; row 7 platform requires stepping on question blocks first (intended multi-step discovery). Gravity unchanged at 0.55 (matches SMW's ~0.5625).

**Task 3 — Modular structure.** `index.html` is now a thin shell. Engine split into 8 ES modules in `src/`:
- `state.js` — shared mutable state + constants
- `input.js` — keyboard events
- `collision.js` — getTile, isSolid, moveAndCollide
- `physics.js` — updatePlayer, respawnPlayer
- `entities.js` — buildEntities, updateEntities
- `camera.js` — smooth camera follow
- `renderer.js` — tilemap + entity + player + HUD rendering
- `game-loop.js` — init + rAF loop (entry point)

---

### Phase 1 Session 2: Test Fixture + First Playable Level

**Test fixture authored:** Complete GameState JSON (`data/test-fixtures/episode1.json`) for a platformer Episode 1, fully compliant with the reconciled schema (Thread 9). Seven-section level with classic World 1-1 teachability arc:
1. Safe landing (flat ground, decorative)
2. Question blocks (learn to jump for rewards)
3. First goomba (safe flat encounter)
4. First pit (3-tile gap, very forgiving)
5. Second goomba + elevated platform (vertical exploration)
6. Koopa + wider pit (mild escalation)
7. Cooldown + flag (celebration finish)

Includes two factions (Koopa Army, Goomba Workers' Collective), three entities with full OCEAN personality/affect/knowledge/bonds, population templates, SNES Comfort Model physics defaults, and all schema blocks (meta, world, cas, episode, player, overseer, diagnostics).

**Fixture uses sparse_tiles format** rather than base64 for the tilemap data. This was from the initial authoring pass. Converting to base64 (matching the schema spec) is a next-session task.

**First playable level running:** Claude Code built `index.html` — a single-file platformer engine with:
- Tilemap rendering from the fixture's sparse_tiles data
- Player movement with physics from episode.physics (gravity, jump velocity, air control, friction, coyote time, variable jump height)
- Collision detection (X-then-Y AABB against tile grid)
- Three patrolling enemies from entity_placements (stomp to kill, contact respawns player)
- Camera follow

**Deployed to Vercel** via git push.

**Known issues:**
- Jump height feels too high — physics tuning needed
- Visual presentation is colored rectangles (expected — Track B placeholder mode)
- Fixture uses sparse_tiles instead of base64 — needs conversion

**Claude Code session notes:** Initial prompts that asked Claude Code to read multiple design docs caused token limit errors and 15+ minute think times. Solution: skip doc reading, give Claude Code the specific file and explicit instructions. Worked in ~4 minutes once simplified. Lesson for future sessions: point Claude Code at concrete files, not broad documentation.

---

## Current Repo State

```
giants-drink/
  index.html                         ← thin shell, loads src/game-loop.js
  src/
    game-loop.js                     ← NEW: entry point, init, rAF loop
    state.js                         ← NEW: shared mutable state + constants
    input.js                         ← NEW: keyboard events
    collision.js                     ← NEW: getTile, isSolid, moveAndCollide
    physics.js                       ← NEW: updatePlayer, respawnPlayer
    entities.js                      ← NEW: buildEntities, updateEntities
    camera.js                        ← NEW: smooth camera follow
    renderer.js                      ← NEW: tilemap + entity + HUD rendering
  tools/
    build-tilemap-base64.js          ← NEW: converts sparse_tiles → base64 in episode1.json
  data/test-fixtures/
    episode1.json                    ← UPDATED: tilemap now base64_uint8; physics tuned
    level-visual-reference.txt       ← ASCII art level map (dev reference)
  claude.md                          ← needs update to Thread 9 version
  docs/
    current-status.md                ← this file
    decisions-log.md                 ← current through Thread 9 (61 decisions)
    design/
      game-state-schema.md           ← reconciled (Threads 1,3,5,7,8,9)
      build-plan-v3.md
      diagnostic-framework.md
      cas-engine-spec.md
      vme-spec.md
      entity-minds-spec.md
      sequencing-grammar-framework.md
      paradigm-shift-principles.md
      asset-resolution-strategy.md
      paradigm-specs.md
    lore/
      two-fires.md
```

---

## What's Next

### Phase 1 Session 5

**Priority 1 — Physics feel check.** Play the deployed level with the new SMW values. The tuning knobs if needed: `gravity_ascending` (apex hang time), `gravity_falling` (fall speed), `jump_velocity` (max height). Do NOT change jump_velocity to compensate for feel — adjust gravity values first.

**Priority 2 — Enemy polish.** Enemies fall off platforms. Add pit-edge turning: check solid tile ahead AND solid tile underfoot — reverse if either fails. Fix in `entities.js`.

**Priority 3 — Stomp bounce tuning.** Stomp bounce is hardcoded to -7 in `entities.js`. Should be proportional to `jump_velocity` (e.g., `jump_velocity * 0.5`).

**Priority 4 — Gate 1 foundations.** Automated checks: does it run without errors? Does the player spawn at the right position? Can a simulated player reach the flag?

### Deferred
- Update repo's claude.md to Thread 9 version (the project files in claude.ai have it, but the repo still has the Thread 3 version)
- Asset Resolver module (Track A lookup / Track B placeholder toggle)
- Additional test fixtures for other level layouts

### Claude Code Tips for Next Session
- Don't ask Claude Code to read claude.md or multiple design docs upfront — it causes token overflows
- Point it at specific files with explicit instructions
- For physics tuning, iterate in the fixture JSON values, not in code
- Use `/clear` between major tasks to keep context clean
- The codebase is now modular (src/). Changes go in the relevant module, not index.html
