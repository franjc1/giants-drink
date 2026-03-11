#!/usr/bin/env node
// orchestrator.js
// Session UE-1: Run Mesen2 extraction and parse output into extraction.json
//
// Usage:
//   node tools/orchestrator.js <rom-path>
//
// Example:
//   node tools/orchestrator.js ~/nes-roms/Super\ Mario\ Bros.\ \(World\).nes
//
// Output: ~/nes-extracted/<game-slug>/extraction.json
//         ~/nes-extracted/<game-slug>/state-<addr>-<val>.{vram,chr,oam}.bin

import { spawn }                                    from 'child_process';
import { mkdirSync, writeFileSync, existsSync }     from 'fs';
import { join, basename, dirname }                  from 'path';
import { fileURLToPath }                            from 'url';
import os                                           from 'os';

const __dirname = dirname(fileURLToPath(import.meta.url));
const HOME      = os.homedir();
const MESEN     = `${HOME}/mesen2/Mesen.app/Contents/MacOS/Mesen`;
const LUA       = join(__dirname, 'extraction-enumerator.lua');

const TOTAL_TIMEOUT_MS  = 5 * 60 * 1000;  // 5 minutes max
const STALL_TIMEOUT_MS  = 60 * 1000;      // 60s without output = stall

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function slugify(romPath) {
  return basename(romPath, '.nes')
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '');
}

function hexToBuffer(hex) {
  if (!hex || hex.length === 0) return Buffer.alloc(0);
  const buf = Buffer.allocUnsafe(hex.length / 2);
  for (let i = 0; i < buf.length; i++) {
    buf[i] = parseInt(hex.slice(i * 2, i * 2 + 2), 16);
  }
  return buf;
}

function parsePositions(posStr) {
  if (!posStr) return [];
  return posStr.split(';').map(p => {
    const [x, y] = p.split(',').map(Number);
    return [x, y];
  });
}

// Parse "addr=0xNNNN value=N" from a DATA_ line's value portion.
function parseAddrVal(str) {
  const addrM = str.match(/addr=0x([0-9A-Fa-f]+)/);
  const valM  = str.match(/value=(\d+)/);
  return {
    addr: addrM ? parseInt(addrM[1], 16) : null,
    val:  valM  ? parseInt(valM[1], 10)  : null,
  };
}

// ---------------------------------------------------------------------------
// Run Mesen2 and collect output
// ---------------------------------------------------------------------------

