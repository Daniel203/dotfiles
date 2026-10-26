-- The personal fallback/mirror rules from hyprland.conf.
-- DMS-generated monitor profiles are migrated separately by DMS.
-- Do not implement the DP2 -> HDMI-A-1 lid preference in Phase 1.

hl.monitor({ output = "", mode = "preferred", position = "auto-left", scale = 1 })
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080", position = "0x0", scale = 1, mirror = "eDP-1" })
