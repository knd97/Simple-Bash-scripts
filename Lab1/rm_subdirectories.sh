#!/bin/bash
#Remove subdirectories

if [[ $# -ne 1 ]]
then
	echo "Incorrect number of arguments"
	exit 1
fi

if [[ ! -d $1 ]]
then
	echo "Incorrect argument, expected directory"
	exit 1
fi

for files in `ls -A $1`
do
	if [[ -d $1/$files ]]
	then
		for files2 in `ls -A $1/$files`
		do
			mv "$1/$files/$files2" "$1"
		done
		rm -r "$1/$files"
	fi
done
