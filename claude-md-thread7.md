# claude.md — Thread 7 Changes

## Apply these changes to the existing `claude.md`

---

### Key Documents Table — Add Row

| Document | Role | Changes When |
|----------|------|-------------|
| `docs/design/entity-minds-spec.md` | Entity population architecture, conversation API structure, knowledge distribution pipeline, emissary mechanics | When entity/conversation design changes |

---

### Agent Execution Order — Update Game Compiler Description

Replace the Game Compiler parenthetical with:

```
→ Game Compiler (expanded: CAS initial conditions, social graph, personality
                 distributions, social timer pace, drama calibration, skeleton
                 instantiation, social hook placement, initial narrative,
                 knowledge distribution pipeline, named entity individuation,
                 population template generation)
```

---

### Agent Execution Order — Add Conversation and Emissary Blocks to Runtime Loop

After the VME resolution block, add:

```
  Player conversation:
    → Player hails entity (costs 1 exchange from daily budget)
    → If entity willing: conversation opens (multi-turn Claude API call)
    → If entity unwilling: rejection displayed (manner communicates CAS state)
    → Post-conversation: events enter CAS, bonds update, knowledge propagates
    → If population entity: promoted to named on first exchange

  Emissary conversation (if player delegates):
    → Player instructs ally (costs player exchanges)
    → Single Claude API call with both entity schemas
    → Emissary reports filtered through own personality
    → Events from emissary conversation enter CAS normally
```

---

### Generation Flow — Update Skeleton Section

Add to the skeleton generation step:

```
  + Knowledge distribution (master fact list → entity knowledge lists)
  + Population templates generated for batch entity classes
  + Named entities individually realized
```

---

### Conversation System Design Section — Add Subsections

After the existing conversation system content, add:

#### Conversation API Architecture

Each conversation exchange is a single Claude API call structured as multi-turn conversation. System prompt contains entity stable identity (name, role, faction, OCEAN, motivations, paradigm context, response constraints). Opening user message contains dynamic state (affect, knowledge list, bond to player, player reputation, narrative context, conversation_state). Player messages are free text. Conversation history accumulates in the messages array naturally.

#### Player Exchange Budget

Visible counter in game UI. X exchanges per 24-hour period. Each exchange = one player message + one entity response. Tierable for monetization. The constraint is a game mechanic creating strategic resource management.

#### Entity Population Architecture

Full specification: `docs/design/entity-minds-spec.md`

Two populations: **named entities** (individually generated, ~60-100 per game) and **population entities** (batch-generated from templates). Population entities are promoted to named at runtime when the player first talks to them — Claude constructs their individual identity at the moment of interaction. Every entity has `communication_willingness`; refusal is a choice, not a system limitation.

#### Knowledge Distribution

Sub-step of Game Compiler. Deterministic algorithm: location match → role match → rank filter → social graph seeding (one propagation pass) → misinformation injection. Runs once at game creation. Runtime knowledge changes handled by CAS information propagation.

#### Contradiction Detection

No lie detector. Player statements become knowledge items tagged `source: player`. Contradictions surface through CAS information propagation when incompatible claims reach the same entity or cluster. Bond valence drops via normal attribution.

#### Emissary Mechanics

Player instructs allied entity to negotiate on their behalf. One Claude API call with both entity schemas. Emissary filters report through own personality. Player never gets ground truth. Emissary instruction costs player exchanges; emissary-to-target conversation does not.

---

### Open Design Work — Update

**Resolved by Thread 7:**
- ~~Entity mind specification~~ ✅ (Threads 1, 3, 7)
- ~~Conversation API structure~~ ✅
- ~~Knowledge distribution mechanism~~ ✅
- ~~Lie/contradiction detection~~ ✅
- ~~Emissary/delegation mechanics~~ ✅

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
