#!/bin/bash

(
srcdot='
if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
fi
'

function fresh()
{
        [ -w ~/$1 ] || return 0
        if grep -q '~/.bash_aliases' < ~/.bashrc; then
                echo "~/.bash_aliases already sourced in $1"
                exit
        fi
        return 1
}

if fresh .bashrc; then
        echo -e "${srcdot}" >> ~/.bashrc
        echo "Wrote to ~/.bashrc"
elif fresh .bash_profile
then
        echo -e "${srcdot}" >> ~/.bash_profile
        echo "Wrote to ~/.bash_profile"
else
    echo "No ~/.bashrc or ~/.bash_profile found"
    read -p "Do you want to make one (rc/profile)? " answer
    case ${answer} in
        rc|r|R )
            echo -e ${srcdot} >> ~/.bashrc
            echo "Created ~/.bashrc"
        ;;
        profile|p|P )
            echo -e ${srcdot} >> ~/.bash_profile
            echo "Created ~/.bash_profile"
        ;;
        * )
            echo "Nothing created."
        ;;
    esac
fi
)

if [ ! -d ~/.tmux/plugins/tpm ]
then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [ ! -d ~/.vim/bundle/nerdcommenter ]
then
        git clone https://github.com/scrooloose/nerdcommenter ~/.vim/bundle/nerdcommenter
fi
