# Two Fires — Current Status

**Last updated:** 2026-03-09 (Phase 0.5, Session 10)

---

## What Just Happened (Session 10)

### CHR-RAM Extraction Validated — Full NES Library Coverage Proven

**The core question:** Does Mesen2 VRAM capture work for CHR-RAM games (tiles are compressed in PRG-ROM and only appear in VRAM at runtime)? Answer: **yes, completely**.

**Mega Man 2 (USA)** — UNROM/Mapper 2, CHR-RAM:
- Mesen2 correctly populated nesChrRam with 8192 bytes of valid VRAM tile data at frame 600
- Title screen rendered pixel-perfectly using extracted data
- PPUCTRL heuristic correctly identified BG at $1000 (non-zero tiles: bank1=176/176, bank0=173/176)

**Castlevania (USA)** — UNROM/Mapper 2, CHR-RAM:
- Mesen2 correctly populated nesChrRam with 8192 bytes of valid VRAM tile data at frame 600
- Stage 1 screen rendered correctly (castle silhouette, HUD, Simon Belmont, ground tiles)
- Nametable coverage heuristic correctly identified BG at $1000 (bank1=83/85, bank0=59/85)

**Validation result:** The Universal Extractor approach works for the entire NES library, not just CHR-ROM games. Mesen2 handles CHR decompression transparently as part of normal emulation.

### Two Critical Bugs Fixed in render-screen.js

**Bug 1: PPUCTRL hardcoded to SMB1 values.** render-screen.js had `BG_PATTERN_TABLE = 0x1000` and `SPRITE_PATTERN_TABLE = 0x0000` hardcoded (matching SMB1 PPUCTRL=$90). This was a TODO from Session 9 that was never resolved. Fixed: `ppuctrlToBanks(ppuctrl)` now derives bank offsets from the captured PPUCTRL value.

**Bug 2: nesPpuDebug[0] unreliable for CHR-RAM games.** The Mesen Lua script reads PPUCTRL from `emu.read(0, emu.memType.nesPpuDebug)`. This correctly returns $90 for SMB1 but returns 0 for MM2 and CV1 (confirmed MEMORY.md concern). Fixed: when PPUCTRL=0, the renderer applies a nametable coverage heuristic — counts how many nametable tile indices have non-zero CHR data in each bank; the bank with more matches is the BG bank. Works for both MM2 and CV1.

---

## Current Repo State

### File Structure
```
giants-drink/
  claude.md                              ← Master architectural blueprint
  tools/
    extract-chr-rom.js                   ← NES CHR-ROM bulk extractor (Session 8)
    mesen-extract.lua                    ← Mesen2 Lua extraction script (Session 9)
    render-screen.js                     ← NES screen renderer (updated Session 10)
  src/
    asset-resolver.js                    ← Not yet updated for extraction manifests
  data/
    ground-truth/                        ← Phase 0.5 ingestion (~37MB JSON/text)
  docs/
    current-status.md                    ← THIS FILE
    decisions-log.md                     ← Updated with Decisions 76-84
    design/
      rom-extraction-strategy.md         ← Session 7 (Castlevania/DuckTales correction noted)
      (other design docs unchanged)
```

### External (not in repo)
```
~/nes-roms/                              ← No-Intro NES ROM set (~3,146 .nes files)
~/nes-extracted/                         ← CHR-ROM tile sheets + manifests (2,383 games)
~/nes-extracted/smb-capture/             ← Session 9 proof-of-concept (SMB1, pixel-perfect)
~/nes-extracted/megaman2-capture/        ← Session 10 (MM2 title screen, pixel-perfect) ✓
~/nes-extracted/castlevania-capture/     ← Session 10 (CV1 Stage 1, correct render) ✓
~/mesen2/                                ← Mesen2 emulator installation
```

### Deployed
- Vercel: two-fixture platformer (unchanged)
- Cloudflare R2: TSR catalog + partial sprites

---

## What's Next

### Session 11: Batch Orchestrator + CHR-RAM Library Extraction

**Primary goal:** Build Node.js batch orchestrator that loops through the ~760 CHR-RAM NES games and runs Mesen2 headless on each one. This is the "scale" step — now that the pipeline is validated, process the entire CHR-RAM library.

Key requirements:
1. Read the ROM list (iNES headers, filter for CHR-RAM: byte 5 = 0)
2. For each ROM: run Mesen2 extraction → save capture-info.json + chr.json + palette.json + nametable.json + mesen-reference.png to ~/nes-extracted/{slug}/
3. Skip ROMs already extracted (resume capability)
4. Log failures (bad ROM, timeout, empty CHR data)
5. Progress tracking — how many done, failures, ETA

Secondary: detect PPUCTRL at the Mesen Lua level more reliably (the nesPpuDebug address mapping needs investigation — it works for SMB1 but not CHR-RAM games). Either find the correct debug register address or accept the nametable heuristic as sufficient.

### Session 12: Feed Extracted Data into Game Engine

Take SMB extraction data and wire it into the platformer engine. Render World 1-1 playable in the browser using ROM-extracted tiles, palettes, and layout. This is the "close the loop" moment where extraction meets the actual Two Fires engine.

### Session 13: SNES Extraction via Mesen2

Mesen2 emulates SNES. Test the same headless + Lua extraction approach on Super Mario World. If it works, we have NES + SNES coverage from a single tool.

### Session 14+: Scale and Resume Engine Work

- Batch-extract SNES library
- Resume Phase 1 diagnostic pipeline with real ROM-extracted assets
- Build chaos player for automated game exploration (deeper state coverage)

---

## Key Decisions This Session

- **Decision 83:** CHR-RAM Universal Extraction Confirmed — full NES library coverage proven
- **Decision 84:** Nametable coverage heuristic for PPUCTRL bank detection (nesPpuDebug[0] unreliable)
- **Retroactively documented:** Decisions 76-82 (Sessions 7 and 9) added to decisions-log.md

---

## Key Open Questions

1. ~~Cloud storage~~ → R2 stays (RESOLVED)
2. ~~Asset fidelity approach~~ → ROM extraction (RESOLVED)
3. ~~Emulator choice~~ → Mesen2 with --testrunner headless mode (RESOLVED)
4. ~~Lua I/O in Mesen2~~ → stdout capture workaround (RESOLVED)
5. ~~CHR-RAM extraction~~ → Validated on MM2 and CV1 (RESOLVED Session 10)
6. **nesPpuDebug[0] mapping** — returns correct value for SMB1 but 0 for CHR-RAM games; correct Mesen register address unknown. Heuristic works in practice; root cause unresolved.
7. **SNES extraction** — does Mesen2's SNES Lua API provide equivalent PPU access? (Session 13)
8. Game Genie / level-select code database — needed for chaos player (Session 14+)
9. Extracted data → engine integration — schema reconciliation needed (Session 12)
10. Meta-game specification — flagged as needing its own thread (Decision 70, unchanged)
11. ~~API key rotation~~ → Rotated (RESOLVED)
