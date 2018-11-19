#!/bin/bash

awk -F":" '
BEGIN { printf "%-8s %-3s\n" , "User", "UID" }
NR==1,NR==20{ printf "%-8s %3d\n", $1, $3 } ' /etc/passwd
