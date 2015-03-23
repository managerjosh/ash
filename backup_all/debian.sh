# backup mysql db
# syntax: 
# mysqldump -u [username] -p[password] -h [host] --all-databases > [backup].sql

echo "Backing up all mysql"
cd 
date=$(date)
mysqldump -u root -p -h localhost --all-databases > $date-mysqlFullBackup.sql
echo "Backed up mysql db"

# restore mysql db
# log into sql
# create database with same name
# quit
# mysql -u [username] -p[password] -h [host] [databaseName] < [filename].sql
cd 
tar cf etc.tar /etc/ && tar cf home.tar /home/ && tar cf var.tar /var/www /var/spool /var/mail /var/log
echo "Backed up /etc/ /home/ /var/-www,spool,log"

history | less > console_history_saved.txt
echo "Backed up console history"
# OR
# tar cf system.tar /etc/ /home/ /var/ /bin/ /boot/ /proc/ /dev/ /sys/
# Unzip: 
# tar –C /_directory_ -xvf _tarfile_.tar
