-- test-savestate-callback.lua
-- Minimal test: can createSavestate/loadSavestate be called from a startFrame callback?

local frameCount = 0
local savedState = nil

emu.addEventCallback(function()
  frameCount = frameCount + 1

  if frameCount == 1 then
    -- Test createSavestate on first frame
    local ok, result = pcall(function()
      return emu.createSavestate()
    end)
    if ok and result then
      savedState = result
      print("SAVESTATE_TEST:SUCCESS_CREATE len=" .. tostring(#savedState))
    else
      print("SAVESTATE_TEST:FAILED create error=" .. tostring(result))
    end

  elseif frameCount == 2 then
    -- Test loadSavestate on second frame
    if savedState then
      local ok, result = pcall(function()
        return emu.loadSavestate(savedState)
      end)
      if ok then
        print("SAVESTATE_TEST:SUCCESS_LOAD result=" .. tostring(result))
      else
        print("SAVESTATE_TEST:FAILED load error=" .. tostring(result))
      end
    else
      print("SAVESTATE_TEST:FAILED load skipped (no saved state)")
    end

  elseif frameCount >= 3 then
    print("SAVESTATE_TEST:DONE")
    emu.stop()
  end

end, emu.eventType.startFrame)
