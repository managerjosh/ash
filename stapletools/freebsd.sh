# cd /usr/ports/ftp/wget
# make install clean
# rehash
# wget https://github.com/appvise/ash.git
# cd /usr/ports/devel/git
# make install

pkg install bash
chsh -s /usr/local/bin/bash root
grep root /etc/passwd

echo /usr/local/bin/bash >> /etc/shells

# UPDATE
portsnap fetch update



