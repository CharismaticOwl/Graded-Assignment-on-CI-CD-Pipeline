#!/bin/bash

sudo apt update --fix-missing

sudo apt install git python3 pip nginx npm -y

git clone -b Jenkins https://github.com/CharismaticOwl/Graded-Assignment-on-CI-CD-Pipeline.git

cd Graded-Assignment-on-CI-CD-Pipeline

sudo pip install -r requirements.txt

sudo npm install pm2 -g

sudo pm2 start app.py --interpreter=python3

sudo ufw allow 3000