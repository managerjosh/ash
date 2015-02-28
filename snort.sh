\rm -r /usr/src/*
\apt-get install wget nano make g++ bison flex git python sed htop libpcre3-dev libdumbnet-dev zlib1g-dev libpcap-dev -y
cd /usr/src
wget http://www.tcpdump.org/release/libpcap-1.6.2.tar.gz  http://libdnet.googlecode.com/files/libdnet-1.12.tgz https://www.snort.org/downloads/snort/daq-2.0.4.tar.gz https://snort.org/downloads/snort/snort-2.9.7.0.tar.gz
tar -xzf libpcap-1.6.2.tar.gz && cd /usr/src/libpcap-1.6.2
./configure --prefix=/usr && make && make install 
cd /usr/src
tar -xzf libdnet-1.12.tgz z && cd /usr/src/libdnet-1.12
./configure --prefix=/usr --enable-shared --with-dnet-* && make && make install
cd /usr/src
tar -xzf daq-2.0.4.tar.gz && cd /usr/src/daq-2.0.4
./configure && make && make install
cd /usr/src
tar -xzf snort-2.9.7.0.tar.gz && cd /usr/src/snort-2.9.7.0
./configure --enable-sourcefire && make && make install
rm -r /usr/local/etc/snort /usr/local/etc/snort/rules /var/log/snort /usr/local/lib/snort_dynamicrules
mkdir /usr/local/etc/snort /usr/local/etc/snort/rules /var/log/snort /usr/local/lib/snort_dynamicrules
touch /usr/local/etc/snort/rules/white_list.rules /usr/local/etc/snort/rules/black_list.rules /usr/local/etc/snort/sid-msg.map
groupadd snort && useradd -g snort snort
cp /usr/src/snort-2.9.7.0/etc/*.conf /usr/local/etc/snort
cp /usr/src/snort-2.9.7.0/etc/*.map /usr/local/etc/snort
cp /root/ash/snort/snort.conf /usr/local/etc/snort
touch /usr/local/etc/snort/rules/white_list.rules
touch /usr/local/etc/snort/rules/black_list.rules
ipaddress=$(hostname -I) ; 

