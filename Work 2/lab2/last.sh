#!/bin/bash

sudo find /var/log -type f > list.txt
grep -n -E "/pm/" list.txt
#head -n -2 list.txt >> list.txt
head -n -2 list.txt > temp.txt ; mv temp.txt list.txt
