pipeline {
    agent any

    environment {
        GITHUB_CREDENTIALS = credentials('github_ubuntu_kenkins_acess')
    }

    stages {
        stage('Checkout') {
            steps {
                // Utiliser les credentials pour cloner le dépôt Git
                git credentialsId: "${env.GITHUB_CREDENTIALS}", branch: 'main', url: 'https://github.com/djelili-fares/EquationSolver.git'
                echo 'Checkout completed.'
            }
        }
        stage('Prepare Dockerfile') {
            steps {
                echo 'Preparing temporary Dockerfile...'
                // Écrire le Dockerfile temporaire
                writeFile file: 'Dockerfile.tmp', text: '''
                    FROM gcc:latest
                    RUN apt-get update && apt-get install -y cmake make dos2unix
                    COPY . /usr/src/myapp
                    WORKDIR /usr/src/myapp
                    RUN dos2unix /usr/src/myapp/rebuild.sh
                    RUN chmod +x /usr/src/myapp/rebuild.sh
                    RUN /bin/bash /usr/src/myapp/rebuild.sh
                '''
            }
        }
        stage('Build and Test') {
            steps {
                echo 'Building and testing the project...'
                // Construire l'image Docker en utilisant le Dockerfile temporaire et exécuter les tests
                sh '''
                    docker build -t equationsolver -f Dockerfile.tmp .
                    docker run equationsolver /bin/bash -c "chmod +x /usr/src/myapp/rebuild.sh && /bin/bash /usr/src/myapp/rebuild.sh"
                '''
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
