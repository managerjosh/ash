
echo "-A RH-Firewall-1-INPUT -s 192.168.1.0/24 -m state --state NEW -p tcp --dport 137 -j ACCEPT" >> /etc/iptables/rulez
echo "-A RH-Firewall-1-INPUT -s 192.168.1.0/24 -m state --state NEW -p tcp --dport 138 -j ACCEPT" >> /etc/iptables/rulez
echo "-A RH-Firewall-1-INPUT -s 192.168.1.0/24 -m state --state NEW -p tcp --dport 139 -j ACCEPT" >> /etc/iptables/rulez
echo "-A RH-Firewall-1-INPUT -s 192.168.1.0/24 -m state --state NEW -p tcp --dport 445 -j ACCEPT" >> /etc/iptables/rulez
iptables-restore < /etc/iptables/rulez
