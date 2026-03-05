# claude.md — Thread 7.6 Changes

## Apply these changes to the existing `claude.md`

---

### Paradigm Grammar Framework Section — Add Episode Brief Subsection

After the existing Layer 3 (Override Conditions) content and before the Five Experience Primitives section, add:

#### Episode Brief (Skeleton-to-Sequencing Interface)

At each episode boundary, the Game Compiler produces an **Episode Brief** — a structured object that translates the static skeleton into per-episode marching orders for the sequencing agents (Grammarian, Rhythmist, Cartographer, Provocateur, Coherence Auditor). The sequencing agents read the Episode Brief, never the skeleton directly.

The Brief is generated **dynamically at episode entry**, reading skeleton + CAS state + Claude interpretation + previous vocabulary record. This is what makes non-linear paradigms work: the same stage produces different Briefs depending on what the player has already completed.

**Episode Brief fields:**
- **Available vocabulary** — established (taught previously) / new (needs teachability arc) / variant (CAS-modified, with behavioral delta indicating teachability investment needed)
- **Complexity ceiling** — max new elements this episode (from skeleton budget)
- **Difficulty target** — 0.0–1.0 normalized position on skeleton's difficulty shape
- **Punctuation** — structural beat: normal / mini-boss / boss / breather / finale
- **Zone identity** — environment + its mechanical meaning
- **Mechanical thesis** — from Claude interpretation: the productive friction this episode foregrounds (e.g., "patience vs. urgency"). Organizing principle for the Grammarian, not a content constraint. Also enables CAS-to-feel influence on level design.
- **Narrative context** — relevant CAS state for level design
- **Override flags** — active skeleton overrides

**After episode completion:** Vocabulary Record Update is written (what was placed, not what was experienced). The next Episode Brief reads this to determine what's "established."

Full specification: `docs/design/sequencing-grammar-framework.md`

---

### Key Documents Table — Add Row

| Document | Role | Changes When |
|----------|------|-------------|
| `docs/design/sequencing-grammar-framework.md` | Within-episode sequencing primitives, Episode Brief interface, per-paradigm grammar seeds, agent responsibilities | When sequencing logic or skeleton-to-sequencing interface changes |

---

### Open Design Work — Update

**Resolved by Thread 7.6:**
- ~~Skeleton-to-sequencing interface~~ ✅ (Episode Brief, Decision 46)
- ~~Cumulative vocabulary tracking across episodes~~ ✅ (behavioral delta + vocabulary record, Decisions 48-49)

**Remaining (updated list):**
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
