#! /bin/bash

echo "Enter the directory you want to check"
read dir

if [ -d "$dir" ]
then
	echo "$dir exist"
else
	echo "$dir Doesn't exist , Do you want to create it (y/n)?"
	read check_give
	if [[ $check_give == y ]] || [[ $check_give == Y ]]
	then	
		mkdir $dir
		echo "$dir created dude" 
	elif [[ $check_give == n ]] || [[ $check_give == N ]]
	then
		echo "Program stop , Good luck"
	else
		"You Enter wrong input"
	fi	
fi
