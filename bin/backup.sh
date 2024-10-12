#!/bin/bash
# TermuXpert - Backup Automation Script

# Define backup directories
BACKUP_SRC="$HOME"
BACKUP_DEST="/storage/emulated/0/TermuXpertBackups"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DEST"

# Perform the backup using rsync
echo "Starting backup..."
rsync -av --progress --exclude="$BACKUP_DEST" "$BACKUP_SRC" "$BACKUP_DEST"

echo "Backup complete! Files saved to $BACKUP_DEST"
