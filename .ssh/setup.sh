#!/usr/bin/env bash

#
# permission ##
chmod -R 700 ~/.ssh
chmod 644 ~/.ssh/authorized_keys
chmod 644 ~/.ssh/known_hosts
chmod 644 ~/.ssh/config
chmod 644 ~/.ssh/config.d/*
chmod 600 ~/.ssh/id_rsa.*
chmod 644 ~/.ssh/id_rsa.*.pub
