pipeline {
agent any
environment{
IMAGE_NAME='yourdockerhubusername/aws-company-website'
IMAGE_TAG='latest'
}
stages{
stage('Checkout'){steps{checkout scm}}
stage('Build'){steps{script{docker.build("${IMAGE_NAME}:${IMAGE_TAG}")}}}
stage('Login'){
steps{
withCredentials([usernamePassword(credentialsId:'dockerhub',usernameVariable:'DOCKER_USER',passwordVariable:'DOCKER_PASS')]){
sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
}}
}
stage('Push'){steps{sh 'docker push ${IMAGE_NAME}:${IMAGE_TAG}'}}
stage('Deploy'){
steps{
sh '''
docker stop aws-website || true
docker rm aws-website || true
docker run -d --name aws-website -p 1435:1435 ${IMAGE_NAME}:${IMAGE_TAG}
'''
}}
}
}
