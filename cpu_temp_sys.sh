#!/bin/bash

clear
while :
do
    cat /sys/devices/virtual/thermal/thermal_zone0/temp | cut -c1-3 | sed -e 's/\(..\)/\1./' | awk ' { print $1, "C" } '
    sleep 3
done
