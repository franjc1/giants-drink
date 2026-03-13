-- oracle-test.lua
-- Validates the "oracle approach": write a RAM address → does the sprite teleport?
--
-- Test sequence (SMB1, player X at $0086):
--   1. Boot to gameplay using Phase 1 bidirectional detection
--   2. Restore pre-test state, settle 60 frames (Mario fully stopped)
--   3. Read RAM $0086 and OAM X for player slot (sanity check: do they match?)
--   4. Write $0086 + 20 to RAM
--   5. Step ONE frame (game processes write)
--   6. Read RAM $0086 and OAM X again
--   7. Step ONE more frame (check for OAM DMA lag)
--   8. Print verdict and stop
--
-- Run:
--   ~/mesen2/Mesen.app/Contents/MacOS/Mesen --testrunner \
--     ~/nes-roms/"Super Mario Bros. (World).nes" \
--     tools/oracle-test.lua

-- ============================================================
-- SAVESTATE MACHINERY
-- Savestates only work inside exec memory callbacks (Mesen2 constraint).
-- doSavestate() registers a one-shot exec callback that runs the op,
-- then removes itself. Result is in ssResult on the next frame.
-- ============================================================

local ssResult  = nil
local ssPending = false

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
    emu.removeMemoryCallback(cbRef, emu.callbackType.exec, 0x0000, 0xFFFF)
  end, emu.callbackType.exec, 0x0000, 0xFFFF)
end

-- ============================================================
-- HELPERS
-- ============================================================

local function clearInput()
  emu.setInput({right=false,left=false,up=false,down=false,
                a=false,b=false,start=false,select=false}, 0)
end

local function oamX(slot)
  return emu.read(slot * 4 + 3, emu.memType.nesSpriteRam)
end

local function oamY(slot)
  return emu.read(slot * 4, emu.memType.nesSpriteRam)
end

local function ramRead(addr)
  return emu.read(addr, emu.memType.nesInternalRam)
end

local function ramWrite(addr, val)
  emu.write(addr, val, emu.memType.nesInternalRam)
end

-- ============================================================
-- STATE
-- ============================================================

local frame      = 0
local phase      = "boot"
local sub        = "start_cycle"

local holdCount  = 0
local cycleNum   = 0

local preX       = {}
local midX       = {}
local playerSlot = -1
local BASELINE   = nil

local settleCount = 0

-- Oracle results
local ramX0, oamX0          = 0, 0   -- before write
local writeVal              = 0
local ramX1, oamX1          = 0, 0   -- after 1 frame
local ramX2, oamX2          = 0, 0   -- after 2 frames

-- ============================================================
-- FRAME CALLBACK
-- ============================================================

