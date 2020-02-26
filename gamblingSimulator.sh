#!/bin/bash -x
printf "Calculate daily won lose stake\n"
#CONSTANT
BET=1
WIN=1
LOSE=0
#VARIABLES
won=0
lost=0
days=20
#GAMBLE
while(( $days>0))
do
	tempWon=$won
	tempLost=$lost
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
winsDayEnd=$((won-tempWon))
printf "Today's winnig: $winsDayEnd\n"
lostDayEnd=$((lost-tempLost))
printf "Taday's lost: $lostDayEnd\n"
days=$((days-1))
done