function runMesen(romPath) {
  return new Promise((resolve, reject) => {
    console.log(`\nSpawning: ${MESEN} --testrunner "${romPath}" "${LUA}"`);

    const proc  = spawn(MESEN, ['--testrunner', romPath, LUA]);
    const lines = [];
    let   buf   = '';
    let   lastOutputAt = Date.now();
    let   done  = false;

    // Stall detector: if no output for 60s, kill
    const stallTimer = setInterval(() => {
      if (Date.now() - lastOutputAt > STALL_TIMEOUT_MS) {
        console.error(`\nStall timeout (${STALL_TIMEOUT_MS / 1000}s without output)`);
        clearInterval(stallTimer);
        proc.kill();
        reject(new Error('Stall timeout'));
      }
    }, 5000);

    // Total timeout
    const totalTimer = setTimeout(() => {
      if (!done) {
        console.error(`\nTotal timeout (${TOTAL_TIMEOUT_MS / 1000}s)`);
        proc.kill();
        reject(new Error('Total timeout'));
      }
    }, TOTAL_TIMEOUT_MS);

    proc.stdout.on('data', chunk => {
      lastOutputAt = Date.now();
      buf += chunk.toString('binary');
      const parts = buf.split('\n');
      for (let i = 0; i < parts.length - 1; i++) {
        const line = parts[i].trim();
        if (!line) continue;
        lines.push(line);
        if (line.startsWith('DATA_')) {
          const key = line.split(':')[0];
          const truncated = (line.length > 100)
            ? `${line.slice(0, 100)}...(${line.length} chars)`
            : line;
          if (!['DATA_RAM','DATA_CHR','DATA_VRAM','DATA_OAM','DATA_OAM_FRAME','DATA_APU_FRAME'].includes(key)) {
            console.log('  ' + truncated);
          } else {
            const colon = line.indexOf(':');
            const rest  = line.slice(colon + 1, colon + 80);
            const bytes = (line.length - key.length - 1) / 2;
            console.log(`  ${key}: ${rest.split(' data=')[0]} (${bytes} bytes)`);
          }
        } else if (line.startsWith('STATUS_') || line.startsWith('ERROR_')) {
          console.log('  ' + line);
        }
      }
      buf = parts[parts.length - 1];
    });

    proc.stderr.on('data', chunk => {
      const text = chunk.toString();
      // Filter out Mesen's uninitialized memory read noise
      const filtered = text.split('\n')
        .filter(l => l.trim() && !l.includes('Uninitialized memory read'))
        .join('\n');
      if (filtered.trim()) process.stderr.write(filtered + '\n');
    });

    proc.on('close', code => {
      done = true;
      clearInterval(stallTimer);
      clearTimeout(totalTimer);
      if (buf.trim().startsWith('DATA_') || buf.trim().startsWith('STATUS_')) {
        lines.push(buf.trim());
      }
      console.log(`\nMesen exit code: ${code}`);
      resolve({ lines, exitCode: code });
    });

    proc.on('error', err => {
      clearInterval(stallTimer);
      clearTimeout(totalTimer);
      reject(err);
    });
  });
}

// ---------------------------------------------------------------------------
// Parse DATA_* lines into structured extraction object
// ---------------------------------------------------------------------------

