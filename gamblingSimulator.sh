#!/bin/bash -x
printf "Gamble once\n"
#CONSTANT
BET=1
WIN=1
LOSE=0
#VARIABLES
stake=100
#GAMBLE
gamble=$((RANDOM%2))
if(($gamble==$WIN))
then
	printf "won"
	stake=$((stake+BET))
else
	printf "lost"
	stake=$((stake-BET))
fi
