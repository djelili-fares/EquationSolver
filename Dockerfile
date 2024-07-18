# Utiliser une image de base appropriée 
FROM gcc:latest

# Installer les dépendances nécessaires 
RUN apt-get update && apt-get install -y cmake make

# Copier les fichiers de l'application dans le conteneur
COPY . /usr/src/myapp

# Définir le répertoire de travail
WORKDIR /usr/src/myapp

# Rendre le script exécutable
RUN chmod +x rebuild.sh

# Construire l'application et vérifier les exécutables (les deux lignes suivantes fonctionnent)
RUN ./rebuild.sh

# Exécuter l'application
CMD ["./build/EquationSolver"]
