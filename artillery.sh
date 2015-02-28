# Debian Artillery Script by c2_
\apt-get install git
\cd /tmp
\rm -r /tmp/artillery
\git clone https://github.com/trustedsec/artillery
\cp -r ash/artillery/setup.py /tmp/artillery
\/bin/busybox rm -r /var/artillery
python /tmp/artillery/setup.py
\cp -r ash/artillery/config /var/artillery
python /tmp/artillery/restart_server.py


