 #!/bin/bash

ps -U hum -o pid,command | tail -n +2 | awk '{print $1 ":" $2}' > lab3.1_ans.tmp 
wc -l lab3.1_ans.tmp

