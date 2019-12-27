#!/usr/bin/env bash

# ##################################################
#
# VERSION 1.0.0
#
# HISTORY
#
# * 2019-06-14 - v1.0.0   - First Creation
#
# ##################################################

# Exit on error. Append '||true' when you run the script if you expect an error.
set -o errexit

if [[ -n "${hasTmpDir}" ]] && [[ "${hasTmpDir}" -eq 1 ]]; then
  # trapCleanup Function
  # -----------------------------------
  # Any actions that should be taken if the script is prematurely
  # exited.  Always call this function at the top of your script.
  # -----------------------------------
  function trapCleanup() {
    if [[ -d "${tmpDir}" ]]; then
      echo "Remove ${tmpDir} folder"
      sudo rm -r "${tmpDir}"
    fi
  }

  # Trap bad exits with your cleanup function
  trap trapCleanup EXIT INT TERM

  # Set Temp Directory
  # -----------------------------------
  # Create temp directory. This directory is removed automatically at exit.
  # -----------------------------------
  tmpDir=$(mktemp -d -p "${HOME}/Downloads/")
fi
