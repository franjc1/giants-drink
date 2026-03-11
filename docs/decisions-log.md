
---

## Session: 2026-03-02 — Game State JSON Schema Design

### Decision 1: Four-Concern Schema Structure

**Context:** The game state JSON schema was the #1 open question blocking Phase 1. Every system needs to know what data it reads and writes. Needed a structure that serves the CAS philosophy while being concrete enough for Claude Code to implement.

**Decision:** The game state is organized around four concerns, each mapping to a top-level block: (1) Game identity (`meta`) — what IS this game, immutable after creation; (2) World state (`world`) — the living social ecology, evolves via CAS; (3) Episode content (`episode`) — what's on screen now, regenerated each episode; (4) Player (`player` + `overseer`) — who is this player, per-game and cross-game. Plus `cas` for engine internals and `diagnostics` for dev tooling.

**Rationale:** The four concerns map to different timescales (immutable / evolving / ephemeral / accumulating) and different owners (pre-game agents / CAS engine / content agents / Paradigm Engine + Game Mind). This makes ownership unambiguous and debugging straightforward.

---

### Decision 2: Seven Faction State Primitives

**Context:** The original transfer doc listed seven faction state variables. Draft schema proposed adding `fear_level` and `resource_level`. Discussion grounded this in CAS social system theory (Kauffman, Holland, Axelrod, Santa Fe Institute) and Barrett's constructionist framework.

**Decision:** Seven primitives: `cohesion`, `morale`, `loyalty`, `awareness_of_player`, `disposition_to_player`, `internal_dissent`, `resources`. Fear dropped. `information_about_regime` moved to entity knowledge layer.

**Rationale:** Resources is genuinely primitive — a hard constraint on action (like energy in physics). Fear is a composite that should emerge from threat perception + power asymmetry + negative disposition. Barrett: fear is a constructed category, not a primitive. If the CAS doesn't produce fear-like behavior from these primitives during testing, we add it then. Start without, test empirically. `information_about_regime` is distributed knowledge data across entity knowledge blocks, not an aggregate number.

---

### Decision 3: OCEAN Personality Model

**Context:** Needed a personality model for entities that drives behavioral variation while staying grounded in science and keeping dimensionality manageable.

**Decision:** Five OCEAN factors per entity, stored as offsets from faction `personality_center`. Entity absolute personality = faction center + offset. No additional explicit traits (deception, courage, empathy).

**Rationale:** OCEAN is the most empirically grounded personality model. Five factors map directly to game-relevant behaviors: O→curiosity/receptivity, C→reliability/discipline, E→social reach/influence speed, A→persuasion susceptibility, N→stress response magnitude. Deception, courage, empathy emerge from OCEAN + situation rather than being coded directly. This keeps the primitive count low while producing enormous behavioral variety.

---

### Decision 4: Knowledge as Flat Tagged Items with Special Knowledge Resolution Layers

**Context:** The bounded knowledge system is Two Fires' key differentiator. Needed a structure that enforces knowledge bounds architecturally and supports the lore propagation system across games.

**Decision:** Entity knowledge is a flat list of tagged items, each with: type (spatial/social/factual/special/player_related), content, accuracy, source, acquired_tick. Special knowledge items add `resolution_level` (ambient/structural/actionable) and `propagation_resistance`.

**Rationale:** Flat list is forward-compatible — adding new knowledge types is just a new tag. The resolution layers for special knowledge create the lore discovery experience: ambient lore ("legends of two lights") spreads easily and becomes background texture; structural knowledge ("there IS a way to bridge worlds") requires trust with important figures; actionable knowledge ("HERE is how") barely propagates and is held by one deliberately-placed special character per world (a sage/hermit type, not a random entity). This maps the meta-narrative's discovery arc directly into the CAS propagation mechanics.

---

### Decision 5: Dynamic Social Graph with Formation and Dissolution

**Context:** Whether connections between entities should be fixed at game creation or mutable at runtime.

**Decision:** Mutable social graph. CAS engine can add and remove connections based on: proximity + shared experience, introduction through mutual contacts, player-catalyzed introductions (formation); betrayal/defection, atrophy over time, factional conflict (dissolution).

**Rationale:** Dynamic connections are essential for the emergent faction dynamics — splintering, alliance formation, betrayal. When a faction hits high internal dissent, bonds weaken between dissenting and loyal clusters; if dissent crosses threshold, weak bonds dissolve and new bonds strengthen within the splinter group. Nobody scripts the faction split — connection dynamics produce it from CAS primitives. The player creating new connections through social interaction is a major strategic lever.

---

### Decision 6: Distributed Reputation — No Player-Carried Score

**Context:** Where should the player's reputation live? On the player object, or distributed across factions and entities?

**Decision:** Distributed. Each faction and entity has its own `disposition_to_player`, constructed from whatever information reached them through the social graph. No reputation field on the player object.

**Rationale:** Barrett: reputation is a perception constructed by the perceiver, not a property of the perceived. Two factions can have completely opposite perceptions of the same player based on different information packets reaching them. This prevents the "universal reputation" problem and creates emergent situations where the player discovers entities believe wrong things about them.

---

### Decision 7: Identity Stable, Expression Dynamic

**Context:** Should aesthetics and audio be immutable game properties or respond to CAS state?

