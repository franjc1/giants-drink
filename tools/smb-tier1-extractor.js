#!/usr/bin/env node
/**
 * smb-tier1-extractor.js — SMB Complete Sprite Sheet (Tier 1 Validation)
 *
 * Produces a definitive sprite sheet for Super Mario Bros. (NES) using
 * direct ROM data, live jsnes emulation, and the oracle-captured entity manifest.
 *
 * ARCHITECTURE NOTES:
 *  - Small Mario: all 8 OAM sprites (slots 1-8) are sprite-rendered (full body)
 *  - Big/Fire Mario: only 4 OAM sprites (slots 5-8) are real sprites; top 4 use
 *    blank tile (0xFC) letting the BG layer render the head. Both Big and Fire
 *    Mario use the same sprite tiles — Fire Mario differs only in palette color
 *    (white/red vs red/tan).
 *  - Enemy sprites: sourced from oracle-captured OAM data (entity manifest)
 *  - Section 3/4: All non-blank CHR-ROM tiles shown with 4 palette variants
 *
 * Output:
 *   experiment-output/smb-tier1-complete.png
 *   experiment-output/smb-tier1-manifest.json
 */

import { NES, Controller } from "jsnes";
import fs from "fs";
import path from "path";
import { homedir } from "os";
import sharp from "sharp";

// ── Paths ─────────────────────────────────────────────────────────────────────

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
if (!romFile) { console.error("SMB ROM not found"); process.exit(1); }

const ROM_PATH      = path.join(romsDir, romFile);
const OUT_DIR       = path.join(process.cwd(), "experiment-output");
const PNG_PATH      = path.join(OUT_DIR, "smb-tier1-complete.png");
const JSON_PATH     = path.join(OUT_DIR, "smb-tier1-manifest.json");
const MANIFEST_PATH = path.join(OUT_DIR, "smb-entity-manifest-full.json");

fs.mkdirSync(OUT_DIR, { recursive: true });
const romBuf  = fs.readFileSync(ROM_PATH);
const romStr  = romBuf.toString("binary");
const prgSize = romBuf[4] * 16384;
const chrOff  = 16 + prgSize;
const CHR_PT0 = romBuf.slice(chrOff, chrOff + 4096);          // sprite tiles
const CHR_PT1 = romBuf.slice(chrOff + 4096, chrOff + 8192);   // BG tiles

console.log(`ROM: ${romFile}`);

// ── NES Hardware Palette ──────────────────────────────────────────────────────

const NES_RGB = [
  [84,84,84],[0,30,116],[8,16,144],[48,0,136],[68,0,100],[92,0,48],
  [84,4,0],[60,24,0],[32,42,0],[8,58,0],[0,64,0],[0,60,0],[0,50,60],
  [0,0,0],[0,0,0],[0,0,0],[152,150,152],[8,76,196],[48,50,236],[92,30,228],
  [136,20,176],[160,20,100],[152,34,32],[120,60,0],[84,90,0],[40,114,0],
  [8,124,0],[0,118,40],[0,102,120],[0,0,0],[0,0,0],[0,0,0],[236,238,236],
  [76,154,236],[120,124,236],[176,98,236],[228,84,236],[236,88,180],
  [236,106,100],[212,136,32],[160,170,0],[116,196,0],[76,208,32],[56,204,108],
  [56,180,204],[60,60,60],[0,0,0],[0,0,0],[236,238,236],[168,204,236],
  [188,188,236],[212,178,236],[236,174,236],[236,174,212],[236,180,176],
  [228,196,144],[204,210,120],[180,222,120],[168,226,144],[152,226,180],
  [160,214,228],[160,162,160],[0,0,0],[0,0,0],
];
const nesRGB = (idx) => NES_RGB[idx & 0x3f] || [0,0,0];

// ── CHR tile utilities ────────────────────────────────────────────────────────

function decodeTile(bank, tileIdx) {
  const base = tileIdx * 16, px = new Uint8Array(64);
  for (let r = 0; r < 8; r++) {
    const lo = bank[base + r], hi = bank[base + 8 + r];
    for (let c = 0; c < 8; c++) {
      const b = 7 - c;
      px[r * 8 + c] = (((hi >> b) & 1) << 1) | ((lo >> b) & 1);
    }
  }
  return px;
}

