# This file was created on 07/07/2017
# Author: George Kaimakis


# this module determines the operating system type and provides the
# appropriate terminal scroll-back clearing (screen clear):

import os

def clear():
    """
        Determines the os of the system and performs the appropriate
        clear scroll-back
    """
    osname = os.name
    if osname == 'posix':
        os.system('clear')
    elif osname == 'nt' or osname == 'dos':
        os.system('cls')
    else:
        print("\n" * 30)
    return osname

if __name__ == "__main__":
    clear()

