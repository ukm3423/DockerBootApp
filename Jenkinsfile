pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials-id'
        GITHUB_CREDENTIALS_ID = 'github-credentials-id'
        DOCKER_IMAGE = 'umeshkumarchamp/dockerbootapp'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: "${GITHUB_CREDENTIALS_ID}", url: 'https://github.com/ukm3423/DockerBootApp.git'
            }
        }
        stage('Build') {
            steps {
                sh './mvn clean install'
            }
        }
        stage('Test') {
            steps {
                sh './mvn test'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:latest")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_CREDENTIALS_ID}") {
                        docker.image("${DOCKER_IMAGE}:latest").push()
                    }
                }
            }
        }
    }
}
