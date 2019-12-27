#!/usr/bin/env bash

# screenlock need system wide target, so it must use system wide service.

SERVICEFILE="${HOME}/.config/systemd/user/screenlock@.service"
ln -sf ${SERVICEFILE}  /usr/lib/systemd/system/screenlock@.service

LOCKERSCRIPT="${HOME}/.local/bin/locker"
ln -sf ${LOCKERSCRIPT} /usr/bin/locker

systemctl enable "screenlock@${USER}"
systemctl start  "screenlock@${USER}"
