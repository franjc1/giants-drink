# Decisions Log — Thread 17 Additions

**Append these to the existing decisions-log.md after Decision 121.**

---

## Thread 17 — ROM Transformation Breakthrough (2026-03-28)

### Decision 122: Retroactively Constructed Modding API as Central Extraction Artifact

**Context:** Modern games (Skyrim, Minecraft) have modding APIs that expose game internals through labeled, semantic interfaces. NES ROMs have no such APIs — just raw bytes. Previous extraction pipeline attempts produced static maps or manifests. The question: what should the extraction pipeline actually produce?

**Decision:** The extraction pipeline's primary output is a **game-specific modding API** — a JavaScript module with callable functions that map semantic concepts to specific RAM/VRAM/OAM operations. Example: `mario.setHealth(n)` wraps a write to $075A. `level.warp(world, level)` wraps a multi-address write sequence including area pointer computation. The API is generated per-game by Claude's PRG comprehension, validated by automated testing, and consumed by the Orchestrator at runtime.

**Rationale:** A modding API is a usable tool, not a report. It can be imported by any downstream system. It encodes not just "what address does what" but "what's the safe value range" and "what dependencies exist between addresses." It's the format that makes per-game knowledge reusable across the platform. Validated on SMB (9/9 transformation tests passing) and MM2 (bank-switched ROM, code injection working).

---

### Decision 123: Orchestrator as Third Processor in CPU/PPU Frame Cycle

**Context:** The NES has two processors (CPU and PPU) coordinating through a strict frame cycle. Modifying a running game requires participating in that cycle, not observing from outside.

**Decision:** The Orchestrator operates as a third processor peer to the CPU and PPU, hooked into the emulator's frame cycle via callbacks. After each frame: read game state from RAM, apply suppression/modification/addition rules, write changes before the next frame renders. Two timescales: fast path (per-frame rule execution, nanosecond cost) and slow path (LLM consultation on significant events, seconds-scale, async).

**Rationale:** This architecture was independently validated by CC's experiments — per-frame RAM writes for invincibility, enemy speed control, and death suppression all use this pattern. The Orchestrator isn't fighting the game's code; it's editing reality between frames. The game's own code handles the hard work (physics, collision, entity management); the Orchestrator handles creative modifications.

---

### Decision 124: Canvas Overlay for Visual Replacement (Not NES Tile Injection)

**Context:** Two approaches for replacing game character visuals: (A) convert new art to NES-format tiles, inject into CHR memory, and let the PPU render them; (B) let the NES render everything, then draw new art directly on the canvas at entity positions. Approach A was tested extensively and produced degraded, garbled results due to the 4-color palette limit, 8×8 tile grid, and composition complexity. Approach B was tested with PixelLab sprites and produced clean, recognizable results.

**Decision:** Visual replacement for entities (player, enemies, items) uses canvas overlay rendering. The NES emulator renders the game's background and handles all mechanics. Entity sprites are suppressed in OAM and replaced with PixelLab-generated art drawn directly on the HTML canvas at RAM-tracked positions. No resolution, palette, or tile-format constraints.

**Rationale:** The NES PPU's tile system is a rendering constraint, not a game mechanic. Physics, collision, AI, and all gameplay logic operate on RAM values that are independent of visual rendering. By splitting rendering (canvas for custom content, PPU for original content), we get full visual freedom while preserving perfect mechanical fidelity. The canvas overlay approach is also dramatically simpler to implement — `ctx.drawImage()` vs CHR injection + OAM composition mapping.

**Caveat:** This is explicitly an overlay approach for entities. It differs from the previously rejected Phaser overlay (Decision rejected in earlier threads) because it is driven by RAM state at every frame, not floating independently. Every visual element is positioned by the game's own mechanics, creating seamless integration.

---

### Decision 125: OAM Suppress-and-Replace for Entity Sprite Replacement

**Context:** To replace a character's appearance, the original character's sprites must be hidden and new sprites must appear at the same position. The NES renders sprites from OAM (Object Attribute Memory) — 64 entries, 4 bytes each (Y, tile, attributes, X).

**Decision:** Suppress original entity sprites by scanning OAM for entries near the entity's known RAM position and setting their Y coordinate to $FF (offscreen). Replace by either injecting new OAM entries (for NES-native rendering) or drawing on the canvas (for high-quality rendering). Suppression must occur every frame because the game rewrites OAM via DMA each frame.

**Rationale:** Validated empirically. Link from Zelda was successfully rendered in SMB using this approach — recognizable, correctly positioned, interacting with the game world. The per-frame suppression is deterministic and cheap (scan 64 entries, ~256 bytes). The approach sidesteps the composition-to-decomposition tile mapping problem entirely because the game's internal tile composition system is never used.

