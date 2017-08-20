#!/bin/bash

# this script updates the raspbian repos and then upgrades the system:

# This file was created on 20/08/2017
# Author: George Kaimakis - https://github.com/geokai

echo 'updating the raspbian reopos...'
sudo apt-get update -y

echo 'now upgrading the system...'
sudo apt-get upgrade -y
