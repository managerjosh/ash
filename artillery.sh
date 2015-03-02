# Artillery Script by c2_
\rm -r /var/artillery
\rm -r -f /var/artillery
\git clone https://github.com/trustedsec/artillery
\cp -r ash/artillery/setup.py /root/artillery
\python /root/artillery/setup.py
\python /root/artillery/restart_server.py


