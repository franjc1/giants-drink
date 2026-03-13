-- extraction-enumerator.lua
-- Session UE-1 / Session 11b: Universal NES content extraction via RAM mutation
--
-- Run via Mesen2 headless:
--   ~/mesen2/Mesen.app/Contents/MacOS/Mesen --testrunner <rom.nes> tools/extraction-enumerator.lua
--
-- CRITICAL: emu.createSavestate / emu.loadSavestate ONLY work inside exec memory
-- operation callbacks. All savestate operations use the doSavestate() helper which
-- registers a one-shot exec callback, fires it, then unregisters itself.
--
-- All output via print() to stdout. DATA_ lines parsed by orchestrator.js.

-- ============================================================
-- CONFIG
-- ============================================================

local CFG = {
  -- Phase 1: boot detection
  -- Cycles alternate pressing Start (odd cycles) and A (even cycles).
  -- Each cycle is ~75 frames: 10 press + 40 wait + ~3 save + 10 right + 10 left + eval.
  -- At 1800 frames we get ~24 cycles before timeout.
  P1_TIMEOUT           = 1800,  -- give up after this many frames (~30s), flag for manual inspection

  NT_FILL_THRESHOLD    = 576,   -- non-zero nametable tiles (60% of 960) — used in Phase 4

  SNAP_COUNT           = 5,
  SNAP_INTERVAL        = 60,    -- frames between RAM snapshots (Phase 2)

  P3_FRAMES_PER_VAL    = 3,     -- frames to wait after writing test value
  P3_SETTLE_FRAMES     = 0,     -- frames to wait after restoring original (0 = immediate)
  P3_SAMPLE_STEP       = 32,    -- step through values 0..255 (1=all 256, 32=8 sampled values)
  P3_UNIQUE_THRESHOLD  = 3,     -- min unique VRAM hashes to qualify as content var
  P3_PROGRESS_INTERVAL = 50,

  P4_LOAD_FRAMES       = 120,   -- frames to wait for level load
  P4_OAM_INTERVAL      = 10,    -- frames between OAM animation snapshots
  P4_OAM_COUNT         = 10,    -- total OAM snapshots per state

  MAX_TOTAL_FRAMES     = 700000, -- safety limit (~12 min at 1000x)
}

-- ============================================================
-- SAVESTATE MACHINERY
-- Savestates only work inside exec memory callbacks.
-- doSavestate() registers a one-shot callback that fires on the next CPU
-- instruction execution in $8000-$FFFF (PRG ROM range), runs the savestate
-- operation, then unregisters itself. The result is available in the
-- startFrame callback of the NEXT frame.
-- ============================================================

local ssResult  = nil   -- nil = pending or not requested; non-nil = done
local ssPending = false -- true while exec callback hasn't fired yet

local function doSavestate(op, data)
  ssPending = true
  ssResult  = nil
  local cbRef
  -- Use full CPU address range (0x0000-0xFFFF) so the callback fires even when the
  -- game is executing RAM code. Some games enter RAM trampolines after certain memory
  -- writes, causing the $8000-$FFFF exec range to never fire. One-shot: removes itself.
  cbRef = emu.addMemoryCallback(function()
    if op == "save" then
      ssResult = emu.createSavestate()
    else
      emu.loadSavestate(data)
      ssResult = true
    end
    ssPending = false
    emu.removeMemoryCallback(cbRef, emu.callbackType.exec, 0x0000, 0xFFFF)
  end, emu.callbackType.exec, 0x0000, 0xFFFF)
end

-- ============================================================
-- SHARED HELPERS
-- ============================================================

local function readHex(memType, startAddr, count)
  local parts = {}
  for i = 0, count - 1 do
    parts[i+1] = string.format("%02x", emu.read(startAddr + i, memType))
  end
  return table.concat(parts)
end

-- Fast sampled VRAM hash for Phase 3 (level-change detection).
-- Samples 32 nametable bytes (every 30th tile of 960) + 16 palette bytes.
-- A full level change produces a completely different nametable, so 48 reads
-- is sufficient while keeping Phase 3 fast.
local function sampleHashVram()
  local h = 5381
  -- 32 nametable bytes sampled every 30 tiles across 960 total
  for i = 0, 31 do
    h = (h * 31 + emu.read(i * 30, emu.memType.nesNametableRam)) % 0x100000000
  end
  -- 16 palette bytes
  for i = 0, 15 do
    h = (h * 31 + emu.read(i, emu.memType.nesPaletteRam)) % 0x100000000
  end
  return h
end

local function countNonZero(memType, startAddr, count)
  local n = 0
  for i = 0, count - 1 do
    if emu.read(startAddr + i, memType) ~= 0 then n = n + 1 end
  end
  return n
end

local function readChrHex()
  local romSize = emu.getMemorySize(emu.memType.nesChrRom)
  if romSize > 0 then
    local sz = math.min(romSize, 8192)
    return readHex(emu.memType.nesChrRom, 0, sz), sz, "rom"
  end
  local ramSize = emu.getMemorySize(emu.memType.nesChrRam)
  if ramSize > 0 then
    local sz = math.min(ramSize, 8192)
    return readHex(emu.memType.nesChrRam, 0, sz), sz, "ram"
  end
  return "", 0, "none"
end

local function readPpuRegs()
  local ctrl, mask = 0, 0
  local ok,  v  = pcall(function() return emu.read(0x2000, emu.memType.nesDebug) end)
  local ok2, v2 = pcall(function() return emu.read(0x2001, emu.memType.nesDebug) end)
  if ok  then ctrl = v  end
  if ok2 then mask = v2 end
  return ctrl, mask
end

local function clearInput()
  emu.setInput({right=false,left=false,up=false,down=false,
                a=false,b=false,start=false,select=false}, 0)
end

-- Read all 24 NES APU register bytes ($4000-$4017) via the CPU debug bus.
-- Most registers are write-only on real hardware; emulator shadow registers may
-- return non-zero. $4015 (channel enable/status) is always readable.
local function readApuHex()
  local parts = {}
  for addr = 0x4000, 0x4017 do
    local ok, v = pcall(function() return emu.read(addr, emu.memType.nesDebug) end)
    table.insert(parts, string.format("%02x", (ok and v) or 0))
  end
  return table.concat(parts)
end

-- ============================================================
-- GLOBAL STATE
-- ============================================================

local frame     = 0
local phase     = 1
local sub       = "init"
local waitUntil = 0

-- Phase 1
-- Strategy: each cycle presses a button (Start or A, alternating) then runs a
-- bidirectional movement test on all 64 OAM sprites. Any sprite whose X increases
-- during Right AND decreases during Left is the player sprite — real gameplay confirmed.
-- Attract demos use pre-recorded input and won't respond to Left when scripted Right.
local BASELINE          = nil
local p1CandSlot        = -1   -- OAM slot of confirmed player sprite (used in Phase 5)
local p1CycleNum        = 0    -- how many press+test cycles have run
local p1HoldCount       = 0    -- frames spent in current hold sub-state
local p1PreX            = {}   -- pre-test X position for each of 64 OAM slots
local p1PreY            = {}   -- pre-test Y position for each of 64 OAM slots
local p1MidX            = {}   -- mid-test X position (after Right press)
local p1BaselineState   = nil  -- savestate captured at pre-test moment; promoted to BASELINE on confirm
local p1RamPre          = {}   -- 2048-byte RAM snapshot before Right press (for player addr correlation)
local p1RamMid          = {}   -- 2048-byte RAM snapshot after Right press
local p1RamPost         = {}   -- 2048-byte RAM snapshot after Left press
local p1RamSettle       = {}   -- 2048-byte RAM snapshot after 120-frame settle (for Y disambiguation)
local p1YCandList       = {}   -- candidate Y addresses from hold_left; finalized in settle_save
local p1RefSlotY        = -1   -- OAM Y of the lowest-numbered on-screen slot at test time (Y reference)
local p1PlayerXAddr     = -1   -- confirmed CPU RAM address of player X position
local p1PlayerYAddr     = -1   -- confirmed CPU RAM address of player Y position

