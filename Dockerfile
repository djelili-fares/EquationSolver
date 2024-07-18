# Utiliser une image de base appropriée
FROM gcc:latest

# Installer les dépendances nécessaires
RUN apt-get update && apt-get install -y dos2unix cmake make

# Copier les fichiers de l'application dans le conteneur
COPY . /usr/src/myapp

# Définir le répertoire de travail
WORKDIR /usr/src/myapp

# Vérifier la présence de rebuild.sh et afficher le contenu du répertoire
RUN ls -l /usr/src/myapp

# Convertir les fins de ligne du script rebuild.sh au format Unix
RUN dos2unix /usr/src/myapp/rebuild.sh

# Rendre le script rebuild.sh exécutable
RUN chmod +x /usr/src/myapp/rebuild.sh

# Afficher le contenu de rebuild.sh pour vérifier qu'il est correct
RUN cat /usr/src/myapp/rebuild.sh

# Construire l'application
RUN /bin/bash /usr/src/myapp/rebuild.sh

# Copier le script run_solver.sh dans le conteneur
COPY run_solver.sh /usr/src/myapp/run_solver.sh

# Convertir les fins de ligne du script run_solver.sh au format Unix
RUN dos2unix /usr/src/myapp/run_solver.sh

# Rendre le script run_solver.sh exécutable
RUN chmod +x /usr/src/myapp/run_solver.sh

# Définir le point d'entrée du conteneur
CMD ["./build/EquationSolver"]
