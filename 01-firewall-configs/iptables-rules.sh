#!/bin/bash
# IPTables Firewall Configuration Sample
# Demonstrates: Default deny, allowed services, NAT, logging
# Author: Jean de Dieu HAGENIMANA - CCNA Certified

# Flush existing rules
iptables -F
iptables -X
iptables -t nat -F
iptables -t mangle -F

# Set default policies (DROP all by default)
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Allow loopback interface
iptables -A INPUT -i lo -j ACCEPT

# Allow established connections
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow SSH (port 22) - restrict to management subnet
iptables -A INPUT -p tcp --dport 22 -s 192.168.0.0/24 -j ACCEPT

# Allow HTTP/HTTPS
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Allow DNS
iptables -A INPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p tcp --dport 53 -j ACCEPT

# Allow ICMP (ping) - limited to prevent flooding
iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/second -j ACCEPT

# Log dropped packets for monitoring
iptables -A INPUT -j LOG --log-prefix "IPTABLES-DROPPED: " --log-level 4

# Save rules (Ubuntu/Debian)
iptables-save > /etc/iptables/rules.v4

echo "Firewall rules applied successfully"
echo "Current rules:"
iptables -L -v -n
