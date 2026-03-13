-- smb-physics-discover.lua — TEST 10 v3
-- Fix 1: X scan restricted to zero page ($0000-$00FF) — game objects live there
-- Fix 2: Y mid-snap diagnostic — print what the jump actually produced
-- Fix 3: No savestates in battery — run tests back-to-back after vel_setup landing
--
-- Run:
--   ~/mesen2/Mesen.app/Contents/MacOS/Mesen --testrunner ~/nes-roms/"Super Mario Bros. (World).nes" tools/smb-physics-discover.lua

print("SCRIPT_LOADED")

-- ── HELPERS ──────────────────────────────────────────────────────────────────
local function clearInput()
  emu.setInput({right=false,left=false,up=false,down=false,
                a=false,b=false,start=false,select=false}, 0)
end
local function snapZP()   -- zero page only
  local t = {}
  for i = 0, 255 do t[i] = emu.read(i, emu.memType.nesMemory) end
  return t
end

-- ── ANALYSIS ─────────────────────────────────────────────────────────────────
-- FIX 1: zero page only, monotonic: r1>base AND r2>r1 AND l<r1
local function findXAddr(base, r1, r2, left)
  local best, mag = -1, 0
  for i = 0, 255 do
    if r1[i] > base[i] and r2[i] > r1[i] and left[i] < r1[i] then
      local range = r2[i] - left[i]
      if range > mag then mag, best = range, i end
    end
  end
  return best
end

local function findYAddr(base, mid, land)
  local best, mag = -1, 0
  for i = 0, 255 do
    local d_mid  = mid[i]  - base[i]
    local d_land = land[i] - base[i]
    if d_mid < -15 and math.abs(d_land) <= 2 and math.abs(d_mid) > mag then
      mag, best = math.abs(d_mid), i
    end
  end
  return best
end

local function findVelAddr(f1, f2, skip_a, skip_b)
  local best, mag = -1, 0
  for i = 0, 255 do
    if i ~= skip_a and i ~= skip_b then
      local d = f2[i] - f1[i]
      if d > 0 and d > mag then mag, best = d, i end
    end
  end
  return best, mag
end

-- ── STATE ────────────────────────────────────────────────────────────────────
local frame            = 0
local phase            = "boot"
local done             = false
local start_presses    = 0
local last_start_frame = -200
local hold_count       = 0

local x_addr   = -1
local y_addr   = -1
local sy_addr  = -1
local vel_addr = -1
local y_ground = -1

local snap_base, snap_r1, snap_r2, snap_left = {},{},{},{}
local snap_mid,  snap_land                   = {},{}
local snap_f1,   snap_f2                     = {},{}

-- Battery (no savestates — runs sequentially after landing)
local phys_test  = 1
local phys_frame = 0
local phys_pos   = {}
local landed     = false

local TESTS = {
  { name="GRAVITY",    frames=30, air=true,
    inp=function(f) return {a=false,  right=false} end },
  { name="WALK_RIGHT", frames=30, air=false,
    inp=function(f) return {a=false,  right=true}  end },
  { name="JUMP_TAP",   frames=60, air=false,
    inp=function(f) return {a=(f==1), right=false}  end },
  { name="JUMP_HOLD",  frames=60, air=false,
    inp=function(f) return {a=(f<=20),right=false}  end },
}

