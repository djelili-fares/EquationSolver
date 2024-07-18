pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'equationsolver'
        GIT_REPO = 'https://github.com/djelili-fares/EquationSolver.git'
        GIT_BRANCH = 'main'
    }

    stages {
        stage('Clone Repository') {
            steps {
                script {
                    echo "Cloning repository..."
                    git branch: "${env.GIT_BRANCH}", url: "${env.GIT_REPO}"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image..."
                    docker.build("${env.DOCKER_IMAGE}")
                }
            }
        }
    }
}
