#!/bin/bash

# Path to the log file
LOG_FILE="/home/devops/Documents/PROJECTS/codeku-devops-cloud-micro-tasks/Linux/CPT-LX-001/CPT-LX-001_lakshithaiam/system_monitor.log"

# Log system resources with timestamp
{
    echo "Timestamp: $(date '+%Y-%m-%d %H:%M:%S')"
    
    # CPU usage
    top -bn1 | grep "Cpu(s)" | awk '{print "CPU usage: " $2 + $4 "%"}'
    
    # Memory usage
    free -m | awk 'NR==2{print "Memory Usage: " $3 "/" $2 "MB (" $3*100/$2 "%)"}'
    
    # Disk usage
    df -h | grep -E '^/dev/' | awk '{print "Disk Usage: " $1 " " $5}'
    
    echo "-------------------------------"
} >> $LOG_FILE
