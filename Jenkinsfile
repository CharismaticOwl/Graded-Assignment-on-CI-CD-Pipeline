pipeline{
    agent any
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
                sh 'python test_hello.py'
            }
        }
        stage('run the app'){
            steps{
                sh 'python hello.py'
            }
        }
    }
}