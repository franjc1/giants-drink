-- smb-input-test.lua — does Start pause during gameplay?
print("SCRIPT_LOADED")

local frame = 0
local phase = "boot"
local done  = false
local start_presses    = 0
local last_start_frame = -200

local snap_pre = {}

local function clearInput()
  emu.setInput({right=false,left=false,up=false,down=false,
                a=false,b=false,start=false,select=false}, 0)
end

local function snapZP()
  local t = {}
  for i = 0, 255 do t[i] = emu.read(i, emu.memType.nesMemory) end
  return t
end

emu.addEventCallback(function()
  frame = frame + 1
  if done then clearInput(); return end

  -- BOOT
  if phase == "boot" then
    if start_presses < 2 and (frame - last_start_frame) >= 120 then
      emu.setInput({start=true,right=false,left=false,up=false,down=false,
                    a=false,b=false,select=false}, 0)
      start_presses = start_presses + 1
      last_start_frame = frame
      print("BOOT: Start " .. start_presses .. " at frame " .. frame)
    else
      clearInput()
    end
    if start_presses >= 2 and (frame - last_start_frame) >= 60 then
      print(string.format("GAMEPLAY: frame=%d  X=%d  Y=%d",
        frame,
        emu.read(0x0086, emu.memType.nesMemory),
        emu.read(0x00CE, emu.memType.nesMemory)))
      snap_pre = snapZP()
      phase = "press_start"
    end
    return
  end

  -- Press Start once, then watch for 5 frames
  if phase == "press_start" then
    emu.setInput({start=true,right=false,left=false,up=false,down=false,
                  a=false,b=false,select=false}, 0)
    print(string.format("START_PRESS: frame=%d", frame))
    phase = "observe"
    return
  end

  if phase == "observe" then
    clearInput()
    local snap = snapZP()
    -- Print any zero-page change vs pre-start snap
    local changes = {}
    for i = 0, 255 do
      if snap[i] ~= snap_pre[i] then
        changes[#changes+1] = string.format("  $%04X: %d->%d", i, snap_pre[i], snap[i])
      end
    end
    if #changes > 0 then
      print(string.format("f+%d changes (%d):", frame - last_start_frame - 60, #changes))
      for _, s in ipairs(changes) do print(s) end
    else
      print(string.format("f+%d: no changes", frame - last_start_frame - 60))
    end
    -- After 5 frames, check $0776 (known SMB pause flag)
    if frame == last_start_frame + 66 then
      local pause = emu.read(0x0776, emu.memType.nesMemory)
      print(string.format("$0776 (pause flag) = %d", pause))
      done = true
      emu.stop()
    end
    return
  end

end, emu.eventType.startFrame)
