#!/usr/bin/env node
/**
 * analyze-music.js
 *
 * Builds music-catalog.json — enriched version of music-index.json with
 * per-track metadata extracted from file headers and playlists.
 *
 * What it extracts:
 *   - NSF: track count, track names (from M3U playlists), composers, durations
 *   - SPC: ID666 tags (title, game, artist, duration, fade), DSP state
 *   - VGM: chip types, sample rate, loop offset, total samples, duration
 *   - All: functional role classification (title, stage, boss, victory, etc.)
 *
 * Usage:
 *   node tools/analyze-music.js                      # all platforms
 *   node tools/analyze-music.js --platform=nes       # single platform
 *
 * Output:
 *   data/assets/music-catalog.json   (committed to git)
 */

import {
  readFileSync, writeFileSync, existsSync, statSync, readdirSync,
} from 'fs';
import { join, dirname, extname } from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname  = dirname(__filename);
const ROOT       = join(__dirname, '..');

// ---------------------------------------------------------------------------
// Config
// ---------------------------------------------------------------------------

const ASSETS_DIR      = join(ROOT, 'data/assets');
const MUSIC_DIR       = join(ASSETS_DIR, 'music');
const MUSIC_INDEX     = join(ASSETS_DIR, 'music-index.json');
const MUSIC_CATALOG   = join(ASSETS_DIR, 'music-catalog.json');

const args = Object.fromEntries(
  process.argv.slice(2)
    .filter(a => a.startsWith('--'))
    .map(a => { const [k, v] = a.slice(2).split('='); return [k, v ?? true]; })
);
const PLATFORM_FILTER = args.platform || null;

// ---------------------------------------------------------------------------
// Utilities
// ---------------------------------------------------------------------------

function log(msg) {
  const ts = new Date().toISOString().slice(11, 19);
  console.log(`[${ts}] ${msg}`);
}

function readNullTermString(buf, offset, maxLen) {
  let end = offset;
  while (end < offset + maxLen && end < buf.length && buf[end] !== 0) end++;
  return buf.slice(offset, end).toString('latin1').trim();
}

// ---------------------------------------------------------------------------
// Functional role classification
// ---------------------------------------------------------------------------

