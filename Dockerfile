# Utiliser une image de base appropriée
FROM gcc:latest

# Installer les dépendances nécessaires
RUN apt-get update && apt-get install -y cmake make

# Copier les fichiers de l'application dans le conteneur
COPY . /usr/src/myapp

# Définir le répertoire de travail
WORKDIR /usr/src/myapp

# Vérifier la présence de rebuild.sh et afficher le contenu du répertoire
RUN ls -l /usr/src/myapp

# Rendre le script rebuild.sh exécutable
RUN chmod +x /usr/src/myapp/rebuild.sh

# Construire l'application
RUN /usr/src/myapp/rebuild.sh

# Définir le point d'entrée du conteneur
CMD ["./build/EquationSolver"]
