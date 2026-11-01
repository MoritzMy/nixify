-- Hyprland config entry point. Each section lives in modules/.
-- https://wiki.hypr.land/Configuring/Start/

local function hostname()
  local f = io.open("/etc/hostname", "r")
  if not f then return nil end
  local name = f:read("*l")
  f:close()
  return name
end

local host = hostname() or ""
if not pcall(require, "modules.monitors." .. host) then
  pcall(require, "modules.monitors.default")
end


require("modules.env")
require("modules.permissions")
require("modules.autostart")
require("modules.appearance")
require("modules.animations")
require("modules.layouts")
require("modules.misc")
require("modules.input")
require("modules.keybinds")
require("modules.rules")

-- For Noctalia Color templates
require("noctalia").apply_theme()
