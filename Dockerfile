FROM nginx:latest
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
DOCKER DEPLOYMENT – COMPLETE CODE

1. HTML FILE (index.html)

<!DOCTYPE html>

<html>
<head>
    <title>My App</title>
</head>
<body>
    <h1>Hello! Docker App Running Successfully</h1>
</body>
</html>

2. DOCKERFILE

FROM nginx:alpine
COPY . /usr/share/nginx/html
EXPOSE 80

3. BUILD DOCKER IMAGE

docker build -t my-html-app .

4. RUN DOCKER CONTAINER

docker run -d -p 30010:80 my-html-app

5. CHECK RUNNING CONTAINER

docker ps

6. APPLICATION LINK http://localhost:30010

pipeline code:
pipeline {
    agent any

    tools {
        maven 'Maven3'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/bellore123/vk19.git'
            }
        }

pipeline code 2:
pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "23mis0449/html-demo"
    }
    stages {
        stage('Clone Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/bellore123/rsd.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %DOCKER_IMAGE%:latest .'
            }

pipeline 3 
pipeline {
    agent any

    stages {
        stage('Clone Code') {
            steps {
                git branch: 'main', url: 'https://github.com/bellore123/rsd.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t 23mis0449/html-demo:latest .'
            }
        }

        stage('Push Image') {
            steps {
                bat 'docker login -u 23mis0449 -p bellore@123'
                bat 'docker push 23mis0449/html-demo:latest'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo 'Deployment completed successfully'
            }
        }

