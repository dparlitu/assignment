#!/bin/bash

# check if data has been downloaded first
if [ ! -f "./downloads/malwareurl.txt" ]; then
    echo "Please download the Malware URL list first!"
    exit 1
fi

# prepare data for graph by keeping the Date column only
# only interested in the number of occurances for every Date
awk '{ print $1 }' ./downloads/malwareurl.txt | awk -F',' '{ print $2 }' > ./downloads/graphtemp.txt

# sort and count the repetition of dates to get the number of daily discovered URLs
awk '{!seen[$0]++}END{for (i in seen) print i,","seen[i]}' ./downloads/graphtemp.txt | sort -n > ./downloads/graphtemp.csv

# add column with ascending numbers to be used by the graph
awk '{print NR  "," $s}' ./downloads/graphtemp.csv > ./downloads/graphdata.csv

# clean up temp files
rm ./downloads/graphtemp.txt
rm ./downloads/graphtemp.csv

# open graph
./viewgraph.py