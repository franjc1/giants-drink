/**
 * SMB Transformation Toolkit API
 *
 * A working JavaScript module with callable functions that transform
 * a running Super Mario Bros game via jsnes.
 *
 * Usage:
 *   const { NES } = require('jsnes');
 *   const SMBToolkit = require('./smb-api.cjs');
 *
 *   const nes = new NES({ onFrame: fb => {}, onAudioSample: () => {} });
 *   nes.loadROM(romData.toString('binary'));
 *
 *   const tk = new SMBToolkit(nes);
 *   tk.bootToGameplay();
 *   tk.setLives(9);
 *   tk.warpToLevel(4, 1);
 */

const { Controller } = require('jsnes');

// ============================================================
// ROM Table Addresses (verified from SMB1 disassembly)
// ============================================================
const ROM_TABLES = {
  WorldAddrOffsets: 0x9CB4,  // 8 bytes, one per world
  AreaAddrOffsets:  0x9CBC,  // 40 entries, encodes aoIdx + offset
  AreaTypeBases:    0x9D28,  // 4 bytes, base pointer per area type
  AreaObjPtrLo:     0x9D2C,  // 34 entries, area object data lo bytes
  AreaObjPtrHi:     0x9D4E,  // 34 entries, area object data hi bytes
};

// ============================================================
// RAM Address Map (discovered through investigation)
// ============================================================
const RAM = {
  // Player position
  PlayerX:       0x0086,  // Screen-relative X position
  PlayerY:       0x00CE,  // Screen-relative Y position
  PlayerXSub:    0x0400,  // Sub-pixel X (fractional movement)
  PlayerState:   0x000E,  // Player action state (8=normal gameplay)

  // Player velocity
  PlayerYVel:    0x009F,  // Vertical velocity (signed: negative=up)
  PlayerXSpeed:  0x0057,  // Horizontal speed (sub-pixel per frame)

  // Player status
  PowerupState:  0x0756,  // 0=small, 1=big, 2=fire
  Lives:         0x075A,  // Lives remaining (display = value + 1)
  Coins:         0x075E,  // Coin count

  // Game state
  WorldNumber:   0x075F,  // 0-indexed world number
  LevelNumber:   0x0760,  // 0-indexed level number
  AreaPointer:   0x074E,  // Area data pointer (index into area tables)
  OperMode:      0x0770,  // 0=title, 1=game, 2=victory, 3=gameover
  OperModeTask:  0x0772,  // Sub-task: 0=InitArea, 1=Screen, 2=Setup, 3=Core
  GameMode:      0x079F,  // Game engine mode
  StarTimer:     0x079E,  // Star invincibility countdown timer
  TimerOnes:     0x000F,  // Timer ones digit

  // Enemy slots (5 slots, index 0-4, parallel arrays offset from player)
  EnemyType:     0x0016,  // +slot: enemy type (0=none, 6=goomba, etc.)
  EnemyX:        0x0087,  // +slot: enemy X position
  EnemyY:        0x00CF,  // +slot: enemy Y position
  EnemyXSpeed:   0x0058,  // +slot: enemy horizontal sub-pixel speed
  EnemyActive:   0x000F,  // +slot: enemy active flag area (approximate)

  // OAM Shadow (CPU RAM, DMA'd to PPU OAM each frame)
  OAMShadow:     0x0200,  // 256 bytes = 64 sprites × 4 bytes each

  // Scroll
  ScrollX:       0x071A,  // Horizontal scroll position (lo)
  ScrollXHi:     0x071B,  // Horizontal scroll position (hi/page)
};

// NES color palette reference (subset of common colors)
const NES_COLORS = {
  BLACK:       0x0F,
  WHITE:       0x30,
  RED:         0x16,
  DARK_RED:    0x06,
  ORANGE:      0x27,
  YELLOW:      0x28,
  GREEN:       0x1A,
  DARK_GREEN:  0x0A,
  BLUE:        0x12,
  LIGHT_BLUE:  0x22,
  DARK_BLUE:   0x02,
  PURPLE:      0x14,
  PINK:        0x24,
  BROWN:       0x17,
  GREY:        0x10,
  LIGHT_GREY:  0x20,
  SKY_BLUE:    0x22,
};

class SMBToolkit {
  constructor(nes) {
    this.nes = nes;
    this._spriteInjections = []; // Persistent sprite injections
    this._frozenAddresses = {};  // Addresses frozen to specific values
  }

  // ============================================================
  // LOW-LEVEL HELPERS
  // ============================================================

  /** Read RAM address */
  ram(addr) { return this.nes.cpu.mem[addr]; }

  /** Write RAM address */
  wram(addr, value) { this.nes.cpu.mem[addr] = value & 0xFF; }

  /** Read CPU address space (includes ROM at $8000-$FFFF) */
  cpuRead(addr) { return this.nes.cpu.mem[addr]; }

