# Debian Artillery Script by c2_
\apt-get install git
\cd /tmp
\rm -r /tmp/artillery
\git clone https://github.com/trustedsec/artillery
\/bin/busybox sed -i '15s/.*/ /' /tmp/artillery/setup.py
\/bin/busybox sed -i '16s/.*/ /' /tmp/artillery/setup.py
\/bin/busybox sed -i '17s/.*/ /' /tmp/artillery/setup.py
\/bin/busybox sed -i '18s/.*/ /' /tmp/artillery/setup.py
\/bin/busybox sed -i '19s/.*/ /' /tmp/artillery/setup.py
\/bin/busybox sed -i '21s/.*/    answer = "yes"/' /tmp/artillery/setup.py
\/bin/busybox sed -i '22s/.*/answer = "yes"/' /tmp/artillery/setup.py
\/bin/busybox sed -i '69s/.*/        choice = "yes"/' /tmp/artillery/setup.py 
\/bin/busybox sed -i '91s/.*/    choice = "yes"/' /tmp/artillery/setup.py 
\/bin/busybox sed -i '93s/.*/    if is_posix():' /tmp/artillery/setup.py 
\/bin/busybox rm -r /var/artillery
python /tmp/artillery/setup.py

\cd /var/artillery
\/bin/busybox sed -i '18s/.*/MONITOR_FOLDERS="\/proc","\/sys","\/sh","\/tmp","\/home","\/dev","\/lib","\/lib64","\/opt","\/run","\/srv","\/var\/www","\/etc","\/var","\/bin","\/sbin","\/usr","\/boot"/' /var/artillery/config
\/bin/busybox sed -i '30s/.*/HONEYPOT_BAN="ON"/' /var/artillery/config
\/bin/busybox sed -i '69s/.*/SSH_BRUTE_ATTEMPTS="1"/' /var/artillery/config
\/bin/busybox sed -i '72s/.*/FTP_BRUTE_MONITOR="ON"/' /var/artillery/config
\/bin/busybox sed -i '75s/.*/FTP_BRUTE_ATTEMPTS="1"/' /var/artillery/config
\/bin/busybox sed -i '84s/.*/ANTI_DOS_PORTS="80,443,8080,9300,8443,9443"/' /var/artillery/config

#echo "Edit Bind Interface, Example: 192.168.0.22;press Enter to Edit Config(Nano), Remember to save"
#read $pressEnter
#nano +97 /var/artillery/config
\python /var/artillery/restart_server.py

