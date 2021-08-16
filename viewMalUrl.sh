#!/bin/bash

# display date/ time to show the report was ...
now=$(date +"%T")

# check if data has been downloaded first
if [ ! -f "./downloads/malwareurl.txt" ]; then
    echo "Please download the Malware URL list first!"
    exit 1
fi





awk -F',' 'BEGIN {  
                    print"|======================|=========================|=========|=========|"
                    print"| FIRST SEEN           | DESTINATION IP:PORT     | STATUS  | MALWARE |"
                    print"|======================|=========================|=========|=========|" }
                { printf "| %20s | \033[33m%15s\033[0m | %-6s | %-7s | \033[31m%s\033[0m\n", $2, $3, $4, $5, $6 }' ./downloads/malwareurl.txt

echo "|====================================================================|"
echo "| Report Generated : $now"
echo "|====================================================================|"

echo

# call the main menu as the user won't see the options due to the lenght of the report
#./menu.sh


# https://unix.stackexchange.com/questions/283407/can-sed-save-its-output-to-a-file
# https://stackoverflow.com/questions/7657647/combining-two-sed-commands