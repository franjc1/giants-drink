#!/usr/bin/env node
// analyze-balloon-fight.js
// Static PRG-ROM analysis + CHR-ROM extraction for Balloon Fight (USA)
// Strategy: pure pattern analysis — no ROM documentation consulted.
// Reasoning is logged for every finding.

'use strict';
const fs   = require('fs');
const path = require('path');
const sharp = require('sharp');

// ── 1. PARSE HEADER ──────────────────────────────────────────────────────────

const ROM_PATH = '/Users/joe/nes-roms/Balloon Fight (USA).nes';
const OUT_DIR  = '/Users/joe/nes-manifests/balloon-fight';
fs.mkdirSync(OUT_DIR, { recursive: true });

const rom = fs.readFileSync(ROM_PATH);

const header = {
  magic    : rom.slice(0,4).toString('ascii'),
  prg_banks: rom[4],          // 16KB units
  chr_banks: rom[5],          // 8KB units
  flags6   : rom[6],
  flags7   : rom[7],
  mapper   : (rom[7] & 0xF0) | (rom[6] >> 4),
  mirroring: (rom[6] & 0x01) ? 'vertical' : 'horizontal',
  battery  : !!(rom[6] & 0x02),
  trainer  : !!(rom[6] & 0x04),
};

const TRAINER_OFF = header.trainer ? 512 : 0;
const PRG_START   = 16 + TRAINER_OFF;
const PRG_SIZE    = header.prg_banks * 16384;
const CHR_START   = PRG_START + PRG_SIZE;
const CHR_SIZE    = header.chr_banks * 8192;

const prg = Buffer.from(rom.buffer, rom.byteOffset + PRG_START, PRG_SIZE);
const chr = Buffer.from(rom.buffer, rom.byteOffset + CHR_START, CHR_SIZE);

// NROM-128: both $8000-$BFFF and $C000-$FFFF mirror the single 16KB PRG bank
const PRG_MIRROR_BASE = 0x8000;

function cpuToOffset(addr) {
  if (addr < 0x8000) return null;
  return addr & (PRG_SIZE - 1);   // mask to 16KB
}

function read16(buf, off) {
  return buf[off] | (buf[off+1] << 8);
}

// ── 2. INTERRUPT VECTORS ─────────────────────────────────────────────────────

const nmi_vec   = read16(prg, 0x3FFA);
const reset_vec = read16(prg, 0x3FFC);
const irq_vec   = read16(prg, 0x3FFE);

console.log(`\n=== Interrupt Vectors ===`);
console.log(`  NMI:   $${nmi_vec.toString(16).padStart(4,'0').toUpperCase()}`);
console.log(`  Reset: $${reset_vec.toString(16).padStart(4,'0').toUpperCase()}`);
console.log(`  IRQ:   $${irq_vec.toString(16).padStart(4,'0').toUpperCase()}`);

// ── 3. 6502 OPCODE HINTS ─────────────────────────────────────────────────────
// These are the patterns we will scan for, with their semantic meaning.
//   STA abs    = 8D lo hi   → writes to memory (watch for $40xx = APU writes)
//   LDA imm    = A9 xx      → load literal constant
//   LDX imm    = A2 xx
//   LDY imm    = A0 xx
//   JSR abs    = 20 lo hi   → call subroutine (for building call graph)
//   JMP abs    = 4C lo hi
//   JMP (ind)  = 6C lo hi   → indirect jump (watch for jump tables)

// ── 4. POINTER TABLE DETECTION ───────────────────────────────────────────────
// Valid PRG address range for NROM-128: $8000-$BFFF.
// A pointer table is a contiguous run of ≥3 little-endian words where
// every word falls inside [$8000, $BFFF].
// Reasoning: this range is tighter than just "any ROM address" because we
// know the PRG is 16KB and mirrored; legitimate pointers should all cluster
// in the same half. Using both $8000 and $C000 variants as valid targets.

function findPointerTables(prg) {
  const tables = [];
  let i = 0;
  while (i < prg.length - 3) {
    const p0 = read16(prg, i);
    const inRange = (a) => (a >= 0x8000 && a <= 0xBFFF) || (a >= 0xC000 && a <= 0xFFFF);
    if (inRange(p0)) {
      let count = 1;
      let j = i + 2;
      while (j <= prg.length - 2) {
        const p = read16(prg, j);
        if (inRange(p)) { count++; j += 2; }
        else break;
      }
      if (count >= 4) {  // require ≥4 entries to avoid false positives in code
        const ptrs = [];
        for (let k = 0; k < count; k++) {
          ptrs.push(read16(prg, i + k*2));
        }
        tables.push({
          file_offset : `0x${(PRG_START + i).toString(16).padStart(5,'0')}`,
          prg_offset  : `0x${i.toString(16).padStart(4,'0')}`,
          cpu_addr    : `$${(0xC000 + i).toString(16).toUpperCase().padStart(4,'0')}`,
          entry_count : count,
          entries     : ptrs.map(p => `$${p.toString(16).toUpperCase().padStart(4,'0')}`),
        });
        i = j;
        continue;
      }
    }
    i++;
  }
  return tables;
}

