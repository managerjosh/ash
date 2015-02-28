# Debian Artillery Script by c2_
\apt-get install git
\rm -r /var/artillery
\git clone https://github.com/trustedsec/artillery
\cp -r ash/artillery/setup.py /root/artillery
\python setup.py
\python restart_server.py


