# bin/bash

apt-get update -y
apt-get upgrade -y

curl-o-https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash source ~/.bashrc

nvm install v10.24.1 -y

nvm install node -y

npm install -g pm2
