#!/usr/bin/env node
/**
 * smb-manifest.js — Super Mario Bros. ROM Manifest Extractor
 *
 * Reads the SMB1 ROM and extracts all ground-truth data into a manifest:
 *   - Physics tables (gravity, jump velocity, acceleration, max speed)
 *   - Level layouts (all 15 ROM-based areas decoded to object lists)
 *   - Enemy placements (all 34 enemy areas)
 *   - CHR-ROM tile sheet (512 tiles → 128×256 PNG, 16 cols × 32 rows)
 *   - Music track pointer table
 *
 * Output: ~/nes-manifests/super-mario-bros/
 *   manifest.json   — all extracted data
 *   tiles.png       — grayscale tile sheet
 *
 * ROM verified: Super Mario Bros. (World).nes — 40,976 bytes
 *   iNES header: 16B | PRG-ROM: 32768B (Mapper 0 NROM) | CHR-ROM: 8192B
 */

import { readFileSync, writeFileSync, mkdirSync } from 'fs';
import { join } from 'path';
import os from 'os';
import sharp from 'sharp';

// ─── Paths ────────────────────────────────────────────────────────────────────

const ROM_PATH = join(os.homedir(), 'nes-roms/Super Mario Bros. (World).nes');
const OUT_DIR  = join(os.homedir(), 'nes-manifests/super-mario-bros');
mkdirSync(OUT_DIR, { recursive: true });

const rom = readFileSync(ROM_PATH);
console.log(`ROM loaded: ${rom.length} bytes`);

// ─── Address helpers ──────────────────────────────────────────────────────────

// NES CPU address → ROM file byte offset (Mapper 0, 32KB PRG, single bank)
const cpu2f = (addr) => addr - 0x8000 + 0x10;

// Read n bytes starting at CPU address, returns plain Array
const cpuRead = (addr, n) => Array.from(rom.slice(cpu2f(addr), cpu2f(addr) + n));

// Read a full ROM file slice by absolute file offset
const fileRead = (offset, n) => Array.from(rom.slice(offset, offset + n));

// ─── 1. PHYSICS ───────────────────────────────────────────────────────────────
// All sub-pixel values: 1 pixel = 16 sub-pixels.
// Confirmed offsets from direct ROM byte analysis (Sessions 1–2).

const physics = {
  _note: '1 pixel = 16 sub-pixels (4-bit fractional). Signed 8-bit where noted.',

  // Upward force applied each frame while button held. Timer 8→0 as apex nears.
  // Values: 07 07 06 05 04 03 02 01 00  (sub-px / frame, decreasing)
  jump_force_table: {
    cpu_addr: '0x9AA5',
    values: cpuRead(0x9AA5, 9),
  },

  // Downward force added each frame while falling. Timer 0→8 (building momentum).
  // Values: 03 03 04 05 06 07 08 09 0A  (sub-px / frame, increasing)
  fall_force_table: {
    cpu_addr: '0x9AAE',
    values: cpuRead(0x9AAE, 9),
  },

  // Initial vertical speed on jump, integer part (pixels/frame, signed 8-bit).
  // Index: 0=standing, 1=walking, 2=running. Negative = upward (NES Y↓).
  // Values: 00 20 FF → standing, walking, running
  jump_velocity_integer: {
    cpu_addr: '0xB44D',
    values: cpuRead(0xB44D, 3),
  },

  // Sub-pixel companion for jump velocity (fractional part).
  // Values: 00 FF 01
  jump_velocity_subpx: {
    cpu_addr: '0xB44A',
    values: cpuRead(0xB44A, 3),
  },

  // Horizontal acceleration (sub-px/frame²) by speed tier, 9 entries.
  // Values: 04 04 04 05 05 05 06 06 06 → 0.25–0.375 px/frame²
  walk_acceleration: {
    cpu_addr: '0xBA89',
    values: cpuRead(0xBA89, 9),
  },

  // Maximum horizontal speed per speed tier, 10 entries (sub-px/frame).
  // Values: 19 19 1A 1A 1C 1D 1D 1E 1E 1F → 1.5625–1.9375 px/frame
  max_speed: {
    cpu_addr: '0xFFF0',
    values: cpuRead(0xFFF0, 10),
  },

  subpixels_per_pixel: 16,
};

