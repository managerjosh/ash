# 3.3.1  - old
wget https://en-ca.wordpress.org/wordpress-3.3.1-en_CA.tar.gz

tar -xzf wordpress-3.3.1-en_CA.tar.gz

cp -r wordpress/* /var/www/html

# edit wpconfig-sample.php file
# add db information

# On mysql server:
# create database wordpress;
# create uesr wpuser@localhost identified by 'password';
# grant all privileges on wordpress.* to wpuser@localhost;
# flush privileges

