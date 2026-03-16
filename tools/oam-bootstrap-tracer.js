/**
 * oam-bootstrap-tracer.js
 *
 * Traces every CPU write to the OAM staging page ($0200–$02FF) and the
 * OAM DMA trigger ($4014) for 2 frames of SMB gameplay.
 *
 * Output: experiment-output/oam-trace-smb.json
 */

import { NES, Controller } from "jsnes";
import fs from "fs";
import path from "path";
import { homedir } from "os";

// ── Find SMB ROM ──────────────────────────────────────────────────────────────

const romsDir = path.join(homedir(), "nes-roms");
const romFile = fs.readdirSync(romsDir).find(
  (f) =>
    f.includes("Super Mario Bros") &&
    !f.includes("2") &&
    !f.includes("3") &&
    !f.includes("Lost") &&
    !f.includes("+") &&
    f.endsWith(".nes")
);
if (!romFile) {
  console.error("ERROR: SMB ROM not found in ~/nes-roms/");
  process.exit(1);
}
console.log(`ROM: ${romFile}`);
const romData = fs.readFileSync(path.join(romsDir, romFile));

// ── Output path ───────────────────────────────────────────────────────────────

const OUTPUT_PATH = path.join(
  process.cwd(),
  "experiment-output",
  "oam-trace-smb.json"
);

// ── NES instance ──────────────────────────────────────────────────────────────

const nes = new NES({
  onFrame: () => {},
  onAudioSample: null,
  onStatusUpdate: () => {},
  emulateSound: false,
});

nes.loadROM(romData.toString("binary"));

// ── Tracer state ──────────────────────────────────────────────────────────────

let frameNumber = 0;
let oamStagingPage = null;          // set when we first see a $4014 write
let captureActive = false;
let captureFramesRemaining = 0;

// Mutable per-frame buckets (reset before each nes.frame() during capture)
let currentFrameWrites = [];
let currentFrameDMA = null;
const capturedFrames = [];

// ── Patch cpu.write ───────────────────────────────────────────────────────────
// cpu.write(addr, val) is called for EVERY CPU bus write cycle.
// We wrap it to observe writes to $0200–$02FF and $4014 before they happen.

const origWrite = nes.cpu.write.bind(nes.cpu);

nes.cpu.write = function (addr, val) {
  // $4014 → OAM DMA trigger
  if (addr === 0x4014) {
    oamStagingPage = val; // high byte of source page (0x02 → page $0200)
    if (captureActive && currentFrameDMA === null) {
      currentFrameDMA = {
        pc: hex16(nes.cpu.REG_PC),
        source_page: hex8(val),
      };
    }
  }

  // $0200–$02FF → OAM staging page writes
  if (captureActive && addr >= 0x0200 && addr <= 0x02ff) {
    currentFrameWrites.push({
      addr: hex16(addr),
      value: hex8(val),
      pc: hex16(nes.cpu.REG_PC),
      x_reg: hex8(nes.cpu.REG_X),
      y_reg: hex8(nes.cpu.REG_Y),
    });
  }

  origWrite(addr, val);
};

// ── Helpers ───────────────────────────────────────────────────────────────────

function hex8(v) {
  return "0x" + (v & 0xff).toString(16).toUpperCase().padStart(2, "0");
}
function hex16(v) {
  return "0x" + (v & 0xffff).toString(16).toUpperCase().padStart(4, "0");
}

function step(n = 1) {
  for (let i = 0; i < n; i++) {
    if (captureActive) {
      currentFrameWrites = [];
      currentFrameDMA = null;
    }
    nes.frame();
    frameNumber++;
    if (captureActive) {
      capturedFrames.push({
        frame_number: frameNumber,
        dma_trigger: currentFrameDMA,
        oam_writes: currentFrameWrites.slice(),
      });
      captureFramesRemaining--;
      if (captureFramesRemaining <= 0) {
        captureActive = false;
      }
    }
  }
}

