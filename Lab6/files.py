import os
import sys

if(len(sys.argv) != 3):
    print('Incorrect number of arguments')
    sys.exit(1)

if os.path.isdir(sys.argv[1]) == False:
    print('Incorrect first argument, expected directory')
    sys.exit(1)

if os.path.isdir(sys.argv[2]) == False:
    print('Incorrect second argument, expected directory')
    sys.exit(1)

#1
for files in os.listdir(sys.argv[1]):
    if os.path.isfile(files) and os.access(files, os.W_OK):
        os.remove(files)

#2
dirnames = os.listdir(sys.argv[1]):
    for files in dirnames:
        tmpFile = os.path.join(sys.argv[1], files)
        if os.path.isdir(sys.argv[1]):
            os.symlink(os.path.abspath(tmpFile), os.path.join(sys.argv[2], files))

#3
for root, dirs, files in os.walk(sys.argv[1]):
    for name in files + dirs:
        if os.path.getsize(name) > 100 and os.path.isfile(name):
            print(name)
        if os.access(name, os.X_OK) == False:
            print(name)
