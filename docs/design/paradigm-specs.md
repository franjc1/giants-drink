# Two Fires — Paradigm Specifications
## Engine Clusters + Player-Facing Paradigm Specs

---

> **⚠️ PLACEHOLDER VALUES WARNING**
> All numerical values in this document (thresholds, ranges, frame counts, tile distances, etc.) are **illustrative placeholders for structural purposes only.** They exist to show what KIND of value goes in each slot and roughly what order of magnitude to expect. They are NOT tuned, tested, or implementation-ready.
>
> **Authoritative values come from Thread 3 (CAS Engine Parameters)** once that work is complete. Any code or agent reading this document should treat numerical values as `TODO: replace with Thread 3 values` until Thread 3 outputs are merged.
>
> If you are an agent or a future session and you see a number like "Loyalty < 0.4 → visible wavering" — the 0.4 is a placeholder. The behavior description ("visible wavering") is the design intent and IS authoritative. The threshold at which it triggers is not yet determined.

---

## Part 1: Engine Cluster Definitions

### Why Clusters Matter

Players see paradigms (platformer, racing, RPG). The engine sees rendering cores. Many player-facing paradigms share an engine — the differences are parameters, interaction grammars, and social surface design. This means:

- **Shifting within a cluster** (platformer → beat-em-up) = parameter swap, nearly seamless
- **Shifting across clusters** (platformer → racing) = rendering core switch, requires transition

Seven engine clusters cover every retro game type from NES through early PC.

---

### Engine Cluster 1: Side-View Tile World

**Rendering:** 2D tile-based, side-scrolling camera (horizontal primary, vertical secondary)
**Collision:** AABB tile collision + entity-entity hitbox collision
**Camera:** Horizontal scroll tracking player, vertical adjustment, optional screen-lock
**Base input:** D-pad movement + action buttons (jump, attack, etc.)

**Player-facing paradigms served:**
- **Platformer** — gravity-dominant, precision jumping, vertical level design
- **Beat-em-up** — low gravity/ground-focused, combo melee, wider stages, multi-hit enemies
- **Run-and-gun** — platformer physics + projectile systems (Contra, Metal Slug)
- **Cinematic action** — Ninja Gaiden-style, cutscene-interleaved, narrative-heavy

**What varies by paradigm (parameters, not engine):**
- Gravity strength and jump model (arc shape, air control, coyote time)
- Scroll behavior: player-driven, auto-scroll, locked-screen, free vertical
- Attack system: stomp, melee, projectile, combo chain, charge
- Enemy HP model: one-hit, multi-hit, breakable armor
- Stage structure: linear, hub/backtrack (Metroid), forced-scroll (auto-runner)
- Vertical emphasis: mostly horizontal (Mario) vs. vertical shafts (Mega Man) vs. both (Metroid)

---

### Engine Cluster 2: Top-Down Tile World

**Rendering:** 2D tile-based, top-down camera (4 or 8-directional movement)
**Collision:** AABB tile collision, terrain-type collision (water blocks, walls, damage tiles)
**Camera:** Centered on player entity, scrolls all directions (continuous or screen-by-screen)
**Base input:** D-pad movement + action/interact button, optional menu access

**Player-facing paradigms served:**
- **Action-adventure** — Zelda overhead, real-time combat in-world, dungeon structure
- **RPG overworld** — exploration, town interaction, transition to battle screen on encounter
- **Top-down action** — Gauntlet-style, continuous combat, wave-based
- **Top-down racing** — RC Pro-Am, Micro Machines (same renderer, entity is vehicle on track tiles)
- **Sports (field view)** — Tecmo Bowl, Ice Hockey, soccer (same renderer, sport-specific rules)

**What varies by paradigm:**
- Movement model: grid-locked (RPG) vs. free (Zelda) vs. physics-driven (racing)
- Combat mode: real-time in-world vs. transition to battle screen vs. none
- Interaction model: action button vs. menu-driven vs. auto (racing = drive into things)
- Entity AI: chase, patrol, random walk, race-line following, sport-positional
- World persistence: screen-by-screen (Zelda NES), continuous scroll, hub-based
- Camera attachment: locked to player (adventure) vs. tracking vehicle (racing) vs. field overview (sports)

---

### Engine Cluster 3: Stage/Arena Screen

**Rendering:** Static or minimally scrolling background + positioned sprites on a stage
**Collision:** Hitbox-based (frame-specific active/hurt boxes for fighting; simpler for RPG/fixed-screen)
**Camera:** Fixed or limited horizontal scroll (fighting game stage width)
**Base input:** Varies — fighting combo inputs, RPG menu selection, or arcade direct-action

**Player-facing paradigms served:**
- **Fighting game** — 1v1 or 1v2, real-time combo inputs, health bars, round structure
- **Turn-based RPG combat** — party vs. enemies, menu-driven, separate from overworld
- **Fixed-screen arcade** — Bubble Bobble, original Donkey Kong, single-screen platforming/action
- **Puzzle** — Tetris, Dr. Mario (fixed playfield, piece manipulation, score/clear mechanics)
- **Boss encounters** — any paradigm's dedicated boss arena

**What varies by paradigm:**
- Timing: real-time (fighting, arcade) vs. turn-based (RPG combat) vs. own-pace (puzzle)
- Input complexity: 6-button combos (fighting) vs. menu selection (RPG) vs. 2-button (puzzle)
- Entity count: 1v1 (fighting) vs. party-vs-group (RPG) vs. wave-based (arcade)
- Stage physics: platforms (fixed-screen arcade) vs. flat plane (fighting/RPG)
- Win condition: HP depletion (fighting/RPG), score threshold (arcade), clear condition (puzzle)
- Persistence: rounds reset (fighting), HP carries between encounters (RPG), continuous (arcade)

---

### Engine Cluster 4: Scrolling Shooter

**Rendering:** Layered parallax scrolling (auto-scroll), sprite-heavy, bullet pattern rendering
**Collision:** Tight hitbox collision (often pixel-level for player, larger for enemies), bullet-pattern systems
**Camera:** Auto-scrolling at fixed speed, player moves within viewport bounds
**Base input:** D-pad movement (all directions within viewport) + shoot + bomb/special

**Player-facing paradigms served:**
- **Horizontal shmup** — R-Type, Gradius, Life Force (scroll axis: left-to-right)
- **Vertical shmup** — 1942, Raiden, Truxton (scroll axis: bottom-to-top)

**What varies by paradigm:**
- Scroll axis (horizontal vs. vertical — literally rotate the coordinate system)
- Player weapon systems: single shot, spread, charge beam, options/multiples
- Powerup model: collectible upgrades, selectable loadout, level-up
- Bullet pattern complexity: aimed shots, fixed patterns, danmaku density
- Speed feel: deliberate (R-Type) vs. frantic (Raiden)
- Enemy wave design: formation-based vs. continuous spawn vs. scripted sequences

**Note:** Shmup mechanics (flying, dodging, shooting) can serve non-shmup fictions. "Mario quidditch" = Cluster 4 with sports fiction. "Space battle in an RPG" = Cluster 4 sequence within a larger Cluster 2/3 game.

---

### Engine Cluster 5: Pseudo-3D / Mode 7

**Rendering:** Sprite scaling + ground plane rotation to simulate 3D depth (Mode 7 style), or repeating road-strip scaling for into-the-screen perspective
**Collision:** Track-position-based (lane, distance along track, off-track detection)
**Camera:** Behind-player or slightly-above-behind, locked to player vehicle/entity
**Base input:** Steering (left/right) + accelerate/brake + action (item use, attack)

**Player-facing paradigms served:**
- **Behind-view racing** — F-Zero, Mario Kart, OutRun, Top Gear
- **Driving action** — Road Rash (racing + combat), Chase HQ (pursuit)

**What varies by paradigm:**
- Vehicle physics: drift model, grip, top speed, acceleration curves, boost mechanics
- Track geometry: turns, hills, jumps, splits, hazards
- Opponent interaction: clean racing vs. item-based combat (Mario Kart) vs. melee combat (Road Rash)
- Race structure: circuit, point-to-point, time trial, elimination
- Visual style: futuristic clean (F-Zero) vs. naturalistic (OutRun) vs. fantasy (Mario Kart)

---

### Engine Cluster 6: Raycasting First-Person

**Rendering:** Raycasting engine — textured walls, floor/ceiling rendering, billboard sprites for entities
**Collision:** Grid-based or BSP-based wall collision, entity-entity
**Camera:** First-person, mouse-look or keyboard-turn
**Base input:** Move (WASD/arrows) + look + action (shoot/interact/use)

**Player-facing paradigms served:**
- **FPS** — Wolfenstein, Doom, early Quake (real-time combat, fast movement)
- **First-person adventure** — Myst, Shadowgate-style (point-and-click/puzzle, player-paced)
- **First-person dungeon crawler** — Eye of the Beholder, Ultima Underworld (exploration + turn-based or real-time RPG combat)

**What varies by paradigm:**
- Interaction grammar: twitch-shoot (FPS) vs. point-and-click (adventure) vs. menu+movement (dungeon crawler)
- Movement speed: fast (Doom) vs. deliberate (Myst) vs. moderate (dungeon crawler)
- Combat model: real-time hitscan/projectile (FPS), none (adventure), turn-based or real-time melee (dungeon)
- Environmental complexity: mostly corridors (Wolf3D) vs. multi-level (Doom) vs. puzzle-rich (Myst)
- Entity behavior: aggressive patrol (FPS enemies), static/interactive (adventure objects), mixed (dungeon)
- Pacing: adrenaline (FPS), contemplative (adventure), exploratory (dungeon)

---

### Engine Cluster 7: Strategic Map

**Rendering:** Top-down tile map (visually similar to Cluster 2, but camera and input are fundamentally different)
**Collision:** Tile-based pathfinding, unit-level collision, fog of war system
**Camera:** Free-scrolling viewport controlled by player (NOT attached to a character entity)
**Base input:** Point-and-select (click/cursor to select units or locations) + command menus

**Player-facing paradigms served:**
- **RTS** — Warcraft, Dune II, StarCraft (real-time unit command, base building, resource gathering)
- **Tactics / SRPG** — Fire Emblem, Advance Wars (turn-based unit command, grid movement, positioning)
- **Management sim** — SimCity, Civilization, Theme Park (place/build/manage, policy decisions, time control)

