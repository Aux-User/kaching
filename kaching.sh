#!/bin/bash

#This script is a personal interest script that I created to generate 4D and Toto numbers in bash.
#This is a "version 2" so to speak, of my initual huat.sh that only does 4D numbers.
#Disclaimer: This is only for leisure and exercise in coding and not meant to encourage gambling.

function fourdfx
{
DALL=$(shuf -i 0-9 -n 4)
echo "$DALL" | tr -d '\n'
#This is to delete the line breaks so that the 4 numbers can be read horizontally as a single set of 4.
echo ' '
}

function 4dsets
{
for EACHLINE in $SETNUMB
	do 
		fourdfx
	done
}

function totofx
{
TOTONUMS=$(shuf -i 1-49 -n $BETTYPE)
echo "$TOTONUMS" > totoraw.txt
cat totoraw.txt | sort -n | tr '\n' ' '
#This is to change line breaks to spaces so that each set of numbers maybe read horizontally.
echo ' '
}


function totosets
{
for EACHLINE in $SETNUMB
	do 
		totofx
	done
}



echo 'Welcome Punter! Which game do you wish to try for today?
Press:
1 for 4D
2 for Toto'

read GAMETYPE

if [ $GAMETYPE == 1 ]
	then echo 'You have selected 4D. How many sets would you like to generate?'
		read FOURDSET
		SETNUMB=$(seq $FOURDSET)
		echo "You have requested $FOURDSET sets of 4D numbers. Here they are:"
		4dsets
		echo 'Good luck!'

elif [ $GAMETYPE == 2 ]
	then echo 'Which Bet Type would you like? Please enter number in parenthesis.
(6) Numbers - Ordinary
(7) Numbers - System 7
(8) Numbers - System 8
(9) Numbers - System 9
(10) Numbers - System 10
(11) Numbers - System 11
(12) Numbers - System 12'
		read BETTYPE
		if [ $BETTYPE -ge 6 ] && [ $BETTYPE -le 12 ]
			then
				echo 'How many sets would you like to generate?'
				read TOTOSET
				SETNUMB=$(seq $TOTOSET)
				echo "You have requested $TOTOSET sets of $BETTYPE numbers. Here they are:"
				totosets
				echo 'Good luck!'	
				rm totoraw.txt
			else
				echo 'That is an invalid bet type.'
		fi

else
	echo 'Invalid Option. Please press:
1 for 4D
2 for Toto'
fi


