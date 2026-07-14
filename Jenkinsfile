pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -t aws-website .'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                docker stop aws-website || true
                docker rm aws-website || true
                docker run -d --name aws-website -p 1432:80 aws-website
                '''
            }
        }
    }
}
