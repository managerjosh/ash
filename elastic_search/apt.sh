wget -qO - https://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -

echo 'deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main' >> /etc/apt/sources.list

apt-get update && apt-get install elasticsearch

update-rc.d elasticsearch defaults 95 10


sed 53 
sudo vi /etc/pam.d/su
Uncomment pam_limits.so
