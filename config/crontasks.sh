# TermuXpert Cron Tasks

# Backup task - runs daily at midnight
echo "0 0 * * * bash ~/TermuXpert/bin/backup.sh" > ~/TermuXpert/data/crontasks.txt

# Additional tasks can be added here
