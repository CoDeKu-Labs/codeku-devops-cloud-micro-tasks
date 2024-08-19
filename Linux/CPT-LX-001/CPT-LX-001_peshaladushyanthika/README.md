# System Monitor Script

This script logs CPU, memory, and disk usage on an Ubuntu system using `mpstat`, `free`, and `df` commands.

## Prerequisites

Before running the script, you need to install the following packages:

1. **sysstat**: Provides `mpstat` for monitoring CPU usage.
2. **bc**: Used for arithmetic operations.
3. **coreutils**: Includes utilities like `free`, `grep`, and `date`.

### Installation

Run the following commands to install the required packages using terminal:

`sudo apt-get update`

`sudo apt-get install sysstat bc coreutils`

## Steps to Create and Run the Script

### Create the Script

- Open the terminal and create the script using a text editor(nano):
  `nano system_monitor.sh`
- The nano editor will be opened.Then, need to write the script and press Ctrl + O, then Enter to save. Press Ctrl + X to exit nano.
### Run the script

`chmod +x system_monitor.sh`

### Test the script

`./system_monitor.sh`

- Check the log file to ensure the output is logged correctly:
  
`cat /path_to_log_file/system_monitor.log`

## Set Up a Cron Job (Optional)

Make sure the cron daemon is running on your system:

`sudo service cron status`

If it isn't running,start with: `sudo service cron start`

- Open the crontab file for editing :  `crontab -e`
  
It might ask you to choose an editor (like nano). You need to add a cron job using below syntax (you need to insert the job at the bottom of the file)

` */10 * * * * >> /path/to/system_monitor.sh`

- Check that your cron job was correctly added by listing your cron jobs: `crontab -l`

- Monitor the log file (system_monitor.log) to see if it's being updated every 10 minutes.

By following the steps above, you'll have a system monitoring script that logs CPU, memory, and disk usage.
