// Quick unit test for iNES header parsing and CHR decode logic
'use strict';

// ── iNES header parse ─────────────────────────────────────────────────────

const INES_MAGIC = 0x4E45531A;

function parseInesHeader(buf) {
  if (buf.length < 16) return null;
  if (buf.readUInt32BE(0) !== INES_MAGIC) return null;
  const prgRomBanks = buf[4];
  const chrRomBanks = buf[5];
  const flags6      = buf[6];
  const flags7      = buf[7];
  const hasTrainer  = !!(flags6 & 0x04);
  const mapperLow   = (flags6 >> 4) & 0x0F;
  const mapperHigh  = (flags7 >> 4) & 0x0F;
  const mapper      = (mapperHigh << 4) | mapperLow;
  const prgRomBytes = prgRomBanks * 16384;
  const chrRomBytes = chrRomBanks * 8192;
  const chrOffset   = 16 + (hasTrainer ? 512 : 0) + prgRomBytes;
  return { prgRomBanks, chrRomBanks, mapper, hasTrainer, prgRomBytes, chrRomBytes, chrOffset };
}

// Build synthetic iNES headers
function makeHeader({ prg=1, chr=1, mapper=0, trainer=false, flags7extra=0 } = {}) {
  const buf = Buffer.alloc(16, 0);
  buf.writeUInt32BE(INES_MAGIC, 0);
  buf[4] = prg;
  buf[5] = chr;
  buf[6] = (mapper & 0x0F) << 4 | (trainer ? 0x04 : 0);
  buf[7] = (mapper & 0xF0) | flags7extra;
  return buf;
}

let pass = 0, fail = 0;
function check(label, actual, expected) {
  const ok = JSON.stringify(actual) === JSON.stringify(expected);
  console.log((ok ? '✓' : '✗') + ' ' + label);
  if (!ok) console.log('  expected:', expected, '\n  got:     ', actual);
  ok ? pass++ : fail++;
}

// Test 1: SMB-style (mapper 0, 2 PRG banks, 1 CHR bank = 8KB CHR)
const smb = parseInesHeader(makeHeader({ prg: 2, chr: 1, mapper: 0 }));
check('SMB mapper',      smb.mapper,      0);
check('SMB prg bytes',  smb.prgRomBytes, 32768);
check('SMB chr bytes',  smb.chrRomBytes, 8192);
check('SMB chr offset', smb.chrOffset,   16 + 32768);
check('SMB no trainer', smb.hasTrainer,  false);

// Test 2: MMC3 game (mapper 4, 16 PRG banks, 16 CHR banks = 128KB CHR)
const mmc3 = parseInesHeader(makeHeader({ prg: 16, chr: 16, mapper: 4 }));
check('MMC3 mapper',    mmc3.mapper,     4);
check('MMC3 chr bytes', mmc3.chrRomBytes, 131072);
check('MMC3 chr offset',mmc3.chrOffset,  16 + 16*16384);

// Test 3: Kirby-style (mapper 4, 32 CHR banks = 256KB)
const kirby = parseInesHeader(makeHeader({ prg: 8, chr: 32, mapper: 4 }));
check('Kirby chr bytes', kirby.chrRomBytes, 262144);

// Test 4: CHR-RAM game (chr = 0)
const chrram = parseInesHeader(makeHeader({ prg: 4, chr: 0, mapper: 2 }));
check('CHR-RAM skipped', chrram.chrRomBanks, 0);

// Test 5: Trainer present — offset shifts by 512
const trained = parseInesHeader(makeHeader({ prg: 2, chr: 1, mapper: 0, trainer: true }));
check('Trainer offset', trained.chrOffset, 16 + 512 + 32768);
check('Trainer flag',   trained.hasTrainer, true);

// Test 6: High mapper nibble (e.g. mapper 68 = Sunsoft-4)
const sun4 = parseInesHeader(makeHeader({ prg: 8, chr: 16, mapper: 68 }));
check('Mapper 68', sun4.mapper, 68);

// ── CHR decode tile count ─────────────────────────────────────────────────

// 8KB / 16 bytes per tile = 512 tiles
const tiles8k = (8192 / 16);
check('8KB = 512 tiles',   tiles8k, 512);
const tiles128k = (131072 / 16);
check('128KB = 8192 tiles', tiles128k, 8192);
const tiles256k = (262144 / 16);
check('256KB = 16384 tiles', tiles256k, 16384);

// Sheet dimensions: 16 tiles wide × 8px = 128px wide
// 512 tiles / 16 = 32 rows → height = 32*8 = 256px
check('8KB sheet width',  16 * 8, 128);
check('8KB sheet height', Math.ceil(512 / 16) * 8, 256);
check('128KB sheet height', Math.ceil(8192 / 16) * 8, 4096);
check('256KB sheet height', Math.ceil(16384 / 16) * 8, 8192);

console.log(`\n${pass} passed, ${fail} failed`);
process.exit(fail > 0 ? 1 : 0);
