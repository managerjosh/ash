# https://wiki.ubuntu.com/vlan
apt-get install vlan
modprobe 8021q
vconfig add eth1 10
ip addr add 10.0.0.1/24 dev eth1.10
su -c 'echo "8021q" >> /etc/modules'

# auto eth1.10
# iface eth1.10 inet static
#     address 10.0.0.1
#     netmask 255.255.255.0
#     vlan-raw-device eth1
