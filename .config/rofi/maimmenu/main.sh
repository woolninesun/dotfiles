#!/usr/bin/env bash

# Provide a variable with the location of this script.
scriptPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# maim options
maim_command="maim --bordersize=1.0"
screenshot_path="${HOME}/Downloads/screenshot_$(date +%Y-%m-%d_%H%M%S).png"

### Options ###
screen=""
area=""
window=""
delay10=""

# rofi options
rofi_command="rofi -config ${scriptPath}/config.rasi -theme ${scriptPath}/theme.rasi"
options=(           \
    "${area}\n"     \
    "${screen}\n"   \
    "${window}\n"   \
    "${delay10}"    \
)

chosen="$( (IFS=; echo -e ${options[*]}) | ${rofi_command} -dmenu -selected-row 0)"
case ${chosen} in
    ${area})
        sleep 1; ${maim_command} --select ${screenshot_path}
        ;;
    ${screen})
        sleep 1; ${maim_command} ${screenshot_path}
        ;;
    ${window})
        sleep 1; ${maim_command} --window=$(xdotool getactivewindow) ${screenshot_path}
        ;;
    ${delay10})
        sleep 1; ${maim_command} --delay=10 ${screenshot_path}
        ;;
esac

xclip -selection clipboard -t image/png -i "${screenshot_path}"
