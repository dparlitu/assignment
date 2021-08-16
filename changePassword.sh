#!/bin/bash

# this script will change existing password

# This function will check the password complexity
checkPassword()
{
len="${#REPLY}"
    if test $len -ge 8 ; then
        echo "$REPLY" | grep -q [0-9]
            if test $? -eq 0 ; then
                echo "$REPLY" | grep -q [A-Z]
                    if test $? -eq 0 ; then
                        echo "$REPLY" | grep -q [a-z]
                            if test $? -eq 0 ; then
                                echo "$REPLY" | grep -q [!,$,@,'#',%,*,+,-]
                                    if test $? -eq 0 ; then
                                        echo "Strong password"
                                    else
                                        echo "Weak password include special characters"
                                        return 1
                                    fi
                            else
                                echo "Weak password include Lower case character"
                                return 1
                            fi
                    else
                        echo "Weak password include Capital character"
                        return 1
                    fi
            else
                echo "Please include at least a number in your password"
                return 1
            fi
    else
        echo "Password length should be greater than or equal 8 hence weak password"
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
        echo -e "\033[31mPassword NOT changed!\e[0m"
        echo
        exit 1
    fi

else

    echo
    echo -e "\033[31mPassword doesn't match! Password NOT changed!\e[0m"
    echo
red
    exit 1

fi
