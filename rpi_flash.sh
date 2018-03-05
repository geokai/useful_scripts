#!/bin/sh

# A simple shell script anumation using figlet, toilet and tr to create a
# colorful flashing text object

text="happy\n  RPi   \nweek"
seq1=$(echo -e $text | figlet -tcf lean | tr ' _/' ' //' | toilet -f term --gay)
seq2=$(echo -e $text | figlet -tcf lean | tr ' _/' '/  ' | toilet -f term --gay)

while :
    do
        clear
        echo "${seq1}"
        sleep 1
        clear
        echo "${seq2}"
        sleep 1
    done