**What varies by paradigm:**
- Timing: real-time (RTS) vs. turn-based (tactics) vs. adjustable (management sim)
- Unit control: individual selection + group (RTS), individual on grid (tactics), systemic/policy (management)
- Build/place mechanics: base construction (RTS/sim) vs. none (tactics)
- Resource model: gather/spend (RTS), per-turn budget (tactics), economic simulation (management)
- Win condition: destroy enemy (RTS), tactical objective (tactics), threshold goals (sim)
- AI opponent: military (RTS/tactics) vs. systemic challenge (sim — no opponent, environment IS the challenge)
- Zoom level: fixed (early RTS) vs. multi-scale (management sim — zoom to building level)

---

## Part 2: Cross-Cluster Relationships

### Intra-Cluster Shifts (Parameter Swaps)

These feel seamless to the player because nothing about the rendering changes — just the rules and physics:

| From | To | What Changes |
|------|----|-------------|
| Platformer → Beat-em-up | Gravity drops, attack system switches to combo melee, enemies gain HP bars |
| Platformer → Run-and-gun | Projectile system activates, enemy density increases, may add auto-scroll |
| Action-adventure → RPG overworld | Combat transitions to battle screen instead of in-world, encounter system activates |
| Top-down action → Top-down racing | Entity becomes vehicle, physics switch to momentum/drift, tiles become track |
| Horizontal shmup → Vertical shmup | Coordinate system rotates 90° |
| RTS → Management sim | Remove opponent military AI, add economic/policy systems, adjust time scale |
| RTS → Tactics | Switch from real-time to turn-based, add grid movement, remove base building |

### Cross-Cluster Shifts (Rendering Core Switches)

These require a transition — loading screen, cutscene, or narrative bridge:

| Trigger Condition | From → To | Narrative Logic |
|---|---|---|
| Player builds army / gains many followers | Cluster 1 or 2 → Cluster 7 | Need strategic view to command forces |
| Player faces boss 1-on-1 | Any → Cluster 3 | Dedicated arena for climactic encounter |
| Player pilots vehicle / flies | Cluster 1 or 2 → Cluster 5 | Into-the-screen movement for speed/vehicle feel |
| Player infiltrates enemy fortress | Cluster 2 or 7 → Cluster 6 | First-person claustrophobia for infiltration |
| Player enters space/air battle | Cluster 1, 2, or 7 → Cluster 4 | Shmup mechanics for aerial/space combat |
| Player enters dialogue/court/trial | Any → Cluster 3 (stage) | Face-to-face social encounter on a stage |
| Player zooms into city they're managing | Cluster 7 → Cluster 1 or 2 | Walk around inside what you've been managing from above |

### What Carries Across ALL Shifts

