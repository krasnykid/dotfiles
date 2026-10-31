-- https://wiki.hypr.land/0.57.0/configuring/core/

require("./input")
require("./windowrules")
require("./monitors")
require("./envvars")
require("./autostart")
require("./keybinds")
require("./misc")

local function refresh_layout_bar()
    hl.exec_cmd("sleep 0.1; pkill -RTMIN+8 waybar")
end

hl.on("workspace.active", refresh_layout_bar)
hl.on("workspace.special_active", refresh_layout_bar)
hl.on("monitor.focused", refresh_layout_bar)

-- https://wiki.hypr.land/Configuring/Variables/#general
hl.config({
    general = {
        gaps_in = 8,
        gaps_out = { top = 4, right = 8, bottom = 8, left = 8 },

        border_size = 0,

        -- https://wiki.hypr.land/Configuring/Variables/#variable-types for info about colors
        col = {
            active_border = {
                colors = { "rgba(eeeeee22)", "rgba(000000ee)" },
                angle = 30,
            },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        allow_tearing = false,

        layout = "scrolling",
    },

    -- https://wiki.hypr.land/Configuring/Variables/#decoration
    decoration = {
        rounding = 8,
        rounding_power = 2,

        -- https://wiki.hypr.land/0.57.0/configuring/core/config-options/#decoration-blur
        blur = {
            enabled = true,
            size = 4,
            passes = 2,
            noise = 0.1,
            vibrancy = 0.1696,
        },

        -- Change transparency of focused and unfocused windows
        active_opacity = 0.9,
        inactive_opacity = 0.75,

        shadow = {
            enabled = true,
            range = 16,
            render_power = 4,
            color = "rgba(00000050)",
        },
    },

    -- https://wiki.hypr.land/Configuring/Variables/#animations
    animations = {
        enabled = true,
    },

    -- See https://wiki.hypr.land/Configuring/Dwindle-Layout/ for more
    dwindle = {
        preserve_split = true, -- You probably want this
    },

    -- See https://wiki.hypr.land/Configuring/Master-Layout/ for more
    master = {
        new_status = "slave",
    },

    scrolling = {
        focus_fit_method = 0,
        column_width = 0.75,
    },

    xwayland = {
        force_zero_scaling = true,
    },
})

-- https://wiki.hypr.land/0.57.0/configuring/core/animations/#curves
-- Kinetic: a restrained opening spring, clean travel, and decisive exits.
hl.curve("kineticSpring", { type = "spring", mass = 1.2, stiffness = 800, damping = 50 })
hl.curve("kineticGlide",  { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
hl.curve("kineticTravel", { type = "bezier", points = { { 0.22, 0.75 }, { 0.18, 1 } } })
hl.curve("kineticExit",   { type = "bezier", points = { { 0.4, 0 }, { 1, 1 } } })
hl.curve("linear",        { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })

-- https://wiki.hypr.land/0.57.0/configuring/core/animations/
-- Speeds are in deciseconds; springs use their physical parameters for timing.
hl.animation({ leaf = "global",        enabled = true, speed = 3,   bezier = "kineticGlide" })
hl.animation({ leaf = "border",        enabled = true, speed = 2,   bezier = "kineticGlide" })
hl.animation({ leaf = "windows",       enabled = true, speed = 3,   bezier = "kineticGlide" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 3.6, spring = "kineticSpring", style = "popin 78%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.6, bezier = "kineticExit", style = "popin 94%" })
-- No bounce while scrolling columns, moving, or resizing windows.
hl.animation({ leaf = "windowsMove",   enabled = true, speed = 2.8, bezier = "kineticGlide" })
hl.animation({ leaf = "fade",          enabled = true, speed = 1.8, bezier = "linear" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.4, bezier = "kineticGlide" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.6, bezier = "kineticExit" })
hl.animation({ leaf = "fadeSwitch",    enabled = true, speed = 1.6, bezier = "linear" })
-- Panels and launchers slide from their anchor instead of simply appearing.
hl.animation({ leaf = "layers",        enabled = true, speed = 2.6, bezier = "kineticGlide" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 2.6, bezier = "kineticGlide", style = "slide" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.6, bezier = "kineticExit", style = "slide" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.4, bezier = "linear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.6, bezier = "linear" })
-- Short horizontal workspace travel with a soft fade.
hl.animation({ leaf = "workspaces",    enabled = true, speed = 3.4, bezier = "kineticTravel", style = "slidefade 22%" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 3.4, bezier = "kineticTravel", style = "slidefade 22%" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 3.4, bezier = "kineticTravel", style = "slidefade 22%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "kineticGlide", style = "slidefade 12%" })
hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 3,   bezier = "kineticGlide" })
