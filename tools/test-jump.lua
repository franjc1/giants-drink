-- test-jump.lua v3
-- After confirming right=true moves Mario (dx > 0),
-- immediately press A and verify:
-- 1. Does OAM Y change? (nesSpriteRam byte 0 of each slot)
-- 2. Does Mario's world Y (SMB RAM $00CE) change?
-- 3. Does any internal flag change?

local frame = 0
local state = "boot"
local waitUntil = 0
local attempts = 0
local candSlot = -1
local candX0 = 0
local rightFrames = 0
local testFrame = 0

local function clearInput()
  emu.setInput({right=false,left=false,up=false,down=false,
                a=false,b=false,start=false,select=false}, 0)
end

emu.addEventCallback(function()
  frame = frame + 1
  if frame > 5000 then print("TIMEOUT"); emu.stop(); return end

  if state == "boot" then
    if attempts >= 6 then print("FAIL:max attempts"); emu.stop(); return end
    if frame % 120 == 0 then
      attempts = attempts + 1
      emu.setInput({start=true,right=false,left=false,up=false,down=false,
                    a=false,b=false,select=false}, 0)
      waitUntil = frame + 180
      state = "wait_post_start"
    else clearInput() end
    return
  end

  if state == "wait_post_start" then
    clearInput()
    if frame < waitUntil then return end
    candSlot = -1
    for slot = 0, 15 do
      local y = emu.read(slot * 4, emu.memType.nesSpriteRam)
      if y >= 50 and y <= 200 then candSlot = slot; candX0 = emu.read(slot*4+3, emu.memType.nesSpriteRam); break end
    end
    if candSlot < 0 then state = "boot"; return end
    rightFrames = 0; state = "hold_right"; return
  end

  if state == "hold_right" then
    emu.setInput({right=true,left=false,up=false,down=false,
                  a=false,b=false,start=false,select=false}, 0)
    rightFrames = rightFrames + 1
    if rightFrames >= 15 then state = "check_move" end
    return
  end

  if state == "check_move" then
    clearInput()
    local newX = emu.read(candSlot * 4 + 3, emu.memType.nesSpriteRam)
    local dx = newX - candX0
    if dx > 128 then dx = dx - 256 end
    if dx < -128 then dx = dx + 256 end
    print("CONTROL:dx=" .. dx .. " slot=" .. candSlot .. " frame=" .. frame)
    if math.abs(dx) < 3 then state = "boot"; return end
    -- Confirmed! Now press A and watch both OAM Y and SMB RAM
    testFrame = 0; state = "jump_test"; return
  end

  if state == "jump_test" then
    testFrame = testFrame + 1
    if testFrame > 40 then print("DONE"); emu.stop(); return end
    if testFrame <= 30 then
      emu.setInput({a=true,right=false,left=false,up=false,down=false,
                    b=false,start=false,select=false}, 0)
    else clearInput() end
    -- OAM Y for slots 0-3
    local oamY0 = emu.read(0, emu.memType.nesSpriteRam)
    local oamY1 = emu.read(4, emu.memType.nesSpriteRam)
    local oamX1 = emu.read(7, emu.memType.nesSpriteRam)  -- slot 1 X byte
    -- SMB-specific RAM: $00CE = Mario's Y position (sub-pixel high byte)
    -- $03AE = player state, $0700 = game mode, $0057 = horizontal scroll
    local marioY  = emu.read(0x00CE, emu.memType.nesInternalRam)
    local marioYS = emu.read(0x00CF, emu.memType.nesInternalRam)  -- sub-pixel
    local gameMode = emu.read(0x0770, emu.memType.nesInternalRam) -- GameEngineSubroutine
    local playerState = emu.read(0x000E, emu.memType.nesInternalRam) -- player state
    print("J" .. testFrame ..
          " oamY0=" .. oamY0 .. " oamY1=" .. oamY1 .. " oamX1=" .. oamX1 ..
          " mY=" .. marioY .. "." .. marioYS ..
          " mode=" .. gameMode .. " pstate=" .. playerState)
    return
  end

end, emu.eventType.startFrame)
