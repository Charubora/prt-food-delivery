pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "prt-food-delivery"
        DOCKER_TAG = "latest"
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Charubora/prt-food-delivery.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .'
            }
        }
        stage('Run Docker Container') {
            steps {
                sh 'docker stop food-app || true'
                sh 'docker rm food-app || true'
                sh 'docker run -d --name food-app -p 5000:5000 ${DOCKER_IMAGE}:${DOCKER_TAG}'
            }
        }
        stage('Verify') {
            steps {
                sh 'sleep 3'
                sh 'curl -s http://localhost:5000'
            }
        }
    }
    post {
        success {
            echo 'PRT - Food Delivery App Deployment Successful'
        }
    }
}
