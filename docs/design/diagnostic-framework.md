# Two Fires — Diagnostic & Tuning Framework
## Fast-Fail Quality Evaluation with Taste Learning

---

## What This Document Is

This document specifies the diagnostic and tuning infrastructure for Two Fires. It defines how generated games are evaluated for quality, how Joe's subjective judgments are captured efficiently, and how those judgments feed back into the generative agents to improve output over time.

The core philosophy: **you can't QA infinity, so don't test instances — test the generator.** Joe's time is spent on diagnostic moments and taste decisions, never on setup, navigation, or parameter fiddling.

---

## The Fast-Fail Funnel

Every generated game passes through a series of gates. Failure at any gate stops evaluation immediately — no point assessing social hooks if the controls feel wrong.

```
Generated Game
      │
      ▼
GATE 1: Automated Checks (Category 1 & 2)
  Does it run? Is it pathable? Do collisions work?
  Metrics within acceptable ranges?
      │
  Fail → auto-fix by agents, resubmit
      │
      ▼ Pass
GATE 2: Necessary Conditions (Joe reviews clips, ~30-45 sec)
  NC1: Readable Opening
  NC2: Responsive Controls (latency auto-checked + physics comparison clip)
  NC3: Teachability Integrity
  NC4: Visual Coherence
  NC5: Rhythm Heartbeat
      │
  Any 👎 → fast fail, note which NC + optional rationale
           → back to specific agent for targeted fix
      │
      ▼ All pass
GATE 3: INUS Conditions (Joe reviews clips, ~45-60 sec)
  INUS-1: Provocateur Moment
  INUS-2: Aesthetic Personality
  INUS-3: Social Hook (Phase 5+)
  INUS-4: Pacing Arc (holistic playthroughs only, initially)
  INUS-5: Entity Behavior (Phase 5+)
      │
  Any 👎 → targeted fix, not full regeneration
      │
      ▼ All 👍 or 🔥
GATE 4: Holistic Playthrough (periodic, not every game)
  Joe plays 5-15 minutes
  Overall rating + rationale
```

---

## Gate 1: Automated Checks (No Human Involvement)

### Category 1 — Binary Pass/Fail
- Game loads without errors
- Player entity spawns at correct position
- All referenced assets resolve (no missing sprites/tiles)
- Input system responds to all mapped controls
- Game loop runs at target framerate
- JSON schema validates against game config spec
- Level is completable (Simulated Player Agent reaches end)

### Category 2 — Metrics Within Range
- Input latency < 50ms (auto-measured, never reaches Joe)
- Death distribution clusters in tension sections, not relief sections
- Element introduction sequence matches Grammarian's vocabulary sequence
- Section durations within 150% of Rhythmist's intended cadence
- No unreachable required areas

### Failure Handling
Category 1 failures return to responsible system for auto-fix. Category 2 anomalies flagged — some auto-fixable, others queued for Joe with anomaly highlighted.

---

## Gate 2: Necessary Conditions (Joe Reviews)

These are conditions without which a game cannot be good. If any one fails, everything downstream is wasted evaluation time.

### NC1: Readable Opening
**Clip:** First 3 seconds, frozen at 3-second mark.

**Joe judges:** Can I instantly answer: What do I control? Where am I? What is "forward"?

**Fail signals:** Player blends into background. No ground plane. No directional pull. Visual noise.

### NC2: Responsive Controls
**Two components:**

**Latency (auto-checked in Gate 1):** < 50ms. Joe never sees this.

**Physics character (comparison clip):** Simulated Player runs identical movement sequence with generated physics AND reference physics. Joe sees 5-second side-by-side of two silhouettes. Judges: same family?

**Fail signals:** Dramatically different jump arc/air control/friction. Generic movement regardless of reference.

### NC3: Teachability Integrity
**Clip:** First new-element safe → dangerous sequence (10-20s).

**Joe judges:** Does the sequence feel intentional? Clear "here's what this is" before "deal with it under pressure"? Could a dying player think "I should have known"?

**Fail signals:** Enemy first appears in combined threat. New mechanic mid-jump with no practice. Escalation from harmless to lethal.

### NC4: Visual Coherence
**Clip:** Slow pan across 3-4 screens (8-12s).

**Joe judges:** One world, one designer? Palette unity, style consistency, density balance.

**Fail signals:** Enemy sprites from different game than tileset. Background/foreground competing. Mixed detail levels.

### NC5: Rhythm Heartbeat
**Clip:** One full tension → relief cycle (15-30s).

**Joe judges:** Does the level breathe? Pressure increase → pressure decrease → earned exhale.

**Fail signals:** Flat difficulty. Random spikes. Imperceptible relief. Too-subtle amplitude.

---

## Gate 3: INUS Conditions

Evaluated only after all Gate 2 passes. Where 👍 vs. 🔥 lives.

### INUS-1: Provocateur Moment
**Clip:** Pattern violation + 5s context (10-15s).
**Joe judges:** Surprising? Fair? Designer's wink or random glitch?

### INUS-2: Aesthetic Personality
**Clip:** Reuses NC4 pan.
**Joe judges:** Point of view? Describable vibe? Or "generic platformer #47"?

### INUS-3: Social Hook (Phase 5+)
**Clip:** First entity interaction (10-20s).
**Joe judges:** Want to talk to this entity? Inner life? Or dialogue box?

### INUS-4: Pacing Arc
**Gate 4 only initially.** Full-level journey evaluation. May become clippable as Pattern Distiller identifies pacing signals.

### INUS-5: Entity Behavior (Phase 5+)
**Clip:** Unprompted entity action (5-10s).
**Joe judges:** Being with motivations? Or sprite following path?

