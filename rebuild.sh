#!/bin/bash

# Supprimer le répertoire build s'il existe
rm -rf build 

# Créer le répertoire de build
mkdir -p build

# Naviguer vers le répertoire de build
cd build

# Configurer le projet avec CMake
cmake ..

# Compiler le projet avec make
make

# Vérifier le contenu du répertoire de build et les permissions des fichiers
echo "Contenu du répertoire build après la compilation :"
ls -l

echo "Contenu du répertoire build/CApp après la compilation :"
ls -l CApp

echo "Contenu du répertoire build/CppApp après la compilation :"
ls -l CppApp

# Vérifier les permissions / Ces deux lignes sont facultatives
chmod +x CApp/CApp
chmod +x CppApp/CppApp

# Revenir au répertoire précédent
cd ..

# Exécuter l'application
./build/EquationSolver
