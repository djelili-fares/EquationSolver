pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/djelili-fares/EquationSolver.git'
                echo 'Checkout completed.'
                bat 'dir' // Lister les fichiers dans le répertoire de travail
                bat 'type Jenkinsfile' // Afficher le contenu du Jenkinsfile pour vérifier
            }
        }
        stage('Build') {
            steps {
                echo 'Building the project...'
                bat '''
                    docker build -t equationsolver -f- . <<EOF
                    FROM gcc:latest
                    RUN apt-get update && apt-get install -y cmake make
                    COPY . /usr/src/myapp
                    WORKDIR /usr/src/myapp
                    RUN chmod +x rebuild.sh
                    RUN ls -l /usr/src/myapp
                    RUN cat /usr/src/myapp/rebuild.sh
                    RUN ./rebuild.sh
                    EOF
                '''
            }
        }
        stage('Diagnose Docker Build') {
            steps {
                echo 'Diagnosing Docker build...'
                bat 'docker run equationsolver sh -c "ls -l /usr/src/myapp"'
                bat 'docker run equationsolver sh -c "cat /usr/src/myapp/rebuild.sh || echo rebuild.sh not found"'
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
                script {
                    def imageId = sh(script: "docker build -t equationsolver .", returnStdout: true).trim()
                    sh "docker run equationsolver sh -c 'chmod +x /usr/src/myapp/rebuild.sh && ./rebuild.sh'"
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed.'
        }
        failure {
            echo 'Pipeline failed!'
        }
        success {
            echo 'Pipeline succeeded!'
        }
    }
}
