#!/bin/bash

sudo apt update --fix-missing

sudo apt install git python3 pip nginx gunicorn -y

git clone -b Jenkins https://github.com/CharismaticOwl/Graded-Assignment-on-CI-CD-Pipeline.git

cd Graded-Assignment-on-CI-CD-Pipeline

sudo pip install -r requirements.txt

gunicorn --bind 0.0.0.0:3000 run:app

sudo systemctl enable nginx

sudo systemctl start nginx

cat <<EOT > pythonapp
server {
    listen 80;
    server_name _;
    location / {
        proxy_pass http://127.0.0.1:3000;
    }
}

EOT

mv vproapp /etc/nginx/sites-available/pythonapp
rm -rf /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/pythonapp /etc/nginx/sites-enabled/pythonapp

sudo systemctl restart nginx