#!/bin/bash
disk_usage=$(df -h / | tail -n1 | awk '{ print $5 }' | cut -d'%' -f1)

if [ "$disk_usage" -ge 90 ]
then
	echo "CRITICAL ALERT: Disk usage is above 90%"
elif [ "$disk_usage" -ge 80 ]
then
	echo "WARNING: Disk usage is above 80%"
else
	echo "System is OK"
fi
