# System Monitor Script

This guide will walk you through creating a simple Bash script to monitor system resources (CPU, memory, and disk usage) and log the information to a file. The script will be executed every 10 minutes using a cron job.

## Step 1: Create the Necessary Files

1. Navigate to your desired directory.
2. Run the following commands to create the required files:

   ```bash
   touch system_monitor.sh
   touch system_monitor.log
   ```

## Step 2: Write the Bash Script

1. Open the `system_monitor.sh` file for editing:

   ```bash
   vim system_monitor.sh
   ```

2. Press the `i` key to enter **insert mode**.

3. Copy and paste the following script into the file. Be sure to update the `LOG_FILE` path according to your setup:

   ```bash
   # Define log file location
   LOG_FILE="/directory/system_monitor.log"

   # Get the current timestamp
   TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

   # Capture CPU usage using mpstat
   CPU_USAGE=$(mpstat 1 1 | awk '/Average/ {printf("%.2f%%", 100 - $NF)}')

   # Capture memory usage using free
   MEM_USAGE=$(free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)", $3,$2,$3*100/$2 }')

   # Capture disk usage using df
   DISK_USAGE=$(df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)", $3,$2,$5}')

   # Log the output to the file
   echo "$TIMESTAMP - CPU Usage: $CPU_USAGE, $MEM_USAGE, $DISK_USAGE" >> $LOG_FILE
   ```

4. Press the `ESC` key, then type `:wq` and press `Enter` to save the script and exit the editor.

## Step 3: Make the Script Executable

Make your script executable by running the following command:

```bash
chmod +x system_monitor.sh
```

## Step 4: Test the Script

Run the script manually to verify that it correctly logs information to the `system_monitor.log` file:

```bash
./system_monitor.sh
```

## Step 5: Set Up a Cron Job

1. Open the crontab editor:

   ```bash
   crontab -e
   ```

2. Add the following line to schedule the script to run every 10 minutes. Make sure to replace `/path/to/your/directory/` with the actual path to your script:

   ```bash
   */10 * * * * /path/to/your/directory/system_monitor.sh
   ```

3. Save and exit the crontab editor.

## Step 6: Verify the Logs

To verify that the script is logging data every 10 minutes, use the following command to monitor the log file:

```bash
tail -1000f /path/to/your/directory/system_monitor.log
```

This command will continuously display the last 1000 lines of the log file as new entries are added.

---