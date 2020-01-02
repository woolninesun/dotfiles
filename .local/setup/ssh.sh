#!/usr/bin/env bash

#
# permission ##
chmod -R 700 ${HOME}/.ssh
chmod 644 ${HOME}/.ssh/authorized_keys
chmod 644 ${HOME}/.ssh/known_hosts
chmod 644 ${HOME}/.ssh/config
chmod 644 ${HOME}/.ssh/config.d/*
chmod 600 ${HOME}/.ssh/id_rsa.*
chmod 644 ${HOME}/.ssh/id_rsa.*.pub
