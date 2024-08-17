# System Monitoring Script

This task contains a bash script(`system_monitor.sh`) that monitors system resources such as CPU usage, memory usage, and disk usage, and logs the information to a file (`system_monitor.log`) in 10 minutes intervals.

## Prerequisites

- A Linux environment (e.g., Ubuntu, CentOS). 
- Basic knowledge of Bash scripting and command-line tools.
- Text editor (e.g., Nano, Vim, or VS Code).

## Setup Instructions

### Step 1: Clone the Repository

First, clone the repository to your local machine.

    git clone https://github.com/thushalya/codeku-devops-cloud-micro-tasks.git

Then navigate to the working directory.

    cd codeku-devops-cloud-micro-tasks/Linux/CPT-LX-001_thushalya

### Step 2: Make the Script Executable

    chmod +x system_monitor.sh

### Step 3: Run the Script Manually

    ./system_monitor.sh

### Step 4: View the Log File

    cat system_monitor.log

## Optional: Schedule the Script Using Cron

To automatically run the script at regular intervals (e.g., every 10 minutes), you can set up a cron job.

### 1.Open the crontab file with nano editor:

    EDITOR=nano crontab -e

### 2.Go to the end of the file and paste the following line to schedule the script every 10 minutes:

    */10 * * * * /path/to/your/system_monitor.sh


#### Excute following command to get the exact path of your file and replace it with the actual path of `system_monitor.sh` file

    find / -name "system_monitor.sh" 2>/dev/null

### 3.Save and exit the crontab editor.

       press ctrl + o to save
       press enter to save crontab file in default location
       press ctrl + x to exit

### 4: Verify the Cron Job (Optional)
Wait for 10 minutes to see if the script runs automatically.

Afterward, check the system_monitor.log file to confirm that new entries have been added by running the following command:

    cat system_monitor.log

