# Download
# Update
cd
apt-get install java-package

wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u40-b25/jre-8u40-linux-x64.rpm

rpm -i jre-8u40-linux-x64.rpm

update-alternatives --auto java

bash ash/elastic_search/apt.sh

mkdir /data
mkdir /data/logs
mkdir /data/data
chown -R elasticsearch:elasticsearch /data/logs
chown -R elasticsearch:elasticsearch /data/data
chmod -R ug+rw /data/logs
chmod -R ug+rw /data/data
