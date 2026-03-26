/**
 * Part 2: Goomba Chase AI — Runtime PRG-ROM Code Injection
 *
 * STRATEGY:
 * 1. Write a 13-byte chase routine at $93C9 (verified free space)
 * 2. Replace the Goomba's per-frame movement call at $CA98
 *    (originally JSR $BF63) with JSR $93C9
 *
 * CHASE ROUTINE (13 bytes at $93C9):
 *   $93C9: LDA $87,X     ; enemy X position           [B5 87]
 *   $93CB: CMP $86       ; compare with player X       [C5 86]
 *   $93CD: LDA #$08      ; speed = +8 (right, default) [A9 08]
 *   $93CF: BCC done      ; if enemy < player → right   [90 02]
 *   $93D1: LDA #$F8      ; speed = -8 (left)           [A9 F8]
 *   $93D3: STA $58,X     ; set horizontal speed        [95 58]
 *   $93D5: RTS           ; return                      [60]
 *
 * REDIRECT (3 bytes at $CA98):
 *   Replace: JSR $BF63  →  JSR $93C9
 *
 * WHY THIS WORKS:
 * - $CA98 is reached when enemy state has bit 6 set (normal walking)
 * - Called every frame via: NMI → GameCore → Entity loop → $C047 → $C882 → $C8E0 → $C905 → $CA77
 * - Movement application ($F152), gravity ($E87D), and edge detection ($D853)
 *   all run BEFORE $C905, so our speed override takes effect for the NEXT frame
 */

const fs = require('fs');
const { NES } = require('jsnes');
const { Controller } = require('jsnes');

const ROM_PATH = `${process.env.HOME}/nes-roms/Super Mario Bros. (World).nes`;
const romData = fs.readFileSync(ROM_PATH);

let lastFrame = null;
const nes = new NES({
  onFrame: fb => { lastFrame = fb; },
  onAudioSample: () => {}
});
nes.loadROM(romData.toString('binary'));

function step(n) { for (let i = 0; i < n; i++) nes.frame(); }
function ram(a) { return nes.cpu.mem[a]; }
function wram(a, v) { nes.cpu.mem[a] = v; }

// ============================================================
// PATCH DEFINITIONS
// ============================================================

// Chase routine: 13 bytes at $93C9 (free space)
const CHASE_ADDR = 0x93C9;
const CHASE_CODE = [
  0xB5, 0x87,       // LDA $87,X     ; enemy X
  0xC5, 0x86,       // CMP $86       ; vs player X (carry clear if enemy < player)
  0xA9, 0x08,       // LDA #$08      ; speed = +8 (moving right)
  0x90, 0x02,       // BCC +2        ; if enemy < player → skip, use right speed
  0xA9, 0xF8,       // LDA #$F8      ; speed = -8 (moving left)
  0x95, 0x58,       // STA $58,X     ; set enemy horizontal speed
  0x60,             // RTS
];

// CRITICAL FIX: Patch $CAB4 (the $1E,X=0 path), NOT $CA98
// Original $CAB4-$CAC7 (20 bytes): load speed, adjust, call $BF02, restore
// Replace with: JSR chase, JSR $BF02, RTS, NOP padding
const REDIRECT_ADDR = 0xCAB4;
const REDIRECT_ORIG = [0xB5, 0x58, 0x48]; // LDA $58,X / PHA (first 3 bytes)
const REDIRECT_NEW_FULL = [
  0x20, 0xC9, 0x93, // JSR $93C9     ; set chase speed
  0x20, 0x02, 0xBF, // JSR $BF02     ; apply movement
  0x60,             // RTS
  0xEA, 0xEA, 0xEA, // NOP padding (13 bytes to fill 20 total)
  0xEA, 0xEA, 0xEA,
  0xEA, 0xEA, 0xEA,
  0xEA, 0xEA, 0xEA,
  0xEA,
];

