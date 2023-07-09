#!/bin/sh
echo -ne '\033c\033]0;Gmtk-2023\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Behold_The_King_Jam.x64.x86_64" "$@"
