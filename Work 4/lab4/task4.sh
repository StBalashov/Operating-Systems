#!/bin/bash

nice -n 6 ./script4.sh&

nice -n 0 ./script4.sh&

nice -n 4 ./script4.sh&

nice -n 3 ./script4.sh&

nice -n 2 ./script4.sh&


top 
