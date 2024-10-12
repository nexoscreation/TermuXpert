#!/bin/bash
# TermuXpert - Backup Automation Script

clear
echo "======================================"
echo "        TermuXpert Backup Tool        "
echo "======================================"

# Create a backup directory if it doesn't exist
BACKUP_DIR=~/ninjaos-termux/data/backups
BACKUP_SRC="$HOME"
BACKUP_DEST="/storage/emulated/0/TermuXpertBackups"
mkdir -p $BACKUP_DIR

# Backup Termux home directory or user-specified directory
echo "What would you like to backup?"
echo "1. Termux Home Directory"
echo "2. Specify a Directory"
read -p "Select an option: " backup_option

if [ $backup_option -eq 1 ]; then
    tar -czvf $BACKUP_DIR/termux_home_backup_$(date +%F).tar.gz ~/
    echo "Termux home directory backed up to $BACKUP_DIR."
else
    read -p "Enter the path of the directory to backup: " dir_to_backup
    tar -czvf $BACKUP_DIR/backup_$(basename $dir_to_backup)_$(date +%F).tar.gz $dir_to_backup
    echo "Backup of $dir_to_backup saved to $BACKUP_DIR."
fi