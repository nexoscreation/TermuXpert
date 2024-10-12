#!/bin/bash
# TermuXpert - Task Scheduling Script

clear
echo "======================================"
echo "      TermuXpert Task Scheduler       "
echo "======================================"

# Check if cron is installed
if ! command -v crond &> /dev/null
then
    echo "Cron is not installed. Installing cron..."
    pkg install -y cronie
fi

# Start cron service
echo "Choose an option to schedule tasks:"
echo "1. Automate backups daily"
echo "2. Schedule a custom task"
read -p "Select an option: " schedule_option

# Add a cron job for daily backups
if [ $schedule_option -eq 1 ]; then
    echo "Scheduling daily backup..."
    (crontab -l 2>/dev/null; echo "0 0 * * * ~/ninjaos-termux/bin/backup.sh") | crontab -
    echo "Daily backup scheduled."
elif [ $schedule_option -eq 2 ]; then
    read -p "Enter the command to schedule: " custom_task
    read -p "Enter cron schedule (e.g., '0 0 * * *' for daily): " cron_schedule
    (crontab -l 2>/dev/null; echo "$cron_schedule $custom_task") | crontab -
    echo "Custom task scheduled."
else
    echo "Invalid option."
fi