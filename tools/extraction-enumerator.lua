-- extraction-enumerator.lua
-- Session UE-1: Universal NES content extraction via RAM mutation
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
  -- Phase 1: player-control detection
  P1_NO_SPRITE_MIN_FRAME = 300,   -- don't watch for no-sprite before this frame
                                   -- Prevents false positives during OAM initialization
                                   -- (frames 0-3 have zeros = no sprites) and title animation
  P1_NO_SPRITE_THRESHOLD = 10,   -- consecutive no-sprite frames required to trigger Start press
                                   -- 10 filters brief OAM clears between demo cycles (~3 frames)
                                   -- while catching the title waiting screen (hundreds of frames)
  P1_INITIAL_DELAY      = 4800,   -- fallback: fixed-interval presses after this frame
                                   -- Handles games whose title always shows sprites (no-sprite
                                   -- trigger never fires). At 1000x speed, ≈ 0.08 real seconds.
  P1_START_INTERVAL     = 60,     -- frames between fallback Start presses
  P1_WAIT_AFTER_START   = 300,    -- frames to wait after Start before testing control
                                   -- SMB title card is ~180 frames; 300 safely clears it
  P1_RIGHT_FRAMES       = 15,     -- frames to hold Right during control test
  P1_MOVE_THRESHOLD     = 5,      -- pixels of X movement required to confirm control
  P1_MAX_ATTEMPTS       = 12,     -- max Start presses before forced fallback

  NT_FILL_THRESHOLD     = 576,    -- non-zero nametable tiles (60% of 960)

  SNAP_COUNT            = 5,
  SNAP_INTERVAL         = 60,     -- frames between RAM snapshots (Phase 2)

  P3_FRAMES_PER_VAL     = 3,      -- frames to wait after writing test value
  P3_SETTLE_FRAMES      = 1,      -- frames to wait after restoring original
  P3_SAMPLE_STEP        = 32,     -- step through values 0..255 in Phase 3 (1=all 256, 32=8 values)
  P3_UNIQUE_THRESHOLD   = 3,      -- min unique VRAM hashes to qualify as content var
  P3_PROGRESS_INTERVAL  = 50,

  P4_LOAD_FRAMES        = 120,    -- frames to wait for level load
  P4_OAM_INTERVAL       = 10,     -- frames between OAM animation snapshots
  P4_OAM_COUNT          = 10,     -- total OAM snapshots per state

  P5_PLAYER_ID_SAMPLES  = 10,     -- (unused; player slot reused from Phase 1)
  P5_PLAYER_ID_INTERVAL = 10,     -- (unused)

  MAX_TOTAL_FRAMES      = 700000, -- safety limit (~12 min at 1000x)
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
  cbRef = emu.addMemoryCallback(function()
    if op == "save" then
      ssResult = emu.createSavestate()
    else
      emu.loadSavestate(data)
      ssResult = true
    end
    ssPending = false
    emu.removeMemoryCallback(cbRef, emu.callbackType.exec, 0x8000, 0xFFFF)
  end, emu.callbackType.exec, 0x8000, 0xFFFF)
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

-- ============================================================
-- GLOBAL STATE
-- ============================================================

local frame     = 0
local phase     = 1
local sub       = "init"
local waitUntil = 0

-- Phase 1
local BASELINE          = nil
local p1Attempts        = 0    -- number of Start presses tried
local p1CandSlot        = -1   -- OAM slot of candidate sprite during control test
local p1CandX0          = 0    -- candidate sprite X at start of directional test
local p1RightFrames     = 0    -- frames Right has been held in current test
local p1LeftFrames      = 0    -- frames Left has been held in current test
local p1PreTestState    = nil  -- savestate captured before directional test (becomes BASELINE)
local p1DxRight         = 0    -- stored dx_right for logging
local p1NoSpriteFrames  = 0    -- consecutive frames with no sprite in Y=50-200 (title screen detector)

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
local LEVEL_CAND = nil  -- {addr, val} for physics phase
local p4ChrCache = nil  -- {hex, sz, src} — CHR-ROM is fixed; capture once

-- Phase 5
local LEVEL_STATE = nil
local p5Slot    = -1
local p5TestIdx = 1
local p5FrameN  = 0
local p5Positions = {}

