-- smb-gravity-test.lua  (Test 3)
-- Isolated gravity measurement — using known SMB Y velocity addr $009F.
--
-- Run:
--   ~/mesen2/Mesen.app/Contents/MacOS/Mesen --testrunner ~/nes-roms/"Super Mario Bros. (World).nes" tools/smb-gravity-test.lua

print("SCRIPT_LOADED")

local frame          = 0
local phase          = "boot"
local done           = false

local ADDR_X         = 0x0086
local ADDR_Y         = 0x00CE
local ADDR_Y_VEL     = 0x009F   -- known SMB1 Y velocity

local start_presses  = 0
local last_start_frame = -200

local y_ground       = -1
local y0_written     = -1
local fall_frame     = 0
local FALL_FRAMES    = 60
local y_readings     = {}   -- [1..FALL_FRAMES]

local function clearInput()
  emu.setInput({right=false,left=false,up=false,down=false,
                a=false,b=false,start=false,select=false}, 0)
end

emu.addEventCallback(function()
  frame = frame + 1
  if done then clearInput(); return end

  -- ── PHASE: boot ──────────────────────────────────────────────────────────────
  if phase == "boot" then
    if start_presses < 2 and (frame - last_start_frame) >= 120 then
      emu.setInput({start=true,right=false,left=false,up=false,down=false,
                    a=false,b=false,select=false}, 0)
      start_presses = start_presses + 1
      last_start_frame = frame
      print("BOOT: Start press " .. start_presses .. " at frame " .. frame)
    else
      clearInput()
    end
    if start_presses >= 2 and (frame - last_start_frame) >= 60 then
      phase = "setup"
    end
    return
  end

  -- ── PHASE: setup — read ground, write drop position ──────────────────────────
  if phase == "setup" then
    clearInput()
    local x = emu.read(ADDR_X, emu.memType.nesMemory)
    y_ground  = emu.read(ADDR_Y, emu.memType.nesMemory)
    print("GROUND: frame=" .. frame
      .. "  X[$0086]=" .. x
      .. "  Y[$00CE]=" .. y_ground)

    y0_written = y_ground - 40
    emu.write(ADDR_Y,     y0_written, emu.memType.nesMemory)
    emu.write(ADDR_Y_VEL, 0,          emu.memType.nesMemory)

    print("DROP:  wrote Y[$00CE]=" .. y0_written
      .. "  wrote Y_vel[$009F]=0"
      .. "  (Mario is 40px above ground, zero initial velocity)")

    fall_frame = 0
    phase = "freefall"
    return
  end

  -- ── PHASE: freefall — collect 10 frames of Y readings ────────────────────────
  if phase == "freefall" then
    clearInput()
    fall_frame = fall_frame + 1

    local y = emu.read(ADDR_Y, emu.memType.nesMemory)
    y_readings[fall_frame] = y
    print("FALL" .. string.format("%02d", fall_frame)
      .. ": frame=" .. frame .. "  Y[$00CE]=" .. y)

    if fall_frame == FALL_FRAMES then
      -- Print per-frame deltas (compact: one line per frame)
      print("---")
      print("Frame-to-frame Y deltas (positive = falling):")
      local prev = y0_written
      local peak_delta = 0
      local landed_frame = -1
      for i = 1, FALL_FRAMES do
        local delta = y_readings[i] - prev
        if delta > peak_delta then peak_delta = delta end
        -- detect landing: Y snaps back to ground or stops increasing
        if landed_frame == -1 and y_readings[i] >= y_ground then
          landed_frame = i
        end
        print(string.format("  f%02d: Y=%-4d  delta=%d", i, y_readings[i], delta))
        prev = y_readings[i]
      end
      print("---")
      print("Y0 (drop point)  = " .. y0_written)
      print("Y_ground         = " .. y_ground)
      print("Peak delta       = " .. peak_delta .. " px/frame  (terminal pixel velocity)")
      if landed_frame > 0 then
        print("Landed at frame  = " .. landed_frame)
      else
        print("Landed at frame  = (not within " .. FALL_FRAMES .. " frames)")
      end

      -- Verdict
      if y_readings[FALL_FRAMES] > y0_written then
        print("RESULT: PASS — Mario fell (Y increased)")
      else
        print("RESULT: FAIL — Y unchanged or reversed")
      end

      done = true
      emu.stop()
    end
    return
  end

end, emu.eventType.startFrame)
