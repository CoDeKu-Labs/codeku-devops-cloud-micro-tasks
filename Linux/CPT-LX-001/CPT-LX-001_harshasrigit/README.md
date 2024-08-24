# System Monitor Script

## Overview

The `system_monitor.sh` script captures and logs system resource usage including CPU, memory, and disk space. It saves this information to a log file with a timestamp.

## Script Details

- **CPU Usage**: Captures the percentage of CPU usage.
- **Memory Usage**: Captures the amount of used and total memory in MB.
- **Disk Usage**: Captures the amount of used and total disk space for the root filesystem.

## Prerequisites

- `bash`
- `top`
- `free`
- `df`
- `sed`
- `awk`

## Installation

1. **Download the Script**

   Save the script content to a file named `system_monitor.sh`.

2. **Make the Script Executable**

   Open a terminal and run:
   ```bash
   chmod +x system_monitor.sh

3.  Run the Script Manually
    To run the script manually and log the system information, execute:
    ./system_monitor.sh

4.  Set Up a Cron Job 
    To automate the script to run every 10 minutes, add the following line to your crontab file:
    
    */10 * * * * /path/to/system_monitor.sh

    Replace /path/to/system_monitor.sh with the full path to the script.

   
