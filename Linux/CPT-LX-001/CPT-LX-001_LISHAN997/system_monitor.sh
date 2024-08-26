# Define log file location
   LOG_FILE="/home/kali/system-monitoring/system_monitor.log"

   # Get the current timestamp
   TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

   # Capture CPU usage using mpstat
   CPU_USAGE=$(mpstat 1 1 | awk '/Average/ {printf("%.2f%%", 100 - $NF)}')

   # Capture memory usage using free
   MEM_USAGE=$(free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)", $3,$2,$3*100/$2 }')

   # Capture disk usage using df
   DISK_USAGE=$(df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)", $3,$2,$5}')

   # Log the output to the file
   echo "$TIMESTAMP - CPU Usage: $CPU_USAGE, $MEM_USAGE, $DISK_USAGE" >> $LOG_FILE
