#!/bin/bash
mkdir ~/.aspr
curl -L -o run.sh https://github.com/dipanshu247/my-linux-themes/releases/download/first-testing/run.sh
echo "alias ytd="~/.aspr/run.sh"" >> ~/.bashrc
