pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/djelili-fares/EquationSolver.git'
                echo 'Checkout completed.'
                sh 'ls -l' // Lister les fichiers dans le répertoire de travail
                sh 'cat Jenkinsfile' // Afficher le contenu du Jenkinsfile pour vérifier
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed.'
        }
        failure {
            echo 'Checkout failed!'
        }
        success {
            echo 'Checkout succeeded!'
        }
    }
}
