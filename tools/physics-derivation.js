#!/usr/bin/env node
// physics-derivation.js
// Session UE-1: Derive physics constants from extraction.json position data.
//
// Usage:
//   node tools/physics-derivation.js <extraction.json path>
//   node tools/physics-derivation.js ~/nes-extracted/super-mario-bros/extraction.json
//
// Reads DATA_PHYSICS position arrays, derives physics constants, writes physics.json.

import { readFileSync, writeFileSync } from 'fs';
import { join, dirname }               from 'path';
import os                              from 'os';

const HOME = os.homedir();

// ---------------------------------------------------------------------------
// Load extraction.json
// ---------------------------------------------------------------------------

const extractionPath = process.argv[2]
  ? process.argv[2].replace(/^~/, HOME)
  : null;

if (!extractionPath) {
  console.error('Usage: node tools/physics-derivation.js <extraction.json>');
  process.exit(1);
}

const extraction = JSON.parse(readFileSync(extractionPath, 'utf8'));
const outDir     = dirname(extractionPath);
const slug       = extraction.gameSlug;

// ---------------------------------------------------------------------------
// Extract position arrays from physics tests
// ---------------------------------------------------------------------------

const tests = {};
for (const t of (extraction.phase5?.physicsTests ?? [])) {
  tests[t.test] = t.positions; // [[x,y], [x,y], ...]
}

console.log(`\n=== Physics Derivation: ${slug} ===`);
console.log(`Tests available: ${Object.keys(tests).join(', ') || 'none'}`);

if (Object.keys(tests).length === 0) {
  console.warn('No physics test data found. Exiting.');
  process.exit(0);
}

// ---------------------------------------------------------------------------
// Derivation utilities
// ---------------------------------------------------------------------------

// Extract the Y positions from a position array (second element of each pair).
function ys(positions) { return positions.map(([, y]) => y); }
function xs(positions) { return positions.map(([x]) => x); }

// Compute consecutive deltas.
function deltas(arr) {
  const d = [];
  for (let i = 1; i < arr.length; i++) d.push(arr[i] - arr[i - 1]);
  return d;
}

// Find the most common value in an array (mode).
function mode(arr) {
  if (arr.length === 0) return null;
  const counts = new Map();
  for (const v of arr) counts.set(v, (counts.get(v) ?? 0) + 1);
  let best = null, bestCount = 0;
  for (const [v, c] of counts) {
    if (c > bestCount) { best = v; bestCount = c; }
  }
  return best;
}

// Find steady-state value: look at the last quarter of deltas where they've stabilized.
function steadyState(deltaArr) {
  if (deltaArr.length === 0) return null;
  const tail = deltaArr.slice(Math.floor(deltaArr.length * 0.5));
  return mode(tail);
}

// NES screens wrap at 256 pixels. Detect if a delta is actually a wrap.
function unwrapDelta(d) {
  if (d > 128)  return d - 256;
  if (d < -128) return d + 256;
  return d;
}

// ---------------------------------------------------------------------------
// MAX WALK SPEED (from WALK_RIGHT test)
// ---------------------------------------------------------------------------

let maxWalkSpeed    = null;
let walkAccelFrames = null;

if (tests.WALK_RIGHT) {
  const xArr    = xs(tests.WALK_RIGHT);
  const xDeltas = deltas(xArr).map(unwrapDelta);
  // Find steady-state X velocity (pixels/frame)
  const ss = steadyState(xDeltas);
  if (ss !== null && ss > 0) {
    maxWalkSpeed = ss;
    // Find when steady state was first reached (acceleration complete)
    const firstSS = xDeltas.findIndex(d => Math.abs(d - ss) < 0.5);
    walkAccelFrames = firstSS >= 0 ? firstSS : null;
  }
  console.log(`\nWALK_RIGHT: X deltas (first 20): ${xDeltas.slice(0, 20).join(', ')}`);
  console.log(`  → max walk speed: ${maxWalkSpeed} px/frame (steady state at frame ${walkAccelFrames})`);
}

// ---------------------------------------------------------------------------
// FRICTION / DECELERATION (from FRICTION test)
// ---------------------------------------------------------------------------

let groundFriction = null;

