# WorkedTime

This script was written on a linux OS machine, I used it when I was working for a web agency 32h/month.
It may helps you in calculating your worked time.
To use this bash script you need to pass 4 parameters: the start-time(h & min) and the end-time(h & min), separting the houres from the minutes with a space, for example if I start working at 13:45 and finshed at 18:36, all what I need, is to call the script in this way:

console:
$ ./workedTime.sh 13 45 18 36

then it will print your exact time of work:

console:
$ worked Time = 4 h: 51 min

After that it will ask if you want to add this calculated time to another one (already calculated, 4h 37min for exapmle), if you response positively, then it will ask you to give that calculated time (2 parameters):

console:
Do you want to add this worked time to a previous one? [y/N] y
Enter the worked houres followed by the worked Minutes (ex: 12 35) 4 37

and then it will show you your total time:

console:
Total worked Time = 9 h: 28 min