---

### Decision 126: Resource ROM Concept for LLM-Generated Content

**Context:** The Orchestrator can modify values and suppress/inject sprites, but where does genuinely new content come from? New level data, new entity parameters, new tile art need to be stored somewhere the emulator can access.

**Decision:** A conceptual "third ROM" — the Resource ROM — serves as a content library generated by the LLM. It contains new tile sheets, level data tables, entity behavior parameters, music sequences, structured in formats the game's existing loading routines can consume. The Orchestrator routes reads from the original ROM to the Resource ROM when substituting content. In implementation, this is a JavaScript data structure, not an actual ROM file.

**Rationale:** The game's existing code already has loading routines (level loader, entity spawner, music player) that consume structured data in known formats. If the Resource ROM provides data in those exact formats, the game's own code does the heavy lifting of processing and rendering it. Claude can generate data in any format once the format is understood through PRG comprehension.

---

### Decision 127: Three-Tier Platform Architecture

**Context:** The project is evolving from a single game (SMCE) toward a platform that supports arbitrary ROM transformation. Need a clear architectural separation between universal capabilities, per-game capabilities, and creative application.

**Decision:** Three tiers:

1. **Universal layer** — Works on any NES/SNES ROM with zero per-game configuration. OAM suppression, canvas sprite rendering, palette manipulation, frame buffer access, controller input. This is the PPU-level API, implemented once.

2. **Per-game layer** — Generated by Claude's PRG comprehension for each specific ROM. RAM address map, entity system, event detection, state machine, level data format. Stored as a JSON API definition file per game. Generated once, reused forever.

3. **Creative layer** — The platform's differentiating value. PixelLab for visual generation, LLM for behavior authoring, CAS engine for social dynamics, Phaser for rendering beyond NES constraints. This layer talks to the per-game API using semantic concepts, never raw addresses.

**Rationale:** This separation enables "bring your own ROM" as a platform feature. Users load any ROM; Claude analyzes it (tier 2); the creative layer transforms it (tier 3). The basic product is visual transformation. The advanced product adds CAS. SMCE is Anthropic's flagship implementation of the full stack.

---

### Decision 128: PRG Comprehension via Claude as Primary ROM Analysis Method

**Context:** Previous sessions explored multiple approaches to understanding ROMs: behavioral probing (write values, observe effects), comparative analysis (diff states across runs), execution tracing (watch CPU reads/writes). This session tested a fundamentally different approach: have Claude read the disassembled PRG-ROM as source code and produce an annotated analysis.

**Decision:** Claude's PRG comprehension is the primary ROM analysis method. Claude reads the disassembled 6502 assembly (or 65816 for SNES), identifies all major systems (physics, AI, entity management, level loading, state machine), locates data tables, and produces the per-game API definition. Behavioral probing and comparative analysis remain as supplementary validation methods — used to verify Claude's analysis, not as the primary discovery mechanism.

**Rationale:** Validated on two ROMs with perfect ground truth scores. SMB (32KB NROM, 10/10) and MM2 (256KB MMC1 bank-switched, 10/10 including catching 2 planted false facts). Claude's comprehension is faster (18 minutes vs hours for behavioral probing), more complete (finds code structure, not just data), and more accurate (understands WHY addresses matter, not just THAT they change). The key advantage: Claude can write new code that integrates with the existing game because it understands the code's architecture, not just its data.

**Caveat:** Claude likely has SMB and MM2 disassembly data in its training set. The real generalization test (an obscure ROM with no public disassembly) has not yet been performed. This test is a critical next step before declaring the method universal.

---

### Open Design Work (Updated)

**Resolved by Thread 17:**
- ~~How to understand and modify NES ROMs at runtime~~ ✅ (PRG comprehension + Orchestrator + canvas overlay)
- ~~Composition-to-decomposition tile mapping~~ ✅ (Sidestepped via OAM suppress-and-replace + canvas overlay)
- ~~PixelLab integration with game engine~~ ✅ (PixelLab API → canvas rendering at RAM-tracked positions)

**Remaining:**
1. SNES validation (65816 comprehension, larger ROMs)
2. Obscure ROM test (validate PRG comprehension without training data)
3. Per-game API generation pipeline (standardize and automate)
4. Orchestrator runtime (proper system, not ad-hoc scripts)
5. Background replacement pipeline (level geometry → visual generation)
6. CAS engine integration with Orchestrator
7. Paradigm grammar specifics per paradigm
8. CAS state → level content translation per paradigm
9. Social hook pattern library
10. MVP definition — minimum compelling first demo
