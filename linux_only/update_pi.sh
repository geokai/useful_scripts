#!/bin/bash

# this script updates the raspbian repos and then upgrades the system:

# This file was created on 20/08/2017
# Author: George Kaimakis - https://github.com/geokai

clear
echo
echo '––––––––––––––––––––––––––––––––––––––'
echo 'updating the raspbian repo listings...'
echo '––––––––––––––––––––––––––––––––––––––'
echo
sudo apt-get update -y
echo
echo '–––––––––––––––––––––––––––'
echo 'update complete.'
echo 'now upgrading the system...'
echo '–––––––––––––––––––––––––––'
echo
sudo apt-get upgrade -y
echo
echo '–––––––––––––––––'
echo 'upgrade complete.'
echo '–––––––––––––––––'
echo
sleep 5
clear