**Decision:** Base aesthetic and audio profiles are immutable in `meta` (the game's "home state"). Episode generation computes CAS-driven modifiers (`aesthetic_modifiers`, `audio_modifiers`) that push expression away from home during crisis and back toward it during stability. Modifiers can be nonlinear — thresholds and phase transitions.

**Rationale:** The game should feel like the same game throughout (identity), but a world at 90% entity death should look and sound devastated. The aesthetic system behaves like a CAS responding to the social CAS — consistent with primitives-all-the-way-down philosophy. Physics are the one exception: fixed per game (player's contract with controls), with paradigm-authored exceptions only (underwater, damaged vehicle) that are taught through the teachability primitive.

---

### Decision 8: Physics Fixed, No CAS Modification

**Context:** Should CAS state be able to modify physics parameters (gravity, jump velocity, etc.)?

**Decision:** No. Physics are the player's contract with the game — fixed after game creation. Only paradigm-authored modifiers (native game mechanics like underwater levels, damaged vehicles) can change physics, and these must be taught through the teachability primitive.

**Rationale:** Changing how jump feels mid-game creates frustration, not drama. The CAS has a thousand other ways to make the world feel different (aesthetic modifiers, behavioral changes, visual manifestations, audio shifts) without touching the thing the player's muscle memory depends on.

---

### Decision 9: Overseer Keyed to Model Confidence, Not Game Count

**Context:** When should the Overseer activate? What counts as "enough data"?

**Decision:** Overseer escalation is keyed to `model_confidence` computed from `total_meaningful_decisions` across all games, not games completed. Meaningful decisions = sparing vs. defeating, conversation choices, path selection, alliance formation. The session is the behavioral data unit, not the game. Abandoned games contribute data.

**Rationale:** "Beat a game" is the wrong unit. Players may play for dozens of sessions without completing a game. A player with one deeply social 50-hour game has a richer Overseer profile than someone speedrunning five games. The Overseer doesn't care about game completion — it cares about social engagement depth. The first hints (escalation level 1) should be ambiguous enough that the player isn't sure something is happening. Only around escalation level 2-3 does the pattern become undeniable.

---

### Decision 10: Player as Extraordinary Catalyst — Event Magnitude Calibration

**Context:** In traditional retro games, the player's killing spree is invisible to the world. In Two Fires, the world has a nervous system. The player is generally doing something incredible — conquering worlds, destroying castles, defeating hundreds. This needs to be reflected in CAS sensitivity.

**Decision:** The CAS treats the player as the most disruptive force in the ecology. `event_magnitude_sensitivity` in the dramaturgical setup calibrates reaction intensity, tuned by `intended_length` (higher sensitivity for shorter games so the CAS ramps meaningfully in the available window). The `pressure_ramp` is `"player_driven"` — difficulty escalation keyed to the player's own impact, not a fixed curve.

**Rationale:** This creates the natural dual ramp: non-social challenge increases because the antagonist rationally responds to a genuine threat, and social opportunity expands because entities have heard of this extraordinary being. The better you are at the mechanical game, the faster the social game becomes essential. This is the self-reinforcing loop that makes the social dimension feel necessary rather than bolted on.

---

### Decision 11: Paradigm-Flexible Spatial Format

**Context:** The episode's spatial data (level geometry) needs to work across all 13+ paradigms, not just platformer.

**Decision:** `episode.spatial.format` varies by paradigm: `tilemap_2d_scrolling` for platformer, `room_graph` for adventure, `terrain_map` for RTS, `track_layout` for racing, etc. The Paradigm Engine reads its paradigm's format. Schema is not locked to platformer assumptions.

**Rationale:** Future-proofs against the multi-paradigm architecture without over-specifying formats we haven't built yet. Adding a new paradigm = adding a new spatial format type + paradigm spec, no schema restructuring.

---

## Session: 2026-03-02 — Paradigm Specifications (Thread 2)

### Decision 12: Seven Engine Clusters, Not 13+ Paradigm Engines

**Context:** The build plan and earlier discussions referenced "13+ paradigms" as if each needed its own engine. Before writing paradigm specs, needed to determine what actually requires separate engineering vs. what's a parameter variation.

**Decision:** Seven engine clusters cover ALL retro game types from NES through early PC: (1) Side-View Tile World, (2) Top-Down Tile World, (3) Stage/Arena Screen, (4) Scrolling Shooter, (5) Pseudo-3D / Mode 7, (6) Raycasting First-Person, (7) Strategic Map. Each cluster is defined by a unique combination of rendering core + camera model + collision system + base input paradigm.

**Rationale:** Cluster analysis of the full retro game landscape reveals that most games that feel different to players share a rendering engine. A beat-em-up is a platformer with lower gravity, wider stages, and a combo system — same renderer, same camera, same collision. Top-down racing (RC Pro-Am) is the Zelda engine tracking a car on track tiles. Fighting games and RPG combat screens use the same "entities on a stage" renderer with different interaction grammars. Building 7 engines instead of 13+ dramatically reduces engineering scope while losing zero player-facing paradigm coverage.

---

### Decision 13: Player-Facing Paradigms Are Parameter Layers on Engine Clusters

**Context:** If the engine only has 7 clusters, where do the player-facing paradigm differences live?

**Decision:** 12 paradigms get full specs (Platformer, Beat-em-up, Shmup, Racing, Action-adventure, RPG, Fighting, RTS, Management Sim, FPS, First-person Adventure, Tactics/SRPG). 10 additional paradigms are documented as parameter variants of parent paradigms (Run-and-gun = Platformer + projectiles; Vertical shmup = Horizontal shmup rotated 90°; etc.). Paradigm specs operate at the player-facing level, defining temporal structure, sequencing grammar, social surface, CAS integration, aesthetics, and genre shift interfaces. The engine cluster provides the rendering/collision/camera/input. The paradigm spec provides everything else.

**Rationale:** This separates concerns cleanly. Engine clusters are engineering artifacts (what gets built). Paradigm specs are design artifacts (what agents read). The Experience Interpreter selects a paradigm. The paradigm spec tells every downstream agent how to work in that paradigm. The paradigm spec references its engine cluster for rendering, but defines its own social surface, CAS rules, sequencing grammar, etc. This means adding a new player-facing paradigm doesn't require new engineering — just a new spec document on an existing cluster.

---

### Decision 14: Intra-Cluster Shifts vs. Cross-Cluster Shifts

**Context:** Genre shifting is a core Two Fires mechanic. Needed to understand what's mechanically easy vs. hard about paradigm transitions.

**Decision:** Intra-cluster shifts (platformer → beat-em-up) are parameter swaps — seamless, can happen mid-episode. Cross-cluster shifts (platformer → racing) are rendering core switches — require a transition (loading screen, cutscene, narrative bridge). Both are supported, but the cost and feel are fundamentally different. Shift triggers and what carries across shifts documented per paradigm.

**Rationale:** This distinction shapes how the Dramaturgical Agent plans genre shifts. Intra-cluster shifts can be fluid and surprising (gravity drops mid-level, suddenly you're in a beat-em-up). Cross-cluster shifts need narrative justification and a transition moment. The player's identity, reputation, CAS state, and strategic position always carry across. Mechanical capabilities transform (jump height becomes unit speed, combo moves become tactical abilities).

---

### Decision 15: Experience Interpreter Maps Activities to Engine Clusters, Not Genres

**Context:** How does a prompt like "Mario characters playing quidditch" get resolved? Quidditch isn't a retro game genre.

**Decision:** The Experience Interpreter maps the *activity described in the prompt* to the engine cluster that delivers that mechanical experience, then maps *characters/fiction* onto the paradigm's social surface. Quidditch = flying + dodging + scoring → Cluster 4 (shmup mechanics) or Cluster 1 (side-view with flight physics). The player never needs to know which cluster is running.

**Rationale:** This makes the system capable of serving ANY prompt, not just prompts that map to recognized game genres. The Experience Interpreter asks "what does this experience feel like mechanically?" not "what genre is this?" This is the key to the "it's not a genre selector, it's an experience interpreter" design philosophy.

---

### Decision 16: Placeholder Values Explicitly Marked, Behavior Descriptions Authoritative

**Context:** The paradigm specs contain numerical values (thresholds, ranges, frame counts) that are illustrative but not tuned. Risk that future sessions or code treat them as implementation-ready.

**Decision:** All numerical values in the paradigm specs document are explicitly marked as placeholders via a warning header. Behavior descriptions ("visible wavering," "patrol gaps," "hesitation before attacking") are authoritative design intent. Exact thresholds that trigger those behaviors are Thread 3 deliverables, not Thread 2.

**Rationale:** Clean handoff between threads. Thread 2 defines WHAT behaviors manifest per paradigm. Thread 3 defines the EXACT CAS state values at which those behaviors trigger. No future session should hardcode "loyalty < 0.4 → visible wavering" as if 0.4 is a tested threshold — it's a structural placeholder showing that a threshold goes in that slot.

---

### Open Design Work (Carried Forward + New)

1. CAS engine parameter tuning — exact thresholds for behavioral legibility (Thread 3, next)
2. MVP definition — minimum compelling first level
3. Granular constraint relationships between primitives (answers from building/testing)
4. Visual Manifestation Engine specification
5. ~~Multi-paradigm shift mapping mechanics~~ → Partially addressed (intra-cluster vs. cross-cluster, shift triggers per paradigm). Remaining: exact transition animation/loading specs.
6. Behavioral stress response modifier function design
7. Event magnitude calibration per paradigm and game length
8. Overseer model confidence thresholds for escalation levels
---

## Session: 2026-03-03 — CAS Engine Redesign (Thread 3)

### Decision 17: Two-Layer Architecture — Deterministic CAS + Claude Interpretation

**Context:** Thread 3 started as reconciliation between Threads 1, 2, and initial CAS spec. Discussion revealed that essentialist threshold tables (loyalty < 0.2 = defection) impose a behavioral ceiling — players learn the lookup table, entities feel mechanical, and situations we didn't anticipate can't emerge. Joe proposed: keep primitives as pure ingredients, let Claude construct all meaning from them in context.

**Decision:** Two cleanly separated layers. Layer 1: deterministic CAS engine running simple math on a social graph — affect propagation, information flow, bond dynamics, decay. No interpretation, no thresholds, no categories. Layer 2: Claude reads CAS state at episode boundaries and constructs situated narrative, behavioral directives, and visual/audio specs. Claude directs NPC behavior → behavior creates events → events enter CAS → CAS updates → Claude interprets.

**Critical constraint:** Claude never modifies CAS state directly. The CAS is a closed deterministic system. Its behavior is a pure function of its rules, initial conditions, and agent actions. This keeps the system honest — if something dramatic emerges, it emerged from the dynamics, not from Claude deciding it should happen.

**Rationale:** This is Barrett's constructionist framework applied to game architecture. No entity "is" afraid or loyal — those are constructed by Claude from primitives in context. Same ingredients produce different constructions in different situations. The ceiling is removed: any social dynamic Claude can recognize can emerge. And the CAS remains reproducible and honest because it's just math.

---

### Decision 18: Entity State Reduced to Two Affect Primitives (Valence + Arousal)

**Context:** Thread 1 specified 7 entity state variables (loyalty, morale, stress, disposition_to_player, awareness_of_player, information_quality). The initial Thread 3 spec used these. Discussion revealed these are high-level constructs, not primitives — "loyalty" is a category constructed from bond patterns, shared history, perceived reciprocity, and current affect.

**Decision:** Entity dynamic state is exactly two numbers: affect valence (-1.0 to 1.0, positive to negative) and affect arousal (0.0 to 1.0, activated to quiescent). These are Barrett's core affect dimensions — the raw substrate from which Claude constructs situated emotional/social experience. Everything else (loyalty, morale, fear, courage, trust) is constructed by Claude from valence + arousal + OCEAN personality + knowledge + bonds + context.

**Rationale:** Valence and arousal are the most empirically grounded primitives of affective experience (Russell's circumplex, Barrett's conceptual act theory). They provide the dynamic substrate; OCEAN provides heterogeneity; the social graph provides interaction complexity. Two numbers per entity × 50-100 entities × rich bond topology = enormous emergent complexity. Like letters of the alphabet creating infinite stories — the complexity is in the combination, not the primitives. Flagged as a risk: if two dimensions prove insufficient during testing, a third can be added without restructuring.

---

### Decision 19: OCEAN Retained, Custom Traits Dropped

**Context:** Initial Thread 3 spec proposed custom five traits (aggression, courage, independence, empathy, cunning). Thread 1 proposed OCEAN. Need to resolve.

**Decision:** OCEAN personality as offsets from faction personality_center. Custom traits like courage, empathy, deception propensity emerge from OCEAN + situation — they're not stored. High-O + low-N + threat context = effective courage. High-A + high-O + suffering context = effective empathy. Low-A + low-C + valuable info = deception propensity.

**Rationale:** OCEAN is more primitive and more empirically grounded. Custom traits are composites that should emerge, not be encoded. This aligns with the non-essentialist philosophy — there's no essential "courage" trait, just personality configurations that produce courageous behavior in certain contexts and non-courageous behavior in others. Fleeson's work on within-person personality variability directly supports this: stable traits produce variable behavior because expression is always situated.

---

### Decision 20: Fear Is Not a Primitive, Not Even a Computed Value

**Context:** Transfer doc included fear as faction state variable. Thread 1 dropped it (Barrett: fear is constructed, not primitive). Initial Thread 3 spec proposed fear as either stored state or computed value. Discussion pushed further: even computing fear from other values re-introduces essentialism.

**Decision:** Fear doesn't exist in the CAS at any level. Not stored, not computed, not derived. An entity with negative valence, high arousal, and knowledge of an approaching threat is experiencing a *configuration of primitives*. Claude might interpret that as fear. Or rage. Or grim determination. Or something without a clean label. The CAS doesn't know and doesn't care. Only Claude constructs the category.

**Rationale:** Barrett's core argument: fear (and all emotions) are a social ontology, not natural kinds with essential features. There aren't necessary and sufficient conditions for "fear" — it varies in valence, arousal, behavioral expression, and subjective quality across situations. If we compute it, we're hardcoding one theory of what fear is. If Claude constructs it, we get the full variability of real social ontology. This is where Joe is most excited about the project's potential — Claude enacting social ontology from basic ingredients produces variability that no essentialist system can match.

---

### Decision 21: Five Event Categories With Full OCEAN Modulation

**Context:** Need to define all the ways entity primitives can change, ensuring the rules are complete enough that simple local rules can produce all needed dynamics.

**Decision:** Five event categories cover everything: (1) Direct harm/threat to self, (2) Bond change (formed/strengthened/weakened/severed), (3) Information/experience event (direct experience or received information), (4) Attention from player (pure arousal spike), (5) Passage of time (drift toward baselines, decay). Each has defined valence/arousal effects with all five OCEAN factors modulating the response.

Information/experience is the broadest — covers everything from direct sensory experience to thirdhand rumors. Environmental shifts, faction actions, witnessing events — all are information/experience events at different magnitudes and accuracies. Player attention was separated because the player's extraordinary status creates a pure arousal effect independent of whatever information is exchanged.

**Rationale:** Tested against many scenarios: entity attacked, witnessing friends killed, home territory conquered, crackdown ordered, discovering a lie, slow relationship building, covert action. All decompose into these five categories. The categories are primitive (not compound) and complete (no scenario requires a sixth). OCEAN modulation ensures heterogeneous responses to identical events.

---

### Decision 22: Affect Contagion + Information Propagation — Two Mechanisms Only

**Context:** How do state changes spread through the social graph? Original spec had separate propagation rules for loyalty, morale, fear, disposition, and awareness.

**Decision:** Exactly two propagation mechanisms. (1) Affect contagion: valence and arousal changes spread through bonds continuously, modulated by bond strength/valence and OCEAN factors. Consensus multiplier (squared ratio) for nonlinear social pressure when multiple bonds send same-direction signal. (2) Information propagation: knowledge packets travel along bonds discretely with accuracy degradation, emotional charge decay, and E-modulated speed.

Everything else emerges. Cascades, tipping points, faction fragmentation — all are consequences of these two mechanisms operating on graph topology. No special cascade logic needed.

**Rationale:** Real CAS theory: complex macro behavior from simple local rules. These two mechanisms are sufficient because they capture the two fundamental ways social influence works — emotional contagion (fast, unconscious, non-specific) and information transmission (slow, deliberate, specific). The consensus multiplier captures nonlinear social pressure without special threshold logic.

---

### Decision 23: Attribution-Gated Reputation System

**Context:** When something happens in the CAS, who gets credit or blame? Original spec assumed entities automatically knew who caused events. Discussion revealed this is unrealistic and removes strategic depth.

**Decision:** Attribution travels with information, not with affect. Events carry causal agent tags. Witnesses get immediate attribution (bond to causal agent updates). Information packets carry causal agent with degrading accuracy. Affect contagion carries NO attribution — entity B feels worse because bonded entity A feels worse, but B doesn't know why unless information reaches them.

This creates fundamental timing asymmetry: feelings spread fast without explanation, understanding spreads slow with attribution.

**Rationale:** This is how real social systems work — mood is contagious but knowledge is scarce. After a dramatic event, nearby entities feel the emotional impact immediately but only witnesses know the cause. Strategic implications are profound: stealth limits attribution, public action maximizes it, proxy operations manipulate the attribution layer, disrupting intelligence networks prevents attribution from reaching the antagonist.

---

### Decision 24: Bond Dynamics — One Core Rule

**Context:** Bonds need to change in response to game events, but the mechanism must be general enough to handle infinite scenarios without enumeration.

**Decision:** One core rule: when entity A experiences a valence shift and attributes it to entity B, bond(A→B) updates. Valence shift direction determines bond valence shift. Absolute magnitude determines bond strength change (both love and hate strengthen connection). Attribution strength modulates effect (1.0 for witnesses, degraded for info-propagated events). Plus shared experience strengthening (co-presence during events strengthens bonds regardless of affect direction), and natural decay (unreinforced bonds weaken).

**Rationale:** This handles every scenario through one mechanism. Player protects family → family's positive valence attributed to player → bond strengthens. Player kills enemies → enemies' allies' negative valence attributed to player → bond shifts negative. Covert assassination → no witnesses → no attribution → no bond changes to player (but affect still propagates). The rule is general, the specificity comes from the situation. No scenario-specific logic needed.

---

### Decision 25: Social Timer Independent of Paradigm

**Context:** An RTS ticking every 30 seconds and a platformer ticking between levels would produce wildly different social evolution rates if propagation is coupled to tick frequency.

**Decision:** The CAS runs on its own heartbeat — a social timer with a base interval of ~2 minutes real time, adjustable per game by the Dramaturgical Agent. This is independent of paradigm ticks. Paradigm ticks determine when the player perceives CAS changes (episode boundaries, social encounters), but the social graph evolves continuously on its own clock.

**⚠️ UPDATED by Decision 29 (Thread 4).** Social timer pace now set by Game Compiler at creation time, not by Dramaturgical Agent (which has been eliminated).

**Rationale:** This means a player who takes a long time on one level returns to a social graph that evolved more than if they'd speedrun it — time matters. And different paradigms produce similar social evolution rates per real-time-minute despite wildly different tick frequencies. The social timer is a game-level setting, not a paradigm-level one, allowing per-game pacing control.

---

### Decision 26: Resources as Abstract Capacity, Not Economy

**Context:** Faction resources constrain action and create scarcity pressure. But a full economy system turns every game into resource management.

**Decision:** Resources exist as a single faction-level stored value (0.0-1.0) representing abstract capacity to act. Updated by territory control, member count, operations cost, and passive regeneration. Claude interprets low resources narratively (stretched thin, desperate, degraded). No economy UI, trade system, or resource management gameplay unless the paradigm is a management sim or RTS.

**Rationale:** Resources serve one critical social function: constraining faction action and creating scarcity-driven dramatic pressure. A faction at low resources can't sustain crackdowns or military operations. This forces desperate decisions, which are dramatically interesting. But this doesn't require a visible economy — it just needs a constraint that Claude can interpret.

---

### Decision 27: Claude Interprets at Multiple Scales Simultaneously

**Context:** How does Claude interpret a complex social graph with 50-100 entities? Can't interpret every entity individually. Need a structure.

**Decision:** Claude interprets at four scales in a single call: ecology-wide (macro situation from all faction aggregates), faction-scale (within/between faction dynamics), cluster-scale (sub-faction group dynamics from graph topology), and player-sphere (specific entities the player interacts with). Each scale provides context for the others — macro constrains how individuals are interpreted, individuals reveal what's actually happening at the macro level.

**Rationale:** This mirrors how social reality actually works — macro forces constrain micro interactions and vice versa. And it's the multi-scale version of Barrett's framework: context shapes construction at every level simultaneously. Practically, it also controls Claude API cost — Claude interprets the narratively relevant slice at each scale, not every entity individually.

---

### Decision 28: Narrative Continuity as Delta-From-Previous

**Context:** If Claude interprets the CAS state fresh each time, it might produce inconsistent or jarring narrative shifts.

**Decision:** Claude's interpretation is always a delta from the previous interpretation, not a fresh read. The narrative has inertia — a faction "restless" last episode doesn't become "triumphant" unless the CAS values shifted dramatically. Claude receives the previous narrative as context and updates based on what changed.

**Rationale:** This mirrors how CAS values work — each value is strongly linked to its prior value, changing incrementally. The narrative does the same. Combined with the social timer's continuous evolution, this produces a world that feels like it's always been alive and changing — not recalculated each time the player looks.

---

### Open Design Work (Updated)

1. **Behavioral implementation** — how Claude's narrative directives become rendered game content (dedicated thread needed)
2. **Game state schema update** — Thread 1 schema needs revision for valence/arousal replacing 7 state variables. Faction state block, entity mind block, CAS engine state block, behavioral override format, visual manifestation cas_source format, event log effects format, and System Read/Write Reference all need updates.
3. Visual Manifestation Engine specification
4. CAS rate constant calibration (diagnostic framework, testing phase)
5. MVP definition — minimum compelling first level
6. Two-primitive sufficiency validation (optimistic, flagged as risk)
7. ~~Behavioral legibility threshold tables~~ → Eliminated by architectural redesign
8. ~~Behavioral stress response modifier function~~ → Eliminated (constructed by Claude)
9. ~~Event magnitude calibration~~ → Folded into drama density signals + Claude interpretation
10. Overseer model confidence thresholds for escalation levels
11. ~~Dramaturgical Agent ingredient specification~~ → Resolved by Thread 4 (agent eliminated, functions distributed)

---

## Session: 2026-03-04 — Thread 4: Dramaturgical Agent Resolution + Paradigm Grammar Framework

### Decision 29: Dramaturgical Agent Eliminated as Discrete Agent

**Context:** Thread 4 was scoped as the Dramaturgical Agent ingredient specification — how to design fertile initial conditions, translate prompts into CAS parameters, create social hooks, calibrate drama density, build a catalyst library, and design the external pressure ramp. The Thread 3 CAS redesign (two-layer architecture, valence/arousal replacing 7 state variables, Claude interpretation replacing threshold tables) invalidated many of the original Thread 4 specifics. Deeper analysis revealed that the Dramaturgical Agent's *functions* were already handled by other components, making a discrete agent redundant.

**Decision:** The Dramaturgical Agent is eliminated as a discrete agent with its own Claude call. Its functions are distributed across existing components:

| Original Function | Now Handled By |
|---|---|
| Fertile CAS initial conditions | Game Compiler (setup instructions) |
| Prompt → CAS parameter translation | Game Compiler (OCEAN offset generation) |
| Social hook at episode 1-2 boundary | Game Compiler places it; paradigm spec defines patterns |
| External pressure ramp | Already architectural (`pressure_ramp: "player_driven"`, Claude interprets faction response from CAS state) |
| Drama density monitoring | Already in CAS engine (stagnation/melodrama signals passed to Claude interpretation layer) |
| Catalytic perturbations | Claude's interpretation layer responding to stagnation signals — Claude directs NPC actions that inject events into CAS |
| Mechanical game arc | Paradigm grammar + skeleton (see Decision 31) |

**Rationale:** The CAS redesign made drama density monitoring and catalyst triggers native to the CAS engine + Claude interpretation loop. The social dimension doesn't need a separate drama designer because: (a) the player is a constant extreme perturbation generating cascading social consequences, (b) fertile initial conditions are a Game Compiler setup task not a separate agent, (c) Claude's interpretation layer already responds to stagnation/melodrama signals and directs NPC behavior. The mechanical game dimension is handled by the paradigm grammar framework (Decision 31). There is no remaining function that requires a discrete Dramaturgical Agent call.

---

### Decision 30: Social Drama Handled by CAS + Player + Claude Interpretation

**Context:** With the Dramaturgical Agent eliminated, needed to confirm that social drama quality is architecturally guaranteed without a dedicated drama system.

**Decision:** Social drama emerges reliably from three interacting systems, no dedicated drama agent required:

1. **CAS engine** — deterministic social physics producing cascading affect propagation, information flow with attribution, bond dynamics, faction aggregation. Includes built-in drama density signals (stagnation/melodrama) sent to Claude.
2. **Player as extraordinary catalyst** — the player constantly perturbs the system through combat, territory conquest, social interaction, and information manipulation. `event_magnitude_sensitivity` (calibrated by intended_length) ensures CAS reacts proportionally.
3. **Claude interpretation layer** — constructs situated narrative from CAS primitives, directs NPC behavior (including faction leadership decisions), responds to stagnation signals by having NPCs act on latent tensions.

**One designed social ingredient survives: the early social hook.** Placed at the episode 1-2 boundary by the Game Compiler. Paradigm-appropriate pattern (behavioral signal in action games, encounter in RPGs, etc.). Encounter guaranteed, outcome emergent. Purpose: introduce the social dimension before the player has organically accumulated enough bonds for the CAS to produce visible drama on its own.

**Rationale:** Analysis of five properties of great narrative experiences (tension signature, escalating stakes through connection, reframes, meaningful choice under uncertainty, contrast/variation) showed that four are structurally produced by the CAS + player architecture. The fifth (contrast/variation) comes from Claude interpretation quality and paradigm design. The early hook addresses the one genuine gap: the CAS needs the player to have bonds before it produces visible social drama, but the player starts with none.

---

### Decision 31: Paradigm Grammar + Skeleton + Override Conditions for Mechanical Game Arc

**Context:** With social drama resolved, the question became: what ensures the *mechanical* game experience (platforming, racing, fighting) feels like a great, authored game rather than a tech demo? The Sequencing Grammar Framework handles within-episode quality (teachability, rhythm, directionality). Nothing currently handles across-episode arc — vocabulary progression, zone structure, boss placement, difficulty shape.

**Decision:** Three-layer framework for mechanical game quality:

**Layer 1 — Paradigm Grammar.** Each paradigm has a native full-game structural grammar defining: structural units (levels, cups, missions, dungeons), organization pattern (linear, selectable, branching), punctuation (bosses, championships, fortress sequences), progression shape, non-negotiable paradigm features (bosses at end of Mega Man stages, castles in Mario worlds, cups in racing), and vocabulary accumulation pattern. These are paradigm properties, not per-game decisions. Derived from ingestion pipeline data (1,350+ games). Extends the existing paradigm specs.

**Layer 2 — Skeleton.** At game creation time, the Game Compiler instantiates the paradigm grammar for this specific game, shaped by: prompt intent, narrative premises, intended length, and CAS initial conditions. The skeleton is a *default plan* — "this is a 4-world, 3-levels-per-world platformer with bosses at world boundaries, set in this narrative, heading toward this resolution." It includes: vocabulary budget (tiered by complexity), zone/environment progression, boss placement, complexity ceiling per episode, difficulty shape. Stored in `meta.mechanical_arc` (or equivalent), immutable at creation but consultable by content agents.

**Layer 3 — Override Conditions.** The skeleton is a default, not a mandate. When CAS-driven events produce situations where the structural plan no longer fits the world's reality (faction collapse, paradigm shift earned, player resolves the game faster/differently than expected), Claude's interpretation layer can adapt the skeleton. Override conditions are indeterminate and open to Claude's constructionist interpretation — not a deterministic lookup table. Claude reads CAS state + skeleton + current game reality and constructs the appropriate structural adaptation.

**Rationale:** The dialectic between CAS flexibility (infinite emergent possibilities) and game structure (guaranteed quality experience) is resolved by the constraint surface model: the paradigm grammar and skeleton are firm but bendable constraint surfaces. They're additional variables in the "X + Y + Z + W = great experience" equation. The CAS constrains the grammar (social reality may override structural plans). The grammar constrains the CAS (social dynamics express through paradigm-appropriate channels). The specific experience is unpredictable. The quality is guaranteed by constraint design.

---

### Decision 32: Five Experience Primitives as Quality Checks

**Context:** Discussion of what makes any narrative experience great across media (games, film, novels). Identified five properties. Question: are these skeleton parameters to calibrate, or emergent properties to check?

**Decision:** Five experience primitives identified as emergent properties of well-designed paradigm grammars, not independent calibration targets:

1. **Vocabulary accumulation** — player's mechanical repertoire grows over time. Emergent from paradigm grammar's vocabulary budget and complexity tiering.
2. **Consequentiality escalation** — player actions have increasingly large consequences. Emergent from CAS bond accumulation + expanding social network + mechanical progression through the game world.
3. **Environmental legibility** — player always understands the current context's rules. Emergent from paradigm grammar's zone design + sequencing grammar's teachability primitive.
4. **Earned transformation** — when the game changes, it feels caused. Emergent from CAS causal chains + override conditions requiring Claude to justify structural adaptation.
5. **Compression toward resolution** — the experience vector points toward a climax. Emergent from win condition design + skeleton's default progression + CAS escalation dynamics.

These serve as diagnostic checks (does the game exhibit these properties?) not as design inputs (set vocabulary_accumulation_rate to 0.7). The diagnostic framework evaluates them.

**Rationale:** Defining these as independent parameters would re-create the essentialist trap the CAS redesign eliminated. They're constructed properties — they emerge when the system's primitives (CAS, paradigm grammar, sequencing grammar, player action) are well-calibrated. Making them explicit as quality checks ensures they don't get lost while keeping them at the right level of abstraction.

---

### Decision 33: Paradigm Grammar Framework Defined Now, Specific Grammars Built Before Phase 2

**Context:** When should the specific paradigm grammars (Mega Man's stage-select structure, Mario's world-level-castle structure, etc.) be defined?

**Decision:** The *framework* (what paradigm grammars are, what they contain, how skeletons instantiate them, how override conditions work) is defined now and captured in claude.md. The *specific grammars* for each paradigm are built before Phase 2 (Experience Intelligence), leveraging: (a) ingestion pipeline structural data from 1,350+ games, (b) hands-on experience from Phase 1 playtesting. Specific grammars extend the existing paradigm specs document.

**Rationale:** The framework is architectural — it affects how the Game Compiler works and how content agents generate episodes. Must be captured now so future sessions don't reinvent a drama agent or come up with contradictory structural approaches. The specific grammars benefit from data (ingestion pipeline) and experience (Phase 1 playtesting) that aren't available yet. Defining them now would mean working from memory rather than evidence.

---

---

## Session: 2026-03-04 — Visual Manifestation Engine Specification (Thread 5)

### Decision 34: VME Design Approach — Semantic-But-Specific (Approach B)

**Context:** Three possible approaches for how Claude communicates visual changes to the VME. Approach A (highly semantic — "territory should feel threatening") requires VME intelligence. Approach B (moderately concrete — "add mushroom cloud over fortress, shift palette toward dark industrial") makes VME a mechanical resolver. Approach C (fully concrete — exact asset IDs, pixel coordinates) bloats Claude's prompt with rendering details.

**Decision:** Approach B. Claude speaks in semantic-but-specific visual directives. The VME resolves them mechanically without creative judgment. Claude never specifies pixels or asset IDs. The VME never interprets narrative or decides what should change.

**Rationale:** Consistent with the Barrett-grounded architecture — Claude constructs meaning from CAS primitives, other systems resolve mechanically. Same pattern as CAS engine (deterministic math) + Claude interpretation (meaning construction). The VME is a resolver, not a creative agent.

---

### Decision 35: Seven Directive Types with 39 Primitives

**Context:** Needed to identify the atomic visual/audio changes the CAS can produce, working from concrete examples (bob-omb nuke, foot clan protest, faction territory decay, novel entities, Kenny Powers on a jet ski).

**Decision:** Seven directive types:

1. **Entity Visual Modifier** (8 primitives: size, color/palette, added element, removed element, animation state, transparency/visibility, silhouette change, entity replacement)
2. **Scene Composition** (5 primitives: elements, spatial arrangement, scale context, temporal nature, trigger context)
3. **Environment Modifier** (6 primitives: palette shift, tile replacement, added detail, removed detail, lighting change, weather/atmospheric — scope: local or global)
4. **Scene-Level Effect** (4 primitives: screen shake, screen flash, transition effect, UI-level overlay)
5. **Novel Entity Spec** (6 primitives: distinguishing features, size class, palette constraints, style era reference, animation states needed, role/archetype reference)
6. **Text Content** (4 primitives: text string, display method, visual style, language/legibility)
7. **Audio/Music Modifier** (6 primitives: tonal shift, instrumentation change, tempo change, volume/dynamics, sound effect trigger, ambient texture — scope: local or global)

**Key design decisions within this:**
- Entity Pose/State was eliminated as a separate type — covered by Entity Visual Modifier primitives (silhouette change + added element + animation state). VME decides whether to fulfill via Layer 1 or Layer 2.
- Entity replacement covers full transformations (werewolf, transfiguration) as a primitive rather than requiring composition from all other primitives simultaneously.
- Audio/Music Modifier included alongside visual types — CAS state changes that warrant visual changes often warrant audio changes too.
- Scene-Level Effects kept separate from Environment Modifiers despite small primitive count — they operate on the screen/camera (cinematographic), not on locations (environmental). Architecturally distinct rendering target.

---

### Decision 36: Seven Cross-Cutting Fields + Directive Stack Model

**Context:** Needed fields that apply across all directive types, plus a model for how directives accumulate and interact over time.

**Decision — Cross-cutting fields:** target, persistence (permanent/episode/momentary), priority (critical→ambient), narrative context (free text for debugging/coherence), timing/sequencing (group ID + sequence order), intensity/magnitude (subtle→extreme, VME resolves to values), layering behavior (additive vs replacement).

**Decision — Directive stack model:** VME maintains a stack of active directives per target.
- Claude is the only system that adds or removes directives
- Nothing auto-reverts — recovery requires an explicit counter-directive from Claude
- Additive directives accumulate (rain + darkness + debris stack)
- Replacement directives replace only their own primitive type (new palette shift replaces old palette shift, doesn't affect rain)
- Priority resolves conflicts; recency breaks ties
- Stack is serializable as game state

**Rationale:** Claude-only stack modification keeps Claude as sole meaning-maker, consistent with the two-layer architecture. No auto-revert prevents the VME from making implicit narrative judgments about when visual changes should end. Serializable stack enables save/restore.

---

### Decision 37: Three-Layer Capability Model

**Context:** VME directives need to be resolved to actual pixels. Different directives require different levels of capability — some are pure canvas operations, others need new pixel content, others need entirely new assets.

**Decision:**
- **Layer 1 (Compositional):** Canvas operations on existing library assets — scaling, palette remap, compositing, flipping, tiling, opacity/blending, color shifting, positional composition. Zero AI cost. ~40-50% of directives.
- **Layer 2 (Sprite Variant):** Modifications to existing sprites — pose adjustment, held object insertion, integrated status overlays, partial transformation, pixel text, expression/face change. Programmatic for simple cases, AI-assisted for complex. ~30-40% of directives.
- **Layer 3 (Novel Generation):** New assets from scratch, constrained by Game Visual Identity. AI image generation required. ~10-20% of runtime directives; 100% of Track B initial asset population.

**Routing rule:** Always try cheapest capable layer first. Layer 1 → Layer 2 → Layer 3.

**Layer 2 boundary:** Start conservative (send more to AI), gradually migrate operations to programmatic as rules prove reliable. Exact boundary tuned during development.

---

### Decision 38: Game Visual Identity System (Track B Architecture)

**Context:** Track B (generated assets for public release) risks visual incoherence — each sprite looking like it came from a different game. Naive generation with text descriptions + style constraints produces individually acceptable but collectively incoherent assets.

**Decision:** Track B generates a complete **visual system** before generating any individual asset. The Game Visual Identity contains six components:

1. **Palette architecture** — ~20-25 master colors organized into primary (player, key NPCs), secondary (enemies, environments), accent (collectibles, UI, danger) palettes
2. **Proportion grid** — exact pixel dimensions for every entity role (player, small enemy, large enemy, boss, collectible, tile, etc.)
3. **Detail density rules** — how much visual information per pixel area (eye size, outline treatment, interior detail colors)
4. **Animation budget** — exact frame count per action type per era
5. **Visual shorthand dictionary** — how this game communicates concepts visually (danger, collectible, friendly, impassable)
6. **Silhouette distinctiveness rules** — every entity identifiable by silhouette alone, checked against existing roster

Every asset is generated within the identity. Quality gates validate compliance. Failures trigger regeneration.

**The ingestion library provides distributional knowledge and relational constraints — never pixel data:**
- Distributional: sprite sizes, palette counts, frame counts per era/paradigm/role
- Relational: color distance between player and enemies, boss-to-enemy size ratios, environment-entity palette overlap
- Platform-level: Genesis high contrast vs NES subtlety, SNES RPG gradients vs SNES platformer crispness

**Legal principle:** Copyright protects specific pixel arrangements (expression). It does not protect distributional knowledge, relational constraints, or design patterns (facts/ideas). Every Track B pixel is novel. Cohesion comes from the system.

**Rationale:** This mirrors how real art teams work — shared style guide ensures cohesion without any one asset being derived from another. The ingestion library's value is maximized for Track B quality without copying expression.

---

### Decision 39: Claude's Dual Output Streams

**Context:** When CAS produces novel interactive objects (weapons, vehicles, tools), the VME needs to know what they look like, and the paradigm engine needs to know how they behave. These are two different systems consuming two different kinds of specification.

**Decision:** Claude's runtime interpretation call produces two parallel output streams:
1. **Visual/audio directives** → consumed by VME
2. **Mechanical directives** → consumed by paradigm engine / Game Compiler

Novel interactive objects require both. Neither system sees the other's output. Claude is the only system that reasons about both visual and mechanical aspects.

**Rationale:** Clean separation of concerns. VME owns appearance, paradigm engine owns behavior. Consistent with the overall architecture where Claude is the meaning-maker and downstream systems are mechanical resolvers.

**Flag for future sessions:** The mechanical directive format has not been specified. When Game Compiler / paradigm engine work resumes, this format needs definition — it's the behavioral counterpart to the VME's scene spec.

---

### Open Design Work (Updated)

**Resolved by Thread 5:**
- ~~Visual Manifestation Engine full specification~~ ✅
- ~~Prompt-time character/environment generation pipeline~~ ✅ (Game Visual Identity system)

**Remaining:**
1. CAS state → level content translation per paradigm
2. Multi-paradigm shift mapping mechanics
3. Paradigm grammar specifics per paradigm (before Phase 2)
4. Social hook pattern library
5. Game state schema document update (apply Thread 3 CAS diffs + Thread 5 `vme_state` section for directive stack)
6. Asset resolution strategy document update (reference Game Visual Identity system)
7. Mechanical directive format specification (flagged by Decision 39)

---

## Session: 2026-03-04 — Entity Minds & Communication (Thread 7)

### Decision 40: No Artificial Conversation Soft Caps — Natural Character Play

**Context:** Thread 7 needed to specify how conversation length is managed. Earlier proposals included per-entity exchange limits and injected "wrap it up" instructions at soft cap thresholds. Joe pushed back: entities should respond naturally, not be artificially constrained.

**Decision:** No artificial soft caps on conversations. Claude plays each character naturally — conversation length emerges from the entity's knowledge depth, personality (especially extraversion), affect state, and the situation. An entity with three knowledge items and low E will naturally give terse, sparse answers. A faction leader in a complex negotiation will sustain long exchanges because the content supports it. Claude is trusted to play the character honestly, including responding appropriately to irrelevant prompts (a goomba asked about music responds with confusion, not a pre-scripted refusal).

**Rationale:** Artificial limits create unnatural conversation endings and require tuning per entity type. Natural character play is self-regulating: entities with little to say will say little. The constraint surface philosophy applies — design the ingredients (knowledge depth, personality) correctly and the right conversation length emerges without prescription.

---

### Decision 41: Player Exchange Budget as Visible Game Mechanic

**Context:** API cost control is necessary but shouldn't feel like a system limitation. Joe wanted the constraint to be transparent and gamified, eventually tierable for monetization.

**Decision:** Cost control is entirely player-side via a visible exchange counter in the game UI (displayed alongside existing game counters like score, lives, time). The player receives X conversation exchanges per 24-hour period. Each exchange (one player message + one entity response) decrements the counter by 1. Counter resets daily. Exact budget numbers TBD during testing and economics analysis. Tierable: free tier gets a modest budget, paid tiers get larger budgets.

**Rationale:** This transforms an API cost constraint into a game mechanic — resource scarcity creates strategic decisions. Players learn to spend exchanges on high-value conversations rather than idle chat. Wasting an exchange on an irrelevant prompt costs the player, teaching them to engage meaningfully. Same principle as limited lives or ammunition: constraints that create gameplay.

---

### Decision 42: Named + Population Entity Architecture with Runtime Promotion

**Context:** Games can have thousands of entities (RTS armies, dense platformer worlds, management sim populations). Individually populating a full mind for every entity is prohibitively expensive. But Joe pushed back on a simple "mind vs. no-mind" binary — an entity that refuses to communicate is more interesting than one that can't.

**Decision:** Two entity populations, one schema:

- **Named entities** (~60-100 per game regardless of total count): Individually generated by Game Compiler with unique OCEAN offsets, individual knowledge lists, specific motivations, explicit social graph connections. Game Compiler decides which entities are named based on narrative/structural importance (commanders, scouts, diplomats, specialists, sage/oracle, social graph bridge nodes).

- **Population entities** (remainder): Generated in batches from compact templates. Template contains: faction OCEAN center, shared minimal knowledge list, shared `communication_willingness` baseline, behavioral parameter baselines, perturbation ranges for individuality. One template covers an entire class (e.g., "goomba patrol unit").

- **Runtime promotion:** When the player initiates conversation with a population entity, it's promoted to named in real time. Claude generates unique OCEAN offsets, name, specific knowledge, personality quirks — all constructed from the population template + current CAS state + conversational context. From that point forward, the entity has a persistent individual mind.

**Rationale:** Barrett's constructionism applied literally — entity identity is constructed at the moment of social interaction, not predetermined. Before engagement, they're a statistical member of a population. After engagement, they're a person. Cost scales with player engagement, not world size. A 2,000-entity game costs barely more than a 100-entity game to generate.

**Note:** The Dramaturgical Agent is NOT involved in this process — per Decision 29 (Thread 4), all its functions are distributed to Game Compiler, paradigm specs, CAS engine, and Claude interpretation layer.

---

### Decision 43: Knowledge Distribution as Game Compiler Sub-Step (Deterministic Algorithm)

**Context:** The principle "knowledge is architecturally enforced" was established early but the actual distribution mechanism was unspecified. Options: separate Knowledge Distributor agent (Claude-powered), or deterministic algorithm within Game Compiler.

**Decision:** Knowledge distribution is a deterministic sub-step within the Game Compiler, not a separate agent. After generating the complete world truth (master fact list), the Game Compiler runs a distribution algorithm:

1. **Location match** → entity's zone overlaps fact's source location → high accuracy (0.8-1.0)
2. **Role match** → fact domain matches entity role (guards→military, cooks→social, scouts→geographic) → moderate accuracy (0.6-0.8)
3. **Rank filter** → facts above entity's clearance excluded entirely
4. **Social graph seeding** → one propagation pass through closest connections (bond strength > 0.5) with accuracy degradation → secondhand knowledge at game start
5. **Lore placement** → actionable→sage/oracle, structural→high-rank, ambient→scattered widely
6. **Misinformation injection** → Game Compiler (Claude) generates false facts with high confidence, injected into specific entity knowledge lists

Population entities receive only: zone-matched facts at low accuracy, ambient lore, 1-2 role-appropriate facts.

**Rationale:** Distribution rules are mechanical, not creative. They don't require Claude's judgment — they need an algorithm. Running this deterministically within the Game Compiler avoids an additional agent/API call while producing correct knowledge distribution. All runtime knowledge changes are handled by CAS information propagation — no further distribution steps needed.

---

### Decision 44: No Lie Detector — Contradictions Surface Through CAS Information Propagation

**Context:** Joe flagged uncertainty about how the game would detect player lies. Needed a mechanism that fits the existing architecture without adding a new system.

**Decision:** No lie detection system. Player statements become knowledge items in the spoken-to entity's knowledge list, tagged `source: player`. Contradictory statements to different entities propagate through the social graph via normal CAS information propagation. When contradictory player-sourced claims reach the same entity (or Claude interprets the CAS state for entities in a cluster where contradictions exist), Claude constructs the appropriate social response (suspicion, confrontation, reputation damage). Bond valence toward player drops via normal attribution mechanics.

Detection speed is governed by existing CAS factors: social graph topology, entity extraversion, information emotional charge. Lies told to closely connected entities surface fast. Lies told to isolated clusters may never surface.

**Rationale:** This requires zero new code — it's a natural consequence of the existing information propagation system. It's also more realistic than a lie detector: some lies work because the social graph doesn't connect the targets. Strategic lying (telling different things to isolated groups) is a valid player strategy with real risks. The system rewards social intelligence, not just honesty.

---

### Decision 45: Emissary Conversations as Single API Call with Dual Entity Schemas

**Context:** Joe wanted delegation mechanics where the player sends an ally to negotiate on their behalf. Needed a mechanism that creates strategic depth without complex new systems.

**Decision:** Emissary interaction = one Claude API call with both entity mind schemas (emissary + target) plus the player's instructions as context. Claude generates the conversation between them. The emissary reports back to the player, but the report is filtered through the emissary's own personality:

- High-N emissary may overstate threats
- Low-A, low-C emissary may cut a side deal
- Duplicitous emissary may misrepresent player's instructions
- High-C, strong-bond emissary reports faithfully

Player never receives ground truth about what happened — only the emissary's filtered account. The emissary-to-target conversation generates normal CAS events (information transfer, affect changes, bond updates).

**Cost model:** Player's daily exchange budget is charged for the instructing conversation with the emissary, but NOT for the emissary-to-target conversation. This means delegation extends the player's reach beyond their direct budget at the cost of trust mediation.

**Rationale:** Falls naturally out of the existing conversation system — it's just two entities talking instead of player and entity. Creates a trust-mediated strategic layer where choice of emissary matters as much as the message. Emissaries can be intercepted or compromised through CAS dynamics (enemy entities encountering the emissary). One additional API call per delegation — manageable cost.


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
## Append this to the existing `docs/decisions-log.md`

---

## Session: 2026-03-04 — Multi-Paradigm Shift Mechanics (Thread 8)

### Decision 50: Paradigm Shift Design Principles Established (Implementation Deferred)

**Context:** Thread 8 (Multi-Paradigm Shift Mechanics) was scoped to specify shift triggers, state transfer, entity crosswalks, and transition experience. Audit of existing specs (Threads 1-5, 7, 7.6) revealed the architecture already supports paradigm shifts — paradigm-independent CAS, flexible spatial format (Decision 11), dynamic Episode Brief generation (Decision 46). What's missing is implementation-level specification that requires empirical grounding from Phases 1-6.

**Decision:** Establish 10 design principles as constraints for Phase 7 implementation. Defer all implementation specification (detection mechanisms, crosswalk mappings, transition design, damping parameters) to Phase 7 when working paradigms and CAS tuning data exist.

The 10 principles:
1. Shifts are consequences, not requests
2. Player prompts are ingredients, not contracts
3. CAS state is paradigm-independent and carries over completely
4. Identity persists, capability transforms
5. Transitions are narrative moments, not loading screens
6. Shifts occur only at episode boundaries, no exceptions
7. Oscillation damping is required
8. The Overseer can weaponize paradigm shifts
9. Deliberate shift-triggering is deep mastery
10. First-time paradigm introductions get extended teachability

**Rationale:** Specifying shift mechanics now would produce placeholder numbers with no empirical basis. The principles capture the design intent that must survive into Phase 7 without over-constraining implementation details that depend on how the system actually feels when played. The architecture is already shift-ready; what's needed is taste-level guidance, not engineering specification.

---

### Decision 51: Player Prompts Are Ingredients, Not Contracts

**Context:** Players can prompt for multi-paradigm games ("Mega Man but dungeons are Doom and final boss is Mario Kart style"). How binding is that request?

**Decision:** The Experience Interpreter picks the dominant paradigm; the Game Compiler skeletonizes reasonable paradigm requests into the game structure. But CAS-driven emergent shifts can override or supplement the prompted structure. The player's prompt shapes initial conditions, not outcomes. A prompted finale paradigm may never materialize if the social ecology evolves elsewhere.

**Rationale:** Consistent with the core design philosophy: ingredient design over outcome prescription. The prompt is the strongest ingredient in initial conditions, but the system's commitment is to emergent quality, not prompt fidelity. Locking paradigm structure to prompts would subordinate the CAS to player expectations — the opposite of the project's thesis.

---

### Decision 52: Strict Episode-Boundary Paradigm Shifts

**Context:** Should paradigm shifts ever occur mid-episode? Initial proposal included "rare climactic exceptions."

**Decision:** No mid-episode shifts, no exceptions. If CAS produces shift-worthy conditions mid-episode, that drama becomes the current episode's climax content. The shift takes effect at the next episode boundary.

**Rationale:** The entire sequencing pipeline (Episode Brief, Grammarian, Rhythmist, Cartographer, Provocateur, Coherence Auditor) assumes episode-level coherence. Mid-episode shifts would violate the Auditor's structural guarantees. The between-episode window is specifically designed for transitions, making it the natural home for paradigm shifts. Forcing the drama into the episode's conclusion is narratively stronger than an abrupt mid-level genre change.


---

## Session: 2026-03-05 — Gameplay Quality, Difficulty Philosophy & Level Construction Architecture (Thread 9)

### Decision 53: SNES Comfort Model as Default Difficulty Philosophy

**Context:** Two Fires targets a broad audience including casual players and people accustomed to modern game forgiveness. NES-era difficulty (quarter-eating arcade psychology, high punishment, reflex-dependent) is hostile to this audience and, critically, hostile to the social ecology — a player dying every 15 seconds is in pure reflex mode and won't notice social hooks. Joe identified SNES-era games (Super Mario World, Link to the Past, Mega Man X, F-Zero, Mario Kart, Turtles in Time) as the right difficulty model: manageable, great controls, slow ramp, teach-then-challenge, competence over reflex.

**Decision:** Two Fires defaults to SNES-era difficulty philosophy. The core principle: **the game respects your time and assumes you want to make progress, not prove yourself.** Difficulty comes from complexity layering (more elements interacting) and spatial pressure (tighter windows), not from punishment severity (instant death, long setbacks, scarce checkpoints).

Default forgiveness parameters:
- **Checkpoint philosophy:** Player never loses more than ~60-90 seconds of progress on death. Frequent implicit checkpoints.
- **Death cost:** Low. Primary cost is time, not accumulated progress. No permadeath, no item loss, no save state resets.
- **Enemy telegraph duration:** Long enough to react thoughtfully, not just reflexively. 400-600ms for standard attacks, longer for heavy attacks.
- **Teachability generosity:** Every new mechanic/enemy gets a consequence-free introduction *zone*, not just one safe encounter. Multiple safe encounters before challenging use.
- **Complexity ceiling per episode:** Conservative — player can track everything happening simultaneously. Two to three simultaneous challenge types in hardest moments.
- **Ramp shape:** Concave (fast early progress, slow difficulty increase, hardest sections concentrated near end). Compression toward resolution provides the late-game spike.

The prompt can push harder ("brutal," "challenging," "punishing," "arcade difficulty"), but the default is SNES-generous. The Experience Interpreter must receive an explicit difficulty signal to deviate from the comfort model.

**Rationale:** The SNES games Joe identified share a specific contract with the player: graduated competence. They teach through level design (not punishment), let you feel skilled before layering complexity, and never rely on exceptional hand-eye coordination to progress. This creates the exact cognitive headspace where social hooks land — a competent, relaxed player notices that a goomba hesitated. A dying, frustrated player notices nothing. The Competence Bias is both a difficulty preference AND an architectural requirement for the social layer.

---

### Decision 54: "NES Style" Is an Aesthetic Signal, Not a Difficulty Signal

**Context:** When a player prompts for "NES-style game" or "8-bit adventure," should the difficulty match NES-era punishing design?

**Decision:** No. The Experience Interpreter treats era-style prompts as aesthetic signals (limited palette, chiptune, 8-bit sprites, specific screen resolution constraints), not difficulty signals. A game prompted as "NES style" looks NES but plays SNES. Forgiveness parameters are decoupled from aesthetic era parameters.

The only way to get NES-hard difficulty is to explicitly request it with difficulty-specific language: "hard," "challenging," "punishing," "arcade difficulty," "old-school hard," etc. The Experience Interpreter must identify an explicit difficulty intent, not infer it from aesthetic era.

**Rationale:** Most players requesting "NES style" want the aesthetic nostalgia, not the quarter-eating punishment. Players who DO want punishing difficulty will say so. Decoupling aesthetic from difficulty prevents the system from alienating casual players who just want the look and feel of classic games. This also means the full palette of retro aesthetics is available to the broadest audience.

---

### Decision 55: Provocateur Agent Eliminated

**Context:** The Provocateur was originally designed to inject one "grammar violation" per episode — a surprising moment that disrupts established patterns. Discussion revealed this is more likely to feel like noise or bad design than intentional surprise. If the base game experience is well-designed, random pattern-breaking is redundant at best and disruptive at worst. The great SNES moments (hidden star road in Super Mario World, weapon-gated revisits in Mega Man X) weren't violations of grammar — they were expressions of deeper authorial vision.

**Decision:** The Provocateur is eliminated as a discrete agent. Surprise and delight emerge from the Designer's vision and taste evaluation (see Decision 58), not from injected violations. If an episode lacks surprise, that's a taste failure to be addressed by tuning the Designer's prompt and taste profile, not by a separate surprise-injection system.

**Rationale:** The Provocateur was a crutch for bland base experiences. The new level construction architecture (Decisions 57-60) addresses blandness at the source — through authorial vision and taste evaluation — rather than papering over it with random disruptions. Parsimony: fewer agents, fewer boundaries, fewer places for coherence to leak.

---

### Decision 56: Grammarian, Rhythmist, Cartographer Consolidated into Builder

**Context:** The Grammarian (vocabulary sequencing), Rhythmist (tension/relief pacing), and Cartographer (spatial layout) operated as separate agents with separate concerns. But these functions are deeply interdependent — vocabulary sequencing affects rhythm (new elements need safe zones), rhythm affects spatial layout (tension peaks need different geometry than breathers), spatial layout affects vocabulary (can't teach wall-jump without walls). Separation meant each agent made decisions without full awareness of the others, requiring the Coherence Auditor to catch conflicts after the fact.

**Decision:** All three functions are consolidated into a single **Builder** that considers vocabulary sequencing, tension/relief, and spatial layout as an integrated construction problem. The Builder receives the Designer's section specification and produces a section where all three dimensions are coherent by construction, not by post-hoc auditing.

**Rationale:** Fewer boundaries = fewer translation losses. An integrated Builder converges faster because there's no inter-agent negotiation. A section where rhythm, vocabulary, and spatial layout are designed together feels more coherent than one where three separate agents independently optimized their own concern. Same voice throughout — consistent with Decision 60 (Claude as Builder for all sections).

---

### Decision 57: Coherence Auditor and Simulated Player Merged into Validator

**Context:** The Coherence Auditor checked structural validity (pathability, teachability completeness, no softlocks). The Simulated Player Agent pathfound through levels, recorded timelines, and logged deaths. Both are verification functions — "is this physically feasible?" — not creative functions.

**Decision:** Both are merged into a single **Validator** — entirely deterministic code (no Claude calls). The Validator runs pathfinding, reachability analysis, timing verification, teachability arc completeness checks, and softlock detection. If validation fails, the section goes back to the Builder with the specific constraint violation.

The Validator does NOT evaluate taste, quality, or experiential properties. It only checks physical feasibility and structural constraint satisfaction.

**Rationale:** Parsimony. Both components answer the same question: "can a player physically complete this?" Merging them eliminates a redundant boundary. Making it deterministic code eliminates Claude calls for work that doesn't require intelligence — pathfinding and constraint checking are computational, not creative. Fast and cheap.

---

### Decision 58: Designer Agent — Unified Author + Tastemaker

**Context:** The discussion identified two missing capabilities: top-down authorial vision (the "wouldn't it be cool if..." quality that makes levels feel intentional) and iterative taste evaluation during construction (catching soullessness before it ships). Initially proposed as separate Author Agent and Taste Agent. Discussion revealed these are the same function — a human designer both envisions and evaluates, adjusting the vision based on what emerges.

**Decision:** A single **Designer** (Claude call) that both creates and evaluates. The Designer:

1. **Receives:** Episode Brief from Game Compiler + game-type taste profile + Living Taste Document + full game context (skeleton, CAS state, prior episodes, narrative position).

2. **Produces Episode Vision:** Emotional arc for the episode, signature design moments ("wouldn't it be cool if..." ideas), hidden intentionality (secrets, curiosity rewards, things that make the player feel anticipated), connective logic to prior and future episodes, and section-by-section specifications including emotional target, key moments, vocabulary allocation, and intended player psychological state at entry/exit.

3. **Evaluates each section after construction:** Maintains a running model of the player's cumulative psychological experience (confidence, momentum, attention, expectation, curiosity). Evaluates each built section against the Vision, the accumulated experience, and the game-type taste profile. Can approve, request revision with specific feedback, or revise remaining-section specs if the emerging level suggests a better direction than the original plan.

The Designer's evaluation is qualitative taste judgment, not constraint checking (that's the Validator's job). It catches the "syntactically correct but soulless" failure mode — the exact gap between "valid level" and "authored level."

**Rationale:** The best levels come from a designer who has a vision, starts building, evaluates as they go, and adjusts based on what's emerging. Separating vision from evaluation creates a translation boundary that loses nuance. A unified Designer can say "my original vision isn't working with these elements, but here's what IS emerging, and it's interesting in a different way." This is how real design works — intention and material in conversation.

---

### Decision 59: Game-Type Taste Profiles for Designer Evaluation

**Context:** Different game types have different definitions of "good." A slow, puzzle-like section is brilliant in a Zelda-like game and momentum-killing in a Mario-like game. The Designer needs to evaluate with the right sensibility for the game being made.

**Decision:** The Designer's taste evaluation is shaped by a **game-type taste profile** — a set of evaluative criteria specific to the paradigm. The taste profile defines what this type of game values:

- **Mario-like (platformer):** Values flow, momentum, discovery, playful exploration. "Does the player want to keep moving?"
- **Mega Man-like (action-platformer):** Values mastery, precision, pattern recognition, tool selection. "Does the player understand the challenge?"
- **Zelda-like (action-adventure):** Values mystery, spatial puzzles, discovery arcs, spaces revealing their logic. "Is the player forming hypotheses about the space?"
- **Racing:** Values speed sensation, risk/reward in line choice, rivalry expression. "Does the player feel fast and competitive?"
- **Shmup:** Values pattern density, flow state, escalating visual spectacle. "Is the player in the zone?"
- **RTS/Tactics:** Values strategic clarity, meaningful tradeoffs, information-driven decisions. "Does the player feel clever?"

Profiles are built from the ingestion pipeline — extracting common structural and experiential patterns from the highest-rated games in each paradigm, weighted by quality (popular and well-reviewed games weighted higher; obscure and poorly-reviewed games weighted lower). The ingestion pipeline's ~1,600 games across 6 dimensions provide the ground truth for what "good taste" means in each genre context.

**Rationale:** Taste is contextual. The Designer must evaluate "is this good FOR THIS TYPE OF GAME," not "is this good in the abstract." Taste profiles prevent the mash-up problem — sections that are individually well-designed but wrong for the game type get flagged. Anchoring profiles in real game data (weighted toward great games) ensures the system's taste is grounded in proven quality, not invented from principles.

---

### Decision 60: Claude as Builder for All Sections

**Context:** Should the Builder be deterministic code (fast, cheap per attempt, but no taste) or Claude (slower, costlier per attempt, but understands design intention)? The key tradeoff: deterministic code produces valid layouts but frequently gets taste-rejected by the Designer (leading to multiple retry loops), while Claude understands the Designer's feedback directly and converges faster.

**Decision:** Claude (Sonnet-level) as the Builder for all sections, with no deterministic shortcuts. Every section is built by the same intelligence, producing consistent design sensibility throughout. The Builder receives the Designer's section specification and produces an integrated section where vocabulary sequencing, tension/relief, and spatial layout are coherent.

Three reasons for no deterministic shortcuts:
1. **Parsimony in routing logic.** Determining which sections are "simple enough" for deterministic code adds complexity that outweighs the cost savings.
2. **Fewer loops.** Claude understands why the Designer rejected a section and revises intelligently; deterministic code retries are essentially random search within the valid space. Total cost per approved section may be comparable or lower with Claude despite higher per-call cost.
3. **Same author for all sections.** A level where some sections are built by Claude and others by deterministic code would have subtle inconsistencies in design sensibility. One voice throughout is better.

**Rationale:** The difference between "technically valid" and "intentionally designed" is exactly the difference between deterministic code and Claude. The Builder isn't just placing elements at valid positions — it's making design decisions about *how* elements relate to each other, which requires understanding the Designer's intention. Cost is managed by using Sonnet-level calls (sufficient for informed execution rather than complex creative generation) and by converging in fewer loops.

---

### Decision 61: Simplified Level Construction Architecture — Designer, Builder, Validator

**Context:** The previous level construction pipeline had eight components: Author Agent, Grammarian, Rhythmist, Cartographer, Provocateur, Coherence Auditor, Simulated Player Agent, and (proposed) Taste Agent. Each boundary between components was a place where coherence could leak. The "Claude as Tastemaker" design principle (established earlier in this session) enabled radical consolidation.

**Decision:** Level construction uses three components:

1. **Designer** (Claude) — produces Episode Vision, then evaluates each section for taste during construction. Maintains cumulative player experience model. Can revise vision mid-construction. Uses game-type taste profile. (Consolidates: Author Agent + Taste Agent + Provocateur quality signal)

2. **Builder** (Claude, Sonnet-level) — constructs each section as an integrated design problem (vocabulary + rhythm + spatial layout). Receives Designer's section spec, produces section layout. Retries with Designer feedback when taste evaluation flags problems. (Consolidates: Grammarian + Rhythmist + Cartographer)

3. **Validator** (deterministic code) — checks physical feasibility. Pathfinding, reachability, timing, teachability arc completeness, softlock detection. No Claude calls. Fast. (Consolidates: Coherence Auditor + Simulated Player Agent)

**The construction loop per episode:**
```
Game Compiler produces Episode Brief
  → Designer produces Episode Vision (1 Claude call)
  → For each section:
      → Builder constructs section (1 Claude call)
      → Validator checks feasibility (deterministic, fast)
      → If Validator fails → Builder retries with constraint violation feedback
      → If Validator passes → Designer evaluates taste (1 Claude call)
      → If Designer flags problems → Builder retries with Designer feedback
      → If Designer approves → move to next section
      → Designer can revise remaining-section specs based on emerging level
```

**Typical cost:** ~10-12 Claude calls per episode (1 Vision + ~4-5 Builder calls + ~4-5 Designer taste calls, assuming most sections pass on first or second attempt). Worst case ~20 if several sections are difficult.

**What's eliminated:** Provocateur (surprise comes from Designer's taste and vision), separate Grammarian/Rhythmist/Cartographer (integrated into Builder), Simulated Player as separate component (physical simulation in Validator), Coherence Auditor as separate agent (constraint checks in Validator).

**Rationale:** Eight components consolidated to three. Fewer boundaries = fewer translation losses = more coherent levels. The Designer's continuous taste evaluation catches the "syntactically correct but soulless" failure mode that no amount of syntactic agents could prevent. Claude calls are minimized (two roles, not eight). The Validator handles all non-creative verification as fast, cheap code. The architecture is as simple as it needs to be (parsimony) with no unnecessary moving parts.


---

### Open Design Work (Current as of Thread 9)

**Resolved by Thread 9:**
- ~~Difficulty philosophy / target audience calibration~~ ✅ (SNES Comfort Model)
- ~~Level construction agent architecture~~ ✅ (Designer + Builder + Validator)
- ~~Provocateur necessity~~ ✅ (Eliminated)

**Remaining:**
1. Paradigm grammar specifics per paradigm (before Phase 2) — now also includes game-type taste profiles
2. CAS state → level content translation per paradigm
3. Social hook pattern library
4. ~~Game state schema document update~~ ✅ (Reconciled, Thread 10)
5. ~~Asset resolution strategy document update~~ ✅ (Updated, Thread 10)
6. Mechanical directive format specification (flagged by Decision 39)
7. CAS rate constant calibration (testing phase)
8. MVP definition — minimum compelling first level
9. Exact exchange budget numbers per tier (testing/economics)
10. Design move library — extract transferable design moves from ingestion pipeline
11. Living Taste Document bootstrap — initial taste criteria before Joe's ratings accumulate
## Session: 2026-03-08 — Phase 1 Session 5 (Difficulty Philosophy, Social Difficulty, Meta-Objective)

### Decision 67: Social Dynamics as Primary Difficulty Vector

**Context:** Decision 53 established the SNES Comfort Model — mechanical difficulty defaults to SNES-era forgiveness (SMW, LttP, Mario Kart). But the question remained: if mechanical difficulty is lowered, what provides the challenge that keeps the 200-hour experience compelling? Most of Two Fires' target audience aren't retro gamers and will bounce off NES-era or even high-SNES-era mechanical demands before ever reaching the social layer.

**Decision:** Mechanical difficulty is texture, not content. The primary difficulty vector is the social ecology and the Two Fires meta-narrative. The calibration range is Super Mario World (baseline comfortable) to A Link to the Past (hard edge). Mega Man X is slightly beyond range. NES Mega Man and DKC2 are well out of range. The analogy: Mario Kart 50cc (entry) to 150cc (ceiling).

Social dynamics create felt difficulty through Claude's interpretation layer translating CAS states into mechanical consequences. When the social world turns against the player, the game gets harder in ways that can't be solved mechanically — pushing toward social engagement as the resolution path. When social dynamics favor the player, the game gets mechanically easier while growing socially more complex. This self-balancing loop always draws the player toward the social layer.

Critically: mechanical difficulty that exceeds what the player can solve solo is a *signal*, not a wall. It prompts the player to engage socially (recruit allies, negotiate defections, seek intelligence) rather than demanding they "git gud."

**Rationale:** This extends Decision 53 from "lower mechanical difficulty" to "redirect difficulty to the social layer." The SNES Comfort Model was motivated by "players won't notice social hooks while dying every 15 seconds." This decision goes further: the social dynamics ARE the difficulty. The mechanical layer is the medium through which social consequences are felt, not the challenge itself. This makes Two Fires feel like a modern personal epic (accessible, progressible, 200 hours) rather than a retro gauntlet.

---

### Decision 68: CAS-to-Mechanical Manifestation — Creative Latitude, Not Taxonomy

**Context:** If social dynamics manifest as mechanical gameplay consequences, how prescriptively should those manifestations be specified? Initial discussion generated categories (force consolidation, denial of support, betrayal, environmental hostility, etc.) which risked becoming a lookup table — exactly what Thread 3 eliminated.

**Decision:** Claude's interpretation layer has full creative latitude to translate CAS states into mechanical manifestations. No fixed taxonomy. The same CAS state could manifest many different ways depending on narrative context, paradigm, and dramatic timing. The spec provides mild-to-extreme examples on both favorable and unfavorable sides as illustrations of the creative range, not as an exhaustive menu.

**Rationale:** Consistent with the entire architectural philosophy — define constraint surfaces, not outcomes. A taxonomy of manifestation types would become a de facto behavioral legibility table. Claude interpreting CAS states into mechanically-felt consequences is the same pattern as Claude interpreting CAS states into narrative and visual consequences — it's already the architecture. The examples serve to prompt creative range in Claude's interpretation, not to limit it.

---

### Decision 69: Paradigm Migration as Expected Emergent Pattern

**Context:** Discussion of social difficulty revealed an expected pattern: as social complexity increases, games should naturally migrate from solo paradigms (platformer) toward multi-character paradigms (beat-em-up with allies, tactical encounters, RTS-like moments). This follows from the existing paradigm shift trigger principle — shifts occur when the current genre can't represent what the CAS has produced.

**Decision:** Paradigm migration toward collaborative/multi-character formats is an expected emergent pattern, not a prescribed sequence. It should arise naturally from existing shift triggers. If testing reveals every game following the same migration path (always platformer → beat-em-up → RTS), that's a tuning signal, not confirmation the system works — it means the shift triggers lack variety. The system should produce diverse migration paths.

**Rationale:** Prescribing the migration would contradict the CAS philosophy. But ignoring the expected pattern means we can't diagnose if the system is underperforming. Naming it as "expected but not prescribed" gives us a diagnostic baseline without adding a new system.

---

### Decision 70: Post-Game Continuation and Meta-Objective as Primary Late-Game Driver

**Context:** Open question: what happens when a generated game's win condition is met? The CAS is still running, the social graph is alive, relationships exist. Does the game just end?

**Decision:** "Winning" a generated game is a transition, not an endpoint. The game's primary antagonist is defeated, but the CAS continues. The world persists and evolves. The player's relationship to the world shifts — they are now leveraging it for the Two Fires meta-objective: reaching the giant, recovering the two stolen fires. This requires cross-world achievements (raising armies from won worlds, developing key allies, finding artifacts, making sacrifices). The meta-game is the "personal epic" structure that justifies 200+ hours of play.

The meta-game structure requires its own specification thread. This decision captures the principle; the mechanics are unspecified.

**Rationale:** Ending the game at the win condition wastes the most valuable thing Two Fires produces — living social worlds with real relationship history. The post-game is where the CAS shines hardest: familiar characters making new choices, the consequences of your leadership style rippling forward, worlds you "beat" presenting new challenges from within. It also gives the Two Fires lore its narrative function — the meta-objective is the reason to keep playing across worlds, and the difficulty of the meta-quest provides late-game challenge that's entirely social/strategic rather than mechanical.
### Decision 71: All 7 Engine Clusters in Phase 1

**Context:** Phase 1 was originally scoped as "platformer engine only." Session 4 demonstrated that the generalized JSON loader makes a new paradigm's fixture trivially easy to create (10 minutes for a Mega Man 2-style fixture with different physics). The question: should additional engine clusters be built now or deferred to later phases?

**Decision:** Build all 7 engine clusters in Phase 1, before CAS, agent pipeline, or diagnostic infrastructure are layered on. Clusters 1-4 (Side-View Tile, Top-Down Tile, Stage/Arena, Scrolling Shooter) share 2D tile infrastructure and are built first as variations. Clusters 5-7 (Mode 7/racing, Raycasting FPS, Strategic Map) are genuinely different rendering cores and are built after, specifically to test whether the engine's module architecture supports multiple renderers cleanly.

Phase 1 grows from ~7 sessions to ~16-18 sessions. Total project grows from ~45 to ~55-60 sessions. All subsequent phases shift but internal structure unchanged.

**Rationale:** Three reasons, in order of importance:

1. **Architectural risk reduction.** If Cluster 6 (raycasting) reveals that the renderer module architecture needs restructuring, discovering that before CAS, agents, and diagnostics are built on top is dramatically cheaper than discovering it after. The platformer-only approach deferred this risk to Phase 7 (Genre Transformation), where the cost of architectural changes would be highest.

2. **Demo breadth.** A demo that produces platformers, shmups, Zelda-likes, fighting games, and racing from prompts communicates "new category of product." A demo that only produces platformers communicates "level generator."

3. **Marginal cost is low.** Session 4 proved the generalized architecture works. Clusters 2-4 are parameter variations of Cluster 1. Even Clusters 5-7, while requiring new rendering cores, benefit from shared infrastructure (level loader, input, entity system, Asset Resolver, display scaling). Estimated 1-2 sessions per cluster for the 2D family, 2-3 for the different-renderer family.

See `docs/design/build-plan-v4.md` for the updated session plan.
## Session: 2026-03-08/09 — Phase 1 Session 6 (Asset Pipeline, Resolver, R2 Deployment)

### Decision 72: Single Canonical Asset Catalog (asset-catalog.json)

**Context:** The sprite scraper produces `asset-index.json` (structural: file paths, dimensions, platform). The sheet name enrichment adds TSR metadata. The programmatic analyzer adds color/palette data. The vision tagger adds entity identification and bounding boxes. These could be separate files or layered onto one.

**Decision:** One file rules them all. `asset-catalog.json` is the single source of truth for the entire asset pipeline. All four analysis scripts write to it (structural metadata, sheet names, programmatic tags, vision tags). The Asset Resolver reads this one file. No parallel indexes.

Each entry has `programmatic_tags` and `vision_tags` fields that start null and get populated as the respective pipelines run. The resolver degrades gracefully — Layer 1 needs vision_tags, Layer 2 needs vision_tags, Layer 3 falls back to programmatic_tags and structural metadata.

**Rationale:** Non-spaghetti principle. Multiple parallel index files drift, get out of sync, and create "which file has the real data" confusion downstream. One file, one schema, one place to look. The tradeoff (105MB file) is handled by hosting on R2 rather than in git.

---

### Decision 73: Cloudflare R2 as Permanent Asset Storage

**Context:** `asset-catalog.json` is 105MB (exceeds GitHub's 100MB file limit). Sprite PNGs total ~15-20GB across all platforms. Both need to be accessible at runtime for the game to render real sprites. Decision 64 flagged cloud storage as needed; this session implements it.

**Decision:** Cloudflare R2 bucket `two-fires-assets` is the canonical storage for all asset data:
- `asset-catalog.json` — the master catalog (loaded by resolver at runtime)
- `data/assets/sprites/{platform}/{game}/{category}/{id}.png` — all sprite sheets
- Music files deferred to R2 until needed at runtime (Phase 3)

Public URL: `https://pub-ecf4e311bd274041bb08e03235ca660e.r2.dev/`

The Asset Resolver in `src/asset-resolver.js` fetches the catalog and sprite sheets from R2. Local files are for development and pipeline processing only. Git tracks code and committed indexes but NOT the large catalog or sprite PNGs.

Upload workflow: `wrangler r2 object put two-fires-assets/{key} --file {local-path} --remote`. Bulk upload via `tools/upload-to-r2.cjs`.

**Rationale:** R2 free tier (10GB storage, 10M reads/month) covers current and near-future needs with zero cost. No egress fees (unlike S3). Public bucket URL means no authentication needed — the game fetches assets directly. Separating asset storage from git keeps the repo clean and deployable while making the full sprite library available at runtime.

---

### Decision 74: Vision Tagging Scope — Essential+Nice Categories + Top 500 Stage Maps

**Context:** 55,722 sprite sheets could all be vision-tagged via Claude Haiku, but at ~$0.004/sheet that's ~$223. Budget is $150 in API credits. Need to prioritize.

**Decision:** Tag 26,640 sheets (~$106 estimated):
- **Essential categories** (all games): player, enemy, boss, npc, item, tileset — 13,058 sheets. These are the sprites the game needs to identify by entity name and provide bounding boxes for.
- **Nice-to-have categories** (all games): background, character, portrait — 7,845 sheets. Useful for visual identity knowledge and Track B distributional data.
- **Stage maps** (top 500 games only): 5,737 sheets. Level design structural knowledge for the most referenced games.

Skipped: misc (26,435 sheets — mostly UI fonts, title screen variants, animation frame dumps), stage maps for non-top-500 games, cutscenes, UI elements. These can be tagged later if needed.

**Rationale:** Essential+Nice categories across ALL games gives broad entity identification for Track A matching and Track B distributional knowledge. Stage maps for top 500 games adds level design knowledge for the most-referenced titles. The 35K skipped sheets are predominantly low-value for entity identification ("Title Screen Font Variant 3" doesn't help make better games). Budget stays within the $150 credit balance.

---

### Decision 75: Music Catalog with Functional Role Classification

**Context:** The music library has 103,262 tracks across 7,068 games. Track filenames and M3U playlists contain rich metadata (track names, composers, durations). This data needs to be structured for the Asset Resolver to answer queries like "give me a boss battle theme from an NES action platformer."

**Decision:** `music-catalog.json` enriches the raw `music-index.json` with per-track data extracted from file headers (NSF, SPC, VGM, GBS) and playlists (M3U). Each track gets a `role` classification: title, stage_generic, stage_dungeon, stage_ice, boss_battle, victory_jingle, game_over, ending, shop, battle, etc. Classification is programmatic pattern matching on track names. 51,931 tracks classified; ~26,000 remain "unknown" (mostly numeric names or non-English titles — refinable later).

**Rationale:** The functional role classification is the key enabler for music selection in generated games. Without it, the system can find "a track from Mega Man 2" but not "a boss battle theme from an NES platformer." The programmatic classification covers the majority of English-named tracks at zero API cost. The "unknown" bucket can be refined with Haiku later if needed.

---

## Session: 2026-03-08 — ROM Extraction Pivot (Session 7)

### Decision 76: ROM Extraction Replaces TSR Sprite Sheets as Primary Asset Source

**Context:** Phase 0.5 ingestion pipeline was pulling from The Spriters Resource (TSR). Analysis revealed TSR sheets are community composites: inconsistent organization, missing frames, incorrect palettes, arbitrary bounding boxes. They're reference material, not source data.

**Decision:** ROM extraction (CHR-ROM direct extraction + emulator VRAM capture for CHR-RAM) becomes the primary Track A asset source. TSR data moves to supplemental/fallback status.

**Rationale:** ROM data IS the hardware truth — identical pixels, exact palettes, correct tile organization. Every NES game with CHR-ROM has its complete tileset sitting uncompressed in the ROM file. Emulator VRAM capture for CHR-RAM games gives equivalent hardware accuracy. This approach covers ~550-600 games with zero fidelity compromise.

---

### Decision 77: No-Intro ROM Set as Canonical Reference Library

**Context:** Need a canonical source for the full NES/SNES/Genesis ROM libraries.

**Decision:** No-Intro ROM set (downloaded from archive.org) is the canonical reference. No-Intro is the standard used by ROM hacking communities; its headers are verified and consistent. All pipeline scripts point to ~/nes-roms/, ~/snes-roms/, ~/genesis-roms/.

**Rationale:** No-Intro's verified headers are required for reliable iNES header parsing (mapper detection, CHR bank counts). Using a consistent, well-known source eliminates header corruption issues and aligns with community tooling.

---

### Decision 78: CHR-ROM Bulk Extraction First, CHR-RAM via Universal Extractor

**Context:** ~2,400 of 3,146 NES ROMs have CHR-ROM (tile data uncompressed in file). The remaining ~760 use CHR-RAM (tiles loaded at runtime from PRG-ROM). Different approaches needed.

**Decision:** Build CHR-ROM bulk extractor first (Session 8) — simple header parse + tile decode, covers 2,400 games in one script run. Build Universal Extractor (Mesen2 headless VRAM capture) second (Session 9+) — covers CHR-RAM games and handles mapper-bankswitched games uniformly.

**Rationale:** CHR-ROM extraction is trivial and covers ~75% of the library in one session. CHR-RAM requires an emulator pipeline — higher complexity, but Session 8's CHR-ROM results validate the tile format and give immediate asset coverage.

---

### Decision 79: Castlevania I and DuckTales Reclassified as CHR-RAM

**Context:** rom-extraction-strategy.md initially classified Castlevania I and DuckTales as CHR-ROM. ROM header inspection showed both use Mapper 2 (UNROM) with CHR banks = 0 (CHR-RAM).

**Decision:** Castlevania (USA) and DuckTales (USA) are CHR-RAM games. They belong in the Universal Extractor list, not the CHR-ROM bulk extraction list. rom-extraction-strategy.md annotation updated to reflect this.

**Rationale:** Header truth over assumption. Mapper 2 (UNROM) never has CHR-ROM — it bank-switches PRG-ROM only, with a fixed 8KB CHR-RAM. The original classification was based on an erroneous assumption about which mapper CV1 uses.

---

## Session: 2026-03-09 — Mesen2 + Screen Renderer (Session 9)

### Decision 80: Mesen2 Replaces FCEUX as Emulator Platform

**Context:** FCEUX was the original choice for Universal Extractor. Research found FCEUX's macOS SDL port has a broken --loadlua CLI flag (buffer overflow bug). FCEUX is Windows-centric; macOS support is unofficial and unmaintained.

**Decision:** Mesen2 (~/mesen2/) is the emulator for all Universal Extractor work. Mesen2 has native macOS support, headless mode via --testrunner flag, full Lua scripting with PPU/CPU/OAM memory access, and multi-system support (NES, SNES, GB, GBA, PCE, SMS).

**Rationale:** Mesen2 solves every problem FCEUX had on macOS. --testrunner runs at max speed without GUI. Lua API has complete PPU memory access including nesPaletteRam, nesPpuMemory, nesSpriteRam, nesChrRom/nesChrRam. FCEUX's own maintainers suggest Mesen as an alternative.

---

### Decision 81: Stdout-Based Data Capture Workaround for Mesen2 Lua Sandbox

**Context:** Mesen2's Lua environment strips the io and os libraries — scripts cannot write files. Needed a way to get PPU state out of the emulator.

**Decision:** All extraction data is emitted via print() to stdout, captured by Node.js orchestrator using child_process.spawn(). Data lines are prefixed with DATA_ keys (DATA_PALETTE, DATA_NAMETABLE, DATA_OAM, DATA_CHR, DATA_PNG, DATA_DONE). render-screen.js parses these lines and reconstructs the PPU state.

**Rationale:** print() is available even in the sandboxed Mesen2 Lua. Node.js stdout capture is reliable and handles binary data via hex encoding. No file I/O needed at the Lua level; all file writing happens in Node.js where there are no restrictions.

---

### Decision 82: PPUCTRL-Aware Bank Selection in Screen Renderer

**Context:** NES PPUCTRL register bit 4 selects which CHR bank (0 = $0000, 1 = $1000) background tiles come from. SMB1 uses PPUCTRL=$90 (BG at $1000, sprites at $0000) — opposite of the default assumption. Initial renders had BG and sprites swapped.

**Decision:** render-screen.js reads DATA_PPUCTRL from Mesen's nesPpuDebug memory to determine pattern table banks at render time. BG_PATTERN_TABLE and SPRITE_PATTERN_TABLE are derived from the captured PPUCTRL value, not hardcoded.

**Rationale:** PPUCTRL is a per-game value set by the game's init routine. Hardcoding any assumption guarantees incorrect renders for many games. The Mesen extraction already captures nesPpuDebug[0]; the renderer just needs to decode bits 3 and 4.

---

## Session: 2026-03-09 — CHR-RAM Validation (Session 10)

### Decision 83: CHR-RAM Universal Extraction Confirmed — Full NES Library Coverage Proven

**Context:** Session 9 validated the pipeline for SMB1 (CHR-ROM game). Session 10 tested two CHR-RAM games: Mega Man 2 (UNROM/Mapper 2) and Castlevania I (UNROM/Mapper 2). CHR-RAM games load tiles from compressed PRG-ROM into VRAM at runtime — the only way to capture them is via emulator VRAM access.

**Decision:** The Mesen2 headless extraction pipeline works correctly for CHR-RAM games. Mesen2 populates nesChrRam with the game's runtime VRAM state. 8KB of valid tile data is captured at frame 600 for both MM2 and CV1. Both games render pixel-perfectly using the extracted data. The Universal Extractor approach works for the entire NES library.

**Rationale:** CHR-ROM was the easy case (tiles in file). CHR-RAM was the hard case (tiles only in VRAM at runtime). Both now validated. The pipeline scales to all ~760 CHR-RAM NES games without game-specific modifications — Mesen2 handles the decompression transparently as part of normal emulation.

---

### Decision 84: Nametable Coverage Heuristic for PPUCTRL Bank Detection

**Context:** Mesen2's nesPpuDebug[0] returns 0 for CHR-RAM games (MM2, CV1), even though those games set non-zero PPUCTRL values at runtime. The register read is unreliable. For CHR-ROM games (SMB1), it correctly returned $90. An accurate PPUCTRL is required for correct BG/sprite bank selection.

**Decision:** When nesPpuDebug[0] returns 0, the renderer applies a nametable coverage heuristic: for each non-zero tile index used in the nametable, count how many tiles in bank0 ($0000) vs bank1 ($1000) have non-zero pixel data. The bank with more matches is the BG bank. This correctly identifies BG at $1000 for both MM2 (bank1=176 vs bank0=173 of 176 tiles) and CV1 (bank1=83 vs bank0=59 of 85 tiles).

**Rationale:** The nametable tells us which tile indices the game is actually using for backgrounds. If those tile indices have data in bank1 but not bank0, the BG pattern table is in bank1. This heuristic is robust because: (a) the set of used tiles is game-specific and directly reflects CHR organization, (b) it handles both the "blank tile 0" (MM2) and "both banks have blank tile 0" (CV1) cases correctly, (c) it requires no game-specific knowledge. The correct long-term fix is to find the reliable PPUCTRL address in Mesen's debug memory map, but the heuristic is sufficient for batch extraction.

---

## Session: 2026-03-09 — Phase 1 Session 10 (Universal Extraction Architecture)

### Decision 85: RAM Mutation Content Enumerator Replaces Chaos Player

**Context:** Decision 77 specified a multi-strategy chaos player for automated game exploration — a Lua script that plays the game using heuristic exploration, recording inputs for deterministic replay. Sessions 9-10 revealed this approach is fragile: each game requires different frame timings, button press sequences, and boot navigation. Two games (MM2, Castlevania) each needed debugging to render correctly. Scaling to 1,600+ games with per-game tuning is infeasible.

**Decision:** Replace the chaos player with a RAM mutation content enumerator. Instead of playing the game, the system:
1. Boots to first gameplay state (press Start at intervals, detect gameplay via OAM/nametable density)
2. Identifies candidate RAM addresses (volatile bytes that change occasionally, not every frame)
3. Systematically writes every value (0-255) to each candidate address, observing VRAM changes and mapper bank switches
4. Addresses that cause VRAM to change significantly or trigger mapper bank switches are content-switching variables (level ID, room ID, game phase)
5. All values of content variables are enumerated with full state capture at each

Estimated time: ~3 minutes per game. Zero per-game configuration. 100% generalizable.

**Rationale:** NES/SNES games store current level/room as RAM variables. The hardware mandates that changing these variables causes the engine to load different tile data into VRAM. The mutation sweep exploits this hardware-level guarantee — it finds content-switching variables without knowing their addresses. This is a property of the architecture, not a convention games might violate. The approach captures content that even a thorough chaos player would miss (secret levels, late-game content accessible only via specific progression).

### Decision 86: Unified Engine with Configurable Rendering Modes Replaces 7 Separate Clusters

**Context:** Build plan v4 (Decision 71) called for 7 separate engine clusters across 16-18 sessions. The manifest-based extraction approach changes the engine's job from "generate and render paradigm content" to "load manifest data and render it." Analysis revealed that rendering differences between paradigms reduce to camera behavior, physics direction, collision response, input mapping, and draw technique — configurable parameters, not fundamentally different code.

**Decision:** Build one engine with shared core (~80% of code: tile/sprite rendering, entity system, collision, input abstraction, CAS integration, game state management) and 7 swappable rendering modes (~20%): tile_2d_sideview, tile_2d_topdown, stage_arena, scrolling_shooter, pseudo_3d, raycast_3d, strategic_map. Rendering modes are hot-swappable at runtime for CAS-driven paradigm shifts.

**Rationale:** Reduces Phase 1 from ~16-18 sessions to ~8 sessions. Makes paradigm shifts (Thread 8 principles) a rendering mode swap rather than a whole-engine restart. The shared entity system, collision, and CAS integration mean that entity state, social graphs, and narrative carry over during shifts by default — no special crosswalk code needed for the 80% that's shared.

### Decision 87: Manifest as Ingredient Library, Game State Schema Unchanged

**Context:** Extraction manifests contain complete game data (visual, structural, mechanical). The manifest format could potentially replace the existing game state schema, simplifying the architecture.

**Decision:** Manifests are an ingredient library that populates the game state schema. They do not replace it. Manifest data populates: `episode` (content: tiles, layouts, physics, entity placements), `meta` (game identity, paradigm type), and `world.entities[].behavioral_parameters` (from extracted enemy behaviors). The `world.factions`, `cas`, `player`, `overseer`, and `diagnostics` blocks remain Claude-generated/runtime-managed and are NOT sourced from manifests.

**Rationale:** The game state schema was designed to hold both extracted and generated content. The CAS social ecology, faction dynamics, entity personalities (OCEAN), knowledge systems, reputation, and Overseer — the core of what makes Two Fires special — are creative/runtime constructs that emerge from Claude's interpretation layer and CAS evolution, not from ROM data. Keeping the manifest as an ingredient library preserves full creative flexibility: a game can use 100% manifest data (exact reproduction), 0% (fully generated), or any blend. The schema doesn't need to change because it was already designed as a paradigm-independent container.

### Decision 88: Extraction Scope Expanded to ~1,605 Games

**Context:** Decision 79 scoped extraction at ~820 games, limited by the assumed per-game engineering effort of the chaos player approach. The RAM mutation approach reduces per-game cost to ~3 minutes compute + ~$0.03 API.

**Decision:** Extract all US-licensed NES titles (~680), all US-licensed SNES titles (~725), top 100 Genesis titles, 50 hand-picked arcade titles (deduplicated against console versions), and 50 PC titles (FPS/RTS/sim canon). Total ~1,605 games.

**Rationale:** Completeness is a product feature — never saying "sorry, we don't have that game." Marginal cost is negligible (~$30 additional API, ~5 hours additional compute). Larger library provides richer distributional knowledge for Track B generation. Every additional extracted game is a potential composition ingredient for the creative layer.


---

## Session: 2026-03-10 (Session 11b) — Phase 1 Boot Detection Rewrite

### Decision 89: Bidirectional Control Test as Primary Phase 1 Detection

**Context:** Session 11a built Phase 1 with passive sprite-count heuristics: detecting no-sprite windows (title screen), nametable density checks, and fallback timers. In testing, these heuristics failed to reliably distinguish gameplay from SMB1's attract demo (which has the same OAM and nametable density as gameplay). BASELINE was being captured during the demo, causing Phase 3 to find no real content variables.

**Decision:** Replace all passive heuristics with an active bidirectional control test as the sole gameplay detection mechanism. Each ~75-frame cycle: (1) press Start or A alternately for 10 frames, (2) wait 40 frames, (3) snapshot all 64 OAM sprite X positions, (4) hold Right 10 frames, snapshot, (5) hold Left 10 frames, snapshot, (6) check each slot for dxRight > 0 AND dxLeft < 0. Any slot passing both = player sprite, gameplay confirmed, BASELINE saved. Timeout at 1800 frames if no slot confirms.

**Rationale:** Attract demos use pre-recorded input. The demo moves Mario right on a scripted path — pressing Right shows movement (false positive on right-only test). But the demo ignores our Left input entirely, so pressing Left shows the sprite continuing its scripted rightward path. The bidirectional test exploits this: only real gameplay responds to BOTH directions independently. Alternating Start and A handles games that require different buttons to advance menus.

**Results:** Confirmed on SMB1 (cycle 10, frame 710), Mega Man 2 (cycle 9, frame 639), Contra (cycle 4, frame 284). Legend of Zelda times out at 1800 frames due to name-entry screen (game-specific issue, not bidirectional test failure).

### Decision 90: Phase 3 Needs Constant-Address Second Pass

**Context:** Phase 2 identifies "volatile candidates" — RAM addresses that change during gameplay. Level ID / area pointer variables in SMB1 are CONSTANT during active play (you're in World 1-1, that value doesn't change). Phase 2 correctly classifies them as constant and excludes them from Phase 3's mutation sweep. Result: the content variables most important for capturing different levels (0x075C, 0x075F in SMB1) are never found.

**Decision:** Phase 3 needs a second pass that sweeps ALL 2048 RAM addresses (not just Phase 2 candidates), with P3_SAMPLE_STEP=32 (8 sampled values per address). Expected additional cost: ~2048 × 8 × 5 frames ≈ 82,000 frames per game (~1.4 minutes at 1000x). This pass will catch level/room variables that are constant during gameplay but produce distinct VRAM states when mutated from BASELINE.

**Rationale:** The Phase 2 filter was designed to skip addresses that are either constant (no signal) or monotonically ticking (frame counters). Level variables ARE constant during play — they're the stable state variables that define "which level you're in." The mutation sweep's whole purpose is to discover these by testing what happens when you CHANGE them from their stable value. The Phase 2 filter is counterproductive for this use case.

### Decision 91: Phase 5 BASELINE Quality and OAM Slot Tracking

**Context:** Phase 5 physics tests (all 6: WALK_RIGHT, FRICTION, JUMP_TAP, JUMP_HOLD, RUNNING_JUMP, DUCK) produce identical trajectories for SMB1. Root causes: (1) BASELINE was captured while Mario was mid-jump (Phase 1 cycle 10 pressed A = jump button, 40-frame wait may catch Mario entering a pipe rather than standing). (2) OAM slot multiplexing — SMB1 uses slot 52 for multiple sprites on a 3-frame cycle; the slot that confirmed bidirectional control doesn't reliably track Mario across multiple frames. Pipe-entry animations ignore all player input, producing identical trajectories regardless of what we press.

**Decision:** Two fixes required for Phase 5 physics reliability: (1) BASELINE quality gate — before saving BASELINE, verify the player sprite is on the ground (OAM Y stable in ground range for N frames). Discard and retry if Mario is mid-air or mid-animation. (2) OAM multi-slot probe — scan ALL 64 OAM slots every frame and identify the slot with consistent directional response, rather than locking in one slot from Phase 1's single bidirectional test.

**Rationale:** These are correctness requirements. The physics data (walk speed, jump arc, friction) is the mechanical ground truth for the entire extraction pipeline. Noisy data here propagates to all downstream uses. Better to retry BASELINE capture than to lock in a bad state.
## Session: 2026-03-10 — LLM Runtime Strategy & Social Ecology Deepening (Design Thread)

### Decision 87: Open-Weight LLM API as Runtime Backbone (DeepSeek V3.2 / Grok 4.1 Fast)

**Context:** The biggest cost barrier to public release is that every runtime LLM call (generation, CAS interpretation, dialog, entity conversations) goes through Claude's API at $3/$15 per million tokens. At scale, this makes the product economically unviable — a single intense game session could cost $10-15 in API fees.

**Decision:** Ship with an open-weight frontier LLM (current frontrunner: DeepSeek V3.2) accessed via third-party inference provider (current frontrunner: Fireworks for dialog, DeepInfra for background calls). Develop with Claude (best quality, calibrates diagnostic pipeline). Benchmark DeepSeek/Grok/alternatives against diagnostic pipeline before switching. Architecture is already model-agnostic — switching is a deployment decision, not a redesign.

DeepSeek V3.2 specifics: $0.28/$0.42 per million tokens (cache miss), $0.028 cache hit (90% discount). MIT license (self-host escape hatch). 1421 Chatbot Arena rating (frontier conversational quality). OpenAI-compatible API format. 128K context window.

**Cost estimate:** ~$0.15-0.30 per intense game session (50 conversations, 6 episodes, full CAS interpretation). ~$3,600-15,000 for 100K heavy sessions depending on intensity. Compare to ~$300K+ at Claude API rates.

**Rationale:** The value is in the constraint surface (sequencing grammar, CAS architecture, OCEAN profiles, bounded knowledge), not the model. The model is a commodity. The architecture was always model-agnostic — GameState schema, CAS interpretation input/output contracts, dialog system all define structured interfaces that don't care which model sits behind the endpoint. DeepSeek V3.2 specifically chosen for: frontier conversational quality (critical for entity dialog), MIT license (no vendor lock-in), automatic context caching (system prompts and entity schemas cache at 90% discount), and price point that makes previously cost-prohibitive features viable.

**Fallback chain:** DeepSeek API → Grok 4.1 Fast API → self-hosted DeepSeek (MIT weights on own GPU if needed at massive scale). Multiple providers serve same model (Fireworks, DeepInfra, Novita, etc.) — no single point of failure.

---

### Decision 88: Provider Routing by Call Type for Latency Optimization

**Context:** DeepSeek V3.2 latency varies dramatically by provider. DeepSeek's own API: ~7s time-to-first-token. DeepInfra: ~1.05s TTFT but only 11.1 tokens/sec output. Fireworks: slightly higher TTFT but 129.4 tokens/sec output. Different call types have different latency profiles.

**Decision:** Route different call types to different providers serving the same model:
- **Dialog (player-facing):** Fireworks — fast output speed matters because player watches text appear
- **CAS interpretation (background):** DeepInfra — low TTFT matters, output speed less critical (structured JSON processed as batch, not streamed to player)
- **Generation pipeline (pre-game):** Either — not latency-sensitive, cost-optimize

This is a deployment-time optimization, not an architecture change. All providers serve DeepSeek V3.2 with identical quality. Single-provider deployment works fine initially.

**Rationale:** Dialog latency is the most player-visible quality signal. At 129 tokens/sec through Fireworks, a typical entity response (~50-80 tokens) renders in under a second once generation starts — feels instant. CAS interpretation happens during between-episode windows or background processing — 1s TTFT is fine, output speed doesn't matter. Pricing across providers is nearly identical ($0.29-0.31 blended), so routing is free optimization.

---

### Decision 89: Physical Proximity as Third Information Propagation Channel

**Context:** Current CAS spec has two propagation mechanisms: affect contagion through bonds (continuous, no attribution) and information propagation through bonds (discrete, attribution travels). Both require bonds. An entity with no bond to someone standing next to them is informationally isolated even in a crowded room. This is unrealistic — you can overhear conversations, observe events, and absorb ambient social information through physical co-location.

**Decision:** Add proximity-based information propagation as a third CAS channel. Entities within awareness_radius of an active conversation or significant event receive degraded knowledge packets. Gated by: physical distance (closer = higher fidelity), eavesdropper's arousal level (alert entities catch more), emotional charge of the exchange (loud arguments propagate further than whispers), and openness (high-O entities attend more to ambient information).

Proximity packets have lower accuracy and lower charge than bond-propagated packets. They represent overheard fragments and impressions, not deliberate communication. They enter the same knowledge system and compete for relevance like everything else.

**Rationale:** This closes a gap where the CAS models social network distance but not physical distance. Both dimensions are important for realistic information dynamics. The player having a conversation with an ally while an enemy stands nearby should risk information leakage — that's a real social dynamic that creates strategic depth. Implementation is lightweight: same propagation math with a spatial distance check instead of bond strength check.

---

### Decision 90: Entity Backstory as Generation-Time Investment

**Context:** Named entities are generated with OCEAN profiles, faction allegiance, bonds, and initial knowledge distribution. But they lack biographical context — the accumulated life experience that makes a person feel like a person rather than a stat block. When the LLM voices an entity in conversation, richer backstory context produces dramatically better dialog.

**Decision:** At game creation, the Game Compiler generates a short backstory paragraph (~50-80 words) for each named entity. Contains: key life events, relationships, core beliefs, and personality-shaping experiences. Stored as permanent context attached to the entity. Sent as part of the system prompt for all dialog calls and interpretation calls involving that entity.

Population entities receive backstory only upon promotion to named (first player interaction). Their backstory is generated at promotion time, informed by their zone's narrative context and faction role.

**Rationale:** A 50-80 word backstory costs a fraction of a cent to generate and dramatically enriches every subsequent interaction. The LLM doesn't have to infer personality from OCEAN numbers alone — it has narrative material that grounds the entity as a character. "Elderly widow, lost her husband in the faction conflict twelve years ago, distrusts outsiders but is warm to neighbors she's known for decades" produces fundamentally different dialog than "OCEAN: O=0.3, C=0.6, E=0.4, A=0.7, N=0.6."

---

### Decision 91: Narrative Feedback Loop — Claude Writes to CAS Primitives

**Context:** The two-layer architecture (deterministic CAS + Claude interpretation) was designed with a clean separation: CAS produces state, Claude interprets state. But Claude's narrative decisions need to feed back into CAS structure. If Claude narrates "a rebel cell formed," that needs to change bond strengths, propagation rates, and cluster dynamics — not just exist as flavor text.

**Decision:** Claude's interpretation output includes explicit CAS directives alongside narrative content. When Claude interprets at any scale (episode boundary, zone pulse, etc.), it produces both narrative description AND specific writes to existing CAS primitives: bond strength/valence adjustments, entity status changes, resource level changes, propagation rate modifications, entity location changes, new knowledge packets with content.

**Critical constraint:** Claude can write to any existing CAS primitive but cannot create new primitive types. This keeps Layer 1 clean and deterministic. The CAS doesn't know it's a cult — it just sees tighter bonds, more insular information flow, and a high-influence node. Claude knows it's a cult and adjusts the CAS structure accordingly.

**Rationale:** Without this feedback loop, the narrative layer is observational only — it describes what the CAS produced but can't drive further CAS evolution. With it, the narrative and CAS form a generative cycle: CAS dynamics → Claude narrates + adjusts CAS → adjusted CAS produces new dynamics → Claude narrates next development. This is how the cult tightens over time, how the rebellion gains momentum, how the general's loyalty erodes. The narrative isn't just interpreting — it's authoring CAS-level consequences of its narrative decisions.

---

### Decision 92: Drama-Ensuring Narrative Prompt

**Context:** A pure CAS can settle into equilibrium — affect drifts toward baselines, bonds stabilize, information stops being novel. The game needs continuous social drama to remain compelling.

**Decision:** Claude's interpretation system prompt includes a drama-ensuring directive: actively push for interesting dynamics — alliances should be tested, power should be contested, secrets should have consequences, quiet periods should build toward disruption. Not scripting — Claude has full creative latitude. But constrained by CAS state — Claude cannot narrate events that contradict the structural reality. If bonds show unity, Claude can't narrate fragmentation. But Claude can narrate *seeds* of future disruption (a whispered conversation, a suspicious glance, an opportunistic move) that then produce CAS directives (slight bond weakening, new information packet) which the CAS amplifies through its own dynamics.

**Rationale:** This is the "game director" function — ensuring the social ecology produces compelling gameplay, not just realistic simulation. Real social ecologies can be boring (decades of stability). Game social ecologies need consistent dramatic texture. The constraint is that all drama must emerge from CAS-plausible dynamics — Claude is steering, not scripting.

---

### Decision 93: Conceptual Knowledge Lives in the LLM, Not in a Simplified Representation

**Context:** Extended design exploration of how to model entity "minds" — conceptual knowledge, beliefs, causal models, internal world representations. Explored multiple approaches: knowledge packets with mutable content, world model summaries, concern hierarchies, impulse vectors, mind paragraphs rewritten each tick, bottom-up autonomous agents.

**Decision:** Conceptual knowledge cannot be reduced to a CAS primitive simpler than itself. Unlike affect (reducible to valence + arousal) or social structure (reducible to bonds + propagation), conceptual knowledge is irreducibly rich — it IS natural language meaning. The LLM operating on the entity's accumulated context IS the Barrett mind, implemented literally. No simplified cognitive architecture is layered on top.

The LLM is invoked when the entity needs to "think": processing new input, making decisions, speaking in conversation, reacting to significant events. Between invocations, the CAS carries forward structural consequences (affect, bonds, information flow) and the entity's behavioral parameters reflect the residue of their last "thinking" moment. Frequency of invocation is a tuning parameter — more frequent = more alive-feeling but more expensive.

**Rationale:** Barrett's constructionist framework says meaning is constructed from affect + conceptual knowledge + current input. Conceptual knowledge in humans encompasses everything a person knows, believes, and can reason about — "for every noun, verb, and adjective, we have a corresponding concept" (Joe). This cannot be compressed to scalars or structured data without losing the generative richness that makes entity behavior feel human. The LLM IS the only technology that can represent this. Attempting to build a simplified cognitive architecture is either essentialist (violating Barrett) or so complex it recreates an LLM poorly.

---

### Decision 94: Top-Down Narrative Authoring Constrained by Bottom-Up CAS Dynamics

**Context:** Extended exploration of whether the social ecology should be purely bottom-up (emergent from individual agent cognition) or incorporate top-down narrative authoring. Bottom-up is theoretically purer (true CAS) but computationally intractable — generating autonomous agent behavior requires LLM invocation per entity per tick. Top-down is tractable but risks feeling scripted.

**Decision:** Hybrid architecture. The CAS (Layer 1) runs bottom-up: deterministic dynamics producing emergent structural patterns (cluster formation, faction fragmentation, bond networks). Claude (Layer 2) reads those patterns top-down at multiple scales and authors the narrative — deciding what specific events, decisions, and actions occurred, then writing consequences back into the CAS.

The six interpretation scales: (1) ecology-wide macro narrative, (2) faction-scale dynamics, (3) inter-cluster relationships, (4) cluster-scale events, (5) interpersonal dynamics, (6) individual broad strokes.

Claude works top-down for coherence (higher scales constrain lower scales) but is constrained by bottom-up CAS dynamics (can't contradict structural reality). The "keyhole principle" — the player experiences the world through local interaction and cannot distinguish bottom-up emergence from CAS-constrained top-down narration.

**Rationale:** Pure bottom-up social CAS requires every entity to have autonomous cognition (LLM per entity per tick) — computationally intractable at current technology. But pure top-down narration ignores the CAS entirely. The hybrid preserves CAS dynamics as the structural ground truth while using Claude's narrative intelligence to produce the specific content (events, dialog, decisions) that makes the world feel alive. The CAS prevents Claude from scripting — all narrative must be consistent with structural reality. Claude prevents the CAS from being merely numerical — structural changes get narrated into specific, compelling social content.

---

### Decision 95: Increased Interpretation Frequency from Cost Reduction

**Context:** At Claude API rates, interpretation calls were necessarily infrequent (episode boundaries only) due to cost. At DeepSeek rates (~30x cheaper), more frequent interpretation becomes economically viable.

**Decision:** In addition to episode-boundary interpretation (already spec'd), add zone-level narrative pulses at higher frequency (every N social timer ticks, where N is a tuning parameter). Zone pulses produce: zone mood/atmosphere updates, 2-3 most significant social dynamics in play, new content items (gossip, events, visible social behavior) that enter the CAS as knowledge packets, and CAS directives adjusting bonds/affect/propagation for that zone.

Also viable at these costs: entity-initiated contact (entities seek out the player when CAS state + narrative warrant it), richer conversational memory (relationship trajectory summaries in dialog context), and ambient behavioral cues (batched per zone — "given these 8 entities in this configuration, what behavioral cues does each display?").

**Rationale:** The cost headroom from Decision 87 should go toward *frequency* and *breadth* of interpretation calls (more zones interpreted, more ambient cues, richer dialog context), NOT toward making each individual call longer. Keep prompts tight and outputs SNES-paced. The breathing room increases the *resolution* of the social ecology, not the wordcount.

---

### Decision 96: Entity-Initiated Contact as CAS-Driven Mechanic

**Context:** Current spec has player-initiated contact only (player hails entity, spends exchange from daily budget). But in a living social ecology, entities should sometimes seek out the player — an ally with urgent news, an enemy confronting the player, a nervous informant finding the player in a quiet corner.

**Decision:** Entities can initiate contact with the player when narrative conditions warrant. Gated by: bond strength with player (need meaningful relationship), arousal level (need urgency), and narrative context from Claude's interpretation (Claude decides who has reason to seek the player). Entity-initiated contact costs from the same daily exchange budget as player-initiated, creating strategic tension (save exchanges for seeking information vs. receiving unsolicited contact).

Redundancy prevention: after any entity-initiated contact, suppress further initiation from entities in the same social cluster for N social timer ticks. This falls naturally from CAS dynamics — once one entity in a cluster has communicated with the player, the information "player has been contacted" propagates through the cluster, reducing urgency for others.

**Rationale:** Transforms the social ecology from "player extracts information" to "the world has opinions about the player and acts on them." Dramatically increases the feeling of a living world. Cost at DeepSeek rates: one additional dialog call, ~$0.001. The exchange budget mechanic prevents entity-initiated contact from becoming overwhelming.

---

## Session: 2026-03-11 — Phase 5 Physics Sampling (Session 12)

### Decision 97: Phase 5 Sanity Check — Use Absolute Delta, Not Directional

**Context:** Phase 5 sanity check presses Right for 10 frames and verifies `dx > 0` before running physics tests. Contra Stage 1 is a forced horizontal auto-scroller: the RAM X address (0x0100) is screen-relative, and during auto-scroll the player's screen X can *decrease* even while pressing Right. This caused a false INPUT_BROKEN on Contra — input IS reaching the game, the check is wrong.

**Decision:** Change the sanity check to `math.abs(dx) <= 2` (fail if |dx| ≤ 2, pass if |dx| > 2). Movement in either direction confirms `emu.setInput` is reaching the game. The check's purpose is to detect frozen/non-interactive states, not to verify rightward movement specifically.

**Rationale:** Auto-scrolling games (Contra, many shmups) have player X that moves opposite to the scroll direction. Bidirectional movement confirmation is the correct invariant. The threshold of 2 pixels provides noise margin for stationary states (timers, counters) while catching any genuine movement.

---

### Decision 98: p1BaselineState Is The Only Reliable Physics Test Starting Point

**Context:** Session 11 tried multiple starting states for Phase 5: `BASELINE` (post-settle, Mario in castle-walk), `PHYSICS_BASE` (captured in Phase 4 when game loads a level — fooled by level-complete animations), and `p1BaselineState` (pre-directional-test snapshot from Phase 1). Only `p1BaselineState` consistently places the player in an interactive state.

**Decision:** Phase 5 always uses `p1BaselineState` as LEVEL_STATE. PHYSICS_BASE is retired as a concept for physics testing. BASELINE (the Phase 1 post-settle state) is retained for Phases 2-4 content mutation but not for Phase 5.

**Rationale:** `p1BaselineState` is the snapshot taken *before* the bidirectional control test. Phase 1's bidirectional test confirmed that the game responds to input from this state — it is the only state with a hard guarantee that the player is in a responsive, interactive position. PHYSICS_BASE and BASELINE have no such guarantee and have both been demonstrated to land in non-interactive animations.

---

### Decision 99: Y Stability Check Required at Physics Test Start

**Context:** SMB1 World 1-1 is short. Phase 1 takes 10 cycles (710 frames) to confirm bidirectional control, naturally advancing Mario to near the level end (~x=165). `p1BaselineState` captures Mario mid-air near a wall. All 6 physics tests start with Mario already airborne — input has no effect while in the air, so all tests produce identical data.

**Decision:** Add a Y stability check alongside the existing X stability check in `wait_load_xstable`. Read Y at start of the 30-frame stability window and again at end. If |dY| > 2, player is airborne — reload LEVEL_STATE and try again (max 3 retries with exponential backoff: 30, 60, 120 frames). If still airborne after 3 retries, log `STATUS_PHASE5:AIRBORNE_SKIP` and skip the test (record reason in DATA_PHYSICS).

**Rationale:** Airborne test data is useless for walk/duck/friction measurements (only JUMP tests would be valid, and even those are confounded by initial conditions). The retry loop handles the common case where Mario is in mid-air from a jump or fall — waiting for landing is sufficient. If after 3 retries the player is still airborne, it's likely a game state issue (Mario in pipe transition, etc.) that won't resolve by waiting.

---

## Session: 2026-03-11 — jsnes Emulator Adoption (Session 13)

### Decision 100: Replace Mesen2 with jsnes for Extraction Pipeline

**Context:** Phase 5 physics extraction requires reliable controller input: hold Right for 30 frames to measure walk speed, hold A for 30 frames to measure jump arc. Mesen2's `--testrunner` headless mode processes frames but silently discards `emu.setInput()` calls during gameplay — input events are enqueued in the Lua sandbox but never reach the emulated controller. Confirmed across SMB, MM2, and Contra over multiple sessions. The workarounds attempted (different callback timings, explicit input patterns, baseline state selection) partially improved results but did not resolve the underlying issue. Three sessions were spent working around a broken API.

**Decision:** Replace Mesen2 and the Lua extraction script with jsnes (npm package, v2.0.0) running in Node.js. The full extraction pipeline (Phases 1–5) will be rewritten as a Node.js script (~400 lines). Key jsnes API surface: `nes.cpu.mem[addr]` for RAM read/write, `nes.buttonDown(1, btn)` / `nes.buttonUp()` for input, `nes.frame()` for synchronous single-frame step, `nes.ppu.vramMem` for PPU state, `nes.ppu.spriteMem` for OAM, `nes.toJSON()` / `nes.fromJSON()` for save/restore. All validated against SMB in `tools/jsnes-validate.js`: Right input confirmed (X +17 over 30 frames), A input confirmed (Y peak delta 66 pixels), save/restore confirmed.

**Rationale:** jsnes runs entirely in-process. No subprocess, no Lua sandbox, no stdout pipe, no broken input API. Controller state is set by directly mutating `nes.controllers[1].state` (or via the provided `buttonDown`/`buttonUp` API) and is read on the very next call to `nes.frame()` — no callback timing involved. The extraction algorithms (RAM mutation sweep, content variable identification, OAM slot detection, physics sampling) are entirely substrate-agnostic: they only require read RAM, write RAM, step frame, and set input. All of these work in jsnes. The Lua script is retired; `orchestrator.js` becomes a thin wrapper or is absorbed into the new extractor directly. Mesen2 may still be used for visual verification (render-screen.js) but is no longer part of the extraction hot path.
