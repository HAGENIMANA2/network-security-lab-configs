# 09-system-admin-scripts

## Purpose
Automation scripts for recurring system administration tasks.

## Files

| File | Description |
|------|-------------|
| `backup-automation.sh` | Automated backup script for Linux servers (tar, mysqldump, retention policy) |
| `log-rotation.sh` | Log rotation script with compression and age-based deletion |
| `user-management.sh` | User account creation, modification, deletion script |
| `system-monitor.py` | Python script for CPU, memory, disk, and service monitoring |

## Usage
- Run backup-automation.sh via cron for daily backups
- Execute system-monitor.py for real-time health checks
- Modify variables (BACKUP_DIR, DB_PASSWORD, RETENTION_DAYS) as needed

## Author
Jean de Dieu HAGENIMANA - System Administrator
