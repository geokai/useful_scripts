#!/bin/bash

# api: http://wttr.in/
# retreives weather information for the location given as an argument to the
# script call.
# e.g., wttr.sh london?0q
# will render the current weather for London, with reduced text.
# refer to http://wttr.in:help

# This file was created on 27/06/2017
# Author: George Kaimakis

counter=0

while :
do
    clear;
    echo $counter;
    date
    curl wttr.in/$1
    sleep 900;
    counter=$((counter + 1));
done