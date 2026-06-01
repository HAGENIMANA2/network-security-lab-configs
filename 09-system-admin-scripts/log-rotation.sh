#!/bin/bash
# ============================================
# Log Rotation Script
# Author: Jean de Dieu HAGENIMANA
# Description: Rotates, compresses, and archives logs
# ============================================

LOG_SOURCE="/var/log"
LOG_ARCHIVE="/var/log/archive"
RETENTION_DAYS=90
COMPRESSION="gzip"

# Create archive directory
mkdir -p $LOG_ARCHIVE

# Find and compress logs older than 7 days
find $LOG_SOURCE -name "*.log" -type f -mtime +7 -exec $COMPRESSION {} \;

# Move compressed logs to archive
find $LOG_SOURCE -name "*.gz" -type f -exec mv {} $LOG_ARCHIVE \;

# Delete archived logs older than retention period
find $LOG_ARCHIVE -type f -mtime +$RETENTION_DAYS -delete

echo "Log rotation completed at $(date)"
