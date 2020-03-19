 #!/bin/bash

read number
count=1

while (( $number % 2 != 0 ))

do
    let count=$count+1
    read number
done

echo "$count"
