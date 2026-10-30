-- https://wiki.hypr.land/0.57.0/configuring/core/rules/

-- keep the five numbered workspaces alive for the Waybar workspace buttons.
for workspace = 1, 5 do
    hl.workspace_rule({ workspace = tostring(workspace), persistent = true })
end

-- fullscreen in only window in workspace
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0, border_size = 0, no_rounding = true })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0, border_size = 0, no_rounding = true })

-- Picture-in-Picture
hl.window_rule({
    match = { title = "^Picture-in-Picture$" },
    float = true,
    pin = true,
    no_anim = true,
    size = { 266, 150 },
    center = true,
})

-- Ignore maximize requests from apps
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })
--
-- Fix some dragging issues with XWayland
-- hl.window_rule({
--     match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
--     no_initial_focus = true,
-- })
