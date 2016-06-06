#!/bin/bash

srcdot='if [ -f ~/.bash_aliases ]; then\n    . ~/.bash_aliases\nfi'

if [ -w ~/.bashrc ]
then
    echo -e $srcdot >> ~/.bashrc
elif [ -w ~/.bash_profile ]
then
    echo -e $srcdot >> ~/.bash_profile
else
    echo "no ~/.bashrc or ~/.bash_profile found"
fi

