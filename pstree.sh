#!/bin/bash

# This file was created on 13/01/17
# Author: George Kaimakis

clear

echo -e "select interval,  2 to 10 seconds: \c"
read INTERVAL

if (( $INTERVAL > 1 )) && (( $INTERVAL < 11 ))
    then
        while :
             do 
                clear
                pstree -up
                echo
                echo "This process: $$"
                sleep $INTERVAL
            done
    else
        echo -e "select only from 2 to 10: \c"
        sleep 2
        clear
        exit 1
fi
