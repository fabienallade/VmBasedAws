#!/bin/bash -e
apt-get update -y
apt-get upgrade -y

apt-get install curl -y

apt-get install nodejs -y
# installs nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
node -v

cat ~/.bashrc

souce --help
#. $NVM_DIR/nvm.sh
## download and install Node.js (you may need to restart the terminal)
#nvm install 20
## verifies the right Node.js version is in the environment
#
##apt-get install npm -y
#npm install -g pm2

