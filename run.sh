#!/bin/bash

echo "Enter the song url you want to download : "
read url

spotdl --song $url
