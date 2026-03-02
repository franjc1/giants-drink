# Two Fires — Design Decisions Log

Running record of every significant design decision made during development. Newest first within each section.

---

## Naming & Identity

**Game is named Two Fires. Repo stays `giants-drink`.**
The repo name is a reference to the cosmology (the Giant drinks from the fires). The shipped game title is Two Fires. These never need to match.

---

## Asset System

**Two-track asset resolution with single `ASSET_MODE` toggle.**
- Track A (Reference): Real game assets from ingested library. Internal use only. Never shipped.
- Track B (Generated): Programmatically generated original assets. Public release.
- The agent pipeline produces identical semantic asset specs for both tracks. Only the final resolution step differs.
- Toggle: `ASSET_MODE = "reference" | "generated"` in config.
- Track A is the ground truth for visual fidelity during development. Track B is what players see.
- Color palettes, sprite dimensions, silhouette vocabulary, physics parameters — NOT copyrightable. Only the specific pixels are. We can use everything except the pixels.

**Spriters Resource is image-only for Track A lookup, not text extraction.**
The batch scraper skips full text extraction for spriters_resource entries and records the URL for manual asset pipeline use.

---

## World Travel & The Giant

**Cross-world travel costs are SOCIAL, not medical.**
- Traveling between worlds requires sacrificing something social: betraying a trust, sacrificing a relationship, harming something carefully built.
- Nobody gets sick from cross-world travel.
- Sickness ONLY occurs when breaching to the Giant's dimension — specifically, entities near the dimensional tear get sick.
- This distinction is load-bearing: travel between worlds is a social-cost system. The Giant's dimension breach is a physical-world consequence.

**The Giant IS the adaptive difficulty system (Overseer).**
- The narrative antagonist and the mechanical difficulty Overseer are the same entity.
- The Giant wants the player challenged but not crushed, engaged but not successful enough to find him.
- These goals are in mechanical tension: keeping players playing (sustains the flames) vs. keeping players from winning (self-preservation).
- This identity is never stated to the player directly.

**The Giant operates through social manipulation, not direct power.**
- In-world, the Giant appears as a stranger, advisor, or shadowy figure.
- He manipulates entity dispositions and faction strategies.
- He is not omnipotent — described as "another player, very clever with the social dimension."

---

## Social Ecology

**Every entity is unique — no templates, no group entities.**
- Every goomba has its own name, personality, knowledge, and disposition.
- Entities share faction baseline stats but have individual offsets.
- No entity is interchangeable with any other.

**Entities can lie. Players can be discovered lying.**
- Entities with certain personality types (loyal to an enemy, cowardly) may give disinformation.
- When contradictory information packets reach the same entity, lie detection triggers.
- Player trust degrades and propagates through the social graph as its own information packet.

**Free text input for all conversations. No dialogue trees.**
- Players type whatever they want. Claude interprets and responds in-character.
- Entities cannot reveal information not in their `knowledge.knows` list, regardless of what the player says or asks.
- The conversation system enforces knowledge boundaries at the Claude call level — it's in the system prompt.

**CAS state MUST be visible during gameplay via the Manifestation Layer.**
- Social/political dynamics are not hidden behind a menu. They show up as entity behavior changes, environmental details, population shifts.
- Manifestation Translation Table maps CAS state ranges to concrete visual/behavioral changes per paradigm.
- Examples: `faction.morale < 0.3` → slower patrol, dejected idle, some abandon posts.
- The feedback loop: player sees political situation → acts → generates CAS events → new manifestation.

---

## The Cosmology & Endgame

**Both factions are wrong about the flames.**
- Antagonists (Bowser, Ganon, Dr. Wily) believe the dark flame = ultimate power.
- Protagonists (Peach, Zelda, Dr. Light) believe the light flame = pure goodness/salvation.
- Both interpretations are locally coherent and cosmically wrong.
- Neither fire should be wielded — they must exist in tension together.
- Players who build trust with both sides hear both interpretations and may notice they're describing the same structure.

