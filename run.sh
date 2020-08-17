#!/bin/bash

#Check if spotdl module is installed or not
if ! command -v spotdl &> /dev/null
then
    echo "spotdl is not installed. "
    
    # Prompt to install spotdl
    echo "Do you want to install spotdl? "
    read ans
    if [[ "$ans" == "yes" ]];then
        pip3 install spotdl
        echo "spotdl sucessfully installed!"
    else
        exit 127
    fi
fi

#Need the condition of checking if ffmpeg is isntalled or not

#Implement a condition to choose between songs/playlist/album
echo "Specify your choice :
    Press 1 for downloading a song
    Press 2 for downloading a playlist
    Press 3 for downloading an album"
read arg

if [[ "$arg" == "1" ]];then
    echo "You have selected to download song"
    arg="song"

    echo "Enter the $arg url you want to download : "
    read url
    spotdl --$arg $url

elif [[ "$arg" == "2" ]];then
    echo "You have selected to download playlist"
    arg="playlist"

    echo "Enter the $arg url you want to download : "
    read url
    spotdl --$arg $url --write-to temp.txt
    spotdl --list=temp.txt

elif [[ "$arg" == "3" ]];then
    echo "You have selected to download album"
    arg="album"
    
    echo "Enter the $arg url you want to download : "
    read url
    spotdl --$arg $url --write-to temp.txt
    spotdl --list=temp.txt
else
    echo "Invalid Selection"
    exit 127
fi