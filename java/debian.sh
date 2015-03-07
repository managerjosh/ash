# Download
# Update
cd
apt-get install java-package

wget http://download.oracle.com/otn-pub/java/jdk/8u40-b25/jdk-8u40-linux-i586.rpm?AuthParam=1391313765_3cdad81c5f3af7b5ef5ce047211e4c2d -O java.rpm
rpm -i java.rpm
sudo update-alternatives --auto java

bash apt/elastic_search/apt.sh

sudo mkdir /data
sudo mkdir /data/logs
sudo mkdir /data/data
sudo chown -R elasticsearch:elasticsearch /data/logs
sudo chown -R elasticsearch:elasticsearch /data/data
sudo chmod -R ug+rw /data/logs
sudo chmod -R ug+rw /data/data
