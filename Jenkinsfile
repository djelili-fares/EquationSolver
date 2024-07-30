pipeline {
    agent any // Utilise n'importe quel agent disponible pour exécuter les étapes de ce pipeline

    stages { // Définition des différentes étapes du pipeline
        stage('Checkout') { // Première étape : 'Checkout'
            steps { // Actions à exécuter dans cette étape
                // Cloner le dépôt Git depuis la branche principale
                git branch: 'main', url: 'https://github.com/djelili-fares/EquationSolver.git', credentialsId: 'github_credentials'
                echo 'Checkout completed.' // Affiche un message indiquant que l'étape de checkout est terminée
            }
        }
        stage('Preparation') { // Deuxième étape : 'Preparation'
            steps { // Actions à exécuter dans cette étape
                echo 'Repository cloned and ready for build.' // Affiche un message indiquant que le dépôt a été cloné et est prêt pour la construction
            }
        }
        stage('Build') { // Troisième étape : 'Build'
            steps { // Actions à exécuter dans cette étape
                echo 'Starting build process...' 
                sh 'chmod +x rebuild.sh' // Rendre le script rebuild.sh exécutable
                sh './rebuild.sh' // Exécuter le script rebuild.sh pour compiler l'application
            }
        }
        stage('Verify Build') { // Quatrième étape : 'Verify Build'
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
