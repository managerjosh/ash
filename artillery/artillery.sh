wget https://github.com/trustedsec/artillery/archive/master.zip -O art.zip
unzip art.zip ; mv artillery-master art

python art/setup.py
cp -r ash/artillery/config /var/artillery/config
