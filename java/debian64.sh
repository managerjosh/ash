# Download
# Update
cd
echo "deb http://http.debian.net/debian/ wheezy main contrib" >> /etc/apt/sources.ist
apt-get update && apt-get upgrade && apt-get install java-package

rm -r jre-8u40-linux-x64.tar.*

wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u40-b25/jre-8u40-linux-x64.tar.gz

fakeroot make-jpkg jre-8u40-linux-x64.tar.gz
# sudo dpkg -i oracle-j2re1.7_1.7.0+update51_amd64.deb


# update-alternatives --auto java

# bash ash/elastic_search/apt.sh

# mkdir /data
# mkdir /data/logs
# mkdir /data/data
# chown -R elasticsearch:elasticsearch /data/logs
# chown -R elasticsearch:elasticsearch /data/data
# chmod -R ug+rw /data/logs
# chmod -R ug+rw /data/data
