-- Personal settings, kept separate from DMS-generated theme and display files.

hl.env("XCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("GDK_SCALE", "1.6")

hl.config({
    input = {
        kb_layout = "us,us",
        kb_variant = "dvorak,",
        kb_options = "grp:win_space_toggle,caps:escape,compose:ralt",
        follow_mouse = 1,
        touchpad = {
            natural_scroll = true,
            disable_while_typing = false,
        },
        resolve_binds_by_sym = true,
        sensitivity = 0,
    },
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        ["col.active_border"] = "rgba(ffffffaa)",
        ["col.inactive_border"] = "rgba(595959aa)",
        layout = "dwindle",
        allow_tearing = false,
    },
    decoration = { rounding = 10 },
    animations = { enabled = false },
    dwindle = { preserve_split = true },
    misc = {
        force_default_wallpaper = 1,
        disable_splash_rendering = true,
        disable_hyprland_logo = true,
    },
})

hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
