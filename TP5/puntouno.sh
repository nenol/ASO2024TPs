#!/bin/bash

numero_aleatorio=$((RANDOM % 100 + 1))

echo "Bienvenido al juego de adivinar el número!"
echo "Estoy pensando en un número entre 1 y 100..."

adivinado=false  
while ! $adivinado; do
    read -p "Introduce tu número (entre 1 y 100): " intento

    if (( intento == numero_aleatorio )); then
        echo "¡Felicidades! Has adivinado el número $numero_aleatorio."
        adivinado=true 
    elif (( intento < numero_aleatorio )); then
        echo "El número es mayor que $intento. ¡Sigue intentándolo!"
    else
        echo "El número es menor que $intento. ¡Sigue intentándolo!"
    fi
done

