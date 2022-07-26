#! /bin/bash

load=$(cat /proc/loadavg | awk '{print $1}')
cpu=1
check=$(echo $load '>' $cpu | bc -l )
if (( $check == 1 ))
then
	echo "Alert , Alert , please check the system"
else
 	echo "Load Average is good"
fi

echo $load
