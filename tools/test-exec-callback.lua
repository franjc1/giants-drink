-- test-exec-callback.lua
-- Tests: can createSavestate be called from an exec memory callback?
-- Tests: can we remove an exec callback with removeMemoryCallback?

local frameCount = 0
local execRef = nil
local execFired = false

local function onExec()
  if execFired then return end
  execFired = true

  -- Test createSavestate inside exec callback
  local ok, result = pcall(function()
    return emu.createSavestate()
  end)
  if ok and result then
    print("EXEC_SAVESTATE:SUCCESS len=" .. tostring(#result))
  else
    print("EXEC_SAVESTATE:FAILED error=" .. tostring(result))
  end

  -- Test removing the callback
  if execRef ~= nil then
    local okRm, rmErr = pcall(function()
      emu.removeMemoryCallback(execRef, emu.callbackType.exec, 0x8000, 0xFFFF)
    end)
    if okRm then
      print("EXEC_CALLBACK:REMOVED")
    else
      print("EXEC_CALLBACK:REMOVE_FAILED error=" .. tostring(rmErr))
    end
  else
    print("EXEC_CALLBACK:NO_REF")
  end
end

emu.addEventCallback(function()
  frameCount = frameCount + 1

  if frameCount == 10 then
    -- Register exec callback over PRG ROM range
    local ok, result = pcall(function()
      return emu.addMemoryCallback(onExec, emu.callbackType.exec, 0x8000, 0xFFFF)
    end)
    if ok then
      execRef = result
      print("EXEC_CALLBACK:REGISTERED ref=" .. tostring(execRef))
    else
      print("EXEC_CALLBACK:REGISTER_FAILED error=" .. tostring(result))
    end
  end

  if frameCount == 20 then
    print("STABILITY:OK")
    emu.stop()
  end

end, emu.eventType.startFrame)
