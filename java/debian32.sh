# Download
# Update
cd
apt-get install java-package

wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u40-b25/jre-8u40-linux-i586.tar.gz

make-jpkg jre-8u40-linux-i586.tar.gz

#dpkg -i oracle-j2re1.7_1.7.0+update51_amd64.deb


#update-alternatives --auto java

#bash ash/elastic_search/apt.sh

#mkdir /data
#mkdir /data/logs
#mkdir /data/data
#chown -R elasticsearch:elasticsearch /data/logs
#chown -R elasticsearch:elasticsearch /data/data
#chmod -R ug+rw /data/logs
#chmod -R ug+rw /data/data
