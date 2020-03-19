#!/bin/bash

while [[ true ]]
do
    read line
    
    case $line in
    "+" )
        kill -USR1 $(cat testfile7.txt)  
    ;;
    "*" )
        kill -USR2 $(cat testfile7.txt)  
    ;;
    "TERM" )
        kill -SIGTERM $(cat testfile7.txt)
        exit
    ;;
    esac
done

exit



