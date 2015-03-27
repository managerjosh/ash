#!/bin/bash

ip link add link eth0 name eth0.2 type vlan id 2
ip link add link eth0 name eth0.3 type vlan id 3

brctl addbr br0
brctl addif br0 eth0.2
brctl addif br0 eth0.3

ip link set eth0 up
ip link set eth0.2 up
ip link set eth0.3 up
ip link set br0 up

iptables -X 
iptables -F
iptables -t nat -F


#Logging chains
iptables -N LOGACCEPT
iptables -N LOGDROP

iptables -A LOGACCEPT -m conntrack --ctstate NEW -j LOG --log-prefix "[MLB ACCEPTED] " --log-tcp-sequence --log-tcp-options --log-ip-options
iptables -A LOGACCEPT -j ACCEPT

iptables -A LOGDROP -m conntrack --ctstate NEW -j LOG --log-prefix "[MLB DROPPED] " --log-tcp-sequence --log-tcp-options --log-ip-options
iptables -A LOGDROP -j DROP

#Rate limiting
iptables -N RATELIMIT
iptables -A RATELIMIT -j LOG --log-prefix "[MLB RATE LIMITED]"
iptables -A RATELIMIT -m conntrack --ctstate NEW -m recent --set --name DEFAULT --rsource
iptables -A RATELIMIT -m conntrack --ctstate NEW -m recent --update --seconds 10 --hitcount 3 --name DEFAULT --rsource -j DROP

#Host rules
iptables -P INPUT DROP
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j LOGACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -j LOG --log-prefix "[MLB-IN-DROP] "
iptables -P OUTPUT ACCEPT

#Egress filtering
iptables -P FORWARD DROP
iptables -A FORWARD -m physdev --physdev-in eth0.2 -p udp --dport 53 -j LOGACCEPT
iptables -A FORWARD -m physdev --physdev-in eth0.2 -p tcp --dport 80 -j LOGACCEPT
iptables -A FORWARD -m physdev --physdev-in eth0.2 -p tcp --dport 443 -j LOGACCEPT
iptables -A FORWARD -m physdev --physdev-in eth0.2 -j LOGDROP
#this is where you add rules for any other services we need to connect out to

#Ingress filtering
iptables -A FORWARD -m physdev --physdev-in eth0.3 -m conntrack --ctstate ESTABLISHED,RELATED -j LOGACCEPT
#this is where you add rules for letting in connections to services we're running
#use RATELIMIT as a target for rules you add here
