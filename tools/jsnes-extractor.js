/**
 * jsnes-extractor.js — Universal NES extraction pipeline
 *
 * Phases:
 *   1: Boot to gameplay + player discovery (OAM slot, X/Y RAM addresses, BASELINE save)
 *   2: Candidate variable identification (volatile + forced ranges)
 *   3: Mutation sweep (content variable detection via VRAM hash)
 *   5: Physics extraction (walk/jump/gravity/friction from input sequences)
 *   4: Deep state capture (full VRAM/RAM capture per unique content state)
 *
 * Usage:
 *   node tools/jsnes-extractor.js <rom-path> [output-dir]
 *   node tools/jsnes-extractor.js ~/nes-roms/"Super Mario Bros. (World).nes"
 */

import { NES, Controller } from "jsnes";
import fs from "fs";
import path from "path";
import { homedir } from "os";

// ── CLI args ───────────────────────────────────────────────────────────────────

const ROM_PATH = process.argv[2];
if (!ROM_PATH) {
  console.error("Usage: node jsnes-extractor.js <rom-path> [output-dir]");
  process.exit(1);
}

function slugify(name) {
  return name
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-|-$/g, "");
}

const romSlug = slugify(path.basename(ROM_PATH, ".nes"));
const OUTPUT_DIR =
  process.argv[3] || path.join(homedir(), "nes-extracted", romSlug);

// ── NES factory ───────────────────────────────────────────────────────────────

function makeNES() {
  return new NES({
    onFrame: () => {},
    onAudioSample: null,
    onStatusUpdate: () => {},
    emulateSound: false,
  });
}

// ── Low-level helpers ─────────────────────────────────────────────────────────

const BTNS = [
  Controller.BUTTON_A,
  Controller.BUTTON_B,
  Controller.BUTTON_SELECT,
  Controller.BUTTON_START,
  Controller.BUTTON_UP,
  Controller.BUTTON_DOWN,
  Controller.BUTTON_LEFT,
  Controller.BUTTON_RIGHT,
];

function clearInput(nes) {
  for (const b of BTNS) nes.buttonUp(1, b);
}

function step(nes, n = 1) {
  for (let i = 0; i < n; i++) nes.frame();
}

/** Copy 2KB of NES internal RAM (0x0000–0x07FF). Mirrors not active in cpu.mem[]. */
function snapshotRAM(nes) {
  return nes.cpu.mem.slice(0, 0x800);
}

/** Copy 256-byte OAM. */
function snapshotOAM(nes) {
  return nes.ppu.spriteMem.slice(0, 256);
}

/** Read one RAM byte (zero-page or page-1 — direct access, no mirror mask needed). */
function ram(nes, addr) {
  return nes.cpu.mem[addr];
}

/**
 * Fast screen hash: djb2 over nametable 0 tiles + pattern table 0.
 * Detects both nametable changes (CHR-ROM level IDs via HUD/tilemap)
 * and pattern table changes (CHR-RAM bank switches).
 */
function hashScreen(nes) {
  const v = nes.ppu.vramMem;
  let h = 5381;
  // Nametable 0 tile area (960 bytes — layout/level indicator)
  for (let i = 0x2000; i < 0x23c0; i++) {
    h = (((h << 5) + h) ^ v[i]) >>> 0;
  }
  // Pattern table 0 first 4KB (CHR-RAM change detection)
  for (let i = 0; i < 0x1000; i++) {
    h = (((h << 5) + h) ^ v[i]) >>> 0;
  }
  return h;
}

/** Count visible sprites in OAM (Y < 0xEF means on-screen). */
function activeSprites(nes) {
  let n = 0;
  for (let i = 0; i < 64; i++) {
    if (nes.ppu.spriteMem[i * 4] < 0xef) n++;
  }
  return n;
}

/** Ratio of non-zero bytes in nametable 0 tile area (0.0–1.0). */
function nametableDensity(nes) {
  const v = nes.ppu.vramMem;
  let nonZero = 0;
  for (let i = 0x2000; i < 0x23c0; i++) {
    if (v[i] !== 0) nonZero++;
  }
  return nonZero / 960;
}

/** Heuristic: is the game in an active gameplay state? */
function isGameplay(nes) {
  return activeSprites(nes) > 4 && nametableDensity(nes) > 0.55;
}

function toHex(uint8arr) {
  return Buffer.from(uint8arr).toString("hex");
}

// ── Phase 1: Boot + Player Discovery ─────────────────────────────────────────