function tileIsBlank(bank, tileIdx) {
  const base = tileIdx * 16;
  for (let i = 0; i < 16; i++) if (bank[base + i]) return false;
  return true;
}

// ── jsnes utilities ───────────────────────────────────────────────────────────

function makeNES() {
  return new NES({
    onFrame: () => {},
    onAudioSample: null,
    onStatusUpdate: () => {},
    emulateSound: false,
  });
}

function readOAM(nes) {
  return Array.from({ length: 64 }, (_, i) => {
    const b = 0x0200 + i * 4;
    return {
      slot:    i,
      y:       nes.cpu.mem[b],
      tile:    nes.cpu.mem[b + 1],
      attr:    nes.cpu.mem[b + 2],
      x:       nes.cpu.mem[b + 3],
      flip_h:  !!(nes.cpu.mem[b + 2] & 0x40),
      flip_v:  !!(nes.cpu.mem[b + 2] & 0x80),
      palette: nes.cpu.mem[b + 2] & 0x03,
    };
  });
}

/** Boot SMB W1-1 to a stable walking gameplay state (Big Mario via mushroom) */
function bootToGameplay() {
  const nes = makeNES();
  nes.loadROM(romStr);
  nes.buttonDown(1, Controller.BUTTON_START);
  for (let i = 0; i < 120; i++) nes.frame();
  nes.buttonUp(1, Controller.BUTTON_START);
  nes.buttonDown(1, Controller.BUTTON_START);
  for (let i = 0; i < 60; i++) nes.frame();
  nes.buttonUp(1, Controller.BUTTON_START);
  for (let i = 0; i < 160; i++) nes.frame();
  nes.buttonDown(1, Controller.BUTTON_RIGHT);
  for (let i = 0; i < 150; i++) nes.frame();
  nes.buttonUp(1, Controller.BUTTON_RIGHT);
  for (let i = 0; i < 10; i++) nes.frame();
  return nes;
}

// ── STEP 1: Boot + Capture PPU Palettes ──────────────────────────────────────

console.log("\n═══ STEP 1: Boot + Capture PPU Palettes ═══");
const nesBase = bootToGameplay();
const baseState = JSON.stringify(nesBase.toJSON());

const ppuPal = Array.from({ length: 32 }, (_, i) =>
  nesBase.ppu.vramMem[0x3F00 + i]
);
console.log("PPU palettes: " + ppuPal.map(v => "0x" + v.toString(16).padStart(2,"0")).join(" "));

// Sprite palettes indexed by palette number (0-3)
// $3F11+  for palettes 0-3 (each 3 colors, base color = universal bg $3F00)
function getSpritePal(palIdx, overrideColors = null) {
  const base = 0x11 + palIdx * 4;
  const colors = overrideColors || [ppuPal[base], ppuPal[base+1], ppuPal[base+2]];
  return [
    [255, 0, 255],           // palette index 0 = transparent
    nesRGB(colors[0]),
    nesRGB(colors[1]),
    nesRGB(colors[2]),
  ];
}

function getBGPal(palIdx) {
  const base = 0x01 + palIdx * 4;
  return [
    [255, 0, 255],
    nesRGB(ppuPal[base]),
    nesRGB(ppuPal[base+1]),
    nesRGB(ppuPal[base+2]),
  ];
}

// Fire Mario palette: white suit, dark red hat/overalls
// Known SMB1 fire Mario colors: $30=white, $16=dark red, $27=orange
const FIRE_MARIO_PAL = getSpritePal(0, [0x30, 0x16, 0x27]);

// ── STEP 2: Player Sprite Capture ────────────────────────────────────────────

console.log("\n═══ STEP 2: Player Sprite Capture ═══");

function restoreBase() {
  const nes = makeNES();
  nes.loadROM(romStr);
  nes.fromJSON(JSON.parse(baseState));
  return nes;
}

/**
 * Capture player OAM frames by forcing state and walking.
 * playerSlots: OAM slot indices that belong to the player body.
 *   - Small: slots 1-8 (all 8 are real sprite tiles)
 *   - Big/Fire: slots 5-8 (top 4 are blank/BG-rendered)
 */
