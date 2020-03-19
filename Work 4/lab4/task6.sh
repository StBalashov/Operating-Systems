#!/bin/bash

echo $$ > testfile6.txt

number=1
mod="run"

term() {
    mod="stop"
}

trap 'term' SIGTERM

while [[ true ]]
do    
    case $mod in
    "run" )
        echo $number
        number=$(( $number + 1 ))
    ;;
    "stop" )
        echo "Got SIGTERM signal"
        exit
    ;;
    esac
done

exit
