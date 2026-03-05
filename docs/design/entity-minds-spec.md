# Entity Minds & Communication Specification

**Thread 7 Output | 2026-03-04**

---

## Context

Thread 7 was originally scoped to cover the full entity mind and communication system. Audit of existing specs revealed ~80% was already covered by prior threads (Thread 1: Game State Schema, Thread 3: CAS Redesign, Thread 5: VME Spec). This document specifies the five remaining gaps. It supersedes any conflicting details in the original transfer document regarding entity tiering, knowledge distribution, or conversation mechanics.

**References:**
- Game State Schema (`docs/design/game-state-schema.md`) — entity data structures
- CAS Engine Spec (`docs/design/cas-engine-spec.md`) — two-layer architecture, affect/information propagation
- VME Spec (`docs/design/vme-spec.md`) — visual manifestation from Claude interpretation
- Thread 5 `claude.md` — Conversation System Design section, Dramaturgical Agent elimination (Decision 29)

---

## Gap 1: Conversation API Call Structure

### Architecture

Each conversation exchange is a single Claude API call structured as a standard multi-turn conversation. The system prompt establishes the entity's stable identity. The first user message in each conversation contains dynamic state context. Subsequent exchanges accumulate naturally in the messages array.

### System Prompt (per entity, stable across conversation)

Contains:
- Entity identity: name (if named), role, faction, rank, location zone
- OCEAN personality (faction center + individual offset) with behavioral interpretation
- Motivations (if populated)
- Paradigm context: what kind of game this is, current paradigm's conversation surface (between-level dialogue vs. real-time chat vs. formal audience)
- Response constraints: speak in character, respond only from knowledge provided, match the entity's communication style to their personality and affect state, keep responses concise and appropriate to a retro game dialogue box

### Dynamic Context (injected as the opening user message each conversation)

Contains:
- Entity's current affect state (valence, arousal)
- Entity's complete knowledge list (ONLY what this entity knows, with accuracy values per item)
- Entity's bond to player (strength, valence, asymmetry — if bond exists; null if no prior interaction)
- Player reputation as known by this entity (constructed from knowledge items tagged `player_related`)
- Current narrative context (most recent Claude interpretation summary — continuity anchor)
- Conversation state (`never_contacted`, `hailed_rejected`, `spoken_once`, `spoken_multiple`, `allied`, `betrayed`) — gates conversational depth

### Player Messages

Free text input. No menu trees, no pre-written options. The player types whatever they want.

### Entity Responses

Claude generates in-character dialogue grounded in the seven inputs already specified in `claude.md`:
1. Current affect state (valence/arousal)
2. OCEAN personality
3. Knowledge list
4. Bond to player (if any)
5. Faction context and role
6. Previous narrative interpretation (continuity anchor)
7. Paradigm's conversation surface

Responses appear at streaming speed — no slow letter-by-letter text. Full response rendered as fast as the API delivers it.

### Conversation History

Accumulates in the messages array as a normal multi-turn conversation. Claude naturally maintains coherence without re-engineering. History persists for the duration of that conversation session. When the player walks away and returns later, a new conversation starts with updated dynamic context (affect may have changed, new knowledge may have arrived, bond may have shifted).

### No Artificial Soft Caps

There are no injected "wrap it up" instructions and no per-entity exchange limits. Claude plays the character naturally. An entity with a tiny knowledge list and low extraversion will naturally give short, sparse answers. A faction leader in a complex negotiation will sustain long exchanges because the content supports it. The entity's personality, knowledge depth, and situation determine conversation length organically.

### Cost Control: Player Exchange Budget

Cost management is entirely on the player side via a **visible exchange counter** displayed in the game UI (alongside existing counters like score, lives, time). The player receives X conversation exchanges per 24-hour period. Each exchange (one player message + one entity response) decrements the counter by 1. When the counter reaches 0, the player cannot initiate new conversations until the counter resets.

This is transparent, gamified, and tierable:
- Free tier: modest daily budget (exact number TBD during testing)
- Paid tiers: larger budgets
- The counter creates strategic resource management — players learn to spend exchanges on high-value conversations rather than wasting them on idle chat

