#!/bin/bash

# Log file location
LOGFILE="system_monitor.log"

# Capture timestamp
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Capture CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')%

# Capture memory usage
MEMORY_USAGE=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }')%

# Capture disk usage
DISK_USAGE=$(df -h / | awk '$NF=="/"{printf "%s", $5}')

# Log the output to the file
echo "$TIMESTAMP CPU: $CPU_USAGE, Memory: $MEMORY_USAGE, Disk: $DISK_USAGE" >> $LOGFILE
