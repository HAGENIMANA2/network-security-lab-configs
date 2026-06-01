
---

## 10-server-configs/README.md

```markdown
# 10-server-configs

## Purpose
Production-ready configuration files for web servers, application servers, and databases commonly used in enterprise environments.

## Files

| File | Description | Typical Location |
|------|-------------|------------------|
| `apache-vhost.conf` | Apache virtual host configuration template | `/etc/apache2/sites-available/` |
| `nginx-reverse-proxy.conf` | Nginx reverse proxy with SSL | `/etc/nginx/sites-available/` |
| `tomcat-server.xml` | Apache Tomcat server configuration | `/opt/tomcat/conf/` |
| `mysql-my.cnf` | MySQL/MariaDB performance optimization | `/etc/mysql/my.cnf` |

## Installation Instructions

### Apache Configuration
```bash
# Copy configuration
sudo cp apache-vhost.conf /etc/apache2/sites-available/example.conf

# Enable site
sudo a2ensite example.conf

# Test configuration
sudo apache2ctl configtest

# Reload Apache
sudo systemctl reload apache2
