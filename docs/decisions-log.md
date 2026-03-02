# Two Fires — Decisions Log

---

## Session: 2026-03-01 — Design Philosophy + Dramaturgical Architecture + Visual Manifestation

### Decision 1: Foundational Design Philosophy — Constraint Surface Model

**Context:** Extended conversation working through how the Dramaturgical Agent, CAS engine, and other systems relate. Initial proposals over-prescribed narrative structure (act blueprints, level chains). Correction swung to CAS-only. Final resolution found the right balance through Barrett's constructionist framework.

**Decision:** Two Fires produces emergent game experiences from the mutual constraint of primitives. No single system dominates. Each constrains the others. Quality is guaranteed by the shape of the constraint space, not by prescription of outcomes.

**The model:**
- The system defines a high-dimensional constraint surface. Every point within that surface is a compelling experience. The space outside it is vastly larger — most possible configurations produce bad games.
- Agents define constraints, not content. Their job is to shape the solution space so that CAS + player interaction + paradigm mechanics reliably land inside it.
- The specific experience is unpredictable and unique to each playthrough. The *quality* of the experience is guaranteed by constraint design.
- Analogous to Barrett's constructionist model: experience emerges from primitives in context. No ingredient alone produces the experience. The right ingredients mutually constraining each other reliably produce rich experience even though the specific experience is unpredictable.

