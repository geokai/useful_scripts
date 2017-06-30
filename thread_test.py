import threading
import time

# Define a function for the thread:
def print_time( threadName, delay):
    count = 0
    while count < 5:
        time.sleep(delay)
        count = count + 1
        print("s: s", time.ctime(time.time))

# Create two threads as follows:
try:
    threading.start_new_thread( print_time, ("Thread-1", 2, ) )
    threading.start_new_thread( print_time, ("Thread-2", 4, ) )
except:
    print("Error: unable to start thread!")
