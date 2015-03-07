hostname -I > ip1.txt
ip_address=$(cut -d' ' -f1 ip1.txt)

iptables -A INPUT --sport $ip_address -m state --state NEW -p tcp --dport 5601 -j ACCEPT
iptables -A INPUT --sport $ip_address -m state --state NEW -p tcp --dport 80 -j ACCEPT
iptables -A INPUT --sport $ip_address -m state --state NEW -p tcp --dport 56892 -j ACCEPT
iptables -A INPUT --sport $ip_address -m state --state NEW -p tcp --dport 56900 -j ACCEPT
iptables -A INPUT --sport $ip_address -m state --state NEW -p tcp --dport 56889 -j ACCEPT
iptables -A INPUT --sport $ip_address -m state --state NEW -p tcp --dport 56894 -j ACCEPT
iptables -A INPUT --sport $ip_address -m state --state NEW -p tcp --dport 56899 -j ACCEPT
iptables -A INPUT --sport $ip_address -m state --state NEW -p tcp --dport 56891 -j ACCEPT
iptables -A INPUT --sport $ip_address -m state --state NEW -p tcp --dport 56895 -j ACCEPT
iptables -A INPUT --sport $ip_address -m state --state NEW -p tcp --dport 9090 -j ACCEPT
iptables -A INPUT --sport $ip_address -m state --state NEW -p tcp --dport 9200 -j ACCEPT
iptables -A INPUT --sport $ip_address -m state --state NEW -p tcp --dport 9300 -j ACCEPT
iptables -A INPUT --sport $ip_address -m state --state NEW -p tcp --dport 22 -j REJECT

iptables-save

echo "UPDATED RULES"
cat /etc/iptables/rulez
