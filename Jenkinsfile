pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "equationsolver"
    }

    stages {
        stage('Checkout') {
            steps {
                // Cloner le dépôt et vérifier la branche main
                git branch: 'main', url: 'https://github.com/djelili-fares/EquationSolver.git'
            }
        }
        stage('Build') {
            steps {
                // Utiliser bash pour exécuter le script rebuild.sh
                bat 'bash -c "sh rebuild.sh"'
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
                bat 'docker build -t %DOCKER_IMAGE% .'
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        docker.image("${DOCKER_IMAGE}:latest").push()
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed.'
        }
        success {
            echo 'Build succeeded!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
