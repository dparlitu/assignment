#!/bin/bash

# display time
now=$(date +"%T")

# check if data has been downloaded first
if [ ! -f "./downloads/malwareurl.txt" ]; then
    echo "Please download the Malware URL list first!"
    exit 1
fi

# format data to display
awk -F',' 'BEGIN {  
                    print"|======================|=========================|=========|=========|"
                    print"| FIRST SEEN           | DESTINATION IP:PORT     | STATUS  | MALWARE |"
                    print"|======================|=========================|=========|=========|" }
                { printf "| %20s | \033[33m%15s\033[0m | %-6s | %-7s | \033[31m%s\033[0m\n", $2, $3, $4, $5, $6 }' ./downloads/malwareurl.txt

echo "|====================================================================|"
echo "| Report Generated : $now"
echo "|====================================================================|"

echo
