# Download
# Update
apt-get install java-package
wget http://download.oracle.com/otn-pub/java/jdk/7u51-b13/jre-7u51-linux-x64.tar.gz?AuthParam=1391313765_3cdad81c5f3af7b5ef5ce047211e4c2d -O jre-7u51-linux-x64.tar.gz
make-jpkg jre-7u51-linux-x64.tar.gz
sudo dpkg -i oracle-j2re1.7_1.7.0+update51_amd64.deb
sudo update-alternatives --auto java

wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.10.deb
sudo dpkg -i elasticsearch-0.90.10.deb
sudo mkdir /data
sudo mkdir /data/logs
sudo mkdir /data/data
sudo chown -R elasticsearch:elasticsearch /data/logs
sudo chown -R elasticsearch:elasticsearch /data/data
sudo chmod -R ug+rw /data/logs
sudo chmod -R ug+rw /data/data
