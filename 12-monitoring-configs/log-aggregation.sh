#!/bin/bash
# ============================================
# Centralized Log Aggregation Script
# Author: Jean de Dieu HAGENIMANA
# Description: Collects logs from multiple servers
# ============================================

LOG_SERVER="192.168.1.100"
LOG_DIR="/var/log/aggregated"
DATE=$(date +%Y%m%d)

SERVERS=(
    "app-server-01:192.168.1.10"
    "db-server-01:192.168.1.20"
    "web-server-01:192.168.1.30"
)

mkdir -p $LOG_DIR

for SERVER in "${SERVERS[@]}"; do
    NAME="${SERVER%%:*}"
    IP="${SERVER##*:}"
    
    echo "Collecting logs from $NAME ($IP)"
    
    # Collect syslog
    scp root@$IP:/var/log/syslog $LOG_DIR/${NAME}-syslog-$DATE.log 2>/dev/null
    
    # Collect auth log
    scp root@$IP:/var/log/auth.log $LOG_DIR/${NAME}-auth-$DATE.log 2>/dev/null
    
    # Collect application logs
    scp root@$IP:/var/log/nginx/access.log $LOG_DIR/${NAME}-nginx-access-$DATE.log 2>/dev/null
    scp root@$IP:/var/log/nginx/error.log $LOG_DIR/${NAME}-nginx-error-$DATE.log 2>/dev/null
    
    echo "Completed collection from $NAME"
done

# Compress logs older than 30 days
find $LOG_DIR -name "*.log" -type f -mtime +30 -exec gzip {} \;

echo "Log aggregation completed at $(date)"
