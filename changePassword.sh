#!/bin/bash

# this script will change existing password

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
                                        echo -e "\033[35mWeak password include special characters\e[0m"
                                        return 1
                                    fi
                            else
                                echo -e "\033[35mWeak password include Lower case character\e[0m"
                                return 1
                            fi
                    else
                        echo -e "\033[35mWeak password include Capital character\e[0m"
                        return 1
                    fi
            else
                echo -e "\033[35mPlease include at least a number in your password\e[0m"
                return 1
            fi
    else
        echo -e "\033[35mPassword length should be greater than or equal 8 hence weak password\e[0m"
        return 1
    fi
}

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
        echo -e "\033[32mPassword succesfully changed!\e[0m"
        echo
        exit 0
    else
        echo
        echo -e "\033[31mPassword NOT changed!\e[0m"
        echo
        exit 1
    fi
else
    echo
    echo -e "\033[31mPassword doesn't match! Password NOT changed!\e[0m"
    echo
    exit 1
fi
