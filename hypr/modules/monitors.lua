------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "DP-1",
    mode     = "2560x1440@239.76Hz",
    position = "1440x0",
    scale    = "auto",
})

hl.monitor({
    output    = "DP-2",
    mode      = "2560x1440@240.08Hz",
    position  = "0x0",
    scale     = "auto",
    transform = 1,
})
-- ADDED FOR OW STUTTER REMOVE IF ISSUES --

hl.config({
  general = {
    allow_tearing = true
  }
})

-- Workspaces 1-5 on DP-5 (main), 6-10 on DP-6
for i = 1, 5 do
    hl.workspace_rule({
        workspace  = tostring(i),
        monitor    = "DP-1",
        default    = (i == 1),
        persistent = true,
    })
end

for i = 6, 10 do
    hl.workspace_rule({
        workspace  = tostring(i),
        monitor    = "DP-2",
        default    = (i == 6),
        persistent = true,
    })
end