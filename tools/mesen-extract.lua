-- mesen-extract.lua
-- NES PPU state extractor — Two Fires Session 9
--
-- Runs inside Mesen2 headless mode (--testrunner flag).
-- Captures palette, nametable, OAM, CHR tile data, and a screenshot from a
-- running NES game, then stops the emulator.
--
-- IMPORTANT: Mesen2's Lua environment strips io and os libraries.
-- Output is via print() to stdout, captured and parsed by render-screen.js.
--
-- Usage (called by render-screen.js):
--   ~/mesen2/Mesen.app/Contents/MacOS/Mesen --testrunner <rom.nes> tools/mesen-extract.lua
--
-- Output line format:
--   DATA_FRAME:<number>
--   DATA_PALETTE:<64 hex chars = 32 bytes>
--   DATA_NAMETABLE:<2048 hex chars = 1024 bytes>
--   DATA_OAM:<512 hex chars = 256 bytes>
--   DATA_CHR_SIZE:<number>
--   DATA_CHR:<hex string>
--   DATA_PNG:<hex-encoded PNG binary>
--   DATA_DONE:1

-- Capture at frame 600 (~10 seconds): past title screen and into World 1-1.
local CAPTURE_FRAME = 600
-- Press Start on frame 80 to dismiss title screen.
local START_FRAME = 80

local frame = 0
local start_presses = 0
local captured = false

-- Read a block of memory and return it as a lowercase hex string.
local function readHex(memType, startAddr, count)
  local parts = {}
  for i = 0, count - 1 do
    parts[i + 1] = string.format("%02x", emu.read(startAddr + i, memType))
  end
  return table.concat(parts)
end

-- Hex-encode a binary Lua string (e.g. PNG data from takeScreenshot).
local function binToHex(s)
  return (s:gsub(".", function(c)
    return string.format("%02x", string.byte(c))
  end))
end

local function capture()
  print("DATA_FRAME:" .. tostring(frame))

  -- Palette RAM: 32 bytes ($3F00-$3F1F in PPU space)
  -- Bytes 0-15: background palettes; bytes 16-31: sprite palettes
  print("DATA_PALETTE:" .. readHex(emu.memType.nesPaletteRam, 0, 32))

  -- PPUCTRL ($2000 write-only on hardware; read internal register via nesDebug).
  -- Bit 4: BG pattern table (0 = $0000, 1 = $1000).
  -- Bit 3: sprite pattern table (0 = $0000, 1 = $1000).
  -- SMB1 PPUCTRL = $90 (bit4=1: BG at $1000; bit3=0: sprites at $0000).
  -- nesDebug address 0 = PPUCTRL in Mesen's PPU debug memory map.
  local ok, ppuctrl = pcall(function()
    return emu.read(0, emu.memType.nesPpuDebug)
  end)
  print("DATA_PPUCTRL:" .. tostring(ok and ppuctrl or "unknown"))

  -- Nametable 0: 1024 bytes at PPU $2000
  -- First 960 = 32×30 tile indices; last 64 = attribute table
  print("DATA_NAMETABLE:" .. readHex(emu.memType.nesPpuMemory, 0x2000, 1024))

  -- OAM: 256 bytes = 64 sprites × 4 bytes (Y-1, tile, attrs, X)
  print("DATA_OAM:" .. readHex(emu.memType.nesSpriteRam, 0, 256))

  -- CHR data: all pattern table bytes
  -- For CHR-ROM games (like SMB): nesChrRom, 8KB
  -- For CHR-RAM games: fall back to nesChrRam
  local chrSize = emu.getMemorySize(emu.memType.nesChrRom)
  if chrSize > 0 then
    print("DATA_CHR_SIZE:" .. tostring(chrSize))
    print("DATA_CHR:" .. readHex(emu.memType.nesChrRom, 0, chrSize))
  else
    local ramSize = emu.getMemorySize(emu.memType.nesChrRam)
    print("DATA_CHR_SIZE:" .. tostring(ramSize))
    if ramSize > 0 then
      print("DATA_CHR:" .. readHex(emu.memType.nesChrRam, 0, ramSize))
    end
  end

  -- Mesen's own rendered screenshot (PNG binary, hex-encoded).
  -- Saved as mesen-reference.png alongside our rendered screen.png.
  local png = emu.takeScreenshot()
  print("DATA_PNG:" .. binToHex(png))

  print("DATA_DONE:1")
end

-- Input polling: press Start to get past title screen
emu.addEventCallback(function()
  if start_presses < 5 and frame >= START_FRAME then
    emu.setInput({ start = true }, 0)
    start_presses = start_presses + 1
  end
end, emu.eventType.inputPolled)

-- Frame counter: capture at CAPTURE_FRAME
emu.addEventCallback(function()
  frame = frame + 1
  if frame == CAPTURE_FRAME and not captured then
    captured = true
    capture()
    emu.stop()
  end
end, emu.eventType.startFrame)
