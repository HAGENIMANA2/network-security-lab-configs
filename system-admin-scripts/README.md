# 09-system-admin-scripts

## Purpose
Automation scripts for recurring system administration tasks to improve efficiency and reduce human error.

## Files

| File | Description | Use Case |
|------|-------------|----------|
| `backup-automation.sh` | Automated backup script for Linux servers (tar, mysqldump, retention policy) | Daily scheduled backups |
| `log-rotation.sh` | Log rotation script with compression and age-based deletion | Prevent disk full issues |
| `user-management.sh` | User account creation, modification, deletion script | Onboarding/offboarding staff |
| `system-monitor.py` | Python script for CPU, memory, disk, and service monitoring | Real-time health checks |

## Usage Instructions

### backup-automation.sh
```bash
# Make executable
chmod +x backup-automation.sh

# Run manually
sudo ./backup-automation.sh

# Schedule with cron (daily at 2 AM)
sudo crontab -e
# Add line: 0 2 * * * /path/to/backup-automation.sh
