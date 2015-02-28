# Debian Artillery Script by c2_
\apt-get install git
\cd /tmp
\rm -r /tmp/artillery
\git clone https://github.com/trustedsec/artillery
\cp -r ash/artillery/setup.py /tmp/artillery
\/bin/busybox rm -r /var/artillery
python /tmp/artillery/setup.py
\cp -r ash/artillery/config /var/artillery

#echo "Edit Bind Interface, Example: 192.168.0.22;press Enter to Edit Config(Nano), Remember to save"
#read $pressEnter
#nano +97 /var/artillery/config
\python /var/artillery/restart_server.py

