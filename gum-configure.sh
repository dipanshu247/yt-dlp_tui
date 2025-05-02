#!/bin/bash

arch-linux(){

string=$(gum --version     )
echo $string
first_word=$(cut -d' ' -f1 <<< "$string")

if  gum --version   | grep -q "not" ; then
    echo "Basass"
fi

if  [ "$first_word" != "gum" ] ; then
    echo "gum is not installed"
    echo -e "Installing gum using pacman \nsudo pacman -Sy gum --noconfirm"
    sudo pacman -Sy gum --noconfirm
fi
}

if [ -f /etc/arch-release ] || grep -q 'NAME="Arch Linux"' <(head -n 1 /etc/os-release) ; then
    arch-linux
else
    echo "Unable to decide which distro you are using right now"
fi
