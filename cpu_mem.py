# This file was created on 07/07/17
# Author: George Kaimakis

# this script checks the processor and memory (ram) use percentage using the
# psutil tool.

from __future__ import print_function
import psutil
from time import sleep
from screen_clear import clear

clear()
counter = 0

duration = int(input("Select an interval from 5 to 30 seconds: "))
clear()

while(True):
    if duration > 4 and duration < 31:
        # get the system performance data:
        cpuPercent = psutil.cpu_percent(interval=duration)
        ramPercent = psutil.virtual_memory().percent
        print("{0}: ".format(counter + 1), end="")
        sleep(0.25)
        print ("CPU = {0}%  RAM = {1}%".format(cpuPercent, ramPercent))
        counter += 1
        if counter > duration:
            counter = 0
else:
    print("select only 5 to 30 seconds!")
    sleep(2)
    clear()