Wasting an exchange on an irrelevant prompt (e.g., asking a goomba about music) still costs one exchange. Claude responds in character (confusion, irritation, bewilderment) — the player learns not to waste their budget.

### Post-Conversation Processing

After the player ends a conversation (walks away, closes dialogue):

1. **Entity affect updates** — conversation events processed through normal CAS rules. What the player said is categorized as information events (category 3) and attention events (category 4).
2. **Bond updates** — player-entity bond valence/strength shift based on attribution from the interaction.
3. **Knowledge transfer** — anything the player revealed becomes a knowledge item in the entity's list, tagged `source: player`. Anything the entity shared is now known to the player (tracked in player state for consistency checking).
4. **Propagation queued** — at the next CAS tick, the entity may share information from the conversation with their social connections, subject to normal propagation rules (accuracy degradation, emotional charge decay, E-modulated speed).
5. **`conversation_state` advances** — `never_contacted` → `spoken_once` → `spoken_multiple` etc.

---

## Gap 2: Entity Population Architecture

### The Scaling Problem

Games may contain anywhere from 40 to several thousand entities. Individually populating a full mind (OCEAN offsets, knowledge list, motivations, social graph position) for every entity is prohibitively expensive at the high end and unnecessary for entities the player will never interact with meaningfully.

### Solution: Named Entities + Population Entities with Runtime Promotion

**Named entities** are individually generated by the Game Compiler with:
- Unique OCEAN personality offsets (not just faction center)
- Individual knowledge list (length varies by narrative weight)
- Specific motivations
- Explicit social graph connections
- `communication_willingness` computed from personality + role

The Game Compiler decides which entities are named as part of world generation. This is a natural extension of its existing work — it's already designing faction structure, hierarchy, social graph topology, and narrative premises. Entities that occupy key structural positions (commanders, scouts, diplomats, the sage/oracle, merchants, specialists, social graph bridge nodes) are named. In a 40-entity platformer, most entities may be named. In a 500-entity RTS, 60-100 might be named.

**Population entities** are generated in batches from templates. A cluster of patrol goombas shares:
- The faction's OCEAN center (no individual offset)
- A shared minimal knowledge list (ambient facts everyone in that unit knows)
- A shared `communication_willingness` baseline
- Small random perturbations so they're not identical (slightly different affect starting values, minor behavioral parameter variation)

Population templates are compact — one template covers an entire class of entities. The game state stores the template once and references it, not N copies of the same data.

### Runtime Promotion

**When the player initiates conversation with a population entity, that entity is promoted to a named entity in real time.** The first conversation exchange triggers individuation:

