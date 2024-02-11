pipeline{
    agent any
    stages{
        stage('clone the repo'){
            steps{
                checkout scm
            }
        }
        stage('run python code'){
            steps{
                sh 'sudo apt install python -y'
                sh 'python app.py'
            }
        }
    }
}