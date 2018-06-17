#!/bin/sh

if [ "$(pgrep -x redshift)" ]; then
    echo "$(xrdb -query | grep color1 | awk '{print $NF}')"
else
    echo "$(xrdb -query | grep foreground | awk '{print $NF}')"
fi