**The indeterminate equation analogy (Joe's):** Like x + y = 4 but with hundreds of variables and complex operations between them. The "4" is a high-quality game experience. Infinite ways to get there, infinitely more ways NOT to get there. The route is unscripted, but the destination is guaranteed if ingredients and constraints are correctly designed.

**Key principles:**
- CAS is a primitive/ingredient, not the whole system. Enormously influential, but constrained by and constraining other primitives.
- We do not need to enumerate all primitives at the top level now. What matters is the principle: primitives exist, they combine contextually through mutual constraint, and quality comes from the constraint surface. Specific primitives get identified and refined during building and testing.
- Granular constraint relationships between primitives are the real craft work ahead. The philosophy tells you what kind of answer to look for. The architecture tells you where the answer gets implemented. The actual answers come from building, testing, and iterating.
- Agents should be evaluated by the quality of their constraint surfaces, not their specific outputs.
- Debugging is constraint diagnosis: which surface is miscalibrated?
- Over-constraining = scripted (bad). Under-constraining = incoherent (bad). The art is in constraint design.

---

### Decision 2: CAS Role — Primitive, Not God

**Context:** Joe flagged that agent proposals were violating CAS-as-driver principles. Discussion revealed the real principle: CAS is a *primitive* (cf. conceptual knowledge in Barrett), not the sole driver.

**Decision:** The CAS is the source of dramatic *material* — faction dynamics, loyalty cascades, information propagation, emergent social structures. It is not the sole source of dramatic *quality*. Quality emerges from CAS being mutually constrained by paradigm mechanics, narrative premises, drama density thresholds, and other primitives.

The CAS:
- Runs according to its own rules (never overridden for narrative purposes)
- Is constrained by its own state history, the prompt/narrative setup, and the paradigm's mechanical reality
- Produces raw material that other systems make *perceptible* and *well-paced* without changing what the CAS actually does

But this is NOT a pure natural simulator. Left alone, the CAS might stagnate or produce drama at the wrong rate. The system needs designed ingredients — social hooks, drama density thresholds, catalytic perturbations, fertile initial conditions — to guarantee the CAS output is reliably compelling. These don't script outcomes; they ensure dramatic potential.

---

### Decision 3: Dramaturgical Agent — Ingredient Designer + Runtime Monitor

**Decision:** The Dramaturgical Agent designs ingredients that reliably produce dramatic quality. It does not design the drama itself.

**Pre-game (setup mode):**
- Fertile initial conditions for CAS (faction states near thresholds, social graphs with fault lines, personality distributions creating tension, power asymmetries)
- Prompt → CAS parameter translation (narrative character descriptions → CAS personality offsets)
- Social hooks (guaranteed early encounters forcing social engagement — encounter guaranteed, outcome emergent)
- External pressure ramp (mechanical rule: antagonist attention scales with player progress)
- Drama density threshold (minimum perceptible event rate, calibrated to paradigm)
- Catalytic perturbations (generic disruptions as anti-stagnation insurance — perturbation designed, consequences CAS-emergent)

**Runtime (per-episode pacing mode):**
- Monitors drama density, triggers catalysts when below threshold
- May stagger visibility of simultaneous CAS events across episodes for pacing (changing when player perceives, not what happened)

**Does NOT:** design acts/arcs, prescribe what drama occurs, plan level-to-level sequences, predict CAS outcomes.

---

### Decision 4: Conductor Agent — Eliminated

**Context:** Proposed to handle level-to-level drama. Violated CAS-as-primitive principle by pre-planning narrative sequences.

**Decision:** Eliminated. Its functions handled by:
- Level-to-level coherence: emergent from content agents reading CAS state at each generation point
- Presentation pacing: absorbed into Dramaturgical Agent's runtime mode
- Session pacing: paradigm spec + Game Mind behavioral monitoring

---

### Decision 5: Framer Agent — Demoted to Paradigm Spec

**Context:** Unit hierarchies and social surface maps are paradigm properties, not per-game AI decisions.

**Decision:** Framer's outputs become **paradigm specs** — static data loaded when paradigm is identified.

**Paradigm specs contain:**
- Unit hierarchy (Moment → Episode → Sequence → Arc → Game, paradigm-specific)
- Social surface map (where social interaction lives in this paradigm's flow)
- CAS tick spec (when to evaluate, tick weight, off-cycle event triggers)
- Behavioral legibility rules (CAS state → observable behavior thresholds)
- Drama density threshold calibration
- Physics parameter ranges, rendering core, interaction grammar

**Exception:** Multi-paradigm shifts may need a lightweight agent call for mapping between specs.

---

### Decision 6: Paradigm-Specific Social Surfaces

**Decision:** Social surface maps are paradigm spec data defining where social interaction lives and how CAS expresses through native mechanics.

**Identified surfaces:**
- **Platformer:** Between-level, safe rooms, captured enemies. Social is *interruptive*.
- **RPG:** Towns, camps, dialogue, party. Social is *woven in*.
- **Racing:** Pre/post race, between-race windows, driving behavior AS social expression. Social is *compressed into margins*.
- **Shmup:** Between-level only. Social is *between episodes*.
- **Fighting:** Between bouts, post-fight vulnerability. Fight itself is social conversation through violence.
- **RTS:** Real-time diplomacy, intelligence, alliances. Social is *constant*.
- **Management sim:** Staffing/policy/resource decisions. Social is *systemic*.

**Key insight:** Social ecology doesn't need the same *time* in every paradigm — it needs the same *surface area*. Racing factions express through blocking/targeting/drafting behavior, not dialogue.

---

### Decision 7: CAS Tick Rate in Paradigm Specs

**Decision:** CAS tick timing is paradigm spec data.

- **Racing:** Full eval between races; light tick during races
- **RPG:** Tick on room transitions and dialogue
- **RTS:** Continuous 30-60s timer + event-driven
- **Platformer:** Full tick between levels; light tick at social encounters
- **Shmup:** Full tick between stages only
- **Management sim:** Tick on decision points

---

### Decision 8: Behavioral Legibility as Translation Tables

**Decision:** Paradigm-specific rules translating CAS state → observable behavior.

Examples: loyalty > 0.7 in racing → drafting/blocking; cohesion < 0.4 in platformer → patrol gaps; morale < 0.3 → enemies flinch/hesitate.

---

### Decision 9: Hybrid Generation — Skeleton + Just-in-Time

**Decision:**

**Skeleton (game creation, ~10-15s):** Structural agents produce paradigm ID, CAS initial conditions, aesthetics, narrative premises, social hooks, pressure ramp, catalysts, drama density threshold.

**Content (per episode, just-in-time):** Content agents generate each episode reading current CAS state. Latency masked by paradigm's natural social surfaces (between-race windows, level transitions, etc.).

**Between-episode window does triple duty:**
1. Social interaction surface for the player (talk to entities, see consequences, make decisions)
2. Narrative delivery for CAS state changes (cutscenes, dialogue, visual reveals)
3. Generation masking for next episode (content generation + any new visual assets needed)

**On CAS divergence:** Dramaturgical Agent recalibrates remaining ingredients (catalysts, pressure ramp). Not replanning narrative — adjusting the thermostat.

---

### Decision 10: Visual Manifestation Engine — Key System Component

**Context:** Discussion of whether the game can actually render the wild, specific, novel situations that the CAS produces — kenny Powers hitting Voldemort with a jet ski while captive Hitler watches, foot clan protesting with readable signs, a bob-omb nuclear mushroom cloud on the world map. Joe identified this as the capability that makes the "living" game feel truly alive — the thing that feels impossible, like Black Mirror, because nobody could have programmed these specific scenes in advance.

**Decision:** The Visual Manifestation Engine is a critical system sitting between Claude's narrative interpretation of CAS state and the actual renderer. It receives semantic scene descriptions and produces render-ready assets and compositions.

**Three generation layers (easiest to hardest):**

**Layer 1 — Compositional variation of existing assets:**
Existing sprites/effects used at modified parameters — different scale, color, position, combination. A bob-omb nuke is a scaled-up bob-omb + mushroom-shaped explosion at map level. A damaged kart is existing kart + sparks + smoke trail. Handles ~40-50% of cases. Available from Phase 1.

**Layer 2 — Contextual sprite state generation:**
Modified sprite states that don't exist in the library but are simple to generate. "Holding sign" pose, "captive/restrained" pose, "slumped/incapacitated" pose, pixel text on sign objects, sweat drop anxiety indicators. These are small modifications to existing sprites — pose changes, held objects, status effects. Handles ~30-40% of cases. Phase 3 territory.

**Layer 3 — Novel entity/asset generation:**
Characters and objects that don't exist anywhere — Uncle Baby Billy as a Zelda villain, Kenny Powers on a jet ski. AI image generation constrained by retro aesthetics: 16x16 to 32x32 pixels, 3-4 color palettes, style references from ingested library. Recognition at retro resolution depends on 3-5 distinguishing features, not photorealistic likeness. This is the *baseline capability of the entire game generator* — if someone prompts "Mario but Harry Potter," every Harry Potter character needs to be generated as a retro sprite. Feasible today with current AI image generation, especially for pixel art.

**Key feasibility insight:** Retro aesthetics are what make this tractable. A 32x32 sprite is ~1024 pixels in 3-4 colors. Character recognition depends on a few key features (Uncle Baby Billy = white pompadour + suit + cross = ~20 pixels of distinguishing information). The low resolution means suggestion does the work and player imagination fills the rest. This is the deepest reason retro is the right aesthetic for this project — the technical ceiling is low but the experiential ceiling is infinite because creative infinity comes from *combination*, not from any single element being hard to produce.

**The wow factor:** Players know nobody anticipated what they're seeing. They made choices, the CAS evolved, and the game rendered something that could only exist because of their specific playthrough. The technical mechanism is simple (sprite composition + variant generation + Claude interpretation). The experiential impact is extraordinary because the *specificity* is what feels impossible.

**Runtime pipeline:**
```
CAS state change at episode boundary
  → Claude interprets state in game context
    ("Bob-ombs developed nuclear weapon" / "Foot clan protesting")
  → Semantic scene spec generated
    (entities, poses, objects, spatial arrangement, effects, text)
  → Visual Manifestation Engine routes to appropriate layer(s)
  → Assets generated/composed during between-episode window
  → Next episode renders with new visual reality
```

**This compounds across games:** Game 1, player thinks "that's cool." Game 3, they realize the game consistently produces specific visual manifestations of social choices. Game 5, every social decision carries visual weight because they know they'll SEE the consequences in unpredictable ways. The CAS becomes viscerally real.

**This is the key differentiator:** Other AI game generators will produce playable levels from prompts. Nobody else will have emergent social dynamics rendered as specific, wild, contextually appropriate visual scenes unique to each playthrough. The game generator is the surface. The living visual manifestation of emergent social ecology is the thing that's actually unprecedented.

**Needs its own specification thread** covering: Claude interpretation → scene spec format, composition system mechanics, sprite variant generator capabilities, retro visual effects library, cutscene staging logic, Artistic Director's aesthetic coherence validation.

---

### Decision 11: Revised Agent Execution Order

**Decision:**

```
Pre-game generation:
  Experience Interpreter
    → Artistic Director
    → Design Philosopher
    → Dramaturgical Agent (setup: initial conditions, pressure ramp,
                           social hooks, drama density threshold, catalysts)
    → Grammarian → Rhythmist → Game Compiler → Cartographer
    → Provocateur → Coherence Auditor

Runtime (per episode):
  CAS engine ticks (per paradigm spec)
  Drama density monitor (threshold check, catalyst trigger)
  Claude interprets CAS state → narrative description
  Visual Manifestation Engine (narrative → semantic scene spec → assets)
  Visibility manager (CAS state → behavioral legibility per paradigm rules)
  Content agents generate next episode
    (paradigm mechanics + CAS state + new visual assets)
```

Plus **paradigm specs** (static data): unit hierarchy, social surfaces, CAS tick spec, behavioral legibility, drama density calibration, physics, rendering, interaction grammar.

---

### Open Design Work (Flagged, Not Decided)

1. CAS state → level content translation per paradigm
2. Paradigm → CAS dynamics boundaries
3. Prompt → CAS parameter mapping
4. Drama density calibration per paradigm
5. Social surface maps for remaining paradigms (FPS, adventure/Myst, isometric, etc.)
6. Multi-paradigm shift mapping mechanics
7. Grammarian cumulative vocabulary tracking across episodes
8. **Visual Manifestation Engine full specification** — scene spec format, composition system, sprite variant generator, retro effects library, cutscene staging, aesthetic coherence validation
9. **Prompt-time character/environment generation pipeline** — the Track B generation system that produces novel sprites from semantic descriptions constrained by retro aesthetics and ingested style references
