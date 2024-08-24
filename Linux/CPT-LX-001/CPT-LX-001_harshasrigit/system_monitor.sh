#!/bin/bash

# Define log file
LOGFILE="system_monitor.log"

# Get the current timestamp
Timestamp=$(date '+%Y-%m-%d %H:%M:%S')

# Capture CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

# Capture memory usage
MEMORY_USAGE=$(free -m | awk '/Mem:/ {print $3 " MB used of " $2 " MB total"}')

# Capture disk usage
DISK_USAGE=$(df -h | awk '$NF=="/"{print $3 " used of " $2 " total"}')

# Write to log file with timestamp
echo "Time Stamp: $Timestamp" >> $LOGFILE
echo "CPU Usage: $CPU_USAGE%" >> $LOGFILE
echo "Memory Usage: $MEMORY_USAGE" >> $LOGFILE
echo "Disk Usage: $DISK_USAGE" >> $LOGFILE
echo "---------------------------------" >> $LOGFILE

