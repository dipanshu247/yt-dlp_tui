#!/bin/bash
mkdir ~/.aspr
cd ~/.aspr
curl -L -o run.sh https://github.com/dipanshu247/yt-dlp_tui/releases/download/testing1/run.sh
chmod +x ~/.aspr/run.sh
echo "alias ytd="~/.aspr/run.sh"" >> ~/.bashrc
source ~/.bashrc
clear
echo "Installation finished Successfully"
