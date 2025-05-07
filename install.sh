#!/bin/bash
mkdir ~/.aspr
cd ~/.aspr
curl -L -o run.sh https://github.com/dipanshu247/my-linux-themes/releases/download/first-testing/run.sh
chmod +x ~/.aspr/run.sh
echo "alias ytd="~/.aspr/run.sh"" >> ~/.bashrc
source ~/.bashrc
clear
echo "Installation finished Successfully"
