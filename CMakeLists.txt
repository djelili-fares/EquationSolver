cmake_minimum_required(VERSION 3.10)
project(EquationSolver)

# Ajouter les sous-répertoires
add_subdirectory(CppApp)
add_subdirectory(CApp)

# Ajouter l'exécutable principal
add_executable(EquationSolver main.cpp)

# Spécifier les dépendances
add_dependencies(EquationSolver CppApp CApp)