function capturePlayerFrames(sizeVal, statusVal, palOverride, playerSlots, label) {
  const nes = restoreBase();
  nes.cpu.mem[0x0754] = sizeVal;
  nes.cpu.mem[0x0756] = statusVal;
  if (palOverride) {
    nes.ppu.vramMem[0x3F11] = palOverride[0];
    nes.ppu.vramMem[0x3F12] = palOverride[1];
    nes.ppu.vramMem[0x3F13] = palOverride[2];
  }

  const collected = [];
  const seen = new Set();

  // Standing frame
  for (let i = 0; i < 3; i++) nes.frame();
  {
    const oam = readOAM(nes);
    const sprites = playerSlots
      .map(s => oam[s])
      .filter(s => s.y < 240 && s.tile !== 0xFC && !tileIsBlank(CHR_PT0, s.tile));
    if (sprites.length > 0) {
      const key = sprites.map(s => s.tile).join(',');
      if (!seen.has(key)) {
        seen.add(key);
        collected.push({ label: `${label}-stand`, sprites, group: label });
      }
    }
  }

  // Walk cycle: hold right and capture distinct frames
  nes.buttonDown(1, Controller.BUTTON_RIGHT);
  for (let f = 0; f < 36; f++) {
    nes.frame();
    const oam = readOAM(nes);
    const sprites = playerSlots
      .map(s => oam[s])
      .filter(s => s.y < 240 && s.tile !== 0xFC && !tileIsBlank(CHR_PT0, s.tile));
    if (sprites.length > 0) {
      const key = sprites.map(s => s.tile).join(',');
      if (!seen.has(key)) {
        seen.add(key);
        const walkN = collected.filter(c => c.label.includes('walk')).length;
        collected.push({ label: `${label}-walk${walkN+1}`, sprites, group: label });
        if (collected.filter(c => c.label.includes('walk')).length >= 3) break;
      }
    }
  }
  nes.buttonUp(1, Controller.BUTTON_RIGHT);
  for (let i = 0; i < 3; i++) nes.frame();

  // Jump frame
  nes.buttonDown(1, Controller.BUTTON_A);
  for (let i = 0; i < 4; i++) nes.frame();
  nes.buttonUp(1, Controller.BUTTON_A);
  {
    const oam = readOAM(nes);
    const sprites = playerSlots
      .map(s => oam[s])
      .filter(s => s.y < 240 && s.tile !== 0xFC && !tileIsBlank(CHR_PT0, s.tile));
    if (sprites.length > 0) {
      const key = sprites.map(s => s.tile).join(',');
      if (!seen.has(key)) {
        seen.add(key);
        collected.push({ label: `${label}-jump`, sprites, group: label });
      }
    }
  }

  return collected;
}

// Small Mario: slots 1-8 (all body sprites)
const smallFrames = capturePlayerFrames(0, 0, null, [1,2,3,4,5,6,7,8], "Small Mario");

// Big Mario: slots 5-8 (lower body only, head in BG)
const bigFrames   = capturePlayerFrames(1, 0, null, [5,6,7,8], "Big Mario");

// Fire Mario: same slots, different palette (white/red)
const fireFrames  = capturePlayerFrames(1, 2, [0x30, 0x16, 0x27], [5,6,7,8], "Fire Mario");

const playerFrames = [...smallFrames, ...bigFrames, ...fireFrames];
console.log(`Player frames captured:`);
playerFrames.forEach(f => {
  const tiles = f.sprites.map(s => "0x"+s.tile.toString(16)).join(',');
  console.log(`  ${f.label}: ${f.sprites.length} sprites [${tiles}]`);
});

// ── STEP 3: Load Entity Manifest ─────────────────────────────────────────────

console.log("\n═══ STEP 3: Load Entity Manifest ═══");
const manifestData = JSON.parse(fs.readFileSync(MANIFEST_PATH, "utf8"));
const allEntities  = manifestData.entities;
console.log(`Loaded ${allEntities.length} entity types`);

