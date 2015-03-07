rpm --import https://packages.elasticsearch.org/GPG-KEY-elasticsearch
touch  /etc/yum.repos.d/elasticsearch.repo
echo "[elasticsearch-1.4]" >>  /etc/yum.repos.d/elasticsearch.repo
echo "name=Elasticsearch repository for 1.4.x packages" >>  /etc/yum.repos.d/elasticsearch.repo
echo "baseurl=http://packages.elasticsearch.org/elasticsearch/1.4/centos" >>  /etc/yum.repos.d/elasticsearch.repo
echo "gpgcheck=1" >>  /etc/yum.repos.d/elasticsearch.repo
echo "gpgkey=http://packages.elasticsearch.org/GPG-KEY-elasticsearch" >>  /etc/yum.repos.d/elasticsearch.repo
echo "enabled=1" >>  /etc/yum.repos.d/elasticsearch.repo

yum install elasticsearch -y
chkconfig --add elasticsearch
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service
