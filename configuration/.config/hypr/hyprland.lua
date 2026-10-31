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
-- Default curves
--        NAME,           X0,   Y0,   X1,   Y1
hl.curve("easeOutQuint",   { type = "bezier", points = { { 0.23, 1 },    { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear",         { type = "bezier", points = { { 0, 0 },      { 1, 1 } } })
hl.curve("almostLinear",   { type = "bezier", points = { { 0.5, 0.5 },  { 0.75, 1 } } })
hl.curve("quick",          { type = "bezier", points = { { 0.15, 0 },   { 0.1, 1 } } })

-- https://wiki.hypr.land/0.57.0/configuring/core/animations/
-- Default animations
--           NAME,          ONOFF, SPEED, CURVE,        [STYLE]
hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.8,  bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.8,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 2.4,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "easeOutQuint" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "easeOutQuint" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 3.2,  bezier = "easeOutQuint", style = "slidefade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 3.2,  bezier = "easeOutQuint", style = "slidefade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 3.2,  bezier = "easeOutQuint", style = "slidefade" })
hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 7,    bezier = "quick" })
