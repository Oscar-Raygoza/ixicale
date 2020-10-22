#!/bin/bash
# -*- ENCODING: UTF-8 -*-
clear -x

__FILENAME="${0##*/}"
__SF_BASH=$(dirname $0)
__HELPER="$__SF_BASH/settings/$__FILENAME.txt"
_time=`date +%Y_%m_%d`
echo -e "\nRunning date: '$_time'"
echo -e "\nShell name: '$__FILENAME'"
echo -e "Dirname: '$__SF_BASH'"
echo -e "Helper file: '$__HELPER'"
echo -e "Full path: '$0'\n\n"

#: $1 folder name to save data [fullpath | string]
#: $2 file's path to scafolding
#region 'your logic here'
_time=`date +%F.%T`
__DIR_SAVE=""

#: if empty params, exit
[ -z $1 ] && echo "missing folder's name" && exit 0
[ -z $2 ] && echo "The API file that defines URL is missing" && exit 0

#: set folder name
[ -d $1 ] && __DIR_SAVE="$1"
[ ! -d $1 ] && __DIR_SAVE="$__SF_BASH/$1"
__DIR_SAVE="$__DIR_SAVE.postman-exports.$_time"
echo $__DIR_SAVE

#: set target to read
__READ_FILE=$2
echo $__READ_FILE
[ ! -f $__READ_FILE ] && exit 0;




#[ ! -d $1 ] && mkdir "$__DIR_SAVE"

f_export='{\n\t"info": {\n\t\t"name": "Benefits"\n\t},\n\t"item": [\n\t{'
f_export="$f_export\n\t\t\"name\": \"/local\","
f_export="$f_export\n\t\t\"item\": ["

vo=""
prefix=""
endpoint=""
while IFS= read -r line; do
    link=""
    # echo $line
    if [[ $line == *"->setPrefix('"* ]]; then
        # echo "======================================"
        prefix=$(echo $line | sed -e "s/\$\w*->\w*(//g" -e "s/);//g" -e "s/'//g" )
        __BR="\n\t\t\t"
        [ ! -z $endpoint ] && f_export="${f_export/%,/}$__BR]\n\t\t},"
        f_export="$f_export\n\t\t{$__BR"
        f_export="$f_export\"name\": \"$prefix\",$__BR"
        f_export="$f_export\"item\": [$__BR\t"
    fi
    if [[ $line == *"->get('"* ]]; then
        endpoint=$(echo $line | sed -e "s/\$\w*->\w*(//g" -e "s/);//g" -e "s/', '\w*'//g" -e "s/','\w*'//g" -e "s/'//g" -e "s/\[//g")
        __BR="\n\t\t\t\t\t"
        # link="$prefix$(echo $endpoint | sed -e 's/{\w*:0-9\]+}/6/g')"
        link="$prefix$(echo $endpoint | sed -e 's/\\//g')"

        endpoint=$(echo $endpoint | sed -e 's/{/{___/g' -e 's/+//g' -e 's/\}/___\}/g' -e 's/\\//g' -e 's/\-//g')
        endpoint=$(echo $endpoint | sed -e 's/:\w*\]//g')

        link=$(echo $link | sed -e "s/'//g")
        f_export="$f_export\n\t\t\t\t{$__BR"
        f_export="$f_export\"name\": \"$endpoint\",$__BR"
        f_export="$f_export\"request\": {$__BR\t"
            f_export="$f_export\"method\": \"GET\",$__BR\t"
            f_export="$f_export\"header\": [],$__BR\t"
            f_export="$f_export\"url\": {$__BR\t\t"
                f_export="$f_export\"raw\": \"{{api_replace-qa}}$link\"$__BR\t"
            f_export="$f_export}$__BR"
        f_export="$f_export}\n\t\t\t\t},"

    fi
    # if [[ $line == *"->post('"* ]]; then
    #     echo $line
    # fi
    # if [[ $line == *"->put('"* ]]; then
    #     echo $line
    # fi
    # echo ">>$line<<";
done < $__READ_FILE


f_export="${f_export/%,/}\n\t\t\t]\n\t\t}\n\t]\n}"
echo -e $f_export | xclip -sel clip
#endregion

exit 0




(\$[A-z]*->setPrefix\()|(\')|(\))

^([.]{0,2}\/)*([A-z0-9-_+]+\/)*([A-z0-9-_]+\.[a-zA-Z0-9]{2,})$