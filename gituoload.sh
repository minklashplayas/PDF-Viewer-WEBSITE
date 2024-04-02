#!/bin/bash

# Función para manejar errores
handle_error() {
    echo "Error: $1"
    exit 1
}

# Verificar si la carpeta .git existe en el directorio actual
if [ -d ".git" ]; then
    echo "La carpeta .git ya existe en este directorio."
fi

# Solicitar la versión del commit
read -p "Ingresa la versión del commit: " version
if [ -z "$version" ]; then
    handle_error "La versión del commit no puede estar vacía"
fi

# Solicitar la rama del proyecto
read -p "Ingresa la rama del proyecto: " rama
if [ -z "$rama" ]; then
    handle_error "El nombre de la rama no puede estar vacío"
fi

# Añadir cambios y confirmar con la versión del commit ingresada
git add . || handle_error "No se pudo agregar archivos al repositorio"
git commit -m "$version" || handle_error "No se pudo hacer el commit"

# Cambiar a la rama especificada (o crearla si no existe)
git checkout -B $rama || handle_error "No se pudo cambiar a la rama especificada"

# Empujar los cambios a la rama especificada
git push -u origin $rama || handle_error "No se pudo empujar los cambios a GitHub"
