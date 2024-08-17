#!/bin/bash

# Log file location
LOG_FILE="system_monitor.log"

# Get current timestamp
timestamp=$(date '+%Y-%m-%d %H:%M:%S')

# Capture CPU usage using top
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')

# Capture memory usage using free
memory_usage=$(free -m | awk 'NR==2{printf "Memory Usage: %sMB/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }')

# Capture disk usage using df
disk_usage=$(df -h | grep '^/dev/' | awk '{print $1": "$5 " used ("$4" available)"}')

# Log the system monitoring details
echo "[$timestamp]" >> $LOG_FILE
echo "CPU Usage: $cpu_usage" >> $LOG_FILE
echo "$memory_usage" >> $LOG_FILE
echo "Disk Usage:" >> $LOG_FILE
echo "$disk_usage" >> $LOG_FILE
echo "---------------------------------------" >> $LOG_FILE

# Output to console (optional, for debugging)
echo "System monitor log updated at $timestamp"
