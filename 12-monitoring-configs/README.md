# 12-monitoring-configs

## Purpose
Monitoring system configurations for Nagios, SNMP, and log aggregation.

## Files

| File | Description |
|------|-------------|
| `nagios-config.cfg` | Nagios core configuration with host and service definitions |
| `snmp-config.conf` | SNMP v3 configuration for network device monitoring |
| `log-aggregation.sh` | Centralized log collection script using rsyslog |

## Usage
- Deploy nagios-config.cfg to `/etc/nagios/`
- Configure snmp-config.conf on network devices
- Run log-aggregation.sh on log server

## Author
Jean de Dieu HAGENIMANA - System Administrator
