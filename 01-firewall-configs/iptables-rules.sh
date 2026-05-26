#!/bin/bash 
# IPTables Firewall Configuration Sample 
# Author: Jean de Dieu HAGENIMANA - CCNA Certified 
 
iptables -F 
iptables -X 
iptables -P INPUT DROP 
iptables -P FORWARD DROP 
iptables -P OUTPUT ACCEPT 
iptables -A INPUT -i lo -j ACCEPT 
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT 
iptables -A INPUT -p tcp --dport 22 -s 192.168.0.0/24 -j ACCEPT 
iptables -A INPUT -p tcp --dport 80 -j ACCEPT 
iptables -A INPUT -p tcp --dport 443 -j ACCEPT 
iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/second -j ACCEPT 
iptables -A INPUT -j LOG --log-prefix "IPTABLES-DROPPED: " --log-level 4 
echo "Firewall rules applied successfully" 
