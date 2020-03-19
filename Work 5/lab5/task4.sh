#!/bin/bash

home="$HOME"
backupFolders=$(ls $home/*/ | grep -o -E "Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}")

lastBackupFolder="$home/$(echo "$backupFolders" | tail -1)"

if [[ ! -d "$lastBackupFolder" ]]
then
  	echo "Backup folders not found"
  	exit
fi

restoreFolder="$home/restore/"
if [[ ! -d "$restoreFolder" ]]
then
  	mkdir "$restoreFolder"
fi

cd "$lastBackupFolder"
files=$(find . -type f | grep -E -v ".[0-9]{4}-[0-9]{2}-[0-9]{2}")
echo "$files" | while read f
do
  	cp --parents "$f" "$restoreFolder/"
done

