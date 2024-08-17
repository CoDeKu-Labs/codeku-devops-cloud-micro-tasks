Explanation of the Script:
 
LOG_FILE: All system monitoring data will be stored in this log file. The name of the log file will be system_monitor.log.

DATE_TIME: This captures the current date and time in the format YYYY-MM-DD HH:MM:SS.

CPU_USAGE: This uses top to get the CPU usage and further filters out the idle percentage, id, calculates the used CPU percentage by subtracting the idle percentage from 100.

MEMORY_USAGE: It uses 'free' to get memory usage info, extracting the memory used as a percentage of the total available memory.

DISK_USAGE: It uses df to get the disk usage info.Extracting the percentage of the /dev/sda1 partition of the disk usage. You will have to change this according to the system.

Logs: Logs timestamp, CPU usage, memory usage, and disk usage into a file called system_monitor.log.

Execution Instructions:

Make the script executable: 
    chmod +x system_monitor.sh

Run the script:
    ./system_monitor.sh

Verify the Log:
Check the 'system_monitor.log' file to ensure the output is correctly logged.

Set up a Cron job:
Automate the script every 10 minutes
    crontan -e

    */10 * * * * /path/to/system_monitor.sh --> */10 * * * * ./system_monitor.sh

# +---------------- minute (0 - 59)
# |  +------------- hour (0 - 23)
# |  |  +---------- day of month (1 - 31)
# |  |  |  +------- month (1 - 12)
# |  |  |  |  +---- day of week (0 - 6) (Sunday=0 or 7)
# |  |  |  |  |
  *  *  *  *  *  command to be executed

Done