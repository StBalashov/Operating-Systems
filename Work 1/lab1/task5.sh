#!/bin/bash

echo "Please, choose the option:"
echo " Enter 1 to open vi"
echo " Enter 2 to open nano"
echo " Enter 3 to open browser"
echo "or something other to exit."

read -r item

case $item in
    1)
        echo "Opening vi..."
        vi
        ;;
    2)
        echo "Opening nano..."
        nano
        ;;
    3)
        echo "Opening browser..."
        firefox
        ;;
    *)
        echo "Exiting..."
esac
