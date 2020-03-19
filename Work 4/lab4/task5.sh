#!/bin/bash

number=1
mod="+"

(tail -n 0 -f "testfile5.txt") |
while [[ true ]]
do
    read line
    
    case $line in
    "+" )
        mod="+"
    ;;
    "*" )
        mod="*"
    ;;
    "QUIT" )
        exit
    ;;
    * )
        case $mod in
        "+" )
            number=$(( $number+$line ))
        ;;
        "*" )
            number=$(( $number*$line ))
        ;;
        * )
            echo "Error"
            exit
        ;;  
        esac
        
        echo $number
    ;;
    esac
done

exit

