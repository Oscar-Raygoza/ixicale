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

#region 'your logic here'
LOG="net-uptime.$(date +%F\ %T).log"
echo "" > "$__SF_BASH/$LOG"
while [[ 1 ]]; do
    VAR=$(curl $1)
    echo -e "\n\n=============================\n" >> "$__SF_BASH/$LOG"
  	echo -e "$(date +%F\ %T) - Response to $1 - $VAR" >> "$__SF_BASH/$LOG"
    sleep 1
done
#endregion

exit 0
