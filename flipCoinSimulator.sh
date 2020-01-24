echo "WELCOME TO FLIP COIN SIMULATOR"

if [ $((RANDOM%2)) -eq 1 ]
then
	echo Heads
else
	echo Tails
fi