**The winning move (return both flames) is never stated by any NPC.**
- The answer is assembled from lore fragments across multiple games, never directly told.
- The visual cues in the Giant's dimension confirm the correct action: fires held together pulse like a heartbeat; carried toward the tear, the pulse synchronizes.
- The buried lore detail: "The Giant was once a normal person who took something and killed everyone. This needs to be returned." This is the key. It looks like a minor footnote.
- The abductive leap is the game's thesis: what appears to be binary opposition (creation/destruction) is a necessary partnership.

**The Giant's speech is honest but framed as a false choice.**
"One creates. One ends. I've held them both since before your worlds existed. They're yours now if you want them. Take one against me. Take one for yourself. Do whatever you came here to do."
He tells the truth about the fires' nature. He frames it as a choice hoping the player misunderstands.

---

## Level Generation

**Three sequencing primitives: Teachability, Rhythm, Directionality.**
- Teachability: Every element introduced safely before appearing dangerously. 3-6 screen arcs.
- Rhythm: Tension and relief alternate at paradigm-appropriate cadence (45-90s for platformers).
- Directionality: Player always knows what "forward" means. Optional content legible as optional.
- All three must be satisfied simultaneously. Violation of any one produces the "off" feeling.

**Level generation agent stack: Grammarian → Rhythmist → Cartographer → Provocateur → Coherence Auditor.**
- Grammarian: Vocabulary sequence — element introduction order.
- Rhythmist: Temporal shape — abstract tension/relief waveform.
- Cartographer: Specific element placement satisfying all constraints. Pattern-matches against real level structures from ground truth.
- Provocateur: Exactly one deliberate pattern violation per level, in the final third, fair.
- Coherence Auditor: Binary pass/fail per primitive. Targeted revisions to responsible agent, not full regeneration.

**The Provocateur Principle: one rule break per level.**
Great levels contain exactly one moment where the established pattern is meaningfully violated. Not randomly — deliberately. Fair (player has the tools), located in the final third.

---

## Pipeline & Data

**Ground truth ingestion target: 850+ games across NES/SNES/Genesis/PC.**
- NES: 300+ games
- SNES: 250+ games
- Genesis: 200+ games
- PC: 100+ games
- Every game with any documentation (Tier 1/2/3).
- Tier 1 = ROM disassembly or source code released (exact values).
- Tier 2 = community-documented (speedruns, modding).
- Tier 3 = empirical/qualitative (descriptors only).

**Data extractor calls Claude Haiku by default. Sonnet available via `--model=sonnet`.**
Haiku is fast and cheap for structured extraction tasks. Sonnet available when extraction quality is insufficient.

**One dimension per Claude extraction call. Target <8000 tokens output.**
Dimensions: physics, visual_identity, audio, level_sequences, game_design, manifestation.
Never extract all dimensions in one call. Chunking prevents truncation and enables targeted retries.

**Batch scraper saves raw text locally before any Claude processing.**
This separates web access (scraper) from intelligence (extractor). Extractor has no web access — safe for unattended overnight runs.

---

## Technical Architecture

**Event bus (events.js) for all cross-system communication. Systems never import each other.**
The body (paradigm/physics/rendering) and the brain (social ecology, CAS, Giant) communicate only through the event bus and the JSON game state schema. This is what makes paradigm-swapping possible without touching social code.

**All Claude API calls through `src/agents/api-client.js`.**
The api-client handles routing, cost tracking, daily budget cap enforcement, error handling, and retry logic. No Claude calls outside this module.

**Model selection: Sonnet for creative generation. Haiku for evaluation and extraction.**
- Creative: world generation, entity minds, dialogue, Giant reflections.
- Evaluative: CAS interpretation, win condition checks, coherence auditing.
- Batching: combine multiple outputs into one call where possible (e.g., CAS + narrative + win condition in one response).

**Daily budget cap enforced per player.**
When cap is reached, conversations become unavailable until reset. This is a production safety measure, not a design limitation.

---

## What Is Explicitly Not Being Built (Phase 1)

- No AI agent calls (hard-coded test levels)
- No social ecology (entities are pure gameplay — patrol, stomp)
- No conversation system
- No WebGL shaders (Canvas 2D only)
- No music (basic SFX only)
- No save system (refresh = restart)
- No account system
- No multi-paradigm support
