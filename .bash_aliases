export EDITOR=vim

[ -z "$PS1" ] && return

# don't put duplicate lines in the history
# and don't put lines starting with space.
HISTCONTROL=ignoredups:ignorespace

# color prompt
GREEN="\[\033[40;0;32m\]"
RED="\[\033[40;0;31m\]"
YELLOW="\[\033[40;0;33m\]"
CYAN="\[\033[40;1;36m\]"
BLUE="\[\033[40;0;34m\]"
GRAY="\[\033[40;0;37m\]"
CLEAR="\[\033[0m\]"
BASE="$GRAY[$RED\u$YELLOW@$BLUE\h:$YELLOW\W$GRAY]"
NERR="\[\033[40;0;33m\]8==D\[\033[40;1;36m\]~"
ERR="\[\033[40;0;31m\]D==\[\033[40;1;36m\]8\[\033[40;0;31m\]<"

export PS1="$BASE \$(if [[ \$? != 0 ]]; then echo '$ERR'; else echo '$NERR'; fi) $CLEAR"
export PS2="\[\033[40;0;34m\]8==D \[\033[0m\]"

sfw() {
	PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
	PS2='> '
}

nsfw() {
    PS1="$BASE \$(if [[ \$? != 0 ]]; then echo '$ERR'; else echo '$NERR'; fi) $CLEAR"
    PS2="\[\033[40;0;34m\]8==D \[\033[0m\]"
}

# show "[hh:mm] user@host:pwd" in xterm title bar
if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
	# for Mac Terminal, omit "User@Users-MacBook-Air"
	# and preserve PROMPT_COMMAND set by /etc/bashrc.
	show_what_in_title_bar='"[$(date +%H:%M)] ${PWD/#$HOME/~}"'
	PROMPT_COMMAND='printf "\033]0;%s\007" '"$show_what_in_title_bar; $PROMPT_COMMAND"
else
	show_what_in_title_bar='"[$(date +%H:%M)] ${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}"'
	case ${TERM} in
		xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
			PROMPT_COMMAND='printf "\033]0;%s\007" '$show_what_in_title_bar
			;;
		screen)
			PROMPT_COMMAND='printf "\033_%s\033\\" '$show_what_in_title_bar
			;;
	esac
fi
unset show_what_in_title_bar

modbash() {
	if [ $# -gt 0 ]
	then
		vim ~/.bash_$1
	elif [ -w ~/.bash_local ]
	then
		vim ~/.bash_local
	elif [ -w ~/.bash_aliases ]
	then 
		vim ~/.bash_aliases
	elif [ -w ~/.bashrc ]
	then
		vim ~/.bashrc
	elif [ -w ~/.bash_profile ]
	then
		vim ~/.bash_profile
	else
		echo 'No ~/.bashrc_aliases ~/.bashrc, or ~/.bash_profile found.'
	fi	
}

srcbash() {
	if [ -e ~/.bashrc ]
	then
		source ~/.bashrc
	elif [ -e ~/.bash_profile ]
	then
		source ~/.bash_profile
	else
		echo 'No ~/.bashrc or ~/.bash_profile found.'
	fi
}

# force mv, rm and cp to ask user before clobbering file
alias mv='mv -iv $*'
alias rm='rm -vr $*'
alias cp='cp -ivr $*'
alias mkdir='mkdir -pv'
alias remove='sudo rm -fvr $*'

# some more ls aliases
case "$OSTYPE" in
*linux*)
	alias dmesg='dmesg --color'
	alias pacman='pacman --color=auto'
	alias ls='ls --color=auto'
	;;
*darwin*)
	alias ls='ls -G'
	;;
esac

alias ll='ls -lagF'
alias la='ls -A'
alias l='ls -CF'

alias cd..='cd ..'
alias ..='cd ..'

# git
alias gitdif='git diff --color'
alias gitmod='git add -u'

# valgrind
alias grindr='valgrind --leak-check=full --track-origins=yes'
alias grind='valgrind --leak-check=yes'

# grep
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# gcc
alias gccg='gcc -g -Wall'
alias g++g='g++ -g -Wall'
alias clangg='clang -g -Wall'
alias clang++g='clang++ -g -Wall'

if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi

export GOPATH=$HOME/gopath
export PATH=$GOPATH:$GOPATH/bin:$PATH
