####Basic Bash Script for System Monitoring

This script monitors system resources (CPU, memory, and disk usage) and logs the output to a file.

- Steps :

1. Save this script to a file named `system_monitor.sh` and set the path of `system_monitor.log` file to save.

2. Make the script executable by using `chmod +x system_monitor.sh` command.

3. Run the script by typing `./system_monitor.sh` .

4. To schedule the script to run automatically, open the crontab editor by running the command 
    `crontab -e` and add the following line to cron jobs 
    `*/10 * * * * /path/to/your/scriptfile/system_monitor.sh` 
    - This will run the script every 10 minutes.

- Used Bash Commands :
    - date : Show the current date and time
    - top : Show CPU Process of the system
    - free : Show memory Usage of the system
    - df : Show disk usage of the system
    - grep : Filtering output data using patterns
    - awk : text processing tool
