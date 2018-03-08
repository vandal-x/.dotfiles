#!/bin/sh

if [ "$(pgrep -x redshift)" ]; then
    temp=$(redshift -p 2> /dev/null | grep temp | cut -d ":" -f 2 | tr -dc "[:digit:]")

    if [ -z "$temp" ]; then
        echo "#5860a7"
    elif [ "$temp" -ge 5000 ]; then
        echo "#a758a2"
    elif [ "$temp" -ge 4000 ]; then
        echo "#a7587c"
    else
        echo "#a75858"
    fi
else
    echo "#8959a8"
fi

