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

echo "Enter the song url you want to download : "
read url

spotdl --song $url