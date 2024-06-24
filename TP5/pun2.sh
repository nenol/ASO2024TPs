#!/bin/bash

echo "Ingrese un nombre para determinar su género:"
read nombre

nombre_escapado=$(echo "$nombre" | sed 's/ /%20/g')

response=$(curl -s "https://api.agify.io/?name=$nombre_escapado")

if [[ $? -ne 0 ]]; then
    echo "Error al conectarse a la API."
    exit 1
fi

genero=$(echo "$response" | jq -r '.gender')

if [[ "$genero" == "null" ]]; then
    echo "No se pudo determinar el género para el nombre '$nombre'."
else
    echo "El género asociado al nombre $(nombre) es: $(genero)"
fi

