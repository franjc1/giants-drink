# TWO FIRES — Architectural Blueprint for Claude Code

## Read This First

You are building **Two Fires** (repo name: `giants-drink`), a browser-based retro game that appears to be a game generator but is actually a deep social ecology game with a persistent meta-narrative rooted in a cosmology of creation and destruction. The player types a prompt, gets a playable retro game, and gradually discovers that every entity has a mind, the social layer is the real game, and a god-like entity called the Giant spans all their worlds — holding the two fundamental forces of the multiverse hostage.

**Joe is the designer and creative director. You are the engineer.** Joe does not write code. He designs, tests, and directs. Your job is to translate his vision into clean, modular, well-structured code. When in doubt about a design decision, leave a comment and ask — don't guess.

**This file is the source of truth for architecture and conventions.** If something contradicts this file, this file wins. If something isn't covered here, ask before inventing.

---

## The Golden Rule: Modularity

Every system in this game must be **independently buildable, testable, and replaceable.** The social ecology doesn't know what rendering engine is active. The rendering engine doesn't know about faction states. They communicate through the JSON game state and nothing else.

**Why this matters:** We will be adding paradigms (rendering engines), adjusting AI agent prompts, tuning CAS parameters, and revising systems throughout development. If systems are entangled, every change breaks something else. If they're modular, we can swap a platformer renderer for an RPG renderer without touching the social brain.

**The architectural metaphor:** The game has a **body** (rendering, physics, input — paradigm-specific) and a **brain** (social ecology, entity minds, the Giant — paradigm-agnostic). They communicate through a **nervous system** (the JSON game state schema). Swapping the body doesn't require brain surgery.

---

## Tech Stack

- **Runtime:** Pure browser JavaScript. No frameworks, no React, no build tools beyond what's absolutely necessary. The game runs in a single HTML page with a canvas element.
- **Rendering:** HTML5 Canvas (2D context for most paradigms). WebGL for shader effects only (CRT, palette quantization, pixelation). No heavy 3D.
- **Audio:** Web Audio API for chiptune synthesis. No pre-recorded music files in v1.
- **AI:** Anthropic Claude API via Cloudflare Worker proxy. Never expose the API key to the browser.
- **Storage:** Cloudflare KV for save data (accounts required). Browser localStorage only for temporary session state.
- **Auth:** Account system (email + magic link or similar minimal-friction approach). Required for saving. Cross-device sync by default.
- **Deployment:** GitHub → Vercel (auto-deploy on push). Cloudflare Worker for API proxy.
- **Package management:** Minimal. Prefer vanilla JS. If a library is truly necessary, justify it.

---

## File Structure

```
giants-drink/
├── claude.md                    # This file — root architectural blueprint
├── index.html                   # Entry point — loads the game
├── package.json                 # Minimal, for any build tooling needed
├── vercel.json                  # Vercel config
│
├── src/
│   ├── core/
│   │   ├── claude.md            # Engine-specific conventions
│   │   ├── game-loop.js         # requestAnimationFrame loop, timing
│   │   ├── state.js             # Game state management (the nervous system)
│   │   ├── input.js             # Input manager (keyboard, mouse, touch later)
│   │   ├── events.js            # Event bus for cross-system communication
│   │   ├── save.js              # Save/load to Cloudflare KV (account required)
│   │   └── constants.js         # Shared constants
│   │
│   ├── paradigms/
│   │   ├── claude.md            # Paradigm-specific conventions
│   │   ├── platformer/
│   │   │   ├── renderer.js      # Tile-based 2D scrolling renderer
│   │   │   ├── physics.js       # Platformer physics (gravity, momentum, jumping)
│   │   │   ├── camera.js        # Side-scrolling camera
│   │   │   ├── collision.js     # Tile and entity collision
│   │   │   ├── entities.js      # Entity rendering and behavior (patrol, chase, etc.)
│   │   │   └── level-loader.js  # JSON level definition → renderable level
│   │   ├── topdown/             # Future: top-down adventure paradigm
│   │   ├── rpg-battle/          # Future: sprite battle stage
│   │   ├── racing/              # Future: Mode 7 style racing
│   │   ├── rts/                 # Future: scrolling map with unit control
│   │   ├── management/          # Future: SimCity-style management sim
│   │   └── raycaster/           # Future: first-person raycasting
│   │
│   ├── social/
│   │   ├── claude.md            # Social system conventions
│   │   ├── cas-engine.js        # Complex Adaptive System — faction math, propagation, thresholds
│   │   ├── social-graph.js      # Entity relationships, bond strengths, trust
│   │   ├── information.js       # Information packet propagation (including lore and lies)
│   │   ├── conversation.js      # Conversation management — sends entity mind + context to Claude
│   │   └── evaluation.js        # Win condition checks, CAS tick orchestration
│   │
│   ├── agents/
│   │   ├── claude.md            # Agent prompt conventions
│   │   ├── api-client.js        # Cloudflare Worker proxy client (with cost tracking + daily budget cap)
│   │   ├── experience-interpreter.js   # Natural language → primitive profile + dominant_inspiration + dominant_paradigm
│   │   ├── artistic-director.js        # Multi-reference handling, fusion concepts
│   │   ├── visual-compiler.js          # Aesthetic direction → visual parameter set (palette, sprites, tiles, atmosphere)
│   │   ├── design-philosopher.js       # Game conviction / point of view
│   │   ├── world-architect.js          # Setting, factions, win conditions, level outline
│   │   ├── entity-generator.js         # All entities with full unique minds + lore knowledge
│   │   ├── knowledge-distributor.js    # Bounded knowledge assignment + lore fragment distribution
│   │   ├── social-graph-builder.js     # Relationship edges, bonds, trust, hierarchies
│   │   ├── dramaturgical.js            # Tension curves, catalysts, pacing, social hooks, revelation queue
│   │   ├── grammarian.js              # Vocabulary sequence — element introduction order
│   │   ├── rhythmist.js              # Temporal shape — tension/relief waveform
│   │   ├── cartographer.js            # Level content placement satisfying all constraints + manifestation
│   │   ├── provocateur.js             # One deliberate pattern violation per level
│   │   ├── coherence-auditor.js       # Binary compliance check against sequencing primitives
│   │   ├── experience-simulator.js    # Abstract playthrough validation
│   │   ├── social-plausibility.js     # World state consistency + strategy availability check
│   │   ├── level-generator.js          # Orchestrates grammarian → rhythmist → cartographer → provocateur → auditor
│   │   ├── entity-conversation.js      # Entity mind + context → dialogue response + CAS updates
│   │   ├── antagonist-strategist.js    # Antagonist strategy selection (menu + emergent creativity)
│   │   ├── giant.js                    # Giant reflections, observations, behavioral modeling
│   │   └── win-evaluator.js            # World state + win conditions → progress assessment
│   │
│   ├── aesthetics/
│   │   ├── claude.md            # Aesthetics conventions
│   │   ├── asset-resolver.js    # Two-track asset resolution (reference vs. generated mode)
│   │   ├── visual-compiler.js   # Aesthetic direction → visual parameter set
│   │   ├── shaders.js           # WebGL shader pipeline (CRT, palette, pixelation)
│   │   ├── palette.js           # Color palette management
│   │   ├── sprite-renderer.js   # Renders sprites from semantic specs (Track B)
│   │   ├── music.js             # Chiptune synthesis from emotional primitives
│   │   └── sfx.js               # Sound effects
│   │
│   ├── ui/
│   │   ├── loading-screen.js    # Progressive reveal of world context during generation
│   │   ├── dialogue-ui.js       # Conversation interface (free text input, fast display)
│   │   ├── hail-system.js       # Social interaction initiation + accept/reject indicators
│   │   ├── cutscene.js          # Giant appearances, dramatic moments, paradigm shift transitions
│   │   ├── hud.js               # Health, inventory, etc.
│   │   ├── world-menu.js        # World selection / save-load screen
│   │   ├── prompt-input.js      # Initial prompt entry + clarification flow
│   │   └── auth.js              # Account creation / login
│   │
│   └── meta/
│       ├── player-profile.js    # Behavioral + strategic profile tracking
│       ├── giant-state.js       # Giant's cross-world state management
│       └── world-manager.js     # Multi-world state, switching, freezing
│
├── tools/
│   └── ingestion/               # Ground truth ingestion pipeline
│       ├── claude.md            # Ingestion agent conventions
│       ├── scraper.js           # Pulls data from ROM hacking sources
│       ├── parser.js            # Structures raw data into ground truth JSON format
│       ├── validator.js         # Validates ingested data against expected schema
│       └── organizer.js         # Files data into correct ground-truth directory
│
├── assets/
│   ├── reference/               # Track A: Real game assets (INTERNAL ONLY, never shipped)
│   │   ├── sprites/             # Sprite sheets from real games, semantically tagged
│   │   │   ├── enemies/
│   │   │   ├── players/
│   │   │   ├── items/
│   │   │   ├── environment/
│   │   │   └── ui/
│   │   ├── audio/
│   │   │   ├── sfx/
│   │   │   └── music-patterns/
│   │   ├── tilesets/
│   │   └── asset-index.json     # Semantic tags for all assets (Track A resolver uses this)
│   ├── generated/               # Track B: Generated original assets (public release safe)
│   └── sprites/                 # Shared placeholder sprites for Phase 1
│
├── data/
│   ├── schema.json              # The master JSON schema definition
│   └── ground-truth/            # THE REFERENCE LIBRARY — real data from real games
│       ├── README.md            # How this library is organized and sourced
│       ├── physics/             # Documented physics parameters from real games
│       ├── palettes/            # Exact color palettes extracted from real games
│       ├── level-patterns/      # Level design structures from real games
│       ├── music/               # Music parameters: tempos, keys, chord progressions
│       ├── sprite-specs/        # Sprite dimensions, animation frames, hitboxes
│       ├── enemy-behaviors/     # Documented enemy AI patterns from real games
│       └── game-design/         # High-level design: difficulty curves, pacing, structure
│
├── workers/
│   └── api-proxy/               # Cloudflare Worker source for API proxying
│       ├── index.js
│       └── wrangler.toml
│
└── tests/
    ├── engine/                  # Paradigm engine tests
    ├── social/                  # CAS engine tests
    └── integration/             # Full-stack tests
```