function phase1(nes) {
  console.log("\n╔══════════════════════════════╗");
  console.log("║  PHASE 1: Boot + Discovery   ║");
  console.log("╚══════════════════════════════╝");

  let totalFrames = 0;
  let playerOAMSlot = -1;
  let xAddr = -1;
  let p1BaselineState = null;

  // ── 1a. Boot loop: run until bidirectional control test PASSES ──────────────
  // Each cycle: press Start (+ A) for 1 frame, step 119 frames, run bidir test.
  // Continue until input moves OAM or RAM, or 15 cycles (1800 frames) timeout.
  //
  // Why loop on bidir test: title screen has high sprite count + dense nametable,
  // so isGameplay() fires on the title screen. Real gameplay is confirmed only
  // when directional input actually moves something.

  let controlConfirmed = false;

  for (let cycle = 0; cycle < 15 && !controlConfirmed; cycle++) {
    // Every cycle: tap Start (and A on odd cycles)
    nes.buttonDown(1, Controller.BUTTON_START);
    if (cycle % 2 === 1) nes.buttonDown(1, Controller.BUTTON_A);
    nes.frame();
    nes.buttonUp(1, Controller.BUTTON_START);
    nes.buttonUp(1, Controller.BUTTON_A);

    step(nes, 119);
    totalFrames += 120;

    const spr = activeSprites(nes);
    const nt = nametableDensity(nes);
    process.stdout.write(
      `  cycle ${(cycle + 1).toString().padStart(2)}/15 (frame ${totalFrames}): ` +
        `sprites=${spr} ntDensity=${(nt * 100).toFixed(1)}%`
    );

    // Only bother with bidir test once game looks active enough
    if (spr <= 2) {
      process.stdout.write("  → still on splash/title\n");
      continue;
    }

    // ── Bidirectional control test ──────────────────────────────────────────
    const preState = nes.toJSON();
    const oam_pre = snapshotOAM(nes);
    const ram_pre = snapshotRAM(nes);

    // Right test: 15 frames (longer than 10 to handle games with input lag)
    nes.buttonDown(1, Controller.BUTTON_RIGHT);
    step(nes, 15);
    nes.buttonUp(1, Controller.BUTTON_RIGHT);
    const oam_right = snapshotOAM(nes);
    const ram_right = snapshotRAM(nes);

    // Left test from same pre-state
    nes.fromJSON(preState);
    nes.buttonDown(1, Controller.BUTTON_LEFT);
    step(nes, 15);
    nes.buttonUp(1, Controller.BUTTON_LEFT);
    const oam_left = snapshotOAM(nes);
    const ram_left = snapshotRAM(nes);

    nes.fromJSON(preState); // restore before deciding

    // Check OAM: any visible slot with X moving right then left
    for (let slot = 0; slot < 64 && playerOAMSlot < 0; slot++) {
      if (oam_pre[slot * 4] >= 0xef) continue; // not visible
      const xPre = oam_pre[slot * 4 + 3];
      const dxR = oam_right[slot * 4 + 3] - xPre;
      const dxL = oam_left[slot * 4 + 3] - xPre;
      if (dxR > 0 && dxL < 0) {
        playerOAMSlot = slot;
      }
    }

    // Check RAM: any byte moving right(+) / left(-) with score ≥ 2
    let bestXScore = 0;
    for (let addr = 0; addr < 0x800; addr++) {
      const dR = ram_right[addr] - ram_pre[addr];
      const dL = ram_left[addr] - ram_pre[addr];
      if (dR > 0 && dL < 0) {
        const score = Math.abs(dR) + Math.abs(dL);
        if (score > bestXScore) {
          bestXScore = score;
          xAddr = addr;
        }
      }
    }

    const ramMoved = bestXScore >= 2;
    const oamMoved = playerOAMSlot >= 0;
    controlConfirmed = ramMoved || oamMoved;

    if (controlConfirmed) {
      process.stdout.write(
        `  ✓ control confirmed` +
          (oamMoved ? ` OAMslot=${playerOAMSlot}` : "") +
          (ramMoved ? ` Xaddr=$${xAddr.toString(16).padStart(4, "0")} score=${bestXScore}` : "") +
          "\n"
      );
      // p1BaselineState is the state just before we confirmed control
      p1BaselineState = preState;
    } else {
      process.stdout.write(
        `  → no movement (oam=${oamMoved} ram=${ramMoved} bestXscore=${bestXScore})\n`
      );
    }
  }

  if (!controlConfirmed) {
    console.log(`  ⚠ Control NOT confirmed after 1800 frames — proceeding with fallback`);
    p1BaselineState = nes.toJSON();
  }

  // ── 1c. Settle 120 frames ─────────────────────────────────────────────────
  // Restore to the confirmed interactive state, then settle.
  nes.fromJSON(p1BaselineState);
  clearInput(nes);
  step(nes, 120);
  totalFrames += 120;
  console.log(`  Settled 120 frames (total ~${totalFrames} frames run)`);

  // ── 1d. Y address discovery ───────────────────────────────────────────────
  console.log("  Discovering Y address (jump test)...");

  const ram_y_pre = snapshotRAM(nes);

  // Hold A 20 frames (extended window for MM2 compatibility)
  nes.buttonDown(1, Controller.BUTTON_A);
  step(nes, 20);
  nes.buttonUp(1, Controller.BUTTON_A);

  // Snapshot at frame 20 from A press (immediately after release — ascending)
  const ram_y_peak = snapshotRAM(nes);

  // Wait for landing: 60 more frames
  step(nes, 60);
  const ram_y_land = snapshotRAM(nes);
  totalFrames += 80;

  // Find Y: base > 128 (NES ground Y > 128), decreased at peak, returned at land
  let yAddr = -1;
  let bestYDelta = 0;

  for (let addr = 0; addr < 0x800; addr++) {
    const base = ram_y_pre[addr];
    if (base <= 128) continue; // filter timers: NES platform ground Y always > 128

    const atPeak = ram_y_peak[addr];
    const atLand = ram_y_land[addr];
    const dPeak = base - atPeak; // positive = Y decreased (went up)
    const dLand = Math.abs(base - atLand);

    if (dPeak > 15 && dLand <= 8 && dPeak > bestYDelta) {
      bestYDelta = dPeak;
      yAddr = addr;
    }
  }

  if (yAddr >= 0) {
    console.log(
      `  Y addr: $${yAddr.toString(16).padStart(4, "0")}  ` +
        `base=${ram_y_pre[yAddr]} peak=${ram_y_peak[yAddr]} land=${ram_y_land[yAddr]}  ` +
        `delta=${bestYDelta}`
    );
  } else {
    // Fallback: scan all, no base filter
    console.log(`  ⚠ Y not found with base>128 filter — trying without...`);
    for (let addr = 0; addr < 0x800; addr++) {
      const base = ram_y_pre[addr];
      const dPeak = base - ram_y_peak[addr];
      const dLand = Math.abs(base - ram_y_land[addr]);
      if (dPeak > 15 && dLand <= 8 && dPeak > bestYDelta) {
        bestYDelta = dPeak;
        yAddr = addr;
      }
    }
    if (yAddr >= 0) {
      console.log(
        `  Y addr (no filter): $${yAddr.toString(16).padStart(4, "0")}  delta=${bestYDelta}`
      );
    } else {
      console.log(`  ⚠ Y address not found`);
    }
  }

  // ── 1e. Settle + save BASELINE ────────────────────────────────────────────
  clearInput(nes);
  step(nes, 60);
  totalFrames += 60;
  const baseline = nes.toJSON();
  console.log(`  BASELINE saved (~${totalFrames} total frames)`);

  // ── Summary ───────────────────────────────────────────────────────────────
  console.log(`\n  Phase 1 summary:`);
  console.log(`    Control confirmed: ${controlConfirmed}`);
  console.log(`    OAM player slot:   ${playerOAMSlot >= 0 ? playerOAMSlot : "NOT FOUND"}`);
  console.log(
    `    X addr: ${xAddr >= 0 ? `$${xAddr.toString(16).padStart(4, "0")}` : "NOT FOUND"}  ` +
      `(current=${xAddr >= 0 ? ram(nes, xAddr) : "?"})`
  );
  console.log(
    `    Y addr: ${yAddr >= 0 ? `$${yAddr.toString(16).padStart(4, "0")}` : "NOT FOUND"}  ` +
      `(current=${yAddr >= 0 ? ram(nes, yAddr) : "?"})`
  );

  return { baseline, p1BaselineState, xAddr, yAddr, playerOAMSlot, totalFrames, controlConfirmed };
}

