-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function ()
    -- Your other autostart apps can go here too (like waybar or kitty)
    hl.exec_cmd("hyprpaper")
end)

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
    hl.exec_cmd("kitty")
    hl.exec_cmd("easyeffects --service-mode --hide-window")
    hl.exec_cmd("playerctld daemon")
end)