cd
cp -r ash/network_interface/interfaces /etc/network/interfaces

/etc/init.d/networking restart
ip link set eth0 up