// ── Phase 2: Candidate Variable Identification ────────────────────────────────

function phase2(nes, baseline) {
  console.log("\n╔══════════════════════════════╗");
  console.log("║  PHASE 2: Candidate IDs       ║");
  console.log("╚══════════════════════════════╝");

  nes.fromJSON(baseline);

  // Take 5 RAM snapshots over 300 frames
  const snapshots = [];
  for (let s = 0; s < 5; s++) {
    snapshots.push(snapshotRAM(nes));
    step(nes, 60);
  }

  // Classify each byte
  const volatile = new Set();
  const ticker = new Set();

  for (let addr = 0; addr < 0x800; addr++) {
    const vals = snapshots.map((s) => s[addr]);
    const allSame = vals.every((v) => v === vals[0]);
    const strictlyIncreasing = vals.every((v, i) => i === 0 || v > vals[i - 1]);
    const strictlyDecreasing = vals.every((v, i) => i === 0 || v < vals[i - 1]);

    if (allSame) continue; // CONSTANT — skip
    if (strictlyIncreasing || strictlyDecreasing) {
      ticker.add(addr); // TICKER — skip
      continue;
    }
    volatile.add(addr); // VOLATILE — candidate
  }

  // CRITICAL FIX (Decision from Session 11): force-add zero-page and high page.
  // Level-switching variables are CONSTANT during gameplay — volatility filter misses them.
  const forced = new Set();
  for (let addr = 0x000; addr <= 0x0ff; addr++) forced.add(addr); // zero-page
  for (let addr = 0x700; addr <= 0x7ff; addr++) forced.add(addr); // 0x700-0x7FF

  // Build final candidate set (forced union volatile, no duplicates)
  const candidates = new Set([...forced, ...volatile]);

  // Stats
  const volatileOnly = [...volatile].filter((a) => !forced.has(a));
  const forcedOnly = [...forced].filter((a) => !volatile.has(a));
  const overlap = [...forced].filter((a) => volatile.has(a));

  console.log(`  Total RAM bytes scanned: 2048 (0x0000–0x07FF)`);
  console.log(`  Volatile (non-constant, non-ticker): ${volatile.size}`);
  console.log(`  Ticker (monotonic): ${ticker.size}`);
  console.log(`  Forced ranges (0x000-0x0FF, 0x700-0x7FF): ${forced.size}`);
  console.log(`  Overlap (forced ∩ volatile): ${overlap.length}`);
  console.log(`  Total candidates: ${candidates.size}`);

  return { candidates: [...candidates].sort((a, b) => a - b) };
}

