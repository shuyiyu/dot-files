#!/bin/bash

srcdot='if [ -f ~/.bash_local ]; then\n    . ~/.bash_local\nfi'

if [ -w ~/.bashrc ]
then
    echo -e $srcdot >> ~/.bashrc
elif [ -w ~/.bash_profile ]
then
    echo -e $srcdot >> ~/.bash_profile
else
    echo "no ~/.bashrc or ~/.bash_profile found"
fi

