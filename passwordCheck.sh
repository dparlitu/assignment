#!/bin/bash

# this script will check existing password or create a new one if no hash file exists

# This function will check the password complexity
checkPassword()
{
len="${#1}"
    if test $len -ge 8 ; then
        echo "$1" | grep -q [0-9]
            if test $? -eq 0 ; then
                echo "$1" | grep -q [A-Z]
                    if test $? -eq 0 ; then
                        echo "$1" | grep -q [a-z]
                            if test $? -eq 0 ; then
                                echo "$1" | grep -q [!,$,@,'#',%,*,+,-]
                                    if test $? -eq 0 ; then
                                        echo "Strong password"
                                    else
                                        echo -e "\033[35mWeak password. Please include a special character.\e[0m"
                                        return 1
                                    fi
                            else
                                echo -e "\033[35mWeak password. Please include Lower case character.\e[0m"
                                return 1
                            fi
                    else
                        echo -e "\033[35mWeak password. Please include Uppercase letter.\e[0m"
                        return 1
                    fi
            else
                echo -e "\033[35mWeak password. Please include a number.\e[0m"
                return 1
            fi
    else
        echo -e "\033[35mPassword should be greater than or equal to 8 in lenght\e[0m"
        return 1
    fi
}

# check if the hash file already exists
# if hash file exists then save password to a text file to be checked against the hash 
# otherwise create the hash for the script to use
if [ -f secret ]; then

    # ask user for his existing password; that will be checked against existing hash
    read -sp "$(echo -e "\033[34mPlease enter the Password:\e[0m ")" pwd

    # save password to file
    echo $pwd > password
else

    # capture and save password hash
    read -sp 'Please choose a New password: ' newpassword
    echo
    read -sp 'Please re-type New password: ' newpassword2
    echo

    if [ $newpassword == $newpassword2 ]; then

        if checkPassword $newpassword; then

            # save password to file
            echo $newpassword > password
            # create hash for password file
            sha256sum password > secret
            # clear stored password for security purposes
            echo "" > password
            echo
            echo -e "\033[32mPassword succesfully created!\e[0m"
            echo
            exit 0
        else
            echo
            echo -e "\033[31mPassword NOT set!\e[0m"
            echo
            exit 1
        fi
    else
        echo
        echo -e "\033[31mPassword doesn't match! Password NOT created!\e[0m"
        echo
        exit 1
    fi
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
