# bin/bash

apt-get install nginx -y

systemctl restart nginx
systemctl status nginx
systemctl reload nginx

pm2 startup systemd