console.log('Physics extracted.');

// ─── 2. LEVEL LAYOUT DECODER ─────────────────────────────────────────────────
// Area object pointer tables: LO at CPU $9D28, HI at $9D4E (34 entries each).
// Loaded into ZP $E7/$E8 by area object loader at $9C50–$9CA3.
// ($805A/$806D are palette setup tables — different system entirely.)
//
// Area object data format (2 bytes per object):
//   Terminator: Byte1=0xFD → end of stream (checked before nibble decode).
//               Byte2 may validly be 0xFD (e.g. flagpole) — not a terminator.
//   Byte1: XXXXYYYY  X=page-relative column (0–15), Y=row (0–15)
//     Y=0x0D: background scenery change (Byte2=style)
//     Y=0x0E: platform/color type change (Byte2=style)
//     Y=0x0F: page advance (increment current page)
//   Byte2: TTTTSSS   T=object type (0–15), S=size/extra (0–15)
//
// Object types (rows 0–12, below special rows):
//   0x0 = Question block (power-up: mushroom or fire flower by level)
//   0x1 = Question block (coin)
//   0x2 = Hidden block (coin)
//   0x3 = Hidden block (1-up)
//   0x4 = Brick (normal, breakable as big Mario)
//   0x5 = Brick with mushroom
//   0x6 = Brick with vine
//   0x7 = Brick with star
//   0x8 = Brick with multi-coin
//   0x9 = Brick with 1-up
//   0xA = Used block (inactive ?)
//   0xB = Solid ground block row (horizontal, length=size)
//   0xC = Staircase step (ascending right, height=size)
//   0xD = Bridge / rope (horizontal)
//   0xE = Pipe (vertical, height=size+2, or size+1 depending on variant)
//   0xF = Flag pole

const LEVEL_OBJ_TYPE_NAMES = [
  'question_powerup', 'question_coin', 'hidden_coin', 'hidden_1up',
  'brick', 'brick_mushroom', 'brick_vine', 'brick_star',
  'brick_multicoin', 'brick_1up', 'used_block', 'ground_row',
  'staircase', 'bridge', 'pipe', 'flagpole',
];

// bits 5–4 of header byte 1: 00=above_ground, 01=underground, 10=underwater, 11=castle
// Verified: area 1 (W1-1, overworld) has h0=0x4D → bits5-4=00 → above_ground ✓
//           area 3 (castle w/ no-timer) has h0=0xFE → bits5-4=11 → castle ✓
const AREA_TYPE_NAMES = ['above_ground', 'underground', 'underwater', 'castle'];

function decodeAreaHeader(b1, b2) {
  // Byte1: bits[7:6]=time, bits[5:4]=bg_type, bits[3:0]=fg_platform
  // Byte2: bits[7:6]=scenery, bits[5:0]=extra
  const timeEncoding = (b1 >> 6) & 0x3;
  const timeLimits   = [400, 300, 200, 0]; // 0=no timer
  return {
    time_limit:    timeLimits[timeEncoding],
    bg_type_raw:   (b1 >> 4) & 0x3,
    fg_platform:   b1 & 0xF,
    scenery:       (b2 >> 6) & 0x3,
    extra:         b2 & 0x3F,
    raw:           [b1, b2],
  };
}

