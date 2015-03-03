read input
ip_address=$(read input)

echo "-A RH-Firewall-1-INPUT -s $ip_address/24 -m state --state NEW -p tcp --dport 137 -j ACCEPT" >> /etc/iptables/rulez
echo "-A RH-Firewall-1-INPUT -s $ip_address/24 -m state --state NEW -p tcp --dport 138 -j ACCEPT" >> /etc/iptables/rulez
echo "-A RH-Firewall-1-INPUT -s $ip_address/24 -m state --state NEW -p tcp --dport 139 -j ACCEPT" >> /etc/iptables/rulez
echo "-A RH-Firewall-1-INPUT -s $ip_address/24 -m state --state NEW -p tcp --dport 445 -j ACCEPT" >> /etc/iptables/rulez

iptables -A RH-Firewall-1-INPUT -s $ip_address/24 -m state --state NEW -p tcp --dport 137 -j ACCEPT
iptables -A RH-Firewall-1-INPUT -s $ip_address/24 -m state --state NEW -p tcp --dport 138 -j ACCEPT
iptables -A RH-Firewall-1-INPUT -s $ip_address/24 -m state --state NEW -p tcp --dport 139 -j ACCEPT
iptables -A RH-Firewall-1-INPUT -s $ip_address/24 -m state --state NEW -p tcp --dport 445 -j ACCEPT
