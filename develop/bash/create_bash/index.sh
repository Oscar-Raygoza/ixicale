#!/bin/bash
# -*- ENCODING: UTF-8 -*-
clear -x

__FILENAME="${0##*/}"
__SF_BASH=$(dirname $0)
__HELPER="$__SF_BASH/$__FILENAME.txt"
_time=`date +%Y_%m_%d`
echo -e "\nRunning date: '$_time'"
echo -e "\nShell name: '$__FILENAME'"
echo -e "Dirname: '$__SF_BASH'"
echo -e "Helper file: '$__HELPER'"
echo -e "Full path: '$0'\n\n"

#region 'your logic here'

__BASH_FOLDER="$MY_CONF/develop/bash"

file_legend="
Ingrese el nombre del script (sin '.sh') para preparar entorno.
Debe contar con almenos un caracter:"
folder_legend="
Ingrese el nombre de la carpeta del entorno.
Debe contar con almenos un caracter:"

#: Read a input console intro and prints
content_def() {
    cntnt=""
    # Ingresar nombre
    while [[ -z "$cntnt" ]]; do
        read -p "$1 >" cntnt
    done
    echo -e "$cntnt"
}

#: Set print datas
folder_name="$(content_def "$folder_legend")"
file_name="$(content_def "$file_legend").sh"

#: if exists, remove last dir
[ -d "$__BASH_FOLDER/$folder_name" ] && rm -rf "$__BASH_FOLDER/$folder_name";

#: create script, complements & set as executable
mkdir "$__BASH_FOLDER/$folder_name"
cat "$__HELPER" > "$__BASH_FOLDER/$folder_name/$file_name"
chmod +x "$__BASH_FOLDER/$folder_name/$file_name"

echo "" > "$__BASH_FOLDER/$folder_name/$file_name.txt"
echo "## $folder_name

Creation date: $_time

ENJOYS! ^^~

~x.

---

Author: @ixicale" > "$__BASH_FOLDER/$folder_name/README.md"

echo -e "\nCREATED '$__BASH_FOLDER/$folder_name/$file_name'"
#endregion

exit 0