- Claude generates unique OCEAN offsets (constructed from the population template + current CAS state + the conversational context)
- A name is generated (if the player asks or the situation warrants)
- A specific knowledge list is constructed (drawing from the population template's ambient knowledge + any recent events this entity witnessed + location-appropriate facts)
- The entity gets a permanent entry in the game state as a named entity

From that point forward, the promoted entity has a persistent individual mind. They remember this conversation. They have their own CAS trajectory. They can be sought out again.

This is Barrett's constructionism applied literally: the entity's individual identity is **constructed at the moment of social interaction**, not predetermined. Before engagement, they're a statistical member of a population. After engagement, they're a person.

### Cost Profile

- Game Compiler generates ~60-100 named entities and a handful of population templates (regardless of total entity count)
- Runtime promotion costs one conversation exchange from the player's daily budget (no additional hidden cost)
- Game state stores full minds for named entities, compact templates for populations
- A 2,000-entity game costs barely more to generate than a 100-entity game

### Communication Willingness for All

Every entity — named or population — has a `communication_willingness` value. For named entities, this is individually computed from personality + affect + faction context. For population entities, it's inherited from the template with perturbation.

An entity that refuses to communicate is making a **choice**, not hitting a system limitation. A terrified goomba refuses because it's terrified. A deeply loyal guard refuses because the player is the enemy. If circumstances change (morale crashes, reputation shifts), willingness may change too. The refusal itself is socially legible — the manner of rejection (cowering, snarling, ignoring) communicates CAS state through behavioral legibility.

---

## Gap 3: Knowledge Distribution Pipeline

### Overview

Knowledge distribution is a **sub-step within the Game Compiler**, not a separate agent. The rules are mechanical (algorithmic), not creative (requiring Claude judgment). The Game Compiler generates the world, then distributes knowledge fragments deterministically.

### Step 1: World Truth Generation

The Game Compiler (with Claude) creates the complete world: faction plans, secrets, vulnerabilities, power dynamics, lore seed placements, resource distributions, strategic positions. This produces a **master fact list** — the god's-eye view of the world. The master fact list lives in game state but is NEVER served to entities or to Claude during entity conversation.

### Step 2: Fact Tagging

Each fact in the master list is tagged with:
- **Domain:** military, social, geographic, economic, lore, player_related
- **Sensitivity:** how restricted access is (0.0 = public knowledge, 1.0 = top secret)
- **Source locations:** where in the world this fact originates (zone IDs, faction IDs)
- **Resolution level** (for lore/special knowledge): ambient, structural, or actionable

### Step 3: Distribution Algorithm (Deterministic)

For each **named entity**, iterate through the master fact list and assign based on:

1. **Location match:** Fact's source location overlaps entity's zone → assigned at high accuracy (0.8-1.0)
2. **Role match:** Fact's domain matches entity's role → assigned at moderate accuracy (0.6-0.8). Role-domain mappings:
   - Guards, soldiers → military facts
   - Cooks, bartenders, servants → social gossip (high volume, low sensitivity)
   - Scouts → geographic + player movement facts
   - Merchants, traders → economic facts + trade route knowledge
   - Commanders, leaders → strategic/military facts (higher sensitivity access)
   - Sages, oracles → lore facts (structural and actionable resolution levels)
3. **Rank filter:** Facts with sensitivity above the entity's rank clearance are excluded entirely. A foot soldier never receives strategic plans regardless of location or role match.
4. **Social graph seeding:** After direct assignments, run one propagation pass — each entity "shares" with their closest social connections (bond strength > 0.5), with standard accuracy degradation per hop. This gives entities secondhand knowledge at generation time so the world feels lived-in before the player arrives.
5. **Lore placement:** Per existing spec — actionable knowledge goes to the sage/oracle entity (placed by Game Compiler). Structural knowledge goes to high-rank or well-connected figures. Ambient knowledge gets scattered widely at low accuracy across many entities.

For **population entities**, the template receives only:
- Facts matching the population's zone at low accuracy (0.3-0.5)
- Ambient lore items
- One or two role-appropriate facts if the population has a defined role

### Step 4: Misinformation Injection

The Game Compiler (Claude) generates a small set of false facts — propaganda, strategic deceptions, paranoid rumors — and injects them into specific entities' knowledge lists with **high confidence values**. These are indistinguishable from true facts by metadata. They propagate through the same CAS information propagation system. The player cannot identify misinformation by inspecting the system — they must triangulate across multiple sources, exactly like real intelligence gathering.

The antagonist can also inject misinformation at runtime as a strategic action (already specified in the antagonist response menu).

### Runtime Knowledge Changes

After initial distribution, all knowledge changes are handled by the CAS engine's information propagation mechanism. New events create information packets. Packets travel along bonds with accuracy degradation and emotional charge decay. No further algorithmic distribution steps are needed — the CAS handles everything.

---

## Gap 4: Lie and Contradiction Detection

### Design Principle

There is no lie detector. Contradictions are detected through the existing CAS information propagation system. No new systems or mechanics are needed.

### How It Works

1. **Player tells Entity A something.** This becomes a knowledge item in Entity A's list: `{type: "player_related", content: "Player claims to be helping Bowser", source: "player", accuracy: 1.0}`

2. **Player tells Entity B something contradictory.** Entity B gets: `{type: "player_related", content: "Player claims to be overthrowing Bowser", source: "player", accuracy: 1.0}`

3. **Information propagates.** At CAS ticks, Entity A and Entity B may share information with their social connections (subject to extraversion, emotional charge, bond strength). If A and B are connected — directly or through intermediaries — the contradictory claims will eventually reach an entity that holds both.

4. **Claude interprets the contradiction.** When Claude interprets CAS state for an entity holding contradictory player-sourced claims, Claude constructs the appropriate response: suspicion, confrontation, gossip about the player's untrustworthiness. No special contradiction-detection code is needed — Claude recognizes contradictions in the knowledge list naturally.

5. **CAS consequences follow.** The entity's bond valence toward the player drops (normal attribution mechanics — receiving confusing/negative information from a source weakens the bond). This affect change propagates to the entity's connections. The player's reputation (constructed by perceivers, per Barrett) degrades not because an algorithm fired, but because the social graph did what social graphs do.

### Speed of Detection

Contradiction detection speed is governed by the same factors as all information propagation: bond topology, entity extraversion, emotional charge of the information. A lie told to two closely connected entities surfaces quickly. A lie told to entities in isolated social clusters may never surface — or may surface much later when a bridge entity connects the clusters. This creates realistic asymmetry: some lies are easy to get away with, others are impossible, depending on the social structure.

### Deliberate Deception by Entities

Entities can also lie to the player. This is Claude-constructed from the entity's personality + affect + motivations + knowledge. An entity with low agreeableness, negative bond valence to the player, and knowledge the player wants might deliver false information. The player has no metadata indicating truthfulness — they must evaluate entity reliability through experience and triangulation, same as the entities evaluate the player.

---

## Gap 5: Emissary and Delegation Mechanics

### Overview

An emissary interaction is a player instructing an allied entity to have a conversation with another entity on their behalf. Mechanically, it's one additional Claude API call where both entity mind schemas are provided.

### How It Works

1. **Player instructs ally.** During a normal conversation with an allied entity, the player gives instructions: "Go talk to the Koopa commander and tell him I want a ceasefire." This costs conversation exchanges from the player's daily budget (however many exchanges that conversation takes).

2. **Instructions become knowledge.** The player's instructions become a knowledge item in the ally's list: `{type: "player_related", content: "Player wants me to negotiate ceasefire with Koopa commander", source: "player", accuracy: 1.0}`

3. **Emissary conversation runs.** At the appropriate CAS tick or between-episode window, the system runs a single Claude API call with:
   - **System prompt:** Both entity mind schemas (emissary and target), including personality, knowledge, affect, bonds
   - **Context:** The player's instructions, the current CAS state, the relationship (if any) between emissary and target
   - **Output:** Claude generates the conversation between them, grounded in both entities' personalities, knowledge, and affect states

4. **Emissary filters the report.** The emissary's version of what happened is constructed through their own personality and honesty:
   - A cowardly emissary (high N, low courage-emergent) might overstate threats from the target
   - A self-interested emissary (low A, low C) might cut a side deal
   - A duplicitous emissary might misrepresent the player's instructions to the target
   - A loyal emissary (high C, strong positive bond to player) reports faithfully

5. **Player gets the report.** In their next conversation with the emissary, the player receives the emissary's version. They never get ground truth about what actually happened — only the emissary's filtered account.

6. **CAS consequences.** The emissary conversation generates events like any conversation: information transfer, affect changes, bond updates between emissary and target. These propagate through the CAS normally.

### Strategic Implications

- **Choice of emissary matters as much as the message.** A trusted, competent emissary is a strategic asset.
- **Trust is mediated.** The player must evaluate their emissary's reliability just as they evaluate any entity's.
- **Multiple emissaries can be deployed** (each costs API calls and player budget).
- **Emissaries can be intercepted or compromised** — if an enemy entity encounters the emissary en route (CAS-driven), the emissary might be captured, turned, or the intelligence might leak.

### Cost

One additional API call per emissary conversation. The player's daily exchange budget is NOT charged for the emissary-to-target conversation (it's not a player exchange), but the instructing conversation with the emissary does count. This means emissary deployment costs the player some exchanges to set up but extends their reach beyond their direct budget.

