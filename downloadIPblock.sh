#!/bin/bash

# this script will download a csv file to downloads folder

# wget output file
file=./downloads/ipblocklist.csv

url=https://feodotracker.abuse.ch/downloads/ipblocklist.csv

echo "Downloading file..."

# download file in quiet mode
wget -q $url -O $file

wgetval=$?

# display feedback to user
if [ $wgetval -eq 0 ]; then
    echo "File ipblocklist.csv successfully downloaded to ./downloads folder."
    echo
    
else
    echo "Download Failure!"
    exit 1
fi