-- ── MAIN CALLBACK ─────────────────────────────────────────────────────────────
emu.addEventCallback(function()
  frame = frame + 1
  if done then clearInput(); return end

  -- BOOT -----------------------------------------------------------------------
  if phase == "boot" then
    if start_presses < 2 and (frame - last_start_frame) >= 120 then
      emu.setInput({start=true,right=false,left=false,up=false,down=false,
                    a=false,b=false,select=false}, 0)
      start_presses = start_presses + 1
      last_start_frame = frame
      print("BOOT: Start " .. start_presses .. " at frame " .. frame)
    else clearInput() end
    if start_presses >= 2 and (frame - last_start_frame) >= 60 then
      phase = "x_base"
    end
    return
  end

  -- X DISCOVERY — zero page only, monotonic right, then left ------------------
  if phase == "x_base" then
    clearInput(); snap_base = snapZP()
    print("X: baseline snap frame=" .. frame)
    hold_count = 0; phase = "x_right1"; return
  end
  if phase == "x_right1" then
    emu.setInput({right=true,left=false,up=false,down=false,
                  a=false,b=false,start=false,select=false}, 0)
    hold_count = hold_count + 1
    if hold_count == 10 then
      snap_r1 = snapZP()
      print("X: right-10 snap frame=" .. frame)
      hold_count = 0; phase = "x_right2"
    end
    return
  end
  if phase == "x_right2" then
    emu.setInput({right=true,left=false,up=false,down=false,
                  a=false,b=false,start=false,select=false}, 0)
    hold_count = hold_count + 1
    if hold_count == 10 then
      snap_r2 = snapZP()
      print("X: right-20 snap frame=" .. frame)
      hold_count = 0; phase = "x_left"
    end
    return
  end
  if phase == "x_left" then
    emu.setInput({right=false,left=true,up=false,down=false,
                  a=false,b=false,start=false,select=false}, 0)
    hold_count = hold_count + 1
    if hold_count == 20 then
      snap_left = snapZP()
      x_addr = findXAddr(snap_base, snap_r1, snap_r2, snap_left)
      if x_addr >= 0 then
        print(string.format("X_FOUND:  $%04X = %d", x_addr,
          emu.read(x_addr, emu.memType.nesMemory)))
      else
        -- FIX 1 diagnostic: print all zero-page bytes where r2>r1>base
        print("X_FOUND:  NONE — candidates where r2>r1>base:")
        for i = 0, 255 do
          if snap_r1[i] > snap_base[i] and snap_r2[i] > snap_r1[i] then
            print(string.format("  $%04X: base=%d r1=%d r2=%d left=%d",
              i, snap_base[i], snap_r1[i], snap_r2[i], snap_left[i]))
          end
        end
      end
      hold_count = 0; phase = "y_base"
    end
    return
  end

  -- Y DISCOVERY — full jump (15-frame hold), mid-snap at +10, land at +60 -----
  if phase == "y_base" then
    clearInput(); snap_base = snapZP()
    print("Y: baseline snap frame=" .. frame)
    hold_count = 0; phase = "y_jump"; return
  end
  if phase == "y_jump" then
    emu.setInput({a=true,right=false,left=false,up=false,down=false,
                  b=false,start=false,select=false}, 0)
    hold_count = hold_count + 1
    if hold_count == 15 then hold_count = 0; phase = "y_wait_mid" end
    return
  end
  if phase == "y_wait_mid" then
    clearInput(); hold_count = hold_count + 1
    if hold_count == 10 then
      snap_mid = snapZP()
      -- FIX 2 diagnostic: print every zero-page byte that dropped (went up)
      print("Y: mid-jump snap frame=" .. frame .. "  (top deltas):")
      local dels = {}
      for i = 0, 255 do
        local d = snap_mid[i] - snap_base[i]
        if d < 0 then dels[#dels+1] = {i, d} end
      end
      table.sort(dels, function(a,b) return a[2] < b[2] end)
      for k = 1, math.min(8, #dels) do
        print(string.format("  $%04X: base=%d mid=%d delta=%d",
          dels[k][1], snap_base[dels[k][1]], snap_mid[dels[k][1]], dels[k][2]))
      end
      hold_count = 0; phase = "y_wait_land"
    end
    return
  end
  if phase == "y_wait_land" then
    clearInput(); hold_count = hold_count + 1
    if hold_count == 60 then
      snap_land = snapZP()
      y_addr = findYAddr(snap_base, snap_mid, snap_land)
      if y_addr >= 0 then
        sy_addr  = y_addr + 1
        y_ground = emu.read(y_addr, emu.memType.nesMemory)
        print(string.format("Y_FOUND:  $%04X = %d", y_addr, y_ground))
        print(string.format("SY_FOUND: $%04X (Y+1)", sy_addr))
      else
        y_addr = 0x00CE; sy_addr = 0x00CF
        y_ground = emu.read(y_addr, emu.memType.nesMemory)
        print("Y_FOUND:  NONE — fallback $00CE/$00CF")
      end
      phase = "vel_setup"
    end
    return
  end

  -- VELOCITY DISCOVERY ─────────────────────────────────────────────────────────
  if phase == "vel_setup" then
    clearInput()
    y_ground = emu.read(y_addr, emu.memType.nesMemory)
    emu.write(y_addr,  y_ground - 40, emu.memType.nesMemory)
    emu.write(sy_addr, 0,             emu.memType.nesMemory)
    print(string.format("VEL: teleport Y %d->%d  zeroed $%04X",
      y_ground, y_ground - 40, sy_addr))
    phase = "vel_snap1"; return
  end
  if phase == "vel_snap1" then
    clearInput(); snap_f1 = snapZP()
    print(string.format("VEL: snap1 frame=%d  Y=%d", frame, snap_f1[y_addr]))
    phase = "vel_snap2"; return
  end
  if phase == "vel_snap2" then
    clearInput(); snap_f2 = snapZP()
    print(string.format("VEL: snap2 frame=%d  Y=%d", frame, snap_f2[y_addr]))
    vel_addr = findVelAddr(snap_f1, snap_f2, y_addr, sy_addr)
    if vel_addr >= 0 then
      print(string.format("VEL_FOUND: $%04X  %d->%d  delta=%d",
        vel_addr, snap_f1[vel_addr], snap_f2[vel_addr],
        snap_f2[vel_addr] - snap_f1[vel_addr]))
    else
      print("VEL_FOUND: NONE")
    end
    print("---")
    print(string.format("DISCOVERED  X=$%04X  Y=$%04X  subY=$%04X  vel=$%04X",
      x_addr, y_addr, sy_addr, vel_addr))
    print(string.format("EXPECTED    X=$0086  Y=$00CE  subY=$00CF  vel=$0009"))
    print(string.format("MATCH       X=%s  Y=%s  subY=%s  vel=%s",
      x_addr==0x0086 and "PASS" or "FAIL",
      y_addr==0x00CE and "PASS" or "FAIL",
      sy_addr==0x00CF and "PASS" or "FAIL",
      vel_addr==0x0009 and "PASS" or "FAIL"))
    print("---")
    -- FIX 3: wait for landing then run battery directly (no savestates)
    landed = false; hold_count = 0; phase = "wait_land"
    return
  end

  -- WAIT FOR LANDING (from vel_setup drop) -------------------------------------
  if phase == "wait_land" then
    clearInput()
    local y = emu.read(y_addr, emu.memType.nesMemory)
    if y >= y_ground then
      if not landed then
        landed = true; hold_count = 0
        print(string.format("LANDED: frame=%d  Y=%d  — starting battery", frame, y))
      end
      hold_count = hold_count + 1
      if hold_count == 5 then   -- 5-frame settle
        phys_test = 1; phase = "phys_setup"
      end
    end
    return
  end

  -- BATTERY: between-test landing wait ─────────────────────────────────────────
  if phase == "wait_land_between" then
    clearInput()
    local y = emu.read(y_addr, emu.memType.nesMemory)
    if y >= y_ground then
      if not landed then
        landed = true; hold_count = 0
      end
      hold_count = hold_count + 1
      if hold_count == 5 then
        phys_test = phys_test + 1; phase = "phys_setup"
      end
    end
    return
  end

  -- BATTERY SETUP ──────────────────────────────────────────────────────────────
  if phase == "phys_setup" then
    if phys_test > #TESTS then phase = "done"; return end
    local t = TESTS[phys_test]
    print(string.format("TEST: %s (%d frames)", t.name, t.frames))
    if t.air then
      y_ground = emu.read(y_addr, emu.memType.nesMemory)
      emu.write(y_addr,  y_ground - 40, emu.memType.nesMemory)
      emu.write(sy_addr, 0,             emu.memType.nesMemory)
      if vel_addr >= 0 then emu.write(vel_addr, 0, emu.memType.nesMemory) end
    end
    phys_frame = 0; phys_pos = {}; phase = "phys_run"
    return
  end

  -- BATTERY RUN ────────────────────────────────────────────────────────────────
  if phase == "phys_run" then
    local t = TESTS[phys_test]
    phys_frame = phys_frame + 1
    local i = t.inp(phys_frame)
    emu.setInput({right=i.right or false, left=false, up=false, down=false,
                  a=i.a or false, b=false, start=false, select=false}, 0)
    local xv = (x_addr >= 0) and emu.read(x_addr, emu.memType.nesMemory) or -1
    local yv = emu.read(y_addr, emu.memType.nesMemory)
    phys_pos[phys_frame] = {x=xv, y=yv}

    if phys_frame == t.frames then
      local px, py = phys_pos[1].x, phys_pos[1].y
      for fi = 1, t.frames do
        local r = phys_pos[fi]
        print(string.format("  f%02d  X=%3d(d%+d)  Y=%3d(d%+d)",
          fi, r.x, r.x-px, r.y, r.y-py))
        px, py = r.x, r.y
      end
      -- after air test: wait for landing before next test
      -- after ground test: go directly to next
      if t.air then
        landed = false; hold_count = 0; phase = "wait_land_between"
      else
        -- for jump tests, also wait for landing
        if t.name == "JUMP_TAP" or t.name == "JUMP_HOLD" then
          landed = false; hold_count = 0; phase = "wait_land_between"
        else
          phys_test = phys_test + 1; phase = "phys_setup"
        end
      end
    end
    return
  end

  if phase == "done" then
    print("DONE"); done = true; emu.stop(); return
  end

end, emu.eventType.startFrame)