// ============================================================
// BOOT TO GAMEPLAY
// ============================================================
console.log('Booting SMB...');
step(60);
nes.buttonDown(1, Controller.BUTTON_START);
step(1);
nes.buttonUp(1, Controller.BUTTON_START);
step(180);

// Move right to get near Goombas
nes.buttonDown(1, Controller.BUTTON_RIGHT);
step(100);
nes.buttonUp(1, Controller.BUTTON_RIGHT);
step(10);

// Find a Goomba
let enemySlot = -1;
for (let s = 0; s < 5; s++) {
  const type = ram(0x0016 + s);
  if (type !== 0) {
    console.log(`  Slot ${s}: type=${type}, X=${ram(0x0087+s)}, active=$${ram(0x000F+s).toString(16)}`);
    if (type === 6 && enemySlot === -1) enemySlot = s;
  }
}

if (enemySlot === -1) {
  // Try further
  nes.buttonDown(1, Controller.BUTTON_RIGHT);
  step(60);
  nes.buttonUp(1, Controller.BUTTON_RIGHT);
  for (let s = 0; s < 5; s++) {
    const type = ram(0x0016 + s);
    if (type === 6) { enemySlot = s; break; }
    if (type !== 0 && enemySlot === -1) enemySlot = s; // fallback to any enemy
  }
}

if (enemySlot === -1) {
  console.log('FAIL: No enemies found');
  process.exit(1);
}

console.log(`\nUsing enemy slot ${enemySlot} (type=${ram(0x0016+enemySlot)}) at X=${ram(0x0087+enemySlot)}`);
const saveBeforePatch = nes.toJSON();

// ============================================================
// BASELINE: Normal behavior (no patch)
// ============================================================
console.log('\n=== BASELINE: Normal Goomba ===');
nes.fromJSON(saveBeforePatch);

const baseline = [];
// Move RIGHT for 100 frames
nes.buttonDown(1, Controller.BUTTON_RIGHT);
for (let f = 0; f < 100; f++) {
  nes.frame();
  baseline.push({
    playerX: ram(0x0086), enemyX: ram(0x0087 + enemySlot),
    speed: ram(0x0058 + enemySlot), phase: 'right'
  });
}
nes.buttonUp(1, Controller.BUTTON_RIGHT);

// Move LEFT for 100 frames
nes.buttonDown(1, Controller.BUTTON_LEFT);
for (let f = 0; f < 100; f++) {
  nes.frame();
  baseline.push({
    playerX: ram(0x0086), enemyX: ram(0x0087 + enemySlot),
    speed: ram(0x0058 + enemySlot), phase: 'left'
  });
}
nes.buttonUp(1, Controller.BUTTON_LEFT);

const baselineActive = baseline.filter(p => ram(0x0016 + enemySlot) !== 0 || p.speed !== 0);
console.log(`Baseline: ${baselineActive.length} active frames`);

// Count baseline direction changes
let baseChanges = 0;
for (let i = 1; i < baseline.length; i++) {
  if (baseline[i].speed !== baseline[i-1].speed && baseline[i].speed !== 0 && baseline[i-1].speed !== 0) baseChanges++;
}
console.log(`Baseline direction changes: ${baseChanges}`);

// ============================================================
// APPLY PATCHES
// ============================================================
console.log('\n=== APPLYING PATCHES ===');
nes.fromJSON(saveBeforePatch);

// Verify original bytes at $CAB4
const origRedirect = [nes.cpu.mem[REDIRECT_ADDR], nes.cpu.mem[REDIRECT_ADDR+1], nes.cpu.mem[REDIRECT_ADDR+2]];
console.log(`Original at $CAB4: ${origRedirect.map(b => b.toString(16).padStart(2,'0')).join(' ')} (expected: b5 58 48 = LDA $58,X / PHA)`);
const redirectOK = origRedirect[0] === 0xB5 && origRedirect[1] === 0x58 && origRedirect[2] === 0x48;
console.log(`Original matches: ${redirectOK}`);

