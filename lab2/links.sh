#!/bin/bash

if [[ ! $# -eq 2 ]]
then
	echo "Expected two arguments"
	exit 1
fi

if [[ ! -d $1 || ! -d $2 ]]
then
	echo "Expected directories"
	exit 1
fi

path_d1=`realpath $1`
path_d2=`realpath $2`

if [[ $path_d1 == $path_d2 ]]
then
	echo "Expected two diffrent directories"
	exit 1
fi

for files in `ls -A $1`
do

	dir=`realpath $1/$files`
	if [[ -L "$1/$files" && ! -e $dir ]]
	then
		rm "$1/$files"
	fi

	if [[ -d "$1/$files" ]]
	then
		relative_path=`realpath --relative-to="$2" "$1"`
		ln -s "$relative_path/$files" "$2"
	fi

	if [[ -f "$1/$files" ]]
	then
		ln "$1/$files" "$2"
	fi
done
