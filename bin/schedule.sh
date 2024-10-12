#!/bin/bash
# TermuXpert - Task Scheduling Script

# Check if cron is installed
if ! command -v crond &> /dev/null
then
    echo "Cron is not installed. Installing cron..."
    pkg install -y cronie
fi

# Start cron service
crond

echo "Setting up a sample cron job for daily backup at 2 AM..."

# Add a cron job for daily backups
(crontab -l 2>/dev/null; echo "0 2 * * * /data/data/com.termux/files/home/ninjaos-termux/bin/backup.sh") | crontab -

echo "Cron job added! Daily backup scheduled at 2 AM."
