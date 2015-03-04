# bash installed? good now execute this bitch!
echo "Change the root password"
passwd root
service cron stop
service sshd stop

echo "Change the /etc/rc.conf file and disable sshd"
