#!/bin/bash

# Log file location
LOG_FILE="/home/arosha/Desktop/Codeku Task/system_monitor.log"

# Get current timestamp
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Capture CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/., *\([0-9.]\)%* id.*/\1/" | awk '{print 100 - $1"%"}')

# Capture Memory usage
MEM_USAGE=$(free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }')

# Capture Disk usage
DISK_USAGE=$(df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}')

# Log the output with timestamp
echo "[$TIMESTAMP] CPU Usage: $CPU_USAGE, Memory Usage: $MEM_USAGE, Disk Usage: $DISK_USAGE" >> "$LOG_FILE"
