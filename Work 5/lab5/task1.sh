#!/bin/bash
scriptName=$1

#checking directory
if [ ! -e $PWD/$1 ]; then
    echo "No such file in the directory"
    exit 1
fi

homeTrash=$HOME/.trash
homeLog=$HOME/trash.log

#checking parameters
if [ $# -ne 1 ]; then
    echo "Wrong number of parameters"
    exit 1
fi

#creating dir if necessary
if [ ! -d $homeTrash ]; then
    mkdir $homeTrash
fi

#unique name - date in seconds
currentTrashFile=$(date +%s)
ln $scriptName "$homeTrash/$currentTrashFile"
rm $scriptName

#changing time of last update
if [ ! -e $homeLog ]; then
    touch $homeLog
fi

#adding note at trash.log
echo "$PWD/$scriptName:$currentTrashFile" >> $homeLog
