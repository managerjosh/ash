wget https://github.com/trustedsec/artillery/archive/master.zip -O art.zip
unzip art.zip ; mv artillery-master art
cp ash/artillery/config /var/artillery/config
python art/setup.py
