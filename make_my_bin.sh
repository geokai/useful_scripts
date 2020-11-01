#!/bin/bash

echo "Checking for directory, /bin/local/"
test -d $HOME/bin/local && \
    ( printf "/bin/local/ exists.\n"
    printf "Exit Code: %s\n" "$?" ) || \
    printf "/bin/local/ not found.\n"

# sleep 1
# printf "Exit Code: %s\n" "$?"
