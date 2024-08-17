# System Monitor Scrip

This Bash script monitors the system's CPU, memory, and disk usage and logs the information to a file named `system_monitor.log` every 10 min.

## Features

- **CPU Usage Monitoring**: Captures the current CPU usage persantage.
- **Memory Usage Monitoring**: Records the percentage of memory being use.
- **Disk Usage Monitoring**: Logs the disk usage of a specific partician (`/dev/sdc`).
- **Timestamp**: Each log entry is time stamped to indicate when the data was captured.

## Prerequisites

- A Unix-based operating system with Bash shell.
- The folowing commands must be available:
  - `top`
  - `free`
  - `df`
  - `grep`
  - `awk`

## Script Details

### Step 1: Clone the Repository and setup task director
1. Cloning the repository to your local machine:

    ```bash
    https://github.com/akithawijesinghe/codeku-devops-cloud-micro-tasks
    ```

2. cd codeku-devops-cloud-micro-tasks
3. cd Linux/CPT-LX-001
4. mkdir CPT-LX-001_github_user_name
5. cd CPT-LX-001_github_user_name
6. touch README.md system_monitor.sh

### Step 2: Create the Script
1. Edit the system_monitor.sh file:

    ```bash
    nano system_monitor.sh
    ```

2. Create monitering script

### Step 3: Give permmision to Script to Execute
Grant execute permissions to the scrip:

    ```bash
    chmod +x system_monitor.sh
    ```

### Step 4: Run the Script Manualy
Execute the script and ensure it works properly:

    ```bash
    ./system_monitor.sh
    ```

### Step 5: View the Log Files
Check the contents of the log file and verify output:

    ```bash
    cat system_monitor.log
    ```

### Optional: Scheduling the Script Using Cron
To automate the script and run it every 10 minutes:

1. First check the avalibility of crontab: 
    If not available:
        Install:
            ```bash
            sudo apt install cron
            ```
        Make sure to run it on backgroud:
            ```bash
            sudo systemctl enable cron
            ```

2. Open Crontab Editor:

    ```bash
    crontab -e
    ```

2. Add the Cron Job Entry:
Insert the following line to scheduel the script:

    ```bash
    */10 * * * * /home/bash_workplace/system_monitor.sh
    ```

3. Save and Exit the Crontab Editor
For nano: Press `Ctrl + X`, type `Y`, and press `Enter`.

4. Verify the Cron Job (Optional):
Wait for 10 min and then check the log file to ensure that new entries are being added:

    ```bash
    cat system_monitor.log
    ```

## Licence
This project is licensed under the MIT Licence. See the LICENSE file for details.
