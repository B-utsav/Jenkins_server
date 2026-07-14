pipeline {
agent any
parameters{
string(name:'DOCKERHUB_USERNAME', defaultValue:'yourdockerhubusername', description:'DockerHub username/org to push the image to')
}
environment{
IMAGE_NAME="${params.DOCKERHUB_USERNAME}/aws-company-website"
IMAGE_TAG="${env.BUILD_NUMBER}"
}
stages{
stage('Checkout'){steps{checkout scm}}
stage('Build'){steps{script{
docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
docker.build("${IMAGE_NAME}:latest")
}}}
stage('Login'){
steps{
withCredentials([usernamePassword(credentialsId:'dockerhub',usernameVariable:'DOCKER_USER',passwordVariable:'DOCKER_PASS')]){
sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
}}
}
stage('Push'){steps{
sh 'docker push ${IMAGE_NAME}:${IMAGE_TAG}'
sh 'docker push ${IMAGE_NAME}:latest'
}}
stage('Deploy'){
steps{
sh '''
docker stop aws-website || true
docker rm aws-website || true
docker run -d --name aws-website -p 1435:1435 ${IMAGE_NAME}:${IMAGE_TAG}
'''
}}
}
post{
always{
sh 'docker logout || true'
}
}
}
