# Backup Procedure

## Daily Backup
1. Run `backup-automation.sh` at 2:00 AM
2. Verify backup completion in `/var/log/backup.log`
3. Check backup file sizes

## Weekly Full Backup
1. Perform full system backup on Sundays
2. Copy backups to offsite location
3. Test restore on a single file

## Monthly Archive
1. Archive monthly backups to long-term storage
2. Update backup inventory document
3. Delete backups older than 90 days

## Backup Verification
- Check file integrity weekly: `tar -tzf backup.tar.gz`
- Verify database backups can be restored
- Document any failures immediately
