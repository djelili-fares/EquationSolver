#!/bin/bash

echo "Running EquationSolver with input from $1"

cat $1

./build/EquationSolver < $1
