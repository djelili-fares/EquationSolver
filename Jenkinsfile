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
                bat 'docker build -t equationsolver .'
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
                bat 'docker run equationsolver ./build/EquationSolver'
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
