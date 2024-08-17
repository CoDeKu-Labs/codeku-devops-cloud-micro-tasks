# CODEKU DEVOPS CLOUD MICRO TASKS
## System Monitoring Script by Akitha Wijesinghe

This project features a Bash script (system_monitor.sh) crafted by Akitha Wijesinghe, designed to monitor system resources, including CPU usage, memory usage, and disk usage.

## Prerequisites
- A Linux environment (e.g., Ubuntu, CentOS). This guide assumes usage of a CentOS VM.
- Basic knowledge of Bash scripting and command-line tools.
- A text editor such as Nano, Vim, or VS Code.

## Setup Instructions
### Step 1: Clone the Repository
1.Start by cloning the repository to your local machine:

    https://github.com/akithawijesinghe/codeku-devops-cloud-micro-tasks

2.cd codeku-devops-cloud-micro-tasks

### Step 2: Create the Script
1.Create and edit the system_monitor.sh file:

    vim system_monitor.sh

2.Insert script

### Step 3: Make the Script Executable
Grant execute permissions to the script:

    chmod +x system_monitor.sh

### Step 4: Run the Script Manually
Execute the script to ensure it logs the system information correctly:

    ./system_monitor.sh

### Step 5: View the Log File
Check the contents of the log file to verify the output:

    cat system_monitor.log

### Optional: Schedule the Script Using Cron
To automate the script and run it every 10 minutes, follow these steps:

1. Open the Crontab Editor:

    crontab -e

2. Add the Cron Job Entry
Insert the following line to schedule the script:

    */10 * * * * /home/vagrant/system_monitor.sh

3. Save and Exit the Crontab Editor
For Vim: Press Esc, type :wq, and press Enter.


4. Verify the Cron Job (Optional)
Wait for 10 minutes and then check the log file to ensure that new entries are being added:

    cat system_monitor.log

## Summary of the Steps
- Clone the repository and navigate to the script directory.
- Create and edit the script in system_monitor.sh.
- Make the script executable with chmod +x.
- Run the script manually to log system resource usage.
- View the logs to verify the output.
- Optionally, set up a cron job to automate script execution every 10 minutes.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

