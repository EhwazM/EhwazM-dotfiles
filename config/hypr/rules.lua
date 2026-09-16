-- ============================================================
-- Dialogs
-- ============================================================

hl.window_rule({
    name = "dialog-open-file",
    match = { title = "^Open File.*" },
    float = true,
    center = true,
})

hl.window_rule({
    name = "dialog-select-file",
    match = { title = "^Select a File.*" },
    float = true,
    center = true,
})

hl.window_rule({
    name = "dialog-choose-wallpaper",
    match = { title = "^Choose wallpaper.*" },
    float = true,
    center = true,
})

hl.window_rule({
    name = "dialog-open-folder",
    match = { title = "^Open Folder.*" },
    float = true,
    center = true,
})

hl.window_rule({
    name = "dialog-save-as",
    match = { title = "^Save As.*" },
    float = true,
    center = true,
})

hl.window_rule({
    name = "dialog-library",
    match = { title = "^Library.*" },
    float = true,
    center = true,
})


-- ============================================================
-- General
-- ============================================================

-- Ignore maximize requests from all apps.
local suppressMaximizeRule = hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- suppressMaximizeRule:set_enabled(false)


-- Fix some dragging issues with XWayland
hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})


-- ============================================================
-- Hyprland-run
-- ============================================================

hl.window_rule({
    name = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move = "20 monitor_h-120",
    float = true,
})


-- ============================================================
-- Floating applications
-- ============================================================

-- btop (Alacritty)
hl.window_rule({
    name = "btop",
    match = {
        class = "^Alacritty$",
        title = "^btop$",
    },

    float = true,
    size = "monitor_w*0.80 monitor_h*0.80",
    center = true,
})


-- calc (Alacritty)
hl.window_rule({
    name = "calc",
    match = {
        class = "^Alacritty$",
        title = "^calc$",
    },

    float = true,
    size = "monitor_w*0.45 monitor_h*0.45",
    move = "monitor_w*0.53 monitor_h*0.10",
})


-- Calcure (calendar)
hl.window_rule({
    name = "calcure",
    match = {
        class = "^Alacritty$",
        title = "^calcure$",
    },

    float = true,
    size = "monitor_w*0.70 monitor_h*0.70",
    center = true,
})


-- ============================================================
-- Utilities
-- ============================================================

-- Qalculate
hl.window_rule({
    name = "qalculate",
    match = {
        class = "^io.github.Qalculate.qalculate-qt$",
    },

    float = true,
    size = "monitor_w*0.55 monitor_h*0.60",
})


-- Pavucontrol
hl.window_rule({
    name = "pavucontrol",
    match = {
        class = "^org.pulseaudio.pavucontrol$",
    },

    float = true,
    size = "monitor_w*0.36 monitor_h*0.75",
    move = "monitor_w*0.57 monitor_h*0.06",
})


-- Blueman
hl.window_rule({
    name = "blueman",
    match = {
        class = "^blueman-manager$",
    },

    float = true,
    size = "monitor_w*0.40 monitor_h*0.75",
    move = "monitor_w*0.58 monitor_h*0.06",
})


-- ============================================================
-- Blender
-- ============================================================

-- Blender Preferences
hl.window_rule({
    name = "blender-preferences",
    match = {
        class = "^blender$",
        title = "^Blender Preferences$",
    },

    float = true,
    size = "monitor_w*0.65 monitor_h*0.75",
    center = true,
})


-- ============================================================
-- Picture-in-Picture
-- ============================================================

hl.window_rule({
    name = "picture-in-picture",
    match = {
        title = "^Picture-in-Picture$",
    },

    float = true,
    size = "monitor_w*0.50 monitor_h*0.50",
})


-- ============================================================
-- Firefox
-- ============================================================

-- Firefox Library
hl.window_rule({
    name = "firefox-library",
    match = {
        class = "^firefox$",
        title = "^Library$",
    },

    float = true,
    size = "monitor_w*0.65 monitor_h*0.75",
    center = true,
})


-- Firefox - Hermesoft
hl.window_rule({
    name = "firefox-hermesoft",
    match = {
        class = "^firefox$",
        title = "^Vortal Hermesoft.*",
    },

    float = true,
    size = "monitor_w*0.75 monitor_h*0.88",
    center = true,
})


-- Firefox - Academusoft
hl.window_rule({
    name = "firefox-academusoft",
    match = {
        class = "^firefox$",
        title = "^Academic - Academusoft.*",
    },

    float = true,
    size = "monitor_w*0.75 monitor_h*0.88",
    center = true,
})


-- ============================================================
-- Prism Launcher
-- ============================================================

-- Console window
hl.window_rule({
    name = "prism-console",
    match = {
        class = "^org.prismlauncher.PrismLauncher$",
        title = "^Console window for 1.20.6 — Prism Launcher 8.3$",
    },

    float = true,
    size = "monitor_w*0.80 monitor_h*0.80",
    center = true,
})


-- ============================================================
-- GitHub Desktop
-- ============================================================

hl.window_rule({
    name = "github-desktop",
    match = {
        class = "^GitHub Desktop$",
    },

    float = true,
    size = "monitor_w*1.00 monitor_h*1.00",
    center = true,
})


-- ============================================================
-- Vivado
-- ============================================================

hl.window_rule({
    name = "vivado",
    match = {
        class = "^Vivado.*",
    },

    float = true,
    center = true,
})


-- ============================================================
-- Layer rules
-- ============================================================

-- Example:
-- local overlayLayerRule = hl.layer_rule({
--     name = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
--
-- overlayLayerRule:set_enabled(false)
