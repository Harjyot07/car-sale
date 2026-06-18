pipeline {
    agent any

    environment {
        IMAGE_NAME = "car-sale-site"
        CONTAINER_NAME = "car-sale-container"
        PORT = "8080"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/your-username/car-sale-site.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh """
                docker build -t $IMAGE_NAME .
                """
            }
        }

        stage('Stop Old Container') {
            steps {
                sh """
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true
                """
            }
        }

        stage('Run New Container') {
            steps {
                sh """
                docker run -d --name $CONTAINER_NAME -p $PORT:80 $IMAGE_NAME
                """
            }
        }

    }

    post {
        success {
            echo "🚀 Deployment Successful!"
        }

        failure {
            echo "❌ Deployment Failed!"
        }
    }
}
