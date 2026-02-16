#!/bin/bash
SERVICE="sshd"

if systemctl is-active --quiet "$SERVICE"; then
    echo "$SERVICE is running."
else
    echo "$SERVICE is down. Restarting..."
    systemctl restart "$SERVICE"
fi