// ── Phase 3: Mutation Sweep ───────────────────────────────────────────────────

function phase3(nes, baseline, candidates) {
  console.log("\n╔══════════════════════════════╗");
  console.log("║  PHASE 3: Mutation Sweep      ║");
  console.log("╚══════════════════════════════╝");
  console.log(`  Scanning ${candidates.length} candidates...`);

  const COARSE_VALUES = Array.from({ length: 32 }, (_, i) => i * 8); // 0,8,16,...248

  // Compute reference hash: baseline + 3 frames with NO writes.
  // We compare every mutation against this, not against the static baseline hash.
  // This eliminates false positives from animations/scroll updating every few frames.
  const referenceHashes = new Set();
  for (let rep = 0; rep < 4; rep++) {
    // Sample 4 reference hashes to account for any frame-to-frame variance
    nes.fromJSON(baseline);
    step(nes, 3);
    referenceHashes.add(hashScreen(nes));
  }

  const contentVars = [];
  let processed = 0;
  const logInterval = Math.max(1, Math.floor(candidates.length / 10));

  for (const addr of candidates) {
    // Restore BASELINE before each value (per-value restore).
    // "Restore once per address" caused false positives: 96 continuous frames of
    // game animation produced unique hashes at every 3-frame step even without
    // any meaningful RAM change. Per-value restore compares identical starting
    // conditions.
    const uniqueHashes = new Set();

    for (const val of COARSE_VALUES) {
      nes.fromJSON(baseline);
      nes.cpu.mem[addr] = val;
      try {
        step(nes, 3);
        const h = hashScreen(nes);
        if (!referenceHashes.has(h)) uniqueHashes.add(h);
      } catch (_e) {
        // Invalid opcode from corrupted CPU state — skip this value, not a problem
      }
    }

    if (uniqueHashes.size > 3) {
      contentVars.push({ addr, coarseUniqueCount: uniqueHashes.size, uniqueValues: [] });
    }

    processed++;
    if (processed % logInterval === 0) {
      process.stdout.write(`  ${processed}/${candidates.length}...\r`);
    }
  }

  console.log(`  Coarse sweep complete. Content variables found: ${contentVars.length}`);

  // Fine sweep: all 256 values for each content variable
  for (const cv of contentVars) {
    const seen = new Map(); // hash → value

    for (let val = 0; val <= 255; val++) {
      nes.fromJSON(baseline);
      nes.cpu.mem[cv.addr] = val;
      try {
        step(nes, 3);
        const h = hashScreen(nes);
        if (!referenceHashes.has(h) && !seen.has(h)) {
          seen.set(h, val);
          cv.uniqueValues.push(val);
        }
      } catch (_e) {
        // skip
      }
    }

    cv.fineSweepUniqueCount = seen.size; // no baseline subtraction (reference hashes filtered)

    console.log(
      `  Content var $${cv.addr.toString(16).padStart(4, "0")}: ` +
        `${cv.fineSweepUniqueCount} unique VRAM states  ` +
        `values=[${cv.uniqueValues.slice(0, 16).join(",")}${cv.uniqueValues.length > 16 ? "..." : ""}]`
    );
  }

  if (contentVars.length === 0) {
    console.log(`  ⚠ No content variables found!`);
    console.log(
      `    Possible causes: game needs longer settle, or level vars don't affect VRAM in 3 frames.`
    );
  }

  // Validate against known SMB addresses if applicable
  const smbKnown = [0x075c, 0x075f, 0x073d];
  const found = contentVars.map((cv) => cv.addr);
  for (const known of smbKnown) {
    if (found.includes(known)) {
      console.log(
        `  ✓ Found known SMB address $${known.toString(16).padStart(4, "0")}`
      );
    }
  }

  return { contentVars };
}

// ── Phase 5: Physics Extraction ───────────────────────────────────────────────

