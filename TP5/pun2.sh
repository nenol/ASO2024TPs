#!/bin/bash

echo "Ingrese un nombre para determinar su género:"
read nombre

# Escapamos el nombre para usarlo en la URL de la API
nombre_escapado=$(echo "$nombre" | sed 's/ /%20/g')

# Hacemos la solicitud a la API de Agify
response=$(curl -s "https://api.agify.io/?name=$nombre_escapado")

# Verificamos si la solicitud fue exitosa (código de respuesta 200)
if [[ $? -ne 0 ]]; then
    echo "Error al conectarse a la API."
    exit 1
fi

# Extraemos el género del JSON usando jq
genero=$(echo "$response" | jq -r '.gender')

# Mostramos el resultado al usuario
if [[ "$genero" == "null" ]]; then
    echo "No se pudo determinar el género para el nombre '$nombre'."
else
    echo "El género asociado al nombre $(nombre) es: $(genero)"
fi

