#!/bin/bash

# Define log file
LOG_FILE="system_monitor.log"

# Get the current timestamp
timestamp=$(date '+%Y-%m-%d %H:%M:%S')

# Capture CPU usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')

# Capture memory usage
memory_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0"%"}')

# Capture disk usage
disk_usage=$(df / | grep / | awk '{print $5}')

# Log the output to the log file
echo "Timestamp: $timestamp" >> "$LOG_FILE"
echo "CPU Usage: $cpu_usage" >> "$LOG_FILE"
echo "Memory Usage: $memory_usage" >> "$LOG_FILE"
echo "Disk Usage: $disk_usage" >> "$LOG_FILE"
echo "---------------------------" >> "$LOG_FILE"