function parseLines(lines, slug) {
  const extraction = {
    gameSlug:    slug,
    extractedAt: new Date().toISOString(),
    complete:    false,
    phase1:      { complete: false, frame: null },
    phase2:      { complete: false, candidates: [] },
    phase3:      { complete: false, contentVarsCount: 0, contentVariables: [] },
    phase4:      { complete: false, statesCaptured: 0, states: [] },
    phase5:      { complete: false, testsCount: 0, playerSlot: -1, physicsTests: [] },
  };

  // Current Phase 4 state accumulator (assembles one state from multiple DATA_ lines)
  const stateMap = new Map(); // key="addr-val" => state object

  for (const line of lines) {
    const colon = line.indexOf(':');
    if (colon === -1) continue;
    const key = line.slice(0, colon);
    const val = line.slice(colon + 1);

    switch (key) {

      case 'DATA_PHASE1': {
        const m = val.match(/frame=(\d+)/);
        extraction.phase1.frame    = m ? parseInt(m[1]) : null;
        extraction.phase1.complete = true;
        break;
      }

      case 'DATA_PHASE2': {
        const m = val.match(/candidates=(\d+)/);
        extraction.phase2.candidateCount = m ? parseInt(m[1]) : 0;
        extraction.phase2.complete       = true;
        break;
      }

      case 'DATA_CANDIDATE': {
        const m = val.match(/addr=0x([0-9A-Fa-f]+)/);
        if (m) extraction.phase2.candidates.push(parseInt(m[1], 16));
        break;
      }

      case 'DATA_PHASE3': {
        const m = val.match(/content_vars=(\d+)/);
        extraction.phase3.contentVarsCount = m ? parseInt(m[1]) : 0;
        extraction.phase3.complete         = true;
        break;
      }

      case 'DATA_CONTENT_VAR': {
        const addrM  = val.match(/addr=0x([0-9A-Fa-f]+)/);
        const uniqM  = val.match(/unique=(\d+)/);
        const valsM  = val.match(/values=\[([^\]]*)\]/);
        const values = valsM ? valsM[1].split(',').filter(Boolean).map(Number) : [];
        extraction.phase3.contentVariables.push({
          addr:   addrM ? parseInt(addrM[1], 16) : null,
          unique: uniqM ? parseInt(uniqM[1]) : 0,
          values,
        });
        break;
      }

      case 'DATA_PHASE4': {
        const m = val.match(/states_captured=(\d+)/);
        extraction.phase4.statesCaptured = m ? parseInt(m[1]) : 0;
        extraction.phase4.complete       = true;
        break;
      }

      // Per-state data lines share the same addr/value key
      case 'DATA_RAM':
      case 'DATA_VRAM':
      case 'DATA_PALETTE':
      case 'DATA_OAM':
      case 'DATA_CHR':
      case 'DATA_PPUCTRL': {
        const { addr, val: stateVal } = parseAddrVal(val);
        if (addr === null) break;
        const mapKey = `${addr}-${stateVal}`;
        if (!stateMap.has(mapKey)) {
          const existing = extraction.phase4.states.find(
            s => s.addr === addr && s.value === stateVal
          );
          if (!existing) {
            const s = { addr, value: stateVal, oamFrames: [], apuFrames: [] };
            extraction.phase4.states.push(s);
            stateMap.set(mapKey, s);
          } else {
            stateMap.set(mapKey, existing);
          }
        }
        const state = stateMap.get(mapKey);
        const dataM = val.match(/ data=([0-9a-f]*)$/);
        const hex   = dataM ? dataM[1] : '';

        if (key === 'DATA_RAM')     state.ram     = hex;
        if (key === 'DATA_VRAM')    state.vram    = hex;
        if (key === 'DATA_PALETTE') state.palette = hex;
        if (key === 'DATA_OAM')     state.oam     = hex;
        if (key === 'DATA_CHR') {
          const sizeM = val.match(/size=(\d+)/);
          const srcM  = val.match(/src=(\w+)/);
          state.chr = { size: sizeM ? parseInt(sizeM[1]) : 0, src: srcM ? srcM[1] : 'unknown', data: hex };
        }
        if (key === 'DATA_PPUCTRL') {
          const ctrlM = val.match(/ctrl=0x([0-9A-Fa-f]+)/);
          const maskM = val.match(/mask=0x([0-9A-Fa-f]+)/);
          state.ppuCtrl = ctrlM ? parseInt(ctrlM[1], 16) : 0;
          state.ppuMask = maskM ? parseInt(maskM[1], 16) : 0;
        }
        break;
      }

      case 'DATA_OAM_FRAME': {
        const { addr, val: stateVal } = parseAddrVal(val);
        if (addr === null) break;
        const mapKey = `${addr}-${stateVal}`;
        const state  = stateMap.get(mapKey);
        if (!state) break;
        const frameM = val.match(/frame=(\d+)/);
        const dataM  = val.match(/ data=([0-9a-f]*)$/);
        state.oamFrames.push({
          frame: frameM ? parseInt(frameM[1]) : 0,
          data:  dataM  ? dataM[1] : '',
        });
        break;
      }

      case 'DATA_APU': {
        const { addr, val: stateVal } = parseAddrVal(val);
        if (addr === null) break;
        const mapKey = `${addr}-${stateVal}`;
        const state  = stateMap.get(mapKey);
        if (!state) break;
        const dataM = val.match(/ data=([0-9a-f]*)$/);
        state.apuRegisters = dataM ? dataM[1] : '';
        break;
      }

      case 'DATA_APU_FRAME': {
        const { addr, val: stateVal } = parseAddrVal(val);
        if (addr === null) break;
        const mapKey = `${addr}-${stateVal}`;
        const state  = stateMap.get(mapKey);
        if (!state) break;
        if (!state.apuFrames) state.apuFrames = [];
        const frameM = val.match(/frame=(\d+)/);
        const dataM  = val.match(/ data=([0-9a-f]*)$/);
        state.apuFrames.push({
          frame: frameM ? parseInt(frameM[1]) : 0,
          data:  dataM  ? dataM[1] : '',
        });
        break;
      }

      // Bulk candidate list (comma-separated hex addresses from Phase 2)
      case 'DATA_CANDIDATES': {
        const addrs = val.split(',').filter(Boolean);
        for (const a of addrs) {
          const m = a.match(/0x([0-9A-Fa-f]+)/);
          if (m) extraction.phase2.candidates.push(parseInt(m[1], 16));
        }
        break;
      }

      case 'DATA_PHASE5': {
        const m = val.match(/tests=(\d+)/);
        extraction.phase5.testsCount = m ? parseInt(m[1]) : 0;
        extraction.phase5.complete   = true;
        break;
      }

      case 'DATA_PHYSICS': {
        const testM = val.match(/test=(\w+)/);
        const frmM  = val.match(/frames=(\d+)/);
        const posM  = val.match(/positions=(.+)$/);
        extraction.phase5.physicsTests.push({
          test:      testM ? testM[1] : 'UNKNOWN',
          frames:    frmM  ? parseInt(frmM[1]) : 0,
          positions: posM  ? parsePositions(posM[1]) : [],
        });
        break;
      }

      case 'DATA_EXTRACTION': {
        extraction.complete = (val.trim() === 'COMPLETE');
        break;
      }

      default:
        break;
    }
  }

  // Extract player slot from STATUS lines
  for (const line of lines) {
    if (line.startsWith('STATUS_PHASE5:Player slot=')) {
      const m = line.match(/slot=(\d+)/);
      if (m) extraction.phase5.playerSlot = parseInt(m[1]);
    }
  }

  return extraction;
}

