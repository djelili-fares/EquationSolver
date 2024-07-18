cmake_minimum_required(VERSION 3.10)

# Projet principal
project(EquationSolver)

# Ajouter le sous-répertoire pour CApp et CppApp
add_subdirectory(CApp)
add_subdirectory(CppApp)

# Ajouter l'exécutable principal
add_executable(EquationSolver main.cpp)