-- Physics test definitions. inputFn(f) returns input for frame f (1-based).
local P5_TESTS = {
  { name="WALK_RIGHT",   frames=120, inputFn=function(f)
      return {right=true,left=false,up=false,down=false,a=false,b=false,start=false,select=false}
    end },
  { name="FRICTION",     frames=120, inputFn=function(f)
      local r = (f <= 60)
      return {right=r,left=false,up=false,down=false,a=false,b=false,start=false,select=false}
    end },
  { name="JUMP_TAP",     frames=90,  inputFn=function(f)
      return {right=false,left=false,up=false,down=false,a=(f==1),b=false,start=false,select=false}
    end },
  { name="JUMP_HOLD",    frames=90,  inputFn=function(f)
      return {right=false,left=false,up=false,down=false,a=(f<=30),b=false,start=false,select=false}
    end },
  { name="RUNNING_JUMP", frames=120, inputFn=function(f)
      local a = (f <= 30)
      return {right=true,left=false,up=false,down=false,a=a,b=false,start=false,select=false}
    end },
  { name="DUCK",         frames=60,  inputFn=function(f)
      return {right=false,left=false,up=false,down=(f<=30),a=false,b=false,start=false,select=false}
    end },
}

-- ============================================================
-- PHASE 1: BOOT TO GAMEPLAY — PLAYER CONTROL DETECTION
--
-- Strategy: wait for the title screen (no sprite in Y=50-200 for 3+ frames),
-- then press Start. After P1_WAIT_AFTER_START frames, run a BIDIRECTIONAL test:
--   1. Find a sprite with Y in 50-200 (candidate player sprite).
--   2. Record its X position. Save pre-test state.
--   3. Hold Right for P1_RIGHT_FRAMES frames. Check dx_right > P1_MOVE_THRESHOLD.
--   4. Restore pre-test state. Hold Left for P1_RIGHT_FRAMES frames.
--   5. Check dx_left < -P1_MOVE_THRESHOLD.
--   Both must pass → real gameplay. Either failing → return to boot.
--
-- WHY NO-SPRITE TRIGGER: SMB1's attract demo always has Mario visible in OAM
-- (Y=176). The title screen has no player sprite. Pressing Start at the first
-- no-sprite frame reliably hits the title waiting screen and starts actual gameplay,
-- rather than restarting the attract demo.
--
-- WHY BIDIRECTIONAL: The attract demo moves Mario right with pre-recorded input.
-- Pressing Right shows dx > 0 (false positive). Left test confirms: demo can't
-- respond left when scripted right.
--
-- Fallback: after P1_INITIAL_DELAY frames, also press Start at fixed intervals
-- (handles games whose title screen always has sprites).
-- After P1_MAX_ATTEMPTS → save BASELINE as fallback (no confirmed control).
-- ============================================================

