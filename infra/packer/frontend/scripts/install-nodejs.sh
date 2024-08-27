#!/bin/bash -e
apt-get update -y
apt-get upgrade -y

apt-get install curl -y

apt-get install nodejs -y
# installs nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
apt-get install build-essential -y
apt-get install npm -y
npm install -g pm2