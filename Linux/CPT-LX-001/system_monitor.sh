#!/bin/bash

# Define the log file path
LOG_FILE="system_monitor.log"

# Get the current date and time
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Capture CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
if [ -z "$CPU_USAGE" ]; then
    CPU_USAGE="Error"
fi

# Capture memory usage
MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
if [ -z "$MEMORY_USAGE" ]; then
    MEMORY_USAGE="Error"
fi

# Capture disk usage
DISK_USAGE=$(df -h | grep '^/dev/' | awk '{print $1 " " $5}')
if [ -z "$DISK_USAGE" ]; then
    DISK_USAGE="Error"
fi

# Log the output
echo "$DATE - CPU Usage: $CPU_USAGE% | Memory Usage: $MEMORY_USAGE% | Disk Usage: $DISK_USAGE" >> $LOG_FILE