local function runPhase1()
  if sub == "init" then sub = "boot" end

  -- ---- BOOT: wait for title screen, then press Start ----
  --
  -- PRIMARY TRIGGER: "no sprite in Y=50-200 for 3+ consecutive frames"
  -- During attract/demo mode, the player character is always visible in OAM
  -- (Y=50-200). The title screen has NO player sprite in that range.
  -- So 3 consecutive no-sprite frames reliably signals the title waiting screen.
  --
  -- FALLBACK: after P1_INITIAL_DELAY frames, press Start every P1_START_INTERVAL
  -- regardless. This handles games where the title screen has sprites, or where
  -- the demo lasts so long that we never see a no-sprite window.
  if sub == "boot" then
    if p1Attempts >= CFG.P1_MAX_ATTEMPTS then
      print("STATUS_PHASE1:Fallback save (control not confirmed) frame=" .. frame)
      sub = "saving"; doSavestate("save"); return
    end
    -- Check for sprite in Y=50-200
    local hasSpriteInRange = false
    for slot = 0, 15 do
      local y = emu.read(slot * 4, emu.memType.nesSpriteRam)
      if y >= 50 and y <= 200 then hasSpriteInRange = true; break end
    end
    if frame >= CFG.P1_NO_SPRITE_MIN_FRAME then
      if not hasSpriteInRange then
        p1NoSpriteFrames = p1NoSpriteFrames + 1
      else
        p1NoSpriteFrames = 0
      end
    else
      p1NoSpriteFrames = 0  -- skip early frames (OAM uninitialized, title animation)
    end
    -- Primary: N consecutive no-sprite frames → title screen → press Start
    if p1NoSpriteFrames >= CFG.P1_NO_SPRITE_THRESHOLD then
      p1NoSpriteFrames = 0
      print("STATUS_PHASE1:Title screen detected (no sprite) frame=" .. frame)
      emu.setInput({right=false,left=false,up=false,down=false,
                    a=false,b=false,start=true,select=false}, 0)
      p1Attempts = p1Attempts + 1
      waitUntil = frame + CFG.P1_WAIT_AFTER_START
      sub = "wait_post_start"
      return
    end
    -- Fallback: after a long delay, also try fixed-interval Start presses
    -- (handles games where title screen always has sprites, or very long demos)
    if frame >= CFG.P1_INITIAL_DELAY and frame % CFG.P1_START_INTERVAL == 0 then
      print("STATUS_PHASE1:Fallback Start press frame=" .. frame)
      emu.setInput({right=false,left=false,up=false,down=false,
                    a=false,b=false,start=true,select=false}, 0)
      p1Attempts = p1Attempts + 1
      waitUntil = frame + CFG.P1_WAIT_AFTER_START
      sub = "wait_post_start"
      return
    end
    clearInput()
    return
  end

  -- ---- WAIT 60 FRAMES after Start press ----
  if sub == "wait_post_start" then
    clearInput()
    if frame < waitUntil then return end
    -- Find a candidate sprite with Y in 50-200
    p1CandSlot = -1
    for slot = 0, 15 do
      local y = emu.read(slot * 4, emu.memType.nesSpriteRam)
      if y >= 50 and y <= 200 then
        p1CandSlot = slot
        p1CandX0   = emu.read(slot * 4 + 3, emu.memType.nesSpriteRam)
        break
      end
    end
    if p1CandSlot < 0 then
      -- No suitable sprite yet; wait for next Start press
      sub = "boot"; return
    end
    local foundY = emu.read(p1CandSlot * 4, emu.memType.nesSpriteRam)
    print("STATUS_PHASE1:Candidate slot=" .. p1CandSlot ..
          " X=" .. p1CandX0 .. " Y=" .. foundY .. " frame=" .. frame)
    -- Save the state now — this becomes BASELINE if control is confirmed.
    -- Saving before any directional input means BASELINE is always at a clean
    -- standing position with the player sprite visible and controllable.
    doSavestate("save")
    sub = "save_pre_test"
    return
  end

  -- ---- WAIT for pre-test savestate ----
  if sub == "save_pre_test" then
    if ssPending then return end
    p1PreTestState = ssResult
    p1RightFrames  = 0
    sub = "hold_right"
    return
  end

  -- ---- HOLD RIGHT for 15 frames ----
  if sub == "hold_right" then
    emu.setInput({right=true,left=false,up=false,down=false,
                  a=false,b=false,start=false,select=false}, 0)
    p1RightFrames = p1RightFrames + 1
    if p1RightFrames >= CFG.P1_RIGHT_FRAMES then
      sub = "check_right"
    end
    return
  end

  -- ---- CHECK right movement (first leg of bidirectional test) ----
  if sub == "check_right" then
    clearInput()
    local newX = emu.read(p1CandSlot * 4 + 3, emu.memType.nesSpriteRam)
    local dx = newX - p1CandX0
    if dx > 128  then dx = dx - 256 end
    if dx < -128 then dx = dx + 256 end
    if dx > CFG.P1_MOVE_THRESHOLD then
      -- Sprite moved RIGHT (positive dx) — first leg confirmed.
      -- Now restore pre-test state and test Left.
      p1DxRight = dx
      doSavestate("load", p1PreTestState)
      sub = "restore_for_left"
    else
      -- dx ≤ threshold: sprite didn't move right (attract demo or not in gameplay).
      -- Return to boot. Boot will wait for the title screen (no-sprite for 3 frames)
      -- before pressing Start again, ensuring the next attempt hits real gameplay.
      print("STATUS_PHASE1:No rightward movement slot=" .. p1CandSlot ..
            " X0=" .. p1CandX0 .. " newX=" .. newX .. " dx=" .. dx ..
            " attempt=" .. p1Attempts)
      sub = "boot"
    end
    return
  end

  -- ---- RESTORE pre-test state before Left test ----
  if sub == "restore_for_left" then
    if ssPending then return end
    p1LeftFrames = 0
    sub = "hold_left"
    return
  end

  -- ---- HOLD LEFT for 15 frames ----
  if sub == "hold_left" then
    emu.setInput({right=false,left=true,up=false,down=false,
                  a=false,b=false,start=false,select=false}, 0)
    p1LeftFrames = p1LeftFrames + 1
    if p1LeftFrames >= CFG.P1_RIGHT_FRAMES then
      sub = "check_left"
    end
    return
  end

  -- ---- CHECK left movement (second leg — confirms real input responsiveness) ----
  -- Demo/attract mode plays pre-recorded movement. If the demo moves Mario right,
  -- it will fail the left test because demo input is not responsive to our input.
  -- Only real gameplay responds to BOTH right AND left independently.
  if sub == "check_left" then
    clearInput()
    local newX = emu.read(p1CandSlot * 4 + 3, emu.memType.nesSpriteRam)
    local dx = newX - p1CandX0
    if dx > 128  then dx = dx - 256 end
    if dx < -128 then dx = dx + 256 end
    if dx < -CFG.P1_MOVE_THRESHOLD then
      -- Both directions confirmed: real player control (not demo/attract mode)
      print("STATUS_PHASE1:Control confirmed frame=" .. frame ..
            " slot=" .. p1CandSlot ..
            " dx_right=" .. p1DxRight .. " dx_left=" .. dx)
      BASELINE = p1PreTestState
      print("DATA_PHASE1:COMPLETE frame=" .. frame)
      phase = 2; sub = "init"
    else
      -- Moved right but not left → attract/demo mode false positive.
      -- Return to boot. Boot will watch for the title screen (no-sprite detection)
      -- and press Start at the right moment to start actual gameplay.
      print("STATUS_PHASE1:Demo mode (dx_right=" .. p1DxRight ..
            " dx_left=" .. dx .. ") attempt=" .. p1Attempts)
      sub = "boot"
    end
    return
  end

  -- ---- SAVE BASELINE (fallback path: max attempts reached) ----
  if sub == "saving" then
    if ssPending then return end
    BASELINE = ssResult
    print("DATA_PHASE1:COMPLETE frame=" .. frame)
    phase = 2; sub = "init"
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

  -- Classify
  candidates = {}
  for addr = 0, 2047 do
    local v1,v2,v3,v4,v5 = snapshots[1][addr],snapshots[2][addr],
                             snapshots[3][addr],snapshots[4][addr],snapshots[5][addr]
    local isConst  = (v1==v2 and v2==v3 and v3==v4 and v4==v5)
    local isTicker = (v1<v2 and v2<v3 and v3<v4 and v4<v5) or
                     (v1>v2 and v2>v3 and v3>v4 and v4>v5)
      if not isConst and not isTicker then
      table.insert(candidates, addr)
    end
  end

  print("DATA_PHASE2:COMPLETE candidates=" .. #candidates)
  for _, addr in ipairs(candidates) do
    print("DATA_CANDIDATE:addr=0x" .. string.format("%04X", addr))
  end
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
    end
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
-- PHASE 5: PHYSICS SAMPLING
-- ============================================================

local function p5PlayerXY(slot)
  local y = emu.read(slot * 4,     emu.memType.nesSpriteRam) + 1
  local x = emu.read(slot * 4 + 3, emu.memType.nesSpriteRam)
  return x, y
end

local function runPhase5()
  if sub == "init" then
    -- BASELINE is the confirmed-control state from Phase 1.
    -- Use it directly as the level state for physics tests — no wait period.
    -- Waiting N frames after loading BASELINE puts Mario into unpredictable positions
    -- (pipe entries, animation states, etc.). BASELINE is the one state we KNOW
    -- Mario is controllable, standing at a valid position, ready to respond to input.
    LEVEL_STATE = BASELINE
    -- Reuse the OAM slot confirmed in Phase 1's control test.
    p5Slot = p1CandSlot
    print("STATUS_PHASE5:Player slot=" .. p5Slot .. " using BASELINE directly")
    p5TestIdx = 1; sub = "run_test"; return
  end

  if sub == "run_test" then
    if p5TestIdx > #P5_TESTS then
      print("DATA_PHASE5:COMPLETE tests=" .. (p5TestIdx - 1))
      print("DATA_EXTRACTION:COMPLETE")
      emu.stop(); return
    end
    doSavestate("load", LEVEL_STATE)
    p5FrameN = 0; p5Positions = {}
    sub = "run_test_frames"; return
  end

  if sub == "run_test_frames" then
    if ssPending then return end
    local test = P5_TESTS[p5TestIdx]
    p5FrameN = p5FrameN + 1
    if p5FrameN > test.frames then
      local posStr = table.concat(p5Positions, ";")
      print("DATA_PHYSICS:test=" .. test.name ..
            " frames=" .. test.frames .. " positions=" .. posStr)
      p5TestIdx = p5TestIdx + 1; sub = "run_test"; return
    end
    emu.setInput(test.inputFn(p5FrameN), 0)
    local px, py = 0, 0
    if p5Slot >= 0 then px, py = p5PlayerXY(p5Slot) end
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
