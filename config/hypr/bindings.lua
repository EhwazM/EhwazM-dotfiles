-- ---- KEYBINDINGS ----

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
-- Set programs that you use
local terminal = "kitty"
local fileManager = "thunar"
local termFM = "ranger"
local menu = "rofi -show drun"
local menuRunner = "rofi -show run"
local texteditor = "neovim"
local main_display = "eDP-1"
local second_display = "HDMI-A-1"
local mainMod = "SUPER"

-- Window management
hl.bind(mainMod .. " + Escape", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Escape", hl.dsp.window.kill())
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.exit())

hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + G", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + mouse:274", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + T", hl.dsp.window.pin())

-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Navigation between workspaces
hl.bind("ALT + Tab",       hl.dsp.focus({ workspace = "e+1" }))
hl.bind("ALT + SHIFT + Tab", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "previous" }))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
-- hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
-- hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


-- ---- SCREENSHOTS ----

-- Screenshot of a region
-- hl.bind(
--     mainMod .. " + SHIFT + Print",
--     hl.dsp.exec_cmd(
--         'grim -g "$(slurp)" - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | dunstify "Screenshot of the region taken" -t 1000'
--     )
-- )

hl.bind(
    mainMod .. " + SHIFT + Print",
    hl.dsp.exec_cmd(
        "hyprshot -z -m region -o ~/Pictures/Screenshots/ -f Screenshot-$(date +%F_%T).png"
    )
)

-- Screenshot of the whole screen
hl.bind(
    "Print",
    hl.dsp.exec_cmd(
        'grim -o "$(hyprctl activeworkspace -j | jq -r \'.monitor\')" - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | notify-send "Screenshot of whole screen taken" -t 1000'
    )
)

-- Screenshot of the active window
hl.bind(
    mainMod .. " + Print",
    hl.dsp.exec_cmd(
        "hyprshot -z -m window -o ~/Pictures/Screenshots/ -f Screenshot-$(date +%F_%T).png"
    )
)


-- ---- CLIPHIST ----

hl.bind(
    mainMod .. " + V",
    hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy")
)


-- ---- VOLUME CONTROL ----

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("pamixer -i 1"),
    { repeating = true }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("pamixer -d 1"),
    { repeating = true }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("pamixer -t")
)

hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    { locked = true }
)

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    { locked = true }
)

-- Microphone mute
-- hl.bind(
--     "XF86AudioMicMute",
--     hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle")
-- )


-- ---- BRIGHTNESS CONTROL ----

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl set 5%-"),
    { repeating = true }
)

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl set +5%"),
    { repeating = true }
)

hl.bind(
    mainMod .. " + comma",
    hl.dsp.exec_cmd("brightnessctl set 5%-")
)

hl.bind(
    mainMod .. " + period",
    hl.dsp.exec_cmd("brightnessctl set +5%")
)


-- ---- EXEC PROGRAMS ----

hl.bind(
    mainMod .. " + E",
    hl.dsp.exec_cmd(fileManager)
)

hl.bind(
    mainMod .. " + N",
    hl.dsp.exec_cmd(terminal .. " -e nvim")
)

hl.bind(
    mainMod .. " + SHIFT + E",
    hl.dsp.exec_cmd(terminal .. " -e " .. termFM)
)

hl.bind(
    "SHIFT + XF86Calculator",
    hl.dsp.exec_cmd(terminal .. " --title 'calc' -e calc")
)

hl.bind(
    "XF86Calculator",
    hl.dsp.exec_cmd("qalculate-qt")
)

hl.bind(
    mainMod .. " + R",
    hl.dsp.exec_cmd(menu)
)

hl.bind(
    mainMod .. " + SHIFT + R",
    hl.dsp.exec_cmd(menuRunner)
)

hl.bind(
    mainMod .. " + Q",
    hl.dsp.exec_cmd(terminal)
)


-- ---- RELOADS ----

hl.bind(
    mainMod .. " + W",
    hl.dsp.exec_cmd("pkill waybar && (waybar &)")
)

hl.bind(
    mainMod .. " + H",
    hl.dsp.exec_cmd("pkill hyprpaper; (hyprpaper &)")
)

hl.bind(
    mainMod .. " + SHIFT + H",
    hl.dsp.exec_cmd("pkill hyprpaper")
)


-- ---- HYPRPICKER ----

hl.bind(
    mainMod .. " + SHIFT + P",
    hl.dsp.exec_cmd("hyprpicker -ar")
)