---

## Coding Conventions

### JavaScript Style
- ES modules (`import`/`export`), not CommonJS
- No classes unless genuinely needed — prefer functions and plain objects
- `const` by default, `let` when mutation is necessary, never `var`
- Descriptive function names that read as actions: `updateFactionStates()`, `propagateInformation()`, `evaluateWinCondition()`
- Comments explain WHY, not WHAT. The code should be readable enough that WHAT is obvious.

### State Management
- **The game state JSON (defined in `data/schema.json`) is the single source of truth.**
- State is stored in a central object managed by `src/core/state.js`
- Systems read state through accessor functions, never by reaching into the object directly
- Systems write state through mutation functions that validate changes and emit events
- NO system stores its own shadow copy of state. If you need a value, read it from the central state.

### Cross-System Communication
- Systems communicate through the **event bus** (`src/core/events.js`), never by importing each other directly
- Example: The platformer physics engine detects "player stomped entity X" → emits event → CAS engine hears event → queues CAS update
- Example: CAS engine processes tick → updates faction states → emits "faction_state_changed" → renderer picks up visual changes
- This is how the body and brain stay decoupled

### Adding a New Paradigm
When adding a new game paradigm (e.g., top-down adventure):
1. Create a new directory under `src/paradigms/`
2. Implement the same interface as `platformer/`: renderer, physics, camera, collision, entities, level-loader
3. Each paradigm module must conform to the **Paradigm Interface** (defined below)
4. Register the paradigm in a central registry
5. NO changes to social/, agents/, meta/, or core/ should be necessary

**Paradigm Interface** — every paradigm must export:
```javascript
{
  init(canvas, levelData),        // Set up rendering context
  update(dt, inputState),          // Physics + entity updates per frame
  render(),                        // Draw current frame
  loadLevel(levelJSON),           // Parse level definition
  getEntityPositions(),           // Return current entity positions for CAS
  applyStateChanges(changes),     // Apply visual/behavioral changes from CAS
  getPlayerState(),               // Return player position, health, etc.
  getControlScheme(),             // Return current control descriptions for HUD/onboarding
  cleanup()                       // Tear down when switching paradigms
}
```

### Claude API Calls
- ALL Claude API calls go through `src/agents/api-client.js`
- The api-client handles: request formatting, Cloudflare Worker proxy routing, response parsing, error handling, retry logic, cost tracking
- Every call is logged with: timestamp, agent name, model used, input token count, output token count, estimated cost
- This log is accessible for debugging and cost monitoring
- **Model selection:** Use Sonnet for creative tasks (generation, complex dialogue, Giant reflections). Use Haiku for evaluative tasks (CAS interpretation, win condition checks).
- **Batching:** Whenever possible, combine multiple tasks into a single call with structured output. Example: a level transition call should return CAS updates AND narrative AND win condition assessment in one response.
- **Piggybacking:** Conversation calls should also return any CAS state changes triggered by the conversation. One call, double duty.
- **Daily budget cap:** The api-client enforces a per-player daily API spending limit (configurable). When the cap is reached, conversations become unavailable until reset. This is a production safety measure.

### Error Handling
- AI calls can fail. Always have a fallback. If a conversation call fails, the entity shrugs or walks away — the game continues.
- Network issues should never crash the game. Queue failed operations for retry.
- State corruption is the worst failure mode. Validate state after every mutation.

---

## The JSON Game State Schema

The full schema is defined in `data/schema.json` and documented in detail in the schema specification document. Here's the summary:

### Four Levels of State

1. **Player Profile** — persistent across all worlds. Identity, behavioral profile, strategic profile, list of worlds.

2. **World State** — per-world, saved. Everything about a single generated world: fiction, entities (every entity is a unique individual with a full mind), factions, social graph, information packets, dramaturgical arc, levels, events log, CAS state. Includes lore knowledge distributed across all entities.

3. **Session State** — runtime only. Player position, velocity, what's on screen, active conversations, pending CAS events. Reconstructed from world state on load.

4. **Meta State** — the Giant. Cross-world persistent. Giant's awareness, player model, appearance phase, reflections, cross-world connections, artifact tracking, progress toward Giant's dimension.

### Critical Schema Rules

- **Every entity is a unique individual.** No group entities, no templates. Every goomba has its own name, personality, knowledge, and disposition. They share a faction baseline but have individual offsets.
- **Every entity has lore knowledge.** Fragments of cross-world mythology, themed to their world and colored by their role, intelligence, and culture. Most entities have vague fragments. The Sage and the Keeper have specific actionable knowledge.
- **Dead entities stay in the schema.** Their death propagates through the social graph. They're marked as dead but not deleted.
- **Entities in non-active levels still update during CAS ticks.** They hear rumors, their faction shifts. They exist in the social simulation even when not rendered.
- **Worlds are FROZEN when not active.** No simulation runs while the player is in a different world. When the player returns, the world is exactly as they left it.
- **The events log is append-only.** Never delete events. The Giant reads them. Post-game readings are built from them. Older events are summarized to manage token counts — memory degrades like real life.
- **Knowledge is architecturally enforced.** An entity's `knowledge.knows` list is the ONLY information it can reference in conversation. The conversation agent must never let an entity reveal something not in its knowledge list.

---

## CAS Engine Design

The CAS (Complex Adaptive System) engine is pure JavaScript — no AI calls. It runs the social physics: faction state updates, loyalty cascades, information propagation, threshold-based phase transitions.

