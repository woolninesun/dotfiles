#!/usr/bin/env bash

if [[ -z "${@}" ]]; then
    # list script name in ~/.local/bin/_workspace-sh
    find ${HOME}/.local/bin/_workspace-sh \
        -maxdepth 1 -type f -not -name '.*' -not -name '*.disable' \
        -printf '%f\n' | sort
else
    # ${1} is workspace script name
    workspace-sh ${1} 2>/dev/null 1>&2 &
fi
