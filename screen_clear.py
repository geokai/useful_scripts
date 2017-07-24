"""This module performs a screen clear"""
# This file was created on 07/07/2017
# Author: George Kaimakis


import os

def clear():
    """Determines the os and performs the appropriate screen clear"""

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
