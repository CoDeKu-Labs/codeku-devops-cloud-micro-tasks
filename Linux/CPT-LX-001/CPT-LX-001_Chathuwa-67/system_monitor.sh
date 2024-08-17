#!/bin/bash

# Log file location
LOG_FILE="system_monitor.log"

# Get current date and time
timestamp=$(date '+%Y-%m-%d %H:%M:%S')

# Capture CPU usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}' | awk '{print "CPU Usage: " $1 "%"}')

# Capture Memory usage
memory_usage=$(free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }')

# Capture Disk usage
disk_usage=$(df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}')

# Log the data
echo -e "Timestamp: $timestamp\n$cpu_usage\n$memory_usage\n$disk_usage\n" >> $LOG_FILE
