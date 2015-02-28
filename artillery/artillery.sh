# Debian Secure Script by c2_
# Environment: Assume network interface configured, no Systemd, tested Debian 7.7, need assume busybox, sed, python
# Execute:
# \bash ash.sh
# What it does:
# 1.  Unalias all alias
# 2.  Corrects path
# 3.  Remove immutable lock on /etc/passwd & /etc/shadow
# 4.  Uses busybox to edit /etc/passwd root's shell
# 5.  Remove immutable lock on ~/.bash_profile & ~/.bashrc
# 6.  Stops common services: cron, netcat, ssh, telnet, samba
# 7.  Set Max simultaneous Logins for root, copys current config to .old
# 8.  Creates Blank file
# 9.  Cleans out repository and bashprofile startup scripts
# 10. Makes a directory for iptables
# 11. Begin adding firewall rules
# 12. Save rules to /etc/iptables/rulez & /var/iptables/rulez
# 13. Adjusts repository
# 14. Patches/Updates
# 15. Install tools and compilers
# 16. Download Artillery, Configure, Install, Start
# 17. Removes netcat, ssh, and telnet
# 18. Clean unneeded packages

\apt-get install wget nano make g++ bison flex git python sed htop libpcre3-dev zlib1g-dev libpcap-dev -y
\cd /tmp
\rm -r /tmp/artillery
\git clone https://github.com/trustedsec/artillery
\/bin/busybox sed -i '15s/.*/ /' /tmp/artillery/setup.py
\/bin/busybox sed -i '16s/.*/ /' /tmp/artillery/setup.py
\/bin/busybox sed -i '17s/.*/ /' /tmp/artillery/setup.py
\/bin/busybox sed -i '18s/.*/ /' /tmp/artillery/setup.py
\/bin/busybox sed -i '19s/.*/ /' /tmp/artillery/setup.py
\/bin/busybox sed -i '20s/.*/ /' /tmp/artillery/setup.py
\/bin/busybox sed -i '21s/.*/ /' /tmp/artillery/setup.py
\/bin/busybox sed -i '22s/.*/answer = "yes"/' /tmp/artillery/setup.py
\/bin/busybox sed -i '69s/.*/        choice = "yes"/' /tmp/artillery/setup.py 
\/bin/busybox sed -i '91s/.*/    choice = "yes"/' /tmp/artillery/setup.py 
\/bin/busybox sed -i '93s/.*/    if is_posix():' /tmp/artillery/setup.py 
\/bin/busybox rm -r /var/artillery
python /tmp/artillery/setup.py
#echo "Add Whitelist IPs Ex: 192.168.0.22, etc;Press Enter to Edit Config(Nano), Remember to save"
#read $pressEnter
#nano +33 /var/artillery/config
\ cd /var/artillery
\/bin/busybox sed -i '18s/.*/MONITOR_FOLDERS="\/proc","\/sys","\/sh","\/tmp","\/home","\/dev","\/lib","\/lib64","\/opt","\/run","\/srv","\/var\/www","\/etc","\/var","\/bin","\/sbin","\/usr","\/boot"/' /var/artillery/config
\/bin/busybox sed -i '30s/.*/HONEYPOT_BAN="ON"/' /var/artillery/config
\/bin/busybox sed -i '69s/.*/SSH_BRUTE_ATTEMPTS="1"/' /var/artillery/config
\/bin/busybox sed -i '72s/.*/FTP_BRUTE_MONITOR="ON"/' /var/artillery/config
\/bin/busybox sed -i '75s/.*/FTP_BRUTE_ATTEMPTS="1"/' /var/artillery/config
#echo "Edit Bind Interface, Example: 192.168.0.22;press Enter to Edit Config(Nano), Remember to save"
#read $pressEnter
#nano +97 /var/artillery/config
\python /var/artillery/restart_server.py
\apt-get remove netcat* ssh* telnet* -y
\echo "TODO: Artillery is installed & activated, Adjust Whitelist in: /var/artillery/config then restart_server.py"
\echo "TODO: Kill jobs"
\echo "TODO: Change shells of Games, Nobody, and any other that uses /bin/bash to /bin/false"
\echo "TODO: Tweak Firewall rules, save rules"
\echo "TODO: Check ~/.mysql_history"
\echo "TODO: Check History"
\echo "TODO: CHANGE PASSWORDS"
\echo "---!!!---REMEMBER THAT /etc/passwd & /etc/shadow ARE IMMUTABLE---!!!!---"
\echo "---!!!---REMEMBER THAT /etc/passwd & /etc/shadow ARE IMMUTABLE---!!!!---"
\echo "---!!!---REMEMBER THAT /etc/passwd & /etc/shadow ARE IMMUTABLE---!!!!---"
\apt-get clean
\apt-get autoclean
\apt-get autoremove
\chattr +i /etc/passwd
\chattr +i /etc/shadow