  /** Advance N frames, applying per-frame hooks */
  step(n) {
    for (let i = 0; i < n; i++) {
      this._applyFrozenAddresses();
      this._applyPerFrameInjections();
      this.nes.frame();
    }
  }

  /** Press and release a button */
  pressButton(button, holdFrames = 1) {
    this.nes.buttonDown(1, button);
    this.step(holdFrames);
    this.nes.buttonUp(1, button);
  }

  /** Apply frozen address values before each frame */
  _applyFrozenAddresses() {
    for (const [addr, value] of Object.entries(this._frozenAddresses)) {
      this.nes.cpu.mem[parseInt(addr)] = value;
    }
  }

  /** Write sprite injections to OAM shadow before each frame */
  _applyPerFrameInjections() {
    for (const s of this._spriteInjections) {
      const base = RAM.OAMShadow + s.slot * 4;
      this.nes.cpu.mem[base] = s.y;
      this.nes.cpu.mem[base + 1] = s.tile;
      this.nes.cpu.mem[base + 2] = s.attr;
      this.nes.cpu.mem[base + 3] = s.x;
    }
  }

  // ============================================================
  // BOOT & STATE MANAGEMENT
  // ============================================================

  /** Boot the game from power-on to gameplay (W1-1) */
  bootToGameplay() {
    this.step(60);  // Wait for title screen
    this.pressButton(Controller.BUTTON_START);
    this.step(180); // Wait for level to load
    return this;
  }

  /** Save complete emulator state */
  saveState() {
    return this.nes.toJSON();
  }

  /** Restore complete emulator state */
  loadState(state) {
    this.nes.fromJSON(state);
    return this;
  }

  // ============================================================
  // INSPECTION
  // ============================================================

  /** Get human-readable game state */
  getFullState() {
    return {
      player: {
        x: this.ram(RAM.PlayerX),
        y: this.ram(RAM.PlayerY),
        yVelocity: this.ram(RAM.PlayerYVel),
        xSpeed: this.ram(RAM.PlayerXSpeed),
        state: this.ram(RAM.PlayerState),
        powerup: this.ram(RAM.PowerupState),
        powerupName: ['small', 'big', 'fire'][this.ram(RAM.PowerupState)] || 'unknown',
      },
      game: {
        world: this.ram(RAM.WorldNumber) + 1,
        level: this.ram(RAM.LevelNumber) + 1,
        lives: this.ram(RAM.Lives),
        coins: this.ram(RAM.Coins),
        operMode: this.ram(RAM.OperMode),
        operModeTask: this.ram(RAM.OperModeTask),
        starTimer: this.ram(RAM.StarTimer),
      },
      enemies: this._getEnemies(),
    };
  }

  /** Get enemy slot data */
  _getEnemies() {
    const enemies = [];
    for (let slot = 0; slot < 5; slot++) {
      const type = this.ram(RAM.EnemyType + slot);
      if (type !== 0) {
        enemies.push({
          slot,
          type,
          x: this.ram(RAM.EnemyX + slot),
          y: this.ram(RAM.EnemyY + slot),
          speed: this.ram(RAM.EnemyXSpeed + slot),
        });
      }
    }
    return enemies;
  }

  /** Diff two RAM snapshots */
  diffStates(snap1, snap2) {
    const diffs = [];
    for (let i = 0; i < 0x800; i++) {
      if (snap1[i] !== snap2[i]) {
        diffs.push({ addr: i, old: snap1[i], new: snap2[i] });
      }
    }
    return diffs;
  }

  /** Snapshot all of RAM ($0000-$07FF) */
  snapRAM() {
    const snap = new Uint8Array(0x800);
    for (let i = 0; i < 0x800; i++) snap[i] = this.ram(i);
    return snap;
  }

  // ============================================================
  // VISUAL TRANSFORMATIONS
  // ============================================================

  /**
   * Set a background or sprite palette.
   * @param {number} paletteIndex - 0-3 for BG palettes, 4-7 for sprite palettes
   * @param {number[]} colors - Array of 4 NES color values (use NES_COLORS or raw values)
   */
  setPalette(paletteIndex, colors) {
    const base = 0x3F00 + paletteIndex * 4;
    for (let i = 0; i < Math.min(colors.length, 4); i++) {
      this.nes.ppu.vramMem[base + i] = colors[i];
    }
    return this;
  }

  /**
   * Get current palette.
   * @param {number} paletteIndex - 0-3 for BG, 4-7 for sprites
   * @returns {number[]} Array of 4 NES color values
   */
  getPalette(paletteIndex) {
    const base = 0x3F00 + paletteIndex * 4;
    return [0, 1, 2, 3].map(i => this.nes.ppu.vramMem[base + i]);
  }

