yum install wget
wget http://swupdate.openvpn.org/as/openvpn-as-2.0.12-CentOS7.x86_64.rpm
rpm -i openvpn-as-2.0.12-CentOS7.x86_64.rpm
echo "Set password for user: openvpn"
passwd openvpn
