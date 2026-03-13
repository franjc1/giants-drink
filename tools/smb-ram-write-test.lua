-- smb-ram-write-test.lua
-- Isolated test: read and write Mario's X/Y coords directly.
--
-- Run:
--   ~/mesen2/Mesen.app/Contents/MacOS/Mesen --testrunner ~/nes-roms/"Super Mario Bros. (World).nes" tools/smb-ram-write-test.lua

print("SCRIPT_LOADED")

local frame = 0
local phase = "boot"
local done = false

-- Known addresses from Phase 5 work
local ADDR_X          = 0x0086
local ADDR_Y          = 0x00CE
local ADDR_HSCROLL_SUB = 0x0057
local ADDR_HSCROLL     = 0x0058

local start_presses   = 0
local last_start_frame = -200

local x_before, y_before, x_after

local function clearInput()
  emu.setInput({right=false,left=false,up=false,down=false,
                a=false,b=false,start=false,select=false}, 0)
end

emu.addEventCallback(function()
  frame = frame + 1

  if done then clearInput(); return end

  -- ── PHASE: boot ──────────────────────────────────────────────────────────────
  -- Press Start twice (120-frame gap) to get past title screen into gameplay.
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

    -- After second Start press + 60 frame settle → proceed to read
    if start_presses >= 2 and (frame - last_start_frame) >= 60 then
      phase = "read"
    end
    return
  end

  -- ── PHASE: read ──────────────────────────────────────────────────────────────
  if phase == "read" then
    clearInput()
    x_before = emu.read(ADDR_X, emu.memType.nesMemory)
    y_before  = emu.read(ADDR_Y, emu.memType.nesMemory)
    print("READ: frame=" .. frame
      .. "  X[$0086]=" .. x_before
      .. "  Y[$00CE]=" .. y_before)

    -- Write x_before + 20, zero the horizontal scroll sub-pixels
    local x_target = (x_before + 20) % 256
    emu.write(ADDR_X,           x_target, emu.memType.nesMemory)
    emu.write(ADDR_HSCROLL_SUB, 0,        emu.memType.nesMemory)
    emu.write(ADDR_HSCROLL,     0,        emu.memType.nesMemory)
    print("WRITE: set $0086=" .. x_target
      .. "  zeroed $0057 $0058"
      .. "  (target=" .. x_target .. ")")

    phase = "verify"
    return
  end

  -- ── PHASE: verify (runs 1 frame after write) ──────────────────────────────────
  if phase == "verify" then
    clearInput()
    x_after = emu.read(ADDR_X, emu.memType.nesMemory)
    print("VERIFY: frame=" .. frame .. "  X[$0086]=" .. x_after)

    local expected = (x_before + 20) % 256
    if x_after == expected then
      print("RESULT: PASS — " .. x_before .. " → " .. x_after
        .. " (delta=+" .. (x_after - x_before) .. ")")
    else
      print("RESULT: FAIL — expected " .. expected
        .. " got " .. x_after
        .. " (raw delta=" .. (x_after - x_before) .. ")")
    end

    done = true
    emu.stop()
    return
  end

end, emu.eventType.startFrame)
