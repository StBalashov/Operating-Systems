#!/bin/bash

home="$HOME"

sourceFolder="$home/source"
if [[ ! -d "$sourceFolder" ]]; then
	echo "Folder source doesn't exists"
	exit
fi

backupFolders=$(ls $home/*/ | grep -o -E "Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}")

lastBackupDateInSeconds=0
lastBackupFolder=""

if [[ $backupFolders ]]; then
  	lastBackupFolder=$(echo "$backupFolders" | tail -1)
  	lastBackupDate=$(echo "$lastBackupFolder" | grep -o -E "[0-9]{4}-[0-9]{2}-[0-9]{2}")
  	lastBackupDateInSeconds=$(date -d $lastBackupDate +%s)
fi

currentDate=`date +%Y-%m-%d`
currentDateInSeconds=$(date -d $currentDate +%s)

backupFolder=""
newFolderFlag=false

if [[ $currentDateInSeconds -gt $lastBackupDateInSeconds+7*24*60*60 ]]; then
  	backupFolder="$home/Backup-$currentDate"
  	mkdir $backupFolder
  	newFolderFlag=true
else
  	backupFolder="$home/$lastBackupFolder"
fi

report="$home/backup-report"

cd "$sourceFolder"

files=$(find . -type f)

echo "Backup created at $currentDate" >> $report
if [[ $newFolderFlag == true ]]; then
	echo "$files" | while read filename
		do
    		cp --parents "$filename" "$backupFolder/"
    		echo "$filename" >> $report
  		done
else
	echo "$files" | while read filename
	do
    	if [[ -e "$backupFolder/$filename" ]]; then
    		oldFileSize=$(stat -c%s "$backupFolder/$filename")
    		newFileSize=$(stat -c%s "$sourceFolder/$filename")
      
    		if [[ $oldFileSize -ne $newFileSize ]]; then
    			mv "$backupFolder/$filename" "$backupFolder/$filename.$currentDate"
   				cp "$sourceFolder/$filename" "$backupFolder/$filename"
        
   				echo "$filename $filename.$currentDate $currentDate" >> $report
   				echo "$filename $backupFolder at $currentDate" >> $report
      		fi
    	else
          	cp --parents "$filename" "$backupFolder/"
          	echo "$filename" >> $report
  		fi
  	done
fi

exit
