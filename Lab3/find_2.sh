#!/bin/bash

if [[ ! $# -eq 1 ]]
then
	echo "Expected 1 argument"
	exit 1
fi

if [[ ! -d $1 ]]
then
	echo "Expected directory"
	exit 1
fi

#print inode for directories which contains <= 3 subdirectories

find $1 -type d -links -6 -printf "%i \n"
