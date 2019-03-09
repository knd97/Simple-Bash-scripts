#!/bin/bash

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
	if [[ -f $1/$file ]]		#if regular file, add write permission for user
	then
		chmod u+w "$1/$files"
	elif [[ -d $1/$file ]]		#if directory, remove execute permission for user
	then
		chmod u-x "$1/$files"
	fi
done