const ENEMY_NAMES = {
  0x00: "GreenKoopa",     0x01: "GreenKoopa_B",    0x02: "BuzzyBeetle",
  0x03: "RedKoopa",       0x04: "RedKoopa_B",      0x05: "HammerBro",
  0x06: "Goomba",         0x07: "Bloober",          0x08: "BulletBill_Frenzy",
  0x09: "TallEnemy",      0x0a: "GreyCheepCheep",   0x0b: "RedCheepCheep",
  0x0c: "Podoboo",        0x0d: "PiranhaPlant",     0x0e: "ParatroopaJump",
  0x0f: "RedParatroopa",  0x10: "ParatroopaFly",    0x11: "Lakitu",
  0x12: "Spiny",          0x13: "Spiny_B",          0x14: "FlyingCheepCheep",
  0x15: "BowserFlame",    0x16: "Fireworks",         0x17: "BBill_CCheep_Frenzy",
  0x18: "Stop_Frenzy",    0x2d: "Bowser",            0x2e: "Mushroom/PowerUp",
  0x2f: "VineObject",     0x30: "FlagpoleFlag",      0x31: "StarFlag",
  0x32: "Jumpspring",     0x33: "BulletBill_Cannon", 0x35: "Retainer",
};

// Include all named types (0x00-0x35) + higher types with valid visible sprites
function isInterestingEntity(e) {
  if (e.type_value <= 0x35) return true;
  return e.anim_frames.some(f =>
    f.sprites.some(s => s.tile !== 0xFC && s.y < 240 && s.tile > 0 &&
      !tileIsBlank(CHR_PT0, s.tile))
  );
}

function getEntityBestFrames(entity, maxFrames = 4) {
  const seen = new Set(), frames = [];
  for (const frame of entity.anim_frames) {
    const vis = frame.sprites.filter(
      s => s.y < 240 && s.tile !== 0xFC && !tileIsBlank(CHR_PT0, s.tile)
    );
    if (vis.length === 0) continue;
    const key = vis.map(s => `${s.tile},${s.flip_h?1:0}`).join('|');
    if (seen.has(key)) continue;
    seen.add(key);
    frames.push({ ...frame, visibleSprites: vis });
    if (frames.length >= maxFrames) break;
  }
  return frames;
}

const enemies = allEntities.filter(isInterestingEntity);
console.log(`Filtered to ${enemies.length} entity types`);

// ── STEP 4: BG / Sprite bank tiles ───────────────────────────────────────────

const bgTiles     = Array.from({length:256}, (_,i) => i).filter(i => !tileIsBlank(CHR_PT1, i));
const spriteTiles = Array.from({length:256}, (_,i) => i).filter(i => !tileIsBlank(CHR_PT0, i));
console.log(`\nBG tiles: ${bgTiles.length}/256  Sprite tiles: ${spriteTiles.length}/256`);

// ── STEP 5: Render Sprite Sheet ───────────────────────────────────────────────

console.log("\n═══ STEP 5: Rendering ═══");

const SCALE   = 4;
const CELL_W  = 32 * SCALE;     // 128px cell width
const CELL_H  = 32 * SCALE;     // 128px cell height
const LABEL_W = 160;
const PAD     = 4;
const HDRH    = 24;
const MAGENTA = [255, 0, 255];
const BORDER  = [80, 80, 80];

const manifestEntries = [];

// Layout calculation
const playerRows = [...new Set(playerFrames.map(f => f.group))];
const playerCols = Math.max(...playerRows.map(g =>
  playerFrames.filter(f => f.group === g).length
));
const enemyCols    = 4;
const refCols      = 16;
const spriteRefRows = Math.ceil(spriteTiles.length / refCols);
const bgRefRows     = Math.ceil(bgTiles.length / refCols);

const maxCols  = Math.max(playerCols, enemyCols, refCols);
const totalW   = LABEL_W + maxCols * (CELL_W + PAD) + PAD;

// Section heights
const S1H = HDRH + playerRows.length    * (CELL_H + PAD);
const S2H = HDRH + enemies.length       * (CELL_H + PAD);
const S3H = HDRH + spriteRefRows        * (CELL_H + PAD);
const S4H = HDRH + bgRefRows            * (CELL_H + PAD);
const totalH = HDRH + S1H + PAD + S2H + PAD + S3H + PAD + S4H + PAD + 20;

