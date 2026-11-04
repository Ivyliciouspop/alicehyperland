#!/bin/bash
if pgrep -x DiscordCanary > /dev/null; then
    echo '{"text": "󰙯", "tooltip": "Discord Canary running", "class": "active"}'
else
    echo '{"text": "󰙯", "tooltip": "Discord Canary not running", "class": "inactive"}'
fi