#!/bin/bash

# this is the main menu for running all the scripts

# open passwordCheck script to check for password
./passwordCheck.sh

# if exit status from the password check script returns 0 then display the menu
if [ $? = 0 ]; then
    echo
    echo -e "\033[1m \033[34m  === Main Menu ===\e[0m"
    
    export PS3=$'\033[33mPlease choose an option or press Enter to see the Menu:\e[0m '

    options=("Download Botnet C2 IP Blocklist" "View Botnet C2 IP Blocklist" "Download Malware URL List" "View Malware URL List" "View Linear Regression Graph" "View IP Info" "Change Password" "Quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "Download Botnet C2 IP Blocklist")
                ./downloadIPblock.sh
                ;;
            "View Botnet C2 IP Blocklist")
                ./viewIPblock.py
                ;;
            "Download Malware URL List")
                ./downloadMalURL.sh
                ;;
            "View Malware URL List")
                ./viewMalUrl.py
                ;;
            "View Linear Regression Graph")
                ./viewgraph.sh
                ;;
            "View IP Info")
                ./viewIPinfo.sh
                ;;
            "Change Password")
                ./changePassword.sh
                ;;
            "Quit")
                echo
                echo "Goodbye!"
                echo
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
fi