---

## Schema Implications

### Additions to Entity Data Model

```json
{
  "entity_id": "string",
  "population_type": "named | population",
  "population_template_id": "string | null",
  "promoted_from_population": "boolean",
  
  "// existing fields unchanged:",
  "mind": {
    "personality": { "O": 0.0, "C": 0.0, "E": 0.0, "A": 0.0, "N": 0.0 },
    "affect": { "valence": 0.0, "arousal": 0.0 },
    "motivations": {}
  },
  "knowledge": [],
  "social_graph": [],
  "behavioral_parameters": {},
  "conversation_state": "never_contacted",
  "asset_spec": {}
}
```

### New: Population Template Structure

```json
{
  "template_id": "goomba_patrol_unit_1",
  "faction_id": "koopa_troop",
  "role": "patrol_guard",
  "personality_center": { "O": -0.1, "C": 0.2, "E": -0.1, "A": -0.2, "N": 0.3 },
  "knowledge_base": [
    { "type": "spatial", "content": "patrol zone layout", "accuracy": 0.8 },
    { "type": "social", "content": "commander seems stressed lately", "accuracy": 0.5 },
    { "type": "special", "content": "legends of two lights", "resolution_level": "ambient", "accuracy": 0.3 }
  ],
  "communication_willingness_base": 0.3,
  "behavioral_parameters_base": {
    "patrol_range": 80,
    "patrol_speed": 0.8,
    "awareness_radius": 60,
    "response_behavior": "alert_others",
    "contact_damage": 1,
    "capture_window_ms": 1500
  },
  "perturbation_ranges": {
    "affect_valence": [-0.1, 0.1],
    "affect_arousal": [-0.1, 0.1],
    "communication_willingness": [-0.1, 0.1],
    "patrol_speed": [-0.1, 0.1]
  },
  "member_count": 12,
  "asset_spec": {}
}
```