  /**
   * Swap a CHR tile's pixel data in the pattern table.
   * @param {number} tileIndex - 0-511 (0-255 = sprite bank, 256-511 = BG bank for SMB)
   * @param {number[]} pixelData - 64-byte array of 2-bit pixel values (0-3), row-major 8x8
   */
  swapCHRTile(tileIndex, pixelData) {
    const tile = this.nes.ppu.ptTile[tileIndex];
    if (!tile || !tile.pix) {
      throw new Error(`Tile ${tileIndex} not found or has no pixel data`);
    }
    for (let i = 0; i < 64 && i < pixelData.length; i++) {
      tile.pix[i] = pixelData[i] & 0x3;
    }
    return this;
  }

  /**
   * Read a CHR tile's pixel data.
   * @param {number} tileIndex - 0-511
   * @returns {number[]} 64-byte array of 2-bit pixel values
   */
  getCHRTile(tileIndex) {
    const tile = this.nes.ppu.ptTile[tileIndex];
    if (!tile || !tile.pix) return null;
    return Array.from(tile.pix);
  }

  /**
   * Inject a sprite into OAM. Persists across frames (re-injected each frame).
   * @param {number} slot - OAM slot (0-63). Use 56-63 for safest injection (less game use)
   * @param {number} tile - CHR tile index
   * @param {number} x - X position
   * @param {number} y - Y position
   * @param {number} attr - Attribute byte (palette bits 0-1, priority bit 5, flip bits 6-7)
   */
  injectSprite(slot, tile, x, y, attr = 0) {
    // Remove existing injection at this slot
    this._spriteInjections = this._spriteInjections.filter(s => s.slot !== slot);
    this._spriteInjections.push({ slot, tile, x, y, attr });

    // Also write immediately to OAM shadow for next frame
    const base = RAM.OAMShadow + slot * 4;
    this.wram(base, y);
    this.wram(base + 1, tile);
    this.wram(base + 2, attr);
    this.wram(base + 3, x);
    return this;
  }

  /** Remove a persistent sprite injection */
  removeSprite(slot) {
    this._spriteInjections = this._spriteInjections.filter(s => s.slot !== slot);
    // Hide the sprite
    const base = RAM.OAMShadow + slot * 4;
    this.wram(base, 0xFF); // Y = offscreen
    return this;
  }

  /** Clear all sprite injections */
  clearSprites() {
    for (const s of this._spriteInjections) {
      const base = RAM.OAMShadow + s.slot * 4;
      this.wram(base, 0xFF);
    }
    this._spriteInjections = [];
    return this;
  }

  // ============================================================
  // MECHANICAL TRANSFORMATIONS
  // ============================================================

  /** Set player position */
  setPlayerPosition(x, y) {
    if (x !== undefined) this.wram(RAM.PlayerX, x);
    if (y !== undefined) this.wram(RAM.PlayerY, y);
    return this;
  }

  /** Set player powerup state: 0=small, 1=big, 2=fire */
  setPlayerState(state) {
    this.wram(RAM.PowerupState, state);
    return this;
  }

  /**
   * Set Y velocity (jump height control).
   * Normal walk jump = -4 (0xFC). Normal run jump = -5 (0xFB).
   * More negative = higher jump. Use signed values internally.
   * @param {number} velocity - Signed velocity (-128 to 127). Negative = upward.
   */
  setJumpVelocity(velocity) {
    this.wram(RAM.PlayerYVel, velocity < 0 ? 256 + velocity : velocity);
    return this;
  }

  /**
   * Freeze jump velocity to a custom value each frame (persistent super jump).
   * Call unfreezeJumpVelocity() to restore normal physics.
   * @param {number} velocity - Signed velocity to apply each frame during jumps
   */
  freezeJumpVelocity(velocity) {
    const val = velocity < 0 ? 256 + velocity : velocity;
    this._frozenAddresses[RAM.PlayerYVel] = val;
    return this;
  }

  /** Remove jump velocity freeze */
  unfreezeJumpVelocity() {
    delete this._frozenAddresses[RAM.PlayerYVel];
    return this;
  }

  /**
   * Set enemy speed for a specific slot.
   * Default goomba speed is 248 (0xF8 = -8 signed, moves left).
   * 0 = stopped, higher values = faster.
   * @param {number} slot - Enemy slot (0-4)
   * @param {number} speed - Speed value (sub-pixel per frame)
   */
  setEnemySpeed(slot, speed) {
    this.wram(RAM.EnemyXSpeed + slot, speed);
    return this;
  }

  /** Freeze an enemy's speed (persistent across frames) */
  freezeEnemySpeed(slot, speed) {
    this._frozenAddresses[RAM.EnemyXSpeed + slot] = speed;
    return this;
  }