emu.addEventCallback(function()
  frame = frame + 1

  -- ----------------------------------------------------------------
  -- PHASE: BOOT
  -- Alternating Start/A cycles, bidirectional movement test.
  -- On confirm: restore BASELINE, settle 60 frames, go to oracle.
  -- ----------------------------------------------------------------
  if phase == "boot" then

    if frame >= 1800 then
      print("ERROR:Boot timeout after " .. frame .. " frames — could not reach gameplay")
      emu.stop(); return
    end

    -- START CYCLE: increment counter, fall through to press_button
    if sub == "start_cycle" then
      cycleNum  = cycleNum + 1
      holdCount = 0
      local btn = (cycleNum % 2 == 1) and "start" or "a"
      print("STATUS_BOOT:Cycle=" .. cycleNum .. " button=" .. btn .. " frame=" .. frame)
      sub = "press_button"
      -- fall through
    end

    -- PRESS BUTTON for 10 frames
    if sub == "press_button" then
      if cycleNum % 2 == 1 then
        emu.setInput({start=true, right=false,left=false,up=false,down=false,a=false,b=false,select=false}, 0)
      else
        emu.setInput({a=true, right=false,left=false,up=false,down=false,start=false,b=false,select=false}, 0)
      end
      holdCount = holdCount + 1
      if holdCount >= 10 then holdCount = 0; sub = "wait_after_press" end
      return
    end

    -- WAIT 40 FRAMES, then read pre-test OAM X, save state
    if sub == "wait_after_press" then
      clearInput()
      holdCount = holdCount + 1
      if holdCount >= 40 then
        for s = 0, 63 do preX[s] = oamX(s) end
        doSavestate("save")
        holdCount = 0
        sub = "wait_save"
      end
      return
    end

    if sub == "wait_save" then
      clearInput()
      if ssPending then return end
      BASELINE  = ssResult
      holdCount = 0
      sub       = "hold_right"
      return
    end

    -- HOLD RIGHT 10 frames
    if sub == "hold_right" then
      emu.setInput({right=true,left=false,up=false,down=false,a=false,b=false,start=false,select=false}, 0)
      holdCount = holdCount + 1
      if holdCount >= 10 then
        for s = 0, 63 do midX[s] = oamX(s) end
        holdCount = 0
        sub = "hold_left"
      end
      return
    end

    -- HOLD LEFT 10 frames, then evaluate
    if sub == "hold_left" then
      emu.setInput({right=false,left=true,up=false,down=false,a=false,b=false,start=false,select=false}, 0)
      holdCount = holdCount + 1
      if holdCount >= 10 then
        clearInput()
        local found = -1
        for s = 0, 63 do
          local dxR = midX[s] - preX[s]
          if dxR > 128 then dxR = dxR - 256 end; if dxR < -128 then dxR = dxR + 256 end
          local dxL = oamX(s) - midX[s]
          if dxL > 128 then dxL = dxL - 256 end; if dxL < -128 then dxL = dxL + 256 end
          if dxR > 0 and dxL < 0 then
            found = s
            print("STATUS_BOOT:Gameplay confirmed cycle=" .. cycleNum ..
                  " frame=" .. frame .. " slot=" .. s ..
                  " dxR=" .. dxR .. " dxL=" .. dxL)
            break
          end
        end
        if found >= 0 then
          playerSlot = found
          -- Restore BASELINE (pre-directional-test) to get Mario stopped cleanly
          doSavestate("load", BASELINE)
          holdCount = 0
          sub = "restore_wait"
        else
          print("STATUS_BOOT:No player found cycle=" .. cycleNum)
          sub = "start_cycle"
        end
      end
      return
    end

    if sub == "restore_wait" then
      clearInput()
      if ssPending then return end
      holdCount = 0
      sub = "settle"
      return
    end

    -- SETTLE 60 frames: let Mario fully stop before oracle test
    if sub == "settle" then
      clearInput()
      settleCount = settleCount + 1
      if settleCount >= 60 then
        print("STATUS_BOOT:Settled. Player slot=" .. playerSlot ..
              " OAM.X=" .. oamX(playerSlot) .. " OAM.Y=" .. oamY(playerSlot) ..
              " RAM[0086]=" .. ramRead(0x0086))
        phase = "oracle"
        sub   = "read_initial"
      end
      return
    end

  end  -- phase == "boot"

  -- ----------------------------------------------------------------
  -- PHASE: ORACLE
  -- Step 1 (read_initial):  read RAM $0086 + OAM X, write +20, go to step_frame1
  -- Step 2 (step_frame1):   read after 1 game frame
  -- Step 3 (step_frame2):   read after 2 game frames, print verdict, stop
  -- ----------------------------------------------------------------
  if phase == "oracle" then

    if sub == "read_initial" then
      clearInput()

      ramX0 = ramRead(0x0086)
      oamX0 = oamX(playerSlot)

      print("ORACLE:Step1_Initial  RAM[0086]=" .. ramX0 ..
            "  OAM[slot" .. playerSlot .. "].X=" .. oamX0)

      -- Sanity: RAM and OAM X should be close (within ~8px, accounting for sprite offset)
      local diff = math.abs(ramX0 - oamX0)
      if diff <= 8 then
        print("ORACLE:Sanity=PASS  difference=" .. diff .. "px (expected <=8)")
      else
        print("ORACLE:Sanity=WARNING  RAM/OAM difference=" .. diff .. "px — addresses may not match")
      end

      -- Write $0086 + 20 (clamp to 235 so sprite stays on screen)
      writeVal = math.min(ramX0 + 20, 235)
      ramWrite(0x0086, writeVal)
      print("ORACLE:Step2_Write  RAM[0086]<-" .. writeVal ..
            "  (was " .. ramX0 .. ", delta=+" .. (writeVal - ramX0) .. ")")

      sub = "step_frame1"
      return
    end

    -- After 1 frame of game processing
    if sub == "step_frame1" then
      clearInput()
      ramX1 = ramRead(0x0086)
      oamX1 = oamX(playerSlot)
      print("ORACLE:Step3_Frame1  RAM[0086]=" .. ramX1 ..
            "  OAM[slot" .. playerSlot .. "].X=" .. oamX1)
      sub = "step_frame2"
      return
    end

    -- After 2 frames of game processing — print full verdict
    if sub == "step_frame2" then
      clearInput()
      ramX2 = ramRead(0x0086)
      oamX2 = oamX(playerSlot)
      print("ORACLE:Step4_Frame2  RAM[0086]=" .. ramX2 ..
            "  OAM[slot" .. playerSlot .. "].X=" .. oamX2)

      print("------------------------------------------------------------")
      print("ORACLE:RESULTS")
      print("  Initial:        RAM[0086]=" .. ramX0 .. "  OAM.X=" .. oamX0)
      print("  Write target:   RAM[0086]<-" .. writeVal)
      print("  After 1 frame:  RAM[0086]=" .. ramX1 .. "  OAM.X=" .. oamX1)
      print("  After 2 frames: RAM[0086]=" .. ramX2 .. "  OAM.X=" .. oamX2)
      print("")

      -- Did RAM hold our write?
      local ramHeld1 = (ramX1 == writeVal)
      local ramHeld2 = (ramX2 == writeVal)

      -- Did OAM move to the expected position? (±4px tolerance for sprite offset)
      local oamMoved1 = (math.abs(oamX1 - writeVal) <= 4)
      local oamMoved2 = (math.abs(oamX2 - writeVal) <= 4)

      print("  RAM held write (frame 1)? " .. (ramHeld1 and "YES" or
            "NO — game overwrote to " .. ramX1))
      print("  RAM held write (frame 2)? " .. (ramHeld2 and "YES" or
            "NO — game overwrote to " .. ramX2))
      print("  OAM moved (frame 1)?      " .. (oamMoved1 and
            "YES (OAM.X=" .. oamX1 .. ")" or
            "NO  (OAM.X=" .. oamX1 .. ", expected ~" .. writeVal .. ")"))
      print("  OAM moved (frame 2)?      " .. (oamMoved2 and
            "YES (OAM.X=" .. oamX2 .. ")" or
            "NO  (OAM.X=" .. oamX2 .. ", expected ~" .. writeVal .. ")"))
      print("")

      if ramHeld1 and oamMoved1 then
        print("ORACLE:VERDICT=PASS")
        print("  RAM write held and sprite moved within 1 frame.")
        print("  Oracle approach confirmed: write RAM address -> entity teleports.")
      elseif ramHeld2 and oamMoved2 then
        print("ORACLE:VERDICT=PASS_WITH_LAG")
        print("  RAM write held and sprite moved on frame 2 (1-frame OAM DMA lag).")
        print("  Oracle approach works — just account for 1-frame rendering delay.")
      elseif ramHeld1 and not oamMoved1 and not oamMoved2 then
        print("ORACLE:VERDICT=PARTIAL_RAM_ONLY")
        print("  RAM write held but OAM did not move.")
        print("  $0086 may not map directly to OAM X, or sprite uses a different rendering path.")
        print("  Investigation needed: check if SMB uses a different address for OAM sprite X.")
      elseif not ramHeld1 and oamMoved1 then
        print("ORACLE:VERDICT=PARTIAL_OAM_MOVED_RAM_OVERWRITTEN")
        print("  Sprite moved but game immediately overwrote $0086.")
        print("  The write had an effect but $0086 is recalculated each frame from another source.")
        print("  Need to find the upstream position address (sub-pixel accumulator).")
      else
        print("ORACLE:VERDICT=FAIL")
        print("  RAM write was overwritten AND sprite did not move.")
        print("  $0086 is not the correct address to target, or the write approach needs adjustment.")
      end

      print("------------------------------------------------------------")
      emu.stop()
    end

  end  -- phase == "oracle"

end, emu.eventType.startFrame)
