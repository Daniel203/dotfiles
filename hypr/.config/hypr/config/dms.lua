-- User-owned DMS integration converted from dankmaterialshell.conf.
-- The generated dms/ files are not changed by this module.
local exec = hl.dsp.exec_cmd

hl.on("hyprland.start", function()
    hl.exec_cmd('bash -c "wl-paste --watch cliphist store"')
    hl.exec_cmd("dms run")
end)

local bindings = {
    { "SUPER + D", "spotlight toggle" },
    { "SUPER + V", "clipboard toggle" },
    { "SUPER + M", "processlist toggle" },
    { "SUPER + N", "notifications toggle" },
    { "SUPER + comma", "settings toggle" },
    { "SUPER + P", "notepad toggle" },
    { "SUPER + ALT + L", "lock lock" },
    { "SUPER + SHIFT + E", "powermenu toggle" },
    { "SUPER + SHIFT + N", "night toggle" },
}
for _, item in ipairs(bindings) do
    hl.bind(item[1], exec("dms ipc call " .. item[2]))
end

local controls = {
    { "XF86AudioRaiseVolume", "audio increment 3" },
    { "XF86AudioLowerVolume", "audio decrement 3" },
    { "XF86AudioMute", "audio mute" },
    { "XF86AudioMicMute", "audio micmute" },
    { "XF86MonBrightnessUp", 'brightness increment 5 ""' },
    { "XF86MonBrightnessDown", 'brightness decrement 5 ""' },
}
for _, item in ipairs(controls) do
    hl.bind(item[1], exec("dms ipc call " .. item[2]), { locked = true, repeating = true })
end
