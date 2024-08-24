# System Monitoring Bash Script

## Overview

This repository contains a Bash script for monitoring system resources, including CPU usage, memory usage, and disk usage. The script logs the output to a file with a timestamp. You can also set up a cron job to run the script periodically.

## Files

- `system_monitor.sh`: The Bash script for system monitoring.
- `system_monitor.log`: A sample log output after running the script.
- `README.md`: This file with instructions on how to run the script and set up the cron job.

## Prerequisites

- Basic knowledge of Linux commands and Bash scripting.
- A Linux environment (e.g., local machine, VM, or cloud instance).

## Script Details

### `system_monitor.sh`

The script performs the following tasks:

1. **Capture CPU Usage**: Uses `top` command to get the current CPU usage.
2. **Capture Memory Usage**: Uses `free` command to get the current memory usage.
3. **Capture Disk Usage**: Uses `df` command to get the current disk usage.
4. **Log Output**: Writes the timestamp and system resource usage to `system_monitor.log`.

## Script Execution

### 1. Make the Script Executable

Run the following command to give executable permissions to the script:

```bash
chmod +x system_monitor.sh
```

### 2. Run the Script

Execute the script manually to verify that it logs the system information correctly:

```bash
./system_monitor.sh
```

### 3. Set Up a Cron Job

To run the script every 10 minutes, add the following line to your crontab file:

```bash
*/10 * * * * /path/to/system_monitor.sh
```
Replace /path/to/ with the directory where your script is located. To edit your crontab file, use the command:

```bash
crontab -e
```