
echo "What is the ip address of this system?"
read ip_address

apt-get install samba-common samba -y

echo "-A RH-Firewall-1-INPUT -s $ip_address/24 -m state --state NEW -p tcp --dport 137 -j ACCEPT" >> /etc/iptables/rulez
echo "-A RH-Firewall-1-INPUT -s $ip_address/24 -m state --state NEW -p tcp --dport 138 -j ACCEPT" >> /etc/iptables/rulez
echo "-A RH-Firewall-1-INPUT -s $ip_address/24 -m state --state NEW -p tcp --dport 139 -j ACCEPT" >> /etc/iptables/rulez
echo "-A RH-Firewall-1-INPUT -s $ip_address/24 -m state --state NEW -p tcp --dport 445 -j ACCEPT" >> /etc/iptables/rulez
iptables-restore < /etc/iptables/rulez

Getsebool –a | grep samba
Getsebool –a | grep smb
Setsebool –P samba_domain_controller on
