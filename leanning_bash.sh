#! /bin/bash

# echo "hi dude"



# cat > test.txt # This will write and replace the new text with old text

# cat >> test.txt # This will append the new text



# for commenting some lines together , we use :
# : '
# text'

# HereDoc

# cat << test
# this is a test please show it
# test


# conditions

<< comment
number=20

if (( $number < 19 )) # or we can use [ condition ]
then
	echo "Your number is less than our number"
elif (( $number < 10 ))
then
	echo "Your number is weak"
else
	echo "nothing else brother"
fi
comment

# for and operator , we can use [ condition ] && [ condition ] or [ condition && condition ] or [ condition -a condition ]

# [ condition -o  condition ] Or operator

# while loop

<<comment
n=1
while [ $n -le 100 ]
do
	echo $n
	n=$((n+1))
done
comment
# while loop will run until our condition is false but until loop run unti the condition is true

<<comment
n=1
until [ $n -ge 100 ]
do
        echo $n
        n=$((n+1))
done
comment

# for

<<comment
for i in {0..20}
do
	echo $i
done
comment
# we can write for , in this way like cpp

<<comment
for (( i=0 ; i<=5 ; i++ ))
do
	echo $i
done
comment

#################

# we can get input in the command line in this way ;
# echo $1 $2 $3   # this will give input near the executing file name 

# or we write a array example

<<comment
arg=("$@")
echo $@
echo $# # This will print the array length
comment

# read a file

<<comment
while read line
do
	echo "$line"
done < "${1:-/dev/stdin}"
comment

#################

ls @al 1>file.txt 2>error.txt
