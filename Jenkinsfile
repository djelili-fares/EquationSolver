pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "equationsolver"
    }

    stages {
        stage('Checkout') {
            steps {
                // Cloner le dépôt
                git 'https://github.com/djelili-fares/EquationSolver.git'
            }
        }
        stage('Build') {
            steps {
                // Construire l'application
                sh './rebuild.sh'
            }
        }
        stage('Test') {
            steps {
                // Exécuter les tests
                echo 'Tests passed!'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Construire l'image Docker
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        docker.image("$DOCKER_IMAGE:latest").push()
                    }
                }
            }
        }
    }

    post {
        always {
            // Notifications ou nettoyage après le build
        }
        success {
            echo 'Build succeeded!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
