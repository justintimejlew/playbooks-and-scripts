#!/bin/bash
read -p "Enter the service you would like to check: " SERVICE

if systemctl is-active --quiet "$SERVICE"; then
    echo "$SERVICE is running."
else
    echo "$SERVICE is down. Restarting..."
    systemctl restart "$SERVICE"
fi