// ── 5. APU WRITE DETECTION (music/sfx engine location) ───────────────────────
// Pattern: STA $40XX = 8D XX 40 where XX is $00-$17
// Also: STA $4014 (OAM DMA) is excluded (gameplay, not music).
// Reasoning: the NES APU is memory-mapped at $4000-$4017.
// Finding clusters of STA $40XX reveals where the music driver is.

function findApuWrites(prg) {
  const writes = [];
  for (let i = 0; i < prg.length - 2; i++) {
    if (prg[i] === 0x8D && prg[i+2] === 0x40) {
      const reg = prg[i+1];
      if (reg <= 0x17 && reg !== 0x14) {  // exclude OAM DMA
        const cpu = 0xC000 + i;
        writes.push({
          prg_offset: `0x${i.toString(16).padStart(4,'0')}`,
          cpu_addr  : `$${cpu.toString(16).toUpperCase().padStart(4,'0')}`,
          apu_reg   : `$40${reg.toString(16).padStart(2,'0').toUpperCase()}`,
          opcode_hex: `8D ${prg[i+1].toString(16).padStart(2,'0').toUpperCase()} 40`,
        });
      }
    }
  }
  return writes;
}

// ── 6. INDIRECT JUMP TABLES (6C = JMP (indirect)) ────────────────────────────
// Pattern: 6C XX XX
// These often head dispatch tables in game loops.

function findIndirectJumps(prg) {
  const jumps = [];
  for (let i = 0; i < prg.length - 2; i++) {
    if (prg[i] === 0x6C) {
      const targetAddr = read16(prg, i+1);
      jumps.push({
        prg_offset  : `0x${i.toString(16).padStart(4,'0')}`,
        cpu_addr    : `$${(0xC000 + i).toString(16).toUpperCase().padStart(4,'0')}`,
        vector_addr : `$${targetAddr.toString(16).toUpperCase().padStart(4,'0')}`,
      });
    }
  }
  return jumps;
}

// ── 7. JSR CALL FREQUENCY (subroutine discovery) ─────────────────────────────
// Pattern: 20 lo hi
// Subroutines called frequently are likely important (game loop, physics step, etc.)

function findFrequentJSR(prg, topN=20) {
  const calls = {};
  for (let i = 0; i < prg.length - 2; i++) {
    if (prg[i] === 0x20) {
      const target = read16(prg, i+1);
      if (target >= 0x8000) {
        const k = `$${target.toString(16).toUpperCase().padStart(4,'0')}`;
        calls[k] = (calls[k] || 0) + 1;
      }
    }
  }
  return Object.entries(calls)
    .sort((a,b) => b[1]-a[1])
    .slice(0, topN)
    .map(([addr,count]) => ({ addr, call_count: count }));
}

// ── 8. SMALL LOOKUP TABLES (physics constant candidates) ─────────────────────
// Look for LDA $XXXX,X patterns (opcode BD) followed by RTS or a branch,
// which is the classic "lookup table" access pattern.
// Also look for "LDA #imm ; STA zpg" sequences near known physics-y RAM ranges.
//
// Strategy: find runs of 4-16 bytes that are all small (≤128) and not zero,
// in the middle of a code region (surrounded by valid 6502 opcodes).
// These are often physics deltas, speed caps, jump velocities, etc.

// Heuristic: scan for LDA abs,X (BD XX XX) or LDA zpg,X (B5 XX)
// and report the table they point to.
function findLdaTableRefs(prg) {
  const refs = [];
  for (let i = 0; i < prg.length - 2; i++) {
    // LDA abs,X = BD lo hi
    if (prg[i] === 0xBD) {
      const tableAddr = read16(prg, i+1);
      if (tableAddr >= 0x8000) {
        const off = tableAddr & 0x3FFF;
        // Read up to 16 bytes at that table
        const sample = Array.from(prg.slice(off, Math.min(off+16, prg.length)));
        refs.push({
          insn_prg_offset : `0x${i.toString(16).padStart(4,'0')}`,
          insn_cpu        : `$${(0xC000+i).toString(16).toUpperCase().padStart(4,'0')}`,
          table_cpu       : `$${tableAddr.toString(16).toUpperCase().padStart(4,'0')}`,
          sample_hex      : sample.map(b => b.toString(16).padStart(2,'0')).join(' '),
          sample_decimal  : sample.join(', '),
        });
      }
    }
  }
  return refs;
}

