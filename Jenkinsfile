pipeline {
    agent any // Définir l'agent pour exécuter le pipeline sur n'importe quel nœud disponible

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/djelili-fares/EquationSolver.git'
                // Cloner le dépôt Git spécifié à partir de la branche principale
                echo 'Checkout completed.'
                bat 'dir' // Lister les fichiers dans le répertoire de travail
                bat 'type Jenkinsfile' // Afficher le contenu du Jenkinsfile pour vérifier qu'il est correct
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
                // Créer un Dockerfile temporaire pour construire l'application
                bat 'type Dockerfile.tmp' // Afficher le contenu du Dockerfile temporaire pour vérification
            }
        }
        stage('Build') {
            steps {
                echo 'Building the project...'
                bat 'docker build -t equationsolver -f Dockerfile.tmp .'
                // Construire l'image Docker en utilisant le Dockerfile temporaire
            }
        }
        stage('Diagnose Docker Build') {
            steps {
                echo 'Diagnosing Docker build...'
                bat 'docker run equationsolver sh -c "ls -l /usr/src/myapp"'
                // Lister les fichiers dans le répertoire de l'application dans le conteneur Docker
                bat 'docker run equationsolver sh -c "cat /usr/src/myapp/rebuild.sh || echo rebuild.sh not found"'
                // Afficher le contenu du script rebuild.sh ou indiquer s'il n'est pas trouvé
            }
        }
        stage('Debug Rebuild') {
            steps {
                echo 'Debugging rebuild.sh execution...'
                bat 'docker run equationsolver sh -c "ls -l /usr/src/myapp/rebuild.sh && file /usr/src/myapp/rebuild.sh && head -n 5 /usr/src/myapp/rebuild.sh"'
                // Lister le script rebuild.sh, afficher ses métadonnées et les 5 premières lignes pour le débogage
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
                bat 'docker build -t equationsolver-test -f Dockerfile.tmp .'
                // Construire une nouvelle image Docker pour les tests
                bat 'docker run equationsolver-test /bin/bash -c "chmod +x /usr/src/myapp/rebuild.sh && /bin/bash /usr/src/myapp/rebuild.sh"'
                // Exécuter le script rebuild.sh dans le conteneur de test
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed.' // Toujours afficher ce message à la fin du pipeline
        }
        failure {
            echo 'Pipeline failed!' // Afficher ce message si le pipeline échoue
        }
        success {
            echo 'Pipeline succeeded!' // Afficher ce message si le pipeline réussit
        }
    }
}
