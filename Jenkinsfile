pipeline {
    agent {
        docker {
            image 'docker:dind'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Images') {
            steps {
                sh 'docker build - t frontend:${BUILD_NUMBER} ./src/frontend'
                sh 'docker build - t productcatalog:${BUILD_NUMBER} ./src/productcatalogservice'
                sh 'docker build - t currencyservice:${BUILD_NUMBER} ./src/currencyservice'
                sh 'docker build - t cartservice:${BUILD_NUMBER} ./src/cartservice/src'
            }
        }
        
        stage('Run Tests') {
            steps {
                sh '''
                cd src/frontend
                docker run --rm frontend:${BUILD_NUMBER} go test ./...
                '''
            }
        }

        stage('Start Application') {
            steps {
                sh 'docker-compose up -d'
                sh 'sleep 60'
            }
        }

        stage('Integration Test') {
            steps {
                sh 'curl -f http://localhost:8080 || exit 1'
            }
        }

        stage('Cleanup') {
            steps {
                sh 'docker-compose down'
            }
        }
    }
}