// ── 9. STRUCTURED ENEMY/LEVEL RECORDS ────────────────────────────────────────
// Enemy placement records in NES games often look like:
//   [type] [x_pixel] [y_pixel]  (3-byte records)
// or
//   [x_tile] [y_tile] [type]
// Terminated by $FF or $00.
//
// Strategy: find runs of N×3 bytes where:
//   - byte[0] is small (0-15, entity type)
//   - byte[1] is 0-255 (x coordinate)
//   - byte[2] is 0-239 (y coordinate, NES screen is 240px)
// Terminated by $FF.
// This is a heuristic; false positives are possible.

function findEnemyRecords(prg) {
  const candidates = [];
  let i = 0;
  while (i < prg.length - 3) {
    // Look for $FF-terminated run of 3-byte records where:
    // first byte 0-15 (type), second 0-255 (x), third 0-239 (y)
    const records = [];
    let j = i;
    while (j < prg.length - 2 && prg[j] !== 0xFF) {
      const type = prg[j];
      const x    = prg[j+1];
      const y    = prg[j+2];
      if (type <= 15 && y <= 239) {
        records.push({ type, x, y });
        j += 3;
      } else break;
    }
    if (records.length >= 4 && prg[j] === 0xFF) {
      candidates.push({
        prg_offset : `0x${i.toString(16).padStart(4,'0')}`,
        cpu_addr   : `$${(0xC000+i).toString(16).toUpperCase().padStart(4,'0')}`,
        record_count: records.length,
        records,
        terminator : 'FF',
      });
      i = j + 1;
      continue;
    }
    i++;
  }
  return candidates;
}

// ── 10. ZERO-PAGE WRITE CLUSTERING ───────────────────────────────────────────
// STA $xx (zero page store, opcode 85) reveals which ZP addresses hold game state.
// Clustering the target addresses reveals groups that are likely related:
//   - physics (position, velocity, accel)
//   - score/lives
//   - game state flags
// We count how many times each ZP address is written.

function analyzeZeroPageWrites(prg) {
  const counts = new Array(256).fill(0);
  for (let i = 0; i < prg.length - 1; i++) {
    // STA zp = 85 xx
    if (prg[i] === 0x85) counts[prg[i+1]]++;
    // STX zp = 86 xx
    if (prg[i] === 0x86) counts[prg[i+1]]++;
    // STY zp = 84 xx
    if (prg[i] === 0x84) counts[prg[i+1]]++;
  }
  // Return top-written zero page addresses (likely hot game state)
  const hotZP = [];
  for (let a = 0; a < 256; a++) {
    if (counts[a] >= 3) hotZP.push({ zp_addr: `$${a.toString(16).padStart(2,'0').toUpperCase()}`, write_count: counts[a] });
  }
  hotZP.sort((a,b) => b.write_count - a.write_count);
  return hotZP;
}

// ── 11. HIGH-ADDRESS MEMORY WRITE CLUSTERING ─────────────────────────────────
// STA abs = 8D lo hi, where hi is $02-$07 (likely game RAM $0200-$07FF)
// Clusters of writes to the same hi-byte page reveal RAM layout.

function analyzeAbsoluteWrites(prg) {
  const pageCount = {};
  const addrWrites = {};
  for (let i = 0; i < prg.length - 2; i++) {
    if (prg[i] === 0x8D) {
      const addr = read16(prg, i+1);
      if (addr >= 0x0200 && addr <= 0x07FF) {
        const page = addr >> 8;
        pageCount[page] = (pageCount[page]||0) + 1;
        addrWrites[`$${addr.toString(16).toUpperCase().padStart(4,'0')}`] =
          (addrWrites[`$${addr.toString(16).toUpperCase().padStart(4,'0')}`]||0)+1;
      }
    }
  }
  // Top addresses written to
  const hot = Object.entries(addrWrites)
    .sort((a,b)=>b[1]-a[1])
    .slice(0,30)
    .map(([a,c])=>({addr:a,write_count:c}));
  return { page_write_counts: pageCount, hot_addresses: hot };
}

// ── 12. DETECT COMPRESSION/RLE ────────────────────────────────────────────────
// Look for runs of identical bytes longer than 3 — rare in code, common in level data.
// Also look for patterns of (run_length, value) = simple RLE.

