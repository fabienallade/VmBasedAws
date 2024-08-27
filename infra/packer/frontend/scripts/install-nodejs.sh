# bin/bash
apt-get update -y
apt-get upgrade -y

apt-get install curl -y
curl-o-https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
source ~/.bashrc

nvm install --lts

nvm install node -y

npm install -g pm2
