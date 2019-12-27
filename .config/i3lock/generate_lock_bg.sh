#!/usr/bin/env bash

hue=(-level "0%,100%,0.7" -set colorspace Gray -average)
effect=(-filter Gaussian -resize 20% -define "filter:sigma=1.0" -resize 500.5%)
font='Fura-Mono-Regular-Nerd-Font-Complete-Mono'
text="\n\nHsiang-Hsu Chuang\n\nmail:woolninesun@gmail.com"

image="${HOME}/.config/i3lock/bg.png"
maim --bordersize=1.0 ${image}

bw="white"
icon="${HOME}/.config/i3lock/lock.png"

convert "${image}" "${hue[@]}" "${effect[@]}" \
    -font "$font" -pointsize 22 -fill "$bw" -gravity center \
    -annotate +0+160 "$text" "$icon" -gravity center -composite "${image}"
