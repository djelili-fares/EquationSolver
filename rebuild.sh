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

cd build

./EquationSolver.exe 