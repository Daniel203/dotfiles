local scripts = (os.getenv("HOME") or "~") .. "/.config/hypr/scripts/"
local exec = hl.dsp.exec_cmd

-- Keep the original lid switch script and its on/off argument mapping.
hl.bind("switch:off:Lid Switch", exec(scripts .. "lid_switch.sh on"), { locked = true })
hl.bind("switch:on:Lid Switch", exec(scripts .. "lid_switch.sh off"), { locked = true })

hl.bind("SUPER + Return", exec("kitty"))
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.close())
hl.bind("SUPER + E", exec("nautilus"))
hl.bind("SUPER + SHIFT + Space", hl.dsp.window.float())
hl.bind("SUPER + C", exec("rofi -show calc -modi calc -no-show-match -no-sort -automatic-save-to-history"))
hl.bind("SUPER + I", exec("XDG_CURRENT_DESKTOP=GNOME gnome-control-center"))

for key, direction in pairs({ h = "l", j = "d", k = "u", l = "r" }) do
    hl.bind("SUPER + " .. key, hl.dsp.focus({ direction = direction }))
end
-- Preserve the original window-move mapping, including its j/k directions.
for key, direction in pairs({ h = "l", j = "u", k = "d", l = "r" }) do
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ direction = direction }))
end

-- The existing shell script synchronizes workspace changes on all displays.
for index = 1, 10 do
    local key = tostring(index % 10)
    -- hl.bind( "SUPER + " .. key, exec("bash " .. scripts .. "multi-monitor-workspaces.sh " .. index))
    hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = tostring(index) }))
    hl.bind( "SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = index }))
end

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("SUPER + SHIFT + R", exec('hyprctl reload && notify-send "Hyprland config reloaded!"'))
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + SHIFT + W", exec(scripts .. "restart_dms.sh"))

hl.bind("SUPER + SHIFT + S", exec("hyprshot -m region -o ~/Pictures/Screenshots"))
hl.bind("SUPER + S", exec("hyprshot -m output -o ~/Pictures/Screenshots"))
hl.bind("SUPER + CTRL + S", exec("hyprshot -m window -o ~/Pictures/Screenshots"))

hl.bind("XF86AudioPlay", exec("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", exec("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", exec("playerctl previous"), { locked = true })
