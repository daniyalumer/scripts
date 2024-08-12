#!/bin/bash


string=$2
stringFlag=$1
charFlag=$3
length_of_string=${#string}
count=0
char=$4

function print_string()
{
	if [ $stringFlag=='-s' ]; then
		if [ $charFlag=='c' ]; then
			echo -e "$char$char\c"
			while [ $count -le $length_of_string ];
			do
				echo -e "$char\c"
				count=$((count+1))
			done
			echo "$char"

			echo "$char $string $char"

			count=1
			echo -e "$char$char\c"
			while [ $count -le $length_of_string ]; 
			do
				echo -e "$char\c"
				count=$((count+ 1))
			done
			echo "$char$char"
		
		else
			echo "Invalid Character Argument"
		fi
	else
		echo "Invalid String Argument"
	fi
}

if [ $# -eq 4 ]; then
	print_string
	exit 0
fi
if [ $# -eq 2 ]; then
	echo "$string"
	exit 0
fi

echo "Invalid Number of Arguments"
