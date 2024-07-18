# Utiliser une image de base appropriée
FROM gcc:latest

# Installer les dépendances nécessaires
RUN apt-get update && apt-get install -y dos2unix cmake make

# Copier les fichiers de l'application dans le conteneur
COPY . /usr/src/myapp

# Définir le répertoire de travail
WORKDIR /usr/src/myapp

# Vérifier la présence des scripts et afficher le contenu du répertoire
RUN ls -l /usr/src/myapp

# Convertir les fins de ligne des scripts au format Unix
RUN dos2unix /usr/src/myapp/rebuild.sh
RUN dos2unix /usr/src/myapp/run_solver.sh

# Rendre les scripts exécutables
RUN chmod +x /usr/src/myapp/rebuild.sh
RUN chmod +x /usr/src/myapp/run_solver.sh

# Afficher le contenu des scripts pour vérifier qu'ils sont corrects
RUN cat /usr/src/myapp/rebuild.sh
RUN cat /usr/src/myapp/run_solver.sh

# Construire l'application
RUN /bin/bash /usr/src/myapp/rebuild.sh

# Vérifier la présence et les permissions des scripts après la construction
RUN ls -l /usr/src/myapp

# Définir le point d'entrée du conteneur
CMD ["./build/EquationSolver"]
