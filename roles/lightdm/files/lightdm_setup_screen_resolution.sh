#!/bin/sh
set -x

output="$1"
x="$2"
y="$3"
frequency="$4"

if [ $# -ne 4 ]; then
echo "Usage: $0 output x y frequency"
echo "To find output name: xrandr -q"
exit 0
fi

mode=$( cvt "$x" "$y" "$frequency" | grep -v '^#' | cut -d' ' -f3- )
modename="${x}x${y}"

xrandr --newmode $modename $mode
xrandr --addmode "$output" "$modename"
xrandr --output "$output" --mode "$modename"

# Always return success or lightdm goes into infinite loop
exit 0