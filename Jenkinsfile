pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/djelili-fares/EquationSolver.git'
            }
        }
    }

    post {
        always {
            echo 'Checkout completed.'
        }
        failure {
            echo 'Checkout failed!'
        }
    }
}