  /** Unfreeze enemy speed */
  unfreezeEnemySpeed(slot) {
    delete this._frozenAddresses[RAM.EnemyXSpeed + slot];
    return this;
  }

  /**
   * Enable star invincibility. Timer decrements each frame.
   * Must be refreshed (call repeatedly or use enablePersistentInvincibility).
   * @param {number} duration - Timer value (frames)
   */
  setStarTimer(duration) {
    this.wram(RAM.StarTimer, duration);
    return this;
  }

  /** Enable persistent invincibility (star timer refreshed every frame) */
  enablePersistentInvincibility() {
    this._frozenAddresses[RAM.StarTimer] = 0xFF;
    return this;
  }

  /** Disable persistent invincibility */
  disablePersistentInvincibility() {
    delete this._frozenAddresses[RAM.StarTimer];
    this.wram(RAM.StarTimer, 0);
    return this;
  }

  /**
   * Prevent death by freezing player state to normal gameplay.
   * This prevents the death animation and state transition.
   */
  enableDeathPrevention() {
    this._frozenAddresses[RAM.PlayerState] = 8; // Normal gameplay state
    return this;
  }

  /** Allow normal death again */
  disableDeathPrevention() {
    delete this._frozenAddresses[RAM.PlayerState];
    return this;
  }

  // ============================================================
  // GAMEPLAY TRANSFORMATIONS
  // ============================================================

  /**
   * Warp to a different level.
   * @param {number} world - 1-8
   * @param {number} level - 1-4
   */
  warpToLevel(world, level) {
    // Compute area pointer from ROM tables
    const worldIdx = world - 1;
    const levelIdx = level - 1;

    const worldBase = this.cpuRead(ROM_TABLES.WorldAddrOffsets + worldIdx);
    const entryIdx = worldBase + levelIdx;
    const entry = this.cpuRead(ROM_TABLES.AreaAddrOffsets + entryIdx);
    const aoIdx = (entry >> 5) & 0x3;
    const offset = entry & 0x1F;
    const typeBase = this.cpuRead(ROM_TABLES.AreaTypeBases + aoIdx);
    const areaPtr = typeBase + offset;

    // Set world/level display
    this.wram(RAM.WorldNumber, worldIdx);
    this.wram(RAM.LevelNumber, levelIdx);

    // Set area pointer for correct level data
    this.wram(RAM.AreaPointer, areaPtr);

    // Trigger area re-initialization
    this.wram(RAM.OperModeTask, 0);

    // Wait for the level intro screen to finish and gameplay to start.
    // The intro screen ("WORLD X-Y") takes ~250 frames.
    // Wait until OperModeTask returns to 3 (GameCoreRoutine = gameplay).
    for (let i = 0; i < 400; i++) {
      this.nes.frame();
      if (this.ram(RAM.OperModeTask) === 3 && this.ram(RAM.PlayerState) <= 8) {
        // Gameplay started, advance a few more frames to stabilize
        this.step(10);
        break;
      }
    }

    return this;
  }

  /** Set lives remaining (display shows value + 1) */
  setLives(n) {
    this.wram(RAM.Lives, n);
    return this;
  }

  /** Set coin count */
  setCoins(n) {
    this.wram(RAM.Coins, n);
    return this;
  }

  /**
   * Suppress a game event by freezing relevant addresses.
   * @param {'death'|'invincibility'|'gravity'} eventType
   */
  suppressEvent(eventType) {
    switch (eventType) {
      case 'death':
        this.enableDeathPrevention();
        break;
      case 'invincibility':
        this.enablePersistentInvincibility();
        break;
      case 'gravity':
        // Freeze Y velocity to 0 (no falling)
        this._frozenAddresses[RAM.PlayerYVel] = 0;
        break;
      default:
        throw new Error(`Unknown event type: ${eventType}`);
    }
    return this;
  }

  /** Unsuppress a game event */
  unsuppressEvent(eventType) {
    switch (eventType) {
      case 'death':
        this.disableDeathPrevention();
        break;
      case 'invincibility':
        this.disablePersistentInvincibility();
        break;
      case 'gravity':
        delete this._frozenAddresses[RAM.PlayerYVel];
        break;
    }
    return this;
  }

  // ============================================================
  // FRAME BUFFER CAPTURE
  // ============================================================

  /**
   * Capture the current frame buffer as RGBA pixel data.
   * @returns {{ width: number, height: number, data: Int32Array }} Frame buffer
   */
  captureFrame() {
    // Run one frame to get fresh output
    this.step(1);
    return {
      width: 256,
      height: 240,
      data: this.nes.ppu.buffer, // Int32Array of RGBA pixels
    };
  }
}

// Export
module.exports = SMBToolkit;
module.exports.RAM = RAM;
module.exports.ROM_TABLES = ROM_TABLES;
module.exports.NES_COLORS = NES_COLORS;
module.exports.Controller = Controller;
