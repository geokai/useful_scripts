#!/bin/bash

trap 'tput cnorm' 0

tput civis

while true; do
    clear
    date '+Current Date: %m/%d/%y%nCurrent Time: %H:%M:%S'
    sleep 1
done
