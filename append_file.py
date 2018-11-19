"""example of appending to a file using a context manager"""


with open("app_test.txt", "a", newline='') as myfile:
    myfile.write("appended text\n")
