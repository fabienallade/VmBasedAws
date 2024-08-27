# bin/bash
apt-get update -y
#apt-get upgrade -y
#
#apt-get install curl -y
#
#apt-get install nodejs -y
#
##apt-get install npm -y
#npm install -g pm2

# installs nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

# download and install Node.js (you may need to restart the terminal)
nvm install 20

# verifies the right Node.js version is in the environment
node -v # should print `v20.17.0`

# verifies the right npm version is in the environment
npm -v # should print `10.8.2`