function phase5(nes, baseline, xAddr, yAddr) {
  console.log("\n╔══════════════════════════════╗");
  console.log("║  PHASE 5: Physics Extraction  ║");
  console.log("╚══════════════════════════════╝");

  if (xAddr < 0 || yAddr < 0) {
    console.log(`  ⚠ X or Y address missing — skipping physics extraction`);
    return { tests: {}, physics: null };
  }

  const MAX_RETRIES = 3;
  const SETTLE_FRAMES = [30, 60, 120];

  /**
   * Settle and verify player is grounded (Y stable).
   * Returns true if grounded, false if still airborne after max retries.
   */
  function settleAndVerify() {
    for (let retry = 0; retry < MAX_RETRIES; retry++) {
      // 4-state settle: clearInput 60f → Left 5f (cancel rightward inertia) → clearInput 60f → stability check
      clearInput(nes);
      step(nes, 60);
      nes.buttonDown(1, Controller.BUTTON_LEFT);
      step(nes, 5);
      nes.buttonUp(1, Controller.BUTTON_LEFT);
      clearInput(nes);
      step(nes, 60);

      // Y stability check: read Y, wait 30 frames, read again
      const yStart = ram(nes, yAddr);
      step(nes, 30);
      const yEnd = ram(nes, yAddr);

      if (Math.abs(yEnd - yStart) <= 2) {
        return true; // grounded
      }

      console.log(
        `    Retry ${retry + 1}/${MAX_RETRIES}: player airborne (dY=${yEnd - yStart}) — ` +
          `reloading baseline and waiting ${SETTLE_FRAMES[retry]} frames`
      );
      nes.fromJSON(baseline);
      step(nes, SETTLE_FRAMES[retry]);
    }

    console.log(`    ⚠ Player still airborne after ${MAX_RETRIES} retries — proceeding anyway`);
    return false;
  }

  /**
   * Run one physics test:
   *   - Restore baseline
   *   - Settle and verify ground state
   *   - Execute input sequence, recording X/Y every frame
   */
  function runTest(name, inputFn, recordFrames) {
    console.log(`\n  Test: ${name}`);
    nes.fromJSON(baseline);
    const grounded = settleAndVerify();
    if (!grounded) console.log(`    ⚠ Starting test from airborne state`);

    const xs = [];
    const ys = [];

    inputFn(nes, () => {
      xs.push(ram(nes, xAddr));
      ys.push(ram(nes, yAddr));
    }, recordFrames);

    clearInput(nes);
    return { xs, ys };
  }

  const tests = {};

  // ── Test 1: WALK_RIGHT ──────────────────────────────────────────────────────
  tests.walkRight = runTest("WALK_RIGHT (60 frames Right)", (nes, record, n) => {
    nes.buttonDown(1, Controller.BUTTON_RIGHT);
    for (let f = 0; f < n; f++) {
      nes.frame();
      record();
    }
    nes.buttonUp(1, Controller.BUTTON_RIGHT);
  }, 60);

  console.log(
    `    X: ${tests.walkRight.xs.slice(0, 8).join(",")}...${tests.walkRight.xs.slice(-4).join(",")}`
  );

  // ── Test 2: WALK_LEFT ───────────────────────────────────────────────────────
  tests.walkLeft = runTest("WALK_LEFT (60 frames Left)", (nes, record, n) => {
    nes.buttonDown(1, Controller.BUTTON_LEFT);
    for (let f = 0; f < n; f++) {
      nes.frame();
      record();
    }
    nes.buttonUp(1, Controller.BUTTON_LEFT);
  }, 60);

  console.log(
    `    X: ${tests.walkLeft.xs.slice(0, 8).join(",")}...${tests.walkLeft.xs.slice(-4).join(",")}`
  );

  // ── Test 3: JUMP_TAP ────────────────────────────────────────────────────────
  tests.jumpTap = runTest("JUMP_TAP (A for 3 frames, record 60)", (nes, record, n) => {
    // Tap A briefly, then record full arc
    nes.buttonDown(1, Controller.BUTTON_A);
    step(nes, 3);
    nes.buttonUp(1, Controller.BUTTON_A);
    for (let f = 0; f < n; f++) {
      nes.frame();
      record();
    }
  }, 60);

  const tapMinY = Math.min(...tests.jumpTap.ys);
  console.log(
    `    Y: ${tests.jumpTap.ys.slice(0, 8).join(",")}... minY=${tapMinY}`
  );

  // ── Test 4: JUMP_HOLD ───────────────────────────────────────────────────────
  tests.jumpHold = runTest("JUMP_HOLD (A for 20 frames, record 60)", (nes, record, n) => {
    nes.buttonDown(1, Controller.BUTTON_A);
    step(nes, 20);
    nes.buttonUp(1, Controller.BUTTON_A);
    for (let f = 0; f < n; f++) {
      nes.frame();
      record();
    }
  }, 60);

  const holdMinY = Math.min(...tests.jumpHold.ys);
  console.log(
    `    Y: ${tests.jumpHold.ys.slice(0, 8).join(",")}... minY=${holdMinY}`
  );

  // ── Test 5: RUNNING_JUMP ────────────────────────────────────────────────────
  tests.runningJump = runTest("RUNNING_JUMP (Right+A 20f, then Right 40f)", (nes, record, n) => {
    nes.buttonDown(1, Controller.BUTTON_RIGHT);
    nes.buttonDown(1, Controller.BUTTON_A);
    step(nes, 20);
    nes.buttonUp(1, Controller.BUTTON_A);
    for (let f = 0; f < n; f++) {
      nes.frame();
      record();
    }
    nes.buttonUp(1, Controller.BUTTON_RIGHT);
  }, 60);

  console.log(
    `    X: ${tests.runningJump.xs.slice(0, 6).join(",")}... Y: ${tests.runningJump.ys.slice(0, 6).join(",")}`
  );

  // ── Test 6: FRICTION ────────────────────────────────────────────────────────
  tests.friction = runTest("FRICTION (Right 30f, then release 60f)", (nes, record, n) => {
    nes.buttonDown(1, Controller.BUTTON_RIGHT);
    step(nes, 30);
    nes.buttonUp(1, Controller.BUTTON_RIGHT);
    for (let f = 0; f < n; f++) {
      nes.frame();
      record();
    }
  }, 60);

  console.log(
    `    X after release: ${tests.friction.xs.slice(0, 10).join(",")}`
  );

  // ── Test 7: GRAVITY (freefall) ──────────────────────────────────────────────
  tests.gravity = runTest("GRAVITY (teleport up, freefall 60f)", (nes, record, n) => {
    const currentY = ram(nes, yAddr);
    const teleportY = Math.max(20, currentY - 60); // teleport 60px up, min 20
    nes.cpu.mem[yAddr] = teleportY;
    clearInput(nes);
    for (let f = 0; f < n; f++) {
      nes.frame();
      record();
    }
  }, 60);

  console.log(
    `    Y (freefall): ${tests.gravity.ys.slice(0, 12).join(",")}`
  );

  // ── Physics derivation ────────────────────────────────────────────────────
  const physics = derivePhysics(tests, yAddr);
  console.log("\n  Derived physics:");
  console.log(`    walkSpeed:       ${physics.walkSpeed} px/frame`);
  console.log(`    gravity:         ${physics.gravity} px/frame²`);
  console.log(`    jumpVelocity:    ${physics.jumpVelocity} px/frame (initial)`);
  console.log(`    variableJump:    ${physics.variableJump}`);
  console.log(`    jumpTapPeakH:    ${physics.jumpTapPeakHeight} px`);
  console.log(`    jumpHoldPeakH:   ${physics.jumpHoldPeakHeight} px`);
  console.log(`    frictionFrames:  ${physics.frictionFrames} frames to stop`);

  // Validation against known SMB values (within 30% tolerance)
  if (physics.walkSpeed !== null) {
    const smbWalk = 1.5;
    const walkOk = Math.abs(physics.walkSpeed - smbWalk) / smbWalk < 0.5;
    console.log(
      `    walkSpeed vs SMB known (${smbWalk}): ${walkOk ? "✓ within 50%" : "✗ outside range"}`
    );
  }

  return { tests, physics };
}

