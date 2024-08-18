# System Monitor 

## Introduction
This is a simple system monitor that logs the CPU, memory, and disk usage of a system to a file. 

## Usage

To run the system monitor, simply run the following command:

```bash
./system_monitor.sh
```

## Add to crontab

To run the system monitor every 10 minutes, run the following command:

```bash
./system_monitor.sh enable
```

or

Add the following line to your crontab:

```bash
*/10 * * * * /path/to/system_monitor.sh
```


