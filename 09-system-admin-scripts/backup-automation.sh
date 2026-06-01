#!/bin/bash
# ============================================
# Automated Backup Script for Linux Servers
# Author: Jean de Dieu HAGENIMANA
# Description: Backs up critical directories and databases
# ============================================

# Configuration
BACKUP_DIR="/backup"
DATE=$(date +%Y%m%d_%H%M%S)
RETENTION_DAYS=30
LOG_FILE="/var/log/backup.log"

# Create backup directory if not exists
mkdir -p $BACKUP_DIR

# Start logging
echo "=========================================" >> $LOG_FILE
echo "Backup started at: $(date)" >> $LOG_FILE

# Backup critical system directories
echo "Backing up /etc..." >> $LOG_FILE
tar -czf $BACKUP_DIR/etc-backup-$DATE.tar.gz /etc 2>/dev/null

echo "Backing up /var/www..." >> $LOG_FILE
tar -czf $BACKUP_DIR/www-backup-$DATE.tar.gz /var/www 2>/dev/null

echo "Backing up /home..." >> $LOG_FILE
tar -czf $BACKUP_DIR/home-backup-$DATE.tar.gz /home 2>/dev/null

# Backup MySQL databases (if running)
if command -v mysqldump &> /dev/null; then
    echo "Backing up MySQL databases..." >> $LOG_FILE
    mysqldump --all-databases --single-transaction --quick > $BACKUP_DIR/db-backup-$DATE.sql 2>/dev/null
    gzip $BACKUP_DIR/db-backup-$DATE.sql
fi

# Delete backups older than retention period
echo "Removing backups older than $RETENTION_DAYS days..." >> $LOG_FILE
find $BACKUP_DIR -type f -mtime +$RETENTION_DAYS -delete

# Backup size
BACKUP_SIZE=$(du -sh $BACKUP_DIR | cut -f1)
echo "Total backup size: $BACKUP_SIZE" >> $LOG_FILE
echo "Backup completed at: $(date)" >> $LOG_FILE
echo "=========================================" >> $LOG_FILE

# Optional: Send email notification
# echo "Backup completed successfully" | mail -s "Backup Report - $DATE" admin@example.com

exit 0
