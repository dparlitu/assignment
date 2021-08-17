#!/bin/bash

# start loop until input value is 'exit'

# wget output file
file=./downloads/malwareurl.csv

url=https://urlhaus.abuse.ch/downloads/csv_recent/

echo "Downloading file..."

# download in quiet mode
wget -q $url -O $file

wgetval=$?

if [ $wgetval -eq 0 ]; then
    
    # prepare the file
    # remove quotations marks, lines starting with hashtag and the header
    # save cleaned file to new text file
    sed 's/"//g;/^#/d;/^f/d' ./downloads/malwareurl.csv > ./downloads/malwareurl.txt

    echo "File malwareurl.csv successfully downloaded to ./downloads folder."
    echo
    
else
    echo "Download Failure!"
    exit 1
fi

