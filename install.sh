#!/usr/bin/env bash
set -euo pipefail

#0. set location variables (i3, i3blocks/status, picom, scripts)
path=$(pwd)
i3="/home/$USER/.config/i3"
i3bg="/home/$USER/.config/i3bg"
i3blocks="/home/$USER/.config/i3blocks"
i3status="/home/$USER/.config/i3status"
picom="/home/$USER/.config/picom"
scripts="/home/$USER/.config/scripts"

i3_file="config"
i3bg_file="background"
#i3blocks_file=
#i3status_file=
#picom_file=

#update=
#disk=
#lock=
#memory=
#volume=


#1. check if folders exists and make if they dont
if [ ! -d "$i3" ]; then
    mkdir -p "$i3"
    echo "folder '$i3' created!"
else
    echo "folder '$i3' already exists. skipping..."
fi
sleep 0.5

if [ ! -d "$i3bg" ]; then
    mkdir -p "$i3bg"
    echo "folder '$i3bg' created!"
else
    echo "folder '$i3bg' already exists. skipping..."
fi
sleep 0.5

if [ ! -d "$i3blocks" ]; then
    mkdir -p "$i3blocks"
    echo "folder '$i3blocks' created!"
else
    echo "folder '$i3blocks' already exists. skipping..."
fi
sleep 0.5

if [ ! -d "$i3status" ]; then
    mkdir -p "$i3status"
    echo "folder '$i3status' created!"
else
    echo "folder '$i3status' already exists. skipping..."
fi
sleep 0.5
echo "i3 folders are set up! moving to the next step..."
sleep 1

if [ ! -d "$picom" ]; then
    mkdir -p "$picom"
    echo "folder '$picom' created!"
else
    echo "folder '$picom' already exists. skipping..."
fi
sleep 0.5
echo "picom folder is set up! moving to the next step..."
sleep 1

if [ ! -d "$scripts" ]; then
    mkdir -p "$scripts"
    echo "folder '$scripts' created!"
else
    echo "folder '$scripts' already exists. skipping..."
fi
sleep 0.5
echo "all folders are set up! moving to the next step..."
sleep 3

#check if files exists

if [ -f "$i3/$i3_file" ]; then
    # If the file exists, rename it
    mv "$i3/$i3_file" "$i3/${i3_file}.old"
    echo "$i3_file file renamed to ${i3_file}.old"
fi
    # If the file does not exist, create a new file
    cp "$path/i3/config"  "$i3"
    echo "$path/i3/config copied to path: $i3"

if [ -f "$i3bg/$i3bg_file" ]; then
    # If the file exists, rename it
    mv "$i3bg/$i3bg_file" "$i3bg/${i3bg_file}.old"
    echo "$i3bg_file file renamed to ${i3bg_file}.old"
fi
    # If the file does not exist, create a new file
    cp "$path/i3bg/background"  "$i3bg"
    echo "$path/i3bg/background copied to path: $i3bg"


#show success message if done

#3. ask for reloading environment

#done
