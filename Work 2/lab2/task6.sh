#!/bin/bash
#sudo cat /var/log/*.log | wc -l
sudo find /var/log/ -name ".log" | wc -l
