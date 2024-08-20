# System Monitoring Script

This repository contains a Bash script (`system_monitor.sh`) designed to monitor system resources including CPU usage, memory usage, and disk usage. The script logs the output to a file (`system_monitor.log`) with a timestamp.

## Prerequisites

- A Linux environment (e.g., Ubuntu, CentOS).
- Basic knowledge of Bash scripting and command-line tools.
- Text editor (e.g., Nano, Vim, or VS Code).

## Setup Instructions

## Step 1: Clone the Repository

Clone the repository to your local machine:

```bash
git clone https://github.com/lakshithaiam/codeku-devops-cloud-micro-tasks.git
cd codeku-devops-cloud-micro-tasks
```

## Step 2: Make the Script Executable

Ensure the script has executable permissions:

```bash
chmod +x system_monitor.sh
```
## Step 3: Run the Script Manually

Execute the script to log system information:

```bash
./system_monitor.sh
```
## Step 4: View the Log File

Check the system_monitor.log file to see the logged data:

```bash
cat system_monitor.log
```

## Optional: Schedule the Script Using Cron

To automatically run the script at regular intervals (e.g., every 10 minutes), set up a cron job:

1. Open the crontab editor:
```bash
crontab -e
```

2. Add the following line to schedule the script every 10 minutes:
```bash
 */10 * * * * /path/to/your/system_monitor.sh
```
Replace /path/to/your/ with the actual path to the script on your machine.

3. Save and exit the crontab editor.

4. Verify the Cron Job (Optional)

Wait for 10 minutes to see if the script runs automatically.

Check the system_monitor.log file again to verify that new entries have been added:
```bash
cat system_monitor.log
```

## Example Output
Here is a sample of what the log entries might look like:

```yaml
Timestamp: 2024-08-20 05:50:01
CPU usage: 11.3%
Memory Usage: 2508/14871MB (16.87%)
Disk Usage: /dev/sda3 77%
Disk Usage: /dev/sda2 2%
Disk Usage: /dev/sr0 100%
-------------------------------
Timestamp: 2024-08-20 06:00:01
CPU usage: 2.4%
Memory Usage: 2508/14871MB (16.87%)
Disk Usage: /dev/sda3 77%
Disk Usage: /dev/sda2 2%
Disk Usage: /dev/sr0 100%
-------------------------------
Timestamp: 2024-08-20 06:10:02
CPU usage: 7.2%
Memory Usage: 2541/14871MB (17.09%)
Disk Usage: /dev/sda3 77%
Disk Usage: /dev/sda2 2%
Disk Usage: /dev/sr0 100%
-------------------------------
```