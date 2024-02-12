#!/bin/bash

sudo apt update --fix-missing

sudo apt install git python3 pip nginx gunicorn -y

git clone -b Jenkins https://github.com/CharismaticOwl/Graded-Assignment-on-CI-CD-Pipeline.git

cd Graded-Assignment-on-CI-CD-Pipeline

sudo pip install -r requirements.txt

sudo apt install gunicorn

gunicorn -b 0.0.0.0:3000 app:app

cat <<EOT > hello.service

[Unit]
Description=simple hello app
After=network.target
[Service]
User=ubuntu
Group=www-data
WorkingDirectory=/Graded-Assignment-on-CI-CD-Pipeline
ExecStart=/Graded-Assignment-on-CI-CD-Pipeline -b localhost:3000 app:app
Restart=always
[Install]
WantedBy=multi-user.target

EOT

sudo mv hello.service /etc/systemd/system/hello.service

sudo systemctl daemon-reload
sudo systemctl start hello
sudo systemctl enable hello

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