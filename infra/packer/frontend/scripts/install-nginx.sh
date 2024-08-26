# bin/bash

apt install nginx -y

sudo systemctl restart nginx
sudo systemctl status nginx

pm2 startup systemd
