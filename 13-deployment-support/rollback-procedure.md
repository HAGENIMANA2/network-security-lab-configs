# Rollback Procedure

## When to Rollback
- Deployment fails verification checks
- Critical errors appear within first 30 minutes
- Security vulnerability discovered
- Performance degradation exceeds threshold

## Rollback Steps

### Step 1: Stop Application
```bash
sudo systemctl stop ifmis-app
sudo systemctl stop sdms-app
