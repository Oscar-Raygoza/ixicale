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
_time=`date +%F`
__DIR_SAVE=""

#: if empty params, exit
[ -z $1 ] && echo "missing folder's name" && exit 0
[ -z $2 ] && echo "The API file that defines URL is missing" && exit 0

#: set folder name
[ -d $1 ] && __DIR_SAVE="$1/autogen"
[ ! -d $1 ] && __DIR_SAVE="$__SF_BASH/$1"
__DIR_SAVE="$__DIR_SAVE.$_time.postman-exports"
echo $__DIR_SAVE

#: set target to read
__READ_FILE=$2
echo $__READ_FILE
[ ! -f $__READ_FILE ] && exit 0;

#: set file name
f_name=${__DIR_SAVE/$__SF_BASH\//}

#: Create folder if not exists
[ ! -d $__DIR_SAVE ] && mkdir "$__DIR_SAVE"

f_export='{\n\t"info": {\n\t\t"name": "'$f_name'",'
f_export=$f_export'\n\t\t"schema": "/https://schema.getpostman.com/json/collection/v2.1.0/collection.json"\n\t'
f_export=$f_export'},\n\t"item": [\n\t\t{'
f_export="$f_export\n\t\t\t\"name\": \"/local\","
f_export="$f_export\n\t\t\t\"item\": ["

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
    
    if [[ $line == *"->get('"* || $line == *"->post('"* || $line == *"->put('"* ]]; then
        __BR="\n\t\t\t\t\t"
        endpoint=$(echo $line | sed -e "s/\$\w*->\w*(//g" -e "s/);//g" -e "s/', '\w*'//g" -e "s/','\w*'//g" -e "s/'//g" -e "s/\[//g")

        # link="$prefix$(echo $endpoint | sed -e 's/{\w*:0-9\]+}/6/g')"
        link="$prefix$(echo $endpoint | sed -e 's/\\//g')"

        endpoint=$(echo $endpoint | sed -e 's/{/{___/g' -e 's/+//g' -e 's/\}/___\}/g' -e 's/\\//g' -e 's/\-//g')
        endpoint=$(echo $endpoint | sed -e 's/:\w*\]//g')
        link=$(echo $link | sed -e "s/'//g")
        f_export="$f_export\n\t\t\t\t{$__BR"
        f_export="$f_export\"name\": \"$endpoint\",$__BR"
        f_export="$f_export\"request\": {$__BR\t"
    fi
    if [[ $line == *"->get('"* ]]; then
            f_export="$f_export\"method\": \"GET\",$__BR\t"
            f_export="$f_export\"header\": [],$__BR\t"

    fi
    if [[ $line == *"->post('"* ]]; then
            f_export="$f_export\"method\": \"POST\",$__BR\t"
        data="$(curl -X POST -d {} http://dev.clever-api-events.local$link)"
        echo -e "\n\n\tPOST\n\t=======\n$data"
            f_export="$f_export\"header\": [$__BR\t\t"
                f_export="$f_export{\"key\":\"Content-Type\",\"name\":\"Content-Type\",\"value\":\"application/json\",\"type\":\"text\"}$__BR\t"
            f_export="$f_export],$__BR\t"
    fi
    if [[ $line == *"->put('"* ]]; then
        link=$(echo $link | sed -e "s/\w*:0-9/0/g" -e "s/{//g" -e "s/\}//g" -e "s/\]+//g")
        echo -e "\n\n\tPUT\n\t=======\n$data"
        data="$(curl -X PUT -d {} http://dev.clever-api-events.local$link)"
            f_export="$f_export\"method\": \"PUT\",$__BR\t"
            f_export="$f_export\"header\": [],$__BR\t"
    fi
    if [[ $line == *"->get('"* || $line == *"->post('"* || $line == *"->put('"* ]]; then
            f_export="$f_export\"url\": {$__BR\t\t"
                f_export="$f_export\"raw\": \"{{api_replace-qa}}$link\",$__BR\t\t"
                f_export="$f_export\"host\": [\"{{api_replace-qa}}$link\"]$__BR\t"
            f_export="$f_export}"
        if [[ $line == *"->post('"* || $line == *"->put('"* ]]; then
            f_export="$f_export,$__BR\t\"response\": [],$__BR\t"
            f_export="$f_export\"body\": {$__BR\t\t"
                f_export="$f_export\"mode\":\"raw\",$__BR\t\t"
                f_export="$f_export\"options\":{\"raw\":{\"language\":\"json\"}}"
                if [[ $data == *'"error":'* ]]; then
                    f_export="$f_export,$__BR\t\t\"raw\":\"$(echo -e $data | sed -e 's/\"/\\\"/g')\"$__BR\t"
                else
                    f_export="$f_export,$__BR\t\t\"raw\":\"\"$__BR\t"
                fi
            f_export="$f_export}"
        fi
        f_export="$f_export$__BR}\n\t\t\t\t},"
    fi
done < $__READ_FILE

f_export="${f_export/%,/}\n\t\t\t]\n\t\t}\n\t]\n}"
echo -e $f_export | xclip -sel clip
echo -e $f_export > "$__DIR_SAVE/$f_name.json"
#endregion

exit 0
