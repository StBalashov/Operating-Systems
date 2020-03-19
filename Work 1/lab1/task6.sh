 #!/bin/bash

if [[ "$HOME" == "$PWD" ]]

    then echo "$HOME"
    exit 0

fi

if [[ "$HOME" != "$PWD" ]]

    then echo "ERROR: script was runned not from home directory"
    exit 1

fi