function findRunLengthRegions(prg, minRun=4) {
  const regions = [];
  let i = 0;
  while (i < prg.length) {
    let j = i+1;
    while (j < prg.length && prg[j] === prg[i]) j++;
    const runLen = j - i;
    if (runLen >= minRun) {
      regions.push({
        prg_offset: `0x${i.toString(16).padStart(4,'0')}`,
        cpu_addr  : `$${(0xC000+i).toString(16).toUpperCase().padStart(4,'0')}`,
        value     : `0x${prg[i].toString(16).padStart(2,'0')}`,
        run_length: runLen,
      });
    }
    i = j;
  }
  return regions;
}

// ── 13. CHR-ROM TILE EXTRACTION ───────────────────────────────────────────────
// NES CHR tiles are 8×8 pixels, 2bpp planar:
//   16 bytes per tile: bytes 0-7 = bitplane 0, bytes 8-15 = bitplane 1
//   pixel color index = bp0_bit | (bp1_bit << 1)  → 0-3
// Color index → grayscale mapping: 0=black, 1=dark, 2=mid, 3=white
// Layout: 16 tiles per row, rows of rows.

async function extractChrRom(chr, outPath) {
  const TILE_COUNT = chr.length / 16;  // 512 tiles for 8KB
  const TILES_PER_ROW = 16;
  const ROWS = Math.ceil(TILE_COUNT / TILES_PER_ROW);
  const W = TILES_PER_ROW * 8;
  const H = ROWS * 8;

  const palette = [0, 85, 170, 255];  // grayscale: 0=black, 3=white
  const pixels  = Buffer.alloc(W * H * 4, 0); // RGBA

  for (let t = 0; t < TILE_COUNT; t++) {
    const tileBase = t * 16;
    const tileX    = (t % TILES_PER_ROW) * 8;
    const tileY    = Math.floor(t / TILES_PER_ROW) * 8;

    for (let row = 0; row < 8; row++) {
      const bp0 = chr[tileBase + row];
      const bp1 = chr[tileBase + row + 8];
      for (let col = 0; col < 8; col++) {
        const bit  = 7 - col;
        const idx  = ((bp0 >> bit) & 1) | (((bp1 >> bit) & 1) << 1);
        const gray = palette[idx];
        const px   = ((tileY + row) * W + (tileX + col)) * 4;
        pixels[px]   = gray;
        pixels[px+1] = gray;
        pixels[px+2] = gray;
        pixels[px+3] = 255;
      }
    }
  }

  // Count non-blank tiles (for manifest)
  let nonBlank = 0;
  for (let t = 0; t < TILE_COUNT; t++) {
    const s = t * 16;
    for (let b = 0; b < 16; b++) if (chr[s+b] !== 0) { nonBlank++; break; }
  }

  await sharp(pixels, { raw: { width: W, height: H, channels: 4 } })
    .png()
    .toFile(outPath);

  return { tile_count: TILE_COUNT, non_blank_tiles: nonBlank, width: W, height: H };
}

// ── 14. TILE DICTIONARY (unique tiles used in both pattern tables) ─────────────
function buildTileDictionary(chr) {
  const TILE_COUNT = chr.length / 16;
  const dict = [];
  const seen = new Set();
  for (let t = 0; t < TILE_COUNT; t++) {
    const bytes = Array.from(chr.slice(t*16, t*16+16));
    const key   = bytes.join(',');
    if (!seen.has(key) && bytes.some(b => b !== 0)) {
      seen.add(key);
      dict.push({ index: t, bank: t < 256 ? 0 : 1, bytes });
    }
  }
  return dict;
}

// ── RUN ALL ANALYSIS ──────────────────────────────────────────────────────────

console.log('\n=== Running analysis...');

const ptrTables     = findPointerTables(prg);
const apuWrites     = findApuWrites(prg);
const indirectJumps = findIndirectJumps(prg);
const freqJSR       = findFrequentJSR(prg, 25);
const ldaTableRefs  = findLdaTableRefs(prg);
const enemyRecords  = findEnemyRecords(prg);
const zpWrites      = analyzeZeroPageWrites(prg);
const absWrites     = analyzeAbsoluteWrites(prg);
const rlRegions     = findRunLengthRegions(prg, 5);