function decodeArea(areaIdx, ptr) {
  if (ptr < 0x8000) {
    return { area: areaIdx, ptr: `0x${ptr.toString(16).toUpperCase()}`, source: 'RAM_dynamic', objects: [] };
  }

  const startOff = cpu2f(ptr);
  // Safety: read up to 512 bytes max
  const maxBytes = Math.min(512, rom.length - startOff);
  const data     = Array.from(rom.slice(startOff, startOff + maxBytes));

  // First 2 bytes are the area header
  const header = decodeAreaHeader(data[0], data[1]);
  const objects = [];
  let offset = 2;   // start after header
  let page   = 0;
  let rawBytes = data.slice(0, 2); // will grow

  while (offset + 1 < data.length) {
    const b1 = data[offset];
    // Terminator: first byte === 0xFD ends the stream (CMP #$FD at CPU $9516/$95A1)
    // Note: b2 may validly be 0xFD (e.g. flagpole), so we check b1 first.
    if (b1 === 0xFD) { offset++; break; }

    const b2 = data[offset + 1];
    rawBytes.push(b1, b2);
    offset += 2;

    const x_col = (b1 >> 4) & 0xF;
    const y_row = b1 & 0xF;
    const type  = (b2 >> 4) & 0xF;
    const param = b2 & 0xF;

    if (y_row === 0xF) {
      // Page advance
      page++;
      objects.push({ kind: 'page_advance', page_after: page, raw: [b1, b2] });
    } else if (y_row === 0xD) {
      // Background scenery
      objects.push({ kind: 'scenery', page, x: page * 16 + x_col, style: b2, raw: [b1, b2] });
    } else if (y_row === 0xE) {
      // Platform/color type change
      objects.push({ kind: 'color_change', page, x: page * 16 + x_col, style: b2, raw: [b1, b2] });
    } else {
      // Normal object
      const abs_x = page * 16 + x_col;
      objects.push({
        kind:        'object',
        type_id:     type,
        type_name:   LEVEL_OBJ_TYPE_NAMES[type] ?? `type_${type}`,
        x:           abs_x,         // absolute column (1 col = 16px)
        y:           y_row,         // row (0 = ground area, higher = further from sky)
        param,                       // length or extra param
        page,
        x_col,
        raw:         [b1, b2],
      });
    }
  }

  // Determine area type from header (best effort)
  const bgType    = header.bg_type_raw;
  const areaType  = AREA_TYPE_NAMES[bgType] ?? `type_${bgType}`;
  const rawEndOff = startOff + offset;

  return {
    area:      areaIdx,
    ptr:       `0x${ptr.toString(16).toUpperCase()}`,
    source:    'ROM',
    file_offset: startOff,
    header,
    area_type: areaType,
    total_objects: objects.filter(o => o.kind === 'object').length,
    total_pages:   page,
    objects,
    raw_hex: data.slice(0, offset).map(b => b.toString(16).padStart(2, '0')).join(' '),
  };
}

// Read area object pointer tables (34 entries each).
// $805A/$806D are palette setup tables — NOT level data. Correct tables:
//   LO: $9D28  HI: $9D4E  (confirmed by ZP $E7/$E8 area object loader at $9C50–$9CA3)
const levelLoTable = cpuRead(0x9D28, 34);
const levelHiTable = cpuRead(0x9D4E, 34);

const areas = [];
for (let i = 0; i < 34; i++) {
  const ptr = (levelHiTable[i] << 8) | levelLoTable[i];
  areas.push(decodeArea(i, ptr));
}

const romAreas   = areas.filter(a => a.source === 'ROM');
const ramAreas   = areas.filter(a => a.source === 'RAM_dynamic');
console.log(`Level areas: ${romAreas.length} ROM-based, ${ramAreas.length} RAM/dynamic`);

// ─── 3. ENEMY DATA DECODER ────────────────────────────────────────────────────
// Enemy pointer tables: lo at $9CE4, hi at $9D06 (34 entries each).
//
// Enemy data format (2 bytes per entry):
//   Byte1 = 0xFF → end of enemy data
//   Byte1: hppp cccc
//     h    = hard_mode_only (bit 7) — only spawns in hard mode / later loops
//     ppp  = absolute page number (bits 6–4, 0–7)
//     cccc = x column within page (bits 3–0, 0–15, in 16-pixel tile units)
//   Byte2: tttt yyyy
//     tttt = enemy type (bits 7–4)
//     yyyy = y row (bits 3–0)
//
// abs_x = page * 16 + col  (tile units, 1 tile = 16 pixels)
// No separate page-advance entries — page is embedded in byte 1.
//
// Note: world→enemy-area mapping is via $9CB4 (world bases) + $9CBC (level info)
//   + $9CE0 (area-type base) + $9CE4/$9D06 (enemy ptr tables). See section 7.
//
// Known enemy types (Byte2 high nibble):
const ENEMY_TYPE_NAMES = {
  0x0: 'goomba',
  0x1: 'koopa_troopa_green',
  0x2: 'koopa_troopa_red',
  0x3: 'buzzy_beetle',
  0x4: 'koopa_troopa_green_shell',
  0x5: 'koopa_troopa_noedge',
  0x6: 'hammer_brother',
  0x7: 'piranha_plant',
  0x8: 'koopa_paratroopa_leaping',
  0x9: 'koopa_paratroopa_flying',
  0xA: 'koopa_paratroopa_horizontal',
  0xB: 'lakitu',
  0xC: 'spiny',
  0xD: 'cheep_cheep_jumping',
  0xE: 'cheep_cheep_swimming',
  0xF: 'bullet_bill',
};

