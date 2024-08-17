#!/bin/bash

# Log file
LOG_FILE="./system_monitor.log"

# Get the current timestamp
timestamp=$(date '+%Y-%m-%d %H:%M:%S')

# Capture CPU usage
cpu_usage=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4 "% CPU Usage"}')

# Capture memory usage
memory_usage=$(free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }')

# Capture disk usage
disk_usage=$(df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}')

# Log the output to the file
echo "$timestamp" >> $LOG_FILE
echo "$cpu_usage" >> $LOG_FILE
echo "$memory_usage" >> $LOG_FILE
echo "$disk_usage" >> $LOG_FILE
echo "--------------------------" >> $LOG_FILE
