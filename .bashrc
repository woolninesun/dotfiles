#!/usr/bin/env bash

#    ██████   █████  ███████ ██   ██
#    ██   ██ ██   ██ ██      ██   ██
#    ██████  ███████ ███████ ███████
#    ██   ██ ██   ██      ██ ██   ██
#    ██████  ██   ██ ███████ ██   ██

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
	    color_prompt=
    fi
fi

clr_00="\[\033[01;00m\]" # white
clr_31="\[\033[01;31m\]" # red
clr_32="\[\033[01;32m\]" # green
clr_33="\[\033[01;33m\]" # yellow
clr_34="\[\033[01;34m\]" # blue

new="\012"
sym1=$'\u250C';sym2=$'\u2514' # ┌ & └
if [ "$color_prompt" = yes ]; then
    uah="${clr_00}${sym1} ${clr_32}\u@\h ${clr_33}\t: ${clr_00}[\$?]${new}"
    inw="${clr_00}${sym2} ${clr_31}in ${clr_34}\w${clr_31}${new}"
    cmd="${clr_00}\$ "
else
    uah="${sym1} \u@\h \t: [\$?]${new}"
    inw="${sym2} in \w${new}"
    cmd="\$ "
fi
export PS1="${new}${debian_chroot:+($debian_chroot)}${uah}${inw}${cmd}"
export PS2="${cmd}"
export PS3="${cmd}"
export PS4="${cmd}"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

export PATH="/home/${USER}/.local/bin:${PATH}"
export MANPATH="/home/${USER}/.local/man:${MANPATH}"
export LESSHISTFILE="-"
export EDITOR=/usr/bin/vim

[ -s ~/".bash_aliases"     ]  && \. ~/".bash_aliases"
[ -s ~/.bash_host/"${HOSTNAME}" ]  && \. ~/.bash_host/"${HOSTNAME}"
