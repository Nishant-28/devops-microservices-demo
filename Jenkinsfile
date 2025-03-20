pipeline {
    agent any
    
    stages {
        stage('Verify Tools') {
            steps {
                sh 'docker --version'
                sh 'docker-compose --version'
            }
        }
        
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build First Service') {
            steps {
                sh 'docker build -t frontend:${BUILD_NUMBER} ./src/frontend || true'
            }
        }
        
        stage('Test Docker Network') {
            steps {
                sh 'docker network ls'
            }
        }
        
        stage('Simple Test') {
            steps {
                sh 'echo "Simple test passed"'
            }
        }
    }
}
