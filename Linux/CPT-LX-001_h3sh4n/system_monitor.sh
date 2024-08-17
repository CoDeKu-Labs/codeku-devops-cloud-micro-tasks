#!/bin/bash

# Define the log file
LOG_FILE="system_monitor.log"

# Get the current date and time
DATE_TIME=$(date +"%Y-%m-%d %H:%M:%S")

# Capture the CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

# Capture the memory usage
MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

# Capture the disk usage
DISK_USAGE=$(df | grep '/dev/sda1' | awk '{print $5}' | sed 's/%//')

# Write the output to the log file
echo "$DATE_TIME CPU: $CPU_USAGE% Memory: $MEMORY_USAGE% Disk: $DISK_USAGE%" >> $LOG_FILE