#!/bin/bash

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
RESET='\033[0m'

echo -e "${YELLOW}===== Termux Task Scheduler =====${RESET}"

# Function to install a package if it's not already installed
install_package() {
    if ! command -v $1 &> /dev/null; then
        echo "Installing $1..."
        pkg install -y $1
    else
        echo "$1 is already installed."
    fi
}

# Install cronie (for cron jobs)
install_package cronie

# Function to add a new cron job
add_cron_job() {
    echo "Adding a new cron job"
    echo "Enter the cron schedule (e.g., '0 2 * * *' for daily at 2 AM):"
    read schedule
    echo "Enter the command to run:"
    read command
    
    (crontab -l 2>/dev/null; echo "$schedule $command") | crontab -
    echo -e "${GREEN}Cron job added successfully.${RESET}"
}

# Function to list all cron jobs
list_cron_jobs() {
    echo "Current cron jobs:"
    crontab -l
}

# Function to remove a cron job
remove_cron_job() {
    echo "Current cron jobs:"
    crontab -l
    echo "Enter the line number of the job you want to remove:"
    read line_number
    crontab -l | sed "${line_number}d" | crontab -
    echo -e "${GREEN}Cron job removed successfully.${RESET}"
}

# Main menu
while true; do
    echo -e "\n${YELLOW}Task Scheduler Menu:${RESET}"
    echo "1. Add a new cron job"
    echo "2. List all cron jobs"
    echo "3. Remove a cron job"
    echo "4. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1) add_cron_job ;;
        2) list_cron_jobs ;;
        3) remove_cron_job ;;
        4) echo "Exiting Task Scheduler."; exit 0 ;;
        *) echo -e "${RED}Invalid choice. Please try again.${RESET}" ;;
    esac
done