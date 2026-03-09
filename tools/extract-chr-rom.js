#!/usr/bin/env node
/**
 * extract-chr-rom.js
 *
 * NES CHR-ROM Bulk Extractor — Two Fires Session 8
 *
 * Reads every .nes file in a directory, parses the iNES 1.0 header,
 * and extracts CHR-ROM tile data into PNG tile sheets.
 *
 * CHR-ROM games have uncompressed tile data sitting directly after the PRG
 * data — no emulator or decompression needed. Just file math.
 *
 * Output per game → ~/nes-extracted/{game-slug}/
 *   tiles.png     — 16-wide tile grid, grayscale (0=black … 3=white)
 *   manifest.json — metadata
 *
 * Usage:
 *   node tools/extract-chr-rom.js [--roms=<dir>] [--out=<dir>] [--game=<slug>]
 *
 * Defaults:
 *   --roms  ~/nes-roms
 *   --out   ~/nes-extracted
 */

import { readFileSync, writeFileSync, mkdirSync, existsSync, readdirSync, statSync } from 'fs';
import { join, basename, extname, dirname } from 'path';
import { fileURLToPath } from 'url';
import os from 'os';
import sharp from 'sharp';

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = join(__dirname, '..');

// ---------------------------------------------------------------------------
// CLI args
// ---------------------------------------------------------------------------

const args = Object.fromEntries(
  process.argv.slice(2)
    .filter(a => a.startsWith('--'))
    .map(a => {
      const [k, v] = a.slice(2).split('=');
      return [k, v ?? true];
    })
);

const ROMS_DIR = args.roms ? args.roms.replace('~', os.homedir()) : join(os.homedir(), 'nes-roms');
const OUT_DIR  = args.out  ? args.out.replace('~', os.homedir())  : join(os.homedir(), 'nes-extracted');
const GAME_FILTER = args.game || null;

// ---------------------------------------------------------------------------
// iNES header parsing
// ---------------------------------------------------------------------------

const INES_MAGIC = 0x4E45531A; // 'NES\x1a'

/**
 * Parse an iNES 1.0 header from the first 16 bytes of a ROM buffer.
 * Returns null if not a valid iNES file.
 */
function parseInesHeader(buf) {
  if (buf.length < 16) return null;
  if (buf.readUInt32BE(0) !== INES_MAGIC) return null;

  const prgRomBanks = buf[4];          // × 16384 bytes
  const chrRomBanks = buf[5];          // × 8192 bytes
  const flags6      = buf[6];
  const flags7      = buf[7];

  const hasTrainer  = !!(flags6 & 0x04);
  const mapperLow   = (flags6 >> 4) & 0x0F;
  const mapperHigh  = (flags7 >> 4) & 0x0F;
  const mapper      = (mapperHigh << 4) | mapperLow;

  const prgRomBytes = prgRomBanks * 16384;
  const chrRomBytes = chrRomBanks * 8192;
  const trainerBytes = hasTrainer ? 512 : 0;

  const chrOffset = 16 + trainerBytes + prgRomBytes;

  return {
    prgRomBanks,
    chrRomBanks,
    mapper,
    hasTrainer,
    prgRomBytes,
    chrRomBytes,
    trainerBytes,
    chrOffset,
  };
}

// ---------------------------------------------------------------------------
// CHR-ROM tile decoding (NES 2bpp format)
// ---------------------------------------------------------------------------

/**
 * Decode all tiles from a CHR-ROM data buffer.
 * Each tile is 16 bytes → 8×8 pixels, each pixel 0–3.
 * Returns Float32Array of pixel values (0–3) in row-major order,
 * arranged as a grid TILES_PER_ROW tiles wide.
 */
const TILES_PER_ROW = 16;

function decodeChrRom(chrData) {
  const totalTiles = Math.floor(chrData.length / 16);
  const cols = TILES_PER_ROW;
  const rows = Math.ceil(totalTiles / cols);
  const imgW = cols * 8;
  const imgH = rows * 8;

  // Raw pixel array: grayscale values 0–255
  const pixels = new Uint8Array(imgW * imgH);

  // Map 2-bit palette index → grayscale byte
  const palette = [0, 85, 170, 255]; // black, dark gray, light gray, white

  for (let t = 0; t < totalTiles; t++) {
    const tileOffset = t * 16;
    const tileCol = t % cols;
    const tileRow = Math.floor(t / cols);
    const baseX = tileCol * 8;
    const baseY = tileRow * 8;

    for (let row = 0; row < 8; row++) {
      const plane0 = chrData[tileOffset + row];       // bit plane 0
      const plane1 = chrData[tileOffset + row + 8];   // bit plane 1

      for (let col = 0; col < 8; col++) {
        const bit = 7 - col; // MSB first
        const lo = (plane0 >> bit) & 1;
        const hi = (plane1 >> bit) & 1;
        const colorIdx = (hi << 1) | lo;

        const px = baseX + col;
        const py = baseY + row;
        pixels[py * imgW + px] = palette[colorIdx];
      }
    }
  }

  return { pixels, imgW, imgH, totalTiles };
}