// ── 15. APU WRITE CLUSTERING (music engine bounds) ───────────────────────────
// Group APU write sites by proximity — sites within 256 bytes of each other
// are likely in the same music driver function.
function clusterApuWrites(writes) {
  if (!writes.length) return [];
  const offsets = writes.map(w => parseInt(w.prg_offset, 16)).sort((a,b)=>a-b);
  const clusters = [[offsets[0]]];
  for (let i = 1; i < offsets.length; i++) {
    if (offsets[i] - clusters[clusters.length-1][clusters[clusters.length-1].length-1] < 256) {
      clusters[clusters.length-1].push(offsets[i]);
    } else {
      clusters.push([offsets[i]]);
    }
  }
  return clusters.map(c => ({
    prg_start : `0x${c[0].toString(16).padStart(4,'0')}`,
    prg_end   : `0x${c[c.length-1].toString(16).padStart(4,'0')}`,
    cpu_start : `$${(0xC000+c[0]).toString(16).toUpperCase().padStart(4,'0')}`,
    cpu_end   : `$${(0xC000+c[c.length-1]).toString(16).toUpperCase().padStart(4,'0')}`,
    write_count: c.length,
    apu_regs  : [...new Set(writes.filter(w=>parseInt(w.prg_offset,16)>=c[0] && parseInt(w.prg_offset,16)<=c[c.length-1]).map(w=>w.apu_reg))].sort(),
  }));
}

const apuClusters = clusterApuWrites(apuWrites);

// ── 16. PHYSICS CONSTANT CANDIDATES ──────────────────────────────────────────
// Look for sequences of small signed bytes (interpreted as velocities/forces)
// near the most-frequently-called subroutines.
// Heuristic: bytes where all values are in [-32, +32] for signed or [0, 64] for unsigned,
// length 4-16, not all the same value, occurring near code.
//
// More targeted: look for tables right after LDA abs,X patterns (the fetching code).
// We already have ldaTableRefs — find which ones have physics-plausible values.

function classifyTableValues(hexStr) {
  const bytes = hexStr.split(' ').map(h => parseInt(h, 16));
  const signed = bytes.map(b => b > 127 ? b - 256 : b);
  const allSmall = signed.every(v => Math.abs(v) <= 32);
  const allPositive = bytes.every(b => b <= 64);
  const nonZero = bytes.filter(b => b !== 0).length;
  const unique = new Set(bytes).size;
  return {
    bytes, signed,
    looks_like_velocity: allSmall && unique >= 3,
    looks_like_coords  : allPositive && unique >= 3,
    non_zero_count     : nonZero,
    unique_count       : unique,
  };
}

const physicsTableCandidates = ldaTableRefs
  .map(ref => ({ ...ref, classification: classifyTableValues(ref.sample_hex) }))
  .filter(r => r.classification.looks_like_velocity || r.classification.looks_like_coords);

// ── 17. WARM BOOT SIGNATURE ───────────────────────────────────────────────────
// From the hexdump we saw: BD FA 07 DD 82 C0 which is
// LDA $07FA,X  / CMP $C082,X  → comparing RAM vs ROM checksum bytes
// This is a warm-boot detection pattern (check if RAM has a magic signature).
// Let's find the signature bytes stored in ROM.

const warmBootSigOffset = 0x0082;  // $C082 in CPU = PRG offset $0082
const warmBootSig = Array.from(prg.slice(warmBootSigOffset, warmBootSigOffset + 4));
const warmBootRamAddr = 0x07FA;

// ── 18. LEVEL DATA HEURISTIC ─────────────────────────────────────────────────
// Balloon Fight stages are single-screen arenas ~32 tiles wide × 24 tall.
// Level layout data would be ≈ 32×(height) bytes of tile indices,
// or could be run-length encoded.
// Look for regions of bytes where:
//   - Majority of values are 0 (empty space) or small non-zero values (tiles)
//   - Some distinct tile-index pattern (not random-looking)
// Alternative: look for indirect-jump dispatch where jump target is a level pointer table.

// Find the longest runs of "sparse" data (mostly 0s + few tile indices)
function findSparseRegions(prg, windowSize=256, sparseness=0.7) {
  const regions = [];
  for (let i = 0; i < prg.length - windowSize; i += 16) {
    const slice = prg.slice(i, i + windowSize);
    const zeros = slice.filter(b => b === 0).length;
    const ratio  = zeros / windowSize;
    if (ratio >= sparseness && ratio < 1.0) {
      const nonZero = Array.from(slice).filter(b=>b!==0);
      const maxVal  = Math.max(...nonZero);
      regions.push({
        prg_offset : `0x${i.toString(16).padStart(4,'0')}`,
        cpu_addr   : `$${(0xC000+i).toString(16).toUpperCase().padStart(4,'0')}`,
        zero_ratio : ratio.toFixed(2),
        max_nonzero: maxVal,
        non_zero   : nonZero.slice(0,20),
      });
    }
  }
  return regions;
}

const sparseRegions = findSparseRegions(prg, 64, 0.65).slice(0, 20);

// ── 19. DETECT SCREEN-SIZED DATA BLOCKS ──────────────────────────────────────
// NES nametable = 960 bytes (32×30) + 64 attribute bytes = 1024 bytes total.
// A compressed level is smaller, but uncompressed level screen is ~960 bytes.
// Look for 960-byte aligned regions that have plausible tile distribution.
// Balloon Fight may store level data more compactly (it's simple arenas).

