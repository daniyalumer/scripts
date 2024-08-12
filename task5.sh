#!/bin/bash

string="$@"
length=${#string}
count=1

echo -e "**\c"
while [ $count -le $length ]; 
do
echo -e "*\c"
count=$((count + 1))
done
echo  "**"

echo "* $string *"

count=1
echo -e "**\c"
while [ $count -le $length ]; 
do
echo -e "*\c"
count=$((count+ 1))
done
echo "**"