function decodeEnemyArea(areaIdx, ptr) {
  if (ptr < 0x8000) {
    return { area: areaIdx, ptr: `0x${ptr.toString(16).toUpperCase()}`, source: 'RAM_dynamic', enemies: [] };
  }

  const startOff = cpu2f(ptr);
  const maxBytes = Math.min(256, rom.length - startOff);
  const data     = Array.from(rom.slice(startOff, startOff + maxBytes));

  const enemies = [];
  let offset = 0;

  while (offset + 1 < data.length) {
    const b1 = data[offset];

    if (b1 === 0xFF) {
      offset++;
      break;
    }

    const b2 = data[offset + 1];
    offset += 2;

    // Byte1: hppp cccc — page embedded, no separate page-advance markers
    const hard_mode = (b1 >> 7) & 1;
    const page      = (b1 >> 4) & 0x7;  // absolute page within area
    const col       = b1 & 0xF;         // tile column within page
    const etype     = (b2 >> 4) & 0xF;
    const y_row     = b2 & 0xF;
    const abs_x     = page * 16 + col;  // absolute tile column

    enemies.push({
      kind:       'enemy',
      type_id:    etype,
      type_name:  ENEMY_TYPE_NAMES[etype] ?? `type_0x${etype.toString(16)}`,
      x:          abs_x,
      y:          y_row,
      page,
      col_in_page: col,
      hard_mode_only: hard_mode === 1,
      raw:        [b1, b2],
    });
  }

  const rawLen = offset;
  return {
    area:      areaIdx,
    ptr:       `0x${ptr.toString(16).toUpperCase()}`,
    source:    'ROM',
    file_offset: startOff,
    total_enemies: enemies.filter(e => e.kind === 'enemy').length,
    enemies,
    raw_hex: data.slice(0, rawLen).map(b => b.toString(16).padStart(2, '0')).join(' '),
  };
}

const enemyLoTable = cpuRead(0x9CE4, 34);
const enemyHiTable = cpuRead(0x9D06, 34);

const enemyAreas = [];
for (let i = 0; i < 34; i++) {
  const ptr = (enemyHiTable[i] << 8) | enemyLoTable[i];
  enemyAreas.push(decodeEnemyArea(i, ptr));
}

console.log(`Enemy areas: ${enemyAreas.filter(a => a.source === 'ROM').length} decoded`);

// ─── 4. POWER-UP STATE MACHINE ────────────────────────────────────────────────

const powerUp = {
  _note: 'Player power state in RAM $001D. FSM at CPU $EFFC.',
  ram_addr: '0x001D',
  fsm_cpu_addr: '0xEFFC',
  states: {
    0: 'small',
    1: 'big',
    2: 'fire',
    3: 'star',
  },
  // 10-step color cycle table (fire + star visual cycling). CPU $F09C.
  // Values 0–2 index into 3 palette variants. Cycles through 10 frames then wraps.
  color_cycle_table: {
    cpu_addr: '0xF09C',
    values: cpuRead(0xF09C, 10),
  },
  // Star invincibility flash palette (NES color indices with hi bits). CPU $FF6E.
  star_flash_palette: {
    cpu_addr: '0xFF6E',
    values: cpuRead(0xFF6E, 16),
    _note: 'Mask & 0x3F for actual NES palette index. Cycles: yellow→orange→red→gray.',
  },
};

