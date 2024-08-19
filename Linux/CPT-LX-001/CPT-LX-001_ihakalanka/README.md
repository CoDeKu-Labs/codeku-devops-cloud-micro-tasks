# System Monitor Script

This script monitors system resources (CPU, memory, and disk usage) and logs the output to a file.

## How to Run

1. **Ensure the script is executable:**

    ```bash
    chmod +x system_monitor.sh
    ```

2. **Run the script manually:**

    ```bash
    ./system_monitor.sh
    ```

3. **Set up a cron job:**

    To automatically run the script every 10 minutes:

    ```bash
    crontab -e
    ```

    Add the following line:

    ```bash
    */10 * * * * /path/system_monitor.sh
    ```
    This will run the script every 10 minutes and log the output.

## Notes

- Replace `/path/` with your actual path.