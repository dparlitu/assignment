#!/bin/bash

# check if the hash file already exists
# if hash file exists then save password to a text file to be checked against the hash 
# otherwise create the hash for the script to use
if [ -f secret ]; then

    # ask user for his existing password; that will be checked against existing hash
    read -sp "$(echo -e "\033[34mPlease enter the Password:\e[0m ")" pwd

    # save password to file
    echo $pwd > password
else

    # ask user for a new password password
    read -sp "$(echo -e "\e[33mPlease choose a NEW Password:\e[0m ")" pwd

    # save password to file
    echo $pwd > password

    # create hash for password file
    sha256sum password > secret
fi

# clean up a bit the feedback window with an empty line
echo

# if the result from checking the hash is a failure, show deny message and exit with 1 otherwise show message with access granted and exit with 0
if [ "$(sha256sum -c secret)" == "password: FAILED" ]; then
    echo -e "\033[31mAccess Denied!\e[0m"
    echo
    # clear stored password for security purposes
    echo "" > password
    exit 1
else
    echo
    echo -e "\033[32mAccess Granted!\e[0m"
    echo

    # clear stored password for security purposes
    echo "" > password
    exit 0
fi