function classifyTrackRole(trackName) {
  const lower = trackName.toLowerCase();

  if (/title\s*screen|title\s*theme|opening/i.test(lower)) return 'title';
  if (/stage\s*select|select\s*stage|enemy\s*chosen|character\s*select/.test(lower)) return 'select_screen';
  if (/password|save|load|file\s*select/.test(lower)) return 'menu';
  if (/main\s*menu|options|settings/.test(lower)) return 'menu';
  if (/overworld|world\s*map|map\s*screen/.test(lower)) return 'overworld';
  if (/boss\s*battle|boss\s*fight|final\s*boss|mini.?boss/.test(lower)) return 'boss_battle';
  if (/battle|fight|combat|encounter/.test(lower)) return 'battle';
  if (/victory|win|clear|stage\s*clear|level\s*clear|you\s*win/.test(lower)) return 'victory_jingle';
  if (/defeat|game\s*over|you\s*lose|continue/.test(lower)) return 'game_over';
  if (/death|die|dead|lost\s*a\s*life/.test(lower)) return 'death_jingle';
  if (/credit|ending|epilogue|finale|staff\s*roll/.test(lower)) return 'ending';
  if (/intro|prologue|cutscene|cinema|story/.test(lower)) return 'cutscene';
  if (/shop|store|merchant|inn|rest/.test(lower)) return 'shop';
  if (/invincib|star\s*power|power.?up/.test(lower)) return 'power_up';
  if (/underwater|water\s*level|swim/.test(lower)) return 'stage_water';
  if (/castle|fortress|dungeon|tower/.test(lower)) return 'stage_dungeon';
  if (/cave|underground|mine/.test(lower)) return 'stage_underground';
  if (/ice|snow|frozen|winter|cold/.test(lower)) return 'stage_ice';
  if (/fire|lava|volcano|heat/.test(lower)) return 'stage_fire';
  if (/forest|jungle|woods|garden/.test(lower)) return 'stage_nature';
  if (/space|star|galaxy|sky|cloud|air/.test(lower)) return 'stage_sky';
  if (/wily|bowser|ganon|final\s*stage|last\s*stage/.test(lower)) return 'stage_final';

  if (/stage|level|zone|act|world|area|theme|field|plain|town|village/.test(lower)) return 'stage_generic';
  if (/man('s)?\s*stage/.test(lower)) return 'stage_generic';

  if (/bgm|track|song|music/.test(lower)) return 'unknown_bgm';
  if (/sfx|sound\s*effect|se\s*/.test(lower)) return 'sfx';
  if (/jingle|fanfare/.test(lower)) return 'jingle';

  return 'unknown';
}

// ---------------------------------------------------------------------------
// NSF parser
// ---------------------------------------------------------------------------

function parseNSF(filePath) {
  try {
    const buf = readFileSync(filePath);
    if (buf.length < 128) return null;
    const magic = buf.slice(0, 5).toString('ascii');
    if (magic !== 'NESM\x1a') return null;

    return {
      format: 'nsf',
      version: buf[5],
      total_tracks: buf[6],
      starting_track: buf[7],
      title: readNullTermString(buf, 0x0E, 32),
      artist: readNullTermString(buf, 0x2E, 32),
      copyright: readNullTermString(buf, 0x4E, 32),
      ntsc_speed_us: buf.readUInt16LE(0x6E),
      pal_speed_us: buf.readUInt16LE(0x78),
      region: buf[0x7A] === 0 ? 'ntsc' : buf[0x7A] === 1 ? 'pal' : 'dual',
      expansion_chips: buf[0x7B],
      file_size: buf.length,
    };
  } catch { return null; }
}

// ---------------------------------------------------------------------------
// SPC parser (ID666 tags)
// ---------------------------------------------------------------------------

function parseSPC(filePath) {
  try {
    const buf = readFileSync(filePath);
    if (buf.length < 0x100) return null;
    const magic = buf.slice(0, 27).toString('ascii');
    if (!magic.startsWith('SNES-SPC700')) return null;

    const hasId666 = buf[0x23] === 0x1A;

    const result = {
      format: 'spc',
      has_id666: hasId666,
      title: null,
      game: null,
      artist: null,
      dumper: null,
      comments: null,
      duration_ms: null,
      fade_ms: null,
      file_size: buf.length,
    };

    if (hasId666) {
      result.title    = readNullTermString(buf, 0x2E, 32);
      result.game     = readNullTermString(buf, 0x4E, 32);
      result.dumper    = readNullTermString(buf, 0x6E, 16);
      result.comments  = readNullTermString(buf, 0x7E, 32);

      const durationStr = readNullTermString(buf, 0xA9, 11);
      const fadeStr     = readNullTermString(buf, 0xB4, 11);
      const dur = parseInt(durationStr);
      const fade = parseInt(fadeStr);
      if (!isNaN(dur)) result.duration_ms = dur;
      if (!isNaN(fade)) result.fade_ms = fade;

      result.artist = readNullTermString(buf, 0xB1, 32);
      if (!result.artist || result.artist.length === 0) {
        result.artist = readNullTermString(buf, 0xB0, 32);
      }
    }

    return result;
  } catch { return null; }
}

// ---------------------------------------------------------------------------
// VGM parser
// ---------------------------------------------------------------------------

function parseVGM(filePath) {
  try {
    const buf = readFileSync(filePath);
    if (buf.length < 0x40) return null;
    const magic = buf.slice(0, 4).toString('ascii');
    if (magic !== 'Vgm ') return null;

    const version = buf.readUInt32LE(0x08);
    const totalSamples = buf.readUInt32LE(0x18);
    const loopOffset = buf.readUInt32LE(0x1C);
    const loopSamples = buf.readUInt32LE(0x20);
    const sampleRate = 44100;

    const chips = [];
    const sn76489_clock = buf.readUInt32LE(0x0C);
    const ym2413_clock  = buf.readUInt32LE(0x10);
    const ym2612_clock  = buf.readUInt32LE(0x2C);
    const ym2151_clock  = buf.readUInt32LE(0x30);

    if (sn76489_clock > 0) chips.push('SN76489');
    if (ym2413_clock > 0)  chips.push('YM2413');
    if (ym2612_clock > 0)  chips.push('YM2612');
    if (ym2151_clock > 0)  chips.push('YM2151');

    return {
      format: 'vgm',
      version: `${(version >> 8) & 0xFF}.${version & 0xFF}`,
      total_samples: totalSamples,
      duration_ms: Math.round((totalSamples / sampleRate) * 1000),
      loop_offset: loopOffset,
      loop_samples: loopSamples,
      has_loop: loopOffset > 0,
      chips,
      file_size: buf.length,
    };
  } catch { return null; }
}

// ---------------------------------------------------------------------------
// GBS parser
// ---------------------------------------------------------------------------

function parseGBS(filePath) {
  try {
    const buf = readFileSync(filePath);
    if (buf.length < 0x70) return null;
    const magic = buf.slice(0, 3).toString('ascii');
    if (magic !== 'GBS') return null;

    return {
      format: 'gbs',
      version: buf[3],
      total_tracks: buf[4],
      first_track: buf[5],
      title: readNullTermString(buf, 0x10, 32),
      artist: readNullTermString(buf, 0x30, 32),
      copyright: readNullTermString(buf, 0x50, 32),
      file_size: buf.length,
    };
  } catch { return null; }
}

// ---------------------------------------------------------------------------
// M3U playlist parser (for NSF/GBS track name mapping)
// ---------------------------------------------------------------------------

function parseM3U(filePath) {
  try {
    const text = readFileSync(filePath, 'utf-8');
    const tracks = [];

    for (const line of text.split('\n')) {
      if (line.startsWith('#') || line.trim() === '') continue;

      const match = line.match(/::NSF,(\d+),(.+?)(?:,(.+))?$/);
      if (!match) {
        const gbsMatch = line.match(/::GBS,(\d+),(.+?)(?:,(.+))?$/);
        if (gbsMatch) {
          const trackNum = parseInt(gbsMatch[1]);
          const fullTitle = gbsMatch[2];
          const rest = gbsMatch[3] || '';
          const durations = rest.split(',').map(s => s.trim());

          const dashIdx = fullTitle.lastIndexOf(' - ');
          const trackName = dashIdx >= 0
            ? fullTitle.slice(dashIdx + 3).trim()
            : fullTitle.trim();

          tracks.push({
            track_number: trackNum,
            name: trackName,
            duration: durations[0] || null,
            fade: durations[2] || null,
          });
        }
        continue;
      }

      const trackNum = parseInt(match[1]);
      const fullTitle = match[2];
      const rest = match[3] || '';
      const durations = rest.split(',').map(s => s.trim());

      const dashIdx = fullTitle.lastIndexOf(' - ');
      const trackName = dashIdx >= 0
        ? fullTitle.slice(dashIdx + 3).trim()
        : fullTitle.trim();

      tracks.push({
        track_number: trackNum,
        name: trackName,
        duration: durations[0] || null,
        fade: durations[2] || null,
      });
    }

    // Also extract composer from comment lines
    let composer = null;
    for (const line of text.split('\n')) {
      if (/^#\s*Music by\s+(.+)/i.test(line)) {
        composer = line.match(/^#\s*Music by\s+(.+)/i)[1].trim();
        break;
      }
    }

    return { tracks, composer };
  } catch { return null; }
}

// ---------------------------------------------------------------------------
// Parse duration string "0:01:10" or "0:00:32" → milliseconds
// ---------------------------------------------------------------------------

function parseDurationToMs(str) {
  if (!str) return null;
  const parts = str.trim().split(':');
  if (parts.length === 3) {
    return (parseFloat(parts[0]) * 3600 + parseFloat(parts[1]) * 60 + parseFloat(parts[2])) * 1000;
  }
  if (parts.length === 2) {
    return (parseFloat(parts[0]) * 60 + parseFloat(parts[1])) * 1000;
  }
  return null;
}

// ---------------------------------------------------------------------------
// Process a single game directory
// ---------------------------------------------------------------------------

function processGame(gameEntry, musicDir) {
  const gameDir = join(musicDir, gameEntry.platform, gameEntry.game_slug);
  const tracksDir = join(gameDir, 'tracks');

  if (!existsSync(tracksDir) && !existsSync(gameDir)) return null;

  const scanDir = existsSync(tracksDir) ? tracksDir : gameDir;
  const files = readdirSync(scanDir);

  const result = {
    platform: gameEntry.platform,
    game_slug: gameEntry.game_slug,
    game_name: gameEntry.game_name || gameEntry.game_slug,
    source: gameEntry.source || 'zophar',
    ground_truth_ref: gameEntry.ground_truth_ref || null,
    sprite_ref: gameEntry.sprite_ref || null,

    game_metadata: null,
    tracks: [],
  };

  // Find the main music file and M3U playlist
  let mainFile = null;
  let m3uFile = null;
  const trackFiles = [];

  for (const f of files) {
    const ext = extname(f).toLowerCase();
    const fullPath = join(scanDir, f);

    if (ext === '.m3u') {
      m3uFile = fullPath;
    } else if (ext === '.nsf') {
      mainFile = { path: fullPath, format: 'nsf' };
    } else if (ext === '.gbs') {
      mainFile = { path: fullPath, format: 'gbs' };
    } else if (ext === '.spc') {
      trackFiles.push({ path: fullPath, format: 'spc', filename: f });
    } else if (ext === '.vgm' || ext === '.vgz') {
      trackFiles.push({ path: fullPath, format: 'vgm', filename: f });
    }
  }

  // Process multi-track container formats (NSF, GBS) + M3U
  if (mainFile) {
    if (mainFile.format === 'nsf') {
      const nsf = parseNSF(mainFile.path);
      if (nsf) {
        result.game_metadata = {
          format: 'nsf',
          total_tracks: nsf.total_tracks,
          title: nsf.title,
          artist: nsf.artist,
          copyright: nsf.copyright,
          region: nsf.region,
          expansion_chips: nsf.expansion_chips,
        };
      }
    } else if (mainFile.format === 'gbs') {
      const gbs = parseGBS(mainFile.path);
      if (gbs) {
        result.game_metadata = {
          format: 'gbs',
          total_tracks: gbs.total_tracks,
          title: gbs.title,
          artist: gbs.artist,
          copyright: gbs.copyright,
        };
      }
    }

    if (m3uFile) {
      const m3u = parseM3U(m3uFile);
      if (m3u) {
        if (m3u.composer && result.game_metadata) {
          result.game_metadata.composer = m3u.composer;
        }
        for (const t of m3u.tracks) {
          result.tracks.push({
            track_number: t.track_number,
            name: t.name,
            role: classifyTrackRole(t.name),
            duration_ms: parseDurationToMs(t.duration),
            fade_ms: parseDurationToMs(t.fade),
            format: mainFile.format,
            file: null,
          });
        }
      }
    }
  }

  // Process individual track files (SPC, VGM)
  if (trackFiles.length > 0) {
    trackFiles.sort((a, b) => a.filename.localeCompare(b.filename));

    for (const tf of trackFiles) {
      if (tf.format === 'spc') {
        const spc = parseSPC(tf.path);
        const trackName = spc?.title || tf.filename.replace(/^\d+\s*[-.]?\s*/, '').replace(/\.spc$/i, '');

        if (!result.game_metadata) {
          result.game_metadata = {
            format: 'spc',
            game: spc?.game || null,
            artist: spc?.artist || null,
          };
        }

        const trackNumMatch = tf.filename.match(/^(\d+)/);
        result.tracks.push({
          track_number: trackNumMatch ? parseInt(trackNumMatch[1]) : null,
          name: trackName,
          role: classifyTrackRole(trackName),
          duration_ms: spc?.duration_ms || null,
          fade_ms: spc?.fade_ms || null,
          format: 'spc',
          file: `data/assets/music/${gameEntry.platform}/${gameEntry.game_slug}/tracks/${tf.filename}`,
          spc_artist: spc?.artist || null,
        });
      } else if (tf.format === 'vgm') {
        const vgm = parseVGM(tf.path);
        const trackName = tf.filename.replace(/^\d+\s*[-.]?\s*/, '').replace(/\.vgm$/i, '').replace(/\.vgz$/i, '');

        if (!result.game_metadata) {
          result.game_metadata = {
            format: 'vgm',
            chips: vgm?.chips || [],
          };
        }

        const trackNumMatch = tf.filename.match(/^(\d+)/);
        result.tracks.push({
          track_number: trackNumMatch ? parseInt(trackNumMatch[1]) : null,
          name: trackName,
          role: classifyTrackRole(trackName),
          duration_ms: vgm?.duration_ms || null,
          has_loop: vgm?.has_loop || false,
          format: 'vgm',
          chips: vgm?.chips || [],
          file: `data/assets/music/${gameEntry.platform}/${gameEntry.game_slug}/tracks/${tf.filename}`,
        });
      }
    }
  }

  return result;
}

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------

function main() {
  log('=== Two Fires Music Catalog Builder ===');

  if (!existsSync(MUSIC_INDEX)) {
    log('ERROR: music-index.json not found. Run music scraper first.');
    process.exit(1);
  }

  const musicIndex = JSON.parse(readFileSync(MUSIC_INDEX, 'utf-8'));
  const entries = musicIndex.entries || [];

  log(`Music index has ${entries.length} games across ${Object.keys(musicIndex.by_platform || {}).length} platforms`);

  const catalogEntries = [];
  let processed = 0;
  let withTracks = 0;

  const roleCounts = {};

  for (const gameEntry of entries) {
    if (PLATFORM_FILTER && gameEntry.platform !== PLATFORM_FILTER) continue;

    const result = processGame(gameEntry, MUSIC_DIR);
    if (!result) continue;

    catalogEntries.push(result);
    processed++;
    if (result.tracks.length > 0) withTracks++;

    for (const t of result.tracks) {
      roleCounts[t.role] = (roleCounts[t.role] || 0) + 1;
    }

    if (processed % 500 === 0) {
      log(`  Processed ${processed} games, ${withTracks} with track data`);
    }
  }

  // Build summary stats
  const totalTracks = catalogEntries.reduce((sum, g) => sum + g.tracks.length, 0);
  const byPlatform = {};
  for (const g of catalogEntries) {
    if (!byPlatform[g.platform]) byPlatform[g.platform] = { game_count: 0, track_count: 0 };
    byPlatform[g.platform].game_count++;
    byPlatform[g.platform].track_count += g.tracks.length;
  }

  const catalog = {
    generated_at: new Date().toISOString(),
    total_games: catalogEntries.length,
    total_tracks: totalTracks,
    by_platform: byPlatform,
    role_distribution: Object.fromEntries(
      Object.entries(roleCounts).sort((a, b) => b[1] - a[1])
    ),
    entries: catalogEntries,
  };

  writeFileSync(MUSIC_CATALOG, JSON.stringify(catalog, null, 2));

  log('\n======================================================================');
  log('MUSIC CATALOG COMPLETE');
  log('======================================================================');
  log(`  Games processed:     ${processed}`);
  log(`  Games with tracks:   ${withTracks}`);
  log(`  Total tracks:        ${totalTracks}`);
  log(`  Role distribution:`);
  const sortedRoles = Object.entries(roleCounts).sort((a, b) => b[1] - a[1]);
  for (const [role, count] of sortedRoles.slice(0, 15)) {
    log(`    ${role.padEnd(22)} ${count}`);
  }
  log(`  Output: ${MUSIC_CATALOG}`);
}

main();
