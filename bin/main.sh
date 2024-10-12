#!/bin/bash
# TermuXpert - Main Entry Script

# Display logo and welcome message
clear
echo "======================================"
echo "        Welcome to TermuXpert         "
echo "  Expert-level Automation for Termux  "
echo "======================================"

# Play a welcome sound (optional, if you have a sound file)
# play /path/to/sound.mp3

# Main menu options
while true; do
  echo ""
  echo "1. Automate Backups"
  echo "2. Set Up Personal Server"
  echo "3. System Monitoring Tools"
  echo "4. Customize Your Terminal"
  echo "5. Development Tools"
  echo "6. Task Scheduling"
  echo "7. Exit"
  echo ""
  read -p "Select an option: " choice

  case $choice in
    1) ~/ninjaos-termux/bin/backup.sh ;;
    2) ~/ninjaos-termux/bin/server.sh ;;
    3) ~/ninjaos-termux/bin/monitor.sh ;;
    4) ~/ninjaos-termux/bin/customization.sh ;;
    5) ~/ninjaos-termux/bin/devtools.sh ;;
    6) ~/ninjaos-termux/bin/schedule.sh ;;
    7) echo "Exiting TermuXpert. Goodbye!" && exit 0 ;;
    *) echo "Invalid choice. Please try again." ;;
  esac
done