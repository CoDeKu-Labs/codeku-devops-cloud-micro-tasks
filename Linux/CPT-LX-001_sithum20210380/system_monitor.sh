#!/bin/bash

# File to log the output
LOG_FILE="system_monitor.log"

# Function to get current timestamp
get_timestamp() {
    date "+%Y-%m-%d %H:%M:%S"
}

# Function to get CPU usage
get_cpu_usage() {
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}'
}
# Function to get CPU Usage compatible with Mac OS
# get_cpu_usage() {
#     top -l 1 | grep "CPU usage" | awk '{print $3}' | cut -d% -f1
# }

# Function to get memory usage
get_memory_usage() {
    free | grep Mem | awk '{print $3/$2 * 100.0"%"}'
}
# Function to get memory usage compatible with Mac OS as it is not support Free command
# get_memory_usage() {
#     top -l 1 | grep PhysMem | awk '{print $2}'
# }

# Function to get disk usage
get_disk_usage() {
    df -h / | awk '/\// {print $(NF-1)}'
}

# Main function to log system information
log_system_info() {
    echo "$(get_timestamp) - System Monitor Log" >> "$LOG_FILE"
    echo "CPU Usage: $(get_cpu_usage)" >> "$LOG_FILE"
    echo "Memory Usage: $(get_memory_usage)" >> "$LOG_FILE"
    echo "Disk Usage: $(get_disk_usage)" >> "$LOG_FILE"
    echo "-----------------------------" >> "$LOG_FILE"
}

# Run the main function
log_system_info

echo "System information logged to $LOG_FILE"