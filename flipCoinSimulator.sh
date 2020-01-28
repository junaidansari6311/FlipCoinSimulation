#!/bin/bash -x
echo "WELCOME TO FLIP COIN SIMULATOR"
#dictionary
declare -A coins
read -p "How many times you want to flip the coin ? " noOfFlips
read -p "Enter your choice 1:Single Coin  2:Double Coin 3:Triple Coin " choice
function flipCoin () {
	for((i=1;i<=$1;i++))
	do
		coinSide=""
		for((j=1;j<=$2;j++))
		do
			if [ $((RANDOM%2)) -eq 1 ]
			then
				coinSide+=H
			else
				coinSide+=T
			fi
		done
		countUpdate $coinSide
	done
}

function countUpdate () {
	coins[$1]=$((${coins[$1]}+1))
}

function calculatePercentage () {
	for i in ${!coins[@]}
	do
		coins[$i]=`echo "scale=2;${coins[$i]}*100/$noOfFlips" | bc`
	done
	echo "Keys" ${!coins[@]}
	echo "Percentage" ${coins[@]}
}
function winningCombination () {
	echo "Wining Combination Percentage"
		for i in ${!coins[@]}
		do
			echo "$i ${coins[$i]}"
		done | sort -k2 -rn | head -1
}

case $choice in
	1)
		noOfCoin=1
		flipCoin $noOfFlips $noOfCoin
		calculatePercentage
		winningCombination
		;;
	2)
		noOfCoin=2
		flipCoin $noOfFlips $noOfCoin
		calculatePercentage
		winningCombination
		;;
	3)
		noOfCoin=3
		flipCoin $noOfFlips $noOfCoin
		calculatePercentage
		winningCombination
		;;
	*)
		echo "Invalid Choice"
		;;
esac

