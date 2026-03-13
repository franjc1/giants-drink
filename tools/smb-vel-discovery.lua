-- TEST 9
print("SCRIPT_LOADED")

local frame = 0
local phase = "boot"
local done  = false
local start_presses    = 0
local last_start_frame = -200
local fall_frame = 0

local function clearInput()
  emu.setInput({right=false,left=false,up=false,down=false,
                a=false,b=false,start=false,select=false}, 0)
end

emu.addEventCallback(function()
  frame = frame + 1
  if done then clearInput(); return end

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

  if phase == "setup" then
    clearInput()
    local y = emu.read(0x00CE, emu.memType.nesMemory)
    print(string.format("GROUND: frame=%d  Y=%d", frame, y))
    emu.write(0x00CE, 136, emu.memType.nesMemory)
    emu.write(0x00CF, 0,   emu.memType.nesMemory)
    emu.write(0x009F, 0,   emu.memType.nesMemory)
    print("SETUP: $00CE=136  $00CF=0  $009F=0")
    fall_frame = 0
    phase = "freefall"
    return
  end

  if phase == "freefall" then
    clearInput()
    fall_frame = fall_frame + 1
    local y = emu.read(0x00CE, emu.memType.nesMemory)
    print(string.format("F%02d: Y=%d", fall_frame, y))
    if fall_frame == 10 then
      done = true
      emu.stop()
    end
    return
  end

end, emu.eventType.startFrame)
