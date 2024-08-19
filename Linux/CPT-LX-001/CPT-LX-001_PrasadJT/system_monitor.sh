#!/bin/bash

LOG_FILE="F:/micro-tasks/codeku-devops-cloud-micro-tasks/Linux/CPT-LX-001/CPT-LX-001_PrasadJT/system_monitor.log"

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

CPU_USAGE=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')

MEMORY_USAGE=$(free -m | awk 'NR==2{printf "Memory Usage: %s%sMB (%.2f%%)\n",$3,$2,$3*100/$2}')

DISK_USAGE=$(df -h | awk '$NF=="/"{printf "Disk Usage: %d %GB (%s)\n",$3,$2,$5}')

echo "[$TIMESTAMP] CPU Usage: $CPU_USAGE% | MEMORY_USAGE | DISK_USAGE" >> $LOG_FILE