// ---------------------------------------------------------------------------
// Slug / name helpers
// ---------------------------------------------------------------------------

function filenameToSlug(filename) {
  return basename(filename, extname(filename))
    .toLowerCase()
    .replace(/\s+/g, '-')
    .replace(/[^a-z0-9-]/g, '-')
    .replace(/-+/g, '-')
    .replace(/^-|-$/g, '');
}

function filenameToName(filename) {
  return basename(filename, extname(filename))
    .replace(/\s*\([^)]*\)/g, '')  // strip parenthetical tags like (USA), (E)
    .trim();
}

// ---------------------------------------------------------------------------
// Find all .nes files
// ---------------------------------------------------------------------------

function findNesFiles(dir) {
  const results = [];
  if (!existsSync(dir)) return results;

  function recurse(d) {
    for (const entry of readdirSync(d)) {
      const full = join(d, entry);
      const stat = statSync(full);
      if (stat.isDirectory()) {
        recurse(full);
      } else if (entry.toLowerCase().endsWith('.nes')) {
        results.push(full);
      }
    }
  }

  recurse(dir);
  return results;
}

// ---------------------------------------------------------------------------
// Process a single ROM file
// ---------------------------------------------------------------------------

async function processRom(romPath) {
  const slug = filenameToSlug(romPath);
  const gameName = filenameToName(romPath);

  let buf;
  try {
    buf = readFileSync(romPath);
  } catch (e) {
    return { status: 'error', slug, reason: `read error: ${e.message}` };
  }

  const header = parseInesHeader(buf);
  if (!header) {
    return { status: 'error', slug, reason: 'not a valid iNES file' };
  }

  if (header.chrRomBanks === 0) {
    return { status: 'skipped', slug, reason: 'CHR-RAM (byte 5 = 0)', mapper: header.mapper };
  }

  // Bounds check
  const chrEnd = header.chrOffset + header.chrRomBytes;
  if (chrEnd > buf.length) {
    return {
      status: 'error', slug,
      reason: `CHR-ROM would exceed file size (offset ${header.chrOffset} + ${header.chrRomBytes} > ${buf.length})`,
    };
  }

  const chrData = buf.slice(header.chrOffset, chrEnd);
  const { pixels, imgW, imgH, totalTiles } = decodeChrRom(chrData);

  // Write output
  const outDir = join(OUT_DIR, slug);
  mkdirSync(outDir, { recursive: true });

  const tilesPath = join(outDir, 'tiles.png');
  await sharp(Buffer.from(pixels), {
    raw: { width: imgW, height: imgH, channels: 1 },
  })
    .png({ compressionLevel: 6 })
    .toFile(tilesPath);

  const manifest = {
    source_file: basename(romPath),
    game_name: gameName,
    game_slug: slug,
    mapper: header.mapper,
    prg_rom_bytes: header.prgRomBytes,
    chr_rom_bytes: header.chrRomBytes,
    chr_rom_banks: header.chrRomBanks,
    total_tiles: totalTiles,
    tile_sheet: {
      width_px: imgW,
      height_px: imgH,
      tiles_per_row: TILES_PER_ROW,
    },
    has_trainer: header.hasTrainer,
    extracted_at: new Date().toISOString(),
  };

  writeFileSync(join(outDir, 'manifest.json'), JSON.stringify(manifest, null, 2));

  return { status: 'extracted', slug, totalTiles, mapper: header.mapper, chrRomBytes: header.chrRomBytes };
}

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------

async function main() {
  console.log('=== Two Fires NES CHR-ROM Bulk Extractor ===');
  console.log(`ROMs dir:  ${ROMS_DIR}`);
  console.log(`Output:    ${OUT_DIR}`);
  if (GAME_FILTER) console.log(`Filter:    ${GAME_FILTER}`);
  console.log('');

  mkdirSync(OUT_DIR, { recursive: true });

  const romFiles = findNesFiles(ROMS_DIR);
  console.log(`Found ${romFiles.length} .nes files\n`);

  if (romFiles.length === 0) {
    console.log('No .nes files found. Is the ROM directory correct?');
    process.exit(1);
  }

  let extracted = 0;
  let skipped   = 0;
  let errors    = 0;
  let totalTiles = 0;
  const errorList = [];

  for (let i = 0; i < romFiles.length; i++) {
    const romPath = romFiles[i];
    const slug = filenameToSlug(romPath);

    if (GAME_FILTER && !slug.includes(GAME_FILTER)) continue;

    const result = await processRom(romPath);

    if (result.status === 'extracted') {
      extracted++;
      totalTiles += result.totalTiles;
    } else if (result.status === 'skipped') {
      skipped++;
    } else {
      errors++;
      errorList.push(`  ${result.slug}: ${result.reason}`);
    }

    if ((i + 1) % 50 === 0 || i === romFiles.length - 1) {
      console.log(`  [${i + 1}/${romFiles.length}] extracted=${extracted} skipped=${skipped} errors=${errors}`);
    }
  }

  console.log('\n=== EXTRACTION COMPLETE ===');
  console.log(`  Total files scanned:    ${romFiles.length}`);
  console.log(`  CHR-ROM games extracted: ${extracted}`);
  console.log(`  CHR-RAM games skipped:   ${skipped}`);
  console.log(`  Errors:                  ${errors}`);
  console.log(`  Total tiles extracted:   ${totalTiles.toLocaleString()}`);

  if (errorList.length > 0) {
    console.log('\nErrors:');
    errorList.forEach(e => console.log(e));
  }

  if (!GAME_FILTER) {
    await spotCheck();
  }
}

