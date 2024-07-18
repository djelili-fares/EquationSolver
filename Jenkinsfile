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
        stage('Prepare Dockerfile') {
            steps {
                echo 'Preparing temporary Dockerfile...'
                writeFile file: 'Dockerfile.tmp', text: '''
                    FROM gcc:latest
                    RUN apt-get update && apt-get install -y cmake make dos2unix
                    COPY . /usr/src/myapp
                    WORKDIR /usr/src/myapp
                    RUN dos2unix /usr/src/myapp/rebuild.sh
                    RUN chmod +x /usr/src/myapp/rebuild.sh
                    RUN ls -l /usr/src/myapp
                    RUN cat /usr/src/myapp/rebuild.sh
                    RUN /bin/bash /usr/src/myapp/rebuild.sh
                '''
                bat 'type Dockerfile.tmp'
            }
        }
        stage('Build') {
            steps {
                echo 'Building the project...'
                bat 'docker build -t equationsolver -f Dockerfile.tmp .'
            }
        }
        stage('Diagnose Docker Build') {
            steps {
                echo 'Diagnosing Docker build...'
                bat 'docker run equationsolver sh -c "ls -l /usr/src/myapp"'
                bat 'docker run equationsolver sh -c "cat /usr/src/myapp/rebuild.sh || echo rebuild.sh not found"'
            }
        }
        stage('Debug Rebuild') {
            steps {
                echo 'Debugging rebuild.sh execution...'
                bat 'docker run equationsolver sh -c "ls -l /usr/src/myapp/rebuild.sh && file /usr/src/myapp/rebuild.sh && head -n 5 /usr/src/myapp/rebuild.sh"'
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
                bat 'docker build -t equationsolver-test -f Dockerfile.tmp .'
                bat "docker run equationsolver-test /bin/bash -c 'chmod +x /usr/src/myapp/rebuild.sh && /bin/bash /usr/src/myapp/rebuild.sh'"
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
