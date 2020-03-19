#!/bin/bash

echo $$ > testfile7.txt

number=1
mod="add"

add() {
    mod="add"
}

mul() {
    mod="mul"
}

term() {
    mod="stop"
}

eval() {
    case $mod in
    "add" )
        number=$(($number+2))
    ;;
    "mul" )
        number=$(($number*2))
    ;;        
    esac
}

trap 'add' USR1
trap 'mul' USR2
trap 'term' SIGTERM

while [[ true ]]
do    
    case $mod in
    "stop" )
        echo "Got SIGTERM signal"
        exit
    ;;
    * )
        eval
        echo $number
    ;;
    esac

    sleep 1
done

exit
