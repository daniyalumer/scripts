!#bin/bash

echo "Creating directory task2"
mkdir task2

echo "Moving to task2"
cd task2

echo "Creating three files using touch"
touch file1.txt file2.txt file3.txt

echo "moving back to parent directory"
cd ..

echo "Creating another folder task2_temp"
mkdir task2_temp

echo "Copying and pasting into task2_temp"
cp -r task2/* task2_temp/

echo "swapping folder names"
mv task2 temp
mv  task2_temp task2
mv temp task2_temp
