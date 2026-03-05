# Decisions Log — Thread 7.6 Addition
## Append this content to the existing `docs/decisions-log.md`

---

## Session: 2026-03-04 — Sequencing Grammar Refinement (Thread 7.6)

### Decision 46: Episode Brief as Skeleton-to-Sequencing Interface

**Context:** Thread 4 established the paradigm grammar + skeleton + override conditions framework for across-episode game structure. The original sequencing grammar framework (Thread 2 era) specified within-episode quality through three primitives (teachability, rhythm, directionality) and five agents (Grammarian, Rhythmist, Cartographer, Provocateur, Coherence Auditor). But no interface was specified between these two layers. What does the Grammarian actually receive when generating an episode?

**Decision:** The **Episode Brief** — a structured object produced by the Game Compiler at each episode boundary — is the interface. The sequencing agents read the Episode Brief, never the skeleton directly.

The Episode Brief contains eight fields: available vocabulary (established/new/variant with behavioral delta), complexity ceiling, difficulty target (0.0–1.0), punctuation type (normal/mini-boss/boss/breather/finale), zone identity (environment + mechanical meaning), mechanical thesis (from Claude), narrative context (relevant CAS state), override flags.

The Brief is generated **dynamically at episode entry**, not pre-computed. The Game Compiler reads skeleton + CAS state + Claude interpretation + previous vocabulary record and produces the Brief for this specific episode at this moment. This is critical for non-linear paradigms: a Mega Man stage produces different Briefs depending on which stages were already completed. An RPG dungeon produces different Briefs depending on the player's accumulated vocabulary.

**Rationale:** The Episode Brief is a constraint surface, not a prescription. It constrains what vocabulary is available and what structural role the episode plays. It does not constrain how the Grammarian sequences vocabulary, where the Rhythmist places tension peaks, or what spatial configuration the Cartographer builds. Analogous to telling a jazz musician "12-bar blues in Bb, medium tempo, these instruments available" — defining the space, not the music.

---

### Decision 47: Mechanical Thesis as Episode Brief Field

**Context:** Stress-testing the Episode Brief against "does it produce great games, not just competent ones?" The best retro levels have a *thesis* — Heat Man's stage is about the tension between patience (disappearing blocks) and urgency (fire environment). A correctly sequenced vocabulary list doesn't produce this quality. Something needs to identify the productive friction in available elements and give the Grammarian an organizing principle.

**Decision:** The Episode Brief includes a **mechanical thesis** field — a short semantic statement from Claude's interpretation identifying the productive friction in this episode's available vocabulary. Examples: "patience vs. urgency," "precision under environmental pressure," "familiar enemies in unfamiliar spatial configuration."

The thesis is produced by Claude at the episode boundary interpretation call (Option C from three candidates evaluated). Claude is already the meaning-maker in the architecture — the system that constructs interpretation from primitives. Adding mechanical thesis to Claude's output is consistent with Barrett's constructionism: the thesis is a constructed perception arising from the combination of available primitives in context.

The Grammarian uses the thesis as an organizing principle for the vocabulary sequence. It doesn't constrain *what* appears, but *what relationship between elements* the sequence foregrounds.

The thesis also enables CAS-to-feel influence without changing mechanical vocabulary. If a faction is in disarray, the thesis might shift from "coordinated assault" to "desperate ambush tactics" — same enemies, different organizing principle, different experience.

**Alternatives considered:**
- Option A (Grammarian responsibility): Thesis emerges from Grammarian's analysis of vocabulary friction. Elegant but requires expensive intelligence in the Grammarian.
- Option B (Skeleton field): Game Compiler pre-authors thesis at game creation. Consistent with skeleton's authorial role but pushes skeleton toward over-prescription.
- Option C (Claude interpretation — chosen): Most consistent with existing architecture. Claude already interprets CAS state at episode boundaries. Thesis is one more constructed perception.

---

### Decision 48: Vocabulary Tracking via Behavioral Delta, Not Variant Chains

**Context:** CAS-driven entity variants create a tracking problem. Goombas militarize (armored), then develop ranged attacks (rock-throwing). How deep does the variant chain go? Does the Grammarian need to track genealogy?

**Decision:** Variant depth doesn't matter. Teachability investment scales with **behavioral delta** — how different this variant is from what the player already knows — not with taxonomic distance from the base element.

Small behavioral delta (helmet = one extra hit): minimal teachability, one safe encounter showing the difference. Large behavioral delta (new attack pattern): full introduction arc, effectively treated as new element that happens to look familiar.

The Grammarian doesn't track variant chains. Each variant in the Episode Brief carries a behavioral delta value, and the Grammarian allocates teachability proportionally.

**Rationale:** This is what real game designers do. Zelda's blue Darknut vs. red Darknut: teachability investment scales with behavioral difference, not with whether it's technically a "variant." Cleaner architecture, avoids genealogy tracking complexity, produces correct player-facing results.

---

### Decision 49: Vocabulary Record Tracks Placement, Not Player Experience

**Context:** After an episode, the vocabulary record needs updating for the next Episode Brief. Question: does it track what was *placed* (structurally complete teachability arcs verified by Coherence Auditor) or what the player *actually encountered* (dependent on whether they died before reaching certain sections)?

**Decision:** The vocabulary record tracks what was **placed**. If the Coherence Auditor verified that a teachability arc is structurally complete, the element is marked as "established" regardless of whether the player personally completed the arc.

**Rationale:** The sequencing grammar guarantees structural completeness. Whether the player learned through success or failure is a player skill question, not a design quality question. Death teaches — that's fundamental to retro games. Tracking player experience would create a messy dependency on behavioral telemetry and could lead to re-teaching elements the player already understands (they saw the death screen, they know what killed them). Clean separation: design quality is the system's responsibility, player mastery is the player's.

---

### Open Design Work (Updated)

**Resolved by Thread 7.6:**
- ~~Skeleton-to-sequencing interface~~ ✅ (Episode Brief)
- ~~Cumulative vocabulary tracking across episodes~~ ✅ (behavioral delta on variants, vocabulary record update flow)
- ~~Sequencing grammar document outdated~~ ✅ (updated to reflect Thread 4 architecture + Episode Brief)

**Remaining:**
1. Paradigm grammar specifics per paradigm (before Phase 2)
2. CAS state → level content translation per paradigm
3. Multi-paradigm shift mapping mechanics
4. Social hook pattern library
5. Game state schema document update (apply Thread 3 CAS diffs + Thread 5 VME state + Thread 7 entity population fields)
6. Asset resolution strategy document update (reference Game Visual Identity)
7. Mechanical directive format specification (flagged by Decision 39)
8. CAS rate constant calibration (testing phase)
9. MVP definition — minimum compelling first level
10. Exact exchange budget numbers per tier (testing/economics)
