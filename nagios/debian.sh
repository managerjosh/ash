# https://www.howtoforge.com/installing-nagios-on-debian-lenny-and-monitoring-a-debian-lenny-server
# monitor:~# apt-get install nagios3 nagios-plugins nagios-nrpe-plugin
# server1:~# apt-get install nagios-nrpe-server nagios-plugins
\apt-get install nagios-nrpe-server nagios3 nagios-plugins nagios-nrpe-plugin -y
echo "changing password for nagiosadmin"
htpasswd -c /etc/nagios3/htpasswd.users nagiosadmin


# http://assets.nagios.com/downloads/nagiosxi/docs/Offloading_MySQL_to_Remote%20Server.pdf