/** Derive physics constants from position arrays. */
function derivePhysics(tests, yAddr) {
  // Walk speed: steady-state delta-X from WALK_RIGHT last 20 frames
  const walkRight = tests.walkRight?.xs || [];
  let walkSpeed = null;
  if (walkRight.length >= 20) {
    const deltas = [];
    for (let i = walkRight.length - 20; i < walkRight.length - 1; i++) {
      const d = walkRight[i + 1] - walkRight[i];
      if (Math.abs(d) < 20) deltas.push(d); // filter wrap-around
    }
    if (deltas.length > 0) {
      walkSpeed =
        Math.round(
          (deltas.reduce((a, b) => a + b, 0) / deltas.length) * 100
        ) / 100;
    }
  }

  // Gravity: from freefall test, compute second differences of Y
  const gravYs = tests.gravity?.ys || [];
  let gravity = null;
  if (gravYs.length >= 10) {
    // Find a window where Y is increasing (falling phase)
    const secondDiffs = [];
    for (let i = 1; i < gravYs.length - 1; i++) {
      const d2 = gravYs[i + 1] - 2 * gravYs[i] + gravYs[i - 1];
      if (d2 > 0 && d2 < 5) secondDiffs.push(d2); // filter: positive, reasonable
    }
    if (secondDiffs.length > 0) {
      gravity =
        Math.round(
          (secondDiffs.reduce((a, b) => a + b, 0) / secondDiffs.length) * 1000
        ) / 1000;
    }
  }

  // Jump velocity: first delta-Y from JUMP_TAP (should be negative = going up)
  const tapYs = tests.jumpTap?.ys || [];
  let jumpVelocity = null;
  if (tapYs.length >= 2) {
    for (let i = 0; i < Math.min(5, tapYs.length - 1); i++) {
      const d = tapYs[i + 1] - tapYs[i];
      if (d < -2) {
        jumpVelocity = d;
        break;
      }
    }
  }

  // Variable jump: compare JUMP_TAP peak vs JUMP_HOLD peak
  // Lower Y value = higher on screen
  const tapMinY = tapYs.length ? Math.min(...tapYs) : null;
  const holdMinY =
    (tests.jumpHold?.ys || []).length ? Math.min(...tests.jumpHold.ys) : null;

  const variableJump =
    tapMinY !== null &&
    holdMinY !== null &&
    Math.abs(tapMinY - holdMinY) > 5; // >5px difference = variable jump exists

  // Friction: count frames for X to stop after releasing Right
  const frictionXs = tests.friction?.xs || [];
  let frictionFrames = null;
  if (frictionXs.length >= 2) {
    for (let i = 1; i < frictionXs.length; i++) {
      if (frictionXs[i] === frictionXs[i - 1]) {
        frictionFrames = i;
        break;
      }
    }
    if (frictionFrames === null) frictionFrames = frictionXs.length; // didn't stop
  }

  return {
    walkSpeed,
    gravity,
    jumpVelocity,
    variableJump,
    jumpTapPeakHeight:
      tapMinY !== null && tests.jumpTap?.ys[0]
        ? tests.jumpTap.ys[0] - tapMinY
        : null,
    jumpHoldPeakHeight:
      holdMinY !== null && tests.jumpHold?.ys[0]
        ? tests.jumpHold.ys[0] - holdMinY
        : null,
    frictionFrames,
  };
}

