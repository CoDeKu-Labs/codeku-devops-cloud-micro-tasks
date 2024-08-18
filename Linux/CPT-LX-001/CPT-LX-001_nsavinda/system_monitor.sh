#!/bin/bash

# Create a cron job
if [ "$1" == "enable" ]; then
    SCRIPT_PATH="$(realpath "$0")"
    CRON_JOB="*/10 * * * * $SCRIPT_PATH"
    (crontab -l ; echo "$CRON_JOB" ) | crontab -
    exit 0
fi


LOG_FILE="$(dirname $0)/system_monitor.log"
# LOG_FILE="/var/log/system_monitor.log"

# Get CPU Percentage
CPU_USAGE=$(top -bn1 | grep "Cpu(s):" | awk '{print $2 + $4"%" }' )


# Get Memory Info
MEM_INFO=$(free  | grep "Mem:" | awk '{print $3" "$2}' )
MEM_USAGE=$(numfmt --to=iec --suffix=B --padding=2 $(awk '{print $1*1024}' <<< $MEM_INFO))
# Memory Percentage
MEM_USAGE_PER=$(awk '{print ($1/$2)*100}' <<< $MEM_INFO )

# Get Disk Usage
DISK_USAGE=$(df -h | grep '^/dev/' | awk '{printf (NR>1 ? ", " : "") "%s of %s", $5, $1}')

# Get Current Timestamp
TIMESTAMP=$(date "+[%Y-%m-%dT%H:%M:%S%z]")

echo "$TIMESTAMP | CPU: $CPU_USAGE | Memory: $MEM_USAGE ($MEM_USAGE_PER%) | Disk: $DISK_USAGE" >>  $LOG_FILE
