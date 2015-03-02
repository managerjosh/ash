apt-get install nginx* mysql-server
service nginx start
service nginx restart
/etc/nginx/sites-enabled/
/etc/nginx/sites-available/

Reveal VPS ipaddress
ifconfig eth0 | grep inet | awk '{ print $2 }'

Open up the default virtual host file with this command:
nano /etc/nginx/sites-available/default
adjust listen port, root directory, index file, server name
        
Directory of live site for php
nano /usr/share/nginx/www/info.php
chmod o+w ./ chmod 777 wp-content -R
