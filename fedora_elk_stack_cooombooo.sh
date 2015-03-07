# http://www.ragingcomputer.com/2014/02/removing-old-records-for-logstash-elasticsearch-kibana
# 1. install java - 					ash/java/fedora.sh 
# 2. install elasticsearch - 				ash/elastic_search/yum.sh
# 3. install redis - 					ash/redis/fedora.sh
# 4. install logstash - 				ash/logstash/fedora.sh
# 5. install apache2/nginx -  ash/nginx/fedora.sh
# 6. install kibana - 					ash/kibana/kibana.sh
# 7. install apache2-utils/htpasswd 
# 8. bind redis to localhost
# 9. bind elasticsearch to localhost
# 10. config kibana to use nginx
# 11. install nxlog, start service
# 12. create scheduled task to clear logs

bash ash/nginx/fedora.sh
bash ash/java/fedora.sh
bash ash/redis/fedora.sh
bash ash/logstash/fedora.sh
bash ash/elastic_search/yum.sh
bash ash/apache/fedora.sh
bash ash/kibana/fedora.sh
# bash ash/nxlog/fedora.sh

systemctl stop httpd
systemctl disable httpd

echo "Starting KIBANA IN: /var/www/bin/kibana in 5 seconds..."
sleep 5
systemctl restart elasticsearch
systemctl restart nginx
systemctl restart redis
systemctl restart logstash
/var/www/bin/kibana

# port 5601; 80
