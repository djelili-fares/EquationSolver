pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "equationsolver"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/djelili-fares/EquationSolver.git'
            }
        }

        stage('Build') {
            steps {
                script {
                    def fileExists = bat(script: 'if exist rebuild.sh (echo true) else (echo false)', returnStdout: true).trim()
                    if (fileExists == 'false') {
                        error("rebuild.sh does not exist")
                    }
                    def permissions = bat(script: 'icacls rebuild.sh', returnStdout: true).trim()
                    echo "Permissions for rebuild.sh: ${permissions}"
                }
                bat 'docker build -t equationsolver .'
            }
        }

        stage('Test') {
            steps {
                script {
                    docker.image("${DOCKER_IMAGE}").inside {
                        sh './build/EquationSolver'
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t ${DOCKER_IMAGE} .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withDockerRegistry(credentialsId: 'dockerhub', url: '') {
                    bat 'docker push ${DOCKER_IMAGE}'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed.'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
