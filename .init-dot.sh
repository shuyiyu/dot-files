#!/bin/bash

srcdot='if [ -f ~/.bash_aliases ]; then\n    . ~/.bash_aliases\nfi'

if [ -w ~/.bashrc ]
then
    echo -e $srcdot >> ~/.bashrc
    echo "Wrote to ~/.bashrc"
elif [ -w ~/.bash_profile ]
then
    echo -e $srcdot >> ~/.bash_profile
    echo "Wrote to ~/.bash_profile"
else
    echo "No ~/.bashrc or ~/.bash_profile found"
    read -p "Do you want to make one (rc/profile)? " answer
    case ${answer} in
        rc|r|R )
            echo -e $srcdot >> ~/.bashrc
            echo "Created ~/.bashrc"
        ;;
        profile|p|P )
            echo -e $srcdot >> ~/.bash_profile
            echo "Created ~/.bash_profile"
        ;;
        * )
            echo "Nothing created."
        ;;
    esac
fi
