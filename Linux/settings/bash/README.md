# BASH Scripting Básico

Al ejecutar un script, tenemos una función muy útil que son las opciones, mejor conocidas como parámetros; es decir, son especificaciones que se le hacen al programa al momento de llamarlo para obtener un efecto diferente.

## Como usar parámetros en BASH

Bien, si por ejemplo tenemos el siguiente script:

``` sh
# !/bin/bash
# -*- ENCODING: UTF-8 -*-

RNM=`expr $RANDOM % 11`
if [ $1 = $RNM ] ; then
echo "Acertaste, el número "$1" es correcto"
else
echo "Has errado"
fi
```

¿Como es posible que funcione si no le hemos pedido que ejecute read para obtener el valor de la variable $1? En realidad es muy simple, ya que nuestro script lo llamaríamos así (por ejemplo):


> bash $ ./adivina.sh 6

El **6** es el primer parámetro, en Bash pasa directo como la variable **$1**, si hubiéramos asignado mas parámetros se les iría asignando sucesivamente a las variables ***$2, $3, etc***...

## Parametros

Otra interesante función de Bash es que podemos trabajar con los parámetros de otras maneras, por ejemplo miren este script:



``` sh
# !/bin/bash
# -*- ENCODING: UTF-8 -*-

echo "El nombre del fichero en ejecución es: $0"
echo "El primer parámetro es: $1"
echo "El segundo parámetro es: $2"
echo "Los parámetros son: $*"
echo "La cantidad de parámetros pasados es de $# parámetros"
exit 0
```
Al ejecutar el comando mostrará la siguiente respuesta:
> bash $ ./parámetros.sh primero segundo
```
El nombre del fichero en ejecución es: ./parámetros.sh
El primer parámetro es: primero
El segundo parámetro es: segundo
Los parámetros son: primero segundo
La cantidad de parámetros pasados es de 2 parámetros
```
