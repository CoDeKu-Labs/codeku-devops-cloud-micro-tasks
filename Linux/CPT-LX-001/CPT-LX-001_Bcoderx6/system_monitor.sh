#!/bin/bash

# Log file location
LOGFILE="system_monitor.log"

# Get current date and time
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Get CPU usage using top command
CPU_USAGE=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Get Memory usage using free command
MEMORY_USAGE=$(free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }')

# Get Disk usage using df command
DISK_USAGE=$(df -h | grep '^/dev/' | awk '{print $5 " of " $1}')

# Log the results with a timestamp
echo "[$TIMESTAMP] CPU Usage: $CPU_USAGE% | $MEMORY_USAGE | Disk Usage: $DISK_USAGE" >> $LOGFILE

