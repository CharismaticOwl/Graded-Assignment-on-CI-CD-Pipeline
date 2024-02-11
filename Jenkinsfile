pipeline{
    agent any
    stages{
        stage('clone the repo'){
            steps{
                git branch: 'Jenkins',
                    url: 'https://github.com/CharismaticOwl/Graded-Assignment-on-CI-CD-Pipeline.git'
            }
        }
        stage('run python code'){
            steps{
                sh 'python app.py'
            }
        }
    }
}