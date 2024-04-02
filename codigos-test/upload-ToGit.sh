#!/bin/bash

# Verificar si la carpeta .git existe en el directorio actual
if [ -d ".git" ]; then
  echo "La carpeta .git ya existe en este directorio. No se ejecutará 'git init'."
else
  # Si la carpeta .git no existe, inicializar un nuevo repositorio Git
  echo "La carpeta .git no existe en este directorio. Inicializando un nuevo repositorio Git..."
  git init
fi

read -p "ingresa verison del commit: " version
read -p "ingresa rama del proyecto" rama

git push -u origin $rama
