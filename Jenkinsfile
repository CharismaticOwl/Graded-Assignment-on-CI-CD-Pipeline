pipeline{
    agent any
    stages{
        stage('clone the repo'){
            steps{
                git branch: 'Jenkins',
                    url: 'https://github.com/CharismaticOwl/Graded-Assignment-on-CI-CD-Pipeline.git'
            }
        }
        // stage('run python code'){
        //     steps{
        //         sh 'sudo apt install python -y'
        //         sh 'python app.py'
        //     }
        // }
    }
}