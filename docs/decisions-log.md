# Two Fires — Decisions Log

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

**⚠️ SUPERSEDED by Decision 17 (Thread 3 CAS Redesign).** Faction state primitives replaced: morale, loyalty, awareness_of_player, disposition_to_player, internal_dissent all dropped. Replaced by aggregates computed from entity affect primitives. Only cohesion (recomputed as inverted std dev of member valence), bond_density, member_count, and resources survive.

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

**⚠️ REFINED by Decision 23 (Thread 3 CAS Redesign).** Disposition to player is no longer a stored field on entities or factions. It is constructed by Claude from the entity's affect state, bond to player (if any), knowledge about the player, and personality. Attribution-gated: entities only form dispositions based on information that has actually reached them.

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

### Decision 9: Overseer Activation by Model Confidence, Not Game Count

**Context:** When does the Overseer (the Giant) begin actively engaging with the player? Fixed game count vs. behavioral assessment.

**Decision:** Overseer escalation keyed to `model_confidence`, which is a function of `total_meaningful_decisions` across all games. One deeply social 50-hour game > five speedruns.

**Rationale:** The Overseer's interventions need to be calibrated to what it knows about the player. Acting on insufficient data produces poor interventions that feel arbitrary rather than targeted. The player who is mechanically skilled but socially uninvolved (speedrunner) encounters the Overseer much later than the player who builds deep alliances and explores social dynamics across fewer games. This rewards social engagement organically.

---

### Decision 10: Player as Catalyst — CAS Sensitivity Tuning

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

**⚠️ SUPERSEDED by Decision 17 (Thread 3 CAS Redesign).** There are no longer exact CAS state values that trigger specific behaviors. Behavioral legibility tables are eliminated entirely. Claude constructs situated behavioral expressions from affect primitives + context. Thread 2's behavior descriptions remain useful as examples of what Claude might produce, but they are not lookup targets.

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

### Open Design Work (Updated)

1. **Paradigm grammar buildout** — extend each paradigm spec with full-game structural grammar, vocabulary inventory, boss/punctuation rules, progression shape. Leverage ingestion pipeline data. Needed before Phase 2.
2. Behavioral implementation — how Claude's narrative directives become rendered game content
3. Game state schema update — apply Thread 3 diffs to actual schema document
4. Visual Manifestation Engine specification
5. CAS rate constant calibration (diagnostic framework, testing phase)
6. MVP definition — minimum compelling first level
7. Two-primitive sufficiency validation
8. Overseer model confidence thresholds for escalation levels
9. Social hook pattern library (compact, paradigm-specific, placed by Game Compiler at episode 1-2 boundary)
