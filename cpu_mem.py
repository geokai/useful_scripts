"""Checks the processor and memory useage percentage using the psutil tool."""

# This file was created on 07/07/17
# Author: George Kaimakis


from __future__ import print_function
from time import sleep
import sys
import psutil
from screen_clear import clear

clear()


def buf_flush():
    """Flushes the stdout buffer."""
    sys.stdout.flush()


COUNTER = 0
DURATION = int(input("Select an interval from 1 to 30 seconds: "))
clear()
while True:
    if DURATION > 0 and DURATION < 31:
        cpuPercent = psutil.cpu_percent(interval=0)
        ramPercent = psutil.virtual_memory().percent
        print()
        print("{0}/{1}: ".format(DURATION, (COUNTER + 1)), end="")
        buf_flush()
        sleep(0.5)
        print("CPU = {0}%  RAM = {1}% ".format(cpuPercent, ramPercent), end='')
        buf_flush()
        # sleep(0.5)
        sleep(DURATION)
        COUNTER += 1
        if COUNTER == DURATION:
            COUNTER = 0
    else:
        print("select only 1 to 30 seconds!")
        sleep(2)
        clear()
        break
