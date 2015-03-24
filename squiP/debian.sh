

apt-get install build-eseential libssl-dev -y && apt-get install build-dep squid3 -y
wget http://da.gd/dibk
mv dibk dibk.tar.gz
tar -xzf dibk.tar.gz
cd squid-3.5.2

./configure \
--prefix=/opt/squid \
--with-default-user=squid  \
--enable-auth \
--enable-icap-client \
--enable-ssl \
--enable-ssl-crtd \
--enable-loadable-modules \
--enable-removal-policies="lru heap" \
--enable-auth-digest="file" \
--enable-log-daemon-helpers="file" \
--enable-url-rewrite-helpers  \
--enable-linux-netfilter  \
--enable-linux-tproxy \
--enable-large-cache-files \
--disable-ident-lookups \
--disable-auth-ntlm \
--disable-translation \
--disable-cache-digests \
--with-openssl \
--disable-snmp \
--with-large-file
make && make install