// ── Phase 4: Deep State Capture ───────────────────────────────────────────────

function phase4(nes, baseline, xAddr, yAddr, contentVars) {
  console.log("\n╔══════════════════════════════╗");
  console.log("║  PHASE 4: Deep Capture        ║");
  console.log("╚══════════════════════════════╝");

  if (contentVars.length === 0) {
    console.log(`  No content variables — capturing single baseline state`);
    // Capture BASELINE state only
    nes.fromJSON(baseline);
    const state = captureState(nes, xAddr, yAddr, []);
    return { states: [state] };
  }

  const states = [];
  const seenHashes = new Set();

  // Single-variable sweep
  console.log(`  Single-variable sweeps...`);
  for (const cv of contentVars) {
    for (const val of cv.uniqueValues) {
      nes.fromJSON(baseline);
      nes.cpu.mem[cv.addr] = val;
      step(nes, 120); // let level fully load

      const h = hashScreen(nes);
      if (seenHashes.has(h)) continue; // duplicate state
      seenHashes.add(h);

      const varValues = [{ addr: cv.addr, value: val }];
      const state = captureState(nes, xAddr, yAddr, varValues);
      states.push(state);

      process.stdout.write(
        `  State ${states.length}: $${cv.addr.toString(16).padStart(4,"0")}=${val}\r`
      );
    }
  }

  // Pairwise sweep (if 2+ content variables)
  if (contentVars.length >= 2) {
    console.log(`\n  Pairwise sweep (${contentVars.length} vars)...`);
    for (let i = 0; i < contentVars.length; i++) {
      for (let j = i + 1; j < contentVars.length; j++) {
        const cvA = contentVars[i];
        const cvB = contentVars[j];
        // Limit: top 8 unique values per variable to keep it tractable
        const valsA = cvA.uniqueValues.slice(0, 8);
        const valsB = cvB.uniqueValues.slice(0, 8);

        for (const valA of valsA) {
          for (const valB of valsB) {
            nes.fromJSON(baseline);
            nes.cpu.mem[cvA.addr] = valA;
            nes.cpu.mem[cvB.addr] = valB;
            step(nes, 120);

            const h = hashScreen(nes);
            if (seenHashes.has(h)) continue;
            seenHashes.add(h);

            const varValues = [
              { addr: cvA.addr, value: valA },
              { addr: cvB.addr, value: valB },
            ];
            const state = captureState(nes, xAddr, yAddr, varValues);
            states.push(state);
          }
        }
      }
    }
  }

  console.log(`\n  Total unique states captured: ${states.length}`);
  return { states };
}

/** Capture complete state: RAM, VRAM, OAM, palette, PPU flags, scroll recording. */
function captureState(nes, xAddr, yAddr, varValues) {
  const v = nes.ppu.vramMem;
  const oam = nes.ppu.spriteMem;

  // PPU flags
  const ppuFlags = {
    bgPatternTable: nes.ppu.f_bgPatternTable,
    spPatternTable: nes.ppu.f_spPatternTable,
    nmiOnVblank: nes.ppu.f_nmiOnVblank,
    spriteSize: nes.ppu.f_spriteSize,
    bgVisible: nes.ppu.f_bgVisibility,
    spVisible: nes.ppu.f_spVisibility,
  };

  // 300-frame scroll recording with Right held
  // Sample player position + OAM every 30 frames (10 snapshots)
  const scrollFrames = [];
  nes.buttonDown(1, Controller.BUTTON_RIGHT);
  for (let chunk = 0; chunk < 10; chunk++) {
    try {
      step(nes, 30);
    } catch (_e) {
      break; // state corrupted by content variable write; stop recording
    }
    scrollFrames.push({
      frame: (chunk + 1) * 30,
      playerX: xAddr >= 0 ? ram(nes, xAddr) : null,
      playerY: yAddr >= 0 ? ram(nes, yAddr) : null,
      oam: toHex(snapshotOAM(nes)),
    });
  }
  nes.buttonUp(1, Controller.BUTTON_RIGHT);

  return {
    contentVarValues: varValues,
    hash: hashScreen(nes),
    ram: toHex(nes.cpu.mem.slice(0, 0x800)),
    nametable: toHex(v.slice(0x2000, 0x3000)),   // 4KB, all 4 nametables
    patternTable: toHex(v.slice(0x0000, 0x2000)), // 8KB, both pattern tables
    oam: toHex(oam.slice(0, 256)),
    palette: toHex(v.slice(0x3f00, 0x3f20)),      // 32 bytes
    ppuFlags,
    scrollFrames,
  };
}

// ── Output ────────────────────────────────────────────────────────────────────

