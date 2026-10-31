-- https://wiki.hypr.land/0.57.0/configuring/core/autostart/

hl.on("hyprland.start", function()
    hl.exec_cmd("dunst & waybar & hyprpaper & wal -i ~/Pictures/xp.jpg -n")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("thunar --daemon")
end)
