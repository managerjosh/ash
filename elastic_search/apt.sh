wget -qO - https://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -

echo 'sudo add-apt-repository "deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main"' >> /etc/apt/sources.list

sudo apt-get update && sudo apt-get install elasticsearch

sudo update-rc.d elasticsearch defaults 95 10
