#!/bin/bash

# Supprimer le répertoire build s'il existe :
rm -rf build 

# Créer le répertoire de build
mkdir -p build

# Naviguer vers le répertoire de build
cd build

# Configurer le projet avec CMake
cmake ..

# Compiler le projet avec make
make

# Afficher le contenu du répertoire build
echo "Contenu du répertoire build:"
ls -l

# Afficher le contenu des répertoires CApp et CppApp
echo "Contenu du répertoire CApp:"
ls -l CApp

echo "Contenu du répertoire CppApp:"
ls -l CppApp

# Rendre les fichiers exécutables
chmod +x CApp/CApp.exe
chmod +x CppApp/CppApp.exe

# Exécuter l'application : 
./EquationSolver
