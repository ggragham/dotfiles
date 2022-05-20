#!/usr/bin/env bash
cd "$(dirname "$0")" || exit

USERNAME=""
SCRIPT_PATH="./scripts"

isSudo() {
    if [ "$(id -u)" -eq 0 ]; then
        USERNAME="$SUDO_USER"
    else
        USERNAME="$USER"
    fi
}

isSudo
select="*"
while :; do
    clear
    echo "Linux Configurator"
    echo
    echo "1. Base system configuration"
    echo "2. More configs"
    echo "3. Install additional packages"
    echo "4. Install flatpak apps"
    echo "5. Load dotfiles"
    echo "6. Load dconf"
    echo "7. Fix gnome extensions compability"
    echo
    echo "0. Exit"
    echo
    case $select in
    1)
        bash "$SCRIPT_PATH/fedora_init.sh"
        select="*"
        ;;
    2)
        bash "$SCRIPT_PATH/more_configuration.sh"
        select="*"
        ;;
    3)
        bash "$SCRIPT_PATH/more_additional_pkgs.sh"
        select="*"
        ;;
    4)
        bash "$SCRIPT_PATH/flatpak.sh"
        select="*"
        ;;
    5)
        sudo -u "$USERNAME" bash "$SCRIPT_PATH/dotfiles.sh"
        select="*"
        ;;
    6)
        sudo -u "$USERNAME" bash "$SCRIPT_PATH/dconf.sh"
        select="*"
        ;;
    7)
        sudo -u "$USERNAME" bash "$SCRIPT_PATH/fix_gnome_extensions.sh"
        select="*"
        ;;
    0)
        exit
        ;;
    *)
        read -rp "Select: " select
        continue
        ;;
    esac
done
