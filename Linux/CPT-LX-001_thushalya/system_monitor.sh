#!/bin/bash

# Log file location 
LOG_FILE="./system_monitor.log"

# Timestamp
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Capture CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4 + $6 "%"}')

# Capture Memory usage
MEMORY_USAGE=$(free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3, $2, $3*100/$2 }')

# Capture Disk usage
DISK_USAGE=$(df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n", $3, $2, $5}')

# Log the information
echo "[$TIMESTAMP] CPU Usage: $CPU_USAGE, Memory Usage: $MEMORY_USAGE, Disk Usage: $DISK_USAGE" >> "$LOG_FILE"
