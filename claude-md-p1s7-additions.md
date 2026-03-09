# claude.md Additions — Session 7 (ROM Extraction Pivot)

**Instruction:** These additions should be integrated into the existing claude.md. The Asset Pipeline section should be rewritten to reflect the new approach. The key documents table should be updated to include the new ROM extraction strategy doc.

---

## Add to Key Documents Table:

| `docs/design/rom-extraction-strategy.md` | ROM extraction strategy — game lists, extraction methods, Universal Extractor architecture | When extraction approach changes |

---

## Replace Phase 0.75 Asset Pipeline Section With:

### Phase 0.75: Asset Pipeline — ROM Extraction (Decisions 76-79)

**Previous approach (deprecated):** TSR sprite sheet scraping → vision tagging → bounding box extraction. Produced composite sheets with colored backgrounds, text labels, irregular layouts, incomplete coverage. Insufficient fidelity for Track A or Track B.

**Current approach:** Direct ROM extraction producing three categories of ground truth per game:

1. **Visual ground truth** — pixel-perfect tiles, sprites, palettes extracted from ROM data (CHR-ROM parsing for NES bulk, VRAM capture via emulator instrumentation for everything else)
2. **Structural ground truth** — level layouts reconstructed from PPU nametable capture during automated playthrough, supplemented by community tools (Lunar Magic, etc.) for top titles
3. **Mechanical ground truth** — physics parameters, enemy behavior, item effects, ability definitions extracted from automated RAM state analysis during playthrough, supplemented by community documentation

**Universal Extractor architecture:**
- Two-pass system: Pass 1 generates an automated exploration TAS per game (multi-strategy chaos player with Game Genie infinite-lives codes + level-select jumps); Pass 2 replays with full RAM/VRAM/nametable/palette/OAM instrumentation
- Platform-specific emulator scripting: FCEUX Lua (NES), bsnes/RetroArch (SNES), MAME Lua (arcade), Genesis emulator (Genesis)
- Fully automated — no per-game human effort. Batch-processes entire ROM libraries unattended.
- Per-game output: manifest.json + tiles/ + sprites/ + palettes/ + levels/ + mechanics.json

**Extraction scope:** ~820 games total
- NES: ~550 (450 CHR-ROM bulk + 100 CHR-RAM via Universal Extractor)
- SNES: ~200 (25 community tools + 175 Universal Extractor)
- Arcade: ~30 (MAME Universal Extractor)
- Genesis: ~20 (Genesis Universal Extractor)
- PC: ~20 (existing tools: WadExt, Wolf3DExtract, etc.)

**Storage:** Cloudflare R2 (Decision 73 unchanged). ~500MB-1GB total (vs 15-20GB for deprecated TSR sheets).

**Asset Resolver:** Updated to query per-game manifest.json files instead of monolithic asset-catalog.json. Track A/B toggle unchanged. Resolver interface unchanged — downstream phases unaffected.

**Key principle:** Vibes = slop. Ground truth = gold. Every mechanical parameter should come from ROM data or community documentation, never from Claude's general knowledge of game genres. The Designer agent composes games by querying the extraction database, not by improvising.

**What's retained from old pipeline:**
- Music catalog (Decision 75) — chiptune files from Zophar's Domain, 103K tracks classified by functional role
- Phase 0.5 ground truth library — physics data for ~1,300 games, game design patterns, level sequences
- TSR sheets — 55K sheets retained as supplementary reference for Track B distributional knowledge
- R2 storage infrastructure (Decision 73)

**What's deprecated:**
- Vision tagger (tag-sprites.js)
- Sheet name enrichment (enrich-sheet-names.js)
- Programmatic sprite analysis (analyze-sprites.js)
- TSR-based asset-catalog.json as primary asset source

---

## Add to Design Philosophy Section:

### Ground Truth Principle (Decision 78)

Every aspect of a generated game should be traceable to ROM-extracted ground truth wherever possible. Three categories of ground truth feed the system at different points:

- **Visual ground truth** → renderer (what things look like)
- **Structural ground truth** → level construction pipeline (how things are arranged)
- **Mechanical ground truth** → Designer agent + engine clusters (how things behave)

"Vibes" (Claude's general knowledge of a game genre) is the fallback, never the default. The extraction database is the first source the Designer agent queries. Only when the database lacks specific data for a requested game does the agent fall back to genre-level knowledge — and even then, it should draw on statistical patterns from the extracted library (e.g., "average NES platformer enemy HP is X") rather than pure improvisation.
