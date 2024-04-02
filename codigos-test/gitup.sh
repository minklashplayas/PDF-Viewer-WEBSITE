#!/bin/bash

# Verificar si la carpeta .git existe en el directorio actual
if [ -d ".git" ]; then
  echo "La carpeta .git ya existe en este directorio. No se ejecutará 'git init'."
else
  # Si la carpeta .git no existe, inicializar un nuevo repositorio Git
  echo "La carpeta .git no existe en este directorio. Inicializando un nuevo repositorio Git..."
  git init
  git add .
  git commit -m "Commit inicial"
fi

# Solicitar la versión del commit
read -p "Ingresa la versión del commit: " version

# Solicitar la rama del proyecto
read -p "Ingresa la rama del proyecto: " rama
git add .
git commit -m "$version"
git branch -M $rama
# Empujar los cambios a la rama especificada
git push -u origin $rama
