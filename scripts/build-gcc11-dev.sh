#!/bin/bash

# Check to ensure this is ran in the same directory
if [ "$(dirname $0)" != "." ]; then
	echo "Please Execute this inside the Scripts Folder!"
	exit
fi

# Go down a directory
cd ..

# Create a new build folder (Remove old build folder)
if [ -d "bin" ]; then
	echo "Found Build Directory. Deleting . . ."
	rm -rf bin
fi
mkdir bin

# Compile the Item
gcc -x c++ -std=c++2a -fmodules-ts \
-o bin/file \
-I$PWD/include \
include/test.mxx \
ut/main.cpp

#Remove Cache
rm -rf gcm.cache

#Go back up to scripts
cd scripts
