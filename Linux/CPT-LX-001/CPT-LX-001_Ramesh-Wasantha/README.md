# Basic Bash Script for System Monitoring

This repository contains a Bash script that monitors CPU, memory, and disk usage on a Linux system. The script logs the information with timestamps to a log file.

## Script Overview

- **File**: `system_monitor.sh`
- **Purpose**: Logs CPU, memory, and disk usage to `system_monitor.log`.

## How to Run the Script Manually

1. **Download the Script**

   Save the script to a file named `system_monitor.sh`.

2. **Make the Script Executable**

   Run the following command to give execute permissions:

   chmod +x system_monitor.sh

3. **To Execute the Script**

    Run the script using:
   
    `bash system_monitor.sh` or `./system_monitor.sh`

   This will generate a log entry in system_monitor.log with the current CPU, memory, and disk usage.

## Setting Up the Cron Job

Follow these steps to set up a cron job for the script:

1. **Open Crontab for Editing**

   Open your crontab configuration file for editing by running:

   `crontab -e`

2. **Add the Cron Job**

   Add the following line to the crontab file, replacing /path/to/your/system_monitor.sh with the actual path to your script, to schedule it to run every 10 minutes:

    `*/10 * * * * /path/to/your/system_monitor.sh`

3. **Save and Close Crontab**

    If using Nano: Save by pressing Ctrl + X, then Y to confirm changes, and Enter to exit.
   
    If using Vi or Vim: Save by pressing Esc, then type :wq and hit Enter

4. **Verify the Cron Job**

   To ensure the cron job has been added correctly, run:

   `crontab -l`

   This command will list all scheduled cron jobs for the current user and should include the entry you added.

## Example

  If your script is located in /home/user/scripts/system_monitor.sh, your crontab entry will look like:

  `*/10 * * * * /home/user/scripts/system_monitor.sh`

  With this setup, the script will run every 10 minutes and append the output to system_monitor.log
