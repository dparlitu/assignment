#!/bin/bash

# check if data has been downloaded first
if [ ! -f "./downloads/ipblocklist.csv" ]; then
    echo "Please download the IP blocklist first!"
    exit 1
fi

# display date/ time to show when the report was ran
now=$(date +"%T")

# remove quotations marks, lines starting with hashtag and the header
# save cleaned file to new text file
sed 's/"//g;/^#/d;/^f/d' ./downloads/ipblocklist.csv > ./downloads/ipblocklist.txt

awk -F',' 'BEGIN {  
                    print"|======================|=========================|=========|=========|"
                    print"| FIRST SEEN           | DESTINATION IP:PORT     | STATUS  | MALWARE |"
                    print"|======================|=========================|=========|=========|" }
                { printf "| %20s | \033[33m%15s\033[0m :\033[34m%-6s\033[0m | %-7s | \033[31m%s\033[0m\n", $1, $2, $3, $4, $6 }' ./downloads/ipblocklist.txt

echo "|====================================================================|"
echo "| Report Generated : $now"
echo "|====================================================================|"

echo
