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

find $1 -type f -size +99c \( -writable -o ! -perm -100 \) -exec rm{} \; 
