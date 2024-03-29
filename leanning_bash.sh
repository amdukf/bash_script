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


# ls @al 1>file.txt 2>error.txt # This will return the error and output in a seprated file.

<<comment
In this method , ew send a command or anything else in another file

text="dude"
export text
./secondtext.sh

comment

# for comparing two string in bash , we use /< and />

<<comment
concat two strings

str1="We welcome you"

str2=" on linux"

str3="$str1$str2"

echo $str3
comment

<<comment

read st1

echo ${st1^^} # This is for convert the string to Uppercase and ^ will convert the string in lowercase , ^l will convert just first charecter to Uppercase.
comment

#############

<<comment
read st1
read st2

echo $[ st1+st2 ] # or $(( )))
comment

# Array

<<comment
distro=('ubuntu' 'mint' 'pop')

unset distro[1] # This will delete the index
distro[1]='Arch' # This add a index

echo ${distro[@]}

echo ${#distro[@]} # This will print the length

echo ${!distro[@]} # This will print the index of the arrays
comment

##################

# Functions

<<comment
function funcplus()
{
	echo $(( $1  $2 ))
}

funcplus 10 11
comment

####################

# Create a script to check if a folder in directory exist or not

<<comment
echo "Enter your folder name"
read dir
if [ -d "dir"]
then
	echo "$dir exists"
else
	echo "$dir not exists"
fi
comment

# for checking file is exist or not , we should use [[ -f "$filename" ]]

# for reading file


# echo "Enter your file your wanna read"
# read dir

<<comment
if [[ -f "dir"]]
then
	while IFS= read -r line
	do
		echo "$line"
	done < $dir
else
	echo "$dir not exists"
fi
comment

######

# curl

<<comment
url="link"
curl ${url} -o Downloadedfile # or we can do this => curl ${url} > outputfile
curl -I ${url} # gives some information about the Downloaded file
comment

###############

# select

<<comment
select distro in ubuntu mint manjaro Arch redhat
do
	echo "your distro is $distro"
done	
comment

###############

<<comment
echo "Enter something to continue"

while ( true )
do
	read -t 3 -n 1
if [ $? = 0 ]
then
	echo "your terminated the script"
	exit
fi

done
comment

###################

# with inotify we can see the changes that happen in a file

<<comment
mkdir -p /temp/newfolder
inotifywait -m /temp/newfolder
comment

#############

# grep -i word_we_wanna_find filename (-i for case sensitive , -n for line number , -c for count word and -v for searchng all of the things except the seected word)

##############

# awk

<<comment

awk '/linux/ {print $3,$4}' $filename
the bottom command will print the lines that have linux in them and actually print the 3 and 4 columns in the text (linux ubuntu 2000 vmlinux) will print 2000 and vmlinux


# sed
sed 's/i/I/g' $filename # this will change all of the small i to capital I and change all of them because global (g) , we can actually change the word to another word.
sed -i will modified our file and we can change
comment

# we can debug our bash script with => bash -x ./filename.sh

