# SMB ROM Transformation Toolkit — Investigation Log

## Session Info
- **Date:** 2026-03-26
- **ROM:** Super Mario Bros. (World).nes
- **Emulator:** jsnes (Node.js, CommonJS modules due to ESM project)
- **Result:** 9/9 transformations working, all visually verified

---

## Phase 1: Boot & Control Verification

**Method:** Load ROM, press START after 60 frames, wait 180 frames, hold RIGHT.
**Result:** Player X ($0086) goes from 0 → 52 after 60 frames of RIGHT input.

**Boot sequence:** 60 frames title screen → START → 180 frames level load → gameplay active.

---

## Phase 2: RAM Discovery Methods

### Method 1: Comparative Analysis (RAM Diffing)

**Technique:** Save state → run branch A (e.g., stand still) → snapshot RAM. Restore → run branch B (e.g., move right) → snapshot. Diff the two snapshots. Addresses that changed ONLY in branch B are causally linked to the different input.

**Standing still vs moving right (60 frames):**
- 30 addresses changed when standing still (timers, animation counters)
- 72 addresses changed when moving right
- 42 addresses changed ONLY when moving right (movement-specific)
- **Key discovery: $0086 changed from 40 → 100** — Player X position confirmed ✓

**Not jumping vs jumping:**
- 6 jump-specific address changes found:
  - **$009F: 0 → 252** — Y velocity! (252 = -4 signed = upward)
  - **$001D: 0 → 1** — Airborne/jumping flag
  - $0706-$070A: Jump-related state flags

**Verdict:** RAM diffing is highly effective for discovering input-correlated addresses. Works best with binary comparisons (action vs no-action).

### Method 2: Active Probing (Write & Observe)

**Technique:** Write a known value to an address, advance frames, check if the value persists and has observable effects.

**Results:**
- $075A: Write 9, read back 9 → **Lives** ✓
- $0756: Write 2, read back 2 → **Powerup state** (0=small, 1=big, 2=fire) ✓
- $075E: Write 50, read back 50 → **Coins** ✓
- $009F: Write 0xF0 (-16), Mario rockets upward → **Y velocity** ✓
- $079E: Write 0xFF, decrements each frame → **Star invincibility timer** ✓
- $000E: Write 8 (freeze), prevents death transition → **Player state** ✓

**Enemy speed probing ($0058):**
- Write 0 → enemy doesn't move (0px in 10 frames vs -5px normal)
- Write 200 → enemy moves -35px in 10 frames (7× faster)
- **Confirmed: $0058 = enemy slot 0 horizontal sub-pixel speed** ✓

**Verdict:** Active probing is the fastest validation method. Write distinctive values and check behavior. Essential for distinguishing "this address exists" from "this address controls something."

### Method 3: OAM Correlation

**Technique:** Compare player RAM position with OAM sprite positions. Sprites near the RAM position are rendering that entity.

**Result:** Mario's OAM slots are 1-8 (2×4 tile arrangement = 16×32 pixel small Mario). OAM X values directly track RAM $0086. OAM Y values directly track RAM $00CE.

### Method 4: PPU Direct Inspection

**Technique:** Read VRAM for palette data ($3F00-$3F1F) and nametable data ($2000-$23FF).

**Key findings:**
- BG palettes at VRAM $3F00-$3F0F (4 palettes × 4 colors)
- Sprite palettes at VRAM $3F10-$3F1F
- Nametable at $2000: ground tiles are $B4/$B5 (row 26) and $B6/$B7 (row 27)
- All palette writes via `nes.ppu.vramMem[]` persist and take effect immediately

---

## Phase 3: Specific System Discoveries

### Player Physics

| Address | Name | Notes |
|---------|------|-------|
| $0086 | Player X | Screen-relative horizontal position |
| $00CE | Player Y | Screen-relative vertical position (increases downward) |
| $009F | Y Velocity | Signed byte. -4 = walk jump, -5 = run jump. Gravity adds ~+0.5/frame |
| $0057 | X Speed | Sub-pixel horizontal speed |
| $0400 | X Sub-pixel | Fractional X position |
| $000E | Player State | 8 = normal gameplay. 11 = dying. Freezing to 8 prevents death |
| $001D | Airborne Flag | 1 = in air, 0 = on ground |

**Jump height control:** Writing to $009F directly changes jump velocity. The game applies gravity each frame (+1 every ~2 frames). Setting to -16 produces a super-jump that clears 121 pixels of height (normal is ~34px). The game does NOT overwrite $009F after setting it — gravity modifies it incrementally.

### Enemy System

| Address Pattern | Name | Notes |
|-----------------|------|-------|
| $0016+slot | Enemy Type | 0=none, 6=goomba. 5 slots (0-4) |
| $0087+slot | Enemy X | Screen-relative. Parallel array to player X ($0086) |
| $00CF+slot | Enemy Y | Parallel to player Y ($00CE) |
| $0058+slot | Enemy X Speed | Sub-pixel speed. 248 (0xF8) = goomba default (moves left -0.5 px/frame) |

**Goomba speed profile:** Moves -1 pixel every 2 frames at default speed. Speed value 248 = -8 signed, but actual movement is -0.5 px/frame due to sub-pixel accumulation.

### Game State & Level System

| Address | Name | Notes |
|---------|------|-------|
| $075F | World Number | 0-indexed (0=World 1) |
| $0760 | Level Number | 0-indexed (0=Level 1) |
| $074E | Area Pointer | Index into ROM area data tables |
| $0770 | OperMode | 0=title, 1=game, 2=victory, 3=gameover |
| $0772 | OperMode Task | 0=InitArea, 1=Screen, 2=Setup, 3=Core gameplay |
| $079F | Game Mode | Secondary mode flag |
| $075A | Lives | Display shows value + 1 |
| $075E | Coins | 0-99 |
| $0756 | Powerup | 0=small, 1=big, 2=fire |
| $079E | Star Timer | Counts down each frame. >0 = invincible |

