#!/bin/bash
# TermuXpert - Main Entry Script

# Display logo and welcome message
clear
echo "==============================="
echo "   Welcome to TermuXpert!"
echo "==============================="

# Play a welcome sound (optional, if you have a sound file)
# play /path/to/sound.mp3

# Display the menu for available options
echo "Please choose an option:"
echo "1) Automate Backups"
echo "2) Setup Personal Server"
echo "3) System Monitoring"
echo "4) Customize Terminal"
echo "5) Development Tools"
echo "6) Task Scheduling"
echo "7) Exit"

read -p "Enter your choice [1-7]: " choice

case $choice in
    1) ./backup.sh ;;
    2) ./server.sh ;;
    3) ./monitor.sh ;;
    4) ./customization.sh ;;
    5) ./devtools.sh ;;
    6) ./schedule.sh ;;
    7) echo "Exiting TermuXpert. Goodbye!" && exit 0 ;;
    *) echo "Invalid choice. Please try again." ;;
esac
