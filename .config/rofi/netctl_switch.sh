#!/usr/bin/env bash

if [[ -z "${@}" ]]; then
    # list profile name in /etc/netctl
    find /etc/netctl \
        -maxdepth 1 -type f -not -name '.*' -not -name 'travel.*' \
        -printf '%f\n' | sort
else
    # ${1} is netctl profile name
    sudo netctl switch-to "${1}" 2>/dev/null 1>&2 &
fi
