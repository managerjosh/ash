hostname -I > ip1.txt
ip_address=$(cut -d' ' -f1 ip1.txt)

echo "-A INPUT -s $ip_address/24 -m state --state NEW -p tcp --dport 137 -j ACCEPT" >> /etc/iptables/rulez
echo "-A INPUT -s $ip_address/24 -m state --state NEW -p tcp --dport 138 -j ACCEPT" >> /etc/iptables/rulez
echo "-A INPUT -s $ip_address/24 -m state --state NEW -p tcp --dport 139 -j ACCEPT" >> /etc/iptables/rulez
echo "-A INPUT -s $ip_address/24 -m state --state NEW -p tcp --dport 445 -j ACCEPT" >> /etc/iptables/rulez

iptables -A INPUT -s $ip_address/24 -m state --state NEW -p tcp --dport 137 -j ACCEPT
iptables -A INPUT -s $ip_address/24 -m state --state NEW -p tcp --dport 138 -j ACCEPT
iptables -A INPUT -s $ip_address/24 -m state --state NEW -p tcp --dport 139 -j ACCEPT
iptables -A INPUT -s $ip_address/24 -m state --state NEW -p tcp --dport 445 -j ACCEPT
