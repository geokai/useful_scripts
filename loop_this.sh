#!/bin/bash

# This file was created on 24/02/18
# Author: George Kaimakis - https://github.com/geokai

# This script runs a simple while loop in terms of the resource ($1) and the
# interval in seconds ($2):

source ~/bin/local/greenbar2.sh
tput civis

item=$1
interval=$2

while :
    do
        clear
        $item | greenbar2
        sleep $interval
    done
