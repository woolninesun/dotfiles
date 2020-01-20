#!/usr/bin/env bash

# Provide a variable with the location of this script.
scriptPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${scriptPath}/../script-utils/test.sh"

#######################################################################

function screen.check() {
  screen="${1}"; mode="${2}";

  hasScreen=$(                          \
    xrandr                              \
    | awk '/ connected/ {print $1}'     \
    | grep ^${screen}$         \
  )
  if str.isEmpty "${hasScreen}"; then
    return 1
  fi

  hasMode=$(                                                \
    xrandr                                                  \
    | sed -e "1,/^${AboveScreen} / d" -e "/connected/,$ d"  \
    | awk '{print $1}'                                      \
    | grep ^${mode}$                                        \
  )
  if str.isEmpty "${hasMode}"; then
    return 1
  fi

  return 0
}
