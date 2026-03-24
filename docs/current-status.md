# SMCE (Sic Mundus Creatus Est) — Current Status

**Last updated:** 2026-03-23 (Thread 16: Procedural Generation Exploration & Boundary Finding)

---

## What Just Happened (Thread 16)

### Session Focus: Can procedural JS generation be a tire for visual output?

This was an empirical exploration session. Rather than planning (as Thread 15 suggested), Joe wanted to test whether procedural generation via JavaScript could serve as a visual tire — reducing or eliminating PixelLab calls for backgrounds, tiles, and scene composition. The session ran six progressive experiments, each building on the previous one's lessons.

### Experiment 1: p5.js Procedural Backgrounds (v1)

Built six background styles at SNES native resolution (256×224): starfield, sunset sky, Mega Man industrial, ocean/water, cave/underground, night city. Each with parallax scrolling.

**Results:** Sunset sky scored 9.5/10 — genuinely excellent. Others ranged 5-7/10. The sunset worked because it accidentally followed good design principles (full vertical space, distinct layers with different character, intentional negative space, clear depth via parallax speed). The failures (especially Mega Man industrial) had empty space that wasn't intentional, unclear layer separation, and missing recognizable detail.

**Key insight:** Quality variance was a design problem, not a capability problem. The tool works; it needs the 20 grounded principles applied.

### Experiment 2: p5.js Backgrounds v2 (Hard Cases)

Attempted Heat Man-style tech backgrounds, SMW overworld hills, improved industrial, forest canopy, castle interior, underwater. These tested whether p5 could handle recognizable background elements beyond pure atmosphere.

**Results:** All showed potential but weren't quite there. Joe's assessment: procedural backgrounds work well for platformer/sidescroller backgrounds and far-distance layers in beat-em-ups, racing, fighters. They do NOT work for top-down, RTS, or FPS paradigms because those have no "behind the gameplay" space — the tilemap IS the visual field.

**Key insight:** The boundary is camera-derived. Side/angled view → p5 handles atmosphere. Top-down/first-person → no separate background exists.

### Experiment 3: RetroTile.js — Declarative Tile Library (v1)

Built a declarative tile generation library where tiles are described via chained operations: `.fill()`, `.mortarGrid()`, `.bevel()`, `.noise()`, `.rivets()`, `.circuit()`, `.cylinderGradient()`. Twelve operations that compose to create any geometric tile. Tested with Mario, Mega Man, Castlevania, and Metroid tilesets arranged in level layouts.

**Results:** The library concept is sound — tiles are a closed visual domain expressible with finite operations. But output quality was NES-grade. Individual tiles looked like decent ingredients, but arranged in grids they looked "like really repetitive tiles — childish."

**Key insight:** Bottom-up (make tiles → arrange them) produces tiled-looking output. Composition is the bottleneck, not tile quality.

### Experiment 4: RetroTile v2-v3 (SNES/Max Quality Attempts)

Attempted SNES-grade tiles with graduated bevels, structured noise, cell variation, PBR-style lighting, Perlin/Worley/FBM noise functions. Then attempted maximum quality with no retro constraints.

**Results:** Despite increasingly sophisticated rendering, output consistently looked NES/early-PC grade. Joe's feedback: "These look like good NES tiles, or Minecraft style stuff. Not SNES." Even the max-quality version with proper noise functions and normal-based lighting couldn't escape the procedural look.

**Key insight:** The problem wasn't technical sophistication — it was that I kept unconsciously constraining to retro aesthetics. More fundamentally, procedural texture generation has a quality ceiling for the kinds of tiles players stare at during gameplay.

### Experiment 5: Top-Down Compositional System

Joe's critical reframe: "The answer probably isn't design a bunch of random tiles and hope for the best... it's probably a process of going from general shape and composition to specific." Built a compositional painting system: spatial zones → edge detection → detail placement → contextual tile rendering. Each tile knows its role (fill, edge-N, corner-NW, detail) and renders accordingly.

Three scenes: MMX corridor, LttP overworld, MMX vertical shaft. Showed zone map alongside rendered output.

**Results:** Composition was dramatically better — you could read the spatial intent (shaft, platforms, lava, walls). But art quality was still "MS-DOS feeling." The architecture works; the rendering quality doesn't.

**Key insight:** Top-down composition → edge detection → contextual rendering is the RIGHT PROCESS for Gap B. It just needs PixelLab art as its rendering layer, not procedural art.

### Experiment 6: Direct Scene Painting (No Tiles)

Final test: paint MMX highway stage and LttP overworld pixel-by-pixel, no tile abstraction, trying to match the actual games. Full compositional approach with direct rendering.

**Results:** MMX was serviceable ("not something that blows me away, but not something I'd be embarrassed about"). LttP was poor ("childish — pretty terrible"). Geometric/industrial scenes in dark palettes are forgiving. Organic scenes with trees, houses, natural terrain expose every weakness of procedural rendering.

