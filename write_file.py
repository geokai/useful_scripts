"""example of writting to a file using a context manager
- this will overwrite an existing file
"""


with open("write.txt", "w", newline=None) as myfile:
    myfile.write("slightly different text")
