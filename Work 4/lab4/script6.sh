#!/bin/bash

while [[ true ]]
do
    read line

    if [[ $line == "TERM" ]]; then
        kill -SIGTERM $(cat testfile6.txt)
        exit
    fi
done

exit
