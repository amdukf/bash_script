#! /bin/bash

#load=$(uptime | awk '{print $9}' | cut -d "," -f 1)
#if (( "$load" >  0.03 ))
#then
#	echo "Alert , Alert"
#else
#	echo "good"
#fi
#
#echo $load

load=$(uptime | awk '{print $9}' | cut -d "," -f 1)
cpu=0.5
check=$(echo $load '>' $cpu | bc -l )
if (( $check == 1 ))
then
	echo "Alert , Alert , please check the system"
else
 	echo "Load Average is good"
fi

echo $load
