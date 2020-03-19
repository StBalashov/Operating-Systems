#!/bin/bash

#checking parameters
if [ $# -ne 1 ]; then
    echo "Wrong number of parameters"
    exit 1
fi
restFile=$PWD/$1

#cycle through trash.log file
for i in $(grep -h $1 $HOME/trash.log)
do
    glPath=$(echo $i | awk -F ":" '{print $1}')
    trFile=$(echo $i | awk -F ":" '{print $2}')
    
    #we found file note at trash.log
    if [[ $restFile == $glPath ]]; then
        
	#this file has hard link at .trash directory
        rmFile=$HOME/.trash/$trFile

        #if so - ask user
        if [ -e $rmFile ]; then
            echo "Press Y to restore file - $glPath ?"
            read answer
            if [[ $answer == "Y" ]]; then

                #if directory of deleted file exists
                if [ -d $(dirname $glPath) ]; then

                    #checking if we have file with same name
                    if [[ -e $glPath ]]; then
                        echo "File with this name already exists"
                        echo "New file name..."
                        read newName

                        #create hard link with new name
                        ln "$rmFile" "$(dirname $glPath)/$newName"
                    else
                        #create hard link
                        ln $rmFile $glPath
                    fi
                #If directory was deleted - creating link at $HOME
                else
                    echo "$(dirname $glPath) has been removed!"
                    ln $rmFile $HOME/$1
                fi
                rm $rmFile
      
	        #update trash.log
                grep -v $trFile $HOME/trash.log > $HOME/trash0.log
                mv $HOME/trash0.log $HOME/trash.log
                exit 0
            fi
        fi
    fi
done
echo "Cannot restore such file"
exit 1
