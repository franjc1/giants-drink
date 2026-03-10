-- test-readwrite-callback.lua
-- Tests: do emu.read/write work from a startFrame event callback?

local frameCount = 0

emu.addEventCallback(function()
  frameCount = frameCount + 1

  if frameCount == 60 then
    -- (a) Read address $0032 from internal RAM
    local v0 = emu.read(0x0032, emu.memType.nesInternalRam)
    print("RAM_READ_BEFORE:0x0032=" .. tostring(v0))

    -- (b) Write 0x05 to $0032
    emu.write(0x0032, 0x05, emu.memType.nesInternalRam)

    -- (c) Read back
    local v1 = emu.read(0x0032, emu.memType.nesInternalRam)
    print("RAM_READ_AFTER:0x0032=" .. tostring(v1))

    -- (d) Read 4 bytes of palette RAM
    local p0 = emu.read(0, emu.memType.nesPaletteRam)
    local p1 = emu.read(1, emu.memType.nesPaletteRam)
    local p2 = emu.read(2, emu.memType.nesPaletteRam)
    local p3 = emu.read(3, emu.memType.nesPaletteRam)
    print("PALETTE:0=" .. tostring(p0) .. " 1=" .. tostring(p1) .. " 2=" .. tostring(p2) .. " 3=" .. tostring(p3))

    -- (e) Read 4 bytes of nametable RAM
    local n0 = emu.read(0, emu.memType.nesNametableRam)
    local n1 = emu.read(1, emu.memType.nesNametableRam)
    local n2 = emu.read(2, emu.memType.nesNametableRam)
    local n3 = emu.read(3, emu.memType.nesNametableRam)
    print("NAMETABLE:0=" .. tostring(n0) .. " 1=" .. tostring(n1) .. " 2=" .. tostring(n2) .. " 3=" .. tostring(n3))

    print("READWRITE:DONE")
    emu.stop()
  end

end, emu.eventType.startFrame)
