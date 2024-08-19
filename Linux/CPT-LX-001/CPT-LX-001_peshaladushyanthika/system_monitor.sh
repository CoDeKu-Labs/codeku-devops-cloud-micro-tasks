#!/bin/bash

# Log file path in the current directory
LOGFILE="$(pwd)/system_monitor.log"

# Function to capture CPU usage
get_cpu_usage() {
    echo "CPU Usage:" >> $LOGFILE
    mpstat 1 1 | awk '/^Average:/ {print "User: " $3 "%, System: " $5 "%, Idle: " $12 "%"}' >> $LOGFILE
    echo "" >> $LOGFILE
}

# Function to capture memory usage
get_memory_usage() {
    echo "Memory Usage:" >> $LOGFILE
    free -m | awk 'NR==2{printf "Used: %sMB, Free: %sMB, Total: %sMB\n", $3, $4, $2}' >> $LOGFILE
    echo "" >> $LOGFILE
}

# Function to capture disk usage
get_disk_usage() {
    echo "Disk Usage:" >> $LOGFILE
    df -h | awk '$NF=="/"{printf "Filesystem: %s, Size: %s, Used: %s, Available: %s, Use%%: %s\n", $1, $2, $3, $4, $5}' >> $LOGFILE
    echo "" >> $LOGFILE
}

# Main script execution
echo "-----------------------------------" >> $LOGFILE
echo "Timestamp: $(date '+%Y-%m-%d %H:%M:%S')" >> $LOGFILE
get_cpu_usage
get_memory_usage
get_disk_usage
echo "-----------------------------------" >> $LOGFILE
echo "" >> $LOGFILE


