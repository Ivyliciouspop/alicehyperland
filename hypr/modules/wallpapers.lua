local home = os.getenv("HOME")
local wall_dir = home .. "/Images/wallpaper"
local state_file = home .. "/.config/hypr/wallpaper"
local exts = { png = true, jpg = true, jpeg = true, webp = true, gif = true, mp4 = true, webm = true, mkv = true }
local mpv_opts = "no-audio loop hwdec=auto image-display-duration=inf panscan=1.0"

local function list_walls()
  local walls = {}
  local p = io.popen('ls -1 "' .. wall_dir .. '"')
  for name in p:lines() do
    local ext = name:lower():match("%.(%w+)$")
    if ext and exts[ext] then
      table.insert(walls, wall_dir .. "/" .. name)
    end
  end
  p:close()
  return walls
end

local function read_saved()
  local f = io.open(state_file, "r")
  if not f then return nil end
  local path = f:read("l")
  f:close()
  return path
end

local function play(path)
  hl.exec_cmd("pkill -x mpvpaper; sleep 0.2; mpvpaper -o '" .. mpv_opts .. "' '*' '" .. path .. "'")
end

local function set_wall(path)
  local f = io.open(state_file, "w")
  if f then f:write(path .. "\n") f:close() end
  play(path)
end

local function current_index(walls)
  local current = read_saved()
  for i, w in ipairs(walls) do
    if w == current then return i end
  end
  return 0
end

local function next_wall()
  local walls = list_walls()
  if #walls == 0 then return end
  local idx = current_index(walls)
  set_wall(walls[(idx % #walls) + 1])
end

local function prev_wall()
  local walls = list_walls()
  if #walls == 0 then return end
  local idx = current_index(walls)
  if idx == 0 then
    set_wall(walls[#walls])
  else
    set_wall(walls[((idx - 2) % #walls) + 1])
  end
end

-- Autostart: must come after the functions above
hl.on("hyprland.start", function()
  local wall = read_saved() or list_walls()[1]
  if wall then
    hl.exec_cmd("sleep 2; mpvpaper -o '" .. mpv_opts .. "' '*' '" .. wall .. "' > /tmp/mpvpaper.log 2>&1")
  end
end)

hl.bind("SUPER + W", next_wall)
hl.bind("SUPER + SHIFT + W", prev_wall)