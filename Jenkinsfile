pipeline {
    agent any // Utilise n'importe quel agent disponible pour exécuter les étapes de ce pipeline

    // Déclaration des variables d'environnement
    environment {
        DOCKER_CREDENTIALS_ID = 'dockerhub_credentials' // ID des identifiants Docker Hub
        DOCKER_IMAGE_NAME = 'equationsolver' // Nom de l'image Docker
        DOCKER_TAG = 'latest' // Tag de l'image Docker
    }

    // Définition des différentes étapes du pipeline
    stages { 
        // 1st stage  : 'Checkout'
        stage('Checkout') { 
            steps { // Actions à exécuter dans cette étape
                // Cloner le dépôt Git depuis la branche principale
                git branch: 'main', url: 'https://github.com/djelili-fares/EquationSolver.git', credentialsId: 'github_credentials'
                echo 'Checkout completed.' // Affiche un message indiquant que l'étape de checkout est terminée
            }
        }

        // 2nd stage : 'Preparation'
        stage('Preparation') { 
            steps { // Actions à exécuter dans cette étape
                echo 'Repository cloned and ready for build.' // Affiche un message indiquant que le dépôt a été cloné et est prêt pour la construction
            }
        }

        // 3rd stage : 'Build'
        stage('Build') { 
            steps { // Actions à exécuter dans cette étape
                echo 'Starting build process...' 
                sh 'chmod +x rebuild.sh' // Rendre le script rebuild.sh exécutable
                sh './rebuild.sh' // Exécuter le script rebuild.sh pour compiler l'application
            }
        }

        // 4th stage : 'Verify Build'
        stage('Verify Build') { 
            steps { // Actions à exécuter dans cette étape
                echo 'Verifying build...' // Affiche un message indiquant que la vérification de la construction commence
                script { // Utiliser un bloc de script pour effectuer la vérification conditionnelle
                    // Vérifier que les fichiers exécutables existent
                    if (fileExists('build/EquationSolver') && fileExists('build/CApp/CApp') && fileExists('build/CppApp/CppApp')) {
                        echo 'Compilation and build were successful. All executables are present.'
                        echo 'List of executables:' // Affiche un message indiquant que tous les exécutables sont présents
                        sh 'ls -l build/EquationSolver build/CApp/CApp build/CppApp/CppApp' // Lister les exécutables
                    } else {
                        error('Compilation failed or some executables are missing.') // Affiche un message d'erreur si un ou plusieurs exécutables sont manquants
                    }
                }
            }
        }

        // 5th stage : 'Build Docker Image'
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...' // Affiche un message indiquant que la construction de l'image Docker commence
                sh 'docker build -t equationsolver:latest .' // Construire l'image Docker
                echo 'Docker image built successfully.' // Affiche un message indiquant que l'image Docker a été construite avec succès
            }
        }

        // 6th stage : Pussh Docker image into Docker Hub
        stage('Push Docker Image') { 
            steps { // Actions à exécuter dans cette étape
                withDockerRegistry([credentialsId: 'docker_hub_credentials', url: 'https://index.docker.io/v1/']) {
                    echo 'Pushing Docker image...' // Affiche un message indiquant que l'image Docker va être poussée vers Docker Hub
                    sh 'docker push fares7816/equationsolverjenkins:latest' // Pousser l'image Docker vers Docker Hub
                }
            }
        }

    }

    // Actions to do after executions of stages steps
    post { 
        always { // Actions à effectuer à la fin du pipeline, qu'il réussisse ou échoue
            echo 'Pipeline completed.' // Affiche un message indiquant que le pipeline est terminé
        }
        failure { // Actions à effectuer si le pipeline échoue
            echo 'Pipeline failed!' // Affiche un message indiquant que le pipeline a échoué
        }
        success { // Actions à effectuer si le pipeline réussit
            echo 'Pipeline succeeded!' // Affiche un message indiquant que le pipeline a réussi
        }
    }
}