function pressStart() {
  nes.buttonDown(1, Controller.BUTTON_START);
  step(2);
  nes.buttonUp(1, Controller.BUTTON_START);
}

function holdRight(frames) {
  nes.buttonDown(1, Controller.BUTTON_RIGHT);
  step(frames);
  nes.buttonUp(1, Controller.BUTTON_RIGHT);
}

// ── Boot sequence ─────────────────────────────────────────────────────────────

console.log("Booting SMB...");

// Run to title screen
step(120);
pressStart();   // press Start at ~frame 0 area

// Wait for title → game transition
step(120);
pressStart();   // press Start again at ~frame 120 area

// Hold Right for 300 frames to get into gameplay with enemies on screen
console.log("Holding Right for 300 frames...");
holdRight(300);

console.log(`At frame ${frameNumber}. Starting 2-frame OAM trace capture...`);

// ── Capture 2 frames ──────────────────────────────────────────────────────────

captureActive = true;
captureFramesRemaining = 2;
step(2);

// ── Output ────────────────────────────────────────────────────────────────────

const result = {
  game: "Super Mario Bros",
  oam_staging_page: oamStagingPage !== null ? hex8(oamStagingPage) : null,
  frames: capturedFrames,
};

fs.mkdirSync(path.dirname(OUTPUT_PATH), { recursive: true });
fs.writeFileSync(OUTPUT_PATH, JSON.stringify(result, null, 2));
console.log(`\nJSON written to ${OUTPUT_PATH}`);

// ── Human-readable summary ────────────────────────────────────────────────────

console.log("\n═══════════════════════════════════════════════════════════");
console.log("OAM BOOTSTRAP TRACE — SUMMARY");
console.log("═══════════════════════════════════════════════════════════");
console.log(`OAM staging page from $4014: ${result.oam_staging_page ?? "(none seen)"}`);

for (const frame of capturedFrames) {
  console.log(`\n─── Frame ${frame.frame_number} ──────────────────────────────────────`);
  console.log(`  DMA trigger: ${frame.dma_trigger ? JSON.stringify(frame.dma_trigger) : "(none this frame)"}`);
  console.log(`  OAM writes: ${frame.oam_writes.length}`);

  if (frame.oam_writes.length === 0) {
    console.log("  (no writes to $0200-$02FF this frame)");
    continue;
  }

  // Unique PCs
  const pcMap = new Map(); // pc → count
  for (const w of frame.oam_writes) {
    pcMap.set(w.pc, (pcMap.get(w.pc) ?? 0) + 1);
  }
  console.log(`  Unique PC addresses: ${pcMap.size}`);
  for (const [pc, count] of [...pcMap.entries()].sort((a, b) => b[1] - a[1])) {
    console.log(`    ${pc}  →  ${count} writes`);
  }

  // X register pattern (first 32 writes)
  const xVals = frame.oam_writes.slice(0, 32).map((w) => parseInt(w.x_reg, 16));
  const yVals = frame.oam_writes.slice(0, 32).map((w) => parseInt(w.y_reg, 16));
  console.log(`  X-reg (first 32 writes): [${xVals.join(", ")}]`);
  console.log(`  Y-reg (first 32 writes): [${yVals.join(", ")}]`);

  // Check for a simple stride pattern in Y register
  if (yVals.length >= 4) {
    // Check if Y cycles through a fixed pattern
    const strides = new Set();
    for (let i = 1; i < Math.min(yVals.length, 16); i++) {
      const diff = (yVals[i] - yVals[i - 1] + 256) % 256;
      strides.add(diff);
    }
    if (strides.size <= 2) {
      console.log(`  Y-reg stride pattern: diffs = [${[...strides].join(", ")}]`);
    }
  }

  // Show addr pattern for first 16 writes
  const addrs = frame.oam_writes.slice(0, 16).map((w) => w.addr);
  console.log(`  Addr sequence (first 16): [${addrs.join(", ")}]`);
}

console.log("\n═══════════════════════════════════════════════════════════");