// ---------------------------------------------------------------------------
// Spot-check: verify key CHR-ROM titles extracted correctly
// ---------------------------------------------------------------------------

const SPOT_CHECK_GAMES = [
  // pattern: slug substring to match. exclude: substrings that disqualify a match.
  // NOTE: Castlevania (USA) and DuckTales (USA) are CHR-RAM (mapper 1/2, byte 5=0) — confirmed skipped correctly.
  //       Strategy doc list had these wrong. Replaced with confirmed CHR-ROM titles below.
  { pattern: 'super-mario-bros-',           exclude: ['-2-','-3-','-lost','-duck','-tetris'],  name: 'Super Mario Bros (8KB CHR)',       expectedChr: 8192,   expectedTiles: 512   },
  { pattern: 'super-mario-bros-3-',         exclude: [],                                        name: 'Super Mario Bros 3 (128KB CHR)',   expectedChr: 131072, expectedTiles: 8192  },
  { pattern: 'little-nemo-the-dream-master',exclude: [],                                        name: 'Little Nemo (128KB CHR, MMC3)',    expectedChr: 131072, expectedTiles: 8192  },
  { pattern: 'kirby-s-adventure-',          exclude: [],                                        name: "Kirby's Adventure (256KB CHR)",   expectedChr: 262144, expectedTiles: 16384 },
];

async function spotCheck() {
  console.log('\n=== SPOT CHECK ===');

  // Find all extracted game dirs
  let extractedDirs;
  try {
    extractedDirs = readdirSync(OUT_DIR).map(d => join(OUT_DIR, d));
  } catch {
    console.log('  Cannot read output dir — skipping spot check');
    return;
  }

  for (const game of SPOT_CHECK_GAMES) {
    const matches = extractedDirs.filter(d => {
      const name = basename(d);
      if (!name.includes(game.pattern)) return false;
      if (game.exclude && game.exclude.some(ex => name.includes(ex))) return false;
      return true;
    });

    if (matches.length === 0) {
      console.log(`  ${game.name}: NOT FOUND (pattern: ${game.pattern})`);
      continue;
    }

    // Use the first "World" or "USA" match if multiple
    const dir = matches.find(d => d.includes('-world') || d.includes('-usa')) || matches[0];
    const slug = basename(dir);
    const manifestPath = join(dir, 'manifest.json');
    const tilesPath = join(dir, 'tiles.png');

    if (!existsSync(manifestPath) || !existsSync(tilesPath)) {
      console.log(`  ${game.name}: MISSING FILES in ${slug}`);
      continue;
    }

    let manifest;
    try {
      manifest = JSON.parse(readFileSync(manifestPath, 'utf-8'));
    } catch {
      console.log(`  ${game.name}: MANIFEST PARSE ERROR in ${slug}`);
      continue;
    }

    const chrOk    = manifest.chr_rom_bytes === game.expectedChr;
    const tilesOk  = manifest.total_tiles === game.expectedTiles;
    const wOk      = manifest.tile_sheet.width_px === 128;
    const hOk      = manifest.tile_sheet.height_px === Math.ceil(game.expectedTiles / TILES_PER_ROW) * 8;

    const status = (chrOk && tilesOk && wOk && hOk) ? '✓' : '✗';
    console.log(`  ${status} ${game.name} (${slug})`);
    console.log(`      CHR size: ${manifest.chr_rom_bytes.toLocaleString()} bytes [expected ${game.expectedChr.toLocaleString()}] ${chrOk ? '✓' : '✗'}`);
    console.log(`      Tiles:    ${manifest.total_tiles.toLocaleString()} [expected ${game.expectedTiles.toLocaleString()}] ${tilesOk ? '✓' : '✗'}`);
    console.log(`      Sheet:    ${manifest.tile_sheet.width_px}×${manifest.tile_sheet.height_px}px ${(wOk && hOk) ? '✓' : '✗'}`);
    console.log(`      Mapper:   ${manifest.mapper}`);
  }
}

main().catch(err => {
  console.error('Fatal:', err);
  process.exit(1);
});
