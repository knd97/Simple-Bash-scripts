#!/bin/bash

if [[ $# -ne 2 ]]
then
	echo "Incorrect number of arguments"
fi

if [[ ! -d $1 ]]
then
	echo "Expected directory as first argument"
fi

if [[ ! -f $2 ]]
then
	echo "Expected regular file as second argument"
fi

find -P $1 -printf "%y %p %m\n" | while read var1 var2 var3
do
	if [[ $var1="f" ]]
	then
		bin=$(echo "obase=2; ibase=8; $var3" | bc)
		echo "`sha1sum $var2` $bin"
	fi

	if [[ $var1="d" ]]
	then
                bin=$(echo "obase=2; ibase=8; $var3" | bc)
		echo "$bin"
	fi
	
	if [[ $var1="l" ]]
	then
		echo `stat -c %y $var2`
	fi
done | tee $2 | sort | head --lines=20 | tail
