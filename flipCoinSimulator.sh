#!/bin/bash -x
echo "WELCOME TO FLIP COIN SIMULATOR"

declare -A coins
#variables
headscount=0
tailscount=0
read -p "How many times you want to flip the coin " times
function Singlet () 
{
	for((i=1;i<=$times;i++))
	do
		if [ $((RANDOM%2)) -eq 1 ]
		then
			coins[H]=$((++headscount))
		else
			coins[T]=$((++tailscount))
		fi
	done
	echo "Keys  " ${!coins[@]}
	echo "Count " ${coins[@]}
	echo "Percentage of Heads headsPercentage=`echo "scale=2;${coins[H]}*100/$times" | bc`%"
	echo "Percentage of Tails tailsPercentage=`echo "scale=2;${coins[T]}*100/$times" | bc`%"

}
Singlet

