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

  P5_PLAYER_ID_SAMPLES  = 10,   -- (unused; player slot reused from Phase 1)
  P5_PLAYER_ID_INTERVAL = 10,   -- (unused)
  P5_WARMUP_FRAMES      = 5,    -- clear-input frames after loadstate before physics test starts
                                -- lets Mesen2 process the loaded state before we apply inputs

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
local p1MidX            = {}   -- mid-test X position (after Right press)
local p1BaselineState   = nil  -- savestate captured at pre-test moment; promoted to BASELINE on confirm

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
local LEVEL_STATE   = nil
local p5Slot        = -1
local p5TestIdx     = 1
local p5FrameN      = 0
local p5Positions   = {}
local p5WarmupCount = 0

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
      end
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

      if foundSlot >= 0 then
        p1CandSlot = foundSlot
        BASELINE   = p1BaselineState
        print("STATUS_PHASE1:Control confirmed cycle=" .. p1CycleNum ..
              " frame=" .. frame .. " slot=" .. foundSlot ..
              " dxRight=" .. foundDxR .. " dxLeft=" .. foundDxL)
        print("DATA_PHASE1:COMPLETE frame=" .. frame)
        phase = 2; sub = "init"
      else
        print("STATUS_PHASE1:No control found cycle=" .. p1CycleNum .. " frame=" .. frame)
        sub = "start_cycle"
      end
    end
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
    p5FrameN = 0; p5Positions = {}; p5WarmupCount = 0
    sub = "warmup"; return
  end

  -- Post-savestate warmup: clear inputs for P5_WARMUP_FRAMES frames.
  -- After loading a savestate in Mesen2, the first frame(s) may not process
  -- setInput correctly (controller poll timing vs. savestate resume point).
  -- Clearing inputs here ensures the game processes real input from a clean state
  -- before the physics test starts.
  if sub == "warmup" then
    if ssPending then clearInput(); return end
    clearInput()
    p5WarmupCount = p5WarmupCount + 1
    if p5WarmupCount >= CFG.P5_WARMUP_FRAMES then
      sub = "run_test_frames"
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
