
#!/bin/bash
# ============================================
# Disaster Recovery Failover Script
# Author: Jean de Dieu HAGENIMANA
# Description: Automated failover to DR site
# ============================================

PRIMARY_IP="192.168.1.10"
DR_IP="192.168.2.10"
VIP="192.168.1.100"
LOG_FILE="/var/log/dr-failover.log"

log() {
    echo "$(date): $1" >> $LOG_FILE
}

check_primary() {
    ping -c 3 $PRIMARY_IP > /dev/null 2>&1
    return $?
}

failover_to_dr() {
    log "Initiating failover to DR site"
    
    # Stop services on primary
    ssh root@$PRIMARY_IP "systemctl stop nginx mysql" >> $LOG_FILE 2>&1
    
    # Start services on DR
    ssh root@$DR_IP "systemctl start nginx mysql" >> $LOG_FILE 2>&1
    
    # Move virtual IP to DR
    ssh root@$DR_IP "ip addr add $VIP/24 dev eth0" >> $LOG_FILE 2>&1
    ssh root@$PRIMARY_IP "ip addr del $VIP/24 dev eth0" >> $LOG_FILE 2>&1
    
    log "Failover completed - DR is now active"
}

failback_to_primary() {
    log "Initiating failback to primary site"
    
    # Sync data from DR to primary
    rsync -avz root@$DR_IP:/var/lib/mysql/ root@$PRIMARY_IP:/var/lib/mysql/ >> $LOG_FILE 2>&1
    
    # Start services on primary
    ssh root@$PRIMARY_IP "systemctl start nginx mysql" >> $LOG_FILE 2>&1
    
    # Move virtual IP back to primary
    ssh root@$PRIMARY_IP "ip addr add $VIP/24 dev eth0" >> $LOG_FILE 2>&1
    ssh root@$DR_IP "ip addr del $VIP/24 dev eth0" >> $LOG_FILE 2>&1
    
    log "Failback completed - Primary is now active"
}

# Main execution
if check_primary; then
    log "Primary is reachable - no action needed"
else
    log "Primary is DOWN - initiating failover"
    failover_to_dr
fi