// ─── 5. MUSIC ─────────────────────────────────────────────────────────────────
// Music engine: CPU $F400–$F800 (second ROM bank).
// Song number RAM: $07B2. Track init code: CPU ~$F700.
// Channel data pointer: ZP $F5 (lo) / $F6 (hi), read via LDA ($F5),Y.
// Track redirect table: CPU $F90C (index → Y offset for channel pointer lookup).
// Channel pointer tables: $F90E (lo) / $F90F (hi), indexed by redirected Y.
//
// Note frequency table: CPU $FF01 (lo byte), CPU $FF00 (hi byte).
//   APU period = ($FF00[i] << 8 & 7) | $FF01[i]
//   Frequency (NTSC): f = 1,789,773 / (16 × (period + 1)) Hz
//   Table covers ~40 notes: E3 (index 3) through G6+.
//   Indices 0–2 are special (high-pitch slide, unused, rest).

const noteHi = cpuRead(0xFF00, 42);
const noteLo = cpuRead(0xFF01, 42);
const noteTable = noteHi.map((hi, i) => {
  const period = ((hi & 0x07) << 8) | noteLo[i];
  const freq   = period === 0 ? 0 : Math.round(1789773 / (16 * (period + 1)));
  return { index: i, period_hi: hi, period_lo: noteLo[i], period, freq_hz: freq };
});

// Track redirect table (first 16 entries)
const trackRedirect = cpuRead(0xF90C, 16);

// Build track pointer table for first 8 track slots
const trackPointers = [];
for (let songIdx = 0; songIdx < 8; songIdx++) {
  // Song 0 init: A starts as 1 → LSR immediately finds carry → Y stays at song index
  // Redirect Y = value from $F90C[songIdx]
  const redirectY = trackRedirect[songIdx];
  if (redirectY < 256) {
    const loAddr = 0xF90E + redirectY;
    const hiAddr = 0xF90F + redirectY;
    if (loAddr < 0x10000 && hiAddr < 0x10000) {
      const lo = rom[cpu2f(loAddr)] ?? 0;
      const hi = rom[cpu2f(hiAddr)] ?? 0;
      const channelPtr = (hi << 8) | lo;
      trackPointers.push({
        song_index:    songIdx,
        redirect_y:    redirectY,
        channel_ptr:   `0x${channelPtr.toString(16).toUpperCase()}`,
        channel_lo:    lo,
        channel_hi:    hi,
      });
    }
  }
}

const music = {
  _note: 'Music engine at CPU $F400–$F800. Song number in RAM $07B2.',
  song_number_ram: '0x07B2',
  engine_range: { start: '0xF400', end: '0xF800' },
  channel_subroutines: {
    pulse1:   '0xF41B',
    pulse2:   '0xF57C',
    triangle: '0xF667',
    noise:    '0xF694',
  },
  track_redirect_table: {
    cpu_addr: '0xF90C',
    values:   trackRedirect,
  },
  channel_pointer_table_lo: '0xF90E',
  channel_pointer_table_hi: '0xF90F',
  track_pointers: trackPointers,
  note_frequency_table: {
    lo_cpu_addr: '0xFF01',
    hi_cpu_addr: '0xFF00',
    count:       42,
    notes:       noteTable,
  },
};

// ─── 6. CHR-ROM TILE EXTRACTION ───────────────────────────────────────────────
// CHR-ROM starts at file offset 0x8010 (after 16-byte header + 32768-byte PRG).
// 8192 bytes = 512 tiles × 16 bytes/tile. Each tile: 8×8 pixels, 2 bits/pixel.
//
// NES 2bpp tile encoding:
//   Bytes 0–7:  bit plane 0 (LSB of each pixel)
//   Bytes 8–15: bit plane 1 (MSB of each pixel)
//   Pixel color index = (plane1_bit << 1) | plane0_bit → 0,1,2,3
//
// Tile sheet: 16 tiles wide × 32 rows = 512 tiles → 128×256 pixels.
// SMB1 bank layout: Sprites at PPU $0000 (tiles 0–255), BG at PPU $1000 (tiles 256–511).

const CHR_OFFSET     = 0x8010;  // file offset
const CHR_SIZE       = 8192;
const TOTAL_TILES    = 512;
const TILES_PER_ROW  = 16;
const TILE_ROWS      = 32;
const IMG_W          = TILES_PER_ROW * 8;  // 128
const IMG_H          = TILE_ROWS     * 8;  // 256

const chrData = rom.slice(CHR_OFFSET, CHR_OFFSET + CHR_SIZE);
const pixels  = new Uint8Array(IMG_W * IMG_H); // 1-channel grayscale

