#!/bin/bash
backup_dir="/path/to/backup"
source_dir="/path/to/source"

echo "Creating backup..."
tar -czvf "$backup_dir/backup_$(date +%Y%m%d).tar.gz" "$source_dir"
echo "Backup complete."
