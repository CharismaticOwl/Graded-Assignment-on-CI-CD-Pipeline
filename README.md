# Graded-Assignment-on-CI-CD-Pipeline
Graded-Assignment-on-CI-CD-Pipeline

--------------

Created a Security group, which allos all traffic from myIP, and also 8080 everywhere, as I will be using github webhooks to trigger pipeline

Install Jenkins and other apps required for this assignment in an EC2

Userdata for creating a Jenkins Server
'''
#!/bin/bash
sudo apt update --fix-missing
sudo apt install awscli git python3  pip -y
sudo apt update
sudo apt install fontconfig openjdk-17-jdk -y
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y
'''
-----------------------

Once the Jenkins it up, use the public IP to start using the Jenkins Server

Also ssh to the Jenkins Server to get the password

'''
ssh -i "C:/Users/S896998/OneDrive - Veradigm Corporate/Desktop/ec2.pem"  ubuntu@13.200.12.244

sudo cat /var/lib/jenkins/secrets/initialAdminPassword
'''

Copy paste the the temporary password, and then continue to login

Install Plugins

'''
git
AWS Credentials
AWS Pipeline steps
'''

Once the installation is done, add the aws credentials to the Jenkins

'''
Manage Jenkins > Credentials > system > add Credentials

Select AWS Credentials in the kind

Add the access key and the pass key

The application will verify if the credentials are correct and how many Az's are available with the new credentials
'''
---------------------------
Created the app.py - a simple Helo world flask application

It runs on port 3000

'''
http://127.0.0.1
http://localhost:3000
'''

----------------------------

Created requirements.txt file with dependencies

'''
Flask
pytest

'''

-------------------------------

Created test file for the flask application

Expected results are status_code 200 and also a data with hello,world

----------------------------

Created a Jenkins File

'''
Stage - Fetch the code

Stage - install the requirements

Stage - Run the test cases

Stage - Deploy to EC2

Using withAWS - passing the crendentials and also the region where you want to run the deployment

Userdata for the Ec2 is stored in a seperate file
'''

-------------------------------

Created a Jenkins Pipeline

Build Trigger  - Git hub webhooks is selected

Also the Groovy code is fetched from Git, and the branch is selected and also the Jenkins file name is defined

-----------------------------

Logged into Git repo

Settings > Github Webhooks

added the public address here

'''
http://ec2_public_address:8080/github-webhook/
'''

--------------------------------

User data for the ec2 Instance

'''
#!/bin/bash

sudo apt update --fix-missing

sudo apt install git python3 pip nginx npm -y

git clone -b Jenkins https://github.com/CharismaticOwl/Graded-Assignment-on-CI-CD-Pipeline.git

cd Graded-Assignment-on-CI-CD-Pipeline

sudo pip install -r requirements.txt

sudo npm install pm2 -g

sudo pm2 start app.py --interpreter=python3

sudo ufw allow 3000

touch default

cat  > default << EOT
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

'''

------------------------------------------------

Upon Push event the build tiggered automatically, and completed all the stages and deployed the application on Ec2

Screenshots attached.