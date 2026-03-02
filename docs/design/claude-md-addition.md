# claude.md — Session Protocol Addition
## Paste this section at the bottom of your existing claude.md

---

## Session Protocol

### At the START of every Claude Code session:
1. Read this file (`claude.md`)
2. Read `docs/current-status.md`
3. If the task involves a specific system, read the relevant doc from `docs/design/`
4. If decision history is needed, read `docs/decisions-log.md`

### At the END of every Claude Code session:
1. Update `docs/current-status.md` — what changed this session, what's next
2. Append new decisions to `docs/decisions-log.md` — if any architectural or design decisions were made this session. Use the established format: Session header with date + topic, then numbered decisions with Context, Decision, and Rationale fields
3. Update `claude.md` ONLY if architectural changes were made (new agents, changed pipeline, new systems). Most sessions won't need this.
4. `git add . && git commit -m "[descriptive message]" && git push`

### Key documents and their roles:

| Document | Role | Changes When |
|----------|------|-------------|
| `claude.md` | Architectural blueprint — source of truth for all Claude Code sessions | Architecture changes (rare, ~every 3-5 sessions) |
| `docs/current-status.md` | Handoff document — where we left off, what's next | Every session (either environment) |
| `docs/decisions-log.md` | Append-only decision record with full rationale | When decisions are made |
| `docs/design/build-plan-v2.md` | Current build plan (45 sessions, includes diagnostic framework) | When plan changes |
| `docs/design/diagnostic-framework.md` | Fast-fail quality evaluation specification | When diagnostic approach changes |
| `docs/design/sequencing-grammar-framework.md` | Intermediate layer theory + grammar seeds | When sequencing logic evolves |
| `docs/design/asset-resolution-strategy.md` | Two-track asset architecture | When asset approach changes |
| `docs/lore/two-fires.md` | Mythology, endgame mechanics, narrative backbone | When lore decisions are made |
| `giants-drink-transfer.md` | Original complete transfer document (historical reference) | Rarely — superseded by specific docs |

### Cross-environment sync:
- **Claude.ai → repo:** Joe downloads docs from Claude.ai, drops them in repo folders, tells Claude Code to commit and push (or does it manually)
- **Claude Code → Claude.ai:** Joe includes relevant project files in Claude.ai project. current-status.md and decisions-log.md are the most important for context continuity.
- **Conflict resolution:** If current-status.md seems stale or contradictory, check decisions-log.md for the authoritative record of what was decided and when.

---

## Diagnostic & Tuning Framework Summary

### Testing & Tuning Infrastructure (threaded through all phases)
Two Fires uses a fast-fail diagnostic funnel to evaluate generated game quality efficiently. Full specification in `docs/design/diagnostic-framework.md`.

**Fast-fail funnel:**
- **Gate 1 (automated):** Does it run? Is it pathable? Latency OK? Schema valid?
- **Gate 2 (Joe reviews clips, ~30-45s):** 5 Necessary Conditions — readable opening, physics character (comparison clip), teachability integrity, visual coherence, rhythm heartbeat. Any 👎 = fast fail.
- **Gate 3 (Joe reviews clips, ~45-60s):** INUS Conditions — provocateur moment, aesthetic personality, social hook (Phase 5+), entity behavior (Phase 5+). Only evaluated if Gate 2 passes.
- **Gate 4 (periodic):** Holistic playthroughs, 5-15 minutes. Calibration and spot-checks.

**Rating system:** 👎 (below threshold) / 👍 (above threshold) / 🔥 (exceptional) + optional text rationale

**Diagnostic agents:**
- Simulated Player Agent — automated pathfinding + timeline recording
- Moment Extractor — clips diagnostically meaningful moments for Joe's review
- Comparative Diagnostician — variance analysis across multiple generations of same prompt
- Archetype Stress-Tester — canonical prompt battery, regression detection
- Pattern Distiller — converts Joe's ratings into transferable design principles (Living Taste Document)

**Testing UI:** Zero-navigation card-based web interface. Phase-aware. Two modes: Review (pre-generated queue) and Generate (type prompt → evaluate). Principles tab for approving/rejecting distilled taste principles.

**Phase-gating:** Conditions activate as systems come online. Phase 1 has 3 NCs. Phase 2 has 5 NCs + 2 INUS. Phase 5+ adds social conditions. Each phase starts with more holistic playthroughs to calibrate, then shifts to the faster clip-based funnel.

---

## Design Philosophy

Two Fires produces emergent game experiences from the mutual constraint of primitives (Barrett's constructionist model applied to game design). No single system dominates. Quality is guaranteed by the shape of the constraint space, not by prescription of outcomes.

- CAS is a primitive, not the whole system
- Agents define constraints, not content
- The specific experience is unpredictable; the quality is guaranteed
- Over-constraining = scripted (bad). Under-constraining = incoherent (bad). The art is in constraint design.
- Debugging = constraint diagnosis: which surface is miscalibrated?

See `docs/decisions-log.md` Decision 1 (Constraint Surface Model) for full rationale.
