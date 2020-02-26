#!/bin/bash -x
printf "Gamble till 20 days\n"
#CONSTANT
BET=10
WIN=1
LOSE=0
#VARIABLES
won=0
lost=0
days=20
#GAMBLE
while(( $days>0))
do
	stake=100
	stop=$((stake/2))
	goal=$((stake+stop))
	while (( $stake>$stop && $stake<$goal))
	do
		gamble=$((RANDOM%2))
		if(($gamble==$WIN))
		then
			won=$((won+1))
			stake=$((stake+BET))
		else
			lost=$((lost+1))
			stake=$((stake-BET))
		fi
	done
days=$((days-1))
done

