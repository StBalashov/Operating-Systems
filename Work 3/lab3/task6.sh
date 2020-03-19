#!/bin/bash

ppid=0
sleepavg=0
count=0

b=""

while read a
do
    if [[ -n $a ]]; then
        newppid=$(echo $a | grep -Ehsio "Parent_ProcessID=[0-9]+" | grep -o "[0-9]\+")
        newsleepavg=$(echo $a | grep -Ehsio "Average_Sleeping_Time=[0-9.]+" | grep -o "[0-9.]\+" | awk '{printf("%s",$1)}')

        if [[ $ppid == $newppid ]]
        then sleepavg=$(echo "$sleepavg+$newsleepavg" | bc -l -q)
            count=$(echo "$count+1" | bc -l -q)
        else
            sleepavg=$(echo "$sleepavg/$count" | bc -l -q)
            if [[ -n $b ]]
            then
                b=$b"Average_Sleeping_Children_of_ParentID="$ppid" is "$sleepavg$'\n'
            fi
            sleepavg=$newsleepavg
            ppid=$newppid
            count=1
        fi
        
        b=$b$a$'\n'
    fi
done < lab3.5_ans.tmp

sleepavg=$(echo "$sleepavg/$count" | bc -l -q)
if [[ -n $b ]]
then
    b=$b"Average_Sleeping_Children_of_ParentID="$ppid" is "$sleepavg$'\n'
fi

echo "$b" > lab3.6_ans.tmp
cat lab3.6_ans.tmp

exit
