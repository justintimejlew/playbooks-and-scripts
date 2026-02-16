#!/bin/bash
# This script allows you to check a service status and restart it if it is not running.
#
read -p "Enter the service you would like to check: " SERVICE

# 1. Check if the service exists/is installed
if ! systemctl list-unit-files "${SERVICE}.service" &>/dev/null; then
    echo "ERROR: $SERVICE is not installed on this system."
    exit 1
fi

# 2. Check if the service is running
if systemctl is-active --quiet "$SERVICE"; then
    echo "OK: $SERVICE is running."
else
    # 3. If installed but not running, restart
    echo "WARNING: $SERVICE is down. Restarting..."
    if systemctl restart "$SERVICE"; then
            echo "SUCCESS: $SERVICE has been restarted."
    else    
            echo "FAILURE: Could not restart $SERVICE. Check system logs"
    fi      
fi