pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Cloner le dépôt Git depuis la branche principale
                git branch: 'main', url: 'https://github.com/djelili-fares/EquationSolver.git', credentialsId: 'github_credentials'
                echo 'Checkout completed.'
            }
        }
        stage('Preparation') {
            steps {
                echo 'Repository cloned and ready for build.'
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
