#!/bin/bash

# Current date and time
timestamp=$(date '+%Y-%m-%d %H:%M:%S')

# Capture CPU usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}' | sed 's/,/./')

# Capture current memory usage
memory_usage=$(free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }')

# Capture disk usage
disk_usage=$(df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}')

# Output results goes system_monitor.log

{
echo "system monitor"
echo "----------------------------------------"
echo "$timestamp"
echo "CPU Usage: $cpu_usage%"
echo "$memory_usage"
echo "$disk_usage"
} > system_monitor.log