console.log(`Canvas: ${totalW} × ${totalH}`);

const RGBA = new Uint8Array(totalW * totalH * 4);
for (let i = 0; i < totalW * totalH; i++) {
  RGBA[i*4] = 20; RGBA[i*4+1] = 20; RGBA[i*4+2] = 20; RGBA[i*4+3] = 255;
}

// ── Render helpers ────────────────────────────────────────────────────────────

function setPixel(x, y, r, g, b) {
  if (x < 0 || y < 0 || x >= totalW || y >= totalH) return;
  const off = (y * totalW + x) * 4;
  RGBA[off] = r; RGBA[off+1] = g; RGBA[off+2] = b; RGBA[off+3] = 255;
}

function fillRect(x, y, w, h, [r,g,b]) {
  for (let dy = 0; dy < h; dy++)
    for (let dx = 0; dx < w; dx++) setPixel(x+dx, y+dy, r, g, b);
}

function drawCell(cx, cy) {
  fillRect(cx, cy, CELL_W, CELL_H, MAGENTA);
  for (let i = 0; i < CELL_W; i++) {
    setPixel(cx+i, cy,          ...BORDER);
    setPixel(cx+i, cy+CELL_H-1, ...BORDER);
  }
  for (let i = 0; i < CELL_H; i++) {
    setPixel(cx,          cy+i, ...BORDER);
    setPixel(cx+CELL_W-1, cy+i, ...BORDER);
  }
}

/** Render an assembled sprite group centered in a cell. */
function renderAssembly(sprites, cx, cy, bank, paletteOverride = null) {
  const vis = sprites.filter(
    s => s.y < 240 && s.tile !== 0xFC && !tileIsBlank(bank, s.tile)
  );
  if (vis.length === 0) return [];

  let minX = Infinity, minY = Infinity, maxX = -Infinity, maxY = -Infinity;
  for (const s of vis) {
    minX = Math.min(minX, s.x); minY = Math.min(minY, s.y);
    maxX = Math.max(maxX, s.x + 8); maxY = Math.max(maxY, s.y + 8);
  }
  const drawW = (maxX - minX) * SCALE;
  const drawH = (maxY - minY) * SCALE;
  const offX  = cx + Math.floor((CELL_W - drawW) / 2);
  const offY  = cy + Math.floor((CELL_H - drawH) / 2);

  const entries = [];
  for (const s of vis) {
    const px  = offX + (s.x - minX) * SCALE;
    const py  = offY + (s.y - minY) * SCALE;
    const pal = paletteOverride ?? getSpritePal(s.palette);
    const px8 = decodeTile(bank, s.tile);

    for (let r = 0; r < 8; r++) {
      for (let c = 0; c < 8; c++) {
        const sr = s.flip_v ? 7-r : r, sc = s.flip_h ? 7-c : c;
        const pidx = px8[sr * 8 + sc];
        if (pidx === 0) continue;
        const [R, G, B] = pal[pidx] || [0,0,0];
        for (let sy = 0; sy < SCALE; sy++)
          for (let sx = 0; sx < SCALE; sx++)
            setPixel(px + c*SCALE + sx, py + r*SCALE + sy, R, G, B);
      }
    }
    entries.push({
      tile_idx: s.tile,
      tile_hex: "0x"+s.tile.toString(16).padStart(2,"0"),
      pixel_x: px, pixel_y: py,
      flip_h: s.flip_h, flip_v: s.flip_v||false,
      palette: s.palette, slot: s.slot,
    });
  }
  return entries;
}

/** Render a single CHR tile at 2× scale in a quadrant. */
function renderTileQuad(px8, qx, qy, palette) {
  for (let r = 0; r < 8; r++) {
    for (let c = 0; c < 8; c++) {
      const pidx = px8[r * 8 + c];
      if (pidx === 0) continue;
      const [R, G, B] = palette[pidx] || [0,0,0];
      setPixel(qx+16+c*2,   qy+16+r*2,   R, G, B);
      setPixel(qx+16+c*2+1, qy+16+r*2,   R, G, B);
      setPixel(qx+16+c*2,   qy+16+r*2+1, R, G, B);
      setPixel(qx+16+c*2+1, qy+16+r*2+1, R, G, B);
    }
  }
}

