 #!/bin/bash

max=$1
b=$2
c=$3

if [[ "$b" -ge "$max" ]]
then max=$b
fi

if [[ "$c" -ge "$max" ]]
then max=$c
fi

echo "$max"
exit


