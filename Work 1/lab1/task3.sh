 #!/bin/bash

res=""
c=""

while [[ "$c" != "q" ]]
do
    res="$res$c"
    read c
done

echo "$res"
exit
