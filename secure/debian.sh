\mv ash-master ash
\echo "Changing root password..."
\/usr/bin/passwd
\unalias -a
\export $PATH=/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/bin:/usr/local/sbin
\chattr -i /etc/passwd
\chattr -i /etc/shadow
\sed -i '1s/.*/root:x:0:0:root:\/root:\/bin\/bash/' /etc/passwd
\chattr -i ~/.bash_profile
\chattr -i ~/.bashrc
\cp ~/.bash_profile ~/.xbash_profile.old
\cp ~/.bashrc ~/.xbashrc.old
\rm -r ~/.bash_profile
\rm -r ~/.bashrc
\touch ~/.bashrc
\source ~/.bashrc
\unalias passwd
\/etc/init.d/cron stop
\update-rc.d cron disable
\/etc/init.d/netcat stop
\update-rc.d/netcat disable
\/etc/init.d/ssh stop
\update-rc.d/ssh disable
\/etc/init.d/telnet stop
\update-rc.d/telnet disable
\/etc/init.d/samba stop
\update-rc.d/samba disable
\apt-get remove netcat* telnet* -y
\cp /etc/security/limits.conf /etc/security/limits.conf.old
\chmod 444 /etc/security/limits.conf.old
\chattr +i /etc/security/limits.conf.old
\rm -r /root/blank*
\touch /root/blank.txt
\cp -r /root/blank.txt /etc/apt/sources.list 
\cp -r /root/blank.txt ~/.bash_profile
\cp -r /root/blank.txt /etc/security/limits.conf
\echo "* hard maxsyslogins 1">> /etc/security/limits.conf
\/bin/busybox echo "* soft maxlogins 1">> /etc/security/limits.conf
\chattr +i /etc/security/limits.conf
\echo "Changing MySQL password...What is the current/old passwd?"
read $oldmysqlpasswd
\echo "Type in New password..."
mysqladmin -u root -p $oldmysqlpasswd password $newmysqlpasswd
\echo "Installing Screen in 2 seconds"
sleep 2
\apt-get install screen -y
\echo "Apply firewall rules, be careful..."
#\bash ash/iptables/rulez



