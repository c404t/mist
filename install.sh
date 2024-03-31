#!/usr/bin/env bash
set -euo pipefail

# location variables
path=$(pwd)

i3_user_folder="/home/$USER/.config/i3"
i3bg_user_folder="/home/$USER/.config/i3bg"
i3blocks_user_folder="/home/$USER/.config/i3blocks"
i3status_user_folder="/home/$USER/.config/i3status"
picom_user_folder="/home/$USER/.config/picom"
scripts_user_folder="/home/$USER/.config/scripts"

i3_mist_file="i3/config"
i3bg_mist_file="i3bg/background"
i3blocks_mist_file="i3blocks/i3blocks.conf"
i3status_mist_file="i3status/i3status.conf"
picom_mist_file="picom/picom.conf"

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

GREEN='\033[1;32m'
NC='\033[0m' # No Color

check_folder () {
    if [ ! -d $1 ]; then
    mkdir -p "$1"
    echo -e "${GREEN}[success]${NC} folder '$1' created!"
    else
    echo -e "${GREEN}[       ]${NC} '$1' already exists. skipping..."
    fi
    return 0
}

check_file() {
    local file_path="$1/$2"
    if [ -f "$file_path" ]; then
    # If the file exists, rename it
    mv "$file_path" "$file_path.usr.old"
    echo -e "${GREEN}[       ]${NC} $file_path file renamed to $2.usr.old"
    fi
    # If the file does not exist or is renamed, move the file
    cp "$path/$3"  "$file_path"
    echo -e "${GREEN}[success]${NC} $path/$3 copied to path: $1"
}

setup_scripts() {
    local script_path="$scripts_user_folder/$1"
    local new_name="$1.usr.old"
    if [ -f "$script_path" ]; then
    mv "$script_path" "$scripts_user_folder/$new_name"
    echo -e "${GREEN}[       ]${NC} $script_path file renamed to $new_name"
    fi
    cp "$path/scripts/$1" "$scripts_user_folder"
    echo -e "${GREEN}[success]${NC} $path/scripts/$1 copied to path: $scripts_user_folder"
}

check_folder "$i3_user_folder"
check_folder "$i3bg_user_folder"
check_folder "$i3blocks_user_folder"
check_folder "$i3status_user_folder"
check_folder "$picom_user_folder"
check_folder "$scripts_user_folder"

check_file "$i3_user_folder" "$i3_file" "$i3_mist_file"
check_file "$i3bg_user_folder" "$i3bg_file" "$i3bg_mist_file"
check_file "$i3blocks_user_folder" "$i3blocks_file" "$i3blocks_mist_file"
check_file "$i3status_user_folder" "$i3status_file" "$i3status_mist_file"
check_file "$picom_user_folder" "$picom_file" "$picom_mist_file"

setup_scripts "$disk"
setup_scripts "$lock"
setup_scripts "$memory"
setup_scripts "$update"
setup_scripts "$volume"

#show success message
BLUE='\033[1;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Everything has been successfully set up!${NC}"
echo -e "${BLUE}Reaload your i3 config now. (Alt+Shift+R)${NC}"

#done