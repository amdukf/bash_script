#! /bin/bash

echo "Enter How many files you want to create : "
read number
echo "what name do you want to set for your files ? ( names will be concat to numbers )"
read name

for (( i=1 ; i<=number ; i++ ))
do
	touch $name$i
done

