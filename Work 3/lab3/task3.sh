#!/bin/bash

for pid in $(ps -e -o pid | tail -n +2)
do
	readlink /proc/$pid/exe | grep "/sbin" | awk '{print $pid}' >> lab3.3_ans.tmp

done
