-- Preserve application-to-workspace assignments; remove duplicate zen entry.
local workspace_classes = {
    [1] = { "kitty" },
    [2] = { "firefox", "LibreWolf", "zen" },
    [6] = { "ord.kde.kdeconnect.app" },
    [7] = { "org.mozilla.Thunderbird" },
    [8] = { "WebCord", "discord" },
    [9] = { "org.telegram.desktop" },
    [10] = { "spotify", "org.gnome.Music" },
}

for workspace, classes in pairs(workspace_classes) do
    for _, class in ipairs(classes) do
        hl.window_rule({ match = { class = "^" .. class:gsub("%.", "\\.") .. "$" }, workspace = tostring(workspace) })
    end
end

-- XWayland video bridge screen-sharing workarounds.
local bridge = { class = "^xwaylandvideobridge$" }
hl.window_rule({ match = bridge, opacity = "0.0 override" })
hl.window_rule({ match = bridge, no_initial_focus = true })
hl.window_rule({ match = bridge, no_blur = true })
hl.window_rule({ match = bridge, max_size = { 1, 1 } })
hl.window_rule({ match = bridge, no_anim = true })