if (tests.FRICTION) {
  const xArr    = xs(tests.FRICTION);
  const xDeltas = deltas(xArr).map(unwrapDelta);
  // First 60 frames: held right. Frames 61+: released.
  const releaseDeltas = xDeltas.slice(60);
  // Find deceleration: velocity should decrease toward 0.
  // If v[n+1] = v[n] * f, then f = v[n+1] / v[n] for several consecutive frames.
  const frictionEstimates = [];
  for (let i = 0; i < releaseDeltas.length - 1; i++) {
    const v0 = releaseDeltas[i];
    const v1 = releaseDeltas[i + 1];
    if (Math.abs(v0) > 0 && Math.abs(v1) <= Math.abs(v0) && Math.sign(v0) === Math.sign(v1)) {
      frictionEstimates.push(v1 / v0);
    }
  }
  if (frictionEstimates.length > 0) {
    const avgFriction = frictionEstimates.reduce((a, b) => a + b, 0) / frictionEstimates.length;
    groundFriction = Math.round(avgFriction * 1000) / 1000;
  }
  console.log(`\nFRICTION: Post-release X deltas (first 20): ${releaseDeltas.slice(0, 20).join(', ')}`);
  console.log(`  → ground friction factor: ${groundFriction}`);
}

// ---------------------------------------------------------------------------
// JUMP VELOCITY + GRAVITY (from JUMP_TAP test)
// ---------------------------------------------------------------------------

let jumpVelocityInitial = null;
let gravity             = null;
let jumpTapPeakHeight   = null;

if (tests.JUMP_TAP) {
  const yArr    = ys(tests.JUMP_TAP);
  const yDeltas = deltas(yArr);

  // Find jump start: first frame where Y delta is negative (moving up)
  const jumpStart = yDeltas.findIndex(d => d < 0);
  if (jumpStart >= 0) {
    jumpVelocityInitial = yDeltas[jumpStart]; // negative = upward

    // Find peak: first frame where Y stops decreasing (delta changes sign)
    let peak = jumpStart;
    while (peak < yDeltas.length && yDeltas[peak] < 0) peak++;
    jumpTapPeakHeight = peak - jumpStart; // frames in air (ascending)

    // Gravity: during descent, Y delta increases by a constant each frame.
    // Collect descent deltas and look for linear increase (constant acceleration).
    const descentDeltas = yDeltas.slice(peak);
    const gravEstimates = [];
    for (let i = 0; i < descentDeltas.length - 1; i++) {
      const accel = descentDeltas[i + 1] - descentDeltas[i];
      if (accel > 0) gravEstimates.push(accel);
    }
    if (gravEstimates.length > 0) {
      // Mode of gravity estimates (most common pixel-per-frame² value)
      const gravMode = mode(gravEstimates);
      gravity = gravMode;
    }

    console.log(`\nJUMP_TAP: Y deltas (first 30): ${yDeltas.slice(0, 30).join(', ')}`);
    console.log(`  → jump start at frame ${jumpStart}, initial velocity: ${jumpVelocityInitial} px/frame`);
    console.log(`  → ascent frames: ${jumpTapPeakHeight}`);
    console.log(`  → gravity: ${gravity} px/frame²`);
  }
}

// ---------------------------------------------------------------------------
// VARIABLE JUMP (compare JUMP_TAP peak vs JUMP_HOLD peak)
// ---------------------------------------------------------------------------

let variableJump       = false;
let jumpHoldPeakHeight = null;
let jumpHoldMaxVelocity = null;

if (tests.JUMP_HOLD) {
  const yArr    = ys(tests.JUMP_HOLD);
  const yDeltas = deltas(yArr);

  const jumpStart = yDeltas.findIndex(d => d < 0);
  if (jumpStart >= 0) {
    jumpHoldMaxVelocity = Math.min(...yDeltas.slice(jumpStart));
    let peak = jumpStart;
    while (peak < yDeltas.length && yDeltas[peak] < 0) peak++;
    jumpHoldPeakHeight = peak - jumpStart;

    if (jumpTapPeakHeight !== null && jumpHoldPeakHeight !== jumpTapPeakHeight) {
      variableJump = true;
    }

    console.log(`\nJUMP_HOLD: initial vel: ${yDeltas[jumpStart]} px/frame, ascent frames: ${jumpHoldPeakHeight}`);
    console.log(`  → variable jump: ${variableJump} (tap=${jumpTapPeakHeight} vs hold=${jumpHoldPeakHeight} ascent frames)`);
  }
}