---

## The Three-Tier Rating System

**👎 Thumbs Down:** Something necessary is broken or INUS clearly deficient. Paired with condition ID. Routes to specific agent with rationale.

**👍 Thumbs Up:** Baseline quality met — "comfortable if a player saw this." Positive confirmation of parameter ranges.

**🔥 Fire:** Transcends sum of parts. Flagged for Pattern Distiller analysis — what produced the magic?

### Optional Text Rationale
- **👎:** Prompted ("What broke?") — most actionable
- **🔥:** Prompted ("What was magic?") — gold for Pattern Distiller
- **👍:** Not prompted — adequacy less informative

Voice-to-text preferred for speed.

---

## The Testing UI

### Design Philosophy
Zero navigation. Card feed. Phase-aware. Mobile-friendly.

### Interface
Single-page React app (Vercel). Two modes:
- **Review:** Pre-generated queue from Stress-Tester
- **Generate:** Joe types prompt → clips appear

### Card Flow
Game metadata → clip auto-plays → condition label → 👎/👍/🔥 buttons → optional text → next clip or next game (on fast-fail).

### Session Summary
Games reviewed, fast-fail breakdown by condition, 👍/🔥 counts, pending Pattern Distiller proposals.

### Principles Tab
Pattern Distiller proposals with Approve / Reject / Edit. Evidence links (clips). Confidence level.

### Progressive Build
- Phase 1: Basic cards, 3 clips (NC1, NC2, NC4), ratings, text input
- Phase 2: All NC + INUS clips, Generate mode, session summaries, Principles tab
- Phase 4: A/B comparison, tuning sliders
- Phase 5+: New clips slot in, no UI restructuring needed

---

## Diagnostic Agents

### Simulated Player Agent
Automated pathfinding through generated levels. Basic heuristics (advance toward exit, jump gaps, avoid enemies). NOT trying to play well — traversing as a moderately competent first-time player.

**Output:** Path (coords + timestamps), death log, element encounter log, section timing vs. intended, completion status.

### Moment Extractor
From Simulated Player timeline, clips diagnostically meaningful moments per gate condition.

| Condition | Clip | Duration |
|-----------|------|----------|
| NC1: Readable Opening | Game start, freeze at 3s | 3s |
| NC2: Physics Character | Side-by-side comparison | 5s |
| NC3: Teachability | First safe→dangerous sequence | 10-20s |
| NC4: Visual Coherence | Pan across 3-4 screens | 8-12s |
| NC5: Rhythm Heartbeat | One tension→relief cycle | 15-30s |
| INUS-1: Provocateur | Violation + 5s context | 10-15s |
| INUS-3: Social Hook | First entity interaction | 10-20s |
| INUS-5: Entity Behavior | Unprompted entity action | 5-10s |

Clips are deterministic replays from game state log, not screen recordings.

### Comparative Diagnostician
Runs same prompt 5-10 times. Reports: consistent (strong constraints) / varying (creative latitude) / erratic (needs tuning). Joe focuses on erratic column only.

### Archetype Stress-Tester
Canonical prompt battery: pure paradigm, fusion, abstract, stress, social ecology. Auto-runs after parameter/principle changes. Regression detection: flags prompts that previously scored well now failing.

### Pattern Distiller
Converts ratings into transferable principles. Three modes:

**Failure patterns:** Groups 👎 by condition, finds common features, proposes preventive principles.

**Excellence patterns:** Groups 🔥, identifies what distinguishes from 👍, proposes ceiling-describing principles.

**Parameter correlation:** Analyzes which numerical settings produce 👎 vs. 👍 vs. 🔥.

**Output → Living Taste Document:** Proposed principles with evidence + confidence. Joe approves/rejects/edits. Approved principles injected into agent constraints. Effectiveness tracked — principles that don't reduce 👎 rates after 20+ evaluations flagged for reconsideration.

---

## Joe's Workflow Per Session

### Quick Review (15-20 min)
Open bookmark → swipe through Gate 2/3 clips → rate → check Principles tab → close. 15-20 games processed.

### Deep Calibration (30-45 min, periodic)
Quick review + play 2-3 games for 5-15 min each (Gate 4). Calibrates that clip-based funnel catches what matters.

### Post-Tuning Verification (10 min)
Stress-Tester auto-runs → review changed clips only → confirm no regressions.

---

## Phase-Gating

| Phase | Gate 2 (Necessary) | Gate 3 (INUS) |
|-------|-------------------|---------------|
| 1: Paradigm Engine | NC1, NC2, NC4 | — |
| 2: Experience Intelligence | + NC3, NC5 | INUS-1, INUS-2 |
| 3: Aesthetics | unchanged | + aesthetic depth |
| 5: Entity Minds | + NC6 candidate | + INUS-3, INUS-5 |
| 6: Social Ecology | NC6 confirmed | + INUS-6 (CAS) |
| 7: Genre Transformation | unchanged | + INUS-7 (genre shift) |
| 8: Overseer | unchanged | + INUS-8 (Overseer presence) |

Each phase begins with more holistic playthroughs (calibration), then shifts to faster clip-based funnel.

---

## Integration with Existing Architecture

Diagnostic framework wraps around existing pipeline — does NOT replace any agents.

```
Existing: Pipeline → Game
Diagnostic: Game → Simulated Player → Gate 1 → Clips → Joe → Distiller → Principles → Pipeline
```

Coherence Auditor (existing) handles structural compliance. Diagnostic framework handles experiential quality. Complementary.

**Taste Document feeds into:** Grammarian, Rhythmist, Cartographer, Provocateur, Artistic Director, Game Compiler.
