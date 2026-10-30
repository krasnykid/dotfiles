-- See https://wiki.hypr.land/0.57.0/configuring/core/binds/
-- See https://wiki.hypr.land/Configuring/Keywords/

local programs = require("./keywords")
local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local resizeStep = 32

local function modbind(keys, dispatcher, flags)
    hl.bind(mainMod .. " + " .. keys, dispatcher, flags)
end

-- app launcher
modbind("Space", hl.dsp.exec_cmd(programs.menu))
modbind("SHIFT + S", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | swappy -f -]]))

-- example binds, see https://wiki.hypr.land/0.57.0/configuring/core/binds/ for more
modbind("Return", hl.dsp.exec_cmd(programs.terminal))
modbind("Q", hl.dsp.window.close())
modbind("SHIFT + Q", hl.dsp.exec_cmd("hyprlock"))
modbind("M", hl.dsp.exit())
modbind("E", hl.dsp.exec_cmd(programs.fileManager))
modbind("V", hl.dsp.window.float({}))
modbind("P", hl.dsp.window.pseudo({})) -- dwindle
-- modbind("X", hl.dsp.layout("togglesplit")) -- dwindle

-- move focus with mainMod + arrow keys
modbind("H", hl.dsp.focus({ direction = "l" }))
modbind("L", hl.dsp.focus({ direction = "r" }))
modbind("K", hl.dsp.focus({ direction = "u" }))
modbind("J", hl.dsp.focus({ direction = "d" }))

-- resize windows with SUPER + Ctrl + motion
modbind("CTRL + H", hl.dsp.window.resize({ x = -resizeStep, y = 0, relative = true }), { repeating = true })
modbind("CTRL + L", hl.dsp.window.resize({ x = resizeStep, y = 0, relative = true }), { repeating = true })
modbind("CTRL + K", hl.dsp.window.resize({ x = 0, y = resizeStep, relative = true }), { repeating = true })
modbind("CTRL + J", hl.dsp.window.resize({ x = 0, y = -resizeStep, relative = true }), { repeating = true })

-- move windows
modbind("SHIFT + H", hl.dsp.window.move({ direction = "l" }))
modbind("SHIFT + L", hl.dsp.window.move({ direction = "r" }))
modbind("SHIFT + K", hl.dsp.window.move({ direction = "u" }))
modbind("SHIFT + J", hl.dsp.window.move({ direction = "d" }))

-- switch between the five configured workspaces with mainMod + [1-5]
for workspace = 1, 5 do
    local id = tostring(workspace)
    modbind(id, hl.dsp.focus({ workspace = id }))
end

-- move the active window to a workspace with mainMod + SHIFT + [1-5]
for workspace = 1, 5 do
    local id = tostring(workspace)
    modbind("SHIFT + " .. id, hl.dsp.window.move({ workspace = id }))
end

-- move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true, locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { repeating = true, locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { repeating = true, locked = true })

-- requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
