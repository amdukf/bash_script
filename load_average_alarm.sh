#! /bin/bash

load=$(cat /proc/loadavg | awk '{print $1}')
#cpu=1 # or you can use this instead of command that write in line 5 , for set the limit manual due to your system processor number 
cpu=$(cat /proc/cpuinfo | grep -c processor)
check=$(echo $load '>' $cpu | bc -l )
if (( $check == 1 ))
then
	echo "Alert , Alert , please check the system"
else
 	echo "Load Average is good"
fi

echo $load
