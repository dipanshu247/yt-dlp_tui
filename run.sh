#!/bin/bash
clear
cd ~/.aspr
gum style \
	--foreground 120 --border-foreground 50 --border double \
	--align center --width 50 --margin "1 2" --padding "1 4" \
	'Default locations ' '  Videos : Movies ' ' Audio : Music'

gum style \
	--foreground 120 --border-foreground 212 --border double \
	--align center --width 50 --margin "1 2" --padding "1 4" \
	'gum and yt-dlp should be already installed' ' Enter url below : '


url=$(gum input)
gum spin --spinner line --title "Extracting Video data" --  yt-dlp --list-formats $url > file.txt
clear

type=$(echo -e "Video \nAudio\nVideo + Audio" | gum filter)
clear


#code generation
if [ "$type" == "Video + Audio" ] ; then
if [ "Choose myself" == "$(echo -e "Standard 360p premerged audio and video \nChoose myself" | gum filter)" ]; then
    vcode=$(cat file.txt | grep video  | gum filter | awk '{print $1}')
    acode=$(cat file.txt | grep audio  | gum filter | awk '{print $1}')
else
    mcode=$(cat file.txt | grep 44k  | grep 360p | awk '{print $1}')
fi
elif [ "$type" == "Audio" ] ; then
    acode=$(cat file.txt | grep audio  | gum filter | awk '{print $1}')

else
    if [ "Choose myself" == "$(echo -e "Standard 360p premerged audio and video \nChoose myself" | gum filter)" ]; then
        vcode=$(cat file.txt | grep video  | gum filter | awk '{print $1}')
    else
        mcode=$(cat file.txt | grep 44k  | grep 360p | awk '{print $1}')
    fi

fi



# downloading
cd /storage/emulated/0/Movies
if [ -n "$mcode" ]; then
    yt-dlp -f $mcode $url
elif  [ -n "$vcode" ]  &&  [ -n "$acode" ] ; then
    yt-dlp -f "$vcode"+"$acode" $url
elif [ -n "$acode" ] ; then
    cd /storage/emulated/0/Music
    yt-dlp -f $acode $url
else
    yt-dlp -f $vcode $url
fi

rm ~/.aspr/file.txt
