# bin/bash
apt-get update -y
apt-get upgrade -y

apt-get install curl -y
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.bashrc

nvm install --lts

nvm install node -y

npm install -g pm2
