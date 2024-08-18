#!/bin/bash

# Get current timestamp
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Log the output to the file 
{
    echo "####### System Monitoring Report #######"
    echo
    echo "Date : [$TIMESTAMP]"
    echo
    echo "### CPU Usage ###"
    echo "$(mpstat | awk '/all/ {print 100 - $12 "%"}' )" 
    echo
    echo "### Memory Usage ###"
    echo "$(free -h | awk '/Mem:/ {print $3 " used out of " $2}')"
    echo
    echo "### Disk Usage ###"
    df -h | awk 'NR==1 || /^\/dev\//' | while read -r line; do echo "$line"; done
    echo "--------------------------------------------"
} >> system_monitor.log
