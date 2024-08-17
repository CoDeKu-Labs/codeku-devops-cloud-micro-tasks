# System Monitoring Script by Gihan Chathuranga Gunathilaka

This repository contains a Bash script (`system_monitor.sh`) that monitors system resources, including CPU usage, memory usage, and disk usage, and logs the output to a file.

## Prerequisites

- A Linux environment (e.g., Ubuntu, CentOS). I'm using Babun Shell for Demostration Purpose
- Basic knowledge of Bash scripting and command-line tools.
- Text editor (e.g., Nano, Vim, or VS Code).

## Setup Instructions

### Step 1: Clone the Repository

First, clone the repository to your local machine.

    git clone https://github.com/Chathuwa-67/codeku-devops-cloud-micro-tasks.git

cd codeku-devops-cloud-micro-tasks

### Step 2: Make the Script Executable

    chmod +x system_monitor.sh

### Step 3: View the Log File

    cat system_monitor.log

## Optional: Schedule the Script Using Cron

To automatically run the script at regular intervals (e.g., every 10 minutes), you can set up a cron job.

### 1.Open the crontab editor:

    crontab -e

### 2.Add the following line to schedule the script every 10 minutes:

    */10 * * * * /path/to/your/system_monitor.sh

Replace /path/to/your/ with the actual path to the script on your machine.
for mine it's C:\Users\Administrator\Desktop\CodeKu\codeku-devops-cloud-micro-tasks\Linux\CPT-LX-001\CPT-LX-001_Chathuwa-67 like that.

### 3.Save and exit the crontab editor.

### 4: Verify the Cron Job (Optional)
Wait for 10 minutes to see if the script runs automatically.

Check the system_monitor.log file again to verify that new entries have been added:

    cat system_monitor.log


### Summary of the Steps:

1. **Clone the repository** and navigate to the script directory.
2. **Make the script executable** with `chmod +x`.
3. **Run the script** to log system resource usage.
4. **View the logs** using `cat`.
5. Optionally, **set up a cron job** to automate the script execution.
