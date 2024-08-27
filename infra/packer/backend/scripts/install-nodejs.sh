#!/bin/bash -e
apt-get update -y
#apt-get upgrade -y

#apt-get install curl -y

apt-get install nodejs -y
apt-get install build-essential -y
apt-get install npm -y
npm -v
npm -v
npm install -g pm2