#!/bin/bash

# This file was created on 17/01/17

echo
echo -e "Which directory to count: \c"
read DIR
echo
#echo $DIR
NUMFILES=$(ls -l $DIR | tail -n +2 | wc -l)
echo -e "You have $NUMFILES items within $DIR\n"
NUMORD=$(ls -l $DIR | grep -c ^-)
NUMDIR=$(ls -l $DIR | grep -c ^d)
NUMLINKS=$(ls -l $DIR | grep -c ^l)
NUMOTHER=$(ls -l $DIR | tail -n +2 | grep -cv ^[ld-])
echo -e "You have \t$NUMORD \tfiles within \t\t$DIR\n"
echo -e "You have \t$NUMDIR \tdirectories within \t$DIR\n"
echo -e "You have \t$NUMLINKS \tlinks within \t\t$DIR\n"
echo -e "You have \t$NUMOTHER \tother items within \t$DIR\n"
((TOTAL = NUMORD + NUMDIR + NUMLINKS + NUMOTHER))
echo -e "You have a total of $TOTAL items in the directory $DIR"
echo
