#debian 
#to Execute:
# bash ash.sh
\unalias -a
\export $PATH=/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/bin:/usr/local/sbin
\chattr -i /etc/passwd
\chattr -i /etc/shadow
\/bin/busybox sed -i '1s/.*/root:x:0:0:root:\/root:\/bin\/bash/' /etc/passwd
\chattr -i ~/.bash_profile
\rm -r ~/.bash_profile
\/etc/init.d/cron stop
\update-rc.d cron disable
\/etc/init.d/netcat stop
\update-rc.d/netcat disable
\/etc/init.d/ssh stop
\update-rc.d/ssh disable
\/etc/init.d/telnet stop
\update-rc.d/telnet disable
\chattr -i /etc/passwd
\mv /etc/security/limits.conf /etc/security/limits.conf.old
\chmod 444 /etc/security/limits.conf.old
\chattr +i /etc/security/limits.conf.old
\rm -r /root/blank*
\touch /root/blank.txt
\cp -r /root/blank.txt /etc/apt/sources.list 
\cp -r /root/blank.txt ~/.bash_profile
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

sed -i '1s/.*/*filter/' /etc/iptables/rulez
echo "COMMIT" >> /etc/iptables/rulez
echo "iptables-restore < /etc/iptables/rulez" >> ~/.bash_profile
echo "iptables-restore < /etc/iptables/rulez" >> ~/.bash_profile
echo "deb http://ftp.us.debian.org/debian/ wheezy main" >> /etc/apt/sources.list
echo "deb-src http://ftp.us.debian.org/debian/ wheezy main" >> /etc/apt/sources.list
echo "deb http://security.debian.org/ wheezy/updates main" >> /etc/apt/sources.list
echo "deb-src http://security.debian.org/ wheezy/updates main" >> /etc/apt/sources.list
echo "deb http://ftp.us.debian.org/debian/ wheezy-updates main" >> /etc/apt/sources.list
echo "deb-src http://ftp.us.debian.org/debian/ wheezy-updates main" >> /etc/apt/sources.list
#echo "deb http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list
#echo "deb-src http://packages.dotdeb.org wheezy all">> /etc/apt/sources.list
apt-get update -y
apt-get upgrade -y
apt-get install wget nano make g++ bison flex git python sed htop libpcre3-dev zlib1g-dev libpcap-dev -y
cd /tmp
rm -r /tmp/artillery
git clone https://github.com/trustedsec/artillery
sed -i '15s/.*/ /' /tmp/artillery/setup.py
sed -i '16s/.*/ /' /tmp/artillery/setup.py
sed -i '17s/.*/ /' /tmp/artillery/setup.py
sed -i '18s/.*/ /' /tmp/artillery/setup.py
sed -i '19s/.*/ /' /tmp/artillery/setup.py
sed -i '20s/.*/ /' /tmp/artillery/setup.py
sed -i '21s/.*/ /' /tmp/artillery/setup.py
sed -i '22s/.*/answer = "yes"/' /tmp/artillery/setup.py
sed -i '69s/.*/        choice = "yes"/' /tmp/artillery/setup.py 
sed -i '91s/.*/    choice = "yes"/' /tmp/artillery/setup.py 
sed -i '93s/.*/    if is_posix():' /tmp/artillery/setup.py 
# ADD WHITELISTS IP ADDRESSES, especially from Scoring Engine (Ask whiteteam?)
rm -r /var/artillery
python /tmp/artillery/setup.py
#echo "Add Whitelist IPs Ex: 192.168.0.22, etc;Press Enter to Edit Config(Nano), Remember to save"
#read $pressEnter
#nano +33 /var/artillery/config
cd /var/artillery
sed -i '18s/.*/MONITOR_FOLDERS="\/proc","\/sys","\/sh","\/tmp","\/home","\/dev","\/lib","\/lib64","\/opt","\/run","\/srv","\/var\/www","\/etc","\/var","\/bin","\/sbin","\/usr","\/boot"/' /var/artillery/config

sed -i '30s/.*/HONEYPOT_BAN="ON"/' /var/artillery/config
sed -i '69s/.*/SSH_BRUTE_ATTEMPTS="1"/' /var/artillery/config
sed -i '72s/.*/FTP_BRUTE_MONITOR="ON"/' /var/artillery/config
sed -i '75s/.*/FTP_BRUTE_ATTEMPTS="1"/' /var/artillery/config
#echo "Edit Bind Interface, Example: 192.168.0.22;press Enter to Edit Config(Nano), Remember to save"
#read $pressEnter
#nano +97 /var/artillery/config
python /var/artillery/restart_server.py

apt-get remove g++* python* wget* make* flex* -y
\echo "Change shells of Games, Nobody, and any other that uses /bin/bash to /bin/false"
\echo "Change shells of Games, Nobody, and any other that uses /bin/bash to /bin/false"
\echo "Change shells of Games, Nobody, and any other that uses /bin/bash to /bin/false"
\echo "Change shells of Games, Nobody, and any other that uses /bin/bash to /bin/false"
\echo "Change shells of Games, Nobody, and any other that uses /bin/bash to /bin/false"