### Level Warp Mechanism

**Critical discovery:** Setting $075F/$0760 (world/level) alone does NOT load a new level. The game uses a separate area pointer system:

1. ROM table at $9CB4 maps world → offset into area entry table
2. ROM table at $9CBC (40 entries) encodes `aoIdx` (bits 6-5) and `offset` (bits 4-0)
3. ROM table at $9D28 provides base pointer per area type (4 entries)
4. Final area pointer = `base[aoIdx] + offset`

**Working warp procedure:**
```
1. Compute areaPtr from ROM tables for target world/level
2. Write $075F = world-1, $0760 = level-1
3. Write $074E = computed areaPtr
4. Write $0772 = 0 (trigger InitializeArea)
5. Wait ~250-350 frames for intro screen + gameplay start
```

The game shows the "WORLD X-Y" intro screen, then loads the level. Verified by nametable comparison: W1-1 nametable row 24 = `24 30 26 34...`, W4-1 after warp = `47 47 24 24...` (different layout).

**Failed warp approaches:**
- Setting $075F/$0760 alone: counters change but area data doesn't reload
- Setting OperMode to 0 (title) then back to 1: didn't reliably load new area
- Death + respawn: didn't complete in time
- Persistent writes during boot: area pointer wasn't set correctly

### CHR Tile System (jsnes internals)

**Tile storage:**
- `nes.ppu.ptTile[0-511]` — 512 tile objects, each with `.pix` (64-byte array of 2-bit values)
- Index 0-255 = pattern table 0 (sprites in SMB), 256-511 = pattern table 1 (BG in SMB)
- `nes.rom.vromTile[bank][tile]` — ROM source data (2 banks of 256 tiles)
- `nes.rom.vrom[bank]` — Raw 4KB CHR-ROM bank data

**Tile modification:** Writing to `ptTile[idx].pix[]` immediately modifies the tile and persists across frames. The game doesn't refresh tiles from ROM during gameplay. Changes are visible on the next frame.

**Ground tile mapping:** Tiles $B4/$B5 = rows 26 ground surface, $B6/$B7 = row 27 ground below surface. These are in the BG pattern table (ptTile index 256+0xB4 = 436).

### Sprite Injection Mechanism

**Key insight about NES sprite rendering:**
1. Between frame() calls, the OAM shadow RAM at $0200-$02FF is modifiable
2. At the start of each frame, the NMI handler triggers DMA ($4014 write) which copies $0200-$02FF → PPU OAM
3. The PPU renders using this OAM data
4. THEN the game code runs and builds the NEXT frame's sprite list in $0200-$02FF

**Injection procedure:**
1. Write to OAM shadow ($0200+slot*4) between frame() calls
2. The next frame's DMA copies our data to PPU OAM
3. The frame renders with our sprite visible
4. The game then overwrites $0200 for the NEXT frame
5. We must re-inject every frame for persistence

**Game's sprite slot behavior:**
- The game writes Y=0xF8 (248, offscreen) for unused OAM slots
- The game only overwrites Y, leaving tile/attr/X untouched for unused slots
- ALL 64 slots have tile bytes preserved if written between frames

**Verified:** OAM slot 60 injection: wrote Y=120, tile=0x2E, X=128. PPU OAM confirmed Y=120, tile=0x2E, X=128 after one frame.

### Invincibility Mechanism

**Star timer ($079E):** Decrements by 1 each frame. When > 0, the player is immune to enemy collision. Setting it to 0xFF and refreshing every frame provides persistent invincibility.

**Death prevention ($000E freeze):** Freezing player state to 8 (normal gameplay) each frame prevents the death state transition (state 11). The game cannot change the player to the dying state if we overwrite it every frame.

Both approaches confirmed working: Mario walks through enemies without losing lives when either mechanism is active.

---

## Generalizability Assessment

### Methods that should generalize to other NES games:
1. **RAM diffing** — Universal. Any game's input-responsive addresses can be found this way.
2. **Active probing** — Universal. Write-and-observe works on any game. Just need save/restore for crash recovery.
3. **OAM correlation** — Universal. NES OAM format is standardized.
4. **PPU palette modification** — Universal. All NES games use the same palette VRAM addresses.
5. **OAM shadow injection** — Mostly universal. Most games use $0200 for OAM DMA, but some use different pages.

### SMB-specific knowledge that won't generalize:
1. Exact RAM address map (every game is different)
2. ROM table locations for level warping
3. Area pointer computation logic
4. Enemy type values
5. Player state machine values

### What an "auto-discovery" toolkit would need:
1. Automated RAM diff pipeline (done — works well)
2. Automated probe pipeline (write-observe-classify)
3. CHR tile identification (which tile indices are used for what)
4. Entity slot detection (parallel array pattern matching)
5. Game mode/state machine analysis

---

## File Summary

| File | Purpose |
|------|---------|
| `smb-api.cjs` | Working transformation API (importable module) |
| `smb-test.cjs` | Full validation test suite (9 tests, all passing) |
| `investigation-log.md` | This file — methods, findings, generalizability |
| `test-output/*.png` | Visual verification screenshots (10 images) |
| `boot-test.cjs` | Initial boot/control verification script |
| `investigate*.cjs` | Raw investigation scripts (6 rounds) |
