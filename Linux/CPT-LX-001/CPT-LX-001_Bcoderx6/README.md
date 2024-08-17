```markdown
# System Monitoring Script

This repository contains a Bash script (`system_monitor.sh`) that monitors system resources, including CPU usage, memory usage, and disk usage, and logs the output to a file.

## Prerequisites

- A Linux environment (e.g., Ubuntu, CentOS).
- Basic knowledge of Bash scripting and command-line tools.
- Text editor (e.g., Nano, Vim, or VS Code).

## Setup Instructions

### Step 1: Clone the Repository

First, clone the repository to your local machine.

```bash
git clone https://github.com/Bcoderx6/codeku-devops-cloud-micro-tasks.git
cd codeku-devops-cloud-micro-tasks
```

### Step 2: Make the Script Executable

Make the script executable by running:

```bash
chmod +x system_monitor.sh
```

### Step 3: Run the Script Manually

Execute the script manually to monitor system resources:

```bash
./system_monitor.sh
```

### Step 4: View the Log File

You can view the log file to see the recorded system resource usage:

```bash
cat system_monitor.log
```

## Optional: Schedule the Script Using Cron

To automatically run the script at regular intervals (e.g., every 10 minutes), you can set up a cron job.

1. Open the crontab editor:

    ```bash
    crontab -e
    ```

2. Add the following line to schedule the script every 10 minutes:

    ```bash
    */10 * * * * /path/to/your/system_monitor.sh
    ```

    Replace `/path/to/your/` with the actual path to the script on your machine.

3. Save and exit the crontab editor.

### Step 5: Verify the Cron Job (Optional)

Wait for 10 minutes to see if the script runs automatically.

Check the `system_monitor.log` file again to verify that new entries have been added:

```bash
cat system_monitor.log
```
```
