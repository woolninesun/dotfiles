#!/usr/bin/env bash

# Provide a variable with the location of this script.
scriptPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${scriptPath}/../bin/script-utils/test.sh"


LOCAL_PATH="${HOME}/.local"
CONFIG_PATH="${HOME}/.config"

#
# git source ##
DOTFILES_GIT="https://github.com/WooLNinesun/dotfiles.git"
AWESOME_LAIN_GIT="https://github.com/lcpz/lain.git"
AWESOME_CALENDAR_GIT="https://github.com/deficient/calendar.git"
PYENV_GIT="https://github.com/pyenv/pyenv.git"
PYENV_VIRTUALENV_GIT="https://github.com/pyenv/pyenv-virtualenv.git"
NVM_GIT="https://github.com/nvm-sh/nvm.git"

#
# install base package
# su - root # add ${USER} to sudoers
sudo apt install git vim
sudo apt install software-properties-common ca-certificates curl

sudo usermod -g ${USER} ${USER}
sudo usermod -G '' ${USER}
sudo usermod -aG sudo ${USER}

cd ${HOME}
git init
git remote add origin ${DOTFILES_GIT}
git pull origin master

sudo apt install xserver xserver-xorg xorg
sudo cp ~/.xorg.conf.new /etc/X11/xorg.conf
ln -s .xinitrc .xsession

sudo apt install awesome compton
git clone ${AWESOME_LAIN_GIT} ${CONFIG_PATH}/awesome/lain
git clone ${AWESOME_CALENDAR_GIT} ${CONFIG_PATH}/awesome/calendar

#
# pyenv && nvm ##
git clone ${PYENV_GIT} ${LOCAL_PATH}/pyenv
git clone ${PYENV_VIRTUALENV_GIT} ${LOCAL_PATH}/pyenv/plugins/pyenv-virtualenv
git clone ${NVM_GIT} ${LOCAL_PATH}/node/nvm

#
# docker ce ##
sudo apt install apt-transport-https gnupg2
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt install docker-ce
sudo apt install docker-compose
sudo usermod -aG docker ${USER}

#
# qemu kvm ##
sudo apt install qemu-kvm libvirt-clients libvirt-daemon-system
sudo usermod -aG libvirt ${USER}

sudo apt install pavucontrol
sudo apt install fcitx fcitx-rime
sudo apt install rofi
sudo apt install i3lock
sudo apt install terminator
sudo apt install unzip
sudo apt install maim xclip xdotool
sudo apt install chromium
sudo apt install telegram-desktop
sudo apt install tree
sudo apt install tmux
sudo apt install htop

#
# install network manager ##
sudo apt install network-manager
# sudo vim /etc/apt/sources.list add "contrib non-free"
sudo apt install firmware-atheros

# 
# install lsd ##
# source https://github.com/Peltoche/lsd
# sudo apt install ${HOME}/Downloads/lsd_xxxx_amd64.deb

#
# install NotoFonts and nerd-fonts ##
# source https://www.google.com/get/noto/
# source https://github.com/ryanoasis/nerd-fonts
# copy ttf files to  to ~/.local/share/fonts/
# fc-cache -fv

#
# install vscode ##
# source https://code.visualstudio.com/
# sudo apt install ${HOME}/Downloads/code-insiders_xxxxx_amd64.deb
# ln -s .vscode .vscode-insiders
# ln -s ${CONFIG_PATH}/Code ${CONFIG_PATH}/Code\ -\ Insiders
# cat ${HOME}/.vscode/vscode_extension.txt | xargs -n 1 code-insiders --install-extension
# code --list-extensions > ${HOME}/.vscode/vscode_extension.txt

#
# config touchpad
# libinput_conf="/etc/X11/xorg.conf.d/40-libinput.conf"
# sudo cp /usr/share/X11/xorg.conf.d/40-libinput.conf ${libinput_conf}
# sudo vim ${libinput_conf} with following content
# Section "InputClass"
#         Identifier "libinput touchpad catchall"
#         MatchIsTouchpad "on"
#         MatchDevicePath "/dev/input/event*"
#         Driver "libinput"
#         Option "Tapping" "on"
# EndSection
