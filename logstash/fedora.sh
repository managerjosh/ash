# 1. install java - ash/java/fedora.sh 
# 2. install elasticsearch - ash/java/yum.sh
# 3. install redis - ash/redis/fedora.sh
# 4. install logstash - ash/logstash/fedora.sh
# 5. install kibana

wget https://download.elasticsearch.org/logstash/logstash/packages/centos/logstash-1.4.2-1_2c0f5a1.noarch.rpm
rpm -i logstash-1.4.2-1_2c0f5a1.noarch.rpm

wget https://download.elasticsearch.org/logstash/logstash/packages/centos/logstash-contrib-1.4.2-1_efd53ef.noarch.rpm
rpm -i logstash-contrib-1.4.2-1_efd53ef.noarch.rpm

cp -r ash/logstash/logstash.conf /etc/logstash/logstash.conf
cp -r ash/logstash/logstash-index /etc/logstash/logstash-index.conf
cp -r ash/logstash/logstash /etc/init.d/logstash
cp -r ash/logstash/logstash-index /etc/init.d/logstash-index


sudo chmod +x /etc/init.d/logstash
sudo chmod +x /etc/init.d/logstash-index

systemctl logstash-index start
systemctl logstash start
chkconfig logstash on
