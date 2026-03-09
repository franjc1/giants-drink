# claude.md Additions — Sessions 8-9 (CHR-ROM Extraction + Mesen2 Proof of Concept)

**Instruction:** These additions should be integrated into the existing claude.md.

---

## Update to Key Documents Table:

Add:
| `tools/extract-chr-rom.js` | NES CHR-ROM bulk extractor — parses iNES headers, extracts 2bpp tile data to PNG + manifest | Stable |
| `tools/mesen-extract.lua` | Mesen2 Lua extraction script — captures PPU state (palette, nametable, OAM, CHR) in headless mode | Active development |
| `tools/render-screen.js` | NES screen renderer — combines extracted PPU data into 256×240 PNG with correct palettes | Active development |

---

## Update to Asset Pipeline Section:

### Emulator: Mesen2 (Decision 80)

FCEUX is no longer used. Mesen2 (`--testrunner` headless mode) is the Universal Extractor emulator for NES and SNES. Key facts:

- **Install:** macOS via GitHub release + `brew install sdl2`. Binary at `~/mesen2/Mesen.app/Contents/MacOS/Mesen`.
- **Headless mode:** `./Mesen --testrunner <rom-path> <lua-script-path>` — runs at maximum speed, exits when Lua calls `emu.stop()`.
- **Lua sandbox:** `io` and `os` libraries are stripped. Data export uses `print()` to stdout, captured by Node.js orchestrator (Decision 81).
- **API:** `emu.read(address, memType)` for CPU/PPU/OAM/CHR memory. `emu.getState()` for full emulator state including PPUCTRL. `emu.addEventCallback()` for frame-boundary hooks. `emu.setInput()` for controller input.
- **Multi-system:** Covers NES, SNES, GB, GBA, PCE, SMS/Game Gear — one emulator for ~750 of ~820 target games.

### Extraction Pipeline Status (as of Session 9):

- **CHR-ROM bulk extraction:** ✅ Complete. 2,383 NES games extracted to `~/nes-extracted/`. Script: `tools/extract-chr-rom.js`.
- **Single-game PPU extraction:** ✅ Validated on SMB. Script: `tools/mesen-extract.lua` + `tools/render-screen.js`. Produces pixel-perfect screen render.
- **CHR-RAM game extraction:** ❌ Not yet tested. Next priority (Session 10).
- **Chaos player (automated exploration):** ❌ Not yet built. Session 11.
- **Batch orchestrator:** ❌ Not yet built. Session 12.
- **Mechanical (RAM) extraction:** ❌ Not yet built. Session 13.
- **SNES extraction:** ❌ Not yet tested. Mesen2 supports SNES; same Lua approach expected to work.

### PPUCTRL Rendering (Decision 82):

The renderer MUST read the PPUCTRL register value from captured PPU state to determine which CHR bank ($0000 or $1000) is used for background tiles vs sprite tiles. Different games use different configurations. There is no safe default — the renderer must check per game.

---

## Update to Local Data Locations:

| `~/nes-roms/` | No-Intro NES ROM set (3,146 .nes files, ~325MB) | NOT in repo, never commit |
| `~/nes-extracted/` | CHR-ROM extraction output (2,383 game folders) | NOT in repo |
| `~/nes-extracted/smb-capture/` | Session 9 proof-of-concept output | NOT in repo |
| `~/mesen2/` | Mesen2 emulator binary | NOT in repo |

---

## Update to Workflow Notes:

### Mesen2 Lua Development Pattern

When writing or debugging Mesen2 Lua scripts:
1. `print()` goes to stdout — this is the primary data export channel
2. `io.open()` will crash (io is nil) — never use file I/O in Mesen2 Lua
3. `emu.stop()` exits the emulator — call this at the end of every extraction script
4. Hex-encode binary data for stdout transport — use structured prefixes like `DATA_PALETTE:`, `DATA_NAMETABLE:` etc.
5. The Node.js orchestrator (`tools/render-screen.js`) spawns Mesen2, captures stdout, and parses the prefixed lines
