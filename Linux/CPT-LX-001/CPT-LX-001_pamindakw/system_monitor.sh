#!/bin/bash

logfile="/path/to/your/logfile/system_monitor.log"

# Getting current timestamp
currentTime=$(date +"%T")

# Taking CPU usage using top command
cpuUsage=$(top -b -n 1 | grep "Cpu(s)" | awk '{print $2 " %"}')

# Taking memory usage using free command
memoryUsage=$(free -m | awk 'NR==2 {print $3 "/" $2 " MB"}')

# Taking disk usage using df command
diskUsage=$(df -h | awk 'NR==2 {print $5}')

# Log the output to a file
echo "CPU Usage: $cpuUsage | Memory Usage: $memoryUsage | Disk Usage: $diskUsage at $currentTime " >> "$logfile"
