#!/usr/bin/env bash
set -euo pipefail

# location variables (i3/i3bg, i3blocks/status, picom, scripts)
path=$(pwd)
i3="/home/$USER/.config/i3"
i3bg="/home/$USER/.config/i3bg"
i3blocks="/home/$USER/.config/i3blocks"
i3status="/home/$USER/.config/i3status"
picom="/home/$USER/.config/picom"
scripts="/home/$USER/.config/scripts"

i3_file="config"
i3bg_file="background"
i3blocks_file="i3blocks.conf"
i3status_file="i3status.conf"
picom_file="picom.conf"

update="arch-update"
disk="disk"
lock="lock"
memory="memory"
volume="volume"

# folders set up
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

# files set up
if [ -f "$i3/$i3_file" ]; then
    # If the file exists, rename it
    mv "$i3/$i3_file" "$i3/${i3_file}.usr.old"
    echo "$i3_file file renamed to ${i3_file}.usr.old"
fi
    # If the file does not exist, create a new file
    cp "$path/i3/config"  "$i3"
    echo "$path/i3/config copied to path: $i3"

if [ -f "$i3bg/$i3bg_file" ]; then
    # If the file exists, rename it
    mv "$i3bg/$i3bg_file" "$i3bg/${i3bg_file}.usr.old"
    echo "$i3bg_file file renamed to ${i3bg_file}.usr.old"
fi
    # If the file does not exist, create a new file
    cp "$path/i3bg/background"  "$i3bg"
    echo "$path/i3bg/background copied to path: $i3bg"

if [ -f "$i3blocks/$i3blocks_file" ]; then
    mv "$i3blocks/$i3blocks_file" "$i3blocks/${i3blocks_file}.usr.old"
    echo "$i3blocks_file file renamed to ${i3blocks_file}.usr.old"
fi
    cp "$path/i3blocks/i3blocks.conf" "$i3blocks"
    echo "$path/i3blocks/i3blocks.conf copied to path: $i3blocks"

if [ -f "$i3status/$i3status_file" ]; then
    mv "$i3status/$i3status_file" "$i3status/${i3status_file}.usr.old"
    echo "$i3status_file file renamed to ${i3status_file}.usr.old"
fi
    cp "$path/i3status/i3status.conf" "$i3status"
    echo "$path/i3status/i3status.conf copied to path: $i3status"

if [ -f "$picom/$picom_file" ]; then
    mv "$picom/$picom_file" "$picom/${picom_file}.usr.old"
    echo "$picom_file file renamed to ${picom_file}.usr.old"
fi
    cp "$path/picom/picom.conf" "$picom/picom.conf"
    echo "$path/picom/picom.conf copied to path: $picom"

if [ -f "$scripts/$update" ]; then
    mv "$scripts/$update" "$scripts/${update}.usr.old"
    echo "$update file renamed to ${update}.usr.old"
fi
    cp "$path/scripts/arch-update" "$scripts"
    echo "$path/scripts/arch-update copied to path: $scripts"

if [ -f "$scripts/$disk" ]; then
    mv "$scripts/$disk" "$scripts/${disk}.usr.old"
    echo "$disk file renamed to ${disk}.usr.old"
fi
    cp "$path/scripts/disk" "$scripts"
    echo "$path/scripts/disk copied to path: $scripts"

if [ -f "$scripts/$lock" ]; then
    mv "$scripts/$lock" "$scripts/${lock}.usr.old"
    echo "$lock file renamed to ${lock}.usr.old"
fi
    cp "$path/scripts/lock" "$scripts"
    echo "$path/scripts/lock copied to path: $scripts"

if [ -f "$scripts/$memory" ]; then
    mv "$scripts/$memory" "$scripts/${memory}.usr.old"
    echo "$memory file renamed to ${memory}.usr.old"
fi
    cp "$path/scripts/memory" "$scripts"
    echo "$path/scripts/memory copied to path: $scripts"

if [ -f "$scripts/$volume" ]; then
    mv "$scripts/$volume" "$scripts/${volume}.usr.old"
    echo "$volume file renamed to ${volume}.usr.old"
fi
    cp "$path/scripts/volume" "$scripts"
    echo "$path/scripts/volume copied to path: $scripts"

#show success message
BLUE='\033[1;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Everything has been successfully set up!${NC}"
echo -e "${BLUE}Reaload your i3 config now. (Alt+Shift+R)${NC}"

#done