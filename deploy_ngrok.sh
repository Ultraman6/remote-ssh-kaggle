#!/bin/bash#

# Download ngrok
FILE=/kaggle/nbdev/SSH/ngrok
if ! test -f "$FILE";
then
    wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
    sudo tar xvzf ngrok-v3-stable-linux-amd64.tgz -C /usr/local/bin
    rm ngrok-v3-stable-linux-amd64.tgz
fi

ngrok config add-authtoken $1

ngrok tcp 22 --region ap --log=stdout