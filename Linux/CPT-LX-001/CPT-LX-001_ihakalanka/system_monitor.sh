#!/bin/bash
set -euo pipefail
trap 'echo "Error occurred on line $LINENO"; exit 1' ERR

LOG_DIR="${LOG_DIR:-/mnt/c/New folder/codeku-devops-cloud-micro-tasks/Linux/CPT-LX-001/CPT-LX-001_ihakalanka}"
LOG_FILE="$LOG_DIR/system_monitor.log"

# Ensure the log directory exists
mkdir -p "$LOG_DIR"

# Fetch and calculate CPU load percentage
get_cpu_usage() {
    local cpu_load
    cpu_load=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    echo "CPU Load: ${cpu_load}%"
}

# Fetch and display memory usage
get_memory_usage() {
    local mem_usage
    mem_usage=$(free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)", $3, $2, $3*100/$2 }')
    echo "$mem_usage"
}

# Fetch and display disk usage
get_disk_usage() {
    local disk_usage
    disk_usage=$(df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)", $3, $2, $5}')
    echo "$disk_usage"
}

# Log system usage stats
log_output() {
    {
        echo "---------------------------------"
        echo "Log Date: $(date +"%d-%m-%Y %H:%M:%S %Z")"
        get_cpu_usage
        get_memory_usage
        get_disk_usage
        echo ""
    } >> "$LOG_FILE"
}

main() {
    log_output
}

main