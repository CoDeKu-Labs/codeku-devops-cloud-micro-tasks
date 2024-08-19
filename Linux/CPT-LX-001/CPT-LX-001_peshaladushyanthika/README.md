# System Monitor Script

This script logs CPU, memory, and disk usage on an Ubuntu system using `mpstat`, `free`, and `df` commands.

## Prerequisites

Before running the script, you need to install the following packages:

1. **sysstat**: Provides `mpstat` for monitoring CPU usage.
2. **bc**: Used for arithmetic operations.
3. **coreutils**: Includes utilities like `free`, `grep`, and `date`.

### Installation

Run the following commands to install the required packages using terminal:

sudo apt-get update
sudo apt-get install sysstat bc coreutils

## Steps to Create and Run the Script

### Create the Script

- Open the terminal and create the script using a text editor(nano):
  nano system_monitor.sh

