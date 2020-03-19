#!/bin/bash

#-r рекурсивный обход 
#-h подавляет вывод имени файла 
#-s ничего не выводит в консоль
grep -r -h -s "ACPI" /var/log/ > errors.log 

grep  -E "/[A-Za-z0-9_-@]+\.[A-Za-z][A-Za-z0-9_\]+" errors.log

exit
