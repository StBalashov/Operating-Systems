#!/bin/bash
echo "" > temp.txt
for pid in $(ps -e -o pid | tail -n +2)
do
     cat "/proc/$pid/statm" | awk '{printf "* "; print $3 - $2}' | sed "s/*/${pid}/" | awk '{printf $1; printf " : "; print $2}' >> temp.txt
done

cat temp.txt | sort -nrk3 > lab3.4_ans.tmp

