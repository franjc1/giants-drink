# GIANTS DRINK — Complete Project Transfer Document
## For continuing design and implementation in a new Claude thread

---

## WHO IS JOE

Joe is an IC7 leading quantitative UXR on generative AI at Meta. PhD, 50+ scientific publications, academic background in psychology with decades of research in constructionist views of mind and brain (Lisa Feldman Barrett's work on psychological primitives). He has deep expertise spanning psychometrics, machine learning, philosophy of mind, and clinical research.

Joe demonstrates a distinctive cognitive style of "abductive reframing under constraint" — identifying when systems' operating assumptions generate problems and constructing new frameworks that dissolve them. He's currently developing LUXE, a framework challenging RLHF's assumption that annotators can evaluate response quality.

**Joe is NOT an engineer.** He's a researcher and creative director. His role on this project is conductor/taste-maker — designing, testing, directing. Claude Code does the engineering. This thread (claude.ai) handles high-level design, architecture, prompt engineering, and conceptual debugging.

**Key personality traits for collaboration:** Pushes for elegant solutions that transcend apparent limitations. Loves paradigm-shifting moments. Values intellectual honesty and specificity over hedging. Gets frustrated with unnecessary CLI complexity — prefer GUI explanations where possible.

---

## PROJECT OVERVIEW

**Giants Drink** (formerly "Experience Engine") is a browser-based retro game generator where you type anything and get a playable retro game. But that's the surface. Beneath it:

**The retro game is the INTERFACE. The social ecology is the GAME.**

The platforming, racing, fighting — that's how you MOVE THROUGH the world. The real decisions, strategy, and engagement happen at the social layer. Every entity has a mind. Every faction has dynamics. The world has politics. The win condition is achieved through social strategy, not mechanical skill alone.

**The Player Arc (over months of play):**
- **Phase 1** — "This is a great game generator." Player thinks Mario is the protagonist.
- **Phase 2** — "The social strategy IS the game." Player realizes retro mechanics are the medium, not the point.
- **Phase 3** — "Something is watching me." Games feel tailored to the player's psychology.
- **Phase 4** — "I am the protagonist." The player, across all games, all worlds. The Overseer is the true opponent.
- **Phase 5** — "Defeat the Overseer." Requires the deepest abductive reframe. The Overseer was RLHF made manifest — it modeled "good play" and closed off comfortable strategies, training the player toward paradigm-shifting thinking. The final move reframes the relationship itself.

**LUXE Connection:** The Overseer IS RLHF turned into gameplay. It optimizes for legible strategies, tightens constraints until comfortable approaches suffocate. The only way to progress is to break your own patterns — do what the Overseer can't model. The game teaches abductive reasoning.

---

## TECHNICAL SETUP (COMPLETED)

**Development environment:**
- Personal MacBook (Joe's, not Meta infrastructure)
- Claude Code installed and working
- Node.js, Git installed
- VS Code for viewing

**Deployment pipeline (working end-to-end):**
- GitHub repo: `giants-drink`
- Vercel: auto-deploys on push (URL: giants-drink.vercel.app or similar)
- Cloudflare Worker: API proxy (keeps Anthropic API key secret)
- Anthropic API account with spending cap

**Validated from Meta work browser:**
- itch.io games work → Canvas/WebGL/JavaScript functional
- YouTube audio works → Web Audio API functional
- api.anthropic.com reachable → Claude API calls will work
- Chrome dev tools disabled → doesn't matter for end users

**Toolchain philosophy:** Claude Code is the ONLY coding AI. No Cursor, no Copilot. One tool making all code decisions = one consistent architecture. Claude.ai (this thread) handles design. claude.md file bridges the two.

---

## THE 8-LAYER ARCHITECTURE

### Layer 1: Paradigm Engine
Unified game engine rendering 13+ paradigms from JSON configuration.

**5 rendering cores:**
1. 2D tile-based (configurable camera) → platformer, top-down, shmup, fixed-screen, isometric
2. Raycasting first-person → FPS, Myst-style adventure
3. Sprite-battle stage → RPG combat, fighting game
4. Scrolling map with unit control → RTS, overhead racing
5. Pseudo-3D scaling → Mode 7 racing

**5 interaction grammars:**
1. Direct action (platformer, FPS, fighting, racing)
2. Menu-driven (RPG combat)
3. Point-and-investigate (adventure)
4. Command-and-delegate (RTS)
5. Rhythm/pattern (shmup, arcade)

**Physics are fully data-driven.** Swap JSON values → different game feel. Mario vs Mega Man vs Castlevania = different physics parameters, same engine.

### Layer 2: Experience Intelligence
Claude agents translate natural language → game configurations.

**Agent stack:**
- **Experience Interpreter:** Natural language → primitive profile
- **Artistic Director:** Handles multi-reference prompts, fusion concepts, distinctiveness signatures
- **Design Philosopher:** Gives each game a conviction/point of view ("this game believes mastery through failure is satisfying")
- **Game Compiler:** Primitive profile → complete engine JSON config
- **Dramaturgical Agent:** Designs tension curves, act structure, pacing across the full game arc
- **Rule-Breaking Agent:** Post-processing pass that identifies where to deliberately violate established patterns for authored surprise

### Layer 3: Aesthetics
- WebGL shader pipeline: pixelation, palette quantization, CRT effects, sprite overlay, style transfer
- Web Audio API chiptune synthesizer parameterized by primitives (valence → key/mode, arousal → tempo)
- Music can be styled after real artists ("The Cure" → heavy chorus on bass, sparse delayed arpeggios, minor keys with major lifts)
- Asset knowledge base: palettes, sprite references, music data from 200+ real retro games

### Layer 4: Quality
- Multi-variant generation (3-5 configs per prompt, score and serve best)
- Batch testing with meta-optimization (agents improve their own prompts)
- Ground truth library constrains generation to documented patterns from landmark games

### Layer 5: Entity Minds & Communication
Every entity is a mind you can talk to.

**Entity mind contains:** role, disposition, knowledge (bounded by position/rank/connections), motivations, personality

**Knowledge ecology mirrors social ecology:**
- Location-based: entities know immediate environment only
- Role-based: guards know security, cooks know gossip, scouts know player movements
- Hierarchical: higher ranks know strategic information
- Social: entities know their relationship network
- Rumor/misinformation: information degrades through propagation

**CRITICAL DESIGN:** Knowledge is architecturally enforced, not prompt-based. Game Compiler generates world first, THEN distributes knowledge fragments across entities. No single entity has complete picture. Player assembles world truth from investigation.

**Communication opportunity primitives (how conversations start):**
- Vulnerability: cornered/injured enemy creates opening
- Neutrality: rest areas, neutral territory
- Shared circumstance: common problem (both trapped)
- Status: merchants, guards, messengers (infrastructure roles)
- Capture: defeated enemy dazed briefly, player can approach vs finish
- Reputation: entities seek player out based on spreading reputation

Indicators are behavioral (entity stops patrol, faces player, different posture), NOT UI prompts.

### Layer 6: Social Ecology (CAS Engine)

**THIS IS THE CORE OF THE GAME.**

**Hybrid architecture:** Simple JavaScript code handles dynamics + Claude handles narrative/strategy.

**Code handles (genuine CAS, ~500-800 lines JS):**
- Agent graph: entities with local properties (loyalty, bonds, knowledge, personality)
- Propagation rules: events ripple through graph via simple formulas
- Threshold mechanics: phase transitions at defined thresholds
- Information delays: events propagate at defined speeds
- Feedback loops: explicit positive/negative rules
- Resource system: consumption creates constraints

**Claude handles (intelligence layer):**
- Narrative interpretation: turning faction state changes into vivid story
- Entity dialogue: in-character responses
- Antagonist strategy: choosing from action menu
- Post-game reading: synthesis and insight

**Faction state variables (per faction):**
```
cohesion: 0.0-1.0
morale: 0.0-1.0
loyalty_to_regime: 0.0-1.0
awareness_of_player: 0.0-1.0
disposition_to_player: -1.0 to 1.0
internal_dissent: 0.0-1.0
information_about_regime: 0.0-1.0
```

Individual entities inherit faction baseline + personal trait offsets. High-status defections impact faction cohesion more than low-status.

**Cascade mechanics:** When entity A defects, connected entities' loyalty reduced proportional to bond strength and inversely proportional to own loyalty. Tipping points at thresholds (e.g., loyalty < 0.3 → faction-wide phase transition).

**Antagonist response menu:**
- Reinforce (send loyal forces)
- Punish (crackdown — raises fear, damages cohesion)
- Concede (offer concessions — signals weakness)
- Propagandize (counter-narratives)
- Divide (exploit inter-faction rivalries)
- Fortify (consolidate core territory)
- Pre-empt (direct attack on player)

Strategic Opponent Agent selects based on antagonist personality + situation. One Claude API call per evaluation cycle.

**Designed feedback loops:**
- Positive: defections breed defections (loyalty reduction cascades)
- Negative: antagonist crackdown raises fear-based loyalty
- Interaction: crackdown creates resentment in moderates (new defection vector)

**Information propagation with delays:**
- Real-time physical contact (RTS — scout must return to base)
- Between-level propagation (platformer — time passes between worlds)
- Gradual ambient (RPG — wavefront spreads from event point)

Information packets have: content, accuracy (degrades with hops), reach (bounded by time/topology), emotional charge (decays with repetition).

**CRITICAL: Antagonist operates within information constraints.** Disrupting their intelligence network is valid strategy.

**CAS Properties Achieved:**
- Large number of agents with simple local rules ✓
- Agents are adaptive (at evaluation cycles) ✓
- Nonlinear interactions ✓
- Feedback loops (positive + negative simultaneously) ✓
- Sensitivity to initial conditions ✓
- Phase transitions from threshold mechanics ✓
- Feedback delays from information propagation ✓
- Emergence (program loyalty values, get revolutions/cold wars/propaganda campaigns) ✓

### Layer 7: Genre Transformation

Paradigm shifts when the social ecology produces a situation the current paradigm can't represent.

**What carries over:** Identity/reputation, strategic position (territory, alliances, intelligence), narrative context
**What transforms:** Mechanical capabilities, world representation, challenge intensity

Genre shifts are NEVER requested by player. They're NECESSITIES created by strategic choices. Commanding an army → needs strategic view. Face-to-face with antagonist → needs dialogue scene. Infiltrating fortress → needs first-person claustrophobia.

**Management sim interaction model (for SimCity-type games):**
- Zoomed out: top-down management, point-and-delegate, strategic decisions
- Zoomed in: face-to-face conversations, walk-around rooms
- Fluid player-initiated transitions
- Time scale: adjustable (weeks/minute in peace, real-time in crisis)

### Layer 8: Game Mind & Overseer

**Game Mind (per game):**
- Behavioral monitoring during gameplay
- Makes compositional adjustments to upcoming content
- Has personality matching game's theme
- Provides progressive readings at milestones

**Behavioral tracking dimensions:**
- Action tendencies: aggression ratio, exploration thoroughness, risk tolerance, persistence, speed preference
- Social tendencies: first contact approach, persuasion style, loyalty to allies, information handling, mercy, trust
- Decision-making: deliberation time, consistency, response to failure, planning horizon
- Relationship with Game Mind: chat engagement, rule testing, meta-layer curiosity

**Post-game reading framework (3 parts):**
1. **Portrait:** 2-3 sentence core approach description
2. **Key moment:** Specific revealing moment from playthrough
3. **Reflection:** Genuine observation about patterns player didn't notice

Example: "You treat every entity as potentially useful, which makes you effective but transactional. The goombas who allied with you did so because you offered them something. You never asked a goomba what it wanted just to know. You're generous but strategic. People like you make effective leaders and uncertain friends."

**The Overseer (cross-game persistent intelligence):**
- Accumulates behavioral model over months
- Initially invisible quality system, gradually becomes true antagonist
- Constructs scenarios that challenge player's specific psychological patterns
- Pushes toward abductive reasoning by closing off comfortable strategies
- Cross-game connectivity: games exist in one connected space, crossover possible but earned
- Crossover must be built within each game's fiction logic (time travel tech, scrying spells, dimensional signals)
- Transfer of information/capabilities across games has real bilateral costs

**Account system:** Zero-friction start (browser storage), optional account for cross-device sync and Overseer persistence. Cloudflare KV/R2 for storage.

---

## CRITICAL DESIGN DECISIONS MADE

### Manifestation Pipeline
Math produces PATTERNS (numbers) → Claude RECOGNIZES patterns as concepts ("cold war," "weapons program") → Claude names/narrates → Game Modification Agent generates CONCRETE gameplay changes.

**Parameterized gameplay modifications (NOT runtime code generation):**
Library of elements that can be instantiated:
- Enemy variants: base type + modifiers (range, damage, attack pattern, armor)
- Environmental elements: base terrain + modifiers (fortification, propaganda poster, destroyed building)
- New hazards: base hazard + modifiers (area, trigger, visual)
- Ally capabilities: base unit + modifiers

### Hit Rate Optimization (60% → 90%)

**7 Principles:**

1. **Dramatically fertile initial conditions:** Don't start in equilibrium. Initialize faction states near thresholds (loyalty 0.3-0.7). Create social graph with natural fault lines (cohesive clusters weakly connected).

2. **Catalytic events:** Perturbations at predetermined points whose CONSEQUENCES depend on CAS state. Same catalyst → different outcomes depending on system state. Dramaturgical Agent designs catalysts as part of arc.

3. **Visceral manifestation:** Dramatic moments must be SEEN/FELT, not read. Rich asset library: environmental decorations, entity behavioral states, audio cues, visual atmosphere changes, screen effects.

4. **Specific, vivid narrative:** BAD: "The goombas seem different." GOOD: "The goomba at the gate isn't wearing its helmet. It's staring at the ground. When it sees you, it doesn't charge—it flinches."

5. **Pace the drama:** Drama budget: 2-3 significant political events per world. 30-minute session = 20 minutes building tension + 10 minutes dramatic payoff (3-4 memorable moments).

6. **Traceable causation:** CAS engine LOGS causal chains. Post-game reading reconstructs WHY things happened.

7. **Authentic visual manifestation:** Asset knowledge base tells Game Modification Agent what visual vocabulary is available per aesthetic.

### Architecture Core Insight

**Not pure LLM generation. HYBRID:**
- Code = physics (faction states, thresholds, propagation, resources, consistency)
- Claude = intelligence (strategy, dialogue, narrative, synthesis)

**The central axis is small:**
- A game loop that renders entities on a canvas
- A JSON state object tracking entity relationships and dispositions
- Claude calls that interpret state into narrative and generate content
- Browser storage that persists state

Everything else is EMERGENT FROM THOSE FOUR THINGS.

---

## ICONIC DESIGN EXAMPLES (for reference/inspiration)

**The atom bomb in Super Mario:** Player spares goombas → discovers faction structure → builds coalition → learns Bob-ombs are exploited industrial base → persuades Bob-ombs to redirect capability → Bob-omb engineer designs ultimate weapon → paradigm shifts to strategic view → player decides whether to use WMD → consequences cascade.

**Mario Kart league politics:** Can't win on pure driving → builds coalition through racing behavior and between-race conversations → convinces DK and Bowser to target each other → gets Toad to share Peach's racing lines → arranges field so only competition is honest Yoshi → wins championship through politics, not driving.

**Zelda: joining Ganon and reforming from within:** Approach lieutenant, offer services → given position in hierarchy → quietly build reform faction → stage coup → Ganon deposed by his own organization.

**SimCity Hogwarts vs Voldemort (7-year arc):** Manage school while authoritarian movement grows. Each year is a chapter with escalating dynamics. Staffing decisions, student factions, Ministry politics. Management sim → guerrilla resistance if school falls. Genre shifts based on strategic situation.

---

## 40-SESSION BUILD PLAN

**Phase 0 (Day 1): Environment Setup** ✅ COMPLETED
Mac, Claude Code, Node.js, Git, GitHub, Vercel, Cloudflare Worker — all working.

**Phase 1 (Sessions 2-8): Paradigm Engine**
Core game loop, entity system, input manager, collision. Physics parameter table with easing curves. Multiple renderers and interaction grammars. JSON-to-game machine.

**Phase 2 (Sessions 9-11): Experience Intelligence**
JSON schema definition. Experience Interpreter + Game Compiler prompts. Wire up browser UI. Type prompt → get game.

**Phase 3 (Sessions 12-15): Aesthetics**
WebGL shader pipeline. Palette and visual theming. Music system. **→ POST FIRST DEMO**

**Phase 4 (Sessions 16-19): Quality**
Artistic Director + Design Philosopher agents. Dramaturgical improvements. Multi-variant generation. Batch testing + meta-optimization.

**Phase 5 (Sessions 20-23): Entity Minds**
Entity mind schema + communication handler. Mind generation in Game Compiler. Disposition tracking + game impact. Pre-computed response libraries. **→ POST SECOND DEMO**

**Phase 6 (Sessions 24-30): Social Ecology**
CAS engine (faction states, cascade mechanics). Antagonist strategic opponent. Deep testing + tuning of constraint system.

**Phase 7 (Sessions 31-35): Genre Transformation**
Mid-game paradigm switching. Constraint evaluation for earned transformations. Testing emergent genre shifts.

**Phase 8 (Sessions 36-40): Game Mind & Overseer**
Behavioral monitoring. Post-game reading. Overseer system. Polish + final testing. **→ POST FINAL DEMO**

**Timeline:** 1-2 hours/day, ~8-10 weeks total. Demos posted at Phases 3, 5, and 8.

---

## OPEN DECISIONS NEEDING RESOLUTION

These were identified in the pre-build design review but NOT yet finalized:

1. **Game state JSON schema** — the exact contract between every system. Must be specified before building.
2. **CAS tick mechanism** — Per section? Per frame? On a timer? Affects how responsive social ecology feels.
3. **Claude API call structure at runtime** — One big call per section transition? Multiple small calls? Affects latency and cost.
4. **Save state technical design** — What gets persisted, what gets regenerated?
5. **Section type definitions per paradigm** — What are the actual section templates?
6. **MVP definition** — What's the minimum compelling first experience?
7. **Social ecology complexity threshold** — How much needs to work before ANY of it works?
8. **Launch scope boundaries** — Which paradigms first, what's v1 vs v1.1?

**Priority order we agreed on:**
1. JSON schema (unlocks Layers 1-2)
2. Section type definitions per paradigm (unlocks Level Architect)
3. Entity knowledge system design (unlocks Layer 5, informs Layer 6)
4. Social dynamics evaluation model (unlocks Layer 6)

---

## VOICE & TTS DESIGN

- Regular entities: chiptune-style gibberish (Animal Crossing / Banjo-Kazooie) with text
- The Overseer: REAL HUMAN VOICE (ElevenLabs API). The contrast IS the revelation.
- Rare significant moments: brief voiced lines for maximum impact
- Architecture: game generates text → TTS API via Cloudflare Worker → Web Audio plays clip

---

## CONSTRUCTIONISM CONNECTION

Barrett argues emotional experience isn't constructed from a template — it's assembled from ingredients in context to serve a function. A great game experience works the same way.

- **Primitives** = ingredients
- **Dramaturgical Agent** = context (temporal unfolding that makes ingredients combine into experience)
- **Design Philosopher Agent** = function (what the experience is FOR)

**AI slop is slop because it has ingredients without context or function.** This system has all three. That's the theoretical contribution beyond the demo.

---

## KEY REFERENCES

- Spriters Resource (spriters-resource.com) — sprite sheets
- VGMusic / Zophar's Domain — NSF/SPC music files
- The Cutting Room Floor (tcrf.net) — game design documentation
- Data Crystal (datacrystal.romhacking.net) — ROM maps and technical docs

---

## HOW TO USE THIS DOCUMENT

Paste this entire document at the start of a new Claude.ai thread. Then say something like:

"This is the complete design document for Giants Drink. I'm continuing from a previous conversation. We left off needing to finalize the JSON schema and start building. Read this carefully and let's pick up where we left off."

The new Claude will have full context on: the vision, the architecture, every design decision made, every open question, the technical setup, and the build plan.
