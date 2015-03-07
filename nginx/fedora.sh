# touch /etc/yum.repos.d/nginx.repo
# echo "[nginx]" >> /etc/yum.repos.d/nginx.repo
# echo "name=nginx repo" >> /etc/yum.repos.d/nginx.repo
# echo "baseurl=http://nginx.org/packages/rhel/$releasever/$basearch/" >> /etc/yum.repos.d/nginx.repo
# echo "gpgcheck=0" >> /etc/yum.repos.d/nginx.repo
# echo "enabled=1" >> /etc/yum.repos.d/nginx.repo


yum install nginx
# mkdir /etc/nginx/ssl
# cd /etc/nginx/ssl
# openssl genrsa -des3 -out server.key 1024
# echo "GENERATING KEYS!!!"
# echo "GENERATING KEYS!!!"
# openssl req -new -key server.key -out server.csr
# echo "GENERATING KEYS!!!"
# echo "GENERATING KEYS!!!"
# cp server.key server.key.org
# echo "GENERATING KEYS!!!"
# echo "GENERATING KEYS!!!"
# openssl rsa -in server.key.org -out server.key
# openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt


# mkdir -p /srv/www/testsite.local/public_html
# mkdir -p /var/log/nginx/testsite.local
# chown -R apache:apache /srv/www/testsite.local
# chown -R nginx:nginx /var/log/nginx
# mkdir /etc/nginx/sites-available
# mkdir /etc/nginx/sites-enabled

echo "include /etc/nginx/sites-enabled/*;" >>  /etc/nginx/nginx.conf

cp -r ash/nginx/sites-available/logcatcher /etc/nginx/sites-available/logcatcher
 
sudo rm /etc/nginx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/logcatcher /etc/nginx/sites-enabled/logcatcher

# systemctl stop httpd.service
# systemctl disable httpd.service
# chkconfig httpd off

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
