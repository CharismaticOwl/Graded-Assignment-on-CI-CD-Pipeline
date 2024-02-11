pipeline{
    agent any
    environment {
        AWS_DEFAULT_REGION = 'ap-south-1'
    }
    stages{
        stage('clone the repo'){
            steps{
                git branch: 'Jenkins',
                    url: 'https://github.com/CharismaticOwl/Graded-Assignment-on-CI-CD-Pipeline.git'
            }
        }
        stage('get the requirements installed'){
            steps{
                sh 'pip install -r requirements.txt'
            }
        }
        stage('test the python script'){
            steps{
                sh 'python3 test_hello.py'
            }
        }
        stage('Deploy'){
            steps{
                script {
                    def instanceDetails = sh(script: '''aws ec2 run-instances \
                            --image-id ami-03f4878755434977f \
                            --instance-type t2.micro \
                            --key-name ec2 \
                            --security-group-ids sg-09e0c5dd41f4bd5b9 \
                            --subnet-id subnet-076051ff9276a558d \
                            --query 'Instances[0].[InstanceId,PublicIpAddress]' \
                            --output text
                    ''', returnStdout: true().trim().split()

                    def instanceId = instanceDetails[0]
                    def publicIpAddress = instanceDetails[1]

                    echo "EC2 instance launched with ID: $instanceId"
                    echo "Public IP Address: $publicIpAddress"
                }
            }
        }
    }
}