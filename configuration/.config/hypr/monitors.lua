-- See https://wiki.hypr.land/0.57.0/configuring/core/monitors/

-- primary; built-in monitor
hl.monitor({ output = "eDP-1", mode = "1366x768", position = "auto", scale = 1.0 })

-- custom
hl.monitor({ output = "DP-2", mode = "preferred", position = "auto-right", scale = 1 })
hl.monitor({ output = "DP-1", mode = "preferred", position = "auto-up", scale = 1.5 })
hl.monitor({ output = "DP-3", mode = "1366x768", position = "auto-left", scale = 0.67 })

-- fallback; duplicate built-in screen on all other monitors
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1, mirror = "eDP-1" })
