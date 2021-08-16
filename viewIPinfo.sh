#!/bin/bash

# this script will check details of an IP address using ipinfo.io api

# capture IP address
read -p "Enter IP Address to check: " ip

# query IP details quiet 
wget -q "https://ipinfo.io/"$ip -O ./downloads/ipinfo.txt

# remove empty lines, change fist letter to uppercase, remove white space, special characters and last readme line
sed -i 's/^[ \t]*//; s/\b\(.\)/\u\1/; s/{//g; s/}//g; s/"//g; s/,//g; s/: /:/g; s/Ip/IP/; /^$/d; /Readme/c\' ./downloads/ipinfo.txt

echo
echo -e "Details supplied by ipinfo.io website:"
echo

awk 'BEGIN {
    FS=":";
    print "+========================================================+";
    print "| \033[34mProperty\033[0m    | \033[34mDetails\033[0m                                  |";
    print "+========================================================+";
}
{
    printf("| \033[33m%-11s\033[0m | \033[35m%-40s\033[0m |\n", $1, $2);
}
END {
    print("==========================================================");
}' ./downloads/ipinfo.txt
echo

exit 0