### New: Player Exchange Budget (in player state)

```json
{
  "player": {
    "exchange_budget": {
      "remaining": 150,
      "daily_limit": 200,
      "last_reset": "2026-03-04T00:00:00Z",
      "tier": "free"
    }
  }
}
```

---

## Relationship to Build Plan

- **Phase 2 (Experience Intelligence):** Game Compiler implements knowledge distribution pipeline (Gap 3) as part of world generation. Population template generation added to Game Compiler output.
- **Phase 5 (Entity Minds):** Conversation API call structure (Gap 1) implemented. Runtime promotion system (Gap 2) built. Exchange budget UI added.
- **Phase 6 (Social Ecology):** Lie/contradiction detection (Gap 4) works automatically via CAS information propagation — no additional implementation needed. Emissary mechanics (Gap 5) added as conversation system extension.
- **No retrofitting required for Phases 1-4.** Entity data model accommodates `population_type` field from the start. Knowledge list and social graph fields exist (potentially empty) from Phase 1.

---

## Decisions Made (Thread 7)

1. **No artificial conversation soft caps.** Claude plays each character naturally; conversation length emerges from entity knowledge depth, personality, and situation. Cost control is entirely player-side via visible exchange budget.

2. **Player exchange budget as game mechanic.** Visible counter in UI. Tierable. Creates strategic resource management. Wasting exchanges on irrelevant prompts is the player's problem.

3. **Named + population entity architecture with runtime promotion.** Named entities are individually generated; population entities share templates. First player conversation promotes a population entity to named, constructing their individual identity in that moment.

4. **Knowledge distribution as Game Compiler sub-step.** Deterministic algorithm (location → role → rank → social seeding → misinformation injection), not a separate agent. Runs once at game creation.

5. **No lie detector.** Contradictions surface through existing CAS information propagation. Claude interprets contradictory knowledge items naturally. Bond valence drops via normal attribution.

6. **Emissary conversations as single API call with dual entity schemas.** Report filtered through emissary personality. Player never gets ground truth. Emissary instruction costs player exchanges; the emissary-to-target conversation does not.

7. **Dramaturgical Agent references eliminated.** Per Decision 29 (Thread 4), all functions formerly attributed to the Dramaturgical Agent are handled by the Game Compiler, paradigm specs, CAS engine, and Claude interpretation layer.
