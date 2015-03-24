wget http://download.adiscon.com/loganalyzer/loganalyzer-3.6.6.tar.gz
tar -xzf loganalyzer-3.6.6.tar.gz
mv loganalyzer-3.6.6/src/ /var/www/html/loganalyzer
mv loganalyzer-3.6.6/contrib/* /var/www/html/loganalyzer/
cd /var/www/html/loganalyzer/
chmod +x configure.sh secure.sh
./configure.sh
