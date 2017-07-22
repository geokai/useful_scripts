#!/usr/bin/python3

""" 
    This script gets the temperature reading from a system file and prints it to
    screen
"""


# This file was created on 21/03/17
# Author: George Kaimakis

import os
from time import sleep

print()
while True:
    dev = os.popen('/opt/vc/bin/vcgencmd measure_temp')
    cpu_temp = dev.read()
    print("Processor {0}".format(cpu_temp), end='')
    sleep(5)
