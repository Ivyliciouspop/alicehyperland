-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
-- Cursor
hl.env("XCURSOR_THEME", "catppuccin-latte-rosewater-cursors")
hl.env("HYPRCURSOR_THEME", "catppuccin-latte-rosewater-cursors")


-- Toolkit backend
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-- XDG
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

--Qt
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

--Nvidia
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
hl.env("WLR_DRM_NO_ATOMIC", "1")

-- Electron
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")   
hl.on("hyprland.start", function()
    hl.exec_cmd("vesktop --enable-features=WaylandLinuxDrmSyncobj")
end)
hl.on("hyprland.start", function()
    hl.exec_cmd("/usr/bin/discord-canary --enable-features=WaylandLinuxDrmSyncobj")
end)
