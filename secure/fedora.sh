systemctl stop sshd
systemctl stop telnet
systemctl stop netcat
chkconfig --level 0123456 sshd off


yum update -y && yum upgrade -y
