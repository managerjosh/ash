pkg install -y apache24
echo 'apache24_enable="YES"' >> /etc/rc.conf
service apache24 onestart
/usr/local/sbin/apachectl start