-- Phase 2
local snapshots = {}   -- {[1..5]} = arrays indexed [0..2047]
local snapIdx   = 0
local nextSnapAt = 0
local candidates = {}  -- list of RAM addresses

-- Phase 3
local p3Idx     = 1
local p3Val     = 0
local p3OrigVal = 0
local p3Hashes  = {}   -- {value=N, hash=H} for current address
local p3UniqueH = {}   -- set of unique hashes
local p3CVars   = {}   -- content variables: {addr, unique, values=[...]}
local p3Done    = 0

-- Phase 4
local p4CvIdx   = 1
local p4ValIdx  = 1
local p4OamCount = 0
local p4NextOam = 0
local p4Captured = 0
local LEVEL_CAND  = nil  -- {addr, val} for physics phase
local PHYSICS_BASE = nil  -- savestate captured inside Phase 4 when level is playable;
                           -- game loaded level itself → Mario at spawn with zero velocity.
                           -- Used as the base state for Phase 5 physics tests.
local p4ChrCache  = nil  -- {hex, sz, src} — CHR-ROM is fixed; capture once

-- Phase 5 (oracle-based rewrite)
local LEVEL_STATE    = nil
local p5TestIdx      = 1
local p5FrameN       = 0
local p5Positions    = {}
local p5GroundY      = -1   -- player Y at ground level (read from BASELINE after load)
local p5SafeX        = -1   -- player X at BASELINE (safe starting position)
-- Velocity discovery: scan $0050-$005F for bytes that track position deltas.
-- Covers typical NES velocity registers ($57/$58 X vel, $59/$5A Y vel) while
-- AVOIDING $006x which holds critical state in many NES games: $006D = SMB1
-- horizontal page counter; zeroing it snaps Mario's world position.
local P5_VEL_RANGE   = {lo=0x0050, hi=0x005F}
local p5VelDiscPre   = {}   -- full RAM snapshot before discovery step
local p5VelDiscPhase = 0    -- 0=X discovery step, 1=Y discovery step, 2=done
-- Populated by discovery; printed as DATA_PHYSICS_VEL for downstream use.
local p5XVelAddrs    = {}   -- {addr, initial_val} for X velocity bytes found
local p5YVelAddrs    = {}   -- {addr, initial_val} for Y velocity bytes found
local p5YVerifyGround  = {}  -- zero-page snapshot at ground for Y addr verification
local p5YVerifyAirSnap = {}  -- zero-page snapshot mid-jump for Y addr verification

-- Physics test definitions. inputFn(f) returns input for frame f (1-based).
-- air=true  → oracle places player 48px above groundY before test
-- air=false → oracle places player at groundY (on ground)
local P5_TESTS = {
  -- GRAVITY: no input, 30 frames in the air. Y deltas give fall velocity;
  -- delta-of-deltas gives gravitational acceleration in pixels/frame².
  { name="GRAVITY",      frames=30,  air=true,  inputFn=function(f)
      return {right=false,left=false,up=false,down=false,a=false,b=false,start=false,select=false}
    end },
  -- WALK_RIGHT: 60 frames pressing Right from ground. Delta stabilises at max walk speed.
  { name="WALK_RIGHT",   frames=60,  air=false, inputFn=function(f)
      return {right=true,left=false,up=false,down=false,a=false,b=false,start=false,select=false}
    end },
  -- FRICTION: Right for 30 frames then release for 30 frames. Deceleration curve.
  { name="FRICTION",     frames=60,  air=false, inputFn=function(f)
      local r = (f <= 30)
      return {right=r,left=false,up=false,down=false,a=false,b=false,start=false,select=false}
    end },
  -- JUMP_TAP: A for exactly 1 frame then release. Short hop / min jump height.
  { name="JUMP_TAP",     frames=60,  air=false, inputFn=function(f)
      return {right=false,left=false,up=false,down=false,a=(f==1),b=false,start=false,select=false}
    end },
  -- JUMP_HOLD: A held for entire duration. Max jump height curve.
  { name="JUMP_HOLD",    frames=60,  air=false, inputFn=function(f)
      return {right=false,left=false,up=false,down=false,a=true,b=false,start=false,select=false}
    end },
  -- RUNNING_JUMP: Right+A for 20 frames then Right only for 30 frames.
  { name="RUNNING_JUMP", frames=50,  air=false, inputFn=function(f)
      local a = (f <= 20)
      return {right=true,left=false,up=false,down=false,a=a,b=false,start=false,select=false}
    end },
  -- DUCK: hold Down for 20 frames.
  { name="DUCK",         frames=20,  air=false, inputFn=function(f)
      return {right=false,left=false,up=false,down=true,a=false,b=false,start=false,select=false}
    end },
}

-- ============================================================
-- PHASE 1: BOOT TO GAMEPLAY — BIDIRECTIONAL CONTROL DETECTION
--
-- Each ~75-frame cycle:
--   1. Press Start (odd cycles) or A (even cycles) for 10 frames
--      Some games need Start to advance menus; others need A for confirmations.
--   2. Wait 40 frames — let the game react to the button press.
--   3. Read all 64 OAM sprite X positions → p1PreX[]. Save state (→ p1BaselineState).
--   4. Hold Right for 10 frames. Read all 64 OAM X positions → p1MidX[].
--   5. Hold Left for 10 frames. Read all 64 OAM X positions → postX[].
--   6. For each slot: if mid > pre (moved right) AND post < mid (moved left) →
--      that is the player sprite. Control confirmed. p1BaselineState → BASELINE.
--      Proceed to Phase 2.
--   7. If no slot confirms: print status, start next cycle.
--
-- WHY BIDIRECTIONAL: Attract demos use pre-recorded input. If the demo moves Mario
-- right, pressing Right shows movement (false positive on right test alone). But the
-- demo ignores our Left input — the sprite keeps moving right — so post.X >= mid.X,
-- meaning dxLeft >= 0, and the test correctly rejects it.
--
-- WHY ALTERNATE START/A: Some games require A to confirm menus. Alternating ensures
-- both are tried regardless of which the game needs.
--
-- TIMEOUT: After 1800 frames (~24 cycles), flag game for manual inspection.
-- ============================================================

