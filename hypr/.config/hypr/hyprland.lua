-- Hyprland 0.55+ native Lua configuration.
-- DMS-generated files are managed separately by DMS; do not edit them here.

require("config.settings")
require("config.monitors")
require("config.startup")
require("config.keybinds")
require("config.windowrules")
require("config.dms")

-- Enable this import after migrating DMS's generated outputs.conf to outputs.lua.
-- DMS manages this file; its migration is not included here.
-- require("dms.outputs")


-- DMS Include Configs
require("dms.layout")
