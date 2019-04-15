#!/bin/bash
# -*- ENCODING: UTF-8 -*-
clear
echo "Iniciando programa: $0

"

# leer archivos que contiene paths [ url_script_python, url_venv ]
rows=();
input="/var/www/html/Testing/codigo_crudo/aux_ejecutar_python.txt"
while IFS= read -r var
do
  rows=("${rows[@]}" "$var")
  # echo $var
done < "$input"

# Entorno virtual del proyecto
if  [ -d ${rows[1]}/bin ]
then
    source ${rows[1]}/bin/activate
    echo "source ${rows[1]}/bin/activate [...] entorno virtual del proyecto OK"
else
    echo "'${rows[1]}' No valido como entorno virtual
    "

    if  [ ! -d $HOME/Documentos/my_python_devs/.venv ] # no existe entorno
    then
        echo "'$HOME/Documentos/my_python_devs/.venv' entorno virtual no encontrado"
        echo "Creando entorno local '$HOME/Documentos/my_python_devs/.venv'
        [...]"
        virtualenv $HOME/Documentos/my_python_devs/.venv
        echo "
        [...] OK
        "

    fi
    source $HOME/Documentos/my_python_devs/.venv/bin/activate
    echo "Reintento con entorno virtual local [...] OK"
fi

# Python a ejecutar
if  [ -f ${rows[0]} ]
then
    echo "[...]"
    echo "python3 ${rows[0]} [...] OK
    "
    echo "========== Comenzando ============


    "
    python3 ${rows[0]}
else
    echo "Error, Script Python '${rows[0]}' no valido"
fi
deactivate
exit 0
