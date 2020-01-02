#!/usr/bin/env bash

# Provide a variable with the location of this script.
scriptPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${scriptPath}/bin/script-utils/test.sh"

#
# bash-completion ##
if path.isExecutable "$(command -v node)"; then
  node --completion-bash > ./bash-completion/node
fi
if path.isExecutable "$(command -v npm)"; then
  npm completion > ./bash-completion/npm
fi

#
# permission ##
chmod -R 644 ./bash-completion/*
chmod -R 755 ./bin/*
