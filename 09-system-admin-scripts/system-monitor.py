#!/usr/bin/env python3
# ============================================
# System Monitoring Script
# Author: Jean de Dieu HAGENIMANA
# Description: Monitors CPU, memory, disk, and services
# ============================================

import psutil
import datetime
import smtplib
import subprocess

# Configuration
ALERT_THRESHOLD_CPU = 80
ALERT_THRESHOLD_MEMORY = 90
ALERT_THRESHOLD_DISK = 85
ALERT_EMAIL = "admin@example.com"

def check_cpu():
    cpu_percent = psutil.cpu_percent(interval=1)
    if cpu_percent > ALERT_THRESHOLD_CPU:
        return f"WARNING: CPU usage at {cpu_percent}%"
    return f"CPU: {cpu_percent}% - OK"

def check_memory():
    memory = psutil.virtual_memory()
    memory_percent = memory.percent
    if memory_percent > ALERT_THRESHOLD_MEMORY:
        return f"WARNING: Memory usage at {memory_percent}%"
    return f"Memory: {memory_percent}% - OK"

def check_disk():
    disk = psutil.disk_usage('/')
    disk_percent = disk.percent
    if disk_percent > ALERT_THRESHOLD_DISK:
        return f"WARNING: Disk usage at {disk_percent}%"
    return f"Disk: {disk_percent}% - OK"

def check_services(services):
    results = []
    for service in services:
        cmd = f"systemctl is-active {service}"
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
        status = "RUNNING" if result.returncode == 0 else "STOPPED"
        results.append(f"{service}: {status}")
    return results

def generate_report():
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    report = []
    report.append(f"System Health Report - {timestamp}")
    report.append("=" * 50)
    report.append(check_cpu())
    report.append(check_memory())
    report.append(check_disk())
    report.append("")
    report.append("Services Status:")
    services = ["nginx", "mysql", "ssh", "cron"]
    for status in check_services(services):
        report.append(f"  - {status}")
    return "\n".join(report)

if __name__ == "__main__":
    report = generate_report()
    print(report)
    
    # Optional: Send email alert if issues found
    if "WARNING" in report:
        print("Warnings detected - would send email alert here")
        # send_email_alert(report)