// ── Section header bars ───────────────────────────────────────────────────────

function sectionBar(y, [r,g,b], title) {
  fillRect(0, y, totalW, HDRH, [r,g,b]);
  console.log(`  Section: ${title}`);
}

// ── RENDER ────────────────────────────────────────────────────────────────────

let curY = 0;

// Title bar
fillRect(0, curY, totalW, HDRH, [10, 10, 50]);
curY += HDRH;

// ── Section 1: Player ─────────────────────────────────────────────────────────

sectionBar(curY, [30, 30, 100], "SECTION 1: PLAYER");
curY += HDRH;

for (const groupName of playerRows) {
  const gFrames = playerFrames.filter(f => f.group === groupName);
  const isFireMario = groupName === "Fire Mario";
  fillRect(0, curY, LABEL_W, CELL_H, [40, 40, 100]);

  let cx = LABEL_W;
  for (const frame of gFrames) {
    drawCell(cx, curY);
    const pal = isFireMario ? FIRE_MARIO_PAL : getSpritePal(frame.sprites[0]?.palette ?? 0);
    const entries = renderAssembly(frame.sprites, cx, curY, CHR_PT0, pal);
    manifestEntries.push({
      section: "player", entity: groupName, frame_id: frame.label,
      cell_x: cx, cell_y: curY, tiles: entries,
      note: isFireMario ? "Same tiles as Big Mario; white/red fire palette applied" : undefined,
    });
    cx += CELL_W + PAD;
  }
  curY += CELL_H + PAD;
}

// ── Section 2: Enemies ────────────────────────────────────────────────────────

curY += PAD;
sectionBar(curY, [90, 30, 30], "SECTION 2: ENEMIES");
curY += HDRH;

for (const entity of enemies) {
  const name   = ENEMY_NAMES[entity.type_value] || `Entity_0x${entity.type_value.toString(16)}`;
  const frames = getEntityBestFrames(entity, enemyCols);
  if (frames.length === 0) continue;

  fillRect(0, curY, LABEL_W, CELL_H, [70, 25, 25]);
  let cx = LABEL_W;
  for (const frame of frames) {
    drawCell(cx, curY);
    const entries = renderAssembly(frame.visibleSprites, cx, curY, CHR_PT0);
    manifestEntries.push({
      section: "enemy", entity: name,
      type_value: entity.type_value,
      type_hex: "0x"+entity.type_value.toString(16),
      anim_val: frame.anim_val,
      cell_x: cx, cell_y: curY, tiles: entries,
    });
    cx += CELL_W + PAD;
  }
  curY += CELL_H + PAD;
}
console.log(`    ${enemies.length} entity types`);

// ── Section 3: Sprite Bank CHR Reference (PT0) ───────────────────────────────

curY += PAD;
sectionBar(curY, [30, 80, 30], "SECTION 3: SPRITE BANK CHR TILES (PT0)");
curY += HDRH;

const spritePals = [getSpritePal(0), getSpritePal(1), getSpritePal(2), getSpritePal(3)];
for (let i = 0; i < spriteTiles.length; i++) {
  const col = i % refCols, row = Math.floor(i / refCols);
  const cx = LABEL_W + col * (CELL_W + PAD), cy = curY + row * (CELL_H + PAD);
  const tidx = spriteTiles[i];
  drawCell(cx, cy);
  const px8 = decodeTile(CHR_PT0, tidx);
  for (let p = 0; p < 4; p++) {
    const qx = cx + (p%2) * (CELL_W/2), qy = cy + Math.floor(p/2) * (CELL_H/2);
    fillRect(qx, qy, CELL_W/2, CELL_H/2, MAGENTA);
    renderTileQuad(px8, qx, qy, spritePals[p]);
  }
  manifestEntries.push({
    section: "sprite_bank", entity: `PT0_tile_0x${tidx.toString(16).padStart(2,"0")}`,
    tile_idx: tidx, tile_hex: "0x"+tidx.toString(16).padStart(2,"0"),
    cell_x: cx, cell_y: cy, bank: "PT0",
  });
}
curY += spriteRefRows * (CELL_H + PAD);