// ---------------------------------------------------------------------------
// RUNNING JUMP (from RUNNING_JUMP test)
// ---------------------------------------------------------------------------

let maxRunSpeed   = null;
let runJumpVel    = null;

if (tests.RUNNING_JUMP) {
  const xArr    = xs(tests.RUNNING_JUMP);
  const xDeltas = deltas(xArr).map(unwrapDelta);

  // Max horizontal speed during running jump (should be higher than walk)
  const runDeltas = xDeltas.filter(d => d > 0);
  if (runDeltas.length > 0) {
    maxRunSpeed = Math.max(...runDeltas);
  }

  const yArr    = ys(tests.RUNNING_JUMP);
  const yDeltas = deltas(yArr);
  const jumpStart = yDeltas.findIndex(d => d < 0);
  if (jumpStart >= 0) {
    runJumpVel = yDeltas[jumpStart];
  }

  console.log(`\nRUNNING_JUMP: max X speed: ${maxRunSpeed}, jump Y vel: ${runJumpVel}`);
}

// ---------------------------------------------------------------------------
// Build physics manifest object
// ---------------------------------------------------------------------------

const physics = {
  gravity:                    gravity,
  gravity_unit:               'pixels_per_frame_squared',
  max_walk_speed:             maxWalkSpeed,
  max_walk_speed_unit:        'pixels_per_frame',
  max_run_speed:              maxRunSpeed !== maxWalkSpeed ? maxRunSpeed : null,
  jump_velocity_initial:      jumpVelocityInitial,
  jump_velocity_unit:         'pixels_per_frame_negative_is_up',
  jump_velocity_variable:     variableJump,
  variable_jump_tap_frames:   jumpTapPeakHeight,
  variable_jump_hold_frames:  jumpHoldPeakHeight,
  ground_friction:            groundFriction,
  walk_accel_frames:          walkAccelFrames,
  coyote_frames:              null,  // not derivable without a ledge — manual verification needed
  special_abilities:          [],    // TODO: derive from DUCK and other tests
  derivation_notes: {
    walk_speed_method:   'steady_state_delta_from_WALK_RIGHT',
    gravity_method:      'linear_accel_from_JUMP_TAP_descent',
    jump_vel_method:     'first_negative_delta_from_JUMP_TAP',
    friction_method:     'velocity_ratio_after_FRICTION_release',
    variable_jump_method:'ascent_frame_comparison_TAP_vs_HOLD',
    coyote_note:         'requires_ledge_in_physics_level_manual_verification',
  },
};

// ---------------------------------------------------------------------------
// Comparison against SMB known values (only if this is SMB)
// ---------------------------------------------------------------------------

if (slug.includes('super-mario-bros') && !slug.includes('3') && !slug.includes('2')) {
  console.log('\n--- SMB Known Values Comparison ---');
  // SMB uses 16 sub-pixels per pixel, so:
  // Gravity: 7 sub-px/frame² ÷ 16 = 0.4375 px/frame²
  // Walk speed: ~24 sub-px/frame ÷ 16 = 1.5 px/frame
  // Jump velocity: ~-64 sub-px/frame ÷ 16 = -4.0 px/frame
  const known = { gravity: 0.4375, maxWalkSpeed: 1.5, jumpVelocity: -4.0 };
  const pct = (got, exp) => exp ? `${((got / exp - 1) * 100).toFixed(1)}%` : 'N/A';
  console.log(`  gravity:     got ${gravity}   expected ${known.gravity}  diff ${pct(gravity, known.gravity)}`);
  console.log(`  walk speed:  got ${maxWalkSpeed}  expected ${known.maxWalkSpeed}  diff ${pct(maxWalkSpeed, known.maxWalkSpeed)}`);
  console.log(`  jump vel:    got ${jumpVelocityInitial}  expected ${known.jumpVelocity}  diff ${pct(Math.abs(jumpVelocityInitial), Math.abs(known.jumpVelocity))}`);
  console.log('  (within 20% tolerance is acceptable for initial derivation)');
}

// ---------------------------------------------------------------------------
// Save
// ---------------------------------------------------------------------------

const physicsPath = join(outDir, 'physics.json');
writeFileSync(physicsPath, JSON.stringify(physics, null, 2));
console.log(`\nSaved: ${physicsPath}`);
console.log(JSON.stringify(physics, null, 2));
