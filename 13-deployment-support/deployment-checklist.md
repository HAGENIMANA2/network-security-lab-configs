# Deployment Checklist

## Pre-Deployment (24 hours before)

- [ ] Notify stakeholders of deployment window
- [ ] Backup current production environment
- [ ] Verify backup integrity (test restore)
- [ ] Update maintenance page (if needed)
- [ ] Prepare rollback plan

## Pre-Deployment (1 hour before)

- [ ] Stop application services
- [ ] Verify no active database connections
- [ ] Take final database backup
- [ ] Document current version numbers

## During Deployment

- [ ] Deploy new code to production
- [ ] Run database migrations
- [ ] Update configuration files
- [ ] Clear application cache
- [ ] Restart application services

## Post-Deployment Verification

- [ ] Verify application is responding (HTTP 200)
- [ ] Test critical user workflows
- [ ] Check application logs for errors
- [ ] Verify database connectivity
- [ ] Monitor CPU/memory for 15 minutes

## Rollback Triggers

- Critical errors in logs
- Failed database migrations
- Application not responding
- Performance degradation > 30%

## Sign-off

| Role | Name | Signature | Date |
|------|------|-----------|------|
| System Administrator | | | |
| Application Owner | | | |
| QA Lead | | | |
