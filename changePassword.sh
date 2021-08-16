#!/bin/bash

# this script will change existing password

# capture and save password hash
read -sp 'Please choose a New password: ' newpassword
echo
read -sp 'Please re-type your password: ' newpassword2

if [ $newpassword == $newpassword2 ]; then

    # save password to file
    echo $password > password

    # create hash for password file
    sha256sum password > secret
    # clear stored password for security purposes
    echo "" > password

    echo
    echo -e "\033[32mPassword succesfully changed!\e[0m"
    echo

    exit 0

else

    echo
    echo -e "\033[31mPassword doesn't match! Password NOT changed!\e[0m"
    echo

    exit 1

fi
