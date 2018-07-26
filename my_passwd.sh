#!/bin/bash

# This file was created on 07/01/17

awk -F":" '
BEGIN { 
print "\n"
print "==============================================================================="
printf "%-15s %5s %8s %-30s %-20s\n", "User", "UID", "GID", "Home", "Shell" 
print "==============================================================================="
}
NR>22{ printf "%-15s %5d %8d %-30s %-20s\n", $1,$3,$4,$6,$7 } 
END {
print "\n"
}
' /etc/passwd

#awk -F":" ' NR==23,NR==33{ print length($6) } ' /etc/passwd
