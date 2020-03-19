#!/bin/bash

status=""

for pid in $(ps -eo pid | tail -n +2)
do
    pidStatus="/proc/"$pid"/status"
    file="/proc/"$pid"/sched"
    ppid=$(grep -Ehsi "ppid:\s(.+)" $pidStatus | grep -o "[0-9]\+")
    sleepavg=$(grep -Ehsi "avg_atom(.+)" $file | grep -o "[0-9.]\+")
    if [[ -z $sleepavg ]]
       then sleepavg=0
    fi
    
    if [[ $ppid != "" ]]
        then status=$status"ProcessID="$pid" : Parent_ProcessID="$ppid": Average_Sleeping_Time="$sleepavg$'\n'
    fi

done

echo "$status" | sort -t " " -k2 > lab3.5_ans.tmp
