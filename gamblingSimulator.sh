#!/bin/bash -x
printf "Calculate month end is positive then continue the game else leave\n"
#CONSTANT
BET=1
WIN=1
LOSE=0
#VARIABLES
monthEnd=100
countMonth=0

#CONTINUE IF MONTHEND STAKE IS POSITIVE ELSE LEAVE THE GAME
while((monthEnd>0))
do
	countMonth=$((countMonth+1))
	#VARIABLES IN LOOP
	luckyDay=0
	unluckyDay=0
	winDayEnd=0
	lostDayEnd=0
	won=0
	lost=0
	days=30
	count=0
	maxWin=0
	maxLose=0
	#GAMBLE FOR 20 DAYS
	while(( $days>0))
	do
		stake=100
		tempStake=$stake
		stop=$((stake/2))
		goal=$((stake+stop))
		#GAMBLE PER DAY
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
		#CALCULATING WINS AND LOSTS PER DAY AND STORE IT IN ARRAY
		if(($stake>$tempStake))
		then
			winDayEnd=50
			array[$count]=$winDayEnd
		else
			lostDayEnd=-50
			array[$count]=$lostDayEnd
		fi
		count=$((count+1))
		days=$((days-1))
	done
	sum=0
	#CALCULATING LUCKIEST AND UNLUCKIEST DAY
	for((day=0; day<20; day++))
	do
		sum=$(($sum+"${array[$day]}"))
		#CHECK THE MAXIMUM CONTINUOUS WIN AND CONSIDER IT AS LUCKIEST DAY
		if(($maxWin<=$sum))
		then
			maxWin=$sum
			luckyDay=$((day+1))
		fi
		#CHECK THE MAXIMUM CONTINUOUS LOST AND CONSIDER IT AS UNLUCKIEST DAY
		if(($maxLose>=$sum))
   	then
      	maxLose=$sum
      	unluckyDay=$((day+1))
   	fi
	done
	monthEnd=${array[29]}
	printf "Luckiest day: $luckyDay, Wins: $maxWin\n"
	printf "unluckiest day: $unluckyDay, Wins: $maxLose\n"
done
printf "You are in lost this month\n"
printf "You played for $countMonth months\n"
