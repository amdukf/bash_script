#! /bin/bash

cpu=$(cat /proc/cpuinfo | grep -c processor)
mem=$(free -h | awk 'NR == 2 {print $2}')
swap=$(free -h | awk 'NR == 3 {print $2}')

options=("number_of_cpu_processors" "memory_size" "swap size")


select option in "${options[@]}"
do
	case $option in
		"number_of_cpu_processors" )
			echo $cpu	
			;;
		"memory_size" )
			echo $mem
			;;
		"swap size" )
			echo $swap
			;;
	esac
done