local function runPhase1()
  -- Timeout: give up and flag for manual inspection
  if frame >= CFG.P1_TIMEOUT then
    print("STATUS_PHASE1:TIMEOUT no control confirmed after " .. frame .. " frames")
    print("DATA_EXTRACTION:INCOMPLETE")
    emu.stop(); return
  end

  -- Initialize on first call
  if sub == "init" then sub = "start_cycle" end

  -- ---- START CYCLE: increment counter, transition to press_button ----
  if sub == "start_cycle" then
    p1CycleNum  = p1CycleNum + 1
    p1HoldCount = 0
    local btn = (p1CycleNum % 2 == 1) and "start" or "a"
    print("STATUS_PHASE1:Cycle=" .. p1CycleNum .. " pressing=" .. btn .. " frame=" .. frame)
    sub = "press_button"
    -- fall through to press_button on same frame
  end

  -- ---- PRESS BUTTON (10 frames): Start on odd cycles, A on even cycles ----
  if sub == "press_button" then
    if p1CycleNum % 2 == 1 then
      emu.setInput({right=false,left=false,up=false,down=false,
                    a=false,b=false,start=true,select=false}, 0)
    else
      emu.setInput({right=false,left=false,up=false,down=false,
                    a=true,b=false,start=false,select=false}, 0)
    end
    p1HoldCount = p1HoldCount + 1
    if p1HoldCount >= 10 then
      p1HoldCount = 0
      sub = "wait_after_press"
    end
    return
  end

  -- ---- WAIT 40 FRAMES: let the game process the button press ----
  if sub == "wait_after_press" then
    clearInput()
    p1HoldCount = p1HoldCount + 1
    if p1HoldCount >= 40 then
      -- Read pre-test OAM X positions for all 64 sprite slots
      for slot = 0, 63 do
        p1PreX[slot] = emu.read(slot * 4 + 3, emu.memType.nesSpriteRam)
        p1PreY[slot] = emu.read(slot * 4,     emu.memType.nesSpriteRam)
      end
      -- Snapshot all 2048 RAM bytes before Right press (for player position correlation)
      for i = 0, 2047 do p1RamPre[i] = emu.read(i, emu.memType.nesInternalRam) end
      -- Save state — this becomes BASELINE if control is confirmed this cycle
      doSavestate("save")
      sub = "wait_save"
    end
    return
  end

  -- ---- WAIT FOR SAVESTATE ----
  if sub == "wait_save" then
    clearInput()
    if ssPending then return end
    p1BaselineState = ssResult
    p1HoldCount     = 0
    sub = "hold_right"
    return
  end

  -- ---- HOLD RIGHT (10 frames), then read mid positions ----
  if sub == "hold_right" then
    emu.setInput({right=true,left=false,up=false,down=false,
                  a=false,b=false,start=false,select=false}, 0)
    p1HoldCount = p1HoldCount + 1
    if p1HoldCount >= 10 then
      -- Capture mid-test X positions after Right press
      for slot = 0, 63 do
        p1MidX[slot] = emu.read(slot * 4 + 3, emu.memType.nesSpriteRam)
      end
      -- Snapshot RAM after Right press
      for i = 0, 2047 do p1RamMid[i] = emu.read(i, emu.memType.nesInternalRam) end
      p1HoldCount = 0
      sub = "hold_left"
    end
    return
  end

  -- ---- HOLD LEFT (10 frames), then evaluate ----
  if sub == "hold_left" then
    emu.setInput({right=false,left=true,up=false,down=false,
                  a=false,b=false,start=false,select=false}, 0)
    p1HoldCount = p1HoldCount + 1
    if p1HoldCount >= 10 then
      clearInput()
      -- Read post-test X positions and check each slot
      local foundSlot = -1
      local foundDxR, foundDxL = 0, 0
      for slot = 0, 63 do
        -- *** ON-SCREEN FILTER: only consider sprites with visible Y ***
        -- OAM Y byte is display_row - 1. Off-screen / hidden sprites have Y >= 239.
        -- Attract demo sprites are often off-screen or at high OAM slots with
        -- anomalous Y values — this filter prevents false positives.
        local sprY = p1PreY[slot]
        if sprY < 239 and sprY > 0 then
          local pre  = p1PreX[slot]
          local mid  = p1MidX[slot]
          local post = emu.read(slot * 4 + 3, emu.memType.nesSpriteRam)
          -- Signed 8-bit delta (sprites wrap at 256)
          local dxR = mid - pre
          if dxR > 128  then dxR = dxR - 256 end
          if dxR < -128 then dxR = dxR + 256 end
          local dxL = post - mid
          if dxL > 128  then dxL = dxL - 256 end
          if dxL < -128 then dxL = dxL + 256 end
          -- Both directions confirm real player control
          if dxR > 0 and dxL < 0 then
            foundSlot = slot
            foundDxR  = dxR
            foundDxL  = dxL
            break
          end
        end
      end

      if foundSlot >= 0 then
        p1CandSlot = foundSlot
        print("STATUS_PHASE1:Control confirmed cycle=" .. p1CycleNum ..
              " frame=" .. frame .. " slot=" .. foundSlot ..
              " dxRight=" .. foundDxR .. " dxLeft=" .. foundDxL)

        -- Snapshot RAM after Left press
        for i = 0, 2047 do p1RamPost[i] = emu.read(i, emu.memType.nesInternalRam) end

        -- Player X correlation: direction matching, not exact delta.
        -- The confirmed OAM slot may not be Mario's main body sprite (NES multiplexes
        -- sprites across slots), so the OAM delta can't be used as the target magnitude.
        -- Instead: find addresses that INCREASED (signed) during Right and DECREASED
        -- during Left, with a minimum change of 2 pixels to filter noise.
        -- From zero-page candidates, prefer the one with the LARGEST rightward movement —
        -- player X changes more than any incidental bidirectional variable.
        local xCand = {}
        for addr = 0, 2047 do
          local dR = p1RamMid[addr] - p1RamPre[addr]
          if dR > 128  then dR = dR - 256 end
          if dR < -128 then dR = dR + 256 end
          if dR >= 2 then
            local dL = p1RamPost[addr] - p1RamMid[addr]
            if dL > 128  then dL = dL - 256 end
            if dL < -128 then dL = dL + 256 end
            if dL <= -2 then
              xCand[#xCand+1] = addr
            end
          end
        end

        -- Select best X: in zero page, pick the address with the LARGEST rightward delta
        -- (player X moves the most of any bidirectional variable).
        p1PlayerXAddr = -1
        local xBestMag = 0
        for _, addr in ipairs(xCand) do
          if addr <= 0xFF then
            local dR = p1RamMid[addr] - p1RamPre[addr]
            if dR > 128 then dR = dR - 256 end
            if dR < -128 then dR = dR + 256 end
            if dR > xBestMag then xBestMag = dR; p1PlayerXAddr = addr end
          end
        end
        if p1PlayerXAddr < 0 then
          for _, addr in ipairs(xCand) do
            if addr >= 0x700 and addr <= 0x7FF then p1PlayerXAddr = addr; break end
          end
        end
        if p1PlayerXAddr < 0 and #xCand > 0 then p1PlayerXAddr = xCand[1] end

        -- Player Y candidates: addresses constant during BOTH Right AND Left presses,
        -- with a plausible screen Y value (24-240). Final selection deferred to settle_save
        -- where a third RAM snapshot filters out velocity/counter variables that change
        -- during deceleration — critical for excluding addresses like X velocity ($0088)
        -- that are coincidentally stable during the brief bidirectional test but change
        -- during the longer settle period.
        p1YCandList = {}
        for addr = 0, 2047 do
          local v = p1RamPre[addr]
          if v >= 24 and v <= 240 and
             p1RamMid[addr] == v and p1RamPost[addr] == v then
            p1YCandList[#p1YCandList+1] = addr
          end
        end

        -- Capture the OAM Y of the lowest-numbered on-screen sprite as a Y reference.
        -- NES games allocate low OAM slot numbers to the main player, so slot 0 (or
        -- whichever low slot is visible) should be near the player's actual screen Y.
        -- Used in settle_save to prefer Y candidates close to this value over e.g.
        -- velocity variables that are coincidentally stable at a similar address.
        p1RefSlotY = -1
        for s = 0, 63 do
          local vy = emu.read(s * 4, emu.memType.nesSpriteRam)
          if vy >= 32 and vy <= 224 then p1RefSlotY = vy; break end
        end

        local xStr = (p1PlayerXAddr >= 0) and string.format("0x%04X", p1PlayerXAddr) or "none"
        print("STATUS_PHASE1:PlayerX x_addr=" .. xStr ..
              " x_cands=" .. #xCand .. " y_cands_pending=" .. #p1YCandList ..
              " refSlotY=" .. p1RefSlotY)

        -- Reload p1BaselineState (pre-directional-test snapshot) before settling.
        -- The Right press in the control test may have pushed Mario to the flagpole,
        -- triggering a level-complete animation that ignores all input. Starting the
        -- settle from p1BaselineState guarantees Mario is in a playable position.
        print("STATUS_PHASE1:Reloading p1BaselineState before settle to avoid flag contamination")
        doSavestate("load", p1BaselineState)
        p1HoldCount = 0
        sub = "settle_reload"
      else
        print("STATUS_PHASE1:No control found cycle=" .. p1CycleNum .. " frame=" .. frame)
        sub = "start_cycle"
      end
    end
    return
  end

  -- ---- SETTLE (settle_reload → 120 + 5 + 60 frames) ----
  -- settle_reload: wait for p1BaselineState loadstate to complete (ssPending guard).
  -- settle_wait (120f): clearInput from the clean pre-test position (landing + decel).
  -- settle_left (5f): press Left to cancel any rightward carry-over.
  -- settle_final (60f): final clearInput for full stop.
  -- BASELINE saved with Mario guaranteed stationary in a playable game state.
  if sub == "settle_reload" then
    clearInput()
    if ssPending then return end  -- wait for p1BaselineState to load
    p1HoldCount = p1HoldCount + 1
    if p1HoldCount >= 5 then  -- brief stabilisation after load before counting settle
      p1HoldCount = 0
      sub = "settle_wait"
    end
    return
  end

  if sub == "settle_wait" then
    clearInput()
    p1HoldCount = p1HoldCount + 1
    if p1HoldCount >= 120 then
      p1HoldCount = 0
      sub = "settle_left"
    end
    return
  end

  if sub == "settle_left" then
    emu.setInput({right=false,left=true,up=false,down=false,
                  a=false,b=false,start=false,select=false}, 0)
    p1HoldCount = p1HoldCount + 1
    if p1HoldCount >= 5 then
      p1HoldCount = 0
      sub = "settle_final"
    end
    return
  end

  if sub == "settle_final" then
    clearInput()
    p1HoldCount = p1HoldCount + 1
    if p1HoldCount >= 60 then
      doSavestate("save")
      p1HoldCount = 0
      sub = "settle_save"
    end
    return
  end

  if sub == "settle_save" then
    clearInput()
    if ssPending then return end
    BASELINE = ssResult
    -- Snapshot RAM after the 120-frame settle. X velocity and other motion variables
    -- will have changed during deceleration; Y position stays constant on the ground.
    -- Filter p1YCandList to only addresses that ALSO didn't change during settle.
    for i = 0, 2047 do p1RamSettle[i] = emu.read(i, emu.memType.nesInternalRam) end
    local yFinal = {}
    for _, addr in ipairs(p1YCandList) do
      if p1RamSettle[addr] == p1RamPre[addr] then
        yFinal[#yFinal+1] = addr
      end
    end
    -- Select best Y: among zero-page candidates, prefer the one whose value is CLOSEST
    -- to p1RefSlotY (OAM Y of the lowest-numbered on-screen slot = likely the player body).
    -- This disambiguates from velocity/timer variables that are also stable but at wrong values.
    -- Falls back to lowest-address if no reference was captured.
    p1PlayerYAddr = -1
    if p1RefSlotY >= 0 then
      local yBestDist = 9999
      for _, addr in ipairs(yFinal) do
        if addr <= 0xFF then
          local dist = math.abs(p1RamPre[addr] - p1RefSlotY)
          if dist < yBestDist then yBestDist = dist; p1PlayerYAddr = addr end
        end
      end
    end
    if p1PlayerYAddr < 0 then
      for _, addr in ipairs(yFinal) do
        if addr <= 0xFF then p1PlayerYAddr = addr; break end
      end
    end
    if p1PlayerYAddr < 0 then
      for _, addr in ipairs(yFinal) do
        if addr >= 0x700 and addr <= 0x7FF then p1PlayerYAddr = addr; break end
      end
    end
    if p1PlayerYAddr < 0 and #yFinal > 0 then p1PlayerYAddr = yFinal[1] end
    local xStr = (p1PlayerXAddr >= 0) and string.format("0x%04X", p1PlayerXAddr) or "none"
    local yStr = (p1PlayerYAddr >= 0) and string.format("0x%04X", p1PlayerYAddr) or "none"
    print("STATUS_PHASE1:PlayerRAM x_addr=" .. xStr .. " y_addr=" .. yStr ..
          " y_after_settle=" .. #yFinal)
    local baseX = (p1PlayerXAddr >= 0) and emu.read(p1PlayerXAddr, emu.memType.nesInternalRam) or -1
    print("STATUS_PHASE1:BASELINE saved at frame=" .. frame .. " x=" .. baseX)
    print("DATA_PHASE1:COMPLETE frame=" .. frame)
    phase = 2; sub = "init"
    return
  end
end

-- ============================================================
-- PHASE 2: IDENTIFY CANDIDATES
-- ============================================================

local function runPhase2()
  if sub == "init" then
    snapIdx    = 0
    nextSnapAt = frame
    sub        = "collecting"
  end

  if sub ~= "collecting" then return end
  if frame < nextSnapAt   then return end

  snapIdx = snapIdx + 1
  local snap = {}
  for i = 0, 2047 do snap[i] = emu.read(i, emu.memType.nesInternalRam) end
  snapshots[snapIdx] = snap

  if snapIdx < CFG.SNAP_COUNT then
    nextSnapAt = frame + CFG.SNAP_INTERVAL
    return
  end

  -- Classify all addresses first
  local isVolatile = {}
  for addr = 0, 2047 do
    local v1,v2,v3,v4,v5 = snapshots[1][addr],snapshots[2][addr],
                             snapshots[3][addr],snapshots[4][addr],snapshots[5][addr]
    local isConst  = (v1==v2 and v2==v3 and v3==v4 and v4==v5)
    local isTicker = (v1<v2 and v2<v3 and v3<v4 and v4<v5) or
                     (v1>v2 and v2>v3 and v3>v4 and v4>v5)
    isVolatile[addr] = not isConst and not isTicker
  end

  -- Build candidates in priority order:
  --   Priority 1: Upper page ($0700-$07FF) — ALL addresses regardless of volatility.
  --     Level/world/room variables are CONSTANT during gameplay (never detected as volatile)
  --     but are the most important content switches. NES games store them here.
  --     Processed FIRST so they're never missed by the Mesen2 testrunner time limit.
  --   Priority 2: Zero page ($0000-$00FF) — ALL addresses regardless of volatility.
  --     Frequently-accessed 6502 variables; may hold mode/phase flags.
  --   Priority 3: Volatile mid-range ($0100-$06FF) — only volatile ones.
  --     Sprite/entity data, audio state, etc. Detected by Phase 2 sweep.
  candidates = {}
  local inCandidates = {}
  for i = 0x700, 0x7FF do
    table.insert(candidates, i); inCandidates[i] = true
  end
  for i = 0, 255 do
    if not inCandidates[i] then
      table.insert(candidates, i); inCandidates[i] = true
    end
  end
  for addr = 0, 2047 do
    if isVolatile[addr] and not inCandidates[addr] then
      table.insert(candidates, addr)
    end
  end

  -- Batch all candidate addresses into one print() to avoid per-call I/O overhead.
  -- Mesen2 testrunner has a ~100s wall-clock limit; 765 individual print()s waste ~5s.
  local candParts = {}
  for _, addr in ipairs(candidates) do
    candParts[#candParts + 1] = string.format("0x%04X", addr)
  end
  print("DATA_PHASE2:COMPLETE candidates=" .. #candidates)
  print("DATA_CANDIDATES:" .. table.concat(candParts, ","))
  phase = 3; sub = "init"
end

-- ============================================================
-- PHASE 3: MUTATION SWEEP
-- ============================================================

local function p3FinishAddress()
  local addr      = candidates[p3Idx]
  local seenH     = {}
  local uniqueVals = {}
  local uniqueN   = 0
  for _, e in ipairs(p3Hashes) do
    if not seenH[e.hash] then
      seenH[e.hash] = true; uniqueN = uniqueN + 1
      table.insert(uniqueVals, e.value)
    end
  end
  print("DATA_PHASE3_ADDR:addr=0x" .. string.format("%04X", addr) ..
        " unique=" .. uniqueN)
  if uniqueN > CFG.P3_UNIQUE_THRESHOLD then
    table.insert(p3CVars, {addr=addr, unique=uniqueN, values=uniqueVals})
  end
  p3Done = p3Done + 1
  if p3Done % CFG.P3_PROGRESS_INTERVAL == 0 then
    print("STATUS_PHASE3:" .. p3Done .. "/" .. #candidates ..
          " cvars=" .. #p3CVars)
  end
end

local function runPhase3()
  if sub == "init" then
    if #candidates == 0 then
      print("DATA_PHASE3:COMPLETE content_vars=0")
      phase = 4; sub = "init"; return
    end
    p3Idx = 1; sub = "restore"
  end

  if sub == "restore" then
    if p3Idx > #candidates then
      print("DATA_PHASE3:COMPLETE content_vars=" .. #p3CVars)
      for _, cv in ipairs(p3CVars) do
        local vs = table.concat(cv.values, ",")
        print("DATA_CONTENT_VAR:addr=0x" .. string.format("%04X", cv.addr) ..
              " unique=" .. cv.unique .. " values=[" .. vs .. "]")
      end
      phase = 4; sub = "init"; return
    end
    doSavestate("load", BASELINE)
    sub = "read_orig"; return
  end

  if sub == "read_orig" then
    if ssPending then return end
    p3OrigVal = emu.read(candidates[p3Idx], emu.memType.nesInternalRam)
    p3Val = 0; p3Hashes = {}; p3UniqueH = {}
    sub = "write_val"; return
  end

  if sub == "write_val" then
    if p3Val > 255 then
      p3FinishAddress(); p3Idx = p3Idx + 1
      sub = "restore"; return
    end
    emu.write(candidates[p3Idx], p3Val, emu.memType.nesInternalRam)
    waitUntil = frame + CFG.P3_FRAMES_PER_VAL
    sub = "wait_write"; return
  end


  if sub == "wait_write" then
    if frame < waitUntil then return end
    local h = sampleHashVram()
    table.insert(p3Hashes, {value=p3Val, hash=h})
    p3UniqueH[h] = true
    emu.write(candidates[p3Idx], p3OrigVal, emu.memType.nesInternalRam)
    waitUntil = frame + CFG.P3_SETTLE_FRAMES
    sub = "settle"; return
  end

  if sub == "settle" then
    if frame < waitUntil then return end
    p3Val = p3Val + CFG.P3_SAMPLE_STEP; sub = "write_val"
  end
end

-- ============================================================
-- PHASE 4: DEEP ENUMERATION
-- ============================================================

local function p4CaptureState(addr, val)
  local aStr = "addr=0x" .. string.format("%04X", addr) .. " value=" .. val
  print("DATA_RAM:"     .. aStr .. " data=" .. readHex(emu.memType.nesInternalRam,  0, 2048))
  print("DATA_VRAM:"    .. aStr .. " data=" .. readHex(emu.memType.nesNametableRam, 0, 1024))
  print("DATA_PALETTE:" .. aStr .. " data=" .. readHex(emu.memType.nesPaletteRam,  0, 32))
  print("DATA_OAM:"     .. aStr .. " data=" .. readHex(emu.memType.nesSpriteRam,   0, 256))
  -- CHR-ROM is fixed for the whole game; capture once and reuse.
  -- CHR-RAM changes per level and must be captured every time.
  if p4ChrCache == nil then
    local chrHex, chrSz, chrSrc = readChrHex()
    if chrSrc == "rom" then
      p4ChrCache = {hex=chrHex, sz=chrSz, src=chrSrc}
    end
    print("DATA_CHR:" .. aStr .. " size=" .. chrSz .. " src=" .. chrSrc .. " data=" .. chrHex)
  elseif p4ChrCache.src == "rom" then
    -- Reuse cached CHR-ROM data
    print("DATA_CHR:" .. aStr .. " size=" .. p4ChrCache.sz ..
          " src=" .. p4ChrCache.src .. " data=" .. p4ChrCache.hex)
  else
    -- CHR-RAM: re-read per state
    local chrHex, chrSz, chrSrc = readChrHex()
    print("DATA_CHR:" .. aStr .. " size=" .. chrSz .. " src=" .. chrSrc .. " data=" .. chrHex)
  end
  local ctrl, mask = readPpuRegs()
  print("DATA_PPUCTRL:" .. aStr ..
        " ctrl=0x" .. string.format("%02X", ctrl) ..
        " mask=0x" .. string.format("%02X", mask))
  -- APU registers $4000-$4017 (24 bytes). Most are write-only on real hardware;
  -- emulator shadow state may return non-zero. $4015 (channel enable) is always readable.
  print("DATA_APU:" .. aStr .. " data=" .. readApuHex())
end

local function p4IsPlayable()
  if countNonZero(emu.memType.nesNametableRam, 0, 960) <= CFG.NT_FILL_THRESHOLD then
    return false
  end
  -- Require at least one sprite in the gameplay Y range (100-220).
  -- Title/menu screens have sprites near the top (Y < 100) or off-screen (0xEF).
  for slot = 0, 15 do
    local y = emu.read(slot * 4, emu.memType.nesSpriteRam)
    if y >= 100 and y <= 220 then return true end
  end
  return false
end

local function runPhase4()
  if sub == "init" then
    if #p3CVars == 0 then
      print("DATA_PHASE4:COMPLETE states_captured=0")
      phase = 5; sub = "init"; return
    end
    p4CvIdx = 1; p4ValIdx = 1; p4Captured = 0; LEVEL_CAND = nil
    sub = "restore"
  end

  if sub == "restore" then
    -- Advance to next valid (cv, value) pair
    while p4CvIdx <= #p3CVars do
      if p4ValIdx <= #p3CVars[p4CvIdx].values then break end
      p4CvIdx = p4CvIdx + 1; p4ValIdx = 1
    end
    if p4CvIdx > #p3CVars then
      print("DATA_PHASE4:COMPLETE states_captured=" .. p4Captured)
      phase = 5; sub = "init"; return
    end
    doSavestate("load", BASELINE)
    sub = "write_val"; return
  end

  if sub == "write_val" then
    if ssPending then return end
    local cv  = p3CVars[p4CvIdx]
    local val = cv.values[p4ValIdx]
    emu.write(cv.addr, val, emu.memType.nesInternalRam)
    waitUntil = frame + CFG.P4_LOAD_FRAMES
    sub = "wait_load"; return
  end

  if sub == "wait_load" then
    if frame < waitUntil then return end
    local cv  = p3CVars[p4CvIdx]
    local val = cv.values[p4ValIdx]
    p4CaptureState(cv.addr, val)
    p4Captured = p4Captured + 1
    if LEVEL_CAND == nil and p4IsPlayable() then
      LEVEL_CAND = {addr=cv.addr, val=val}
      -- Save PHYSICS_BASE here: the game loaded this level normally, so Mario is at
      -- his spawn point with zero velocity (not contaminated by our control-test inputs).
      -- This is a much cleaner starting point for physics tests than p1BaselineState.
      doSavestate("save")
      sub = "save_physics_base"; return
    end
    p4OamCount = 0; p4NextOam = frame
    sub = "record_oam"; return
  end

  if sub == "save_physics_base" then
    if ssPending then return end
    PHYSICS_BASE = ssResult
    print("STATUS_PHASE4:PHYSICS_BASE saved at frame=" .. frame)
    local cv  = p3CVars[p4CvIdx]
    local val = cv.values[p4ValIdx]
    p4OamCount = 0; p4NextOam = frame
    sub = "record_oam"; return
  end

  if sub == "record_oam" then
    if frame >= p4NextOam then
      local cv  = p3CVars[p4CvIdx]
      local val = cv.values[p4ValIdx]
      print("DATA_OAM_FRAME:addr=0x" .. string.format("%04X", cv.addr) ..
            " value=" .. val .. " frame=" .. p4OamCount ..
            " data=" .. readHex(emu.memType.nesSpriteRam, 0, 256))
      print("DATA_APU_FRAME:addr=0x" .. string.format("%04X", cv.addr) ..
            " value=" .. val .. " frame=" .. p4OamCount .. " data=" .. readApuHex())
      p4OamCount = p4OamCount + 1
      p4NextOam  = frame + CFG.P4_OAM_INTERVAL
    end
    if p4OamCount >= CFG.P4_OAM_COUNT then
      p4ValIdx = p4ValIdx + 1; sub = "restore"
    end
    return
  end
end

-- ============================================================
-- PHASE 5: ORACLE-BASED PHYSICS SAMPLING  (Session 13 rewrite)
--
-- Approach: instead of settling from a savestate (prone to velocity contamination),
-- use oracle RAM writes to place the player at exact positions with all physics
-- state zeroed. No settle sequence needed — initial conditions are known exactly.
--
-- Per-test flow:
--   1. Load BASELINE savestate
--   2. Wait 3 frames for loadstate to settle
--   3. Oracle write: set X = safeX, Y = groundY (or groundY-48 for air tests)
--      Zero velocity range P5_VEL_RANGE ($0050-$006F) — covers all NES player physics
--   4. Clear input, step frames recording (X,Y) each frame
--
-- Velocity discovery (runs once before tests):
--   - Place on ground, zero vel range, step 1 frame Right → scan for bytes that
--     now contain delta_x. These are X velocity addresses.
--   - Place in air, zero vel range, step 1 frame no input → scan for bytes that
--     now contain delta_y. These are Y velocity addresses.
--
-- Analysis inline after each test:
--   GRAVITY    → initial fall velocity + gravitational acceleration (px/frame²)
--   WALK_RIGHT → max walk speed (px/frame, frame where delta stabilises)
--   JUMP_HOLD  → jump curve summary (peak height, airtime)
-- ============================================================

-- targetY = nil means "don't write Y" — used for ground tests where writing the
-- actual Y address ($00CE in SMB1) triggers unexpected game behavior (internal
-- timers / un-pause sequences). For ground tests Mario stands at his natural Y;
-- for air tests (GRAVITY) we write Y explicitly to place him above ground.
local function p5OracleWrite(targetX, targetY)
  if p1PlayerXAddr >= 0 then emu.write(p1PlayerXAddr, targetX, emu.memType.nesInternalRam) end
  if targetY ~= nil and p1PlayerYAddr >= 0 then
    emu.write(p1PlayerYAddr, targetY, emu.memType.nesInternalRam)
  end
  for addr = P5_VEL_RANGE.lo, P5_VEL_RANGE.hi do
    emu.write(addr, 0, emu.memType.nesInternalRam)
  end
end

local function p5SignedDelta(a, b)
  local d = b - a
  if d > 128 then d = d - 256 elseif d < -128 then d = d + 256 end
  return d
end

local function runPhase5()
  if p1PlayerXAddr < 0 then
    print("STATUS_PHASE5:SKIP no player X RAM address found")
    print("DATA_PHASE5:COMPLETE tests=0")
    print("DATA_EXTRACTION:COMPLETE")
    emu.stop(); return
  end

  -- ----------------------------------------------------------------
  -- init → load BASELINE
  -- ----------------------------------------------------------------
  if sub == "init" then
    -- p1BaselineState: confirmed gameplay state (40-frame post-Start/A settle).
    -- Writing Y to the actual player address ($00CE) triggers unexpected game behavior
    -- (internal timers / un-pause sequences). Using p1BaselineState lets Mario stand
    -- at his natural Y; oracle only writes Y for AIR tests where we need to place him
    -- above ground. For ground tests, we READ groundY from RAM without writing it.
    LEVEL_STATE = p1BaselineState
    print("STATUS_PHASE5:oracle_mode x_addr=" .. string.format("0x%04X", p1PlayerXAddr) ..
          " y_addr=" .. (p1PlayerYAddr >= 0 and string.format("0x%04X", p1PlayerYAddr) or "none") ..
          " vel_range=" .. string.format("0x%04X-0x%04X", P5_VEL_RANGE.lo, P5_VEL_RANGE.hi))
    doSavestate("load", LEVEL_STATE)
    p5FrameN = 0; sub = "y_verify_settle"; return
  end

  -- ----------------------------------------------------------------
  -- y_verify_settle: 60 frames after BASELINE load, read groundY and
  -- safeX, take zero-page ground snapshot. Then jump to verify or
  -- discover the player Y RAM address.
  -- base>128 filter: NES platform ground Y is always >128; counters/
  -- timers cycle 0..128, so requiring ground_val>128 eliminates them.
  -- ----------------------------------------------------------------
  if sub == "y_verify_settle" then
    clearInput()
    if ssPending then return end
    p5FrameN = p5FrameN + 1
    if p5FrameN >= 60 then
      p5SafeX   = (p1PlayerXAddr >= 0) and emu.read(p1PlayerXAddr, emu.memType.nesInternalRam) or 128
      p5SafeX   = math.max(p5SafeX, 80)   -- keep away from left wall/edge
      p5GroundY = (p1PlayerYAddr >= 0) and emu.read(p1PlayerYAddr, emu.memType.nesInternalRam) or 200
      for i = 0, 255 do p5YVerifyGround[i] = emu.read(i, emu.memType.nesInternalRam) end
      print("STATUS_PHASE5:ground_ref safeX=" .. p5SafeX .. " groundY=" .. p5GroundY ..
            " (pre-verify; y_addr=" ..
            (p1PlayerYAddr >= 0 and string.format("0x%04X", p1PlayerYAddr) or "none") .. ")")
      p5FrameN = 0; sub = "y_verify_jump"
    end
    return
  end

  -- ----------------------------------------------------------------
  -- y_verify_jump: hold A for 15 frames; snapshot zero-page at frame 10
  -- (well into the jump arc before peak velocity fades).
  -- ----------------------------------------------------------------
  if sub == "y_verify_jump" then
    p5FrameN = p5FrameN + 1
    emu.setInput({right=false,left=false,up=false,down=false,
                  a=true,b=false,start=false,select=false}, 0)
    if p5FrameN == 10 then
      for i = 0, 255 do p5YVerifyAirSnap[i] = emu.read(i, emu.memType.nesInternalRam) end
    end
    if p5FrameN >= 15 then
      clearInput(); sub = "y_verify_read"
    end
    return
  end

  -- ----------------------------------------------------------------
  -- y_verify_read: find zero-page address with largest upward movement
  -- (ground_val > 128 AND ground_val - air_val > 0). Updates
  -- p1PlayerYAddr and p5GroundY if a better candidate is found.
  -- Reloads BASELINE for clean vel_discover start.
  -- ----------------------------------------------------------------
  if sub == "y_verify_read" then
    clearInput()
    local bestAddr, bestDelta = -1, 0
    for addr = 0, 255 do
      local gv = p5YVerifyGround[addr]
      local av = p5YVerifyAirSnap[addr]
      if gv > 128 then                     -- filter timers/counters (0..128 range)
        local delta = gv - av              -- positive = Y decreased = player moved up
        -- Require plausible jump magnitude: 4..80px in 10 frames.
        -- < 4: not a real jump movement (noise).
        -- > 80: timer/counter wrapping to 0, not actual player movement
        --   (e.g., SMB1 $0007 is a frame counter that reads 154 at ground and 0 mid-jump).
        if delta >= 4 and delta < 80 and delta > bestDelta then
          bestDelta = delta; bestAddr = addr
        end
      end
    end
    local prevStr = (p1PlayerYAddr >= 0) and string.format("0x%04X", p1PlayerYAddr) or "none"
    if bestAddr >= 0 then
      if bestAddr ~= p1PlayerYAddr then
        print("STATUS_PHASE5:Y_VERIFY corrected y_addr=" .. prevStr ..
              " -> 0x" .. string.format("%04X", bestAddr) ..
              " (jump_delta=" .. bestDelta .. ")")
        p1PlayerYAddr = bestAddr
        p5GroundY     = p5YVerifyGround[bestAddr]
      else
        print("STATUS_PHASE5:Y_VERIFY confirmed y_addr=" .. prevStr ..
              " (jump_delta=" .. bestDelta .. ")")
      end
    else
      print("STATUS_PHASE5:Y_VERIFY FAILED no jump detected; keeping y_addr=" .. prevStr)
    end
    -- Reload BASELINE for a clean state before velocity discovery
    doSavestate("load", LEVEL_STATE)
    p5FrameN = 0; sub = "read_ground_wait"; return
  end

  -- ----------------------------------------------------------------
  -- read_ground_wait: brief pause after BASELINE reload.
  -- safeX/groundY already established in y_verify_settle above.
  -- ----------------------------------------------------------------
  if sub == "read_ground_wait" then
    clearInput()
    if ssPending then return end
    p5FrameN = p5FrameN + 1
    if p5FrameN >= 3 then
      sub = "vel_discover_x"
    end
    return
  end

  -- ----------------------------------------------------------------
  -- vel_discover_x: oracle-place on ground, zero vel range, step 1 frame Right.
  -- Velocity bytes: started at 0, now contain a value matching delta_x.
  -- velocity = delta_position (game stores velocity as the value it adds to position).
  -- ----------------------------------------------------------------
  if sub == "vel_discover_x" then
    clearInput()
    p5OracleWrite(p5SafeX, p5GroundY)
    for i = 0, 2047 do p5VelDiscPre[i] = emu.read(i, emu.memType.nesInternalRam) end
    emu.setInput({right=true,left=false,up=false,down=false,
                  a=false,b=false,start=false,select=false}, 0)
    sub = "vel_discover_x_read"; return
  end

  if sub == "vel_discover_x_read" then
    clearInput()
    local newX = emu.read(p1PlayerXAddr, emu.memType.nesInternalRam)
    local dX = p5SignedDelta(p5VelDiscPre[p1PlayerXAddr], newX)
    p5XVelAddrs = {}
    local nonzero = {}
    for addr = P5_VEL_RANGE.lo, P5_VEL_RANGE.hi do
      local v = emu.read(addr, emu.memType.nesInternalRam)
      if v ~= 0 then
        nonzero[#nonzero+1] = string.format("0x%04X=%d", addr, v)
        if addr ~= p1PlayerXAddr and addr ~= p1PlayerYAddr then
          -- Match absolute delta in both signed and unsigned form
          if v == dX or v == (256 - dX) then
            p5XVelAddrs[#p5XVelAddrs+1] = {addr=addr, val=v}
          end
        end
      end
    end
    local xStr = {}
    for _, e in ipairs(p5XVelAddrs) do xStr[#xStr+1] = string.format("0x%04X=%d", e.addr, e.val) end
    print("STATUS_PHASE5:vel_disc_x delta_x=" .. dX ..
          " vel_candidates=[" .. table.concat(xStr, ",") .. "]")
    print("STATUS_PHASE5:vel_range_nonzero=[" .. table.concat(nonzero, ",") .. "]")
    sub = "vel_discover_y"; return
  end

  -- ----------------------------------------------------------------
  -- vel_discover_y: oracle-place 48px above ground, zero vel range,
  -- step 1 frame no input. Find bytes now containing delta_y (gravity).
  -- ----------------------------------------------------------------
  if sub == "vel_discover_y" then
    clearInput()
    p5OracleWrite(p5SafeX, p5GroundY - 48)
    for i = 0, 2047 do p5VelDiscPre[i] = emu.read(i, emu.memType.nesInternalRam) end
    sub = "vel_discover_y_read"; return
  end

  if sub == "vel_discover_y_read" then
    clearInput()
    local newY = (p1PlayerYAddr >= 0) and emu.read(p1PlayerYAddr, emu.memType.nesInternalRam) or 0
    local dY = (p1PlayerYAddr >= 0) and p5SignedDelta(p5VelDiscPre[p1PlayerYAddr], newY) or 0
    p5YVelAddrs = {}
    local nonzero = {}
    for addr = P5_VEL_RANGE.lo, P5_VEL_RANGE.hi do
      local v = emu.read(addr, emu.memType.nesInternalRam)
      if v ~= 0 then
        nonzero[#nonzero+1] = string.format("0x%04X=%d", addr, v)
        if addr ~= p1PlayerXAddr and addr ~= p1PlayerYAddr then
          if v == dY or v == (256 - dY) then
            p5YVelAddrs[#p5YVelAddrs+1] = {addr=addr, val=v}
          end
        end
      end
    end
    local yStr = {}
    for _, e in ipairs(p5YVelAddrs) do yStr[#yStr+1] = string.format("0x%04X=%d", e.addr, e.val) end
    print("STATUS_PHASE5:vel_disc_y delta_y=" .. dY ..
          " vel_candidates=[" .. table.concat(yStr, ",") .. "]")
    print("STATUS_PHASE5:vel_range_nonzero_y=[" .. table.concat(nonzero, ",") .. "]")
    -- Emit structured velocity address record for downstream manifest builder
    local allVel = {}
    for _, e in ipairs(p5XVelAddrs) do allVel[#allVel+1] = string.format("x:0x%04X", e.addr) end
    for _, e in ipairs(p5YVelAddrs) do allVel[#allVel+1] = string.format("y:0x%04X", e.addr) end
    print("DATA_PHYSICS_VEL:x_pos=0x" .. string.format("%04X", p1PlayerXAddr) ..
          " y_pos=" .. (p1PlayerYAddr >= 0 and "0x" .. string.format("%04X", p1PlayerYAddr) or "none") ..
          " vel_range=0x" .. string.format("%04X", P5_VEL_RANGE.lo) ..
          "-0x" .. string.format("%04X", P5_VEL_RANGE.hi) ..
          " discovered=[" .. table.concat(allVel, ",") .. "]")
    p5TestIdx = 1; sub = "run_test"; return
  end

  -- ----------------------------------------------------------------
  -- run_test: load BASELINE + oracle write → record frames.
  -- No settle sequence — oracle write establishes exact initial conditions.
  -- ----------------------------------------------------------------
  if sub == "run_test" then
    if p5TestIdx > #P5_TESTS then
      print("DATA_PHASE5:COMPLETE tests=" .. (p5TestIdx - 1))
      print("DATA_EXTRACTION:COMPLETE")
      emu.stop(); return
    end
    doSavestate("load", LEVEL_STATE)
    p5FrameN = 0; p5Positions = {}
    sub = "oracle_load_wait"; return
  end

  -- 3 frames after loadstate to stabilize, then oracle-write position.
  if sub == "oracle_load_wait" then
    clearInput()
    if ssPending then return end
    p5FrameN = p5FrameN + 1
    if p5FrameN >= 3 then
      local test = P5_TESTS[p5TestIdx]
      -- Read current natural Y from RAM BEFORE any oracle write.
      -- For ground tests: don't write Y — writing $00CE directly triggers
      -- unexpected game behavior (un-pause / timer sequences). Mario stands at
      -- whatever Y the loaded state gives him; we read it for the air-test offset.
      -- For air tests: write Y = groundY - 48 to place Mario above ground.
      local naturalY = (p1PlayerYAddr >= 0) and emu.read(p1PlayerYAddr, emu.memType.nesInternalRam) or p5GroundY
      p5GroundY = naturalY   -- refresh groundY from this load so air tests use correct offset
      local targetY = nil    -- ground tests: don't write Y
      if test.air then targetY = p5GroundY - 48 end
      p5OracleWrite(p5SafeX, targetY)
      clearInput()
      local ax = (p1PlayerXAddr >= 0) and emu.read(p1PlayerXAddr, emu.memType.nesInternalRam) or -1
      local ay = (p1PlayerYAddr >= 0) and emu.read(p1PlayerYAddr, emu.memType.nesInternalRam) or -1
      local tyStr = (targetY ~= nil) and tostring(targetY) or "none(ground)"
      print("STATUS_PHASE5:TestStart=" .. test.name ..
            " oracle_x=" .. ax .. " oracle_y=" .. ay ..
            " target_y=" .. tyStr .. " air=" .. tostring(test.air))
      p5FrameN = 0; sub = "run_test_frames"
    end
    return
  end

  if sub == "run_test_frames" then
    local test = P5_TESTS[p5TestIdx]
    p5FrameN = p5FrameN + 1
    if p5FrameN > test.frames then
      local posStr = table.concat(p5Positions, ";")
      print("DATA_PHYSICS:test=" .. test.name ..
            " frames=" .. test.frames .. " positions=" .. posStr)

      -- Inline analysis: derive physics constants from position sequence.
      local xs, ys = {}, {}
      for _, pos in ipairs(p5Positions) do
        local px, py = pos:match("(-?%d+),(-?%d+)")
        if px then xs[#xs+1] = tonumber(px); ys[#ys+1] = tonumber(py) end
      end

      if test.name == "GRAVITY" and #ys >= 3 then
        local dy1 = p5SignedDelta(ys[1], ys[2])
        local dy2 = p5SignedDelta(ys[2], ys[3])
        local grav = dy2 - dy1
        local termVel = dy1
        for i = 2, #ys - 1 do
          local dy = p5SignedDelta(ys[i], ys[i+1])
          if dy > termVel then termVel = dy end
        end
        print("ANALYSIS_GRAVITY:dy1=" .. dy1 .. " dy2=" .. dy2 ..
              " accel_px_per_frame2=" .. grav ..
              " terminal_vel_approx=" .. termVel)

      elseif test.name == "WALK_RIGHT" and #xs >= 2 then
        local maxDx, stableFrame = 0, 0
        for i = 2, #xs do
          local dx = p5SignedDelta(xs[i-1], xs[i])
          if dx > maxDx then maxDx = dx end
        end
        for i = 2, #xs do
          local dx = p5SignedDelta(xs[i-1], xs[i])
          if dx == maxDx and stableFrame == 0 then stableFrame = i end
        end
        print("ANALYSIS_WALK:max_speed_px_per_frame=" .. maxDx ..
              " plateau_start_frame=" .. stableFrame)

      elseif test.name == "JUMP_HOLD" and #ys >= 2 then
        local startY = ys[1]
        local peakY, peakFrame = startY, 1
        for i = 1, #ys do if ys[i] < peakY then peakY = ys[i]; peakFrame = i end end
        local airtime = #ys
        for i = peakFrame, #ys do
          if math.abs(p5SignedDelta(startY, ys[i])) <= 2 then airtime = i; break end
        end
        print("ANALYSIS_JUMP_HOLD:peak_height_px=" .. p5SignedDelta(peakY, startY) ..
              " peak_frame=" .. peakFrame .. " airtime_frames=" .. airtime)

      elseif test.name == "JUMP_TAP" and #ys >= 2 then
        local startY = ys[1]
        local peakY = startY
        for i = 1, #ys do if ys[i] < peakY then peakY = ys[i] end end
        print("ANALYSIS_JUMP_TAP:peak_height_px=" .. p5SignedDelta(peakY, startY))
      end

      p5TestIdx = p5TestIdx + 1; sub = "run_test"; return
    end

    emu.setInput(test.inputFn(p5FrameN), 0)
    local px = (p1PlayerXAddr >= 0) and emu.read(p1PlayerXAddr, emu.memType.nesInternalRam) or 0
    local py = (p1PlayerYAddr >= 0) and emu.read(p1PlayerYAddr, emu.memType.nesInternalRam) or 0
    table.insert(p5Positions, px .. "," .. py)
    return
  end
end

-- ============================================================
-- MAIN FRAME CALLBACK
-- ============================================================

emu.addEventCallback(function()
  frame = frame + 1

  if frame > CFG.MAX_TOTAL_FRAMES then
    print("ERROR_TIMEOUT:Frame limit exceeded at frame=" .. frame)
    print("DATA_EXTRACTION:INCOMPLETE")
    emu.stop(); return
  end

  if    phase == 1 then runPhase1()
  elseif phase == 2 then runPhase2()
  elseif phase == 3 then runPhase3()
  elseif phase == 4 then runPhase4()
  elseif phase == 5 then runPhase5()
  end
end, emu.eventType.startFrame)