function writeOutput(romPath, p1, p2, p3, p5, p4) {
  fs.mkdirSync(OUTPUT_DIR, { recursive: true });
  fs.mkdirSync(path.join(OUTPUT_DIR, "states"), { recursive: true });

  // extraction.json — metadata + physics
  const extraction = {
    rom: path.basename(romPath),
    slug: romSlug,
    extractedAt: new Date().toISOString(),
    emulator: "jsnes",
    phase1: {
      gameplayDetected: p1.totalFrames > 0,
      playerOAMSlot: p1.playerOAMSlot,
      xAddr: p1.xAddr >= 0 ? `0x${p1.xAddr.toString(16).padStart(4, "0")}` : null,
      yAddr: p1.yAddr >= 0 ? `0x${p1.yAddr.toString(16).padStart(4, "0")}` : null,
    },
    phase2: {
      candidateCount: p2?.candidates?.length || 0,
    },
    phase3: {
      contentVars: (p3?.contentVars || []).map((cv) => ({
        addr: `0x${cv.addr.toString(16).padStart(4, "0")}`,
        uniqueStateCount: cv.fineSweepUniqueCount,
        uniqueValues: cv.uniqueValues,
      })),
    },
    phase5: {
      physics: p5?.physics || null,
    },
    phase4: {
      uniqueStatesCaptured: p4?.states?.length || 0,
    },
  };

  fs.writeFileSync(
    path.join(OUTPUT_DIR, "extraction.json"),
    JSON.stringify(extraction, null, 2)
  );

  // Write individual state files
  if (p4?.states) {
    for (let i = 0; i < p4.states.length; i++) {
      const state = p4.states[i];
      const label =
        state.contentVarValues.length > 0
          ? state.contentVarValues
              .map((v) => `${v.addr.toString(16)}-${v.value}`)
              .join("_")
          : "baseline";
      fs.writeFileSync(
        path.join(OUTPUT_DIR, "states", `state-${label}.json`),
        JSON.stringify(state, null, 2)
      );
    }
  }

  // Write physics test arrays separately (large data)
  if (p5?.tests) {
    fs.writeFileSync(
      path.join(OUTPUT_DIR, "physics-raw.json"),
      JSON.stringify(p5.tests, null, 2)
    );
  }

  console.log(`\n  Output written to: ${OUTPUT_DIR}`);
  console.log(`    extraction.json`);
  console.log(`    physics-raw.json`);
  console.log(`    states/ (${p4?.states?.length || 0} files)`);
}

// ── Main ──────────────────────────────────────────────────────────────────────

function main() {
  console.log(`\n${"═".repeat(50)}`);
  console.log(`  jsnes-extractor`);
  console.log(`  ROM: ${ROM_PATH}`);
  console.log(`  Out: ${OUTPUT_DIR}`);
  console.log(`${"═".repeat(50)}`);

  const romData = fs.readFileSync(ROM_PATH, { encoding: "binary" });
  console.log(`  ROM: ${romData.length} bytes loaded`);

  const nes = makeNES();
  nes.loadROM(romData);

  // ── Phase 1: Boot + player discovery ──────────────────────────────────────
  const p1 = phase1(nes);

  console.log("\n>>> PHASE 1 COMPLETE — results above. Proceeding to Phase 2...");

  // ── Phase 2: Candidate identification ──────────────────────────────────────
  const p2 = phase2(nes, p1.baseline);

  console.log("\n>>> PHASE 2 COMPLETE — results above. Proceeding to Phase 3...");

  // ── Phase 3: Mutation sweep ─────────────────────────────────────────────────
  const p3 = phase3(nes, p1.baseline, p2.candidates);

  console.log("\n>>> PHASE 3 COMPLETE — results above. Proceeding to Phase 5...");

  // ── Phase 5: Physics (before Phase 4 — validates input works) ──────────────
  const p5 = phase5(nes, p1.baseline, p1.xAddr, p1.yAddr);

  console.log("\n>>> PHASE 5 COMPLETE — results above. Proceeding to Phase 4...");

  // ── Phase 4: Deep state capture ─────────────────────────────────────────────
  const p4 = phase4(nes, p1.baseline, p1.xAddr, p1.yAddr, p3.contentVars);

  // ── Write output ─────────────────────────────────────────────────────────
  console.log("\n>>> ALL PHASES COMPLETE — writing output...");
  writeOutput(ROM_PATH, p1, p2, p3, p5, p4);

  // ── Final summary ──────────────────────────────────────────────────────────
  console.log("\n" + "═".repeat(50));
  console.log("  EXTRACTION SUMMARY");
  console.log("═".repeat(50));
  console.log(
    `  Player X: ${p1.xAddr >= 0 ? `$${p1.xAddr.toString(16).padStart(4, "0")}` : "NOT FOUND"}`
  );
  console.log(
    `  Player Y: ${p1.yAddr >= 0 ? `$${p1.yAddr.toString(16).padStart(4, "0")}` : "NOT FOUND"}`
  );
  console.log(`  Candidates: ${p2.candidates.length}`);
  console.log(`  Content vars: ${p3.contentVars.length}`);
  if (p5.physics) {
    console.log(`  Walk speed: ${p5.physics.walkSpeed} px/frame`);
    console.log(`  Gravity: ${p5.physics.gravity} px/frame²`);
    console.log(`  Jump velocity: ${p5.physics.jumpVelocity} px/frame`);
    console.log(`  Variable jump: ${p5.physics.variableJump}`);
  }
  console.log(`  Unique states captured: ${p4.states.length}`);
  console.log("═".repeat(50));
}

main();
