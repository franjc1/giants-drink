
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