// Verify free space
const origFree = [];
for (let i = 0; i < CHASE_CODE.length; i++) origFree.push(nes.cpu.mem[CHASE_ADDR + i]);
console.log(`Free space at $93C9: ${origFree.map(b => b.toString(16).padStart(2,'0')).join(' ')}`);

// Patch 1: Write chase routine to free space at $93C9
for (let i = 0; i < CHASE_CODE.length; i++) {
  nes.cpu.mem[CHASE_ADDR + i] = CHASE_CODE[i];
}
console.log('Chase routine written to $93C9');

// Patch 2: Replace $CAB4-$CAC7 with JSR chase + JSR BF02 + RTS + NOPs
for (let i = 0; i < REDIRECT_NEW_FULL.length; i++) {
  nes.cpu.mem[REDIRECT_ADDR + i] = REDIRECT_NEW_FULL[i];
}
console.log(`Replaced 20 bytes at $CAB4: JSR $93C9 / JSR $BF02 / RTS`);

// Verify patches
const verifyChase = CHASE_CODE.every((b, i) => nes.cpu.mem[CHASE_ADDR + i] === b);
const verifyRedirect = REDIRECT_NEW_FULL.every((b, i) => nes.cpu.mem[REDIRECT_ADDR + i] === b);
console.log(`Patches verified: chase=${verifyChase}, redirect=${verifyRedirect}`);

// ============================================================
// TEST: Patched behavior — teleport player to force direction changes
// ============================================================
console.log('\n=== PATCHED: Testing chase behavior ===');

const patched = [];
let crashed = false;

try {
  const enemyX = ram(0x0087 + enemySlot);
  console.log(`Enemy starting X: ${enemyX}`);

  // Phase 1: Player to the RIGHT of enemy (enemy should chase right)
  wram(0x0086, enemyX + 60); // Player far to the right
  for (let f = 0; f < 80; f++) {
    nes.frame();
    patched.push({
      frame: f, playerX: ram(0x0086), enemyX: ram(0x0087 + enemySlot),
      speed: ram(0x0058 + enemySlot), type: ram(0x0016 + enemySlot), phase: 'player_right'
    });
    wram(0x0086, ram(0x0087 + enemySlot) + 60); // Keep player to the right
  }

  // Phase 2: Player to the LEFT of enemy (enemy should chase left)
  wram(0x0086, ram(0x0087 + enemySlot) - 60); // Player far to the left
  for (let f = 0; f < 80; f++) {
    nes.frame();
    patched.push({
      frame: f + 80, playerX: ram(0x0086), enemyX: ram(0x0087 + enemySlot),
      speed: ram(0x0058 + enemySlot), type: ram(0x0016 + enemySlot), phase: 'player_left'
    });
    wram(0x0086, ram(0x0087 + enemySlot) - 60); // Keep player to the left
  }

  // Phase 3: Player RIGHT again (enemy should reverse to chase right)
  wram(0x0086, ram(0x0087 + enemySlot) + 60);
  for (let f = 0; f < 80; f++) {
    nes.frame();
    patched.push({
      frame: f + 160, playerX: ram(0x0086), enemyX: ram(0x0087 + enemySlot),
      speed: ram(0x0058 + enemySlot), type: ram(0x0016 + enemySlot), phase: 'player_right_2'
    });
    wram(0x0086, ram(0x0087 + enemySlot) + 60);
  }
} catch (e) {
  crashed = true;
  console.log('CRASH:', e.message);
}

// ============================================================
// ANALYZE RESULTS
// ============================================================
console.log('\n=== ANALYSIS ===');

if (crashed) {
  console.log('✗ Game crashed!');
  process.exit(1);
}
console.log('Game did NOT crash ✓');

const active = patched.filter(p => p.type !== 0);
console.log(`Enemy active: ${active.length}/${patched.length} frames`);

