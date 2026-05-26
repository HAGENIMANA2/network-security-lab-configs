# VPN Access Policy

## Purpose
This policy defines the rules and procedures for secure remote access to the corporate network via VPN.

## Authorized Users
- Full-time employees with business need
- Approved third-party vendors (temporary access only)
- Emergency access accounts (strictly controlled)

## Authentication Requirements

| Requirement | Standard |
|-------------|----------|
| Password length | Minimum 12 characters |
| Multi-factor authentication | Required for all users |
| Password expiration | 90 days |
| Session timeout | 8 hours (max) |

## Allowed Services via VPN

| Role | Allowed Access |
|------|----------------|
| System Administrator | SSH (22), RDP (3389), HTTPS (443) |
| Developer | HTTPS (443), Git (22, 9418) |
| Database Administrator | MySQL (3306), PostgreSQL (5432) |
| General User | Internal web apps (443) |

## Prohibited Activities
- Peer-to-peer file sharing
- Personal browsing (non-business)
- Downloading unauthorized software
- Bypassing security controls

## Monitoring and Logging
- All VPN connections logged
- Session duration tracked
- Unusual patterns trigger alerts
- Logs retained for 90 days minimum

## Incident Response
Report suspected VPN compromise immediately to Security Team:
- Email: jados2@gmail.com 
- Phone: Security hotline