### When CAS Ticks Happen
1. **Level transitions** — always. Full CAS evaluation.
2. **Major events** — mid-level, when a named entity is killed, converted, or persuaded, or when a planned catalyst triggers. Limited to at most one mid-level tick per 3-5 minutes (batch multiple events if they happen in quick succession).
3. **Piggybacked on conversations** — when a conversation produces CAS-relevant outcomes, those outcomes are applied immediately via the conversation response.

### CAS Tick Workflow (in order)
1. Process all pending events from gameplay
2. Run propagation rules (loyalty cascades, information spread, including lore and lies)
3. Check thresholds (faction phase transitions)
4. Call Claude (batched): interpret state changes into narrative + assess win condition + generate Giant observation if due
5. Apply narrative manifestations to upcoming level content
6. Emit events for any visual/behavioral changes the renderer needs to pick up

### What CAS Code Handles (JS, no AI)
- Faction state variable updates (loyalty, cohesion, morale, etc.)
- Cascade mechanics (entity A defects → connected entities' loyalty reduced)
- Information packet propagation along social graph (including lie detection when contradictory packets meet)
- Threshold detection (loyalty < 0.3 → phase transition)
- Resource consumption and constraints
- All the math

### What Claude Handles (AI calls)
- Interpreting CAS state changes into narrative ("The eastern garrison is on the brink of revolt")
- Entity dialogue (every conversation is a real Claude call — no templates, no shortcuts)
- Giant reflections and observations
- Win condition evaluation
- Antagonist strategy selection (menu as starting point, but the antagonist CAN invent strategies not on the menu — Claude should be creative)

### Lie Detection Mechanic
When contradictory information packets reach the same entity:
1. Entity evaluates both sources based on trust scores
2. If the player is the source of the less trusted version, the entity marks the player as potentially deceptive
3. This assessment propagates through the social graph as its own information packet ("the player lied to me")
4. Player's trust score with affected entities decreases
5. Similarly, if the player discovers an entity lied, their trust assessment updates

---

## Conversation System Design

**Every conversation is a real Claude API call.** No templates, no pre-scripted responses. When a player talks to any entity, Claude receives that entity's full mind (personality, knowledge, motivations, current emotional state, faction context, recent events) and generates a genuine, dynamic response.

### How Social Interaction Works (The Hail System)
1. Player approaches any entity and presses the social interaction key (e.g., "T")
2. **If the entity declines:** A visual "X" or rejection indicator appears above/near the entity. Game does NOT pause. Player gets immediate feedback and moves on. The rejection itself is an event (entity refused contact — why? fear? hostility? busy?).
3. **If the entity accepts:** Game pauses. Dialogue interface opens at the bottom of the screen. The frozen game scene remains visible above for spatial context.

### Dialogue Interface
- Entity's name and sprite/portrait at the left
- Entity's dialogue text appears **immediately and fully** — NO slow typewriter effect. Responses appear as fast as Claude generates them.
- Player has a **free text input field** below — they type whatever they want to say
- A visible "[Walk Away]" or "[X]" option always present
- Walking away is recorded as an intentional event that propagates through CAS

### Multi-Turn Conversations
- Each player message is a separate Claude API call with growing conversation history
- The system prompt includes: entity mind, faction state, recent events, knowledge boundaries, lore knowledge, player reputation, full conversation history so far
- **Soft conversation length limits driven by character:** A scared goomba naturally has 2-5 exchanges. A savvy leader might go 50-100. The entity's knowledge, personality, and emotional state determine when they have nothing more to say.
- Claude-as-entity ends the conversation naturally with an [END_CONVERSATION] signal and exit action
- **Production safety:** Per-player daily API budget cap. When reached, conversations become temporarily unavailable.

### Knowledge During Conversation
- Entities can ONLY reference information in their `knowledge.knows` and `lore_knowledge` lists
- The player can TELL entities new information. The entity evaluates it based on personality and trust, and may accept, doubt, or reject it.
- Accepted information is added to the entity's knowledge with a source tag and reliability score
- **Entities can lie.** A loyal enemy might feed disinformation. A coward might tell the player what they want to hear.
- **Player lies can be discovered.** When contradictory information reaches the same entity via different paths, the lie is exposed. Trust in the liar decreases and this propagates through CAS.

### CAS Updates During Conversation
- Every Claude conversation response includes a structured JSON block with any CAS-relevant state changes
- These are applied to world state in real-time during the conversation
- When the conversation ends and gameplay resumes, nearby entities may react to what changed (behavior shifts, repositioning, fleeing)

---

## The Lore System

Every world is steeped in mythology rooted in the Two Fires cosmology. This is how players discover the meta-game through the social ecology rather than through tutorials or UI.

### Two Key Knowledge Holders Per World
- **The Sage:** Knows specifically how to punch through to another world. Shares only with close allies.
- **The Keeper:** Knows about the Giant's artifacts and that you need artifacts from two worlds combined. Different character from the Sage. Shares only with close allies.

### Faction Leaders and the Flames
Major figures in each world (Bowser, Ganon, Peach, Dr. Light, etc.) know about the flames but interpret them through their own worldview. Antagonists see the dark flame as ultimate power. Protagonists see the light flame as salvation. Each is locally coherent, cosmically wrong. Players who build trust with BOTH sides hear both interpretations and may notice they're describing the same structure.

### Universal Lore Fragments
Every entity has `lore_knowledge` — fragments of Two Fires mythology colored by their role, intelligence, and culture:

- A foot soldier might know a folk tale about "the walls between worlds being thin"
- A priest might speak of "the great watcher who sees across all realms"
- A merchant might sell trinkets that are actually depictions of artifacts
- A scholar might dismiss it as superstition but know oddly specific details
- A child might tell a bedtime story that's more accurate than the scholars know

**Lore is world-appropriate:**
- Sci-fi world: theoretical physics, classified research, dimensional theory
- Fantasy world: religious mythology, ancient prophecy, magical lore
- Mario-style world: folk tales, old pipes that "go somewhere impossible," legends of the great turtle god

### The Giant's Folklore
Buried in the lore (and less dramatic/interesting than other stories about the Giant): "The Giant was once a normal person in their world who took something and killed everyone. This needs to be returned." This detail is the key to the endgame. It looks like a minor footnote in the mythology — not the exciting stories of the Giant's power, just a mundane-seeming origin detail. Players who pay attention to the "boring" lore find the clue that matters.

### Why This Design Works
The player who engages deeply with the social ecology — talking to many entities, building relationships, paying attention — naturally accumulates lore fragments. Across multiple games, they notice the same themes in different languages. The meta-game reveals itself to the socially engaged player.

### Lore Revelation Timeline
- **Games 1-2:** Nothing. Player is just playing games. The name "Two Fires" means nothing.
- **Games 2-3:** Ambient texture. A folk song about "two lights in the old dark." A mural showing two flames. Indistinguishable from normal world flavor.
- **Games 3-5:** The Giant emerges. Entities mention a presence. High-ranking figures share their (wrong) interpretations of the flames with trusted allies.
- **Games 5-7:** Crystallization. The pattern across worlds becomes visible. Every conflict maps onto the same tension. "Two Fires" starts to click as a description.
- **Games 7+:** Meta-realization possible. The player can assemble the universal structure across multiple worlds. This is never stated by any NPC — it's the abductive leap.

---

## The Giant and the Two Fires

### Cosmology
At the foundation of the multiverse are two essences — two fires. One is creation (amber, radiating outward). The other is destruction (indigo, pulling inward). They are not good and evil. They are the two forces that, held in tension, make a living universe possible. Creation without destruction is growth without stakes — ennui. Destruction without creation is decay without renewal — emptiness. Together, they produce everything: conflict, resolution, loss, recovery, stakes, meaning.

### The Giant
Eons ago, a being — the Giant — was once an ordinary inhabitant of an ordinary world. He discovered the two fires, understood their nature, and stole them both. Holding both fires in his dimension made him and his world everlasting. He cannot die. But he is not omnipotent — he is ambivalent in the deep sense, driven by two opposing forces simultaneously. He acts from both creation and destruction at once, which means he simply... continues. Forever.

The multiverse outside his dimension has been slowly dying since the fires were taken. Not catastrophically — slowly. Worlds trend toward stagnation over deep time.

**The Giant's core motivation:** He wants to keep playing. The multiverse's activity sustains the flames, and the flames sustain him. Stagnation is his real enemy. But he also knows the flames must be returned or everything dies. He cannot bring himself to do it — returning them kills him. He is an addict who knows the cost and cannot stop.

**His strategy:** Keep the player playing (engaged players sustain the flames) AND keep the player from finding him (the player might take the flames back). These goals are in tension — he needs the player challenged but not crushed, engaged but not too successful. This IS the Overseer's mechanical function. The narrative antagonist and the adaptive difficulty system are the same thing.

### How the Giant Operates in Worlds
The Giant enters worlds not as a towering figure but as an entity within that world's fiction — a stranger, an advisor, a shadowy figure who speaks to faction leaders. He is "another player," very clever with the social dimension, not omnipotent.

### Escalation Across Games
- **Games 1-2:** Observes. No interference. Curious about this new creator.
- **Games 3-5:** Light manipulation. Nudging entities, adjusting dynamics, making familiar strategies less reliable.
- **Games 5-7:** Active antagonism. Appears through intermediaries. Faction leaders mention a stranger who changed their plans.
- **Games 7+:** Known presence. Entities talk about him. The player understands they're in a contest with an intelligence spanning all worlds.
- **Endgame:** The player reaches the Giant's dimension.

### The Factions and the Flames
Every world has conflict — the residual effect of the two fires. Every antagonist (Bowser, Ganon, Dr. Wily) is ultimately driven toward the dark flame — power, dominance, permanent control. Every protagonist force (Peach, Zelda, Dr. Light) is driven toward the light flame — peace, safety, permanent security. Both sides want the same thing: obtain their flame, destroy the other. Both are wrong in the same way.

**Crucially, major figures know about the flames** but interpret them through their own worldview. Bowser sees the dark flame as ultimate military power. Peach sees the light flame as pure goodness. Each interpretation is locally coherent and cosmically wrong. None understand the flames must exist TOGETHER.

### Cross-World Travel (NOT to the Giant)
- Each world has a **Sage** who knows how to travel between worlds. Shares only with close allies.
- **The cost is SOCIAL.** Sacrifice a friend, betray a trust, harm something carefully built.
- No one gets sick from cross-world travel.
- Origin world is frozen while the player is away.

### Travel to the Giant's World
- A separate character, **the Keeper**, knows about the Giant's artifacts.
- The player must find artifacts in TWO different worlds (requires prior cross-world travel).
- Combining the two artifacts tears a hole to the Giant's dimension.
- **THIS causes the poisoning.** Entities near the breach get sick.
- **Why two artifacts from two worlds:** The mechanical expression of the thematic thesis. Recognizing universal structure beneath surface difference IS the abductive leap.

### The Giant's Dimension
- **Visual:** Air Man Stage energy but with all heat pulled out. Deep grays, muted blues. Ancient and still.
- **The Giant:** Enormous, screen-filling, upper body only. Not monstrous — old. Curious when the player arrives.
- **Voice:** REAL human voice (ElevenLabs TTS). The contrast with chiptune gibberish IS the revelation.
- **The Two Fires:** Hover between player and Giant. The ONLY color in the dimension. Deep indigo (collapsing inward) and sharp amber (radiating outward). They hum. They are alive.
- **This is NOT a cutscene.** The player has full control. The fires are objects that can be picked up and carried.

### The Giant's Speech
"One creates. One ends. I've held them both since before your worlds existed. They're yours now if you want them. Take one against me. Take one for yourself. Do whatever you came here to do."

He tells the truth but frames it as a choice he hopes the player gets wrong.

### Endgame Outcomes

**Take one fire against the Giant:** Giant burns, dimension collapses. But only one flame returns. Worlds become all-creation (purposeless abundance, no stakes) or all-destruction (accelerating entropy). Playable but diminished.

**Take one fire for yourself:** Player becomes immensely powerful but only in that flame's domain. The Giant survives. The player has become a lesser version of the Giant. The multiverse continues dying.

**Take one fire back through the tear:** Partially heals the poisoned world but with one-sided effects. Giant survives. Player can return but must rebuild the entire path.

**Take BOTH fires back through the tear (the real solution):** The two flames reunite and cycle together as they were meant to. Indigo clears the poison. Amber rebuilds what was damaged. The world heals. The tear seals. The Giant's dimension collapses. The Giant ceases to exist — not rage, not relief, just quiet recognition that the game is finally over. The flames spread through the multiverse. Worlds regain vitality. The Overseer goes silent.

### Visual Cues (Not Dialogue)
- One fire facing the Giant: flares aggressively. Looks like a weapon.
- One fire facing the tear (way back): dims to gentle glow. Looks like a lantern.
- Both fires held simultaneously: pulse in alternation like a heartbeat. Only happens with both.
- Both fires carried toward the tear: pulses synchronize. Heartbeat steadies. Humming harmonizes. Everything says: this is right.

### How the Player Discovers the Winning Move
Through lore fragments across games. The buried-in-folklore detail: "The Giant was once a normal person who took something and killed everyone. This needs to be returned." The fires are what was taken. The visual cues in the Giant's dimension confirm it for attentive players.

The abductive leap: what appears to be a binary opposition (creation vs. destruction, good vs. evil) is actually a necessary partnership. The player who understands this — assembled from fragments across multiple worlds, never stated by any NPC — makes the right choice.

---

## Generation Pipeline

The player types a prompt and gets a world. The generation pipeline is a multi-step process, NOT a single agent.

### Prompt Handling
- **Clear prompts (80% of cases):** Single prompt → generation begins
- **Ambiguous prompts:** The system can ask up to 2 clarifying questions if it would genuinely improve the experience. High bar — only when clarification would produce a meaningfully better world. This is collaborative world-building, not an interrogation.
- **Nonsense prompts:** Ask for clarification rather than generating garbage
- **Offensive prompts:** Edge is fine. Violence/gore appropriate for the context is fine. Claude's guardrails handle genuinely harmful content.

### Pipeline Steps (Progressive — loading screen shows content as it's generated)

**Step 1: Experience Interpreter** (1 call)
- Input: Player prompt + player profile (for returning players)
- Output: Primitive profile, **dominant_inspiration** (specific game), **dominant_paradigm** (game type — these are SEPARATE decisions), secondary inspirations, emotional tone
- Note: The dominant paradigm might differ from the dominant inspiration. "Mega Man as a racing game" → dominant_inspiration = Mega Man, dominant_paradigm = racing.

**Step 2: Artistic Director** (1 call)
- Input: Primitive profile + all inspiration references
- Output: Resolved aesthetic direction, how to handle fusion concepts, distinctiveness signatures, which inspiration is primary and how secondaries contribute

**Step 3: Design Philosopher** (1 call)
- Input: Resolved direction
- Output: Game conviction ("this game believes mastery through failure is satisfying"), emotional arc intent, what makes this game OPINIONATED rather than generic

**Step 4: World Architect** (1 call)
- Input: Everything above + ground truth data for dominant inspiration
- Output: Setting, backstory, current situation (antagonist's FULL situation — not just "stop the player"), faction structures with initial state values (near tipping points), win condition (specific, operationalized, boolean state checks), estimated game length, level outline for the full game
- **Loading screen begins showing this content to the player**

**Step 5: Entity Generator** (1-3 calls depending on entity count)
- Input: World Architect output
- Output: All entities — every single one unique. Names, personalities, roles, motivations, initial dispositions. The Sage and the Keeper are generated here with their specific knowledge.
- **Loading screen continues: key characters shown**

**Step 6: Knowledge Distributor** (1 call)
- Input: Entity list + world situation + lore templates
- Output: Bounded knowledge for each entity (what they know, what they don't) + lore fragments for each entity (world-appropriate mythology, cross-world hints, Giant folklore distributed in fragments of varying accuracy and specificity)

**Step 7: Social Graph Builder** (1 call)
- Input: Entity list + factions
- Output: Relationship edges, bond strengths, trust levels, command hierarchies

**Step 8: Dramaturgical Architect** (1 call)
- Input: Complete world state
- Output: Tension curve, catalytic events with triggers, social hook placement (late level 1 or early level 2 — a dilemma with two options, each with strong visible consequences), Giant appearance schedule, drama budget

**Step 9: Level Generation** (multiple calls per level, generated as needed)
- Orchestrates the sequencing grammar layer: Grammarian → Rhythmist → Cartographer → Provocateur → Coherence Auditor (see Sequencing Grammar Layer section below)
- Input: Level outline + current CAS state + paradigm + ground truth data + manifestation spec from CAS state
- Output: Fully sequenced level with proper teachability, rhythm, directionality, one provocateur moment, and CAS state visually manifested

**Step 10: Quality Evaluation** (cheap evaluation calls)
- Experience Simulator abstractly plays through the level
- Social Plausibility Checker validates the world state
- On failure: targeted revision to responsible agent, not full regeneration

**Step 11: Dry Tick Validation**
- The CAS engine runs one tick on the initial state with no player actions
- If the world immediately collapses or reaches equilibrium, initial conditions are adjusted and Steps 4-7 may re-run

**Total generation: ~12-16 calls, 30-60 seconds. Loading screen shows progressive content throughout.**

### Seamless Paradigm Mapping
When only the platformer paradigm is built, ALL prompts are mapped to platformer seamlessly — the system doesn't tell the player "I interpreted this as a platformer." It just makes it work. As paradigms are added, the Experience Interpreter can select from available paradigms. The goal for v1 launch is all paradigms available.

---

## Sequencing Grammar Layer — The Intermediate Level Design System

The gap between great moment-to-moment mechanics (micro) and great dramatic arcs (macro) is the sequencing of content within a level. This is where generated games fail — assets can be excellent and the story compelling, but if the level sequencing is arbitrary, the experience feels soulless. This layer is what makes levels feel handcrafted rather than procedural.

### The Three Sequencing Primitives

Every moment in a great retro level simultaneously obeys three sequencing logics. Violation of any one produces the "off" feeling players can't articulate.

**1. Teachability**
Every mechanic, threat, or element is introduced in a safe context before it appears in a dangerous or combined context. New element → safe encounter → escalated encounter → combined encounter. This sequence must complete before overlapping elements are introduced.

Operates at room/screen level. A teachability arc spans 3-6 screens.

**2. Rhythm**
Tension and relief alternate at a cadence appropriate to the paradigm. Neither tension nor relief persists too long. Tension sections must resolve within the paradigm's cadence window. Relief that persists becomes boredom.

Paradigm cadences:
- Shmup: 10-20 second cycles (nearly musical)
- Platformer: 45-90 second cycles
- Action RPG dungeon: 2-4 minute cycles
- Strategy/RTS: 5-10 minute cycles
- Adventure/exploration: variable, player-controlled

**3. Directionality**
At any moment, the player has a clear sense of what "forward" means. The level communicates its own logic spatially. Optional content must be legible as optional. The player should never need to stop and wonder if they've missed something mandatory.

### How They Constrain Each Other (CAS Properties)
- **Teachability constrains Rhythm:** Can't create tension around threats the player hasn't been introduced to.
- **Rhythm constrains Directionality:** Relief sections are where optional content lives. Tension sections must be directionally unambiguous.
- **Directionality constrains Teachability:** Safe introductions must be on the critical path, not in optional areas.

When all three are satisfied simultaneously, the level has **coherent intent at every scale**.

### The Provocateur Principle
Great levels contain exactly one moment per stage where the established pattern is deliberately violated. Not randomly — meaningfully. One per level, in the final third, and it must be fair (player has the tools, just didn't expect to need them here). This is what makes players feel a designer's sensibility rather than a system's logic.

### Level Generation Agent Stack

The Level Detail Generator from the generation pipeline is decomposed into specialized agents:

**Grammarian**
- Input: Paradigm, enemy/element set, dramaturgical arc, paradigm pattern library from ground truth
- Output: Vocabulary sequence — ordered list of when each element can first appear and in what context
- Constraint: No element in dangerous context before safe introduction. No combination before components individually introduced.

**Rhythmist**
- Input: Paradigm, level duration, dramaturgical tension arc, paradigm cadence spec
- Output: Temporal shape — abstract tension/relief waveform with durations
- Knowledge base: Rhythm patterns from ground truth ingestion, paradigm cadence windows

**Cartographer**
- Input: Vocabulary sequence + temporal shape + physics config + paradigm spatial grammar + real level structures from ground truth
- Output: Level content specification — specific element placement satisfying all constraints
- Primary method: Pattern matching against real level sequences from ingested games, not open-ended generation

**Provocateur** (replaces the Rule-Breaking Agent)
- Input: Completed level specification
- Output: Modified level with exactly one deliberate pattern violation in the final third

**Coherence Auditor**
- Input: Final level specification + sequence record
- Output: Pass/fail per primitive + specific revision requests to responsible agent (not full regeneration)
- Checks: teachability compliance, rhythm within cadence window, unambiguous directionality, exactly one provocateur violation in final third

### Per-Paradigm Grammar Seeds

Compact specifications of how the three primitives manifest per paradigm. These are in the ground truth library and serve as the Grammarian's primary knowledge base:

- **Platformer:** 30s teachability window, 45-90s rhythm cadence, horizontal primary axis with vertical branching for optional content
- **Shmup:** 5-10s teachability window, 10-20s rhythm cadence, scroll provides direction, levels are essentially musical compositions
- **Action RPG:** 1-2 rooms per teachability unit, 2-4 min rhythm cadence, locked-door logic communicates structure
- **RPG Combat:** Enemy type introduced solo before combinations, 3-5 encounter rhythm cadence, dungeon map legibility
- **Top-Down/RTS:** Low-pressure unit introduction, 5-10 min macro cycles with 30-60s micro, fog of war as direction mechanic
- **First-Person:** Range-before-close-quarters, 60-90s rhythm cadence, landmark-based navigation

### Level Sequence Record

Every generated level includes a `sequence_record` in the game state:
```json
{
  "element_introductions": [],
  "rhythm_map": [],
  "spatial_grammar": [],
  "provocateur_moment": null
}
```
This is populated by the generation agents and validated by the Coherence Auditor before the level is served. The Paradigm Engine preserves it in game state but doesn't act on it.

---

## Visual System — Two-Track Asset Resolution

### The Problem
The game needs authentic retro visuals for quality and feel. Real assets from commercial games are the ground truth. But shipping those assets publicly is copyright infringement.

### The Solution: Two-Track Architecture with Runtime Toggle
Same pipeline, same agent stack, same JSON configs. The ONLY thing that changes is how semantic asset specs resolve to actual pixels at the final step.

```
Agent Pipeline (identical in both modes)
        │
        ▼
  Semantic Asset Spec (identical in both modes)
  { "type": "enemy", "size": "small", "silhouette": "round_short",
    "palette_profile": "warm_dark", "style_era": "nes_late",
    "style_reference": "goomba" }
        │
   ┌────┴────┐
   ▼         ▼
Track A    Track B
(Reference)(Generated)
Real       Original
sprites    sprites from
from       semantic
library    constraints
```

**The toggle:** `ASSET_MODE: "reference" | "generated"` — a single config flag.

### Track A: Reference Mode (Development + Internal Demo)
Resolves semantic asset specs against the ingested asset library. When the spec says `style_reference: "goomba"`, Track A serves the actual goomba sprite.

- Asset Ingestion Pipeline extracts and catalogs real sprites, tiles, audio from games
- Each asset tagged with semantic metadata (size, palette profile, silhouette class, animation frames, style era)
- Asset Resolver performs nearest-neighbor lookup against semantic tags

### Track B: Generated Mode (Public Release)
Same semantic spec, but used as generation parameters instead of lookup keys.

- Programmatic pixel art generation constrained by dimensions, color count, palette, silhouette class, animation frames
- "NES-era small enemy" = 16x16 pixels, 3-4 colors, clear silhouette, 2-frame walk cycle
- For higher quality: AI image generation with pixel art constraints
- Music and SFX are near-parity from the start (chiptune synthesis from parameters)

### What's Copyrightable vs. What's Not

| Element | Copyrightable? | Track A | Track B |
|---------|---------------|---------|---------|
| Specific sprite pixels | Yes | Used (internal) | Generated original |
| Color palette values | No | Used | Same palettes |
| Sprite dimensions | No | Used | Same constraints |
| Silhouette vocabulary | No | Extracted | Same vocabulary |
| Physics parameters | No | Extracted | Same parameters |
| Level structure patterns | No | Extracted | Same patterns |
| Music melodies | Yes | Referenced | Generated original |
| Music structure/tempo/key | No | Extracted | Same structures |
| Game mechanic designs | No | Used | Same mechanics |

### Semantic Asset Specification Format
The contract between the agent pipeline and the resolution layer:

```json
{
  "asset_id": "enemy_world1_variant",
  "category": "sprite",
  "subcategory": "enemy",
  "visual": {
    "dimensions": [16, 16],
    "color_count": 3,
    "palette_profile": "warm_dark",
    "silhouette_class": "round_short",
    "style_era": "nes_late",
    "animation": { "frames": 2, "type": "walk_cycle", "speed": "slow" }
  },
  "behavioral": {
    "movement": "patrol_horizontal",
    "interaction": "damage_on_contact",
    "defeat_method": "stomp"
  },
  "narrative": {
    "role": "foot_soldier",
    "faction": "koopa_troop",
    "disposition": "reluctant"
  },
  "reference": {
    "style_reference": "goomba",
    "primary_game": "super_mario_bros",
    "notes": "Should read as low-ranking, somewhat pathetic"
  }
}
```

Track A uses `reference` + `visual` for lookup. Track B uses `visual` + `behavioral` + `narrative` for generation (ignores `reference`). The `reference` block exists for Track A and agent communication only.

### Implementation Across Build Phases
- **Phase 0.5:** Ingest real assets (sprites, tiles, audio) alongside documentation. Semantic-tag everything. Build asset-index.json.
- **Phase 1:** Engine references assets by semantic spec, never by filename. Asset Resolver with mode switch. Track B returns colored rectangles with correct dimensions (placeholder).
- **Phase 3:** Build Track B generation. Toggle between modes during testing.
- **Later phases:** Social ecology, entity minds, Giant — all operate on game state, not raw assets. Fully decoupled.

```javascript
const ASSET_MODE = process.env.ASSET_MODE || 'reference';
function resolveAsset(semanticSpec) {
  return ASSET_MODE === 'reference'
    ? lookupFromLibrary(semanticSpec)
    : generateFromSpec(semanticSpec);
}
```

---

## Manifestation Layer — Making CAS State Visible

### The Problem
The CAS engine produces rich social dynamics, but if the player only learns about them through conversations and text, the social layer feels disconnected from gameplay. The player needs to SEE the political situation while platforming.

### The Solution: CAS State → Visual/Behavioral Translation
Every CAS state change manifests through a small set of channels:

- **Entity behavior changes:** Patrol speed, aggression, idle animation, grouping patterns, whether they attack on sight
- **Entity appearance changes:** Color shifts within palette, missing equipment, posture changes, visual indicators (injuries, faction markers)
- **Environmental changes:** New objects in the scene (barricades, propaganda, abandoned equipment, damage), lighting/palette shifts for areas in crisis
- **Ambient changes:** Background activity (distant fires, fleeing civilians, marching troops), sound changes
- **Population changes:** More/fewer entities in an area, different entity types present, abandoned posts

### Manifestation Translation Table
The Cartographer consults this during level generation. It maps CAS state ranges to concrete visual/behavioral changes:

```
faction.morale < 0.3 → entities: slower patrol, dejected idle, some abandon posts
faction.internal_dissent > 0.6 → environment: graffiti, factional symbols defaced
info_packet("player is dangerous") reached area → entities: heightened alert, patrol in pairs
resource_level < 0.3 → environment: empty supply crates, sparse decorations
entity.disposition_to_player > 0.5 → entity: doesn't attack, different posture, may approach
```

This table is paradigm-aware. In a platformer, "dejected morale" = goombas walk slower. In an RTS, it = units have reduced stats and may refuse orders. Same CAS state, different manifestation.

### The Feedback Loop
Manifestation is a CAS in itself. The player SEES the political situation → interprets it → acts on it (socially or mechanically) → generates new CAS events → new manifestation. The visual world IS the social ecology made legible.

### Ground Truth for Manifestation
The ingestion pipeline should capture how real games visually communicate world-state: how Castlevania signals "this area is more dangerous," how Mega Man signals "this is Dr. Wily's territory." These are manifestation patterns the Cartographer can reference.

---

## First Level Design Principles

The first level is disproportionately important. It must simultaneously teach the paradigm's mechanics (the sequencing grammar handles this) AND establish that this world has social texture (this requires additional constraints).

### Three Additional Constraints for Level 1

**1. World legibility in the first 60 seconds.**
Within the first few screens, the player sees environmental evidence of social complexity. Not through text — through the world. An entity that behaves unexpectedly. Environmental details suggesting a story (a broken barricade, a flag at half-mast, two entities from different factions in visible confrontation in the background).

**2. One "wait, what?" moment before the social hook.**
Before the formal dilemma cutscene, one small moment that breaks the expected genre template. An enemy that flinches instead of attacking. An item where it shouldn't be. Something minor but noticeable that plants the seed: this world has more going on.

**3. The social hook connects the dots.**
By the time the cutscene dilemma triggers, the player should have already noticed 2-3 things suggesting social complexity. The hook reframes those observations: "Oh, that goomba that flinched — that's because its faction is demoralized. And now I'm being asked to make a choice about that faction."

These are explicit instructions for the Dramaturgical Architect when designing Level 1.

---

## Quality Evaluation System

### The Problem
How do we know if a generated game is good before serving it?

### The Solution: Evaluator Ecosystem
A small set of evaluator agents that constrain each other, running after generation and before serving:

**Coherence Auditor** (already described in sequencing grammar) — checks level sequencing compliance. Binary pass/fail per primitive.

**Experience Simulator** — abstractly "plays" through the generated level as a decision tree traversal. Checks for dead ends, impossible sections, unreachable areas, pacing problems.

**Social Plausibility Checker** — evaluates the initial world state. Are entity motivations consistent? Does the social graph have realistic dynamics? Are interesting social moves available? Is the win condition achievable through at least 3 distinct strategies?

**Dry CAS Tick** (already designed) — validates initial conditions don't immediately collapse or stagnate.

All are cheap Claude calls (evaluation, not generation). On failure, targeted revision goes to the responsible agent. Not full regeneration — surgical fixes.

### Meta-Optimization Feedback Loop
Over time, evaluators accumulate data about common failure modes. This feeds back into generation agent prompts: "Common failure: Grammarian tends to front-load too many elements in short levels. Ensure no more than 2 new elements per 45 seconds." Agents improve their own prompts based on quality data.

---

## Revelation Queue — Information Delivery Pacing

### The Problem
When multiple CAS events happen in one tick, the player shouldn't be firehosed.

### The Solution: Channel-Aware Delivery
Information reaches the player through channels with different bandwidth:

- **Visual/behavioral** (high bandwidth, immediate): Entity and environmental changes. Player absorbs passively while playing. Handles many simultaneous signals.
- **Conversation** (medium bandwidth, player-initiated): Player talks to someone and learns things. One major revelation per conversation maximum.
- **Cutscene/narration** (low bandwidth, system-initiated): Giant appearances, level transitions. One major revelation per cutscene.
- **Discovery** (variable, emergent): Player figures something out from evidence. Best channel — feels earned — but unreliable.

### How It Works
The Dramaturgical Agent maintains a revelation queue ordered by importance and urgency. At each delivery opportunity (level transition, conversation, cutscene), it pulls the highest-priority item fitting the channel.

Rules:
- No more than ONE major narrative revelation per level transition
- Ambient manifestation carries unlimited minor state changes (they're environmental)
- If the queue grows faster than delivery, items get merged ("goombas AND Bob-ombs both losing morale" = one revelation)
- URGENT items (antagonist attacking, ally in danger) jump the queue and can trigger mid-level events

---

## Social Ecology — Intermediate Layer Guidance

The CAS engine handles most social dynamics emergently. But the Dramaturgical Architect needs guidance on pacing the social experience, analogous to the sequencing grammar for level design:

### Social Teachability
Escalate social complexity gradually. The first social hook is a simple binary dilemma. Later social situations involve more factions, more ambiguity, more consequences. The player's first social encounter should not be a four-faction negotiation.

### Social Rhythm
Alternate social tension and stability. Not constant political crisis. Periods where the ecology is stable enough for the player to build relationships and plan, punctuated by cascades and phase transitions. The CAS threshold mechanics create this naturally, but the Dramaturgical Architect should ensure catalytic events are paced appropriately (not all crammed into one act).

### Social Directionality
The player should always have legible social options — not prescribed but visible. "I could convince the captain, or find the workers, or get intel from the merchant." If the player has NO sense of what to do socially, they'll fall back to pure platforming. Entities should behaviorally signal available social moves (approachability indicators, faction tensions visible in how entities interact with each other).

---

## Social Hook Design

The social hook forces the player to engage with the social dimension early. It occurs late in level 1 or early in level 2 (delayed if the player initiates social interaction on their own).

### What It Is
A cutscene with dialogue where an entity presents the player with a dilemma — a forced either/or choice. Both options produce strong, visible consequences in the gameplay immediately after. The player can also try to reason their way out of the dilemma creatively (which is fine — if they're already doing that, the hook has worked). If the player says nothing / walks away, one of the two options is chosen by default — there is no neutral escape.

### How It Works
1. The cutscene triggers automatically at the designed moment
2. An entity appears and presents the situation through dialogue
3. The player is given a clear either/or choice (free text input still available — they can try creative alternatives)
4. The player responds, or doesn't (non-response defaults to one of the options)
5. Consequences manifest immediately in the next stretch of gameplay — visible, tangible, impossible to miss

### Example (Mario world)
A cutscene triggers. A goomba captain, bloodied from a fight with another faction, stumbles into your path. He tells you: the Bob-ombs are planning a revolt at the bridge in World 2. He can take you there to help crush it (preserving the current order but earning Bowser's attention), or he can lead you to the Bob-omb leader so you can join them (destabilizing the regime but making powerful enemies). If you say nothing, he assumes you don't care and reports to his superiors that you're not a threat — Bowser's forces relax their guard, but the Bob-omb revolt happens without you, and whoever wins remembers you weren't there.

### Key Design Principles
- **No neutral option.** Non-response IS a choice and has consequences.
- **Both options are interesting.** Neither is obviously "right." Both reshape the social ecology in different ways.
- **Consequences are IMMEDIATE and VISIBLE.** Within 30 seconds of gameplay after the cutscene, the player sees the impact.
- **Creative alternatives are welcome.** If the player says something unexpected ("take me to both" or "I want to talk to Bowser directly"), the system rolls with it. The hook has already worked — the player is engaging socially.

---

## Paradigm Transformation

When the social ecology creates a situation the current paradigm can't represent, the game shifts paradigms.

### How It Works Technically
1. Trigger detected by Dramaturgical Agent during CAS evaluation (predefined conditions OR emergent from conversation/social ecology)
2. Transition cutscene plays (Claude-generated narrative bridging the shift, masks generation time)
3. New paradigm module loads, receives the SAME world state
4. State translation: strategic position, allies, enemies carry over. Paradigm-specific state doesn't.
5. Player gets smooth control onboarding for the new paradigm
6. Gameplay continues. CAS engine doesn't care — it reads from the same world state.

### Trigger Conditions (Starting Point — Not Exhaustive)
- Player commands a small group of lieutenants → Zelda/FF-style party movement
- Player commands an army → RTS (Warcraft 2 style)
- Face-to-face negotiation with faction leader → dialogue-focused scene
- Player infiltrates a building → first-person exploration
- Player manages a settlement/organization → management sim
- **Emergent triggers from social ecology:** If the player engineers a racing challenge against Bowser and Bowser accepts, shift to racing paradigm

### Minimum time between shifts: 2-3 levels unless dramatically essential.

---

## Build Plan

### Phase 0.5: Comprehensive Ground Truth Ingestion

Before building the engine, build the reference library. This is the foundation EVERYTHING draws from — physics, visuals, audio, level design, manifestation patterns. Do it once, do it big, do it right.

#### What We're Ingesting Per Game (ALL dimensions, not just physics)

**Physics & Mechanics:**
- Movement parameters, gravity, jump, friction, hitboxes, timing windows
- Enemy behavior patterns, detection ranges, attack cycles, patrol distances

**Visual Identity:**
- Exact color palette (per-level if varying)
- Sprite dimensions and proportions (player, enemies, NPCs, items)
- Tile sizes and visual vocabulary
- Background layer structure and parallax behavior
- Animation frame counts and timing
- Screen resolution and visible play area

**Actual Visual Assets (for Track A reference mode):**
- Sprite sheets from The Spriters Resource and similar archives
- Tile sets, background assets
- Semantic tagging of every asset (size, palette profile, silhouette class, animation frames, style era, behavioral context)
- Build asset-index.json for Track A lookup

**Audio Identity:**
- Music tempo, key, time signature per level/area
- Chord progressions and melodic patterns
- Instrument voicings per console channel
- Sound effect characteristics (jump, damage, death, collect)
- Actual SFX samples where available (for Track A)

**Level Design / Sequencing:**
- Element introduction order (what appears when, in what context — feeds Grammarian)
- Tension/relief rhythm patterns (feeds Rhythmist)
- Spatial structure: linear, branching, how secrets are signaled (feeds Cartographer)
- Difficulty curve shape across the full game
- Enemy density and placement patterns
- Platform spacing relative to jump physics

**Game Design / Meta:**
- Level count, world structure, approximate play time
- Power-up and progression systems
- Lives/continue system design
- Boss design philosophy
- Environmental storytelling methods (feeds Manifestation Layer)
- How the game visually signals danger, safety, factions, world-state (feeds Manifestation Layer)

**Narrative/World Design (games that have it):**
- How story is delivered
- Faction/character relationships
- How the game escalates stakes

#### Ground Truth Tiers
- **Tier 1 (exact ROM data):** Games with disassemblies or ROM maps. Exact sub-pixel values. Target: maximize this tier aggressively.
- **Tier 2 (community-documented):** Speedrun/modding communities have documented key values. Good physics feel, less precision.
- **Tier 3 (empirically measured):** Qualitative parameters (heavy/floaty, fast/slow, commitment-based/cancellable). The agent stack works with all tiers — Tier 1 gives exact values, Tier 3 gives qualitative descriptors the Game Compiler translates into parameters.

#### The Ingestion Pipeline (Agent-Powered, Automated)

This is built as a TOOL, not done manually game-by-game:

**Step 1: Game List Generator**
Claude Code produces a master list of all target games organized by platform and paradigm, with source URLs for documentation (Data Crystal, TCRF, speedrun wikis, game-specific wikis, TASVideos).

**Step 2: Batch Scraper**
For each game, automatically fetches raw text from known documentation sources. No intelligence — just fetch and store locally. This separates web access from extraction, solving the permissions/overnight problem.

**Step 3: Data Extractor Agent**
Takes pre-fetched raw text for ONE game and extracts structured data into the ground truth JSON format. Works on local data — no web access needed, no permission prompts. Can run unattended for hours.

**Step 4: Validator**
Checks each output against the expected schema. Flags missing fields, implausible values, obvious errors.

**Step 5: Gap Identifier**
After each pass, reports which games have incomplete data and what's missing, enabling targeted follow-up.

#### Pipeline Reliability (Token Limits, Overnight Runs)

The pipeline is designed to never hit token output limits or stall on permissions:

**Chunking strategy:**
- Game lists split by platform (nes-games.json, snes-games.json, genesis-games.json) — never one massive file
- Data Extractor processes ONE data dimension per game per call (physics in one call, visual identity in another, audio in another). Never tries to extract everything at once.
- Large outputs (100+ entity enemy behavior files) split into batches of 10-15 per file

**Token budget per call:**
- Each extraction call should target <8000 output tokens
- If a game has unusually rich documentation, split into multiple extraction passes
- The Data Extractor prompt should include: "If your output would exceed 6000 tokens, stop at a natural break point, save what you have, and note what remains to be extracted in a TODO field."

**Permission-free operation:**
- All web access happens in the Batch Scraper step (raw fetch, stored locally)
- All intelligent extraction happens on LOCAL pre-fetched data — no web access needed
- Run Claude Code with `claude --dangerously-skip-permissions`

**Failure recovery:**
- Each game's extraction is independent. If one fails, the pipeline continues with the next.
- The Validator flags failures for retry
- The Gap Identifier produces a specific retry list after each batch

**Multiple instances:**
- Open multiple Terminal windows, each running Claude Code on different batches
- Organize by platform or paradigm so instances don't write to the same files
- Example: Terminal 1 = NES platformers, Terminal 2 = SNES platformers, Terminal 3 = Genesis all

#### Ingestion Targets
- **200-300 games** with comprehensive multi-dimensional data (physics + visuals + audio + level design)
- **500+ games** with physics/mechanics data
- **All NES, SNES, and Genesis games** with any level of documentation get at least Tier 3 entries

#### Running the Pipeline

The pipeline is designed for Joe's "set it and forget it" workflow:

**Setup (one time):**
1. Open Terminal, run `caffeinate -i &` (prevents Mac from sleeping)
2. In System Settings → Displays → Advanced, ensure display auto-off doesn't trigger system sleep
3. Start Claude Code with `claude --dangerously-skip-permissions` (auto-approves all tool access)

**Running:**
- Give Claude Code a batch task (e.g., "extract data for all NES platformers from the pre-fetched sources")
- Walk away. Check back in a few hours.
- Multiple Terminal windows can each run a Claude Code instance on different tasks (e.g., one on NES physics, another on SNES palettes)

**Quality control:**
- After each batch, review a few files to spot-check quality
- The Validator flags issues automatically
- Fix systematic problems by adjusting the Data Extractor prompt, then re-run

#### Ground Truth File Organization

```
data/ground-truth/
├── README.md
├── games-master-list.json        # All target games with status and source URLs
├── physics/                      # Per-game physics parameters
│   ├── super-mario-world.json
│   ├── mega-man-2.json
│   └── ... (500+ files)
├── palettes/                     # Color palettes
│   ├── nes-hardware-palette.json
│   ├── snes-palettes/
│   └── genesis-palettes/
├── visual-identity/              # Sprite specs, tile vocabulary, animation data
│   ├── platformer/
│   ├── topdown/
│   └── .../
├── audio/                        # Music parameters, SFX characteristics
│   ├── nes/
│   ├── snes/
│   └── genesis/
├── level-sequences/              # Element introduction order, rhythm patterns, spatial structure
│   ├── platformer-patterns.json
│   ├── shmup-patterns.json
│   └── .../
├── manifestation-patterns/       # How games visually communicate world-state
│   ├── danger-signals.json
│   ├── faction-indicators.json
│   └── environmental-storytelling.json
├── game-design/                  # Meta-level design patterns
│   ├── difficulty-curves.json
│   ├── boss-design.json
│   └── progression-systems.json
└── grammar-seeds/                # Per-paradigm sequencing grammar specifications
    ├── platformer-grammar.json
    ├── shmup-grammar.json
    └── .../
```

### Phase 1: Platformer Engine (Sessions 1-4)
Build a platformer using REAL physics data from the ground truth library. No approximations.

**Session 1:** Core loop + real SMW physics from ground truth data. Physics read from JSON config, not hardcoded.
**Session 2:** Tiles + collision + camera. 16x16 tiles, SMW-standard.
**Session 3:** Entities + interaction. Real enemy behaviors from ground truth. Stomping, damage, death.
**Session 4:** Multiple levels, HUD, level transitions. Physics swap demo (SMW → Mega Man). Basic SFX.

### Phase 2: Generation Pipeline (Sessions 5-8)
Wire up the full agent stack including the sequencing grammar layer: Experience Interpreter → Artistic Director → Design Philosopher → World Architect → Entity Generator → Knowledge Distributor → Social Graph Builder → Dramaturgical Architect → Grammarian → Rhythmist → Game Compiler → Cartographer → Provocateur → Coherence Auditor. Type a prompt → get a playable generated world with proper sequencing.

### Phase 3: Aesthetics (Sessions 9-11)
Visual Compiler agent, parameterized renderer, WebGL shaders, palette system, chiptune music synthesis. The game goes from colored rectangles to authentic retro visuals.

### Phase 4: Quality (Sessions 12-14)
Experience Simulator, Social Plausibility Checker, meta-optimization feedback loops. Batch testing. The goal: 90%+ hit rate on generated game quality.

### Phase 5: Entity Minds & Conversations (Sessions 15-18)
The hail system (with accept/reject indicators), dialogue UI with free text input, real Claude conversations with every entity, knowledge enforcement, lore system, manifestation of social state in entity behavior.

### Phase 6: Social Ecology (Sessions 19-25)
CAS engine, faction dynamics, cascade mechanics, antagonist strategist (on-menu + off-menu creative strategies), information propagation, lie detection, manifestation layer, revelation queue. Deep testing and tuning.

### Phase 7: Genre Transformation (Sessions 26-30)
Additional paradigms. Mid-game paradigm switching with state translation. Control socialization for new paradigms. Testing emergent genre shifts from social ecology.

### Phase 8: Giant & Meta-Game (Sessions 31-36)
Behavioral + strategic profile modeling, Giant reflections, cross-world travel (social cost), artifact system, the Giant's dimension (Air Man aesthetic, real voice), the endgame sequence, post-game readings.

### Phase 9: Polish & Account System (Sessions 37-40)
Auth, cloud saves (Cloudflare KV), daily API budget caps, mobile controls, final testing, performance optimization.

---

## What NOT To Build Yet (Phase 1)

- No AI agent calls. Hard-code test levels.
- No social ecology. Entities are pure gameplay (patrol, stomp).
- No conversations. No hail system.
- No WebGL shaders. Canvas 2D only.
- No music. Basic SFX only.
- No save system. Refresh = restart.
- No account system.
- No multi-paradigm.

---

## Questions for Joe

If you encounter a decision not covered by this document:
1. Leave a `// TODO: ASK JOE:` comment in the code
2. Make the simplest reasonable choice so work can continue
3. Flag it for the evening review session

Never make a large architectural decision without checking this document first. If the document doesn't cover it, ask.