// Grayscale palette: 0→black, 1→dark gray, 2→light gray, 3→white
const grayPalette = [0, 85, 170, 255];

for (let t = 0; t < TOTAL_TILES; t++) {
  const tileOff = t * 16;
  const tileCol = t % TILES_PER_ROW;
  const tileRow = Math.floor(t / TILES_PER_ROW);
  const baseX   = tileCol * 8;
  const baseY   = tileRow * 8;

  for (let row = 0; row < 8; row++) {
    const plane0 = chrData[tileOff + row];
    const plane1 = chrData[tileOff + row + 8];
    for (let col = 0; col < 8; col++) {
      const bit       = 7 - col;
      const colorIdx  = ((plane1 >> bit) & 1) << 1 | ((plane0 >> bit) & 1);
      pixels[(baseY + row) * IMG_W + (baseX + col)] = grayPalette[colorIdx];
    }
  }
}

// ─── 7. WORLD-LEVEL MAPPING ──────────────────────────────────────────────────
// $9CB4 (10 bytes): world base indices into $9CBC
// $9CBC (40 bytes): level info — bits 6-5 = ao_idx (0-3), bits 4-0 = level_offset
//   ao_idx selects one of 4 area-object templates (0-3 in $9D28/$9D4E)
//   enemy_area = $9CE0[bits 6-5] + level_offset
// $9CE0 (8 bytes): base enemy area by level-type (0=swim, 1=standard, 2=water/bridge, 3=castle)
// Note: worlds 1,2,4,7,8 have 5 internal sub-areas; worlds 3,5,6 have 4.
//   The LAST sub-area per world (bits6-5=3) is always the castle.
//   What players call "W1-4 (castle)" is internal sub-area 4 (0-indexed), not sub-area 3.

const worldBases  = cpuRead(0x9CB4, 10);
const levelInfo   = cpuRead(0x9CBC, 40);
const enemyBases  = cpuRead(0x9CE0, 8);  // 8 entries, [0..3] used

const worldLevelMap = [];
for (let w = 0; w < 8; w++) {
  const base     = worldBases[w];
  const nextBase = worldBases[w + 1] ?? 40;
  const count    = nextBase - base;
  for (let l = 0; l < count; l++) {
    const val         = levelInfo[base + l];
    const aoIdx       = (val >> 5) & 0x3;  // area-object template index (0-3)
    const levelOffset = val & 0x1F;
    const levelType   = (val >> 5) & 0x3;  // same 2 bits; see comment above
    const enemyBase   = enemyBases[levelType] ?? 0;
    const enemyArea   = enemyBase + levelOffset;
    const isCastle    = levelType === 3;
    const validEnemyArea = enemyArea < 34;
    worldLevelMap.push({
      world:       w + 1,
      sub_level:   l + 1,
      val:         `0x${val.toString(16).padStart(2, '0')}`,
      ao_idx:      aoIdx,
      enemy_area:  enemyArea,
      is_castle:   isCastle,
      valid:       validEnemyArea,
      _note:       isCastle ? 'castle' : (!validEnemyArea ? 'post-game/special' : ''),
    });
  }
}

const worldAreaNotes = {
  1:  'W1-1 template (above_ground, scenery only — enemies added separately)',
  12: 'Longest castle area (87 objects, 8 pages — likely W8-4)',
  28: 'Longest area in game (146 objects, 9 pages)',
  29: 'Long above-ground level (70 objects, 7 pages)',
};

// ─── 8. ASSEMBLE MANIFEST ────────────────────────────────────────────────────

