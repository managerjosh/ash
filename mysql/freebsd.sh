# http://www.freebsdmadeeasy.com/tutorials/web-server/install-mysql-server-on-freebsd.php
# note mysql55 not working
cd /usr/ports/databases/mysql51-server
make

cd /usr/ports/databases/mysql51-client
make

# The standard port installation places the server into /usr/local/libexec/mysqld, with the startup script for the MySQL server placed in /usr/local/etc/rc.d/mysql-server.

#Some additional notes on the BSD implementation:

# To remove MySQL after installation using the ports system:

# cd /usr/ports/databases/mysql51-server
# make deinstall

# cd /usr/ports/databases/mysql51-client
# make deinstall

sh /usr/local/etc/rc.d/mysql-server.sh start

sed -i '3s/.*/sshd_enable="NO"/' /etc/rc.conf