// ---------------------------------------------------------------------------
// Save extraction data to disk
// ---------------------------------------------------------------------------

function saveExtraction(extraction, outDir) {
  mkdirSync(outDir, { recursive: true });

  // Save per-state binary files for large data (vram, chr, oam)
  // and strip large hex from the main JSON to keep it reasonable
  const lightExtraction = JSON.parse(JSON.stringify(extraction));

  for (const state of lightExtraction.phase4.states) {
    const prefix = `state-0x${state.addr.toString(16).padStart(4,'0')}-v${state.value}`;

    if (state.vram && state.vram.length > 0) {
      writeFileSync(join(outDir, `${prefix}.vram.bin`), hexToBuffer(state.vram));
      state.vram = `[saved to ${prefix}.vram.bin]`;
    }
    if (state.chr && state.chr.data && state.chr.data.length > 0) {
      writeFileSync(join(outDir, `${prefix}.chr.bin`), hexToBuffer(state.chr.data));
      state.chr.data = `[saved to ${prefix}.chr.bin]`;
    }
    if (state.ram && state.ram.length > 0) {
      writeFileSync(join(outDir, `${prefix}.ram.bin`), hexToBuffer(state.ram));
      state.ram = `[saved to ${prefix}.ram.bin]`;
    }
    // Keep oam inline (only 256 bytes = 512 hex chars, small enough)
    // Strip individual oamFrames data to keep JSON manageable
    if (state.oamFrames && state.oamFrames.length > 0) {
      writeFileSync(join(outDir, `${prefix}.oam-frames.json`),
        JSON.stringify(state.oamFrames, null, 2));
      state.oamFrames = `[saved to ${prefix}.oam-frames.json, ${state.oamFrames.length} frames]`;
    }
    if (state.apuFrames && state.apuFrames.length > 0) {
      writeFileSync(join(outDir, `${prefix}.apu-frames.json`),
        JSON.stringify(state.apuFrames, null, 2));
      state.apuFrames = `[saved to ${prefix}.apu-frames.json, ${state.apuFrames.length} frames]`;
    }
  }

  const jsonPath = join(outDir, 'extraction.json');
  writeFileSync(jsonPath, JSON.stringify(lightExtraction, null, 2));
  console.log(`\nSaved: ${jsonPath}`);
  return jsonPath;
}