// Look for repeated 2-byte patterns (common in platform data: tile, flags pairs)
function findRepeatingPairs(prg, minCount=6) {
  const candidates = [];
  let i = 0;
  while (i < prg.length - 12) {
    // Look for a 2-byte pattern repeated at least minCount times
    const a = prg[i], b = prg[i+1];
    if (a === 0xFF && b === 0xFF) { i++; continue; } // skip padding
    let count = 0, j = i;
    while (j < prg.length - 1 && prg[j] === a && prg[j+1] === b) {
      count++;
      j += 2;
    }
    if (count >= minCount) {
      candidates.push({
        prg_offset: `0x${i.toString(16).padStart(4,'0')}`,
        pattern   : [a, b].map(x=>x.toString(16).padStart(2,'0')).join(' '),
        repeat_count: count,
      });
      i = j;
      continue;
    }
    i++;
  }
  return candidates;
}

// ── 20. BUILD MANIFEST ────────────────────────────────────────────────────────

async function main() {
  // Extract CHR-ROM tiles
  const chrOutPath = path.join(OUT_DIR, 'tiles.png');
  console.log('Extracting CHR-ROM tiles...');
  const chrInfo = await extractChrRom(chr, chrOutPath);

  const tileDictionary = buildTileDictionary(chr);
  console.log(`  → ${chrInfo.tile_count} tiles total, ${chrInfo.non_blank_tiles} non-blank`);
  console.log(`  → ${tileDictionary.length} unique non-blank tiles`);

  const repeatingPairs = findRepeatingPairs(prg);

  // ── RAW BYTE DUMP OF KEY REGIONS FOR INSPECTION ─────────────────────────
  // Dump the bytes around the most interesting findings so the manifest
  // contains enough raw data for verification later.

  function dumpBytes(prg, cpuAddr, length=64) {
    const off = cpuAddr & 0x3FFF;
    return Array.from(prg.slice(off, off+length)).map(b=>b.toString(16).padStart(2,'0')).join(' ');
  }

  // ── PHYSICS ESTIMATE FROM CONSTANTS ──────────────────────────────────────
  // Balloon Fight physics are float-like: balloon provides upward buoyancy,
  // flap gives an upward velocity kick, gravity pulls down each frame.
  //
  // Without running the game, we can estimate from common NES physics patterns:
  // Gravity is typically +2 to +4 velocity units per frame (downward = positive).
  // Flap impulse is typically -8 to -16 velocity units.
  // Terminal velocity is capped at +8 to +16 units.
  //
  // ⚠️ TRANSPARENCY NOTE: These are structure-based estimates, not confirmed values.
  // The physicsTableCandidates array has actual ROM byte values from LDA abs,X patterns.
  // Confirmed values require running the ROM or tracing the code.

  const manifest = {
    game: {
      name      : 'Balloon Fight',
      platform  : 'NES',
      region    : 'USA',
      developer : 'HAL Laboratory',  // visible as ASCII "HAL" at ROM offset 0x94 (CPU $C094 = NMI handler start)
      year      : 1984,
      rom_file  : path.basename(ROM_PATH),
      rom_size  : rom.length,
      crc32_note: 'not computed (not needed for analysis)',
    },

    header: {
      mapper    : header.mapper,
      mapper_name: 'NROM-128',
      prg_size_kb: (PRG_SIZE / 1024),
      chr_size_kb: (CHR_SIZE / 1024),
      mirroring : header.mirroring,
      battery   : header.battery,
      prg_mapping: 'Single 16KB bank mirrored at $8000-$BFFF and $C000-$FFFF',
    },

    interrupt_vectors: {
      nmi_handler  : `$${nmi_vec.toString(16).toUpperCase().padStart(4,'0')}`,
      reset_handler: `$${reset_vec.toString(16).toUpperCase().padStart(4,'0')}`,
      irq_handler  : `$${irq_vec.toString(16).toUpperCase().padStart(4,'0')}`,
      reasoning: 'Read from standard 6502 vector locations $FFFA-$FFFF (=PRG offsets $3FFA-$3FFF). Reset=$C000 means code starts at the very beginning of PRG bank — classic for NROM games.',
    },

    warm_boot_signature: {
      rom_addr  : `$C082`,
      ram_addr  : `$${warmBootRamAddr.toString(16).toUpperCase().padStart(4,'0')}`,
      sig_bytes : warmBootSig.map(b => `0x${b.toString(16).padStart(2,'0')}`),
      reasoning : 'At reset entry, saw BD FA 07 / DD 82 C0 pattern: LDA $07FA,X / CMP $C082,X — checking RAM against ROM constants. This is the Nintendo-style warm/cold boot discriminator. Match = warm boot (skip full init). The 4 bytes at $C082 are the signature.',
    },

    code_structure: {
      most_called_subroutines: freqJSR.slice(0, 15),
      indirect_jump_sites: indirectJumps.slice(0, 10),
      reasoning: 'JSR frequency measures how many times each subroutine is called from PRG code. High-frequency callees are likely the inner game loop (input read, physics step, sprite update, etc.). JMP (ind) sites are dispatch tables.',
    },

    pointer_tables: ptrTables.map(t => ({
      ...t,
      reasoning: `${t.entry_count} consecutive 16-bit words all in valid PRG address range [$8000,$FFFF]. Structural indicator of a jump table or data pointer table.`,
    })),

    apu_music_engine: {
      write_sites_count: apuWrites.length,
      clusters: apuClusters,
      all_writes: apuWrites,
      reasoning: 'Scanned all bytes for STA $40XX pattern (opcode 8D, second byte 00-17, third byte 40). Clustering by proximity identifies distinct music/sfx driver code regions. The NES APU registers span $4000-$4017; writes to these drive all sound output.',
    },

    physics: {
      confidence: 'ESTIMATED FROM STRUCTURE — not verified by execution',
      hot_zero_page_writes: zpWrites.slice(0, 20),
      hot_ram_writes: absWrites.hot_addresses,
      physics_table_candidates: physicsTableCandidates.slice(0, 15),
      estimated_constants: {
        note: 'Values below are STRUCTURAL ESTIMATES. The physicsTableCandidates above contain actual ROM byte sequences from LDA abs,X patterns — inspect those for true values.',
        gravity_per_frame: { value: null, confidence: 'unconfirmed', method: 'requires code trace from reset/NMI handler' },
        flap_velocity    : { value: null, confidence: 'unconfirmed', method: 'requires code trace — look for write to Y-velocity ZP register after button press read' },
        walk_speed       : { value: null, confidence: 'unconfirmed', method: 'requires code trace' },
        terminal_velocity: { value: null, confidence: 'unconfirmed', method: 'requires code trace' },
      },
      reasoning: 'Zero-page write frequency identifies hot game-state variables. The most-written ZP addresses are likely position/velocity registers. LDA abs,X patterns that load from small-value tables are physics constant candidates.',
    },

    level_data: {
      confidence: 'STRUCTURAL CANDIDATES — not verified',
      sparse_regions: sparseRegions.slice(0, 10),
      repeating_pairs: repeatingPairs,
      run_length_regions: rlRegions.slice(0, 20),
      note: 'Balloon Fight arenas are single-screen with fixed platforms per stage. Level data may be very compact (a few dozen bytes per screen describing platform positions). Sparse regions (many zeros + small tile indices) are candidates. Run-length regions suggest RLE compression of empty space.',
      reasoning: 'Used three heuristics: (1) sparse byte regions (≥65% zeros, consistent with empty NES playfields), (2) repeating byte pairs (RLE-like), (3) run-length runs (explicit repetition in data). True level data identification requires cross-referencing with pointer table entries.',
    },

    enemy_placement: {
      confidence: 'STRUCTURAL CANDIDATES — needs verification',
      candidates: enemyRecords.slice(0, 15),
      reasoning: '3-byte records [type][x][y] terminated by $FF, where type≤15 and y≤239. This is a common NES enemy table format. False positives possible; ground truth requires verifying that type byte matches known entity types and coordinates are on-screen.',
    },

    visual: {
      sprite_sheet: 'tiles.png',
      tile_count   : chrInfo.tile_count,
      non_blank_tiles: chrInfo.non_blank_tiles,
      unique_tiles : tileDictionary.length,
      sheet_size   : `${chrInfo.width}×${chrInfo.height}`,
      bank0_tiles  : 256,
      bank1_tiles  : 256,
      reasoning    : 'CHR-ROM decoded from standard NES 2bpp planar format. 8KB = 512 tiles of 8×8px each. Bank 0 ($0000-$0FFF) typically sprites or backgrounds; bank 1 ($1000-$1FFF) the other. PPUCTRL bit 4 (BG pattern table select) and bit 3 (sprite table) determine which bank is used at runtime — unknown without running the ROM, but the split into two 256-tile banks is standard.',
      tile_dictionary_sample: tileDictionary.slice(0, 10).map(t => ({
        index: t.index,
        bank : t.bank,
        hex  : t.bytes.map(b=>b.toString(16).padStart(2,'0')).join(' '),
      })),
    },

    raw_prg_dumps: {
      note: 'Raw hex dumps of key PRG regions for manual inspection',
      reset_handler  : { cpu_addr: '$C000', hex: dumpBytes(prg, 0xC000, 64) },
      nmi_handler    : { cpu_addr: `$${nmi_vec.toString(16).toUpperCase().padStart(4,'0')}`, hex: dumpBytes(prg, nmi_vec, 64) },
      irq_handler    : { cpu_addr: `$${irq_vec.toString(16).toUpperCase().padStart(4,'0')}`, hex: dumpBytes(prg, irq_vec, 64) },
      warm_boot_sig  : { cpu_addr: '$C082', hex: dumpBytes(prg, 0xC082, 16) },
    },

    analysis_methodology: {
      approach: 'Pure static binary analysis — no ROM documentation consulted',
      transparency: [
        'Developer name (HAL Laboratory) identified from ASCII "HAL" visible at ROM offset 0x90 in initial hexdump scan, at CPU address $C094 (= NMI handler). This is structural discovery, but confirmed a priori knowledge about the game.',
        'ROM type (NROM-128) read directly from iNES header byte 4 = 0x01.',
        'Warm boot signature pattern (BD FA 07 DD 82 C0) read from initial xxd dump of PRG start.',
        'Physics values not confirmed — would require tracing 6502 execution from reset vector through game init to find which ZP addresses hold velocity/position and what constants are written to them.',
        'Level data not confirmed — Balloon Fight uses fixed single-screen arenas; their format is unknown without documentation or execution trace.',
        'Enemy records are heuristic pattern matches — 3-byte [type][x][y] terminated by $FF is a common NES convention but may not apply here.',
        'APU write locations are definitively structural (byte pattern 8D xx 40 is unambiguous).',
        'Pointer tables are structural (consecutive valid ROM addresses), though tight clustering threshold (≥4 entries) may miss small tables.',
      ],
    },
  };

  // Write manifest
  const manifestPath = path.join(OUT_DIR, 'manifest.json');
  fs.writeFileSync(manifestPath, JSON.stringify(manifest, null, 2));
  console.log(`\nManifest written to: ${manifestPath}`);
  console.log(`Sprite sheet written to: ${chrOutPath}`);

  // Print summary
  console.log('\n=== ANALYSIS SUMMARY ===');
  console.log(`Vectors: NMI=$${nmi_vec.toString(16).toUpperCase()} Reset=$${reset_vec.toString(16).toUpperCase()} IRQ=$${irq_vec.toString(16).toUpperCase()}`);
  console.log(`Pointer tables found: ${ptrTables.length} (≥4 entries each)`);
  console.log(`APU write sites: ${apuWrites.length} across ${apuClusters.length} cluster(s)`);
  console.log(`Indirect jump (JMP (ind)) sites: ${indirectJumps.length}`);
  console.log(`LDA abs,X table refs: ${ldaTableRefs.length} total, ${physicsTableCandidates.length} with physics-plausible values`);
  console.log(`Enemy record candidates: ${enemyRecords.length}`);
  console.log(`Hot ZP addresses (≥3 writes): ${zpWrites.length}`);
  console.log(`Sparse regions (level data candidates): ${sparseRegions.length}`);
  console.log(`Run-length regions: ${rlRegions.length}`);
  console.log(`CHR tiles: ${chrInfo.non_blank_tiles}/${chrInfo.tile_count} non-blank`);

  // Print most interesting findings inline
  console.log('\n--- Top pointer tables ---');
  ptrTables.slice(0,6).forEach(t => {
    console.log(`  ${t.cpu_addr}: ${t.entry_count} entries → [${t.entries.slice(0,5).join(', ')}${t.entries.length>5?'...':''}]`);
  });

  console.log('\n--- APU write clusters (music engine) ---');
  apuClusters.forEach(c => {
    console.log(`  ${c.cpu_start}-${c.cpu_end}: ${c.write_count} writes to [${c.apu_regs.join(',')}]`);
  });

  console.log('\n--- Most-called subroutines ---');
  freqJSR.slice(0,10).forEach(r => {
    console.log(`  ${r.addr}: called ${r.call_count}× from PRG`);
  });

  console.log('\n--- Hottest zero-page addresses ---');
  zpWrites.slice(0,15).forEach(z => {
    console.log(`  ZP${z.zp_addr}: ${z.write_count} writes`);
  });

  console.log('\n--- Physics/table candidates ---');
  physicsTableCandidates.slice(0,8).forEach(c => {
    const s = c.classification.signed.slice(0,8).join(', ');
    const tag = c.classification.looks_like_velocity ? 'velocity?' : 'coords?';
    console.log(`  Table@${c.table_cpu} (ref@${c.insn_cpu}): [${s}] → ${tag}`);
  });
}

main().catch(console.error);
