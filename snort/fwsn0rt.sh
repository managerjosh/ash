wget https://github.com/mrash/fwsnort/archive/master.zip -O fwsnort.zip
unzip fwsnort.zip ; mv fwsnort-master cowbell
perl cowbell/install.pl
ip_address=$(ifconfig eth0 | awk -F"[: ]+" '/inet addr:/ {print $4}')
sed -i "15s/.*/HOME_NET $ip_address;/" /etc/fwsnort.conf
sed -i "16s/.*/EXTERNAL_NET !$$ip_address;/" /etc/fwsnort.conf
fwsnort
/var/lib/fwsnort/fwsnort.sh
