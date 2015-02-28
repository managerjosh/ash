# Debian Artillery Script by c2_
\apt-get install git
\rm -r /var/artillery
\git clone https://github.com/trustedsec/artillery
\cp -r ash/artillery/setup.py /root/artillery
\python /root/artillerysetup.py
\python /root/artilleryrestart_server.py


