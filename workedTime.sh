#!/bin/bash
# written by khalil meguenni, Wed, 27 Jun 2018 21:27:18

if [ $# -eq 4 ]
then
	((startHoure = $1))
	((startMin = $2))
	((endHoure = $3))
	((endMin = $4))


	if [ $endMin -lt $startMin ]
	then
		((endMin += 60))
		((endHoure -= 1))
	fi

	((workedHoures = $endHoure - $startHoure))
	((workedMin = $endMin - $startMin))
	if [ $workedHoures -lt 0 ]
	then 
		((workedHoures += 24))
	fi
	echo -e "worked Time = $workedHoures h: $workedMin min"
else
	echo -e "Not enough parameters, 4 parameters (start Houre, start Minute, end Houre, end Minute) was needed"
fi


read -r -p "Do you want to add this worked time to a previous one? [y/N] " addResponse

case "$addResponse" in [yY][eE][sS]|[yY])

        read -p "Enter the worked houres followed by the worked Minutes (ex: 12 35) " addedWorkedHoures addedWorkedMin
        if ! [[ "$addedWorkedHoures" =~ ^[0-9]+$ ]] || ! [[ "$addedWorkedMin" =~ ^[0-9]+$ ]]
    	then
        	echo "Enter numbers only (ex: 12 35)"
        	exit 1 
		fi

        ((TotalMinutes = $workedMin + $addedWorkedMin))

        ((houresPerMins = 0))
        if [[ $TotalMinutes -gt 59 ]]
        then
        	((houresPerMins = $TotalMinutes / 60))
        	((TotalMinutes = $TotalMinutes - (60 * $houresPerMins)))
        fi
        ((TotalHoures = $workedHoures + $addedWorkedHoures + $houresPerMins))
        echo -e "Total worked Time = $TotalHoures h: $TotalMinutes min"
        ;;
    *)
        ;;
esac