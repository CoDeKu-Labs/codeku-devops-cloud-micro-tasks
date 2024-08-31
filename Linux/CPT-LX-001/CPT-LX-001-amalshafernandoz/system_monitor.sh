#!/bin/bash

# Get current timestamp
timestamp=$(date +"%Y-%m-%d %H:%M:%S")

# Capture CPU usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Capture memory usage
memory_usage=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }')

# Capture disk usage
disk_usage=$(df -h | awk '$NF=="/"{printf "%s", $5}')

# Log the output to a file
echo "[$timestamp] CPU: $cpu_usage%, Memory: $memory_usage%, Disk: $disk_usage" >> system_monitor.log