// ---------------------------------------------------------------------------
// Print summary
// ---------------------------------------------------------------------------

function printSummary(extraction) {
  console.log('\n' + '='.repeat(60));
  console.log('EXTRACTION SUMMARY');
  console.log('='.repeat(60));
  console.log(`Game:          ${extraction.gameSlug}`);
  console.log(`Complete:      ${extraction.complete}`);
  console.log('');

  const p1 = extraction.phase1;
  console.log(`Phase 1 (Boot):        ${p1.complete ? 'OK' : 'FAILED'} — gameplay at frame ${p1.frame}`);

  const p2 = extraction.phase2;
  console.log(`Phase 2 (Candidates):  ${p2.complete ? 'OK' : 'FAILED'} — ${p2.candidates.length} candidates`);

  const p3 = extraction.phase3;
  console.log(`Phase 3 (Sweep):       ${p3.complete ? 'OK' : 'FAILED'} — ${p3.contentVariables.length} content variables`);
  for (const cv of p3.contentVariables) {
    console.log(`  0x${cv.addr.toString(16).toUpperCase().padStart(4,'0')}: ${cv.unique} unique states, ${cv.values.length} values`);
  }

  const p4 = extraction.phase4;
  console.log(`Phase 4 (Enumeration): ${p4.complete ? 'OK' : 'FAILED'} — ${p4.statesCaptured} states captured`);
  const statesWithApu = extraction.phase4.states.filter(s => s.apuRegisters).length;
  if (statesWithApu > 0) {
    console.log(`  Audio (APU): ${statesWithApu}/${p4.statesCaptured} states with APU register snapshot`);
  }

  const p5 = extraction.phase5;
  console.log(`Phase 5 (Physics):     ${p5.complete ? 'OK' : 'FAILED'} — ${p5.testsCount} tests, player slot=${p5.playerSlot}`);
  for (const t of p5.physicsTests) {
    console.log(`  ${t.test}: ${t.positions.length} frames recorded`);
  }
  console.log('='.repeat(60));
}

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------

async function main() {
  const romPath = process.argv[2];
  if (!romPath) {
    console.error('Usage: node tools/orchestrator.js <rom-path>');
    process.exit(1);
  }

  const expanded = romPath.replace(/^~/, HOME);
  if (!existsSync(expanded)) {
    console.error(`ROM not found: ${expanded}`);
    process.exit(1);
  }
  if (!existsSync(MESEN)) {
    console.error(`Mesen2 not found: ${MESEN}`);
    process.exit(1);
  }

  const slug   = slugify(expanded);
  const outDir = join(HOME, 'nes-extracted', slug);

  console.log('=== Two Fires Universal Extraction ===');
  console.log(`ROM:    ${expanded}`);
  console.log(`Slug:   ${slug}`);
  console.log(`Output: ${outDir}`);

  const startTime = Date.now();
  let lines, exitCode;

  try {
    ({ lines, exitCode } = await runMesen(expanded));
  } catch (err) {
    console.error(`\nExtraction failed: ${err.message}`);
    process.exit(1);
  }

  const elapsed = ((Date.now() - startTime) / 1000).toFixed(1);
  console.log(`\nTotal time: ${elapsed}s  |  Lines received: ${lines.length}`);

  const extraction = parseLines(lines, slug);
  const jsonPath   = saveExtraction(extraction, outDir);
  printSummary(extraction);

  if (!extraction.complete) {
    console.warn('\nWARNING: Extraction did not complete (DATA_EXTRACTION:COMPLETE not received)');
    process.exit(1);
  }

  console.log(`\nExtraction complete. Results at: ${jsonPath}`);
}

main().catch(err => {
  console.error(err);
  process.exit(1);
});
