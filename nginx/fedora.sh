
yum install nginx
mkdir /etc/nginx/ssl
cd /etc/nginx/ssl
openssl genrsa -des3 -out server.key 1024
openssl req -new -key server.key -out server.csr
cp server.key server.key.org
openssl rsa -in server.key.org -out server.key
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

yum install yum-utils
htpasswd -c /etc/nginx/conf.d/kibana.htpasswd root
htpasswd /etc/nginx/conf.d/kibana.htpasswd root
htpasswd -c /etc/nginx/conf.d/kibana-write.htpasswd root
 
cp -r ash/nginx/sites-available/logcatcher /etc/nginx/sites-available/logcatcher
 
sudo rm /etc/nginx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/logcatcher /etc/nginx/sites-enabled/logcatcher


service nginx start
service nginx restart

# /etc/nginx/sites-enabled/
# /etc/nginx/sites-available/

# Reveal VPS ipaddress
# ifconfig eth0 | grep inet | awk '{ print $2 }'

# Open up the default virtual host file with this command:

# nano /etc/nginx/sites-available/default
# adjust listen port, root directory, index file, server name
        
# Directory of live site for php
# nano /usr/share/nginx/www/info.php
# chmod o+w ./ chmod 777 wp-content -R