**Key insight:** The definitive boundary. Procedural = atmosphere + geometric structure at distance. PixelLab = anything the player looks at closely, especially organic/illustrated content.

---

## Key Decisions Made This Session

| # | Decision | Summary |
|---|----------|---------|
| 117 | p5.js validated as background atmosphere tire | Works for parallax layers in side-view paradigms (4-5 of 7). Zero cost, instant, infinite variation. Not for top-down/FPS. |
| 118 | Procedural tile rendering has a hard quality ceiling | Cannot match SNES/modern quality for foreground gameplay tiles regardless of technique sophistication. |
| 119 | Top-down composition is the right architecture for Gap B | Zone painting → edge detection → contextual rendering. The composition system decides what goes where; the art comes from PixelLab tilesets. |
| 120 | "p5 always, PixelLab sometimes on top" for backgrounds | p5 handles all atmospheric background layers. PixelLab contributes illustrated objects on top only when the scene needs recognizable specific elements. |
| 121 | Procedural boundary is camera-derived | Side/angled view paradigms have a "behind" space suitable for procedural backgrounds. Top-down/FPS paradigms have no separate background — the tilemap is everything. |

---

## What's Next

### Immediate: Full Project Re-Orientation (Thread 17)

Thread 16 was supposed to be the planning session but became an exploration session. The planning still needs to happen. Thread 17 should produce:
- Revised build plan (v5) reflecting all Thread 10-16 learnings
- Concrete session sequence for Big Thing 1 (composition system + PixelLab tilesets)
- Clear dependencies and placeholders for Big Thing 2 (CAS)
- The 20 grounded principles formalized into a design spec
- Updated canonical repo files (claude.md, decisions-log.md have not been committed to canonical locations since Thread 1)

### What Thread 16 Validated for the Build Plan

1. **Background pipeline:** p5.js procedural backgrounds for side-view paradigms. Parameterized by Claude, rendered at game creation time. Zero PixelLab cost for backgrounds in ~70% of cases.

2. **Composition system architecture:** Zone painting → edge detection → role assignment → rendering. This IS the Section Template Library / Fill Pattern system, viewed from the rendering side. Claude designs zones; the system resolves edges; PixelLab tilesets fill the roles (fill tile, edge-N tile, corner tile, detail tile).

3. **PixelLab tileset generation strategy:** Instead of generating individual tiles, generate ROLE-BASED TILESETS: one fill tile, 4 edge tiles, 4 corners, 4 inner corners, 2-3 detail variants = ~15-20 images per material zone. The composition system arranges them. This is a much more efficient PixelLab usage pattern.

4. **The procedural/PixelLab boundary is clear:** Procedural handles atmosphere (backgrounds, parallax), geometric structure (panel grids, support columns), and composition logic (what goes where). PixelLab handles visual art quality (the tiles themselves, organic content, illustrated objects, anything the player stares at).

---

## Repo State

### Experiments from this session (not committed to repo):
```
All experiments were built in Claude.ai's sandbox environment:
  p5-bg-test.html          — v1 p5 backgrounds (6 styles)
  p5-bg-test-v2.html       — v2 backgrounds (hard cases)
  retrotile-test.html       — RetroTile v1 (declarative NES-grade tiles)
  retrotile-v2-snes.html    — RetroTile v2 (SNES attempt)
  retrotile-v3-maxquality.html — RetroTile v3 (max quality noise-based)
  retrotile-v4-painterly.html  — RetroTile v4 (painterly clean style)
  compositional-tiles-v1.html  — Compositional system (zone → edge → render)
  direct-paint-v1.html         — Direct scene painting (MMX + LttP)
```

These are proofs-of-concept for learning, not production code. The key outputs are the DECISIONS, not the code.

### Key docs needing update:
```
claude.md                              ← NEEDS UPDATE (procedural findings, composition system architecture)
docs/decisions-log.md                  ← NEEDS UPDATE (decisions 110-121, threads 15-16)
docs/design/build-plan-v4.md           ← NEEDS FULL REVISION (next session)
```

### CRITICAL: Canonical repo files are stale
`docs/current-status.md` in the repo is still from Thread 1 (March 2). `docs/decisions-log.md` in the repo is missing decisions 110-121. `claude.md` is missing threads 13-16 content. The next session MUST commit all updates to canonical locations.

---

## Session Notes for Next Thread

- Thread 17 should be the PLANNING session. Output = revised build plan v5 + concrete session sequence.
- The composition system proof-of-concept (zone → edge → role → render) should be formalized as the architecture for the Section Template Library + Fill Pattern system.
- The p5.js background system should be added to the tool stack in claude.md as a validated tire.
- PixelLab tileset generation should shift from "generate individual tiles" to "generate role-based tilesets" (fill, edges, corners, details).
- Joe needs the "wonderful sense of all specific steps" restored — the planning session must provide that clarity.
- The 20 grounded principles from Thread 15 still need to be formalized into `docs/design/composition-principles.md`.
