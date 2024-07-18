pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Cloner le dépôt Git depuis la branche principale
                git branch: 'main', url: 'https://github.com/djelili-fares/EquationSolver.git'
                echo 'Checkout completed.'
                // Afficher les fichiers du répertoire de travail
                bat 'dir'
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
        stage('Build') {
            steps {
                echo 'Building the project...'
                // Construire l'image Docker en utilisant le Dockerfile temporaire
                bat 'docker build -t equationsolver -f Dockerfile.tmp .'
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
                // Exécuter les tests dans un conteneur Docker basé sur l'image construite
                bat 'docker run equationsolver /bin/bash -c "chmod +x /usr/src/myapp/rebuild.sh && /bin/bash /usr/src/myapp/rebuild.sh"'
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
