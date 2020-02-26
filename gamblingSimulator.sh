#!/bin/bash -x
printf "Gamble till half stake remains or increases\n"
#CONSTANT
BET=1
WIN=1
LOSE=0
#VARIABLES
stake=100
stop=$((stake/2))
goal=$((stake+stop))
#GAMBLE
while (( $stake>$stop && $stake<$goal ))
do
	gamble=$((RANDOM%2))
	if(($gamble==$WIN))
	then
		printf "won"
		stake=$((stake+BET))
	else
		printf "lost"
		stake=$((stake-BET))
	fi
done
