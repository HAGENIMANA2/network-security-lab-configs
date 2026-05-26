# Daily Log Review Procedure

## Author: Jean de Dieu HAGENIMANA - CCNA Certified

---

## Objective
To ensure timely detection of security incidents through systematic log review of network devices, firewalls, and servers.

---

## Review Schedule

| Frequency | Duration | Responsible |
|-----------|----------|-------------|
| Daily | 30 minutes | Network Security Engineer |
| Weekly | 2 hours | Network Security Engineer + Lead |
| Monthly | 4 hours | Full security team |

---

## Step 1: Priority Review (First 15 minutes)

### Firewall Logs
Look for:

Denied connections from internal to external (possible C2 communication)

Unusual outbound ports (non-standard ports like 4444, 6667)

Connections to known malicious IPs

Traffic spikes at unusual hours (2 AM - 5 AM)

### IDS/IPS Alerts (Critical & High)
Immediate actions:

Note alert ID and source/destination IPs

Check if false positive (document if yes)

If confirmed threat: follow incident response plan

### Authentication Logs
```bash
# Linux command examples
grep "Failed password" /var/log/auth.log | tail -20
grep "Invalid user" /var/log/auth.log | tail -20
lastb | head -20  # Failed login attempts

Step 2: Correlation (Next 15 minutes)
Cross-Reference Checks
Source A	                Source B          	What to Correlate
------------              -------------       ------------------
Firewall denies	          IDS alerts	        Did IDS detect what firewall blocked?
VPN logs	              User access logs	    Any VPN login without subsequent activity?
Server logs	              Firewall logs	        Server compromise with external C2?


Suspicious Pattern Examples
Pattern: 10 failed SSH attempts from 203.0.113.50 → then successful login
Action: Investigate successful login immediately

Pattern: Firewall shows outbound port 4444 to internet → IDS silent
Action: Check if IDS rules cover that port; manual investigation
