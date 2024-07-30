pipeline {
    agent any // Utilise n'importe quel agent disponible pour exécuter les étapes de ce pipeline

    stages { // Définition des différentes étapes du pipeline
        stage('Checkout') { // Première étape : 'Checkout'
            steps { // Actions à exécuter dans cette étape
                // Cloner le dépôt Git depuis la branche principale
                git branch: 'main', url: 'https://github.com/djelili-fares/EquationSolver.git', credentialsId: 'github_credentials'
                // Commande Git pour cloner le dépôt spécifié depuis la branche 'main'
                // Utilise les identifiants configurés avec l'ID 'github_credentials'
                echo 'Checkout completed.' // Affiche un message indiquant que l'étape de checkout est terminée
            }
        }
        stage('Preparation') { // Deuxième étape : 'Preparation'
            steps { // Actions à exécuter dans cette étape
                echo 'Repository cloned and ready for build.' // Affiche un message indiquant que le dépôt a été cloné et est prêt pour la construction
            }
        }

        stage('Build') { // Troisième étape : 'Compilation de l'application'
            steps { // La compilation se fait en exécutant simplement le fichier rebuild.sh :
                echo 'Starting build process...' 
                sh 'chmod +x rebuild.sh'
                sh './rebuild.sh'
            }
        }

    }

    post { // Actions à effectuer après l'exécution des étapes définies dans 'stages'
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
