#!/bin/bash

LOG_FILE="system_monitor.log"

TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

CPU_USAGE=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')

MEM_USAGE=$(free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)", $3,$2,$3*100/$2 }')

DISK_USAGE=$(df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)", $3,$2,$5}')

echo "$TIMESTAMP - CPU Usage: $CPU_USAGE% - $MEM_USAGE - $DISK_USAGE" >> $LOG_FILE
