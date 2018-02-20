#!/bin/bash

# api: curl http://wttr.in/~london?MQ0
# retreives weather information for the location given as an argument to the
# script call.
# e.g., wttr.sh london?0q
# will render the current weather for London, with reduced text.
# refer to http://wttr.in:help

# This file was created on 17/02/18
# Author: George Kaimakis

date >> $2
curl wttr.in/$1 >> $2
# echo "" >> $2
