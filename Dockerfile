# Utiliser une image de base appropriée
FROM ubuntu:latest

# Installer les dépendances nécessaires
RUN apt-get update && apt-get install -y gcc g++ cmake make dos2unix

# Copier les fichiers de l'application dans le conteneur
COPY . /usr/src/myapp

# Définir le répertoire de travail
WORKDIR /usr/src/myapp

# Convertir les fins de ligne des scripts au format Unix
RUN dos2unix rebuild.sh

# Rendre le script exécutable
RUN chmod +x rebuild.sh

# Construire l'application et vérifier les exécutables
RUN /bin/bash rebuild.sh

# Exécuter l'application
CMD ["./build/EquationSolver"]
