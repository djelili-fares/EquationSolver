# Utiliser une image de base appropriée : (les deux lignes suivantes fonctionnent)
#FROM ubuntu:latest
FROM gcc:latest

# Installer les dépendances nécessaires (les deux lignes suivantes fonctionnent)
#RUN apt-get update && apt-get install -y gcc g++ cmake make dos2unix
RUN apt-get update && apt-get install -y cmake make

# Copier les fichiers de l'application dans le conteneur
COPY . /usr/src/myapp

# Définir le répertoire de travail
WORKDIR /usr/src/myapp

# Vérifier la présence de rebuild.sh et afficher le contenu du répertoire
#RUN ls -l /usr/src/myapp
#RUN ls -l /usr/src/myapp/rebuild.sh


# Convertir les fins de ligne des scripts au format Unix
#RUN dos2unix rebuild.sh

# Rendre le script exécutable
RUN chmod +x rebuild.sh

# Construire l'application et vérifier les exécutables (les deux lignes suivantes fonctionnent)
# RUN /bin/bash rebuild.sh
RUN ./rebuild.sh

# Exécuter l'application
CMD ["./build/EquationSolver"]
