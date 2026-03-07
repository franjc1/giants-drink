# Two Fires — Decisions Log Addition
## Phase 1, Session 3 (2026-03-07)

*Append this to the existing `docs/decisions-log.md`*

---

## Session: 2026-03-07 — Phase 1 Session 3 (Physics Calibration, Asset Pipeline)

### Decision 62: Two-Phase Gravity (SMW Ground Truth)

**Context:** The engine used a single gravity value (0.55) with a `jump_hold_bonus` to simulate variable-height jumps. This produces a different arc shape than SMW — a slightly extended linear arc instead of the signature floaty hang at the apex followed by a quick drop.

**Decision:** Replace single gravity with two-phase system matching SMW ROM-disassembled values:
- `gravity_ascending` (0.19): applied while ascending AND holding jump button. Creates long, controllable hang time.
- `gravity_falling` (0.5): applied when falling OR when jump button released while ascending. Quick, satisfying drop.
- `jump_hold_bonus` eliminated entirely — two-phase gravity replaces its function.

All values derived from `data/ground-truth/physics/super-mario-world-snes.json`. Engine runs at 60fps via requestAnimationFrame matching SMW's 60fps NTSC, so values translate 1:1. `jump_velocity` adjusted from ground truth -5.0 to -5.5 for playability with current test level geometry.

**Rationale:** The two-phase gravity is the single biggest contributor to SMW's feel. It creates the skill expression gap between tap-jumps (short, gravity_falling kicks in immediately) and held-jumps (long, floaty arc). Barrett would appreciate: the same mechanical input produces qualitatively different movement experiences based on player intention expressed through button duration.

---

### Decision 63: Scrape Everything Available (Asset Library Scope)

**Context:** Phase 0.5 ingestion produced metadata-only JSONs for ~1,300 games — no actual sprite images or music files. Track A requires actual PNGs. Track B requires distributional knowledge derived from analyzing real sprites. Question: how many games to scrape?

**Decision:** Scrape ALL available games on The Spriters Resource (all platforms: NES, SNES, Genesis, Game Boy, GBA, Master System, Sega CD, Game Gear, TurboGrafx-16, Neo Geo, Arcade, DOS, PC) and ALL available music from Zophar's Domain (NSF, SPC, VGM, GBS formats). Download every category per game including stage maps. No minimum viable subset — get everything.

**Rationale:** Marginal cost per additional game is effectively zero once the pipeline exists (bandwidth only, ~$0). Storage is trivial (~10-50GB sprites, <1GB music, on a machine with 387GB free). Runtime is hours not days. The value compounds: more games = more precise distributional knowledge for Track B = more authentic generation output. Skimping saves nothing and produces a worse product.

---

### Decision 64: Sprites to Cloud Storage for Runtime Access

**Context:** Track A needs to look up sprites at runtime (player prompt → agent pipeline → semantic spec → Asset Resolver → matched sprite). Track B needs distributional analysis from real sprites to constrain generation. Both require the sprite library accessible server-side, not just on Joe's local machine.

**Decision:** Sprite and music libraries will be uploaded to cloud storage (Cloudflare R2, ~$0.75/month for 50GB). The backend that runs the agent pipeline accesses the library during generation. The browser never touches the library directly — it receives finished game payloads with resolved/generated sprites.

**Rationale:** R2 is cheap and already in the Cloudflare ecosystem we're deploying to. Local-only sprites work for dev but not for the deployed product. Both tracks need runtime library access — Track A for direct lookup, Track B for constraint derivation. This was always implicit in the architecture but making it explicit prevents building a local-only resolver that has to be rewritten later.

---

### Decision 65: Vision API Tagging for Semantic Asset Index

**Context:** Downloaded sprite sheets have filenames and categories from The Spriters Resource, but lack the semantic metadata the Asset Resolver needs (silhouette class, palette profile, behavioral type, animation states). Many sheets have clear names ("Goomba", "Dragon") but many are ambiguous ("Enemy 3", "Stage 4 Boss", Japanese names).

**Decision:** Three-phase tagging pipeline: (1) Programmatic analysis of all PNGs — measure dimensions, color count, palette, grid detection (free). (2) Claude Haiku vision API for ambiguous sheets — classify content, assign semantic tags (~$15-50, only ~30-40% of sheets need this). (3) Programmatic music analysis — extract tempo, key, channels from chiptune files (free).

**Rationale:** Haiku is cheap enough for classification work. Skipping ambiguous sheets means "dragon" queries might miss unnamed dragon sprites. The optimization of only sending ambiguous sheets to the API balances cost against completeness. Full semantic tagging is what makes the library actually searchable by the Asset Resolver rather than just a folder of files.

---

### Decision 66: Integer Display Scaling with Dynamic Viewport

**Context:** The engine rendered at native pixel sizes, looking tiny on modern monitors. Initial fix used pure integer scaling (scale up to fill screen) but this made the viewport too zoomed in on large monitors — only 16 tiles visible.

**Decision:** Cap scale factor at 3×. Screens that could fit higher scaling instead get a wider native viewport (more tiles visible). On 1080p: 3× scale, ~40 tiles visible. On 1440p: 3× scale, ~53 tiles visible. Tiles appear at ~48px on screen — readable and appropriately retro.

**Rationale:** Pure integer scaling makes each tile huge on high-res monitors. The player needs to see enough of the level to read upcoming challenges and plan movement. SMW shows ~16 tiles across on a 256px-wide SNES screen, but that was filling a 20" CRT — the angular coverage was much larger than 16 tiles at 7× on a 27" monitor. Capping at 3× and widening the viewport better approximates the original spatial experience.
