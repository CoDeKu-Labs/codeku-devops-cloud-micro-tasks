# System Monitor Script

## Overview

This Bash script monitors system resources, including CPU usage, memory usage, and disk usage, and logs the results with a timestamp.

## Prerequisites

- A Linux environment with Bash shell.
- Basic understanding of Linux commands and cron jobs.

## How to Run the Script

1. **Download the Script:**

   Clone the repository or download the `system_monitor.sh` script to your local machine.

   If you need to clone the repository, use the following command:

   ```bash
   git clone https://github.com/yourusername/your-repo-name.git
Then navigate to the directory containing the script:

2. **Change th working directory**
cd /home/janath/Downloads/codeku-devops-cloud-micro-tasks/Monitoring and Logging/CPT-LX-001/CPT-LX-001_H-Janath


3. **Make the Script Executable**
Run the following command to make the script executable:

chmod +x system_monitor.sh


3. **Run the Script Manually**

Execute the script by running
./system_monitor.sh

The script will log the system information to system_monitor.log. The log file will be created in the same directory as the script unless specified otherwise.

## Setting Up a Cron Job (Optional)
To automate the execution of the script at regular intervals, you can set up a cron job.

1. **Open the Crontab**

In your terminal, type:

crontab -e

1. **Add the Cron Job**

Add the following line to run the script every 10 minutes:

2. **Look youre path by typing pwd**

2. **According to that path modify Add the following line to run the script every 10 minutes**
*/10 * * * * /path/to/system_monitor.sh
Replace /path/to/system_monitor.sh with the actual path to your script.

3. **Save and Exit**

After adding the cron job, save the file and exit the editor. The script will now run automatically every 10 minutes.

4. **Viewing the Logs**
You can view the logged system information by opening the system_monitor.log file:


5. **cat system_monitor.log**
This will display the CPU, memory, and disk usage along with the timestamps when the script was executed.

## Example Output
An entry in the system_monitor.log might look like this:
2024-08-17 10:00:00 | CPU Usage: 5.5% | Memory Usage: 40.0% | Disk Usage: 20%
