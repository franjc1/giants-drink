# Two Fires — Current Status

**Last updated:** 2026-03-02

---

## Phase 0.5: COMPLETE

### Ground Truth Library
Scalable ingestion pipeline catalogued 1,603 retro games across NES, SNES, Genesis, and early PC platforms. Multi-dimensional data extracted for 1,300+ games covering:
- Physics & mechanics
- Visual identity
- Audio identity
- Level design / sequencing patterns
- Game design / meta patterns
- Manifestation patterns (how games visually communicate world-state)

Coverage: NES 91%, SNES 83%, Genesis 71%, PC 96% (averaged across dimensions).

Total API cost: ~$115 using Claude Haiku for extraction.

### Repo State
- `claude.md` — Architectural blueprint v3 (TWO FIRES header). Source of truth.
- `docs/current-status.md` — This file.
- `docs/decisions-log.md` — All design decisions with dates and rationale.
- `docs/lore/two-fires.md` — Full cosmology and endgame mechanics.
- `docs/design/transfer-original.md` — Original Giants Drink transfer document (historical).
- `docs/design/claude-md-addition.md` — Session protocol and diagnostic framework additions.
- `tools/ingestion/` — Complete pipeline (batch-scraper, data-extractor, validator, run-pipeline).
- `tools/ingestion/game-lists/` — 40 game list files across 4 platforms.
- `data/ground-truth/` — ~7,800 structured JSON files across 6 dimensions.
- `index.html` — Placeholder jump demo (will be replaced by Phase 1).

### Key Design Docs in claude.md
The architectural blueprint contains all critical specifications:
- JSON Game State Schema (4 levels: player profile, world state, session state, meta state)
- CAS Engine Design (tick timing, propagation rules, Claude integration)
- Conversation System Design (entity minds, free text, knowledge enforcement)
- Lore System (Sage, Keeper, faction flame interpretations, revelation timeline)
- Two Fires cosmology (Giant = Overseer, endgame outcomes, visual cues)
- Generation Pipeline (full agent stack with sequencing grammar layer)
- Visual System with Two-Track Asset Resolution (reference vs. generated mode)
- Manifestation Layer (CAS state → visible changes)
- Quality Evaluation System (Coherence Auditor, Experience Simulator, etc.)
- Revelation Queue (channel-aware info delivery pacing)
- Social Ecology guidance and Social Hook design
- Build Plan (9 phases, 45 sessions)

---

## What's Next: Phase 1 — Platformer Engine

Build the core game engine using real physics data from the ground truth library.

### Phase 1 Sessions:
1. Core game loop + real SMW physics from ground truth
2. Tiles + collision + camera
3. Entities + basic AI + interaction (hail system)
4. Multiple levels, HUD, physics swap demo (swap Mario physics for Mega Man physics)

### Phase 1 Deliverable:
A JSON config that produces a playable platformer level with real retro physics, multiple entity types, and the hail/conversation UI stub. Proves the engine works and physics feel authentic.

---

## How to Start a New Thread

### For claude.ai design threads:
Start a new conversation in the Two Fires project. The project instructions tell Claude to read claude.md and docs/current-status.md. Say: "Continue from where we left off."

### For Claude Code engineering sessions:
Claude Code reads claude.md automatically. Tell it: "Read docs/current-status.md for what's next."

### After every productive session:
1. Tell Claude to generate updated current-status.md and any decisions-log additions
2. Download the files
3. In Terminal:
```
cd ~/giants-drink
mv ~/Downloads/current-status.md docs/current-status.md
git add -A && git commit -m "status update" && git push
```

---

## Key Architecture Reminders
- Game is **Two Fires** (repo stays `giants-drink`)
- Every asset specified **semantically** — two-track resolver (reference vs. generated)
- Cross-world travel = **social cost**. Sickness ONLY for Giant's dimension breach.
- **Giant = Overseer.** Narrative antagonist IS the adaptive difficulty system.
- Both factions **wrong about the flames**. Winning move never stated by any NPC.
- Level generation: **Grammarian → Rhythmist → Cartographer → Provocateur → Coherence Auditor**
- CAS state must be **VISIBLE** during gameplay via Manifestation Layer
