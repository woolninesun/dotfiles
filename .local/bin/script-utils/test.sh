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

# http://linux.vbird.org/linux_basic/0340bashshell-scripts.php#dis

# Path file or directory Checks
# ------------------------------------------------------
# A series of functions which make checks against the filesystem. For
# use in if/then statements.
#
# Usage:
#    if path.isExists "file"; then
#       ...
#    fi
# ------------------------------------------------------

function path.isExists() {
  if [[ -e "$1" ]]; then
    return 0
  fi
  return 1
}

function path.isNotExists() {
  if [[ ! -e "$1" ]]; then
    return 0
  fi
  return 1
}

function path.isFile() {
  if [[ -f "$1" ]]; then
    return 0
  fi
  return 1
}

function path.isNotFile() {
  if [[ ! -f "$1" ]]; then
    return 0
  fi
  return 1
}

function path.isDir() {
  if [[ -d "$1" ]]; then
    return 0
  fi
  return 1
}

function path.isNotDir() {
  if [[ ! -d "$1" ]]; then
    return 0
  fi
  return 1
}

function path.isReadable() {
  if [[ -r "$1" ]]; then
    return 0
  fi
  return 1
}

function path.isNotReadable() {
  if [[ ! -r "$1" ]]; then
    return 0
  fi
  return 1
}

function path.isWritable() {
  if [[ -w "$1" ]]; then
    return 0
  fi
  return 1
}

function path.isNotWritable() {
  if [[ ! -w "$1" ]]; then
    return 0
  fi
  return 1
}

function path.isExecutable() {
  if [[ -x "$1" ]]; then
    return 0
  fi
  return 1
}

function path.isNotExecutable() {
  if [[ ! -x "$1" ]]; then
    return 0
  fi
  return 1
}

# String Checks
# ------------------------------------------------------
# A series of functions which make checks against the String. For
# use in if/then statements.
#
# Usage:
#    if str.isEmpty "string"; then
#       ...
#    fi
# ------------------------------------------------------

function str.isEmpty() {
  if [[ -z "$1" ]]; then
    return 0
  fi
  return 1
}

function str.isNotEmpty() {
  if [[ -n "$1" ]]; then
    return 0
  fi
  return 1
}

# Test whether a commcnd exists
# ------------------------------------------------------
# Usage:
#    if cmd.isExists 'git'; then
#      some action
#    else
#      some other action
#    fi
# ------------------------------------------------------

function cmd.isExists() {
  if [ "$(type -P "$1")" ]; then
    return 0
  fi
  return 1
}

function cmd.isNotExists() {
  if [ ! "$(type -P "$1")" ]; then
    return 0
  fi
  return 1
}
