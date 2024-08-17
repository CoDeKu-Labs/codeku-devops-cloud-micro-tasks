#!/bin/bash

# This script will monitor the system (CPU, Memory, Disk) and update the log file every 10 minutes.

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
memory_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
disk_usage=$(df -h | grep '/dev/sdc' | awk '{print $5}')
date_time=$(date '+%Y-%m-%d %H:%M:%S')

(echo "====== System Monitor ======" 
echo "CPU Usage: $cpu_usage%" 
echo "Memory Usage: $memory_usage%" 
echo "Disk Usage: $disk_usage%" 
echo "Date and Time: $date_time") > system_monitor.log
