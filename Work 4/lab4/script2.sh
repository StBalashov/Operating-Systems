#!/bin/bash


at -f script1.sh now + 1 minutes
tail -n 0 -f ~/report.tmp

exit    