Regardless of cluster change:
- **Identity:** Player's name, reputation, social standing, known relationships
- **Strategic position:** Territory controlled, alliances formed, intelligence gathered
- **Resources:** Inventory, currency, accumulated power (adapted to new paradigm's expression)
- **CAS state:** Faction loyalties, entity dispositions, information propagation state — this NEVER resets
- **Narrative context:** Story beats, character knowledge, lore accumulated

### What Transforms

- **Mechanical capabilities:** Jump height becomes unit speed; combo moves become tactical abilities
- **Camera and controls:** Obviously
- **Difficulty expression:** Precision platforming becomes tactical positioning becomes strategic resource pressure
- **Visual scale:** Character-level → army-level → building-level

---

## Part 3: Player-Facing Paradigm Specs

Each spec below defines how one player-facing paradigm works across every system in Two Fires. Agents read the relevant spec when generating content for that paradigm.

Format for each spec covers: temporal structure, sequencing grammar, social surface, CAS integration, physics & mechanics, aesthetics, and genre shift interface.

---

### PLATFORMER
**Engine cluster:** 1 (Side-View Tile World)
**Canonical references:** Super Mario Bros, Mega Man, Castlevania, Sonic, Metroid, DKC, Kirby

#### Temporal Structure
- **Unit hierarchy:** Moment (single jump/encounter, 2-5s) → Screen (one screen-width of level, 10-30s) → Section (thematic chunk with one challenge idea, 1-3min) → Level/Stage (complete level, 5-15min) → World (thematically grouped stages, 30-90min) → Game
- **Episode = Level.** One level is the atomic unit of play. CAS ticks between levels.
- **Session pacing:** 3-6 levels per typical 30-min play session

#### Sequencing Grammar
- **Teachability window:** ~30 seconds / 2-3 screens per new element
- **Rhythm cadence:** 45-90 second tension/relief cycles. Relief = flat safe terrain with visible reward or aesthetic breather
- **Directionality model:** Primary horizontal axis. Vertical branching signals optional content. Locked progression gates visually distinct from decorative dead ends. Right = forward (or left-to-right scroll convention).
- **Canonical spatial moves:**
  - The shaft (vertical challenge requiring precise platforming up or down)
  - The gauntlet (linear enemy sequence testing mastery of current vocabulary)
  - The platform puzzle (precision jumping, timing-based, usually over a pit)
  - The safe room (relief + resource + often social surface)
  - The gate (skill check — demonstrates mastery before proceeding)
- **Introduction sequence:** Safe static encounter → mobile encounter → combined/environmental encounter

#### Social Surface
- **Type:** Interruptive — social interaction happens in pauses between action
- **Surface locations:** Between levels, safe rooms mid-level, captured/cornered enemies, pre-boss encounters
- **Communication triggers:** Vulnerability (injured/cornered enemy), neutrality (safe room NPCs), capture (defeated enemy dazed briefly), reputation (entities seek player out at level start/end based on spreading reputation)
- **Between-episode window:** Level complete screen → social window (dialogue, faction updates, CAS narrative delivery, world map if applicable) → next level loads during this window
- **Social expression through mechanics:** Enemy patrol patterns reflect morale (hesitant patrol = low morale). Enemies that don't attack = potential ally. Environmental graffiti/posters = faction propaganda. Items left by allies = covert support.

#### CAS Integration
- **Tick spec:** Full evaluation between levels. Light tick at mid-level social encounters (safe rooms, captured enemies). No tick during action gameplay.
- **Behavioral legibility rules:**
  - Loyalty > 0.7 → entity patrols normally, engages aggressively
  - Loyalty 0.4-0.7 → patrol gaps, hesitation before attacking, slightly slower reaction
  - Loyalty < 0.4 → visible wavering (stops, looks around), may not attack, approachable
  - Cohesion < 0.4 → patrol gaps between linked entities (they're not coordinating)
  - Morale < 0.3 → flinch/hesitate animations, retreat when player approaches
  - Awareness of player > 0.7 → entities actively track player movement, alert others
  - Disposition to player > 0.5 → entity faces player without attacking, different idle animation
- **Drama density threshold:** 1-2 perceptible social events per level (faction shift visible through behavior, dialogue encounter, environmental change from CAS state). More than 3 per level feels noisy. Zero for 2+ levels = catalyst trigger.
- **Drama density calibration:** Platformers are action-primary. Social ecology is felt in the margins — the enemy that doesn't attack, the safe room with a nervous NPC, the boss whose dialogue reveals faction fractures. Don't compete with the platforming for attention.

#### Physics & Mechanics
- **Parameter ranges:**
  - Gravity: 0.4-1.2 (normalized, where 1.0 = SMB3)
  - Jump height: 2-5 tiles
  - Move speed: 2-6 tiles/second
  - Air control: 0.0 (Castlevania) to 1.0 (full air control, Kirby)
  - Coyote time: 0-100ms
  - Jump buffer: 0-100ms
- **Core mechanics:** Move, jump, attack (stomp/melee/projectile — varies per game), interact (talk, pick up, activate)
- **Difficulty expression:** More enemies, faster enemies, tighter platforms, longer gaps, element combinations, removal of safety nets
- **Failure mode:** Death → restart from checkpoint or level start. Lives system optional.

#### Aesthetics
- **Default style era:** NES late / SNES early (depends on prompt)
- **Palette tendencies:** World-themed (grass green, cave brown, castle gray, sky blue) with faction colors threaded through enemy sprites and environmental decoration
- **Music cadence:** One track per level, tempo roughly matching intended pace. Tension sections may layer additional instruments or shift to minor key. Boss theme = distinct, higher energy.
- **Sound design priorities:** Jump sound (most frequent, must feel good), landing sound, enemy hit, player damage, item collect, death. In that order.

#### Genre Shift Interface
- **Carries FROM platformer:** Player identity, reputation, inventory, all CAS state, level progress
- **Carries TO platformer:** All the above. Strategic position maps to "which worlds are allied/hostile." Army size maps to "how many friendly entities appear in levels."
- **Shift triggers away:**
  - Player accumulates >5 active followers → may shift to Cluster 7 (RTS/tactics) for army command
  - Boss dialogue becomes political negotiation → may shift to Cluster 3 (stage) for face-to-face social encounter
  - Player acquires vehicle/flight → may shift to Cluster 5 (racing) or Cluster 4 (shmup)
  - Player needs to manage territory they've claimed → may shift to Cluster 7 (management sim)
- **Shift targets:** Beat-em-up (intra-cluster, seamless), RTS (cross-cluster, earned), Fighting (cross-cluster, boss encounter), Racing (cross-cluster, vehicle sequence)

---

### BEAT-EM-UP
**Engine cluster:** 1 (Side-View Tile World)
**Canonical references:** Streets of Rage, Final Fight, Double Dragon, TMNT, Golden Axe, River City Ransom

#### Temporal Structure
- **Unit hierarchy:** Moment (single combo/encounter, 3-8s) → Wave (enemy group, 15-45s) → Section (area with thematic identity, 2-5min) → Stage (complete level, 10-20min) → Game
- **Episode = Stage.** CAS ticks between stages and during mid-stage narrative breaks.
- **Session pacing:** 2-4 stages per 30-min session

#### Sequencing Grammar
- **Teachability window:** ~45 seconds / 1-2 waves per new enemy type
- **Rhythm cadence:** 30-60 second tension cycles. Relief = cleared area, brief walk forward with no enemies, item drops, or environmental storytelling moment.
- **Directionality model:** Forced horizontal progression. "Go" arrow or barrier communicates when area is cleared. Optional vertical depth (walk up/down within lane) for positioning, not exploration.
- **Canonical spatial moves:**
  - The brawl (locked room, waves of enemies, must clear to proceed)
  - The walk (brief forward movement, environmental storytelling, items, breather)
  - The ambush (enemies appear from unexpected direction — behind, above, from doors)
  - The hazard arena (environmental danger + enemies — pits, conveyor belts, traffic)
  - The mini-boss (single tough enemy, tests combo mastery)
- **Introduction sequence:** Single enemy type, low aggression → same type, higher aggression → mixed types requiring priority targeting

#### Social Surface
- **Type:** Interruptive + embedded in violence — fighting IS a form of social expression
- **Surface locations:** Between stages, mid-stage breaks (rescued NPCs, cornered enemies), post-boss vulnerability windows
- **Communication triggers:** Shared circumstance (both trapped in same area), vulnerability (enemy on last HP — can spare), status (merchants/informants between stages), post-boss (defeated boss is briefly approachable)
- **Between-episode window:** Stage clear screen → social window (rescued allies speak, defeated enemies can be interrogated, faction news delivered) → next stage
- **Social expression through mechanics:** Enemies that fight reluctantly (slow attacks, look away). Enemies that surrender (hands up animation, approachable). Environmental storytelling (propaganda posters, graffiti from resistance, damaged faction insignia). Co-op partner (if present) as social relationship expressed through coordinated combat.

#### CAS Integration
- **Tick spec:** Full evaluation between stages. Light tick at mid-stage narrative breaks. Combat encounters inform but don't trigger ticks.
- **Behavioral legibility rules:**
  - Loyalty > 0.7 → aggressive, coordinated attacks, calls for backup
  - Loyalty 0.4-0.7 → fights but doesn't pursue, won't call reinforcements
  - Loyalty < 0.4 → hesitates, may surrender when alone, approachable
  - Morale < 0.3 → runs away when outnumbered, drops weapon
  - Cohesion < 0.4 → enemies don't coordinate (no pincer moves, don't help each other)
- **Drama density threshold:** 1-2 perceptible events per stage (surrender, defection, environmental change, mid-boss dialogue revealing faction state). Beat-em-ups are simpler narratively — let the violence itself tell the CAS story through behavioral legibility.
- **Drama density calibration:** The feeling should be "these aren't just goons" — even in a beat-em-up, each enemy wave should feel like it has a reason to be there, and the CAS state should be readable through how they fight.

#### Physics & Mechanics
- **Parameter ranges:**
  - Gravity: 0.3-0.6 (lower than platformer — ground-focused)
  - Move speed: 2-4 tiles/second (walking pace)
  - Attack speed: 3-8 hits per combo chain
  - Hitstun: 200-500ms (defines feel — longer = more impactful)
  - Knockback distance: 0.5-2 tiles per hit
  - Enemy HP: 3-8 hits for regular, 15-30 for mini-boss, 40-80 for boss
- **Core mechanics:** Move (8-directional within lane depth), attack (combo chains, grab, throw, special), interact (pick up items/weapons), block/dodge
- **Difficulty expression:** More enemies per wave, faster/armored enemies, less item drops, tighter timing windows, multi-directional attacks
- **Failure mode:** Death → continue from last checkpoint or use continue credit. Lives system.

#### Aesthetics
- **Default style era:** Genesis / SNES (beat-em-ups peaked here)
- **Palette tendencies:** Urban/gritty (Streets of Rage), or thematic to setting. Darker than platformers. Enemy faction colors important for distinguishing groups.
- **Music cadence:** Driving beat matching combat rhythm. Genre typically funk/electronic. Tempo increases with difficulty. Boss themes more intense.
- **Sound design priorities:** Hit impact (satisfying thud), combo rhythm (sounds should chain musically), enemy grunt, special move, item pickup.

#### Genre Shift Interface
- **Shift triggers away:** Same as platformer — army accumulation → RTS, political negotiation → stage encounter, vehicle → racing
- **Intra-cluster shifts:** Platformer (add more platforming/vertical), run-and-gun (add projectiles, reduce melee)

---

### SHMUP (Horizontal & Vertical)
**Engine cluster:** 4 (Scrolling Shooter)
**Canonical references:** R-Type, Gradius, Life Force, 1942, Raiden, Truxton, Blazing Lazers

#### Temporal Structure
- **Unit hierarchy:** Moment (dodge/pattern, 1-3s) → Wave (enemy formation, 5-15s) → Section (thematic chunk, 30-90s) → Stage (complete level, 3-8min) → Game
- **Episode = Stage.** Stages are short and intense. CAS ticks between stages only.
- **Session pacing:** 4-8 stages per 30-min session (shmups are fast)

#### Sequencing Grammar
- **Teachability window:** 5-10 seconds per new bullet pattern. Patterns must be learnable in real time — no "gotcha" patterns on first appearance.
- **Rhythm cadence:** 10-20 second cycles. This is nearly musical — shmup level design IS rhythm composition. Dense waves alternate with breathing space at a strict cadence.
- **Directionality model:** Auto-scroll provides direction. Player focuses on position management within viewport. Cartographer focuses on density distribution, lane structure, safe corridor width.
- **Canonical spatial moves:**
  - The wave (enemy formation sweep across screen, dodge + shoot)
  - The corridor (environmental narrowing, forced precision navigation)
  - The wall (screen-wide enemy line, find the gap)
  - The boss approach (escalating density + environmental tension before encounter)
  - The breather (post-wave calm, powerup opportunity, low density)
- **Introduction sequence:** Formation at screen edge → formation at mid-screen → formation with environmental obstacle

#### Social Surface
- **Type:** Between-episodes only — shmup action is too fast for social interruption
- **Surface locations:** Pre-stage briefing, post-stage debrief, wingman communication (brief radio chatter during gameplay — not interactive, just flavor)
- **Communication triggers:** Post-stage (you survived, now talk), wingman bond (persistent ally has disposition), command structure (who sent you on this mission and why)
- **Between-episode window:** Stage complete → debrief (wingman dialogue, command updates, CAS narrative — faction news from the war you're fighting in) → next stage briefing → launch
- **Social expression through mechanics:** Wingman behavior (AI ally fights harder or more cautiously based on CAS state). Enemy wave composition reflects faction state (demoralized faction sends fewer/weaker waves). Environmental changes in backgrounds (burning cities = faction losing, intact cities = faction winning). Friendly fire incidents from uncommitted allies.

#### CAS Integration
- **Tick spec:** Full evaluation between stages only. Zero ticks during gameplay — shmup action is too fast for meaningful CAS processing.
- **Behavioral legibility rules:**
  - Enemy faction morale < 0.3 → smaller waves, more retreat patterns, fewer suicide attacks
  - Enemy faction cohesion < 0.4 → disorganized formations (enemies don't sync their patterns)
  - Allied faction morale > 0.7 → wingman more aggressive, covers more area
  - Allied faction disposition to player > 0.5 → wingman takes risks for player (blocks shots)
- **Drama density threshold:** 1 perceptible social event per 2-3 stages. Shmups are mechanically pure — social ecology lives in the between-stage windows and manifests through wave composition and background storytelling. Don't force it.
- **Drama density calibration:** Less is more. A single betrayal by a wingman in stage 5 hits harder because the first 4 stages built trust through shared survival. The shmup social surface is compressed but high-impact.

#### Physics & Mechanics
- **Parameter ranges:**
  - Player speed: 3-7 tiles/second (focused vs. unfocused movement)
  - Bullet speed: 4-12 tiles/second
  - Player hitbox: 2x2 to 4x4 pixels (tight hitbox even on larger sprite)
  - Scroll speed: 1-3 tiles/second
  - Powerup frequency: every 15-30 seconds
- **Core mechanics:** Move (all directions within viewport), shoot (auto-fire or button), bomb/special (screen clear, limited), collect powerups
- **Difficulty expression:** Bullet density, pattern complexity, speed, fewer powerups, more enemy HP
- **Failure mode:** Death → respawn at checkpoint (R-Type style) or in-place (Gradius style). Life/continue system. Death may cost powerups.

#### Aesthetics
- **Default style era:** NES late / Genesis (shmups peaked on these platforms)
- **Palette tendencies:** High contrast — dark backgrounds with bright bullets and enemies. Sci-fi or military. Backgrounds should convey faction state (war damage, propaganda, occupied territory).
- **Music cadence:** Up-tempo, driving. Basically the rhythm section of the level design. Boss themes are heavier, more intense. Shmup music IS the game's heartbeat.
- **Sound design priorities:** Shot fire (constant, must not be annoying), explosion (satisfying, layered for bigger enemies), powerup collect (positive, rewarding), bomb (massive, cathartic), player death (impactful, brief).

#### Genre Shift Interface
- **Carries FROM shmup:** Pilot/ship identity, reputation, wingman relationship, CAS state from the war, intelligence gathered during missions
- **Carries TO shmup:** Player becomes pilot. Social relationships map to command structure and wingman assignments. Territory maps to mission targets.
- **Shift triggers away:** Player lands / boards enemy vessel → Cluster 1 or 6 (platformer or FPS infiltration). Player assumes command of fleet → Cluster 7 (RTS). Diplomatic mission → Cluster 3 (stage encounter).
- **Shift targets:** FPS (infiltration after landing), RTS (fleet command), Platformer (ground mission), Stage (diplomatic encounter)

---

### RACING (Behind-View / Mode 7)
**Engine cluster:** 5 (Pseudo-3D)
**Canonical references:** F-Zero, Super Mario Kart, OutRun, Top Gear, Road Rash

#### Temporal Structure
- **Unit hierarchy:** Moment (turn/hazard, 1-3s) → Lap section (straight/curve/hazard zone, 10-30s) → Lap (complete circuit, 1-3min) → Race (full race, 3-10min) → Cup/Season (grouped races, 30-120min) → Game
- **Episode = Race.** One race is the atomic unit. CAS ticks between races.
- **Session pacing:** 4-8 races per 30-min session

#### Sequencing Grammar
- **Teachability window:** ~15-20 seconds per new track element. First appearance of a new hazard (oil slick, sharp turn, jump) on a straightaway or gentle curve, not combined with other hazards.
- **Rhythm cadence:** 15-30 second cycles dictated by track geometry. Straights = relief (top speed, breathe). Technical sections = tension (turns, hazards, traffic). The track IS the rhythm.
- **Directionality model:** Track provides absolute direction — always forward. Position in the pack provides relative direction — always toward first place. Visual horizon gives constant sense of speed and progress.
- **Canonical spatial moves:**
  - The straight (speed buildup, passing opportunity, item use window)
  - The chicane (tight alternating turns, skill expression, position shuffling)
  - The hazard zone (environmental danger — oil, gravel, cliffs, traffic)
  - The split (fork in track — shortcut vs. safe route, risk/reward decision)
  - The overtake zone (widened track, designed for position changes)
- **Introduction sequence:** New element on straight → same element on gentle curve → element combined with traffic/opponents

#### Social Surface
- **Type:** Compressed into margins — social interaction happens in brief windows around races
- **Surface locations:** Pre-race (paddock/garage, face-to-face with rivals/allies), post-race (podium, confrontation, alliance), between-race windows, driving behavior AS social communication
- **Communication triggers:** Shared circumstance (both eliminated by same rival), rivalry (close championship standings), reputation (racing style communicates character — clean vs. dirty)
- **Between-episode window:** Race finish → results + social window (rival dialogue, faction dynamics in the racing league, alliance offers, threats) → next race preparation → race start. This window is where the deep game lives.
- **Social expression through mechanics:** Drafting/slipstreaming allies. Blocking/targeting rivals. Deliberate crashes = aggression. Letting someone pass = diplomacy. Item targeting choices. Post-race behavior (celebration vs. dispute vs. alliance). These mechanical choices ARE social choices — every racing action is simultaneously a social statement.

#### CAS Integration
- **Tick spec:** Full evaluation between races. Light tick during races (on major events like crashes, item hits, position changes — but only to update dispositions, not trigger narrative).
- **Behavioral legibility rules:**
  - Loyalty to player > 0.7 → drafts behind player (cooperative), blocks player's rivals
  - Loyalty 0.4-0.7 → races independently, neither helps nor hinders
  - Loyalty < 0.4 → targets player with items, blocks aggressively
  - Faction cohesion > 0.7 → faction members coordinate (team tactics, blocking/drafting)
  - Faction cohesion < 0.4 → faction members race selfishly, may sabotage each other
  - Disposition to player > 0.5 → post-race approach (dialogue opportunity, tips, alliance offer)
  - Disposition to player < -0.5 → post-race confrontation (threat, challenge, sabotage hint)
- **Drama density threshold:** 1-2 significant social events per race weekend (alliance shift, betrayal during race, post-race confrontation, championship politics). Racing's social ecology is league politics — who's allied, who's cheating, who's being pressured by the league/sponsor/faction.
- **Drama density calibration:** The race itself tells the CAS story through racing behavior. Post-race is where it becomes explicit. Don't interrupt racing with cutscenes — let the driving behavior communicate disposition, and save the dialogue for between races.

#### Physics & Mechanics
- **Parameter ranges:**
  - Top speed: 3-8 (normalized scale within Mode 7)
  - Acceleration: 0.3-0.8 (slower = heavier, faster = lighter feel)
  - Drift coefficient: 0.0 (no drift, grip) to 1.0 (heavy drift, Mario Kart)
  - Turn rate: based on speed (faster = wider turns)
  - Boost power: 1.2x-2.0x speed multiplier
  - Opponent count: 4-20
- **Core mechanics:** Steer, accelerate/brake, use item (if applicable), draft/block (positioning)
- **Difficulty expression:** Faster opponents, more aggressive AI, tighter tracks, fewer items/powerups, harder weather conditions
- **Failure mode:** Finish in back positions / DNF → championship consequences. No "death" — failure is competitive, not fatal. Except Road Rash-style: crash → restart.

#### Aesthetics
- **Default style era:** SNES (Mode 7 racing peaked here)
- **Palette tendencies:** Bright, high-speed readability. Distinct racer colors for faction recognition. Track environment tells story (pristine = established order, damaged = conflict zone, neon = underground).
- **Music cadence:** Driving electronic/rock matching race energy. Different tracks for different race moods. Victory/defeat themes distinct.
- **Sound design priorities:** Engine sound (constant, must scale with speed naturally), drift screech, impact/crash, boost activation, item use, crowd/ambient.

#### Genre Shift Interface
- **Carries FROM racing:** Driver identity, championship standing, rivalries, CAS state from league politics, resource/currency from winnings
- **Carries TO racing:** Player identity becomes driver. Social relationships map to league standings and rivalries. Territory/reputation maps to sponsorships and team alliances.
- **Shift triggers away:** Player confronts rival off-track → Cluster 3 (fighting or stage dialogue). Player manages racing team → Cluster 7 (management sim). Player infiltrates rival's garage → Cluster 6 (first-person) or Cluster 1 (side-scroll stealth).
- **Shift targets:** Fighting (rival confrontation), Management sim (team management), Stage encounter (face-to-face negotiation), Platformer/FPS (off-track mission)

---

### ACTION-ADVENTURE (Top-Down)
**Engine cluster:** 2 (Top-Down Tile World)
**Canonical references:** Zelda (overhead), Secret of Mana, Crystalis, StarTropics

#### Temporal Structure
- **Unit hierarchy:** Moment (combat encounter or puzzle, 5-20s) → Room (single screen or connected space, 30-120s) → Floor/Section (thematically connected rooms, 5-15min) → Dungeon (complete dungeon, 20-60min) → Overworld region → Game
- **Episode = Dungeon or overworld section.** CAS ticks between dungeons and at major overworld events.
- **Session pacing:** 1-2 dungeons or 1 dungeon + overworld exploration per 45-60min session

#### Sequencing Grammar
- **Teachability window:** 1-2 rooms per new element. Rooms function as discrete teaching units — one new idea per room.
- **Rhythm cadence:** 2-4 minute cycles. Relief = room solved (chest reward, key found, save point). Tension = combat room or complex puzzle. Dungeons have their own macro rhythm building to the boss.
- **Directionality model:** Lock-and-key logic. Dungeon communicates its structure through visual language: locked doors visible before keys found, switches telegraph effects. Overworld uses landmarks and terrain gating (water, mountains) to guide without constraining.
- **Canonical spatial moves:**
  - The lock-and-key (solution visible before problem, creates forward pull)
  - The combat room (clear enemies before door opens)
  - The puzzle room (mechanical/spatial challenge distinct from combat)
  - The reward room (chest, heart piece, upgrade — relief and motivation)
  - The shortcut reveal (one-way door or destructible wall connecting to earlier area)
  - The vista (room or overlook that shows you where you're headed)
- **Introduction sequence:** Observe mechanic in safe context (switch with visible effect, no stakes) → use mechanic for progression → mechanic under pressure (timed, enemies present)

#### Social Surface
- **Type:** Woven in — social interaction is integrated into exploration and world navigation
- **Surface locations:** Towns (full social hub), overworld NPCs, dungeon NPCs (prisoners, defectors, merchants), pre/post-boss encounters, companion dialogue
- **Communication triggers:** All types active — vulnerability, neutrality, shared circumstance, status, capture, reputation. This paradigm has the richest social surface of the action-oriented paradigms.
- **Between-episode window:** Dungeon complete → return to overworld → town social hub (full faction updates, new quests, relationship development, CAS narrative delivery) → next dungeon preparation
- **Social expression through mechanics:** Town populations change based on CAS state. Merchants have different stock based on faction alignment. NPCs give different information based on reputation. Dungeon difficulty affected by faction intelligence (warned enemies prepare for player). Overworld encounters vary by territorial control.

#### CAS Integration
- **Tick spec:** Full evaluation between dungeons. Medium tick on overworld area transitions. Light tick on significant room events in dungeons (boss defeat, prisoner rescue, key item acquisition).
- **Behavioral legibility rules:**
  - Dungeon enemies follow platformer-style legibility (loyalty → aggression/hesitation)
  - Town NPCs: disposition > 0.5 → approach player, offer information/items
  - Town NPCs: disposition < -0.3 → turn away, refuse service, may report player to hostile faction
  - Overworld: faction territory control visible through environmental decoration (flags, patrols, building state)
  - Merchant: disposition > 0.3 → fair prices; disposition < -0.3 → inflated prices or refusal
- **Drama density threshold:** 2-3 perceptible events per dungeon (NPC encounter, faction revelation, environmental shift). 1-2 per overworld section. Towns can handle higher density (3-5) because the player is in social mode.
- **Drama density calibration:** Action-adventure has the most balanced action/social ratio. Neither dominates. The dungeon is action-primary with social embedded; the overworld is exploration-primary with social woven throughout; the town is social-primary with commerce/preparation.

#### Physics & Mechanics
- **Parameter ranges:**
  - Move speed: 2-4 tiles/second
  - Attack range: 1-3 tiles (sword/melee), longer for projectile
  - Enemy HP: 1-8 hits for regular, 20-50 for boss
  - Knockback: 0.5-1.5 tiles
  - Heart/HP: 3-20 (scales with progression)
- **Core mechanics:** Move (4 or 8 direction), attack (sword/melee, projectile secondary), use item (contextual — bombs, hookshot, etc.), interact (talk, lift, push, pull), open (doors, chests)
- **Difficulty expression:** Complex puzzles, more enemies, environmental hazards, key items hidden deeper, dungeon routing complexity
- **Failure mode:** Death → restart from dungeon entrance or last save point. Item/heart attrition creates pressure within dungeons.

#### Aesthetics
- **Default style era:** NES late / SNES (Zelda: ALttP is the gold standard)
- **Palette tendencies:** Overworld = bright, inviting. Dungeon = thematic (fire dungeon, ice dungeon, shadow dungeon). Town = warm, safe. Faction territory shifts palette subtly (occupied areas muted/darker).
- **Music cadence:** Overworld theme (iconic, hopeful), dungeon theme (per-dungeon, atmospheric), town theme (warm, safe), boss theme (intense). Music shifts are emotional landmarks.
- **Sound design priorities:** Sword swing, enemy hit, puzzle solve (revelatory chime), secret found, item acquire, door open, player damage.

#### Genre Shift Interface
- **Shift triggers away:** Army accumulation → RTS. Face-to-face with major antagonist → Stage. Player enters vehicle/mount → Racing or Shmup. Player manages settlement/castle → Management sim.
- **Intra-cluster shifts:** RPG overworld (add encounter transitions + battle screen), top-down action (simplify to pure combat)

---

### RPG (Overworld + Battle)
**Engine cluster:** 2 (Top-Down Tile World) + 3 (Stage/Arena for combat)
**Canonical references:** Final Fantasy (I-VI), Dragon Quest, Pokémon, EarthBound, Chrono Trigger, Phantasy Star

#### Temporal Structure
- **Unit hierarchy:** Turn (single action in combat, 3-10s) → Encounter (full battle, 1-5min) → Dungeon/route section (exploration + encounters, 15-45min) → Story chapter (narrative arc with multiple locations, 1-3hrs) → Game
- **Episode = Story chapter or dungeon.** CAS ticks between chapters, at town visits, and on major story beats.
- **Session pacing:** 1-2 dungeon sections or 1 story chapter per 45-60min session

#### Sequencing Grammar
- **Teachability window:** Enemy type introduced in low-stakes encounter before appearing in dangerous combination. New spell/ability used in safe context before required under pressure.
- **Rhythm cadence:** 3-5 encounters between resource replenishment (inn/save). Encounter pacing creates attrition rhythm — each battle consumes resources, the decision of "push forward or retreat?" is the rhythm.
- **Directionality model:** World map / dungeon map legibility. Player should always know current depth and rough distance to exit/objective. Dungeon design uses one-way shortcuts and visible-but-unreachable areas to communicate structure.
- **Canonical spatial moves:**
  - The introduction encounter (single weak enemy, teaches combat basics)
  - The combination encounter (two known types with synergy requiring new tactics)
  - The attrition run (escalating resource pressure over multiple encounters)
  - The rest point (inn, save point, campfire — relief + social surface)
  - The story beat (town, NPC dialogue, cutscene — narrative + CAS delivery)
  - The boss gauntlet (dungeon section leading to boss with limited recovery)
- **Introduction sequence:** Single enemy solo → same enemy with support → enemy combination requiring tactical adaptation

#### Social Surface
- **Type:** Deeply woven — RPGs have the richest social surface of all paradigms
- **Surface locations:** Towns (full social hub), party member dialogue (constant companion access), pre/post-battle (enemy can be talked to), shops/inns (merchant relationships), story sequences, optional social encounters throughout
- **Communication triggers:** All types, plus party dynamics (party members have opinions, disagree, form sub-alliances, share knowledge unevenly)
- **Between-episode window:** Chapter transitions involve extensive social windows — town exploration, party camping/dialogue, political developments, merchant interactions, side quests as social encounters
- **Social expression through mechanics:** Party member effectiveness varies with morale (hurt party member fights worse). Town prices reflect faction disposition. Random encounter rates vary by territorial control (hostile territory = more encounters). Enemies may surrender mid-battle. Party members may refuse certain orders if disposition is low enough. Equipment availability reflects faction economics.

#### CAS Integration
- **Tick spec:** Full evaluation on town visits and chapter transitions. Medium tick on dungeon floor changes. Light tick on significant battle outcomes (boss defeat, rare enemy, player choice in battle like sparing an enemy).
- **Behavioral legibility rules:**
  - Party member morale > 0.7 → fights at full effectiveness, offers battle suggestions, positive dialogue
  - Party member morale 0.4-0.7 → fights normally, neutral dialogue
  - Party member morale < 0.4 → reduced combat effectiveness, critical/reluctant dialogue, may refuse commands
  - Enemy faction morale < 0.3 → enemies may flee mid-battle, offer surrender
  - Town disposition > 0.5 → shops offer discounts, NPCs share information, inns cheaper
  - Town disposition < -0.3 → shops overcharge, NPCs unhelpful, may be refused service
- **Drama density threshold:** 2-4 per chapter. RPGs can handle higher density than action paradigms because the pacing is slower and social interaction IS the content, not an interruption to it.
- **Drama density calibration:** RPGs are the paradigm where social ecology can breathe most fully. Party dynamics, town politics, faction warfare — these aren't distractions from the game, they're the primary content layer. Combat is the backdrop against which social decisions play out.

#### Physics & Mechanics
- **Parameter ranges (combat):**
  - HP ranges: 10-9999 (classic FF scaling)
  - Damage ranges: scale with level/equipment
  - Speed/initiative: determines turn order
  - MP/resource pools: magic, technique points, items
  - Party size: 1-4 active, up to 6-8 total
- **Core mechanics:** Explore (overworld movement), fight (turn-based command selection), talk (NPC/party dialogue), equip (gear management), use (items, abilities), buy/sell
- **Difficulty expression:** Enemy stat scaling, required grinding curve, resource scarcity, puzzle complexity, boss mechanics requiring specific strategies
- **Failure mode:** Party KO → game over screen → reload from save. Individual party member KO → can be revived in battle or at rest point. Attrition is the real threat.

#### Aesthetics
- **Default style era:** NES/SNES (golden age of JRPGs)
- **Palette tendencies:** Overworld bright and varied. Dungeons thematic. Battle screens match current location. UI/menus heavily styled (the RPG menu IS a core visual element).
- **Music cadence:** Overworld theme, town theme, dungeon theme, battle theme (most-heard track — must be excellent), boss theme, victory fanfare, defeat theme. Music is emotional architecture.
- **Sound design priorities:** Battle select sound (menu), attack hit, magic effect, level up fanfare, damage taken, victory fanfare, item use. Menu sounds get heard thousands of times — must not be annoying.

#### Genre Shift Interface
- **Shift triggers away:** Army/faction leadership → RTS. Political negotiation → Stage encounter. Action sequence requiring reflexes → Platformer or Beat-em-up (Chrono Trigger did this). Vehicle/airship sequence → Racing or Shmup.
- **Unique dual-cluster note:** RPG already uses TWO clusters (2 for overworld, 3 for battle). This is the paradigm's defining structural feature. Genre shifts to other paradigms may replace the battle system (real-time action instead of menus) or the overworld (strategic map instead of walking).

---

### FIGHTING GAME
**Engine cluster:** 3 (Stage/Arena Screen)
**Canonical references:** Street Fighter II, Mortal Kombat, Fatal Fury, Samurai Shodown, Killer Instinct

#### Temporal Structure
- **Unit hierarchy:** Moment (exchange/combo, 2-8s) → Round (one round of a match, 30-90s) → Match (best of 3 rounds, 2-5min) → Tournament bracket or story ladder (series of matches, 20-60min) → Game
- **Episode = Tournament round or story chapter.** CAS ticks between matches.
- **Session pacing:** 4-8 matches per 30-min session

#### Sequencing Grammar
- **Teachability window:** First opponent teaches basic mechanics (can be beaten with fundamentals). Each subsequent opponent introduces one new challenge requiring one new skill.
- **Rhythm cadence:** 10-20 seconds per exchange within a round. Rounds themselves are the macro rhythm — win/loss/adaptation cycle. Between rounds is the relief (brief, but critical for adjustment).
- **Directionality model:** Simple — defeat opponent. "Forward" is the tournament bracket or story ladder. No spatial exploration. Progress = win.
- **Canonical spatial moves:**
  - The opener (neutral game, spacing, feeling out opponent)
  - The punish (opponent whiffs, player capitalizes — teaches reaction)
  - The mix-up (ambiguous attack requiring read — teaches prediction)
  - The comeback (low health, high damage options — teaches clutch play)
  - The set piece (stage-specific environmental interaction — stage edge, hazard)
- **Introduction sequence:** Opponent uses move in predictable pattern → player learns to counter → opponent mixes up timing/spacing

#### Social Surface
- **Type:** Violence AS social conversation — every fight IS a social interaction
- **Surface locations:** Pre-match (face-off dialogue, trash talk, respect), post-match (winner/loser interaction — spare, humiliate, befriend), between-tournament-rounds (lobby/waiting area — alliances, intelligence, intimidation), rival cutscenes
- **Communication triggers:** Vulnerability (defeated opponent on the ground — spare?), rivalry (repeated matches build history), shared circumstance (both in same bracket against common enemy), respect (close match creates mutual recognition)
- **Between-episode window:** Match result → post-fight interaction (approach defeated opponent, or winner approaches you) → bracket update (who's fighting who, alliance opportunities) → next match prep. Between-tournament: full social window.
- **Social expression through mechanics:** Fighting style as personality. Holding back (not using full combo = mercy). Taunting. Specific move choices signal intent. Ring-outs vs. clean KO. Post-match animations (help opponent up vs. walk away). Character select itself is a social signal.

#### CAS Integration
- **Tick spec:** Full evaluation between matches. Light tick between rounds of a match (just updating disposition based on fight events).
- **Behavioral legibility rules:**
  - Opponent respect for player > 0.7 → fights seriously, uses best moves, bows before match
  - Opponent respect < 0.3 → taunts, showboats, fights recklessly
  - Opponent loyalty to faction > 0.7 → fights to win at all costs, won't throw match
  - Opponent loyalty < 0.4 → may throw match if it serves their actual goals (alliance with player, defection)
  - Fear of player > 0.7 → defensive, turtle strategy, tries to avoid engagement
- **Drama density threshold:** 1 per match (a single story beat — a rival relationship moment, a faction betrayal, a surprising alliance). Every match should feel like it has stakes beyond the bracket.
- **Drama density calibration:** Fights tell the story. The social ecology is expressed through who fights whom, how they fight, and what happens after. Keep the between-match social windows focused and high-impact.

#### Physics & Mechanics
- **Parameter ranges:**
  - HP: 100-200 per round
  - Attack damage: 5-30% of HP per combo
  - Move speed: 2-5 (walk), 6-10 (dash)
  - Frame data: startup (3-15f), active (2-5f), recovery (10-30f)
  - Combo length: 2-8 hits
  - Round timer: 60-99 seconds
- **Core mechanics:** Move (walk, dash, jump, crouch), attack (light/medium/heavy, standing/crouching/aerial), special moves (input commands), block, grab/throw
- **Difficulty expression:** Opponent complexity (simple patterns → mix-ups → frame traps → full reads), damage output, AI reaction speed
- **Failure mode:** KO → lose round. Lose match → tournament consequences. Continue or game over.

#### Aesthetics
- **Default style era:** SNES / Genesis / Arcade (fighting games were arcade-first)
- **Palette tendencies:** Character-focused. Each fighter has a distinct color identity. Stages atmospheric and location-specific. High contrast for readability during fast action.
- **Music cadence:** Per-stage themes that match fighter/location energy. Character themes for story mode. Final boss theme dramatically different.
- **Sound design priorities:** Hit impact (layered — light/medium/heavy must FEEL different), special move activation, KO sound, announcer voice, character grunts/shouts.

#### Genre Shift Interface
- **Shift triggers away:** Tournament reveals larger conspiracy → RPG or Action-adventure. Fighter builds army of followers → RTS. Fighter enters vehicle chase → Racing. Fighter infiltrates compound → Platformer or FPS.
- **Shift FROM other paradigms:** Face-to-face confrontation in ANY paradigm can shift to fighting. The stage/arena is the universal space for direct personal conflict.

---

### RTS (Real-Time Strategy)
**Engine cluster:** 7 (Strategic Map)
**Canonical references:** Warcraft I & II, Dune II, StarCraft, Herzog Zwei

#### Temporal Structure
- **Unit hierarchy:** Moment (micro-engagement, 5-15s) → Skirmish (tactical encounter, 1-3min) → Phase (build → expand → attack cycle, 5-10min) → Mission (complete map/scenario, 20-60min) → Campaign → Game
- **Episode = Mission.** CAS ticks continuously during missions (30-60s timer + event-driven) and fully between missions.
- **Session pacing:** 1-3 missions per 45-60min session

#### Sequencing Grammar
- **Teachability window:** New unit type or mechanic introduced in low-pressure mission before appearing in coordinated opposition. First mission with new unit should guarantee safe context to experiment.
- **Rhythm cadence:** 5-10 minute macro cycles (build phase → scouting → engagement → consolidation). Micro-engagements within those cycles at 30-60 second cadence. The build/fight rhythm IS the RTS heartbeat.
- **Directionality model:** Map design + fog of war. Scouted territory = known direction. Natural scouting paths guide expansion. Resource placement creates implicit direction (expand toward resources). Enemy base visible on minimap once scouted.
- **Canonical spatial moves:**
  - The forward base (staging ground before major push — commit resources to new position)
  - The chokepoint (narrow passage forcing tactical decision — attack through or go around)
  - The resource denial (cutting off enemy economy — map control expressed as economic pressure)
  - The flank (spatial surprise — force from unexpected direction)
  - The siege (sustained pressure on fortified position — attrition as spatial contest)
  - The base defense (enemy pushes back — test of infrastructure and positioning)
- **Introduction sequence:** New unit in solo mission (learn its capabilities) → new unit against known enemies → new unit against counter-unit (learn weaknesses)

#### Social Surface
- **Type:** Constant — social interaction is woven into every moment of RTS gameplay
- **Surface locations:** Diplomatic channels (real-time communication with allies/enemies), unit loyalty (individual high-value units have personalities), intelligence reports (scouts bring back information + social intelligence), between-mission briefings
- **Communication triggers:** All types active simultaneously. RTS is the paradigm with the highest social bandwidth. You're commanding entities who have opinions, receiving intelligence from scouts who may be compromised, negotiating with enemies in real-time, and managing internal faction loyalty — all while building and fighting.
- **Between-episode window:** Mission debrief → strategic map (campaign progress, territory control, faction dynamics) → intelligence briefing (CAS narrative) → next mission briefing → deployment
- **Social expression through mechanics:** Unit obedience/response time reflects loyalty. Ally AI coordination quality reflects alliance strength. Enemy tactical adaptation reflects their intelligence quality (compromised intelligence = predictable enemy). Defection of high-value enemy units (they cross the battlefield). Resource trade with allies. Deliberate friendly-fire incidents from disloyal units. Surrender of enemy positions without fight (morale collapse).

#### CAS Integration
- **Tick spec:** Continuous — 30-60 second timer for regular evaluation PLUS event-driven ticks on major events (base destroyed, unit defection, territory change, diplomatic offer). Between missions: full evaluation with slower, deeper processing.
- **Behavioral legibility rules:**
  - Unit loyalty > 0.7 → obeys commands immediately, fights effectively
  - Unit loyalty 0.4-0.7 → slight response delay, less aggressive, may hesitate at dangerous orders
  - Unit loyalty < 0.4 → significant response delay, may refuse suicidal orders, candidate for defection
  - Allied faction cohesion > 0.7 → coordinates attacks, shares intelligence, defends your positions
  - Allied faction cohesion < 0.4 → acts independently, may pull back from joint operations
  - Enemy faction morale < 0.3 → units surrender or flee when outnumbered, bases may be abandoned
  - Information accuracy degrades with intelligence network compromise
- **Drama density threshold:** 3-5 per mission. RTS can handle high density because the player is already in a strategic mindset processing multiple streams of information. Diplomatic messages, unit defections, faction shifts — these are CONTENT in RTS, not interruptions.
- **Drama density calibration:** The social ecology IS the gameplay in RTS more than any other paradigm except management sim. Don't separate "the strategy game" from "the social ecology" — they're the same thing. Every tactical decision has social consequences. Every social development changes tactics.

#### Physics & Mechanics
- **Parameter ranges:**
  - Unit move speed: 1-5 tiles/second (scouts fast, siege slow)
  - Unit HP: 10-500 (scaled by unit type)
  - Attack damage: varies by type (anti-infantry, anti-armor, siege, etc.)
  - Resource gather rate: defines economic pacing
  - Build time: 10-120 seconds per structure/unit
  - Population cap: 50-200 units
- **Core mechanics:** Select (click units/buildings), command (move, attack, patrol, hold), build (place structures), train (produce units), research (upgrade), diplomacy (negotiate with factions)
- **Difficulty expression:** Enemy economic advantage, better unit composition, faster aggression timing, more factions to manage simultaneously, information disadvantage
- **Failure mode:** Base destroyed → mission failure. Or: objectives not met within time/conditions. Soft failure: losing territory, losing units, economic collapse (recoverable but painful).

#### Aesthetics
- **Default style era:** PC early-mid 90s (Warcraft II, Dune II aesthetic)
- **Palette tendencies:** Faction colors critical (each faction clearly colored). Terrain readable (grass, forest, water, mountain, built). UI heavy (resource bars, minimap, unit info).
- **Music cadence:** Ambient during building phases, intensifies during combat. Faction-specific themes. Victory/defeat distinct.
- **Sound design priorities:** Unit acknowledgment ("ready," "yes sir"), attack sounds, building complete, resource gathered, alert (under attack!), death sounds. Unit voice lines are personality.

#### Genre Shift Interface
- **Shift triggers away:** Player enters battlefield personally → Platformer, Beat-em-up, or FPS (zooming in). Diplomatic summit → Stage encounter. Player manages economy/civilization → Management sim (intra-cluster). Key unit/hero separated from army → Action-adventure.
- **Shift FROM other paradigms:** ANY paradigm where player accumulates followers/army → RTS. This is the "you've earned an army" paradigm.

---

### MANAGEMENT SIM
**Engine cluster:** 7 (Strategic Map)
**Canonical references:** SimCity, Civilization (early), Theme Park, Railroad Tycoon

#### Temporal Structure
- **Unit hierarchy:** Decision (single placement/policy, instant) → Turn/Tick (time advancement, 1-5min real-time) → Era/Year (major progress checkpoint, 10-30min) → Campaign/Scenario (complete game arc, 2-10hrs) → Game
- **Episode = Era/Year.** CAS ticks on decision points and at regular time intervals.
- **Session pacing:** 2-4 eras per 45-60min session. Management sims are long-session games.

#### Sequencing Grammar
- **Teachability window:** New mechanic/system introduced via tutorial prompt or low-stakes first opportunity. Management sims have the longest teachability windows — entire eras can serve as teaching periods.
- **Rhythm cadence:** Variable, player-controlled. Peaceful building periods → crisis events → response → new equilibrium. The player controls time speed, so rhythm is semi-voluntary. Crises create involuntary tension spikes.
- **Directionality model:** Goal-directed rather than spatial. "Forward" = toward scenario objectives (population target, revenue goal, defense threshold). Progress meters, advisor feedback, and milestone notifications provide directionality. Spatial expansion is secondary direction.
- **Canonical spatial moves:**
  - The foundation (establishing base infrastructure — water, power, roads, essential buildings)
  - The expansion (growing into new territory — requires resource investment)
  - The crisis (external threat or internal failure demanding immediate response)
  - The optimization (refining existing systems for efficiency — the satisfying "getting it right" loop)
  - The pivot (fundamental strategic shift in response to changed conditions)
  - The milestone (reaching a threshold — new abilities, new challenges unlock)
- **Introduction sequence:** System available with clear benefit → system required for specific challenge → system interacts with other systems creating emergent complexity

#### Social Surface
- **Type:** Systemic — social interaction IS the management interface. Every policy decision IS a social decision.
- **Surface locations:** Advisor consultations, citizen/population feedback, diplomatic channels (if multi-faction), zoom-in face-to-face (walking through your city/park/castle at street level), event responses
- **Communication triggers:** Policy consequences (citizens react to decisions), crisis events (demand response, create social pressure), milestone achievements (celebrations, political capital), advisor disagreements (competing priorities), external faction diplomacy
- **Between-episode window:** Era transition → comprehensive report (stats, social dynamics, faction shifts, advisor summary) → new era briefing (emerging challenges, opportunities) → player sets new priorities
- **Social expression through mechanics:** Population happiness/unrest as direct CAS expression. Advisor loyalty and reliability reflect CAS faction state. Resource allocation as social choice (fund military vs. schools). Protests/celebrations as visual CAS manifestation. Immigration/emigration as population response to management quality. Political factions forming within your population.

#### CAS Integration
- **Tick spec:** Continuous ticks on every meaningful decision point. Time-based ticks at regular intervals (every in-game month/quarter/year). Event-driven ticks on crises, milestones, and diplomatic events. Management sim has the highest tick frequency of any paradigm because every decision potentially shifts social dynamics.
- **Behavioral legibility rules:**
  - Population happiness > 0.7 → growth, productivity, positive events, citizen celebrations
  - Population happiness 0.4-0.7 → stable, occasional complaints, advisor warnings
  - Population happiness < 0.4 → protests, emigration, service disruption, potential revolt
  - Faction loyalty > 0.7 → faction cooperates with policies, supports expansion
  - Faction loyalty < 0.4 → faction obstructs, may sabotage, demands concessions
  - Advisor reliability correlates with advisor faction loyalty — compromised advisors give bad intel
  - External faction disposition > 0.5 → trade opportunities, alliance offers
  - External faction disposition < -0.5 → embargo, border tension, potential invasion
- **Drama density threshold:** 2-4 per era. Management sims sustain continuous low-level social dynamics (population mood, faction shifts) with periodic high-intensity events (crises, diplomatic incidents, internal revolts). The baseline hum of social dynamics IS the gameplay — it's not interrupting anything.
- **Drama density calibration:** This is the paradigm where the social ecology is most explicitly the game. The player IS managing social dynamics. CAS state is directly visible in population metrics, faction alignment charts, and advisor behavior. Don't hide it — surface it as the primary interface.

#### Physics & Mechanics
- **Parameter ranges:**
  - Time scale: adjustable (1x to 100x)
  - Resource types: 2-8 (money, food, materials, energy, etc.)
  - Population capacity: 10-100,000+ (scales with progression)
  - Building types: 10-50+
  - Policy levers: 5-20 (tax rate, service funding, zoning, etc.)
- **Core mechanics:** Place (buildings, infrastructure), zone (designate areas), set policy (sliders, toggles, budget allocation), research/upgrade, time control (speed up, pause), inspect (zoom in, check status), respond to events
- **Difficulty expression:** Tighter budgets, more demanding population, natural disasters, hostile neighbors, competing faction demands, infrastructure decay
- **Failure mode:** Bankruptcy, population collapse, overthrow/recall, disaster response failure. Often soft failure — gradual decline rather than game over screen. The game can continue in a degraded state, which is emotionally worse than a clean death.

#### Aesthetics
- **Default style era:** PC early 90s (SimCity 2000 aesthetic, or SNES for console equivalents)
- **Palette tendencies:** Clean, readable, icon-driven. Color coding for zone types, health, efficiency. Zoom levels have different detail (macro = abstract, micro = detailed).
- **Music cadence:** Ambient, calm during building. Tension during crises. Shifts with era/prosperity level. Background music that doesn't compete with the constant decision-making.
- **Sound design priorities:** Placement confirmation, alert/alarm, population ambient (happy chatter vs. angry protest), construction, milestone fanfare, advisor chime.

#### Genre Shift Interface
- **Shift triggers away:** Player walks through their city/kingdom at street level → Cluster 1 or 2 (platformer or action-adventure). War declared → RTS. Face-to-face diplomacy → Stage encounter. Intelligence mission → FPS or Platformer stealth. Personal combat (assassination attempt, etc.) → Fighting.
- **Intra-cluster shifts:** RTS (war phase), Tactics (specific battle management)
- **Unique zoom mechanic:** Management sim is the paradigm most likely to use fluid zoom as genre shift. Zoomed out = strategic management. Zoomed in = action-adventure walking through your world. This should feel seamless, not like a paradigm change — but the interaction grammar shifts from policy to direct action as you zoom in.

---

### FPS (First-Person Shooter)
**Engine cluster:** 6 (Raycasting First-Person)
**Canonical references:** Wolfenstein 3D, Doom, System Shock, early Quake

#### Temporal Structure
- **Unit hierarchy:** Moment (encounter/room, 10-30s) → Section (corridor/area with thematic identity, 2-5min) → Level (complete map, 10-30min) → Episode (grouped levels, 1-3hrs) → Game
- **Episode = Level.** CAS ticks between levels and at major in-level events (key pickups, area transitions).
- **Session pacing:** 2-4 levels per 30-45min session

#### Sequencing Grammar
- **Teachability window:** Enemy type introduced at range before close quarters. New weapon introduced with ample ammo before scarcity.
- **Rhythm cadence:** 60-90 second tension cycles. Relief = cleared room (safe to explore, find supplies). Tension = combat encounter, navigation under threat.
- **Directionality model:** Landmark-based. Key architectural features serve as navigation anchors. Player should never be in a space without a visible landmark or recognizable feature. Color coding and lighting guide without feeling artificial.
- **Canonical spatial moves:**
  - The ambush room (enemies triggered by entry — teaches room-reading)
  - The hub (central space with radiating paths — orientation anchor)
  - The key hunt (exploration with clear objective — find the red key)
  - The arena (large open space — positional combat, dodging, circle-strafing)
  - The corridor (tight space, enemies around corners — close-quarters tension)
  - The overlook (visible but unreachable area — shows future destination or secret)
- **Introduction sequence:** Enemy at range in open room → same enemy in corridors → enemy combined with environmental hazard

#### Social Surface
- **Type:** Embedded in environment + interruptive at boundaries
- **Surface locations:** Between levels (briefing, debriefing, base of operations), in-level friendly NPCs (rare — System Shock-style audio logs, friendly soldiers, informants), enemy surrender/negotiation (contextual), environmental storytelling (graffiti, logs, evidence of faction state)
- **Communication triggers:** Vulnerability (cornered enemies), discovery (finding faction intelligence/evidence), status (friendly NPCs in safe areas), environmental (reading the story the level tells about what happened here)
- **Between-episode window:** Level complete → base/briefing (mission debrief, CAS updates, next mission context, social interactions with allies) → next mission
- **Social expression through mechanics:** Enemy alertness (alarmed or patrolling vs. relaxed/distracted based on CAS state). Environmental damage reflecting faction conflict. Audio logs/messages from characters. Graffiti and propaganda on walls. Friendly NPCs providing intel or blocking paths based on disposition. Enemy composition varying based on which faction controls the area.

#### CAS Integration
- **Tick spec:** Full evaluation between levels. Medium tick on area transitions within levels. Light tick on significant combat events (mini-boss defeated, key area secured).
- **Behavioral legibility rules:**
  - Enemy alertness: awareness > 0.7 → actively searching, calling for backup
  - Enemy morale < 0.3 → runs when alone, surrenders when cornered
  - Faction control of area → determines enemy density, equipment quality, fortification level
  - Friendly NPCs: disposition > 0.5 → shares information, provides ammo/health
  - Environmental state: faction in control → maintained, clean, fortified. Faction losing control → damaged, chaotic, abandoned
- **Drama density threshold:** 1-2 per level. FPS is action-primary. Social ecology manifests through environmental storytelling and enemy behavior more than dialogue. One major revelation or faction event per level is enough.
- **Drama density calibration:** Show, don't tell. The FPS player reads the world through their crosshairs. A room of surrendering enemies tells more story than a cutscene. An abandoned outpost with signs of hasty retreat tells a faction story. The first-person perspective makes environmental storytelling visceral — you're IN the evidence.

#### Physics & Mechanics
- **Parameter ranges:**
  - Move speed: 4-8 tiles/second (FPS characters are fast — Doom speed, not modern tactical)
  - Turn speed: responsive (retro FPS is twitchy)
  - Weapon damage: varies by type (pistol light, shotgun heavy, rocket devastating)
  - Enemy HP: 1 (grunt) to 100+ (boss)
  - Ammo scarcity: defines game's resource economy
  - Player HP: 100-200, armor separate
- **Core mechanics:** Move (WASD), look/aim, shoot, switch weapons, use/interact (doors, switches, pickups), optional: strafe, jump, crouch
- **Difficulty expression:** More enemies, tougher enemies, less ammo/health, more complex level navigation, faster enemies, ambush frequency
- **Failure mode:** Death → reload from save or level start. Health/ammo attrition as ongoing pressure.

#### Aesthetics
- **Default style era:** PC early-mid 90s (Wolfenstein through Quake aesthetic)
- **Palette tendencies:** Dark and atmospheric. Color used for wayfinding (red key door, blue key door). Faction-specific environmental decoration. Lighting as mood tool.
- **Music cadence:** Intense during combat, ambient during exploration. Level-specific themes. Boss encounters musically distinct. Some FPS use dynamic music (intensity scales with combat).
- **Sound design priorities:** Weapon fire (each weapon must have distinct, satisfying sound), enemy alert/death, door open, pickup collect, ambient environmental (dripping, machinery, distant combat), player damage.

#### Genre Shift Interface
- **Shift triggers away:** Player exits building to strategic view → RTS or Management sim. Face-to-face negotiation → Stage encounter. Vehicle section → Racing. Player in open field → Platformer or Action-adventure.
- **Shift FROM other paradigms:** Infiltration, interior exploration, close-quarters combat in ANY paradigm → FPS. The first-person perspective creates claustrophobia and immediacy that other cameras can't match.

---

### FIRST-PERSON ADVENTURE
**Engine cluster:** 6 (Raycasting First-Person)
**Canonical references:** Myst, Shadowgate, Snatcher, early King's Quest (3D sections)

#### Temporal Structure
- **Unit hierarchy:** Interaction (examine/use object, 10-60s) → Puzzle (complete challenge, 2-15min) → Area (thematically connected space, 15-45min) → Act/Chapter (narrative arc, 1-3hrs) → Game
- **Episode = Area or act.** CAS ticks on puzzle completion, significant discoveries, and area transitions.
- **Session pacing:** 1-2 areas per 30-60min session. Adventure games are contemplative — players take their time.

#### Sequencing Grammar
- **Teachability window:** Long — entire areas can serve as tutorials. First puzzles establish the logic system the game uses. Subsequent puzzles build on established logic.
- **Rhythm cadence:** Variable, player-controlled. Exploration (low tension, discovery) → puzzle (rising tension, working toward solution) → solution (satisfaction spike) → exploration. Player controls pace entirely. No time pressure except in rare designed moments.
- **Directionality model:** Environmental storytelling + curiosity-driven. Locked doors signal "come back later." Visible-but-unreachable spaces motivate exploration. Story fragments pull player forward. The world IS the puzzle — directionality comes from understanding the world's logic.
- **Canonical spatial moves:**
  - The locked passage (visible barrier with implied solution — drives exploration)
  - The clue room (observation space — look carefully, information is here)
  - The mechanism (interactive puzzle — manipulate world elements to progress)
  - The revelation (solving a puzzle reveals new understanding of the world/story)
  - The hub (central space connecting multiple puzzle paths)
- **Introduction sequence:** Observe mechanism in safe context → experiment with mechanism → use mechanism under narrative pressure or in combination

#### Social Surface
- **Type:** Deeply integrated — conversation and investigation are primary mechanics
- **Surface locations:** NPC encounters throughout (conversation IS the gameplay), environmental storytelling (read letters, journals, inscriptions), companion dialogue, interrogation/interview scenes
- **Communication triggers:** Discovery (finding evidence triggers new dialogue options), reputation (NPCs share more as trust builds), investigation (asking the right questions), environmental (responding to what you've found)
- **Between-episode window:** Chapter transitions with narrative summary, relationship development, new areas unlocking based on information gathered
- **Social expression through mechanics:** NPCs provide puzzle hints based on disposition. Higher trust = better hints. NPC lies (low disposition or adversarial) create puzzle red herrings. Environmental changes reflect CAS state (signs of faction activity, altered spaces). Information from NPCs is the primary resource — the social graph IS the puzzle.

#### CAS Integration
- **Tick spec:** Event-driven — ticks on puzzle completion, significant dialogue choices, discovery of key information. No time-based ticks (adventure games don't have real-time pressure by default).
- **Behavioral legibility rules:**
  - NPC helpfulness scales directly with disposition (0 to 1 → vague to explicit hints)
  - NPC honesty scales with loyalty (< 0.3 → may provide false information)
  - Environmental state reflects faction control (well-maintained vs. decaying)
  - Locked/unlocked paths may depend on faction state (allied faction opens doors for you)
- **Drama density threshold:** 1-2 per area. Adventure games have high narrative density but low event density. Each discovery should feel earned and meaningful. Don't rush the player.
- **Drama density calibration:** The adventure paradigm is where the social ecology can be most nuanced and literary. Characters can have complex motivations expressed through dialogue. The pace allows subtlety. This is the paradigm where the CAS produces its most psychologically rich content.

#### Physics & Mechanics
- **Parameter ranges:**
  - Move speed: 1-3 tiles/second (deliberate, exploratory pace)
  - Interaction range: 1-2 tiles (must be close to examine things)
  - Inventory capacity: 10-30 items
  - Puzzle complexity: 1-5 steps per solution
- **Core mechanics:** Move (slow, deliberate), look/examine (primary verb — look at everything), use (item on object or object on object), take (add to inventory), talk (extensive dialogue trees), combine (items with each other)
- **Difficulty expression:** Puzzle complexity, information scarcity, red herrings, multi-step solutions, non-obvious connections
- **Failure mode:** Usually none — adventure games typically don't have "death" (Myst). Some have fail states (Shadowgate). Failure is more often "stuck" — unable to progress without the right insight.

#### Aesthetics
- **Default style era:** PC early-mid 90s (Myst aesthetic — detailed, atmospheric, static-beautiful)
- **Palette tendencies:** Atmospheric, location-driven. Rich detail in examination scenes. Mood-driven lighting. Each area has a distinct visual identity.
- **Music cadence:** Ambient, atmospheric. Location-specific. Minimal — silence is a tool. Music swells for discoveries and revelations. No combat music (usually).
- **Sound design priorities:** Environmental ambient (wind, water, machinery — the world is alive), interaction feedback (click, mechanism, door), discovery chime, dialogue voice (if voiced), musical stings for revelations.

#### Genre Shift Interface
- **Shift triggers away:** Physical threat → FPS or Platformer (flee or fight). Managing discovered settlement → Management sim. Leading discovered faction → RTS or Action-adventure. Direct confrontation → Fighting (stage encounter).
- **Shift FROM other paradigms:** Investigation, puzzle-solving, mystery elements in ANY paradigm → First-person adventure. The contemplative perspective for when you need to think, not fight.

---

### TACTICS / SRPG
**Engine cluster:** 7 (Strategic Map)
**Canonical references:** Fire Emblem, Advance Wars, Shining Force, Ogre Battle, Final Fantasy Tactics

#### Temporal Structure
- **Unit hierarchy:** Action (single unit move/attack, 5-15s) → Turn (all units act, 1-5min) → Battle (complete engagement, 15-45min) → Chapter (narrative arc with multiple battles, 1-3hrs) → Game
- **Episode = Chapter (narrative arc containing 2-4 battles).** CAS ticks between battles and on significant in-battle events.
- **Session pacing:** 1-3 battles per 30-45min session

#### Sequencing Grammar
- **Teachability window:** First battle with new unit type is low-stakes (no permadeath risk, clear advantage). New mechanics introduced via battlefield conditions, not abstract tutorials.
- **Rhythm cadence:** Turn-by-turn — each turn is a micro-cycle of assessment → decision → execution → consequence. Macro rhythm: early turns (positioning) → mid-battle (engagement) → late battle (decisive moves).
- **Directionality model:** Objective-driven. Map design communicates objectives through placement (defend this point, reach that point, defeat that commander). Terrain communicates tactical opportunity (high ground, chokepoints, cover).
- **Canonical spatial moves:**
  - The defensive line (hold position against advancing enemies — teaches positioning)
  - The flank (attack from the side — teaches movement + attack coordination)
  - The rescue (reach endangered ally — teaches urgency + pathfinding under pressure)
  - The boss position (heavily defended commander — teaches focus fire + support tactics)
  - The trap (enemy ambush — teaches caution and terrain reading)
- **Introduction sequence:** New unit in favorable matchup → new unit in neutral matchup → new unit in unfavorable matchup (teaching when NOT to use it)

#### Social Surface
- **Type:** Deeply woven — unit relationships ARE gameplay mechanics
- **Surface locations:** Pre-battle (camp conversations, unit recruitment, strategic planning), mid-battle (unit dialogue on adjacency, support conversations), post-battle (aftermath, promotion, loss grieving), between-chapter (full social hub — town, castle, camp)
- **Communication triggers:** Adjacency (units near each other trigger support conversations), victory/defeat (post-battle emotional states), unit loss (permadeath creates grief/anger in connected units), promotion (power shifts within player's force)
- **Between-episode window:** Battle aftermath → camp/social hub (full social processing — mourning losses, celebrating victories, faction dynamics, recruitment, relationship development) → next chapter briefing → deployment selection (WHO you bring matters)
- **Social expression through mechanics:** Support bonuses (adjacent allies fight better — relationship expressed as combat stats). Unit refusal (low morale unit won't advance into danger). Permadeath grief (connected units get stat debuffs after ally death). Recruitment success based on reputation. Unit dialogue during combat revealing personality and faction loyalty. Deployment selection itself is a social decision — who do you trust?

#### CAS Integration
- **Tick spec:** Full evaluation between battles and between chapters. Medium tick on significant in-battle events (unit death, commander defeated, objective achieved). Light tick per turn (updating unit morale based on battle state).
- **Behavioral legibility rules:**
  - Unit morale > 0.7 → full combat effectiveness, aggressive positioning
  - Unit morale 0.4-0.7 → normal effectiveness, may hesitate at risky moves
  - Unit morale < 0.4 → reduced effectiveness, may refuse advance orders, may retreat
  - Unit loyalty < 0.3 → candidate for defection mid-battle (crosses to enemy side)
  - Support bond > 0.7 → stat bonus when adjacent, will protect bonded unit
  - Enemy commander morale < 0.3 → may surrender, ending battle early
- **Drama density threshold:** 2-3 per battle (unit support dialogue, loyalty crisis, tactical surprise from CAS state). 3-5 per chapter including between-battle social events.
- **Drama density calibration:** Tactics games are inherently personal — each unit is a character you've invested in. The social ecology should emphasize individual unit stories within the larger conflict. Permadeath makes every relationship feel weighty.

#### Physics & Mechanics
- **Parameter ranges:**
  - Grid size: 15x15 to 30x30 tiles per map
  - Unit move range: 3-8 tiles per turn (varies by type)
  - HP: 20-80 per unit
  - Damage: weapon type × stat difference × terrain modifier
  - Unit roster: 8-20 available, deploy 6-12 per battle
  - Turn timer: none (player thinks as long as needed)
- **Core mechanics:** Select unit, move (grid-based, terrain cost), attack (adjacent or ranged), use item, wait (end turn in position), special ability (class-specific), talk (mid-battle dialogue with adjacent units or enemies)
- **Difficulty expression:** Numerical disadvantage, terrain disadvantage, time pressure (turn limits), permadeath stakes, fog of war, reinforcement waves
- **Failure mode:** Key unit death (in permadeath games, a personal loss even if battle is won), battle loss (mission failure, retreat), game over if protagonist dies.

#### Aesthetics
- **Default style era:** SNES / GBA (Fire Emblem, FFT aesthetic)
- **Palette tendencies:** Clean tactical readability. Faction colors on units. Terrain clearly coded. Grid visible but not ugly. Character portraits in dialogue are high-detail (emotional close-ups for social moments).
- **Music cadence:** Player phase (your turn) vs. enemy phase themes. Tension builds through battle. Individual unit themes for key characters. Recruitment/social themes warm and personal.
- **Sound design priorities:** Unit move, attack impact (satisfying), critical hit (special sound), unit death (gut-punch), level up, dialogue blip, map cursor movement.

#### Genre Shift Interface
- **Shift triggers away:** Single unit goes on solo mission → Platformer, Action-adventure, or FPS. Diplomatic summit → Stage encounter. Managing conquered territory → Management sim. Hero charges enemy line personally → Beat-em-up or Fighting.
- **Intra-cluster shifts:** RTS (real-time battle phase), Management sim (territory management between battles)

---

## Part 4: Paradigms NOT Given Full Specs (Handled as Variants)

These player-facing paradigms exist but don't need dedicated specs. They're parameter variants of the paradigms above:

| Player Sees | Actually Running | Key Parameter Differences |
|---|---|---|
| **Run-and-gun** (Contra, Metal Slug) | Platformer (Cluster 1) | Add projectile system, forced scroll option, higher enemy density |
| **Cinematic action** (Ninja Gaiden) | Platformer (Cluster 1) | Add cutscene triggers, higher difficulty, narrative interleaving |
| **Top-down action** (Gauntlet) | Action-adventure (Cluster 2) | Remove puzzle/key systems, continuous enemy waves, simplified interaction |
| **Top-down racing** (RC Pro-Am) | Action-adventure (Cluster 2) | Vehicle physics, track tiles, race scoring instead of combat |
| **Sports** (Tecmo Bowl, NBA Jam) | Cluster 2 or 3 depending on perspective | Sport-specific rules, team roster, season/tournament structure |
| **Fixed-screen arcade** (Bubble Bobble) | Fighting Game (Cluster 3) | Platform physics, wave-based enemies, score system, no vs. structure |
| **Puzzle** (Tetris, Dr. Mario) | Fighting Game (Cluster 3) | Piece manipulation instead of combat, clear condition instead of KO |
| **Vertical shmup** (1942) | Shmup (Cluster 4) | Rotate coordinate system 90° |
| **Driving action** (Road Rash) | Racing (Cluster 5) | Add melee combat during racing |
| **FP dungeon crawler** (Eye of the Beholder) | FPS or FP Adventure (Cluster 6) | Grid movement, turn-based combat, party management |

These variants inherit the full paradigm spec of their parent, with documented parameter overrides.

---

## Appendix: Build Priority

Based on engine cluster complexity, social surface richness, and paradigm diversity:

| Priority | Cluster | Paradigms Unlocked | Rationale |
|---|---|---|---|
| **1st** | Cluster 1: Side-View Tile | Platformer, Beat-em-up, Run-and-gun | Launch paradigm. Most familiar. Largest game library for reference. |
| **2nd** | Cluster 3: Stage/Arena | Fighting, RPG Combat, Fixed-screen | Gives social encounter space. RPG combat is high-demand. |
| **3rd** | Cluster 2: Top-Down Tile | Action-adventure, RPG overworld, Top-down racing/sports | Massive paradigm expansion. Zelda + RPG = huge player base. |
| **4th** | Cluster 7: Strategic Map | RTS, Tactics, Management Sim | Deepest social ecology expression. Complex but high-reward. |
| **5th** | Cluster 5: Pseudo-3D | Racing, Driving action | Unique visual feel. Racing social ecology is distinctive. |
| **6th** | Cluster 4: Scrolling Shooter | Shmup (H + V) | Mechanically pure. Social ecology is minimal but elegant. |
| **7th** | Cluster 6: Raycasting FP | FPS, FP Adventure, Dungeon crawler | Most technically complex renderer. High impact when added. |
