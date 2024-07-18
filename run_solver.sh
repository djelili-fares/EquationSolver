#!/bin/bash

echo "Running EquationSolver with input from $1"

# Afficher le contenu du fichier d'entrée
echo "Content of $1:"
cat $1

# Exécuter EquationSolver avec l'entrée et capturer la sortie
output=$(./build/EquationSolver < $1)

# Afficher la sortie brute de l'application
echo "Raw output from EquationSolver:"
echo "$output"

# Afficher la sortie analysée
echo "Processed output from EquationSolver:"
echo "$output" | while read line; do
  echo "Line: $line"
done

# Afficher un message de fin
echo "Finished running EquationSolver with input from $1"
