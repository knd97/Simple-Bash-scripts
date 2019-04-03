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

#print symlinks to regular files
find -L $1 -type l -xtype f -print