const manifest = {
  _generated:  new Date().toISOString(),
  game:        'Super Mario Bros.',
  rom_file:    'Super Mario Bros. (World).nes',
  rom_size:    rom.length,
  mapper:      0,
  prg_rom_bytes: 32768,
  chr_rom_bytes: 8192,

  physics,
  power_up: powerUp,
  music,

  level_pointer_table: {
    lo_addr: '0x9D28',
    hi_addr: '0x9D4E',
    count:    34,
    entries:  areas.map(a => ({
      area:     a.area,
      ptr:      a.ptr,
      source:   a.source,
      note:     worldAreaNotes[a.area] ?? '',
    })),
  },

  areas: areas.map(a => {
    if (a.source !== 'ROM') return { area: a.area, ptr: a.ptr, source: a.source };
    return {
      area:          a.area,
      ptr:           a.ptr,
      file_offset:   a.file_offset,
      area_type:     a.area_type,
      header:        a.header,
      total_pages:   a.total_pages,
      total_objects: a.total_objects,
      note:          worldAreaNotes[a.area] ?? '',
      objects:       a.objects,
      raw_hex:       a.raw_hex,
    };
  }),

  enemy_pointer_table: {
    lo_addr: '0x9CE4',
    hi_addr: '0x9D06',
    count:    34,
  },

  enemy_areas: enemyAreas,

  world_level_map: worldLevelMap,

  tile_sheet: {
    file_offset_hex: `0x${CHR_OFFSET.toString(16).toUpperCase()}`,
    chr_rom_bytes:   CHR_SIZE,
    total_tiles:     TOTAL_TILES,
    tiles_per_row:   TILES_PER_ROW,
    tile_rows:       TILE_ROWS,
    image_width_px:  IMG_W,
    image_height_px: IMG_H,
    bank_layout: {
      bank0_ppu_0x0000: 'sprites (tiles 0–255)',
      bank1_ppu_0x1000: 'background (tiles 256–511)',
      _note: 'SMB1 PPUCTRL=0x90: BG at $1000, sprites at $0000',
    },
    output_file: 'tiles.png',
  },
};

// ─── 9. WRITE OUTPUTS ────────────────────────────────────────────────────────

// tiles.png
const tilesPath = join(OUT_DIR, 'tiles.png');
await sharp(Buffer.from(pixels), {
  raw: { width: IMG_W, height: IMG_H, channels: 1 },
})
  .png({ compressionLevel: 6 })
  .toFile(tilesPath);
console.log(`tiles.png written: ${IMG_W}×${IMG_H}px (${TOTAL_TILES} tiles)`);

// manifest.json
const manifestPath = join(OUT_DIR, 'manifest.json');
writeFileSync(manifestPath, JSON.stringify(manifest, null, 2));
const manifestSize = readFileSync(manifestPath).length;
console.log(`manifest.json written: ${(manifestSize / 1024).toFixed(1)} KB`);

// ─── 10. SUMMARY ─────────────────────────────────────────────────────────────

console.log('\n=== SMB1 Manifest Summary ===');
console.log(`Output: ${OUT_DIR}`);
console.log('');
console.log('Physics tables:');
console.log(`  jump_force:    [${physics.jump_force_table.values}]`);
console.log(`  fall_force:    [${physics.fall_force_table.values}]`);
console.log(`  jump_vel_int:  [${physics.jump_velocity_integer.values}]`);
console.log(`  walk_accel:    [${physics.walk_acceleration.values}]`);
console.log(`  max_speed:     [${physics.max_speed.values}]`);
console.log('');
console.log('Level areas decoded:');
areas.forEach(a => {
  if (a.source === 'ROM') {
    const n = a.objects?.filter(o => o.kind === 'object').length ?? 0;
    console.log(`  Area ${String(a.area).padStart(2)}: ${a.ptr}  ${a.area_type?.padEnd(12) ?? ''.padEnd(12)}  ${n} objects  ${a.total_pages ?? 0} pages  ${worldAreaNotes[a.area] ? '← ' + worldAreaNotes[a.area] : ''}`);
  } else {
    console.log(`  Area ${String(a.area).padStart(2)}: ${a.ptr}  RAM/dynamic`);
  }
});
console.log('');
console.log('Enemy areas decoded:');
enemyAreas.slice(0, 10).forEach(ea => {
  if (ea.source === 'ROM') {
    const n = ea.enemies?.filter(e => e.kind === 'enemy').length ?? 0;
    console.log(`  Area ${String(ea.area).padStart(2)}: ${ea.ptr}  ${n} enemies`);
  }
});
if (enemyAreas.length > 10) console.log(`  ... and ${enemyAreas.length - 10} more`);
console.log('');
console.log(`Tiles: ${TOTAL_TILES} tiles → ${tilesPath}`);
console.log(`\nDone. manifest.json: ${(manifestSize / 1024).toFixed(1)} KB`);
