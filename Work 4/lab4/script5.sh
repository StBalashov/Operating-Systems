#!/bin/bash

>testfile5.txt

while true; do
    read LINE
    echo "$LINE" >> testfile5.txt
    if [[ "$LINE" == "QUIT" ]]
    then
	exit

    fi
done
