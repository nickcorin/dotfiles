#!/bin/bash

# Get current network connection info for tmux status bar
# Shows actual WiFi SSID when connected

# Check if we're on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Try to get WiFi SSID using system_profiler (more reliable)
    SSID=$(system_profiler SPAirPortDataType 2>/dev/null | awk '/Current Network Information:/{getline; if($0 ~ /[A-Za-z0-9]/ && $0 !~ /Network Type/) {gsub(/^[ \t]+/, "", $0); gsub(/:$/, "", $0); print $0; exit}}')
    
    if [[ -n "$SSID" ]]; then
        echo " 󰖩 $SSID"
    else
        # Check actual connectivity like the original plugin
        if ping -c 1 -t 3 www.google.com >/dev/null 2>&1; then
            # We have internet but no WiFi SSID, so probably ethernet
            echo " 󰖩 wired"
        else
            # No internet connectivity - output with red styling
            echo "#[fg=#{@thm_red}] 󰖪 offline"
        fi
    fi
else
    # Linux fallback
    if command -v iwgetid >/dev/null 2>&1; then
        SSID=$(iwgetid -r 2>/dev/null)
        if [[ -n "$SSID" ]]; then
            echo " 󰖩 $SSID"
        else
            # Check connectivity for proper offline detection
            if ping -c 1 -W 3 www.google.com >/dev/null 2>&1; then
                echo " 󰖩 wired"
            else
                echo "#[fg=#{@thm_red}] 󰖪 offline"
            fi
        fi
    elif [[ -d /sys/class/net/wlan0 ]]; then
        # WiFi interface exists but no iwgetid command
        if ping -c 1 -W 3 www.google.com >/dev/null 2>&1; then
            echo " 󰖩 wifi"
        else
            echo "#[fg=#{@thm_red}] 󰖪 offline"
        fi
    else
        # No WiFi interface, check if we have connectivity
        if ping -c 1 -W 3 www.google.com >/dev/null 2>&1; then
            echo " 󰖩 wired"
        else
            echo "#[fg=#{@thm_red}] 󰖪 offline"
        fi
    fi
fi