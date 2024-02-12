#!/bin/bash

sudo apt update --fix-missing

sudo apt install git python3 pip nginx npm -y

git clone -b Jenkins https://github.com/CharismaticOwl/Graded-Assignment-on-CI-CD-Pipeline.git

cd Graded-Assignment-on-CI-CD-Pipeline

sudo pip install -r requirements.txt

sudo npm install pm2 -g

sudo pm2 start app.py --interpreter=python3

sudo ufw allow 3000

cat << EOT > default
server {
    listen 80;
    listen [::]:80;

    server_name python_app;
        
    location / {
        proxy_pass http://localhost:3000;
    }
}

EOT

sudo rm -rf /etc/nginx/sites-enabled/*

sudo cp default /etc/nginx/sites-enabled/default

sudo systemctl restart nginx