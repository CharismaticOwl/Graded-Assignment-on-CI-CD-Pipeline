#!/bin/bash

sudo apt update --fix-missing

sudo apt install git python3 pip nginx gunicorn -y

git clone -b Jenkins https://github.com/CharismaticOwl/Graded-Assignment-on-CI-CD-Pipeline.git

cd Graded-Assignment-on-CI-CD-Pipeline

sudo pip install -r requirements.txt
