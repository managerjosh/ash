\busybox echo "Changing root password..."
\/usr/bin/passwd
\unalias -a
\export $PATH=/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/bin:/usr/local/sbin
\chattr -i /etc/passwd
\chattr -i /etc/shadow
\/bin/busybox sed -i '1s/.*/root:x:0:0:root:\/root:\/bin\/bash/' /etc/passwd
\chattr -i ~/.bash_profile
\chattr -i ~/.bashrc
\rm -r ~/.bash_profile
\rm -r ~/.bashrc
\touch ~/.bashrc
\source ~/.bashrc
\unalias passwd
\/etc/init.d/cron stop
\update-rc.d cron disable
\/etc/init.d/netcat stop
\update-rc.d/netcat disable
\/etc/init.d/ssh stop
\update-rc.d/ssh disable
\/etc/init.d/telnet stop
\update-rc.d/telnet disable
\/etc/init.d/samba stop
\update-rc.d/samba disable
\apt-get remove netcat* ssh* telnet* -y
\cp /etc/security/limits.conf /etc/security/limits.conf.old
\chmod 444 /etc/security/limits.conf.old
\chattr +i /etc/security/limits.conf.old
\rm -r /root/blank*
\touch /root/blank.txt
\cp -r /root/blank.txt /etc/apt/sources.list 
\cp -r /root/blank.txt ~/.bash_profile
\cp -r /root/blank.txt /etc/security/limits.conf
\/bin/busybox echo "* hard maxsyslogins 1">> /etc/security/limits.conf
\/bin/busybox echo "* soft maxlogins 1">> /etc/security/limits.conf
\chattr +i /etc/security/limits.conf
\mkdir /etc/iptables
\mkdir /var/iptables
\iptables --flush
\iptables -P INPUT ACCEPT
\iptables -P FORWARD ACCEPT
\iptables -P OUTPUT ACCEPT
\iptables -t nat -F
\iptables -t mangle -F
\iptables -F
\iptables -X
\iptables -A INPUT -i lo -j ACCEPT
\iptables -A INPUT ! -i lo -d 127.0.0.0/8 -j REJECT
\iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
\iptables -A INPUT -p tcp --dport 80 -j ACCEPT
\iptables -A INPUT -p tcp --dport 443 -j ACCEPT
#iptables -A INPUT -p udp --dport 53 -j ACCEPT
#iptables -A INPUT -p tcp -s $teamIP1 --sport 1024:65535 -d $IPaddress --dport $hostport1 -m state --state NEW,ESTABLISHED -j ACCEPT
\iptables -A INPUT -p tcp -m state --state NEW --dport 22 -j ACCEPT
\iptables -A INPUT -p icmp -m icmp --icmp-type 8 -j REJECT
\iptables -A INPUT -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7
\iptables -A INPUT -j REJECT
\iptables -A FORWARD -j REJECT
\iptables -A OUTPUT -j ACCEPT
\iptables -S > /etc/iptables/rulez
\iptables -S > /var/iptables/rulez
\/bin/busybox sed -i '1s/.*/*filter/' /etc/iptables/rulez
\/bin/busybox echo "COMMIT" >> /etc/iptables/rulez
\iptables-save
\/bin/busybox echo "deb http://ftp.us.debian.org/debian/ wheezy main" >> /etc/apt/sources.list
\/bin/busybox echo "deb-src http://ftp.us.debian.org/debian/ wheezy main" >> /etc/apt/sources.list
\/bin/busybox echo "deb http://security.debian.org/ wheezy/updates main" >> /etc/apt/sources.list
\/bin/busybox echo "deb-src http://security.debian.org/ wheezy/updates main" >> /etc/apt/sources.list
\/bin/busybox echo "deb http://ftp.us.debian.org/debian/ wheezy-updates main" >> /etc/apt/sources.list
\/bin/busybox echo "deb-src http://ftp.us.debian.org/debian/ wheezy-updates main" >> /etc/apt/sources.list
#echo "deb http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list
#echo "deb-src http://packages.dotdeb.org wheezy all">> /etc/apt/sources.list
\apt-get update -y
\apt-get upgrade -y