// ── Section 4: BG Bank CHR Reference (PT1) ───────────────────────────────────

curY += PAD;
sectionBar(curY, [30, 30, 100], "SECTION 4: BG BANK CHR TILES (PT1)");
curY += HDRH;

const bgPals = [getBGPal(0), getBGPal(1), getBGPal(2), getBGPal(3)];
for (let i = 0; i < bgTiles.length; i++) {
  const col = i % refCols, row = Math.floor(i / refCols);
  const cx = LABEL_W + col * (CELL_W + PAD), cy = curY + row * (CELL_H + PAD);
  const tidx = bgTiles[i];
  drawCell(cx, cy);
  const px8 = decodeTile(CHR_PT1, tidx);
  for (let p = 0; p < 4; p++) {
    const qx = cx + (p%2) * (CELL_W/2), qy = cy + Math.floor(p/2) * (CELL_H/2);
    fillRect(qx, qy, CELL_W/2, CELL_H/2, MAGENTA);
    renderTileQuad(px8, qx, qy, bgPals[p]);
  }
  manifestEntries.push({
    section: "bg_bank", entity: `PT1_tile_0x${tidx.toString(16).padStart(2,"0")}`,
    tile_idx: tidx, tile_hex: "0x"+tidx.toString(16).padStart(2,"0"),
    cell_x: cx, cell_y: cy, bank: "PT1",
  });
}

// ── Write outputs ─────────────────────────────────────────────────────────────

console.log("\n═══ STEP 6: Writing outputs ═══");

const manifest = {
  game:      "Super Mario Bros.",
  rom:       romFile,
  generated: new Date().toISOString(),
  scale:     SCALE,
  canvas:    { width: totalW, height: totalH },
  architecture_notes: {
    small_mario: "All 8 OAM sprites (slots 1-8) are sprite-rendered. Full 2×4 = 16×32px body.",
    big_mario:   "4 OAM sprites for lower body (slots 5-8). Head rendered via BG nametable tiles (top 4 slots use blank tile 0xFC to let BG show through).",
    fire_mario:  "Identical tiles to Big Mario. Differs only in PPU sprite palette: white (#30) + dark red (#16) + orange (#27) instead of Big Mario's red/tan palette.",
    enemy_source: "OAM data from oracle-captured entity manifest (jsnes runtime oracle sweep).",
    chr_sections: "PT0/PT1 sections show all non-blank CHR-ROM tiles with 4 palette variants per cell (quadrant layout).",
  },
  chr_pt0_offset: chrOff,
  chr_pt1_offset: chrOff + 4096,
  ppu_palettes: ppuPal.map(v => "0x"+v.toString(16).padStart(2,"0")),
  stats: {
    player_frames:  manifestEntries.filter(e => e.section === "player").length,
    enemy_types:    enemies.length,
    enemy_frames:   manifestEntries.filter(e => e.section === "enemy").length,
    pt0_tiles:      spriteTiles.length,
    pt1_tiles:      bgTiles.length,
    total_entries:  manifestEntries.length,
  },
  entries: manifestEntries,
};

fs.writeFileSync(JSON_PATH, JSON.stringify(manifest, null, 2));
console.log(`Manifest: ${JSON_PATH} (${manifestEntries.length} entries)`);

sharp(Buffer.from(RGBA), { raw: { width: totalW, height: totalH, channels: 4 } })
  .png()
  .toFile(PNG_PATH)
  .then(() => {
    const s = manifest.stats;
    console.log(`PNG: ${PNG_PATH} (${totalW}×${totalH})`);
    console.log("\n✓ SMB Tier-1 extraction COMPLETE");
    console.log(`  Player:   ${s.player_frames} frames (small/big/fire)`);
    console.log(`  Enemies:  ${s.enemy_types} entity types, ${s.enemy_frames} animation frames`);
    console.log(`  PT0:      ${s.pt0_tiles}/256 non-blank sprite tiles`);
    console.log(`  PT1:      ${s.pt1_tiles}/256 non-blank BG tiles`);
    console.log(`  Total:    ${s.total_entries} manifest entries`);
  })
  .catch(err => { console.error("PNG write error:", err); process.exit(1); });
