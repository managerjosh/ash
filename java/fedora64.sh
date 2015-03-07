# Download
# Update
cd
yum install java-1.7.0-openjdk-devel -y

# wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u40-b25/jre-8u40-linux-x64.rpm

# rpm -i jre-8u40-linux-x64.rpm

alternatives --install /usr/bin/java java /opt/jre1.8.0_25/bin/java 1

