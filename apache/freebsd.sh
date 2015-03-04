pkg install -y apache24
echo 'apache24_enable="YES"' >> /etc/rc.conf

echo "Edit httpd config file (using 'vi') in 3 seconds..."
echo 'ServerRoot "/usr/local"'
echo 'ServerAdmin you@your.address'
echo 'ServerName www.example.com:80'
echo 'DocumentRoot "/usr/local/www/apache24/data"'
echo 'Listen :80'
sleep 3
vi /usr/local/etc/apache24/httpd.conf

service apache24 onestart
/usr/local/sbin/apachectl start
