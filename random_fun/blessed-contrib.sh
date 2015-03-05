cd
git clone https://github.com/yaronn/blessed-contrib.git
mkdir /etc/blessed-contrib
cp -r blessed-contrib/* /etc/blessed-contrib
apt-get install node npm -y
yum install node npm -y
pacman -S nodejs -y
npm install
echo "node /etc/blessed-contrib/examples/dashboard.js" >> ~/.bash_profile

node /etc/blessed-contrib/examples/dashboard.js

