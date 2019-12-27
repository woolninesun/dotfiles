#!/usr/bin/env bash

# sudo 
alias sudo='sudo '

# Listing Aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -CF --color=auto'
    alias ll='ls -lh --color=auto'
    alias la='ls -lAh --color=auto'
    alias grep='grep --color=auto'
else
    alias ls='ls -CF'
    alias ll='ls -lh'
    alias la='ls -lAh'
fi

# System Aliases
alias df="df -h"
alias du="du -h"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