// Direction changes
const dirChanges = [];
for (let i = 1; i < patched.length; i++) {
  const prev = patched[i-1].speed;
  const curr = patched[i].speed;
  if (prev !== curr && curr !== 0 && prev !== 0) {
    const prevSigned = prev > 127 ? prev - 256 : prev;
    const currSigned = curr > 127 ? curr - 256 : curr;
    if ((prevSigned > 0) !== (currSigned > 0)) {
      dirChanges.push({
        frame: patched[i].frame,
        phase: patched[i].phase,
        from: prevSigned, to: currSigned,
        playerX: patched[i].playerX,
        enemyX: patched[i].enemyX
      });
    }
  }
}
console.log(`Direction changes: ${dirChanges.length}`);
dirChanges.forEach(c => {
  console.log(`  Frame ${c.frame} (${c.phase}): speed ${c.from}→${c.to}, player@${c.playerX} enemy@${c.enemyX}`);
});

// Chase accuracy: when enemy is active, is it moving toward the player?
let correct = 0, total = 0;
for (const p of active) {
  if (p.speed === 0) continue;
  total++;
  const speed = p.speed > 127 ? p.speed - 256 : p.speed;
  const shouldGoRight = p.playerX > p.enemyX;
  const isGoingRight = speed > 0;
  if (shouldGoRight === isGoingRight) correct++;
}
const accuracy = total > 0 ? (correct / total * 100).toFixed(1) : 0;
console.log(`Chase accuracy: ${correct}/${total} = ${accuracy}%`);

// Did the enemy change direction when the player changed direction?
// Player switches from right→left around frame 150
const rightPhase = active.filter(p => p.frame >= 30 && p.frame <= 140);
const leftPhase = active.filter(p => p.frame >= 160 && p.frame <= 290);
const rightSpeeds = rightPhase.map(p => p.speed > 127 ? p.speed - 256 : p.speed);
const leftSpeeds = leftPhase.map(p => p.speed > 127 ? p.speed - 256 : p.speed);

const avgRightSpeed = rightSpeeds.length > 0 ? rightSpeeds.reduce((a,b) => a+b, 0) / rightSpeeds.length : 0;
const avgLeftSpeed = leftSpeeds.length > 0 ? leftSpeeds.reduce((a,b) => a+b, 0) / leftSpeeds.length : 0;

console.log(`\nAvg speed during RIGHT phase: ${avgRightSpeed.toFixed(2)} (positive = chasing right)`);
console.log(`Avg speed during LEFT phase: ${avgLeftSpeed.toFixed(2)} (negative = chasing left)`);

// ============================================================
// VERDICT
// ============================================================
const pass1 = !crashed;
const pass2 = active.length >= 30;
const pass3 = parseFloat(accuracy) > 70;
const pass4 = dirChanges.length > 0;

console.log('\n========================================');
console.log('PATCH TEST RESULTS');
console.log('========================================');
console.log(`  1. No crash:              ${pass1 ? '✓ PASS' : '✗ FAIL'}`);
console.log(`  2. Enemy active (30+):    ${pass2 ? '✓ PASS' : '✗ FAIL'} (${active.length} frames)`);
console.log(`  3. Chase accuracy > 70%:  ${pass3 ? '✓ PASS' : '✗ FAIL'} (${accuracy}%)`);
console.log(`  4. Direction responsive:  ${pass4 ? '✓ PASS' : '✗ FAIL'} (${dirChanges.length} changes)`);
const allPass = pass1 && pass2 && pass3 && pass4;
console.log(`\n  OVERALL: ${allPass ? '✓ ALL PASS' : '✗ FAIL'}`);
console.log('========================================');

// Position trace
console.log('\nPosition trace (every 20 frames):');
for (let i = 0; i < patched.length; i += 20) {
  const p = patched[i];
  const speed = p.speed > 127 ? p.speed - 256 : p.speed;
  const dir = speed > 0 ? '→' : speed < 0 ? '←' : '·';
  console.log(`  F${p.frame.toString().padStart(3)}: player@${p.playerX.toString().padStart(3)} enemy@${p.enemyX.toString().padStart(3)} speed=${speed.toString().padStart(3)} ${dir} [${p.phase}]`);
}
