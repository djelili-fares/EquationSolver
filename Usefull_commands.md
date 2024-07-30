
# EquationSolver Project

## Table des Matières

1. [Manipulations Git](#0-manipulations-git)
2. [Compiler le Code](#1-compiler-le-code)
3. [Créer et Exécuter une Image Docker](#2-créer-une-image-docker)
4. [Accéder au Conteneur Docker](#3-accéder-au-conteneur-docker)
5. [Envoyer l'Image Docker vers Docker Hub](#4-envoyer-limage-docker-vers-docker-hub)
6. [Récupérer des Images depuis Docker Hub](#5-récupérer-des-images-depuis-docker-hub)

## 0. Manipulations Git

### A. Ajouter des modifications
1. Vérifiez l'état du dépôt pour voir les modifications non suivies :
   
   git status
   
2. Ajoutez les modifications à l'index (préparez-les pour le commit) :
   
   git add .
   

### B. Commiter les modifications
1. Effectuez un commit avec un message descriptif :
   
   git commit -m "Description des modifications"
   

### C. Pusher la version vers GitHub
1. Envoyez les commits locaux vers le dépôt distant :
   
   git push 
   

## 1. Compiler le Code

### A. Préparer le répertoire de build
1. Supprimez le répertoire de build s'il existe et créez un nouveau répertoire :
   
   rm -rf build
   mkdir -p build
   cd build
   

### B. Configurer le projet avec CMake
1. Utilisez CMake pour configurer le projet :
   
   cmake ..
   

### C. Compiler le projet
1. Compilez le projet avec `make` :

   make
   

## 2. Créer et Exécuter une Image Docker

### A. Écrire le Dockerfile
1. Créez un fichier nommé `Dockerfile` avec le contenu suivant :
   
   FROM gcc:latest
   RUN apt-get update && apt-get install -y cmake make dos2unix
   COPY . /usr/src/myapp
   WORKDIR /usr/src/myapp
   RUN dos2unix /usr/src/myapp/rebuild.sh
   RUN chmod +x /usr/src/myapp/rebuild.sh
   RUN /bin/bash /usr/src/myapp/rebuild.sh
   

### B. Construire l'image Docker
1. Construisez l'image Docker avec la commande suivante :
   
   docker build -t equationsolver:v1.0 .
   

### C. Exécuter l'image Docker
1. Exécutez l'image Docker avec la commande suivante :
   
   docker run --rm equationsolver:v1.0
   docker run -it --rm equationsolver:v1.3 // Dans le cas où l'applicatio nécessite une interaction avec l'utilisateur (lecture clavier par exemple)
   

## 3. Accéder au Conteneur Docker
1. Pour accéder au conteneur Docker en mode interactif, utilisez la commande suivante :
   
   docker run -it equationsolver:v1.0 /bin/bash
   

## 4. Envoyer l'Image Docker vers Docker Hub

### A. Taguer l'image Docker
1. Taguez l'image Docker avant de la pusher vers Docker Hub :
   
   docker tag equationsolver:v1.0 yourdockerhubusername/equationsolver:v1.0
   

### B. Se connecter à Docker Hub
1. Connectez-vous à Docker Hub :
   
   docker login
   

### C. Pusher l'image Docker vers Docker Hub
1. Pushez l'image Docker vers Docker Hub :
   
   docker push yourdockerhubusername/equationsolver:v1.0
   

### D. Afficher la liste des images Docker
   
   docker images
   

## 5. Récupérer des Images depuis Docker Hub
1. Pour récupérer une image depuis Docker Hub, utilisez la commande suivante :
   
docker pull yourdockerhubusername/equationsolver:v1.0
   

Remplacez `yourdockerhubusername` par votre nom d'utilisateur Docker Hub.


### E. Commandes Docker Importantes

## 1. Afficher les Conteneurs en Cours d'Exécution

docker ps

## 2. Afficher tous les Conteneurs (y compris ceux qui ne sont pas en cours d'exécution)

docker ps -a

## 3. Démarrer un Conteneur Arrêté 

docker start <container_id>

## 4. Arrêter un Conteneur en Cours d'Exécution

docker stop <container_id>

## 5. SUpprimer un Conteneur arreté 

docker rm <container_id>

## 6. Supprimer une Image Docker

docker rmi <image_id>

## 7. Afficher l'Espace Utilisé par Docker

docker system df

## 8. Nettoyer les Ressources Inutilisées (conteneurs, images, volumes, etc.)

docker system prune

## 9. docker search <image_name>

docker search <image_name>

## 10. docker tag <image_id> <username>/<repository>:<tag>

docker tag <image_id> <username>/<repository>:<tag>

## 11. docker inspect <image_id>
 
docker inspect <image_id>

## 12. Tuer un Conteneur en cours d'exécution 

docker kill <container_id>

## 13. Renomer un Conteneur 

docker rename <old_name> <new_name>

## 14. Copier des fichiers depuis où vers un Conteneur 

docker cp <container_id>:<container_path> <host_path>
docker cp <host_path> <container_id>:<container_path>

